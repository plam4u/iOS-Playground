def log(string_to_log):
	if args.verbose:
		print string_to_log

import argparse
parser = argparse.ArgumentParser(description="Process xliff file against banned words and output new xliff with stripped translation.", epilog="Example usage: strip_loc.py en.xliff en-stripped.xliff exclude_words.txt -v")
parser.add_argument('source', help="Input .xliff file containing all the strings")
parser.add_argument('output', help="Output .xliff file which will containt the stripped strings according to the exclude_list")
parser.add_argument('exclude_list', help="Multi-line text file where every line is a banned string")
parser.add_argument('-v', '--verbose', action="store_true", help="print script steps while working")
args = parser.parse_args()

banned_words = [line.strip().lower() for line in open(args.exclude_list, 'r')]

log("original file: " + args.source)
log("output file: " + args.output)
log("banned words: " + ", ".join(banned_words))
log("")

import xml.etree.ElementTree as ET
ET.register_namespace('',"urn:oasis:names:tc:xliff:document:1.2")
ns = {"n": "urn:oasis:names:tc:xliff:document:1.2"}

with open(args.source, 'r') as xml_file:
    tree = ET.parse(xml_file)
root = tree.getroot()

counter = 1
for file_body in root.findall("./*/n:body", ns):
	for trans_unit in file_body.findall("n:trans-unit", ns):
		source = trans_unit.find("n:source", ns).text.encode("utf-8").lower()
		for banned_word in banned_words:
			if source.find(banned_word) != -1:
				log(str(counter) + ": removing <trans-unit id=\"" + trans_unit.attrib['id'] + "\">, banned: \"" + banned_word + "\"")
				file_body.remove(trans_unit)
				counter += 1

tree.write(args.output, "utf-8", True)

log("")
print "DONE"