# import xml.etree.ElementTree as ET
# ET.register_namespace('',"urn:oasis:names:tc:xliff:document:1.2") #some name
# ns = {"n": "urn:oasis:names:tc:xliff:document:1.2"}

# with open('en.xliff', 'r') as xml_file:
#     tree = ET.parse(xml_file)
# root = tree.getroot()

# for file_body in root.findall("./*/n:body", ns):
# 	for trans_unit in file_body.findall("n:trans-unit", ns):
# 		banned_words = ["address", "lorem ipsum"]
# 		print trans_unit.find("n:source", ns).text.encode("utf-8")

# tree.write("output.xml", "utf-8", True)


# -*- coding: utf-8 -*-
import xml.etree.ElementTree as ET

ET.register_namespace('',"urn:oasis:names:tc:xliff:document:1.2") #some name

# tree = ET.parse('sample.xml')
# tree = ET.parse('en.xliff')
#file_contents = codecs.open("en.xliff", mode='r', encoding='utf8')
#tree = ET.parse(file_contents)

with open('en.xliff', 'r') as xml_file:
    tree = ET.parse(xml_file)

root = tree.getroot()

ns = {"n": "urn:oasis:names:tc:xliff:document:1.2"}

#ET.dump(root)

for file_body in root.findall("./*/n:body", ns):
	#print fileBody.tag
	for trans_unit in file_body.findall("n:trans-unit", ns):
		#print trans_unit.tag, trans_unit.attrib

		# list = ["ZQ3-2i-tkQ.text", "uOy-Gi-GPr.text"]
		# if list.count(trans_unit.attrib['id']) > 0:
		# 	print "removing element with attr id =", trans_unit.attrib['id']
		# 	file_body.remove(trans_unit)
		# if str(trans_unit.find("n:source", ns).text).find("Lorem") != -1:
		# 	file_body.remove(trans_unit)
		# 	print "removing ", trans_unit.attrib['id']

		banned_words = ["address", "lorem ipsum"]

		print trans_unit.find("n:source", ns).text.encode("utf-8")
		# source = trans_unit.find("n:source", ns).text.decode("utf-8", "ignore")

		# for banned_word in banned_words:
		# 	if source.find(banned_word) != -1:
		# 		print "removing ", trans_unit.attrib['id'], "because contains", banned_word
		# 		file_body.remove(trans_unit)

#ET.dump(root)
tree.write("output.xml", "utf-8", True)


#import Tkinter
#top = Tkinter.Tk()
# Code to add widgets will go here...
#top.mainloop()

#for child in root.findall("./**/n:trans-unit", ns):
	#source = str(child.find("n:source", ns).text)
	#print source.find("Property")
	#if source.find("ipsum") != -1:
		#print child.attrib
		#ET.dump(root)

	#print child.tag, child.attrib

# print root.iter("trans-unit")

# for child in root:
# print child.tag, child.attrib

# for child in root.iter("neighbor"):
# print child.tag, child.attrib

# for country in root.findall('country'):
# rank = int(country.find('rank').text)
# if rank > 50:
# root.remove(country)

# tree.write('output.xml')


# f = open('fr.xliff')
# print f.readline()
# print f.readline()
# print f.readline()
# print f.readline()
# print f.readline()
