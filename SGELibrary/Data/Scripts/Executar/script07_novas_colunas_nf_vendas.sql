ALTER TABLE NF_VENDAS
 ADD BASE_CALC_IMCS_ST DOUBLE,
 ADD VLR_ICMS_ST DOUBLE;

UPDATE NF_VENDAS
  SET BASE_CALC_IMCS_ST = 0,
      VLR_ICMS_ST = 0;