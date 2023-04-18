Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6803C10E824
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:50:19 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 22:15:00 +0530
Message-Id: <20230418164501.1687266-45-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 44/45] tests/kms: Move intel specific kms tests to
 new dir
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

Move all kms tests those supports both i915 & XE to new dir
called tests/intel.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/{i915 => intel}/kms_big_fb.c          |  0
 tests/{i915 => intel}/kms_big_joiner.c      |  0
 tests/{i915 => intel}/kms_cdclk.c           |  0
 tests/{i915 => intel}/kms_draw_crc.c        |  0
 tests/{i915 => intel}/kms_dsc.c             |  0
 tests/{i915 => intel}/kms_dsc_helper.c      |  0
 tests/{i915 => intel}/kms_dsc_helper.h      |  0
 tests/{i915 => intel}/kms_flip_scaled_crc.c |  0
 tests/{i915 => intel}/kms_flip_tiling.c     |  0
 tests/{i915 => intel}/kms_mmap_write_crc.c  |  0
 tests/{i915 => intel}/kms_psr.c             |  0
 tests/{i915 => intel}/kms_psr2_sf.c         |  0
 tests/{i915 => intel}/kms_psr2_su.c         |  0
 tests/{i915 => intel}/kms_psr_stress_test.c |  0
 tests/meson.build                           | 37 ++++++++++++++-------
 15 files changed, 25 insertions(+), 12 deletions(-)
 rename tests/{i915 => intel}/kms_big_fb.c (100%)
 rename tests/{i915 => intel}/kms_big_joiner.c (100%)
 rename tests/{i915 => intel}/kms_cdclk.c (100%)
 rename tests/{i915 => intel}/kms_draw_crc.c (100%)
 rename tests/{i915 => intel}/kms_dsc.c (100%)
 rename tests/{i915 => intel}/kms_dsc_helper.c (100%)
 rename tests/{i915 => intel}/kms_dsc_helper.h (100%)
 rename tests/{i915 => intel}/kms_flip_scaled_crc.c (100%)
 rename tests/{i915 => intel}/kms_flip_tiling.c (100%)
 rename tests/{i915 => intel}/kms_mmap_write_crc.c (100%)
 rename tests/{i915 => intel}/kms_psr.c (100%)
 rename tests/{i915 => intel}/kms_psr2_sf.c (100%)
 rename tests/{i915 => intel}/kms_psr2_su.c (100%)
 rename tests/{i915 => intel}/kms_psr_stress_test.c (100%)

diff --git a/tests/i915/kms_big_fb.c b/tests/intel/kms_big_fb.c
similarity index 100%
rename from tests/i915/kms_big_fb.c
rename to tests/intel/kms_big_fb.c
diff --git a/tests/i915/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
similarity index 100%
rename from tests/i915/kms_big_joiner.c
rename to tests/intel/kms_big_joiner.c
diff --git a/tests/i915/kms_cdclk.c b/tests/intel/kms_cdclk.c
similarity index 100%
rename from tests/i915/kms_cdclk.c
rename to tests/intel/kms_cdclk.c
diff --git a/tests/i915/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
similarity index 100%
rename from tests/i915/kms_draw_crc.c
rename to tests/intel/kms_draw_crc.c
diff --git a/tests/i915/kms_dsc.c b/tests/intel/kms_dsc.c
similarity index 100%
rename from tests/i915/kms_dsc.c
rename to tests/intel/kms_dsc.c
diff --git a/tests/i915/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
similarity index 100%
rename from tests/i915/kms_dsc_helper.c
rename to tests/intel/kms_dsc_helper.c
diff --git a/tests/i915/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
similarity index 100%
rename from tests/i915/kms_dsc_helper.h
rename to tests/intel/kms_dsc_helper.h
diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
similarity index 100%
rename from tests/i915/kms_flip_scaled_crc.c
rename to tests/intel/kms_flip_scaled_crc.c
diff --git a/tests/i915/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
similarity index 100%
rename from tests/i915/kms_flip_tiling.c
rename to tests/intel/kms_flip_tiling.c
diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
similarity index 100%
rename from tests/i915/kms_mmap_write_crc.c
rename to tests/intel/kms_mmap_write_crc.c
diff --git a/tests/i915/kms_psr.c b/tests/intel/kms_psr.c
similarity index 100%
rename from tests/i915/kms_psr.c
rename to tests/intel/kms_psr.c
diff --git a/tests/i915/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
similarity index 100%
rename from tests/i915/kms_psr2_sf.c
rename to tests/intel/kms_psr2_sf.c
diff --git a/tests/i915/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
similarity index 100%
rename from tests/i915/kms_psr2_su.c
rename to tests/intel/kms_psr2_su.c
diff --git a/tests/i915/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
similarity index 100%
rename from tests/i915/kms_psr_stress_test.c
rename to tests/intel/kms_psr_stress_test.c
diff --git a/tests/meson.build b/tests/meson.build
index a6642b9dc..75fdda84a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -217,23 +217,13 @@ i915_progs = [
 	'i915_query',
 	'i915_selftest',
 	'i915_suspend',
-	'kms_big_fb',
-	'kms_big_joiner' ,
 	'kms_busy',
 	'kms_ccs',
-	'kms_cdclk',
-	'kms_draw_crc',
 	'kms_fbcon_fbt',
 	'kms_fence_pin_leak',
-	'kms_flip_scaled_crc',
-	'kms_flip_tiling',
 	'kms_frontbuffer_tracking',
 	'kms_legacy_colorkey',
-	'kms_mmap_write_crc',
 	'kms_pipe_b_c_ivb',
-	'kms_psr',
-	'kms_psr2_su',
-	'kms_psr_stress_test',
 	'kms_pwrite_crc',
 	'sysfs_defaults',
 	'sysfs_heartbeat_interval',
@@ -241,6 +231,19 @@ i915_progs = [
 	'sysfs_timeslice_duration',
 ]
 
+intel_progs = [
+	'kms_big_fb',
+	'kms_big_joiner' ,
+	'kms_cdclk',
+	'kms_draw_crc',
+	'kms_flip_scaled_crc',
+	'kms_flip_tiling',
+	'kms_mmap_write_crc',
+	'kms_psr',
+	'kms_psr2_su',
+	'kms_psr_stress_test',
+]
+
 xe_progs = [
 	'xe_create',
 	'xe_compute',
@@ -316,6 +319,16 @@ foreach prog : i915_progs
 	test_list += prog
 endforeach
 
+foreach prog : intel_progs
+	test_executables += executable(prog,
+		   join_paths('intel', prog + '.c'),
+		   dependencies : test_deps,
+		   install_dir : libexecdir,
+		   install_rpath : libexecdir_rpathdir,
+		   install : true)
+	test_list += prog
+endforeach
+
 foreach prog : xe_progs
 	test_executables += executable(prog,
 		   join_paths('xe', prog + '.c'),
@@ -474,7 +487,7 @@ test_executables += executable('kms_color',
 test_list += 'kms_color'
 
 test_executables += executable('kms_dsc',
-	   [ join_paths('i915', 'kms_dsc.c'), join_paths ('i915', 'kms_dsc_helper.c')],
+	   [ join_paths('intel', 'kms_dsc.c'), join_paths ('intel', 'kms_dsc_helper.c')],
 	   dependencies : test_deps,
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
@@ -482,7 +495,7 @@ test_executables += executable('kms_dsc',
 test_list += 'kms_dsc'
 
 test_executables += executable('kms_psr2_sf',
-	   [ join_paths('i915', 'kms_psr2_sf.c'), join_paths ('i915', 'kms_dsc_helper.c')],
+	   [ join_paths('intel', 'kms_psr2_sf.c'), join_paths ('intel', 'kms_dsc_helper.c')],
 	   dependencies : test_deps,
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
-- 
2.40.0
