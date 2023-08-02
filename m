Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7DE10E581
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 19:43:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Aug 2023 01:03:29 +0530
Message-Id: <20230802193330.3843896-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
References: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 6/7] tests/meson.build: Split intel targets
 based on their nature
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

Instead of having all intel specific programs in a single list,
split those into multiple lists based on their nature.

Example:
 - intel_agno_progs: List of tests those supports both i915 & xe
 - intel_i915_progs: List of i915 specific tests
 - intel_kms_progs: List of intel specific kms tests
 - intel_xe_progs: List of xe specific tests

As a side effect, this would help if we ever need to add option
to enable/disable i915 and/or kms test builds.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/meson.build | 55 +++++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 31 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index b973af3fe..e02302af3 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -82,8 +82,11 @@ test_progs = [
 	'vgem_slow',
 ]
 
-intel_progs = [
+intel_agno_progs = [
 	'api_intel_allocator',
+]
+
+intel_i915_progs = [
 	'api_intel_bb',
 	'debugfs_test',
 	'drm_fdinfo',
@@ -230,6 +233,18 @@ intel_progs = [
 	'i915_query',
 	'i915_selftest',
 	'i915_suspend',
+	'prime_busy',
+	'prime_mmap',
+	'prime_mmap_coherency',
+	'prime_mmap_kms',
+	'prime_self_import',
+	'sysfs_defaults',
+	'sysfs_heartbeat_interval',
+	'sysfs_preempt_timeout',
+	'sysfs_timeslice_duration',
+]
+
+intel_kms_progs = [
 	'kms_big_fb',
 	'kms_big_joiner' ,
 	'kms_busy',
@@ -251,18 +266,9 @@ intel_progs = [
 	'kms_psr2_su',
 	'kms_psr_stress_test',
 	'kms_pwrite_crc',
-	'prime_busy',
-	'prime_mmap',
-	'prime_mmap_coherency',
-	'prime_mmap_kms',
-	'prime_self_import',
-	'sysfs_defaults',
-	'sysfs_heartbeat_interval',
-	'sysfs_preempt_timeout',
-	'sysfs_timeslice_duration',
 ]
 
-xe_progs = [
+intel_xe_progs = [
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
@@ -380,6 +386,13 @@ foreach prog : test_progs
 		     output : name + '.testlist')
 endforeach
 
+intel_progs = intel_agno_progs
+intel_progs += intel_i915_progs + intel_kms_progs
+if build_xe
+	build_info += 'Xe **experimental** tests enabled.'
+	intel_progs += intel_xe_progs
+endif
+
 foreach prog : intel_progs
 	testexe = executable(prog,
 		   [join_paths('intel', prog + '.c')] + extra_sources.get(prog, []),
@@ -397,26 +410,6 @@ foreach prog : intel_progs
 		     output : name + '.testlist')
 endforeach
 
-if build_xe
-	foreach prog : xe_progs
-		testexe = executable(prog,
-			   [join_paths('intel', prog + '.c')] + extra_sources.get(prog, []),
-			   dependencies : test_deps + extra_dependencies.get(prog, []),
-			   install_dir : libexecdir,
-			   install_rpath : libexecdir_rpathdir,
-			   install : true)
-		test_list += prog
-		test_executables += testexe
-		name = prog.split('/').get(-1)
-		testlist_files += custom_target(name + '.testlist',
-			     build_by_default : true,
-			     command : [testexe, '--show-testlist'],
-			     capture : true,
-			     output : name + '.testlist')
-	endforeach
-	build_info += 'Xe **experimental** tests enabled.'
-endif
-
 foreach prog : msm_progs
 	test_executables += executable(prog, join_paths('msm', prog + '.c'),
 				       dependencies : test_deps,
-- 
2.40.0
