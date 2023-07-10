Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D5A10E2BD
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 17:51:32 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:51:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230710175129.dx6hsrlx2tgvy2sw@kamilkon-desk1>
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
 <20230710115354.699245-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230710115354.699245-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/7] tests/meson.build: Simplify
 builds for core and i915 targets
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-07-10 at 13:53:48 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> There are some tests that either require:
> 	- extra dependencies
> 	- extra source files
> 
> Right now, they have special executable() targets that are handled
> outside the normal way. remove those special targets, converting
> them into simple ones, and using two extra dictionaries to map
> those extra requirements.
> 
> This makes the meson.build file a lot simpler, and makes easier
> to add other rules when creating test lists.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Thank you for making this simpler,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/meson.build | 223 +++++++++++++---------------------------------
>  1 file changed, 61 insertions(+), 162 deletions(-)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index ee066b84900b..3116c458d60b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -3,12 +3,14 @@ test_progs = [
>  	'core_getclient',
>  	'core_getstats',
>  	'core_getversion',
> +	'core_hotunplug',
>  	'core_setmaster',
>  	'core_setmaster_vs_auth',
>  	'debugfs_test',
>  	'dmabuf',
>  	'dmabuf_sync_file',
>  	'device_reset',
> +	'dumb_buffer',
>  	'drm_buddy',
>  	'drm_mm',
>  	'drm_read',
> @@ -21,6 +23,7 @@ test_progs = [
>  	'kms_atomic_interruptible',
>  	'kms_atomic_transition',
>  	'kms_bw',
> +	'kms_color',
>  	'kms_concurrent',
>  	'kms_content_protection',
>  	'kms_cursor_crc',
> @@ -77,7 +80,9 @@ test_progs = [
>  	'syncobj_basic',
>  	'syncobj_wait',
>  	'syncobj_timeline',
> +	'sw_sync',
>  	'template',
> +	'testdisplay',
>  	'tools_test',
>  	'vgem_basic',
>  	'vgem_slow',
> @@ -86,16 +91,19 @@ test_progs = [
>  i915_progs = [
>  	'api_intel_allocator',
>  	'api_intel_bb',
> +	'drm_fdinfo',
>  	'gen3_mixed_blits',
>  	'gen3_render_linear_blits',
>  	'gen3_render_mixed_blits',
>  	'gen3_render_tiledx_blits',
>  	'gen3_render_tiledy_blits',
>  	'gem_bad_reloc',
> +	'gem_barrier_race',
>  	'gem_basic',
>  	'gem_blits',
>  	'gem_busy',
>  	'gem_caching',
> +	'gem_create',
>  	'gem_ccs',
>  	'gem_close',
>  	'gem_close_race',
> @@ -105,16 +113,20 @@ i915_progs = [
>  	'gem_ctx_create',
>  	'gem_ctx_engines',
>  	'gem_ctx_exec',
> +	'gem_ctx_freq',
>  	'gem_ctx_isolation',
>  	'gem_ctx_param',
>  	'gem_ctx_persistence',
>  	'gem_ctx_shared',
> +	'gem_ctx_sseu',
>  	'gem_ctx_switch',
> +	'gem_eio',
>  	'gem_evict_alignment',
>  	'gem_evict_everything',
>  	'gem_exec_alignment',
>  	'gem_exec_async',
>  	'gem_exec_await',
> +	'gem_exec_balancer',
>  	'gem_exec_basic',
>  	'gem_exec_big',
>  	'gem_exec_capture',
> @@ -157,6 +169,7 @@ i915_progs = [
>  	'gem_media_vme',
>  	'gem_mmap',
>  	'gem_mmap_gtt',
> +	'gem_mmap_offset',
>  	'gem_mmap_wc',
>  	'gem_partial_pwrite_pread',
>  	'gem_pipe_control_store_loop',
> @@ -200,6 +213,8 @@ i915_progs = [
>  	'gem_wait',
>  	'gem_watchdog',
>  	'gem_workarounds',
> +	'perf',
> +	'perf_pmu',
>  	'i915_fb_tiling',
>  	'i915_getparams_basic',
>  	'i915_pm_freq_api',
> @@ -209,9 +224,11 @@ i915_progs = [
>  	'i915_pciid',
>  	'i915_pipe_stress',
>  	'i915_pm_backlight',
> +	'i915_pm_freq_mult',
>  	'i915_pm_lpsp',
>  	'i915_pm_rpm',
>  	'i915_pm_dc',
> +	'i915_pm_rc6_residency',
>  	'i915_pm_rps',
>  	'i915_pm_sseu',
>  	'i915_power',
> @@ -224,6 +241,7 @@ i915_progs = [
>  	'kms_ccs',
>  	'kms_cdclk',
>  	'kms_draw_crc',
> +	'kms_dsc',
>  	'kms_fb_coherency',
>  	'kms_fbcon_fbt',
>  	'kms_fence_pin_leak',
> @@ -234,6 +252,7 @@ i915_progs = [
>  	'kms_mmap_write_crc',
>  	'kms_pipe_b_c_ivb',
>  	'kms_psr',
> +	'kms_psr2_sf',
>  	'kms_psr2_su',
>  	'kms_psr_stress_test',
>  	'kms_pwrite_crc',
> @@ -301,12 +320,41 @@ if libdrm_nouveau.found()
>  	test_deps += libdrm_nouveau
>  endif
>  
> +# Extra sources used on core and Intel drivers
> +extra_sources = {
> +	'core_hotunplug': [ 'core_hotunplug.c' ],
> +	'dumb_buffer': ['dumb_buffer.c' ],
> +	'testdisplay': [ 'testdisplay_hotplug.c' ],
> +	'kms_color':  [ 'kms_color_helper.c' ],
> +	'kms_dsc': [ join_paths ('i915', 'kms_dsc_helper.c') ],
> +	'kms_psr2_sf':  [ join_paths ('i915', 'kms_dsc_helper.c') ],
> +}
> +
> +# Extra dependencies used on core and Intel drivers
> +extra_dependencies = {
> +	'core_hotunplug': [ lib_igt_i915_perf ],
> +	'drm_fdinfo': [ lib_igt_drm_fdinfo ],
> +	'dumb_buffer':  [ libatomic ],
> +	'gem_barrier_race': [ lib_igt_i915_perf ],
> +	'gem_create': [ libatomic ],
> +	'gem_ctx_freq': [ lib_igt_perf ],
> +	'gem_ctx_sseu': [ lib_igt_perf ],
> +	'gem_eio': [ realtime ],
> +	'gem_exec_balancer': [ lib_igt_perf ],
> +	'gem_mmap_offset': [ libatomic ],
> +	'i915_pm_freq_mult': [ lib_igt_perf ],
> +	'i915_pm_rc6_residency': [ lib_igt_perf ],
> +	'perf': [ lib_igt_i915_perf ],
> +	'perf_pmu':  [ lib_igt_perf ],
> +	'sw_sync': [ libatomic ],
> +}
> +
>  test_executables = []
>  test_list = []
>  
>  foreach prog : test_progs
> -	test_executables += executable(prog, prog + '.c',
> -		   dependencies : test_deps,
> +	test_executables += executable(prog, [prog + '.c'] + extra_sources.get(prog, []),
> +		   dependencies : test_deps + extra_dependencies.get(prog, []),
>  		   install_dir : libexecdir,
>  		   install_rpath : libexecdir_rpathdir,
>  		   install : true)
> @@ -315,8 +363,8 @@ endforeach
>  
>  foreach prog : i915_progs
>  	test_executables += executable(prog,
> -		   join_paths('i915', prog + '.c'),
> -		   dependencies : test_deps,
> +		   [join_paths('i915', prog + '.c')] + extra_sources.get(prog, []),
> +		   dependencies : test_deps + extra_dependencies.get(prog, []),
>  		   install_dir : libexecdir,
>  		   install_rpath : libexecdir_rpathdir,
>  		   install : true)
> @@ -326,8 +374,8 @@ endforeach
>  if build_xe
>  	foreach prog : xe_progs
>  		test_executables += executable(prog,
> -			   join_paths('xe', prog + '.c'),
> -			   dependencies : test_deps,
> +			   [join_paths('xe', prog + '.c')] + extra_sources.get(prog, []),
> +			   dependencies : test_deps + extra_dependencies.get(prog, []),
>  			   install_dir : libexecdir,
>  			   install_rpath : libexecdir_rpathdir,
>  			   install : true)
> @@ -357,165 +405,16 @@ if chamelium.found()
>  		test_list += prog
>  	endforeach
>  	test_deps += chamelium
> -endif
> -
> -test_executables += executable('drm_fdinfo',
> -	   join_paths('i915', 'drm_fdinfo.c'),
> -	   dependencies : test_deps + [ lib_igt_drm_fdinfo ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'drm_fdinfo'
> -
> -test_executables += executable('dumb_buffer', 'dumb_buffer.c',
> -	   dependencies : test_deps + [ libatomic ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'dumb_buffer'
> -
> -test_executables += executable('gem_create',
> -	   join_paths('i915', 'gem_create.c'),
> -	   dependencies : test_deps + [ libatomic ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'gem_create'
> -
> -test_executables += executable('gem_ctx_freq',
> -	   join_paths('i915', 'gem_ctx_freq.c'),
> -	   dependencies : test_deps + [ lib_igt_perf ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'gem_ctx_freq'
> -
> -test_executables += executable('gem_ctx_sseu',
> -	   join_paths('i915', 'gem_ctx_sseu.c'),
> -	   dependencies : test_deps + [ lib_igt_perf ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'gem_ctx_sseu'
> -
> -test_executables += executable('gem_eio',
> -	   join_paths('i915', 'gem_eio.c'),
> -	   dependencies : test_deps + [ realtime ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'gem_eio'
> -
> -test_executables += executable('gem_exec_balancer', 'i915/gem_exec_balancer.c',
> -	   dependencies : test_deps + [ lib_igt_perf ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'gem_exec_balancer'
> -
> -test_executables += executable('gem_mmap_offset',
> -	   join_paths('i915', 'gem_mmap_offset.c'),
> -	   dependencies : test_deps + [ libatomic ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'gem_mmap_offset'
> -
> -test_executables += executable('i915_pm_freq_mult',
> -	   join_paths('i915', 'i915_pm_freq_mult.c'),
> -	   dependencies : test_deps + [ lib_igt_perf ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'i915_pm_freq_mult'
>  
> -test_executables += executable('i915_pm_rc6_residency',
> -	   join_paths('i915', 'i915_pm_rc6_residency.c'),
> -	   dependencies : test_deps + [ lib_igt_perf ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'i915_pm_rc6_residency'
> -
> -test_executables += executable('gem_barrier_race',
> -	   join_paths('i915', 'gem_barrier_race.c'),
> -	   dependencies : test_deps + [ lib_igt_i915_perf ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'gem_barrier_race'
> -
> -test_executables += executable('perf_pmu',
> -	   join_paths('i915', 'perf_pmu.c'),
> -	   dependencies : test_deps + [ lib_igt_perf ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'perf_pmu'
> -
> -test_executables += executable('perf',
> -	   join_paths('i915', 'perf.c'),
> -	   dependencies : test_deps + [ lib_igt_i915_perf ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'perf'
> -
> -test_executables += executable('core_hotunplug', 'core_hotunplug.c',
> -	   dependencies : test_deps + [ lib_igt_i915_perf ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'core_hotunplug'
> -
> -executable('testdisplay', ['testdisplay.c', 'testdisplay_hotplug.c'],
> -	   dependencies : test_deps,
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'testdisplay'
> -
> -test_executables += executable('kms_color',
> -	   [ 'kms_color.c', 'kms_color_helper.c' ],
> -	   dependencies : test_deps,
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'kms_color'
> -
> -test_executables += executable('kms_dsc',
> -	   [ join_paths('i915', 'kms_dsc.c'), join_paths ('i915', 'kms_dsc_helper.c')],
> -	   dependencies : test_deps,
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'kms_dsc'
> -
> -test_executables += executable('kms_psr2_sf',
> -	   [ join_paths('i915', 'kms_psr2_sf.c'), join_paths ('i915', 'kms_dsc_helper.c')],
> -	   dependencies : test_deps,
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'kms_psr2_sf'
> -
> -if chamelium.found()
> -       test_executables += executable('kms_chamelium_color',
> -                             [ 'chamelium/kms_chamelium_color.c', 'kms_color_helper.c' ],
> -                             dependencies : test_deps + [ chamelium ],
> -                             install_dir : libexecdir,
> -                             install_rpath : libexecdir_rpathdir,
> -                             install : true)
> -       test_list += 'kms_chamelium_color'
> +	test_executables += executable('kms_chamelium_color',
> +				[ 'chamelium/kms_chamelium_color.c', 'kms_color_helper.c' ],
> +				dependencies : test_deps + [ chamelium ],
> +				install_dir : libexecdir,
> +				install_rpath : libexecdir_rpathdir,
> +				install : true)
> +	test_list += 'kms_chamelium_color'
>  endif
>  
> -test_executables += executable('sw_sync', 'sw_sync.c',
> -	   dependencies : test_deps + [ libatomic ],
> -	   install_dir : libexecdir,
> -	   install_rpath : libexecdir_rpathdir,
> -	   install : true)
> -test_list += 'sw_sync'
> -
>  subdir('amdgpu')
>  
>  subdir('v3d')
> -- 
> 2.40.1
> 

