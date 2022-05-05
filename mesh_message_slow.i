[Executioner]
  type = Transient
  solve_type = NEWTON
  petsc_options_iname = '-pc_type -pc_factor_mat_solver_package'
  petsc_options_value = 'lu       superlu_dist'
  scheme = bdf2
  l_max_its = 15
  l_tol = 1e-4
  nl_max_its = 800
  nl_rel_tol = 1e-9
  nl_abs_tol = 1e-7
  end_time = 67700
  [./TimeStepper]
    type = IterationAdaptiveDT
    dt = 1e-3
    iteration_window = 2
    optimal_iterations = 10
    growth_factor = 1.1
    cutback_factor = 0.75
  [../]
[]

[Mesh]
  file = 1gas_out.e
[]

[Preconditioning]
  [./full]
    type = SMP
    full = true
  [../]
[]

[Outputs]
  exodus = true
  csv = true
[]

[Postprocessors]
  [./alloy_area]
    type = ElementIntegralVariablePostprocessor
    variable = eta1
    outputs = csv
  [../]
  [./spinel_area]
    type = ElementIntegralVariablePostprocessor
    variable = eta3
    outputs = csv
  [../]
  [./chromia_area]
    type = ElementIntegralVariablePostprocessor
    variable = eta4
    outputs = csv
  [../]
  [./mno_area]
    type = ElementIntegralVariablePostprocessor
    variable = eta5
    outputs = csv
  [../]
  [./o_total_c]
    type = ElementIntegralVariablePostprocessor
    variable = o
    outputs = csv
  [../]
  [./cr_total_c]
    type = ElementIntegralVariablePostprocessor
    variable = cr
    outputs = csv
  [../]
  [./mn_total_c]
    type = ElementIntegralVariablePostprocessor
    variable = mn
    outputs = csv
  [../]
  [./fe_total_c]
    type = ElementIntegralVariablePostprocessor
    variable = fe
    outputs = csv
  [../]
  [./va_total_c]
    type = ElementIntegralVariablePostprocessor
    variable = va
    outputs = csv
  [../]
  [./time]
    type = PerfGraphData
    data_type =  TOTAL
    section_name = "Root"
    execute_on = TIMESTEP_END
    outputs = csv
  [../]
[]

[Variables]
[./o]
  initial_from_file_var = o
  initial_from_file_timestep = 1000
[../]
[./cr]
  initial_from_file_var = cr
  initial_from_file_timestep = 1000
[../]
[./mn]
  initial_from_file_var = mn
  initial_from_file_timestep = 1000
[../]
[./fe]
  initial_from_file_var = fe
  initial_from_file_timestep = 1000
[../]
[./o1]
  initial_from_file_var = o1
  initial_from_file_timestep = 1000
[../]
[./o3]
  initial_from_file_var = o3
  initial_from_file_timestep = 1000
[../]
[./o4]
  initial_from_file_var = o4
  initial_from_file_timestep = 1000
[../]
[./o5]
  initial_from_file_var = o5
  initial_from_file_timestep = 1000
[../]
[./o6]
  initial_from_file_var = o6
  initial_from_file_timestep = 1000
[../]
[./cr1]
  initial_from_file_var = cr1
  initial_from_file_timestep = 1000
[../]
[./cr3]
  initial_from_file_var = cr3
  initial_from_file_timestep = 1000
[../]
[./cr4]
  initial_from_file_var = cr4
  initial_from_file_timestep = 1000
[../]
[./cr5]
  initial_from_file_var = cr5
  initial_from_file_timestep = 1000
[../]
[./cr6]
  initial_from_file_var = cr6
  initial_from_file_timestep = 1000
[../]
[./mn1]
  initial_from_file_var = mn1
  initial_from_file_timestep = 1000
[../]
[./mn3]
  initial_from_file_var = mn3
  initial_from_file_timestep = 1000
[../]
[./mn4]
  initial_from_file_var = mn4
  initial_from_file_timestep = 1000
[../]
[./mn5]
  initial_from_file_var = mn5
  initial_from_file_timestep = 1000
[../]
[./mn6]
  initial_from_file_var = mn6
  initial_from_file_timestep = 1000
[../]
[./fe1]
  initial_from_file_var = fe1
  initial_from_file_timestep = 1000
[../]
[./fe3]
  initial_from_file_var = fe3
  initial_from_file_timestep = 1000
[../]
[./fe4]
  initial_from_file_var = fe4
  initial_from_file_timestep = 1000
[../]
[./fe5]
  initial_from_file_var = fe5
  initial_from_file_timestep = 1000
[../]
[./fe6]
  initial_from_file_var = fe6
  initial_from_file_timestep = 1000
[../]
[./eta1] # alloy
  initial_from_file_var = eta1
  initial_from_file_timestep = 1000
[../]
[./eta3] # spinel
  initial_from_file_var = eta3
  initial_from_file_timestep = 1000
[../]
[./eta4] # chromia
  initial_from_file_var = eta4
  initial_from_file_timestep = 1000
[../]
[./eta5] # Mn3O4
  initial_from_file_var = eta5
  initial_from_file_timestep = 1000
[../]
[./eta6] # gas
  initial_from_file_var = eta6
  initial_from_file_timestep = 1000
[../]
[./lambda]
  initial_from_file_var = lambda
  initial_from_file_timestep = 1000
[../]
[./muo]
  initial_from_file_var = muo
  initial_from_file_timestep = 1000
[../]
[./mucr]
  initial_from_file_var = mucr
  initial_from_file_timestep = 1000
[../]
[./mumn]
  initial_from_file_var = mumn
  initial_from_file_timestep = 1000
[../]
[./mufe]
  initial_from_file_var = mufe
  initial_from_file_timestep = 1000
[../]
[]

[AuxVariables]
  [./va]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[AuxKernels]
  [./c_va]
    type = ParsedAux
    variable = va
    args = 'cr mn o fe'
    function = '1 - cr - mn - o - fe'
  [../]
[]

[BCs]
  [./BCmuo_right]
    type = DirichletBC
    variable = muo
    value = 0 # derivative
    boundary = right
  [../]
[]

[GlobalParams]
  Fj_names  = 'F1 F3 F4 F5 F6'
  hj_names  = 'h1 h3 h4 h5 h6'
  wi = 0.014044500000000003
  derivative_order = 2
  evalerror_behavior = error
  enable_ad_cache = false
  enable_jit = false
  epsilon = 1e-9 # used in lambda kernel, default
[]

#       =         =              =      ===============
#      = =       = =            = =            =
#     =   =     =   =          =   =           =
#    =     =   =     =        =     =          =
#   =       = =       =      =========         =
#  =         =         =    =         =        =
# =                     =  =           =       =

[Materials]
  [./const] # modifing D to make the simulation converge
    type = GenericConstantMaterial # for 1D simulation, the metal diffusivities in void phase have to be large, so metal can travel through the void. But in 2D, metal diffusivity in the void phase have to be very small.
    prop_names =  'sigma      L    ND   ptol'
    prop_values = '0.2017197200276853   1e-2  0.01  1e-4'
  [../]
  [./thermo]
    type = GenericConstantMaterial
    prop_names =  'T       R      to_eV     to_nm3  Na'
    prop_values = '973.15  8.314  6.242e18  1e21    6.02214e23'
  [../]
  [./kappa]  # KKS original paper, epsilon in the paper equals to sqrt(kappa/2)
    type = ParsedMaterial
    f_name = kappa
    constant_names = 'lgb'
    constant_expressions = '43.08869380063767' # this is the int_width in the IC, which is half of the real interface
    material_property_names = 'sigma'
    function = '3*sigma*lgb/4'
  [../]
  [./w]
    type = ParsedMaterial
    f_name = w
    constant_names = 'lgb'
    constant_expressions = '43.08869380063767'
    material_property_names = 'sigma'
    function = '6*sigma/lgb'
  [../]

  [./Vm_ref] # molar volume of the volume of Fe FCC unit cell divided by 4 atoms in an unit cell (similiar to Larry's TJ paper), unit is nm3/mol
    type = ParsedMaterial
    f_name = Vm_ref
    material_property_names = 'Na'
    function = '16*2^0.5*0.126^3/4*Na'
  [../]

  ###############################################################################################################################################################################################################################################
  [./F1]  # alloy phase, unit eV/nm3
    type = DerivativeParsedMaterial
    f_name = F1
    args = 'o1 cr1 mn1 fe1'
    constant_names =       'formation_Vfe   o1_0   fe1_0       cr1_0  mn1_0' # the unit of formation energy of iron vacancy has unit of eV/#, from Setan's 10_26_20 quarterly report result
    constant_expressions = '1.36            1e-8   0.70099998  0.214  0.085'
    material_property_names = 'ND ptol to_eV Na Vm_ref T R Gcr Gmn Gfe GHSER_Fe Go_FCC'
    function = 'ND*(to_eV/Vm_ref*(cr1*Gcr + mn1*Gmn + o1*Go_FCC + (1-cr1-mn1-o1-fe1)*(formation_Vfe/to_eV*Na - GHSER_Fe) + fe1*Gfe +
                                 T*R*(cr1*plog(cr1,ptol) + mn1*plog(mn1,ptol) + (1-cr1-mn1-o1-fe1)*plog((1-cr1-mn1-o1-fe1),ptol) + o1*plog(o1,ptol) + fe1*plog(fe1,ptol)) +
                                 cr1*fe1*(10833 - 7.477*T - 1410*(fe1 - cr1)) + cr1*mn1*(-19088 + 17.5423*T) + fe1*mn1*(-7762 + 3.865*T - 259*(fe1 - mn1)) + cr1*mn1*fe1*(6715 - 10.3933*T)))'
  [../]
  [./F3] # spinel
    type = DerivativeParsedMaterial
    f_name = F3
    args = 'o3 cr3 mn3 fe3' # ko should be calculated from the SECOND derivative! The first derivative is zero!
    constant_names =       'ko       o3_0  ' # ko comes from making the second derivative of F wrt oxygen the same between CEF and parabolic function
    constant_expressions = '1e6      0.5714'
    material_property_names = 'ND ptol to_eV Vm_ref T R Gm2c3vo Gm2vvo Gm2f3vo Gm2m3vo'
    # the 1/7 is to make is has unit of per atom, not per chemical formula, because phase-field does not have chemical fomular
    function = 'ND*(to_eV/Vm_ref*(1/7)*(7/2*cr3*Gm2c3vo + (7*mn3 - 1)/2*Gm2m3vo + 7/2*fe3*Gm2f3vo + 7/2*(1-cr3-mn3-fe3-o3_0)*Gm2vvo +
                                 T*R*2*(7/2*cr3*plog((7/2*cr3),ptol) + (7*mn3 - 1)/2*plog((7*mn3 - 1)/2,ptol) + 7/2*(1-cr3-mn3-o3_0-fe3)*plog((7/2*(1-cr3-mn3-o3_0-fe3)),ptol) + 7/2*fe3*plog((7/2*fe3),ptol))) +
                                 ko/2*(o3 - o3_0)^2)'
  [../]
  [./F4] # Cr2O3 Corumdum phase
    type = DerivativeParsedMaterial
    f_name = F4
    args = 'o4 cr4 mn4 fe4' # ko should be calculated from the SECOND derivative! The first derivative is zero!
    constant_names =       'ko   o4_0  fe4_0  Lc3m3vo  Lfmo'
    constant_expressions = '1e6  0.6   1e-8   15000   1500'
    material_property_names = 'ND ptol to_eV Vm_ref T R Gc3vo Gm3vo Gf3vo Lc3f3vo'
    function = 'ND*(to_eV/Vm_ref*(1/5)*(5/2*cr4*Gc3vo + 5/2*mn4*Gm3vo + 5/2*fe4*Gf3vo +
                               T*R*2*(5/2*cr4*plog((5/2*cr4),ptol) + 5/2*mn4*plog((5/2*mn4),ptol) + 5/2*(1-cr4-mn4-fe4-o4_0)*plog((5/2*(1-cr4-mn4-fe4-o4_0)),ptol) + 5/2*fe4*plog((5/2*fe4),ptol)) +
                               5/2*cr4*5/2*mn4*Lc3m3vo + 5/2*cr4*5/2*fe4*Lc3f3vo) +
                               ko/2*(o4 - o4_0)^2)'
  [../]
  [./F5] # beta-Mn3O4 cubic phase (Hausmannite is Mn3O4)
    type = DerivativeParsedMaterial
    f_name = F5
    args = 'o5 cr5 mn5 fe5'
    constant_names =       'ko      o5_0   cr5_0  fe5_0  va5_0  mn5_0   a         b           c       d         e        f_min'
    constant_expressions = '1e8    0.5714  1e-8   1e-8   1e-8   0.4286  5.113e5   371329.88   7.8e5   4.989e5   0.1884   -2.31880e5'
    material_property_names = 'ND ptol to_eV Vm_ref'
    function = 'ND*(to_eV/Vm_ref*(f_min + a*(mn5*plog(mn5,ptol) + (2*mn5_0 - mn5)*plog((2*mn5_0 - mn5),ptol)) + b +
                                          ko/2*(o5 - o5_0)^2 +
                                          a*(cr5*plog(cr5,ptol) + (2*cr5_0 - cr5)*plog((2*cr5_0 - cr5),ptol)) + e +
                                          a*(fe5*plog(fe5,ptol) + (2*fe5_0 - fe5)*plog((2*fe5_0 - fe5),ptol)) + e +
                                          a*((1-mn5-cr5-fe5-o5)*plog((1-mn5-cr5-fe5-o5),ptol) + (2*va5_0 - (1-mn5-cr5-fe5-o5))*plog((2*va5_0 - (1-mn5-cr5-fe5-o5)),ptol)) + e))'
  [../]
  [./F6] # gas
    type = DerivativeParsedMaterial
    f_name = F6
    args = 'o6 cr6 mn6 fe6'
    constant_names =       'log_2nd_deri   o6_0   va6_0        cr6_0 mn6_0 fe6_0  fmin'  # energy approximation: for each species, the second derivative w.r.t. the concentration is 1, and its minimum concentration is zero
    constant_expressions = '588971272534   0.1919 0.80809997   1e-8  1e-8  1e-8   -2.2188e+09'
    material_property_names = 'to_eV  ptol  ND'
    function = 'ND*(to_eV/1e27*(fmin + log_2nd_deri*(((1-cr6-mn6-o6-fe6)*plog((1-cr6-mn6-o6-fe6),ptol) + (2*va6_0 - (1-cr6-mn6-o6-fe6))*plog((2*va6_0 - (1-cr6-mn6-o6-fe6)),ptol))/2.47495 + 0.1391 + (o6*plog(o6,ptol) + (2*o6_0 - o6)*plog((2*o6_0 - o6),ptol))/10.4221 + 0.06079 + (cr6*plog(cr6,ptol) + (2*cr6_0 - cr6)*plog((2*cr6_0 - cr6),ptol))/20000 + (mn6*plog(mn6,ptol) + (2*mn6_0 - mn6)*plog((2*mn6_0 - mn6),ptol))/20000 + (fe6*plog(fe6,ptol) + (2*fe6_0 - fe6)*plog((2*fe6_0 - fe6),ptol))/20000)))'
  [../]

  [./M_cr]
    type = DerivativeParsedMaterial
    f_name = M_cr
    material_property_names = 'h1(eta1) h3(eta3) h4(eta4) h5(eta5) h6(eta6)'
    args = 'eta1 eta3 eta4 eta5 eta6'
    constant_names =       'Malloy_cr Mspinel_cr Mchromia_cr Mmno_cr Mgas_cr'
    constant_expressions = '100  10  1  0.0293  0.001'
    function = 'h1*Malloy_cr + h3*Mspinel_cr + h4*Mchromia_cr + h5*Mmno_cr + h6*Mgas_cr'
  [../]
  [./M_mn]
    type = DerivativeParsedMaterial
    f_name = M_mn
    material_property_names = 'h1(eta1) h3(eta3) h4(eta4) h5(eta5) h6(eta6)'
    args = 'eta1 eta3 eta4 eta5 eta6'
    constant_names =       'Malloy_mn Mspinel_mn Mchromia_mn Mmno_mn Mgas_mn'
    constant_expressions = '10  10  6.7598e-07  100  0.001'
    function = 'h1*Malloy_mn + h3*Mspinel_mn + h4*Mchromia_mn + h5*Mmno_mn + h6*Mgas_mn'
  [../]
  [./M_fe]
    type = DerivativeParsedMaterial
    f_name = M_fe
    material_property_names = 'h1(eta1) h3(eta3) h4(eta4) h5(eta5) h6(eta6)'
    args = 'eta1 eta3 eta4 eta5 eta6'
    constant_names =       'Malloy_fe Mspinel_fe Mchromia_fe Mmno_fe Mgas_fe'
    constant_expressions = '100  0.084  4.7224e-08  0.02929  0.001'
    function = 'h1*Malloy_fe + h3*Mspinel_fe + h4*Mchromia_fe + h5*Mmno_fe + h6*Mgas_fe'
  [../]
  [./M_o]
    type = DerivativeParsedMaterial
    f_name = M_o
    material_property_names = 'h1(eta1) h3(eta3) h4(eta4) h5(eta5) h6(eta6)'
    args = 'eta1 eta3 eta4 eta5 eta6'
    constant_names =       'Malloy_o Mspinel_o Mchromia_o Mmno_o Mgas_o'
    constant_expressions = '0.00175  0.1  0.001  0.1  100000'
    function = 'h1*Malloy_o + h3*Mspinel_o + h4*Mchromia_o + h5*Mmno_o + h6*Mgas_o'
  [../]

  [./h1]
    type = SwitchingFunctionMaterial
    eta = eta1
    h_order = HIGH
    function_name = h1
  [../]
  [./h3]
    type = SwitchingFunctionMaterial
    eta = eta3
    h_order = HIGH
    function_name = h3
  [../]
  [./h4]
    type = SwitchingFunctionMaterial
    eta = eta4
    h_order = HIGH
    function_name = h4
  [../]
  [./h5]
    type = SwitchingFunctionMaterial
    eta = eta5
    h_order = HIGH
    function_name = h5
  [../]
  [./h6]
    type = SwitchingFunctionMaterial
    eta = eta6
    h_order = HIGH
    function_name = h6
  [../]

  [./g]
    type = DerivativeParsedMaterial
    constant_names = 'gamma'
    constant_expressions = '1.5'
    f_name = g
    function = '(eta1^4/4 - eta1^2/2) + (eta3^4/4 - eta3^2/2) + (eta4^4/4 - eta4^2/2) + (eta5^4/4 - eta5^2/2) + (eta6^4/4 - eta6^2/2) +
                gamma * ((eta1*eta3)^2 + (eta1*eta4)^2 + (eta1*eta5)^2 + (eta1*eta6)^2 +
                (eta3*eta4)^2 + (eta3*eta5)^2 + (eta3*eta6)^2 +
                (eta4*eta5)^2 + (eta4*eta6)^2 +
                (eta5*eta6)^2) + 1/4'
    args = 'eta1 eta3 eta4 eta5 eta6'
  [../]

  # free energies
  [./Go_FCC]
    type = ParsedMaterial
    f_name = Go_FCC
    material_property_names = 'T'
    function = '5803.022 + 123.869531*T - 23.5710242*T*log(T) - 1.90427e-3*T^2'
  [../]
  [./Gcr] # Cr-FCC
    type = ParsedMaterial
    f_name = Gcr
    material_property_names = 'T'
    function = '-1572.94 + 157.643*T - 26.908*T*log(T) + 1.89435e-3*T^2 - 1.47721e-6*T^3 + 139250*T^(-1)'
  [../]
  [./Gmn] # Mn-FCC, relative to Mn-cbcc-A12
    type = ParsedMaterial
    f_name = Gmn
    material_property_names = 'T'
    function = '-3439.3 + 131.884*T - 24.5177*T*log(T) - 6e-3*T^2 + 69600*T^(-1)'
  [../]
  [./Gfe] # Fe-FCC, relative to Fe-bcc-A2
    type = ParsedMaterial
    f_name = Gfe
    material_property_names = 'T'
    function = '-236.5 + 132.4156*T - 24.6643*T*log(T) - 0.003758*T^2 + 77359*T^(-1) - 5.8927e-8*T^3'
  [../]
  [./GHSER_Fe] # GHSE Fe-bcc-A2
    type = ParsedMaterial
    f_name = GHSER_Fe
    material_property_names = 'T'
    function = '1225.7 + 124.134*T - 23.5143*T*log(T) - 4.39752e-3*T^2 - 0.058927e-6*T^3 + 77359*T^(-1)'
  [../]

  # energy expressions used by spinel phase
  [./GFFB]
    type = ParsedMaterial
    f_name = GFFB
    material_property_names = 'T'
    function = '-161731 + 144.873*T - 24.9879*T*log(T) - 0.0011952256*T^2 + 206520/T'
  [../]
  [./JMF]
    type = GenericConstantMaterial
    prop_names = JMF
    prop_values = 28000
  [../]
  [./JFF]
    type = ParsedMaterial
    f_name = JFF
    material_property_names = 'T'
    function = '46826 - 27.266*T'
  [../]
  [./GMFB]
    type = ParsedMaterial
    f_name = GMFB
    material_property_names = 'T'
    function = '-181660 + 125.8*T - 22.08*T*log(T) - 0.0016*T^2 + 104000/T'
  [../]
  [./GMN1O1]
    type = ParsedMaterial
    f_name = GMN1O1
    material_property_names = 'T'
    function = '-402478 + 259.356*T - 46.835*T*log(T) - 0.00385*T^2 + 212922/T'
  [../]
  [./GMN2O3]
    type = ParsedMaterial
    f_name = GMN2O3
    material_property_names = 'T'
    function = '-998618 + 588.619*T - 101.956*T*log(T) - 0.018844*T^2 + 589055/T'
  [../]
  [./GCR2O3]
    type = ParsedMaterial
    f_name = GCR2O3
    material_property_names = 'T'
    function = '-1177497.8 + 814.9138*T - 132.046*T*log(T) + 0.005256015*T^2 - 1.38885e-6*T^3 + 1501761/T'
  [../]
  [./GMCOB]
    type = ParsedMaterial
    f_name = GMCOB
    material_property_names = 'GMN1O1 GCR2O3'
    function = 'GMN1O1 + GCR2O3 - 51000'
  [../]
  [./JMMB]
    type = ParsedMaterial
    f_name = JMMB
    material_property_names = 'T'
    function = '26210 - 17.46*T'
  [../]
  [./GMN3O4A]
    type = ParsedMaterial
    f_name = GMN3O4A
    material_property_names = 'T'
    function = '-1439700 + 892.2*T - 154.748*T*log(T) - 0.017408*T^2 + 986139/T'
  [../]
  [./GMN3O4B]
    type = ParsedMaterial
    f_name = GMN3O4B
    material_property_names = 'T'
    function = '15270 + 7*T'
  [../]
  [./GM2M2B]
    type = ParsedMaterial
    f_name = GM2M2B
    material_property_names = 'GMFB JMF GFFB JFF'
    function = '21*GMFB + 2*JMF - 14*GFFB + 2*JFF'
  [../]
  [./GMMB]
    type = ParsedMaterial
    f_name = GMMB
    material_property_names = 'GMN3O4B GMN3O4A'
    function = 'GMN3O4B/7 + GMN3O4A/7'
  [../]
  [./GMCB]
    type = ParsedMaterial
    f_name = GMCB
    material_property_names = 'GMCOB'
    function = 'GMCOB/7'
  [../]
  [./GGMN2O3B]
    type = ParsedMaterial
    f_name = GGMN2O3B
    material_property_names = 'T GMN2O3'
    function = 'GMN2O3 + 228000 - 200.34*T + 0.05*T^2'
  [../]
  [./Gm2c3vo]
    type = ParsedMaterial
    f_name = Gm2c3vo
    material_property_names = 'GMCB'
    function = '7*GMCB'
  [../]
  [./Gm2vvo]
    type = ParsedMaterial
    f_name = Gm2vvo
    material_property_names = 'T R GGMN2O3B GMMB JMMB GM2M2B'
    function = '8*GGMN2O3B - 56*GMMB - 3*JMMB + 3*GM2M2B + 2*R*T*(6*log(6) - 3*log(3) - 2*log(2))'
  [../]
  [./Gm2f3vo]
    type = ParsedMaterial
    f_name = Gm2f3vo
    material_property_names = 'GMFB'
    function = '7*GMFB'
  [../]
  [./Gm2m3vo]
    type = ParsedMaterial
    f_name = Gm2m3vo
    material_property_names = 'GMMB'
    function = '7*GMMB'
  [../]

  # energy expressions used by chromia phase
  [./GFE2O3]
    type = ParsedMaterial
    f_name = GFE2O3
    material_property_names = 'T'
    function = '-858683 + 827.946*T - 137.0089*T*log(T) + 1453810/T'
  [../]
  [./Gc3vo]
    type = ParsedMaterial
    f_name = Gc3vo
    material_property_names = 'GCR2O3'
    function = 'GCR2O3'
  [../]
  [./Gm3vo]
    type = ParsedMaterial
    f_name = Gm3vo
    material_property_names = 'T GMN2O3'
    function = 'GMN2O3 + 25500 - 3.7*T'
  [../]
  [./Gf3vo]
    type = ParsedMaterial
    f_name = Gf3vo
    material_property_names = 'GFE2O3'
    function = 'GFE2O3'
  [../]
  [./Lc3f3vo]
    type = ParsedMaterial
    f_name = Lc3f3vo
    material_property_names = 'T'
    function = '-16250 + 12.5*T'
  [../]
[]

# =         =    = = = = = = =     = = = = = = =
# =       =      =                 =            =
# =     =        =                 =            =
# = = =          = = = = = = =     = = = = = = =
# =     =        =                 =     =
# =       =      =                 =         =
# =         =    = = = = = = =     =             =

[Kernels]
  [./lambda_lagrange]
    type = SwitchingFunctionConstraintLagrange
    variable = lambda
    etas =    'eta1 eta3 eta4 eta5 eta6'
    h_names = 'h1   h3   h4   h5   h6'
  [../]
  [./eta1_lagrange]
    type = SwitchingFunctionConstraintEta
    variable = eta1
    h_name = h1
    lambda = lambda
  [../]
  [./eta3_lagrange]
    type = SwitchingFunctionConstraintEta
    variable = eta3
    h_name = h3
    lambda = lambda
  [../]
  [./eta4_lagrange]
    type = SwitchingFunctionConstraintEta
    variable = eta4
    h_name = h4
    lambda = lambda
  [../]
  [./eta5_lagrange]
    type = SwitchingFunctionConstraintEta
    variable = eta5
    h_name = h5
    lambda = lambda
  [../]
  [./eta6_lagrange]
    type = SwitchingFunctionConstraintEta
    variable = eta6
    h_name = h6
    lambda = lambda
  [../]

  # constraints to sum sub-concentrations to concentrations
  # =======================================================================================================================================KKS_CONSTRAINTS
  [./phaseconcentration_o]
    type = KKSMultiPhaseConcentration
    variable = o6
    cj =   'o1   o3   o4   o5   o6'
    etas = 'eta1 eta3 eta4 eta5 eta6'
    c = o
  [../]
  [./phaseconcentration_cr]
    type = KKSMultiPhaseConcentration
    variable = cr6
    cj =   'cr1   cr3  cr4  cr5  cr6'
    etas = 'eta1  eta3 eta4 eta5 eta6'
    c = cr
  [../]
  [./phaseconcentration_mn]
    type = KKSMultiPhaseConcentration
    variable = mn6
    cj =   'mn1  mn3  mn4  mn5  mn6'
    etas = 'eta1 eta3 eta4 eta5 eta6'
    c = mn
  [../]
  [./phaseconcentration_fe]
    type = KKSMultiPhaseConcentration
    variable = fe6
    cj =   'fe1  fe3  fe4  fe5  fe6'
    etas = 'eta1 eta3 eta4 eta5 eta6'
    c = fe
  [../]

  # Constraints to enforce equality of phase chemical potentials
  # with respect to oxygen sub-concentrations
  [./chempot13_o]
    type = KKSPhaseChemicalPotential
    variable = o1
    cb       = o3
    fa_name  = F1
    fb_name  = F3
    args_a = 'cr1 mn1 fe1 o1'
    args_b = 'cr3 mn3 fe3 o3'
  [../]
  [./chempot34_o]
    type = KKSPhaseChemicalPotential
    variable = o3
    cb       = o4
    fa_name  = F3
    fb_name  = F4
    args_a = 'cr3 mn3 fe3 o3'
    args_b = 'cr4 mn4 fe4 o4'
  [../]
  [./chempot45_o]
    type = KKSPhaseChemicalPotential
    variable = o4
    cb       = o5
    fa_name  = F4
    fb_name  = F5
    args_a = 'cr4 mn4 fe4 o4'
    args_b = 'cr5 mn5 fe5 o5'
  [../]
  [./chempot56_o]
    type = KKSPhaseChemicalPotential
    variable = o5
    cb       = o6
    fa_name  = F5
    fb_name  = F6
    args_a = 'cr5 mn5 fe5 o5'
    args_b = 'cr6 mn6 fe6 o6'
  [../]

  # Constraints to enforce equality of phase chemical potentials
  # with respect to Cr sub-concentrations
  [./chempot13_cr]
    type = KKSPhaseChemicalPotential
    variable = cr1
    cb       = cr3
    fa_name  = F1
    fb_name  = F3
    args_a = 'o1 mn1 fe1 cr1'
    args_b = 'o3 mn3 fe3 cr3'
  [../]
  [./chempot34_cr]
    type = KKSPhaseChemicalPotential
    variable = cr3
    cb       = cr4
    fa_name  = F3
    fb_name  = F4
    args_a = 'o3 mn3 fe3 cr3'
    args_b = 'o4 mn4 fe4 cr4'
  [../]
  [./chempot45_cr]
    type = KKSPhaseChemicalPotential
    variable = cr4
    cb       = cr5
    fa_name  = F4
    fb_name  = F5
    args_a = 'o4 mn4 fe4 cr4'
    args_b = 'o5 mn5 fe5 cr5'
  [../]
  [./chempot56_cr]
    type = KKSPhaseChemicalPotential
    variable = cr5
    cb       = cr6
    fa_name  = F5
    fb_name  = F6
    args_a = 'o5 mn5 fe5 cr5'
    args_b = 'o6 mn6 fe6 cr6'
    [../]

  # Constraints to enforce equality of phase chemical potentials
  # with respect to Mn sub-concentrations
  [./chempot13_mn]
    type = KKSPhaseChemicalPotential
    variable = mn1
    cb       = mn3
    fa_name  = F1
    fb_name  = F3
    args_a = 'o1 cr1 fe1 mn1'
    args_b = 'o3 cr3 fe3 mn3'
  [../]
  [./chempot34_mn]
    type = KKSPhaseChemicalPotential
    variable = mn3
    cb       = mn4
    fa_name  = F3
    fb_name  = F4
    args_a = 'o3 cr3 fe3 mn3'
    args_b = 'o4 cr4 fe4 mn4'
  [../]
  [./chempot45_mn]
    type = KKSPhaseChemicalPotential
    variable = mn4
    cb       = mn5
    fa_name  = F4
    fb_name  = F5
    args_a = 'o4 cr4 fe4 mn4'
    args_b = 'o5 cr5 fe5 mn5'
  [../]
  [./chempot56_mn]
    type = KKSPhaseChemicalPotential
    variable = mn5
    cb       = mn6
    fa_name  = F5
    fb_name  = F6
    args_a = 'o5 cr5 fe5 mn5'
    args_b = 'o6 cr6 fe6 mn6'
  [../]

  # Constraints to enforce equality of phase chemical potentials
  # with respect to Va sub-concentrations
  [./chempot13_fe]
    type = KKSPhaseChemicalPotential
    variable = fe1
    cb       = fe3
    fa_name  = F1
    fb_name  = F3
    args_a = 'o1 cr1 mn1 fe1'
    args_b = 'o3 cr3 mn3 fe3'
  [../]
  [./chempot34_fe]
    type = KKSPhaseChemicalPotential
    variable = fe3
    cb       = fe4
    fa_name  = F3
    fb_name  = F4
    args_a = 'o3 cr3 mn3 fe3'
    args_b = 'o4 cr4 mn4 fe4'
  [../]
  [./chempot45_fe]
    type = KKSPhaseChemicalPotential
    variable = fe4
    cb       = fe5
    fa_name  = F4
    fb_name  = F5
    args_a = 'o4 cr4 mn4 fe4'
    args_b = 'o5 cr5 mn5 fe5'
  [../]
  [./chempot56_fe]
    type = KKSPhaseChemicalPotential
    variable = fe5
    cb       = fe6
    fa_name  = F5
    fb_name  = F6
    args_a = 'o5 cr5 mn5 fe5'
    args_b = 'o6 cr6 mn6 fe6'
  [../]

  # kernels for diffusion equation oxygen
  # =======================================================================================================================================================Diffusion equations
  [./CHBulk_o] # calculate mu from dF/dc
    type = KKSSplitCHCRes
    variable = o
    w = muo
    ca = o1
    fa_name = F1
    args_a = 'cr1 mn1 fe1'
  [../]
  [./dcdt_o]
    type = CoupledTimeDerivative # dc/dt
    variable = muo
    v = o
  [../]
  [./ckernel_o]
    type = SplitCHWRes
    variable = muo
    mob_name = M_o
    args = 'eta1 eta3 eta4 eta5 eta6'
  [../]

  # kernels for diffusion equation Cr
  [./CHBulk_cr]
    type = KKSSplitCHCRes # calculate mu from dF/dc
    variable = cr
    w = mucr
    ca = cr1
    fa_name = F1
    args_a = 'o1 mn1 fe1'
  [../]
  [./dcdt_cr]
    type = CoupledTimeDerivative # dc/dt
    variable = mucr
    v = cr
  [../]
  [./ckernel_cr]
    type = SplitCHWRes
    variable = mucr
    mob_name = M_cr
    args = 'eta1 eta3 eta4 eta5 eta6'
  [../]

  # kernels for diffusion equation Mn
  [./CHBulk_mn]
    type = KKSSplitCHCRes
    variable = mn
    w = mumn
    ca = mn1
    fa_name = F1
    args_a = 'o1 cr1 fe1'
  [../]
  [./dcdt_mn]
    type = CoupledTimeDerivative
    variable = mumn
    v = mn
  [../]
  [./ckernel_mn]
    type = SplitCHWRes
    variable = mumn
    mob_name = M_mn
    args = 'eta1 eta3 eta4 eta5 eta6'
  [../]

  # kernels for diffusion equation V
  [./CHBulk_fe]
    type = KKSSplitCHCRes # calculate mu from dF/dc
    variable = fe
    w = mufe
    ca = fe1
    fa_name = F1
    args_a = 'o1 mn1 cr1'
  [../]
  [./dcdt_fe]
    type = CoupledTimeDerivative # dc/dt
    variable = mufe
    v = fe
  [../]
  [./ckernel_fe]
    type = SplitCHWRes
    variable = mufe
    mob_name = M_fe
    args = 'eta1 eta3 eta4 eta5 eta6'
  [../]

  # Kernels for Allen-Cahn equation for eta1
  #========================================================================================================================================AC equations
  [./ACBulkF1]
    type = KKSMultiACBulkF
    variable  = eta1
    # gi_name   = g1
    gi_name   = g
    eta_i     = eta1
    args = 'eta3 eta4 eta5 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC1_o]
    type = KKSMultiACBulkC
    variable  = eta1
    cj_names  = 'o1 o3 o4 o5 o6'
    eta_i     = eta1
    args = 'eta3 eta4 eta5 eta6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC1_cr]
    type = KKSMultiACBulkC
    variable  = eta1
    cj_names  = 'cr1 cr3 cr4 cr5 cr6'
    eta_i     = eta1
    args = 'eta3 eta4 eta5 eta6 o1 o3 o4 o5 o6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC1_mn]
    type = KKSMultiACBulkC
    variable = eta1
    cj_names = 'mn1 mn3 mn4 mn5 mn6'
    eta_i = eta1
    args = 'eta3 eta4 eta5 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC1_fe]
    type = KKSMultiACBulkC
    variable = eta1
    cj_names = 'fe1 fe3 fe4 fe5 fe6'
    eta_i = eta1
    args = 'eta3 eta4 eta5 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6'
    mob_name = L
  [../]
  [./ACInterface1]
    type = ACInterface
    variable = eta1
    kappa_name = kappa
    mob_name = L
    args      = 'eta3 eta4 eta5 eta6'
  [../]
  [./deta1dt]
    type = TimeDerivative
    variable = eta1
  [../]

  # Kernels for Allen-Cahn equation for eta3
  [./ACBulkF3]
    type = KKSMultiACBulkF
    variable = eta3
    # gi_name = g3
    gi_name = g
    eta_i = eta3
    args = 'eta1 eta4 eta5 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC3_o]
    type = KKSMultiACBulkC
    variable = eta3
    cj_names = 'o1 o3 o4 o5 o6'
    eta_i = eta3
    args = 'eta1 eta4 eta5 eta6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC3_cr]
    type = KKSMultiACBulkC
    variable = eta3
    cj_names = 'cr1 cr3 cr4 cr5 cr6'
    eta_i = eta3
    args = 'eta1 eta4 eta5 eta6 o1 o3 o4 o5 o6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC3_mn]
    type = KKSMultiACBulkC
    variable = eta3
    cj_names = 'mn1 mn3 mn4 mn5 mn6'
    eta_i = eta3
    args = 'eta1 eta4 eta5 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC3_fe]
    type = KKSMultiACBulkC
    variable = eta3
    cj_names = 'fe1 fe3 fe4 fe5 fe6'
    eta_i = eta3
    args = 'eta1 eta4 eta5 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6'
    mob_name = L
  [../]
  [./ACInterface3]
    type = ACInterface
    variable = eta3
    kappa_name = kappa
    mob_name = L
    args      = 'eta1 eta4 eta5 eta6'
  [../]
  [./deta3dt]
    type = TimeDerivative
    variable = eta3
  [../]

  # Kernels for Allen-Cahn equation for eta4
  [./ACBulkF4]
    type = KKSMultiACBulkF
    variable = eta4
    # gi_name = g4
    gi_name = g
    eta_i = eta4
    args = 'eta1 eta3 eta5 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC4_o]
    type = KKSMultiACBulkC
    variable = eta4
    cj_names = 'o1 o3 o4 o5 o6'
    eta_i = eta4
    args = 'eta1 eta3 eta5 eta6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC4_cr]
    type = KKSMultiACBulkC
    variable = eta4
    cj_names = 'cr1 cr3 cr4 cr5 cr6'
    eta_i = eta4
    args = 'eta1 eta3 eta5 eta6 o1 o3 o4 o5 o6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC4_mn]
    type = KKSMultiACBulkC
    variable = eta4
    cj_names = 'mn1 mn3 mn4 mn5 mn6'
    eta_i = eta4
    args = 'eta1 eta3 eta5 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC4_fe]
    type = KKSMultiACBulkC
    variable = eta4
    cj_names = 'fe1 fe3 fe4 fe5 fe6'
    eta_i = eta4
    args = 'eta1 eta3 eta5 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6'
    mob_name = L
  [../]
  [./ACInterface4]
    type = ACInterface
    variable = eta4
    kappa_name = kappa
    mob_name = L
    args      = 'eta1 eta3 eta5 eta6'
  [../]
  [./deta4dt]
    type = TimeDerivative
    variable = eta4
  [../]

  # Kernels for Allen-Cahn equation for eta5
  [./ACBulkF5]
    type = KKSMultiACBulkF
    variable = eta5
    # gi_name = g5
    gi_name = g
    eta_i = eta5
    args = 'eta1 eta3 eta4 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC5_o]
    type = KKSMultiACBulkC
    variable = eta5
    cj_names = 'o1 o3 o4 o5 o6'
    eta_i = eta5
    args = 'eta1 eta3 eta4 eta6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC5_cr]
    type = KKSMultiACBulkC
    variable = eta5
    cj_names = 'cr1 cr3 cr4 cr5 cr6'
    eta_i = eta5
    args = 'eta1 eta3 eta4 eta6 o1 o3 o4 o5 o6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC5_mn]
    type = KKSMultiACBulkC
    variable = eta5
    cj_names = 'mn1 mn3 mn4 mn5 mn6'
    eta_i = eta5
    args = 'eta1 eta3 eta4 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC5_fe]
    type = KKSMultiACBulkC
    variable = eta5
    cj_names = 'fe1 fe3 fe4 fe5 fe6'
    eta_i = eta5
    args = 'eta1 eta3 eta4 eta6 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6'
    mob_name = L
  [../]
  [./ACInterface5]
    type = ACInterface
    variable = eta5
    kappa_name = kappa
    mob_name = L
    args      = 'eta1 eta3 eta4 eta6'
  [../]
  [./deta5dt]
    type = TimeDerivative
    variable = eta5
  [../]

  # Kernels for Allen-Cahn equation for eta6
  [./ACBulkF6]
    type = KKSMultiACBulkF
    variable = eta6
    # gi_name = g6
    gi_name = g
    eta_i = eta6
    args = 'eta1 eta3 eta4 eta5 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC6_o]
    type = KKSMultiACBulkC
    variable = eta6
    cj_names = 'o1 o3 o4 o5 o6'
    eta_i = eta6
    args = 'eta1 eta3 eta4 eta5 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC6_cr]
    type = KKSMultiACBulkC
    variable = eta6
    cj_names = 'cr1 cr3 cr4 cr5 cr6'
    eta_i = eta6
    args = 'eta1 eta3 eta4 eta5 o1 o3 o4 o5 o6 mn1 mn3 mn4 mn5 mn6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC6_mn]
    type = KKSMultiACBulkC
    variable = eta6
    cj_names = 'mn1 mn3 mn4 mn5 mn6'
    eta_i = eta6
    args = 'eta1 eta3 eta4 eta5 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 fe1 fe3 fe4 fe5 fe6'
    mob_name = L
  [../]
  [./ACBulkC6_fe]
    type = KKSMultiACBulkC
    variable = eta6
    cj_names = 'fe1 fe3 fe4 fe5 fe6'
    eta_i = eta6
    args = 'eta1 eta3 eta4 eta5 o1 o3 o4 o5 o6 cr1 cr3 cr4 cr5 cr6 mn1 mn3 mn4 mn5 mn6'
    mob_name = L
  [../]
  [./ACInterface6]
    type = ACInterface
    variable = eta6
    kappa_name = kappa
    mob_name = L
    args      = 'eta1 eta3 eta4 eta5'
  [../]
  [./deta6dt]
    type = TimeDerivative
    variable = eta6
  [../]
[]
