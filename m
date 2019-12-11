Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14DB6EA33
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:59 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:34 -0800
Message-Id: <20191211005235.67897-29-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 28/29] build: Add support for building on
 non-Linux
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This makes libkmod and libprocps dependencies option on non-Linux
platforms and skips building tests which depend on Linux-specific
functionality.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 benchmarks/meson.build |  7 ++++++-
 meson.build            |  4 ++--
 tests/meson.build      | 30 ++++++++++++++++++++----------
 tools/meson.build      | 12 +++++++-----
 4 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index 397f3b8d..d6e05697 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -11,12 +11,17 @@ benchmark_progs = [
 	'gem_mmap',
 	'gem_prw',
 	'gem_set_domain',
-	'gem_syslatency',
 	'kms_vblank',
 	'prime_lookup',
 	'vgem_mmap',
 ]
 
+if host_machine.system() == 'linux'
+	benchmark_progs += [
+		'gem_syslatency',
+	]
+endif
+
 if libdrm_intel.found()
 	benchmark_progs += [
 		'intel_upload_blit_large',
diff --git a/meson.build b/meson.build
index ffe9ae1f..409f35f5 100644
--- a/meson.build
+++ b/meson.build
@@ -122,8 +122,8 @@ endif
 build_info += 'With libdrm: ' + ','.join(libdrm_info)
 
 pciaccess = dependency('pciaccess', version : '>=0.10')
-libkmod = dependency('libkmod')
-libprocps = dependency('libprocps', required : true)
+libkmod = dependency('libkmod', required : host_machine.system() == 'linux')
+libprocps = dependency('libprocps', required : host_machine.system() == 'linux')
 
 libunwind = dependency('libunwind', required : get_option('libunwind'))
 build_info += 'With libunwind: @0@'.format(libunwind.found())
diff --git a/tests/meson.build b/tests/meson.build
index d931cc37..35b75484 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -9,7 +9,6 @@ test_progs = [
 	'drm_import_export',
 	'drm_mm',
 	'drm_read',
-	'fbdev',
 	'kms_3d',
 	'kms_addfb_basic',
 	'kms_atomic',
@@ -21,11 +20,9 @@ test_progs = [
 	'kms_ccs',
 	'kms_color',
 	'kms_concurrent',
-	'kms_content_protection',
 	'kms_crtc_background_color',
 	'kms_cursor_crc',
 	'kms_cursor_edge_walk',
-	'kms_cursor_legacy',
 	'kms_dp_aux_dev',
 	'kms_dp_dsc',
 	'kms_dp_tiled_display',
@@ -56,7 +53,6 @@ test_progs = [
 	'kms_prop_blob',
 	'kms_properties',
 	'kms_psr',
-	'kms_psr2_su',
 	'kms_pwrite_crc',
 	'kms_rmfb',
 	'kms_rotation_crc',
@@ -84,7 +80,6 @@ test_progs = [
 	'syncobj_basic',
 	'syncobj_wait',
 	'template',
-	'tools_test',
 	'v3d_get_bo_offset',
 	'v3d_get_param',
 	'v3d_mmap',
@@ -100,6 +95,16 @@ test_progs = [
 	'vgem_slow',
 ]
 
+if host_machine.system() == 'linux'
+	test_progs += [
+		'fbdev',
+		'kms_content_protection',
+		'kms_cursor_legacy',
+		'kms_psr2_su',
+		'tools_test',
+	]
+endif
+
 i915_progs = [
 	'gen3_mixed_blits',
 	'gen3_render_linear_blits',
@@ -151,7 +156,6 @@ i915_progs = [
 	'gem_exec_parse_blt',
 	'gem_exec_reloc',
 	'gem_exec_reuse',
-	'gem_exec_schedule',
 	'gem_exec_store',
 	'gem_exec_suspend',
 	'gem_exec_whisper',
@@ -172,7 +176,6 @@ i915_progs = [
 	'gem_media_fill',
 	'gem_media_vme',
 	'gem_mmap',
-	'gem_mmap_gtt',
 	'gem_mmap_offset_exhaustion',
 	'gem_mmap_wc',
 	'gem_partial_pwrite_pread',
@@ -221,7 +224,6 @@ i915_progs = [
 	'gem_tiling_max_stride',
 	'gem_unfence_active_buffers',
 	'gem_unref_active_buffers',
-	'gem_userptr_blits',
 	'gem_vm_create',
 	'gem_wait',
 	'gem_workarounds',
@@ -229,11 +231,9 @@ i915_progs = [
 	'i915_fb_tiling',
 	'i915_getparams_basic',
 	'i915_hangman',
-	'i915_module_load',
 	'i915_pm_backlight',
 	'i915_pm_lpsp',
 	'i915_pm_rc6_residency',
-	'i915_pm_rpm',
 	'i915_pm_dc',
 	'i915_pm_rps',
 	'i915_pm_sseu',
@@ -242,6 +242,16 @@ i915_progs = [
 	'i915_suspend',
 ]
 
+if host_machine.system() == 'linux'
+	i915_progs += [
+		'gem_exec_schedule',
+		'gem_mmap_gtt',
+		'gem_userptr_blits',
+		'i915_module_load',
+		'i915_pm_rpm',
+	]
+endif
+
 test_deps = [ igt_deps ]
 
 if libdrm_nouveau.found()
diff --git a/tools/meson.build b/tools/meson.build
index 74822a33..25233478 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -90,11 +90,13 @@ install_subdir('registers', install_dir : datadir,
 		 'Makefile', 'Makefile.in', 'Makefile.am',
 	       ])
 
-shared_library('intel_aubdump', 'aubdump.c',
-	       dependencies : [ lib_igt_chipset, dlsym ],
-	       name_prefix : '',
-	       install : true,
-	       soversion : '0')
+if host_machine.system() == 'linux'
+	shared_library('intel_aubdump', 'aubdump.c',
+		       dependencies : [ lib_igt_chipset, dlsym ],
+		       name_prefix : '',
+		       install : true,
+		       soversion : '0')
+endif
 
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
