#!/usr/bin/env python3

import sys
import os
import numpy as np
import numpy.linalg
import scipy.misc as sc

def getOutputPngName(path, rank):
    filename, ext = os.path.splitext(path)
    return filename + '.' + str(rank) + '.png'

def getOutputNpyName(path, rank):
    filename, ext = os.path.splitext(path)
    return filename + '.' + str(rank) + '.npy'

def svd(img, k):
 	u, s, vt = np.linalg.svd(img)
 	h, w = img.shape[:2]
 	s1 = np.diag(s[:k], 0)
 	u1 = np.zeros((h, k), float)
 	vt1 = np.zeros((k, w), float)
 	u1[:,:] = u[:,:k]
 	vt1[:,:] = vt[:k,:]
 	svd_img = u1.dot(s1).dot(vt1)
 	return svd_img

if len(sys.argv) < 3:
    sys.exit('usage: task1.py <PNG inputFile> <rank>')

inputfile = sys.argv[1]
rank = int(sys.argv[2])


#Load an image file into a numpy array
I = sc.imread(inputfile)
svd_img = svd(I , rank)

outputpng = getOutputPngName(inputfile, rank)
outputnpy = getOutputNpyName(inputfile, rank)

np.save(outputnpy, svd_img)
sc.imsave(outputpng, svd_img)

#
# TODO: The current code just prints out what it is supposed to to
#       Replace the print statement wth your code
#

