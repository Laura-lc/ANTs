#####################################################################################
#####################################################################################
set(THIS_TEST_NAME ANTS_PSE_MSQ_TXT)
set(OUTPUT_PREFIX ${CMAKE_BINARY_DIR}/TEST_${THIS_TEST_NAME} )
set(WARP ${OUTPUT_PREFIX}Warp.nii.gz ${OUTPUT_PREFIX}Affine.txt )
set(INVERSEWARP -i ${OUTPUT_PREFIX}Affine.txt ${OUTPUT_PREFIX}InverseWarp.nii.gz )
set(WARP_IMAGE ${CMAKE_BINARY_DIR}/${THIS_TEST_NAME}_warped.nii.gz)
set(INVERSEWARP_IMAGE ${CMAKE_BINARY_DIR}/${THIS_TEST_NAME}_inversewarped.nii.gz)


add_test(NAME ${THIS_TEST_NAME} COMMAND ANTS 2
 -i 191x170x155x40x30 -r Gauss[3,0]
 -t SyN[0.2]
 -m MSQ[${DEVIL_IMAGE},${ANGEL_IMAGE},1,0]
 -m PSE[${DEVIL_IMAGE},${ANGEL_IMAGE},${DEVIL_IMAGE_TXT},${ANGEL_IMAGE_TXT},1,0.1,11,1,1]
 --continue-affine 0 --number-of-affine-iterations 0
 -o ${OUTPUT_PREFIX}.nii.gz --use-all-metrics-for-convergence 1 )
