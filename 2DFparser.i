[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 100
  xmax = 30
  ny = 100
  ymax = 30
[]

[Variables]
  [./c]
  [../]
  [./eta]
  [../]
  [./mu]
  [../]
[]

[AuxVariables]
  [./bounds_dummy]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Bounds]
  [./eta_upper_bound]
    type = ConstantBoundsAux
    variable = bounds_dummy
    bounded_variable = eta
    bound_type = upper
    bound_value = 1
  [../]
  [./eta_lower_bound]
    type = ConstantBoundsAux
    variable = bounds_dummy
    bounded_variable = eta
    bound_type = lower
    bound_value = 0
  [../]
  [./c_upper_bound]
    type = ConstantBoundsAux
    variable = bounds_dummy
    bounded_variable = c
    bound_type = upper
    bound_value = 1
  [../]
  [./c_lower_bound]
    type = ConstantBoundsAux
    variable = bounds_dummy
    bounded_variable = c
    bound_type = lower
    bound_value = 0
  [../]
[]

[ICs]
  [./c] # radius 5
    type = SmoothCircleIC
    variable = c
    radius = 5
    int_width = 2
    x1 = 15
    y1 = 15
    invalue = 0.6
    outvalue = 0.1
  [../]
  [./eta]
    type = SmoothCircleIC
    variable = eta
    radius = 5
    int_width = 2
    x1 = 15
    y1 = 15
    invalue = 0
    outvalue = 1
  [../]
[]

[GlobalParams]
  derivative_order = 2
  evalerror_behavior = error
  enable_ad_cache = false
  enable_jit = false
[]

[Materials]
  [./new_object]
    type = SubConcentration
    global_c = c
    eta = eta
    h_name = h
    c1_name = c1
    c2_name = c2
    absolute_tol_value = 1e-9
    relative_tol_value = 1e-9
    max_iteration = 500
    c1_IC = 0.6
    c2_IC = 0.1
    dc1dc_name = dc1dc
    dc2dc_name = dc2dc
    dc1deta_name = dc1deta
    dc2deta_name = dc2deta
    df1dc1_name = df1dc1
    df2dc2_name = df2dc2
    d2f1dc1_name = d2f1dc1
    d2f2dc2_name = d2f2dc2
    plog_tol_value = 1e-4
    num_iter_name = num_iter
    outputs = exodus
  [../]
  [./const]
    type = GenericConstantMaterial
    prop_names = 'kappa  L  ptol'
    prop_values = '0.1   2  1e-4'
  [../]
  [./M]
    type = DerivativeParsedMaterial
    f_name = M
    args = eta
    material_property_names = h(eta)
    function = '(1 - h)*1 + h*1'
  [../]
  [./F1]
    type = ParsedMaterial
    f_name = F1
    material_property_names = 'c1 ptol'
    args = 'c eta'
    function = '20*c1 + 300*(1 - c1) + 400*(c1*plog(c1, ptol) + (1 - c1)*plog(1 - c1, ptol))'
  [../]
  [./F2]
    type = ParsedMaterial
    f_name = F2
    material_property_names = 'c2 ptol'
    args = 'c eta'
    function = '2500*c2 + 0.01*(1 - c2) + 400*(c2*plog(c2, ptol) + (1 - c2)*plog(1 - c2, ptol))'
  [../]
  [./h_eta]
    type = SwitchingFunctionMaterial
    function_name = h
    h_order = HIGH
    eta = eta
  [../]
  [./g_eta]
    type = BarrierFunctionMaterial
    g_order = SIMPLE
    eta = eta
  [../]
[]

[Kernels]
  # CH equation
  # split KKS
  [./CHBulk]
    type = KKSSplitCHCRes
    variable = c
    dc1dc_name = dc1dc
    dc1deta_name = dc1deta
    df1dc1_name = df1dc1
    d2f1dc1_name = d2f1dc1
    w = mu
  [../]
  [./dcdt]
    type = CoupledTimeDerivative
    variable = mu
    v = c
  [../]
  [./ckernel]
    type = SplitCHWRes
    variable = mu
    mob_name = M
    args = eta
  [../]

  [./ACBulkF]
    type = KKSACBulkF
    variable = eta
    dc1dc_name = dc1dc
    dc2dc_name = dc2dc
    dc1deta_name = dc1deta
    dc2deta_name = dc2deta
    barrier_height = 1 #same as w in AuxKernel
    c1_name = c1
    c2_name = c2
    f1_name = F1
    f2_name = F2
    df1dc1_name = df1dc1
    df2dc2_name = df2dc2
    L_name = L
    w = mu
  [../]
  [./ACBulkC]
    type = KKSACBulkC
    variable = eta
    c1_name = c1
    c2_name = c2
    dc1dc_name = dc1dc
    dc2dc_name = dc2dc
    dc1deta_name = dc1deta
    dc2deta_name = dc2deta
    df1dc1_name = df1dc1
    d2f1dc1_name = d2f1dc1
    w = mu
    L_name = L
  [../]

  [./ACInterface]
    type = ACInterface
    variable = eta
    kappa_name = kappa
  [../]
  [./detadt]
    type = TimeDerivative
    variable = eta
  [../]
[]

[Postprocessors]
  [./post_eta]
    type = ElementIntegralVariablePostprocessor
    variable = eta
    outputs = csv
  [../]
  [./time]
    type = PerfGraphData
    data_type =  TOTAL
    section_name = "Root"
    execute_on = TIMESTEP_END
    outputs = csv
  [../]
  [./DOF]
    type = NumDOFs
    outputs = csv
  [../]
  [./non_iter]
    type = NumNonlinearIterations
    outputs = csv
  [../]
  [./ave_num_iter]
    type = ElementAverageMaterialProperty
    mat_prop = num_iter
    outputs = csv
  [../]
[]

[Executioner]
  type = Transient
  solve_type = NEWTON
  automatic_scaling = true
  compute_scaling_once = false
  nl_abs_tol = 1e-9
  nl_rel_tol = 1e-8
  l_tol = 1e-8
  l_max_its = 50
  nl_max_its = 200
  petsc_options_iname = '-pc_type  -snes_type'
  petsc_options_value = 'lu vinewtonrsls'
  # petsc_options_iname = '-pc_type -pc_factor_mat_solver_package'
  # petsc_options_value = 'lu       superlu_dist'
  dt = 3e-5
  line_search = none
  end_time = 0.00721125
[]

[Preconditioning]
  [./full]
    type = SMP
    full = true
  [../]
[]

[Outputs]
  file_base = old
  exodus = true
  csv = true
[]
