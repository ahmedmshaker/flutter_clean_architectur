#!/usr/bin/env python3
import os
import io
import zipfile
import shutil
import click

def renameFiles(directory,featureName):
    print("start renaming files")
    for count, filename in enumerate(os.listdir(directory)): 
        if filename != ".DS_Store":
            if os.path.isdir(directory+"/"+str(filename)):
                renameFiles(directory+"/"+str(filename), featureName)
            else:
                modifyFileContent(directory+"/"+str(filename), str(featureName))
                if "[feature_name]" in filename:
                    newFileName = filename.replace("[feature_name]",str(featureName))
                    dst = directory +"/"+str(newFileName)
                    src = directory+"/"+str(filename )
                    print("source: "+str(src))
                    print("destenation: "+str(dst))
                    os.rename(src, dst)


def unzipFile(featureName):
    with zipfile.ZipFile("assets/[feature_name].zip", 'r') as zip_ref:
        zip_ref.extractall("lib/features/"+str(featureName))
    #removing added folder __MACOSX by macOS after unzip
    if os.path.exists("lib/features/"+str(featureName)+"/"+"__MACOSX/"):
        shutil.rmtree("lib/features/"+str(featureName)+"/"+"__MACOSX/")

def modifyFileContent(filePath,featureName):
    with open(filePath) as f:
        newText=f.read().replace('[feature_name]', str(featureName))

    with open(str(filePath), "w") as f:
        f.write(str(newText))

@click.command()
@click.option("--name", "-n",  prompt="Enter the name of the feature which you want to create", help= "Enter the name of the feature which you want to create")
def main(name):
    unzipFile(name)
    renameFiles("lib/features/"+str(name), name)

if __name__== "__main__":
    main()