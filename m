Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B8BC673F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:22 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:37 +0200
Message-Id: <20220809125037.1231032-19-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 18/19] lib,
 tools: Add the 'graphics' build-time setting
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The graphics=<enabled/disabled> setting decides whenever igt will depend
on cairo and pixman. Disabling those dependencies prevents transitive
dependencies on a large number of graphics-related libraries (X11, etc),
thus allowing igt tools to be installed in compute-only environments.

In practice this works for tools and benchmarks only - tests or overlays
depend on those libraries too much to selectively disable features in
there while keeping it all maintainable.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/igt.h             |  7 +++-
 lib/igt_debugfs.c     |  2 +
 lib/igt_debugfs.h     |  5 ++-
 lib/igt_fb.h          | 10 ++++-
 lib/intel_bufops.c    |  5 +++
 lib/intel_bufops.h    |  2 +
 lib/meson.build       | 18 +++++----
 lib/tests/meson.build |  5 ++-
 meson.build           | 32 ++++++++++-----
 meson_options.txt     |  4 ++
 tools/meson.build     | 93 ++++++++++++++++++++++++-------------------
 11 files changed, 121 insertions(+), 62 deletions(-)

diff --git a/lib/igt.h b/lib/igt.h
index 869515e8..95f60881 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -32,8 +32,6 @@
 #include "igt_debugfs.h"
 #include "igt_draw.h"
 #include "igt_dummyload.h"
-#include "igt_fb.h"
-#include "igt_frame.h"
 #include "igt_gt.h"
 #include "igt_kms.h"
 #include "igt_params.h"
@@ -50,6 +48,11 @@
 #include "i915/gem_mman.h"
 #include "i915/gem_engine_topology.h"
 
+#ifdef HAVE_GRAPHICS
+#include "igt_fb.h"
+#include "igt_frame.h"
+#endif
+
 #ifdef HAVE_CHAMELIUM
 #include "igt_alsa.h"
 #include "igt_audio.h"
diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index ca893c12..b3460327 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -1041,6 +1041,7 @@ igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
 	crc_sanity_checks(pipe_crc, crc);
 }
 
+#ifdef HAVE_GRAPHICS
 /**
  * igt_pipe_crc_get_current:
  * @drm_fd: Pointer to drm fd for vblank counter
@@ -1058,6 +1059,7 @@ igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
 
 	return igt_pipe_crc_get_for_frame(drm_fd, pipe_crc, vblank, crc);
 }
+#endif /* HAVE_GRAPHICS */
 
 /**
  * igt_pipe_crc_collect_crc:
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 37e85067..c7fbf78c 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -119,10 +119,13 @@ int igt_pipe_crc_get_crcs(igt_pipe_crc_t *pipe_crc, int n_crcs,
 			  igt_crc_t **out_crcs);
 void igt_pipe_crc_drain(igt_pipe_crc_t *pipe_crc);
 void igt_pipe_crc_get_single(igt_pipe_crc_t *pipe_crc, igt_crc_t *out_crc);
-void igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_crc_t *crc);
 void igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
 				unsigned int vblank, igt_crc_t *crc);
 
+#ifdef HAVE_GRAPHICS
+void igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_crc_t *crc);
+#endif /* HAVE_GRAPHICS */
+
 void igt_pipe_crc_collect_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out_crc);
 
 void igt_hpd_storm_set_threshold(int fd, unsigned int threshold);
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index b3f096fe..2c48ff4f 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -29,7 +29,10 @@
 #ifndef __IGT_FB_H__
 #define __IGT_FB_H__
 
+#ifdef HAVE_GRAPHICS
 #include <cairo.h>
+#endif
+
 #include <stddef.h>
 #include <stdbool.h>
 #include <drm_fourcc.h>
@@ -90,7 +93,6 @@ typedef struct igt_fb {
 	enum igt_color_range color_range;
 	uint64_t modifier;
 	uint64_t size;
-	cairo_surface_t *cairo_surface;
 	unsigned int domain;
 	unsigned int num_planes;
 	uint32_t strides[4];
@@ -99,6 +101,10 @@ typedef struct igt_fb {
 	unsigned int plane_width[4];
 	unsigned int plane_height[4];
 	void *driver_priv;
+
+#ifdef HAVE_GRAPHICS
+	cairo_surface_t *cairo_surface;
+#endif /* HAVE_GRAPHICS */
 } igt_fb_t;
 
 /**
@@ -184,6 +190,7 @@ bool igt_fb_is_ccs_plane(const struct igt_fb *fb, int plane);
 bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane);
 int igt_fb_ccs_to_main_plane(const struct igt_fb *fb, int ccs_plane);
 
+#ifdef HAVE_GRAPHICS
 /* cairo-based painting */
 cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb);
 cairo_surface_t *igt_cairo_image_surface_create_from_png(const char *filename);
@@ -205,6 +212,7 @@ void igt_paint_image(cairo_t *cr, const char *filename,
 int igt_cairo_printf_line(cairo_t *cr, enum igt_text_align align,
 			       double yspacing, const char *fmt, ...)
 			       __attribute__((format (printf, 4, 5)));
+#endif /* HAVE_GRAPHICS */
 
 /* helpers to handle drm fourcc codes */
 uint32_t igt_bpp_depth_to_drm_format(int bpp, int depth);
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 356ffddf..adbdd04d 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -23,7 +23,10 @@
  */
 
 #include <sys/ioctl.h>
+
+#ifdef HAVE_GRAPHICS
 #include <cairo.h>
+#endif
 
 #include "igt_x86.h"
 #include "intel_bufops.h"
@@ -1208,6 +1211,7 @@ const char *intel_buf_set_name(struct intel_buf *buf, const char *name)
 	return strncpy(buf->name, name, INTEL_BUF_NAME_MAXSIZE);
 }
 
+#ifdef HAVE_GRAPHICS
 static void __intel_buf_write_to_png(struct buf_ops *bops,
 				     struct intel_buf *buf,
 				     const char *filename,
@@ -1250,6 +1254,7 @@ void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename)
 
 	__intel_buf_write_to_png(buf->bops, buf, filename, true);
 }
+#endif /* HAVE_GRAPHICS */
 
 #define DEFAULT_BUFOPS(__gen_start, __gen_end) \
 	.gen_start          = __gen_start, \
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 25b43073..d2b17329 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -187,7 +187,9 @@ void intel_buf_print(const struct intel_buf *buf);
 void intel_buf_dump(const struct intel_buf *buf, const char *filename);
 const char *intel_buf_set_name(struct intel_buf *buf, const char *name);
 
+#ifdef HAVE_GRAPHICS
 void intel_buf_write_to_png(struct intel_buf *buf, const char *filename);
 void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename);
+#endif /* HAVE_GRAPHICS */
 
 #endif
diff --git a/lib/meson.build b/lib/meson.build
index 98c2803b..f9f908aa 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -12,7 +12,6 @@ lib_sources = [
 	'i915/gem_vm.c',
 	'i915/intel_memory_region.c',
 	'i915/intel_mocs.c',
-	'i915/i915_blt.c',
 	'i915/i915_crc.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
@@ -69,10 +68,7 @@ lib_sources = [
 	'intel_aux_pgtable.c',
 	'intel_reg_map.c',
 	'intel_iosf.c',
-	'igt_kms.c',
-	'igt_fb.c',
 	'igt_core.c',
-	'igt_draw.c',
 	'igt_list.c',
 	'igt_map.c',
 	'igt_pm.c',
@@ -93,7 +89,6 @@ lib_sources = [
 ]
 
 lib_deps = [
-	cairo,
 	glib,
 	libatomic,
 	libdrm,
@@ -103,12 +98,21 @@ lib_deps = [
 	libudev,
 	math,
 	pciaccess,
-	pixman,
 	pthreads,
 	realtime,
 	zlib
 ]
 
+if build_graphics
+	lib_deps += [cairo, pixman]
+	lib_sources += [
+		'igt_fb.c',
+		'igt_kms.c',
+		'igt_draw.c',
+		'i915/i915_blt.c',
+	]
+endif
+
 if libdrm_intel.found()
 	lib_deps += libdrm_intel
 else
@@ -146,7 +150,7 @@ if valgrind.found()
 	lib_deps += valgrind
 endif
 
-if gsl.found()
+if gsl.found() and build_graphics
 	lib_deps += gsl
 	lib_sources += [ 'igt_frame.c', 'igt_audio.c' ]
 endif
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index ceaf548b..196699a8 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -6,7 +6,6 @@ lib_tests = [
 	'igt_conflicting_args',
 	'igt_describe',
 	'igt_dynamic_subtests',
-	'igt_edid',
 	'igt_exit_handler',
 	'igt_fork',
 	'igt_fork_helper',
@@ -22,6 +21,10 @@ lib_tests = [
 	'i915_perf_data_alignment',
 ]
 
+if build_graphics
+	lib_tests += 'igt_edid'
+endif
+
 lib_fail_tests = [
 	'igt_no_subtest',
 	'igt_simple_test_subtests',
diff --git a/meson.build b/meson.build
index 3e937f5a..03f46d63 100644
--- a/meson.build
+++ b/meson.build
@@ -82,8 +82,13 @@ endforeach
 build_chamelium = get_option('chamelium')
 build_docs = get_option('docs')
 build_tests = not get_option('tests').disabled()
+build_graphics = not get_option('graphics').disabled()
 with_libdrm = get_option('libdrm_drivers')
 
+if build_tests and not build_graphics
+	error('Building tests without graphics features is not supported')
+endif
+
 build_info = ['Build type: ' + get_option('buildtype')]
 
 inc = include_directories('include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
@@ -127,7 +132,6 @@ libunwind = dependency('libunwind', required : get_option('libunwind'))
 build_info += 'With libunwind: @0@'.format(libunwind.found())
 
 libdw = dependency('libdw', required : true)
-pixman = dependency('pixman-1', required : true)
 
 valgrind = dependency('valgrind', required : get_option('valgrind'))
 if valgrind.found()
@@ -135,7 +139,15 @@ if valgrind.found()
 endif
 build_info += 'Valgrind annotations: @0@'.format(valgrind.found())
 
-cairo = dependency('cairo', version : '>1.12.0', required : true)
+if build_graphics
+	config.set('HAVE_GRAPHICS', 1)
+	cairo = dependency('cairo', version : '>1.12.0', required : true)
+	pixman = dependency('pixman-1', required : true)
+else
+	cairo = disabler()
+	pixman = disabler()
+endif
+
 libudev = dependency('libudev', required : true)
 glib = dependency('glib-2.0', required : true)
 
@@ -331,12 +343,14 @@ foreach str : build_info
 	message(str)
 endforeach
 
-if cairo.version().version_compare('<1.17.2')
-	if pixman.version().version_compare('<0.36.0')
-		warning('Pixman < 0.36.0 found, cannot test HDR formats')
+if build_graphics
+	if cairo.version().version_compare('<1.17.2')
+		if pixman.version().version_compare('<0.36.0')
+			warning('Pixman < 0.36.0 found, cannot test HDR formats')
+		endif
+		warning('Cairo < 1.17.2 found, cannot test HDR formats')
+	elif pixman.version().version_compare('<0.36.0')
+		# Cairo 1.17.2 requires 0.36.0 to compile, but somehow it went missing?
+		error('Cairo with floating point support found, but pixman version too old')
 	endif
-	warning('Cairo < 1.17.2 found, cannot test HDR formats')
-elif pixman.version().version_compare('<0.36.0')
-	# Cairo 1.17.2 requires 0.36.0 to compile, but somehow it went missing?
-	error('Cairo with floating point support found, but pixman version too old')
 endif
diff --git a/meson_options.txt b/meson_options.txt
index bed63efa..84dbe3a6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -34,6 +34,10 @@ option('libdrm_drivers',
        choices : ['', 'auto', 'intel', 'nouveau', 'amdgpu'],
        description : 'libdrm libraries to be used')
 
+option('graphics',
+       type : 'feature',
+       description : 'Enable graphics-dependent features (cairo)')
+
 option('libunwind',
        type : 'feature',
        description : 'Use libunwind')
diff --git a/tools/meson.build b/tools/meson.build
index 24d0ea71..106a7b04 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -16,7 +16,6 @@ tools_progs = [
 	'intel_audio_dump',
 	'intel_backlight',
 	'intel_bios_dumper',
-	'intel_display_crc',
 	'intel_display_poller',
 	'intel_forcewaked',
 	'intel_gpu_frequency',
@@ -28,9 +27,7 @@ tools_progs = [
 	'intel_lid',
 	'intel_opregion_decode',
 	'intel_panel_fitter',
-	'intel_pm_rpm',
 	'intel_reg_checker',
-	'intel_residency',
 	'intel_stepping',
 	'intel_vbt_decode',
 	'intel_watermark',
@@ -39,50 +36,51 @@ tools_progs = [
 	'dpcd_reg',
 	'lsgpu',
 ]
-tool_deps = igt_deps
 
 if libdrm_intel.found()
 	tools_progs += [
 		'intel_dump_decode',
 		'intel_error_decode',
-		'intel_framebuffer_dump',
 		'intel_perf_counters',
 	]
-	tool_deps += zlib
+endif
+
+if libdrm_intel.found() and build_graphics
+	tools_progs += [
+		'intel_pm_rpm',
+		'intel_residency',
+		'intel_display_crc',
+		'intel_framebuffer_dump',
+	]
 endif
 
 foreach prog : tools_progs
 	executable(prog, prog + '.c',
-		   dependencies : tool_deps,
+		   dependencies : igt_deps,
 		   install_rpath : bindir_rpathdir,
 		   install : true)
 endforeach
 
-if libudev.found()
-	intel_dp_compliance_src = [
-		'intel_dp_compliance.c',
-		'igt_dp_compliance_hotplug.c',
-		'igt_compliance_utils.c'
-	]
-	executable('intel_dp_compliance', sources : intel_dp_compliance_src,
-		   dependencies : [tool_deps, libudev],
-		   install_rpath : bindir_rpathdir,
-		   install : true)
-endif
-
-intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
-executable('intel_l3_parity', sources : intel_l3_parity_src,
-	   dependencies : tool_deps,
+executable('intel_l3_parity',
+	   sources : [
+		'intel_l3_parity.c',
+		'intel_l3_udev_listener.c',
+	   ],
+	   dependencies : igt_deps,
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
-intel_reg_src = [ 'intel_reg.c', 'intel_reg_decode.c', 'intel_reg_spec.c' ]
-executable('intel_reg', sources : intel_reg_src,
-	   dependencies : tool_deps,
+executable('intel_reg',
+	   sources : [
+		'intel_reg.c',
+		'intel_reg_decode.c',
+		'intel_reg_spec.c',
+	   ],
+	   dependencies : igt_deps,
 	   install : true,
 	   install_rpath : bindir_rpathdir,
 	   c_args : [
-	     '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
+		'-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	   ])
 
 install_data('intel_gpu_abrt', install_dir : bindir)
@@ -92,23 +90,36 @@ install_subdir('registers', install_dir : datadir)
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_fdinfo,math])
+	   dependencies : [lib_igt_perf, lib_igt_device_scan, lib_igt_drm_fdinfo, math])
 
-executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
-	   dependencies : [tool_deps],
-	   install_rpath : bindir_rpathdir,
-	   install : true)
+if build_graphics
+	executable('amd_hdmi_compliance',
+		   sources : [ 'amd_hdmi_compliance.c' ],
+		   dependencies : [igt_deps],
+		   install_rpath : bindir_rpathdir,
+		   install : true)
+endif
 
-if libudev.found()
-	msm_dp_compliance_src = [
-		'msm_dp_compliance.c',
-		'igt_dp_compliance_hotplug.c',
-		'igt_compliance_utils.c'
-	]
-	executable('msm_dp_compliance', sources : msm_dp_compliance_src,
-			dependencies : [tool_deps, libudev],
-			install_rpath : bindir_rpathdir,
-			install : true)
+if libudev.found() and build_graphics
+	executable('intel_dp_compliance',
+		   sources : [
+			'intel_dp_compliance.c',
+			'igt_dp_compliance_hotplug.c',
+			'igt_compliance_utils.c'
+		   ],
+		   dependencies : [igt_deps, libudev],
+		   install_rpath : bindir_rpathdir,
+		   install : true)
+
+	executable('msm_dp_compliance',
+		   sources : [
+			'msm_dp_compliance.c',
+			'igt_dp_compliance_hotplug.c',
+			'igt_compliance_utils.c'
+		   ],
+		   dependencies : [igt_deps, libudev],
+		   install_rpath : bindir_rpathdir,
+		   install : true)
 endif
 
 subdir('i915-perf')
-- 
2.37.1
