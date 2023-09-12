Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1468A10E3DC
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 10:30:28 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.24.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2C1D0580BF0
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 03:30:16 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qg0es-000MvU-0U
 for igt-dev@lists.freedesktop.org; Tue, 12 Sep 2023 12:30:14 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 12:30:11 +0200
Message-ID: <20230912103011.88118-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] [RFC] tests/meson.build: add gem_stress to
 test-list.txt
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Currently, gem_stress is a special case: while it is built,
igt_runner won't run it, as it doesn't belong to test-list.txt,
as it is not added to the list of executables, so the script
which generates test-list.txt silently ignores it.

Fix it by moving it to the list of tests that run on i915.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/meson.build | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index 92729e0c3c26..24b196037dd9 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -193,6 +193,7 @@ intel_i915_progs = [
 	'gem_shrink',
 	'gem_softpin',
 	'gem_spin_batch',
+	'gem_stress',
 	'gem_streaming_writes',
 	'gem_sync',
 	'gem_tiled_blits',
@@ -485,19 +486,6 @@ foreach prog : test_list
 	test('testcase check ' + prog, test_script, args : prog)
 endforeach
 
-testexe = executable('gem_stress', 'intel/gem_stress.c',
-	   install : true,
-	   install_dir : libexecdir,
-	   install_rpath : libexecdir_rpathdir,
-	   dependencies : igt_deps)
-if not meson.is_cross_build()
-	testlist_files += custom_target('gem_stress.testlist',
-			build_by_default : true,
-			command : [testexe, '--show-testlist'],
-			capture : true,
-			output : 'gem_stress.testlist')
-endif
-
 image_files = [
   '1080p-left.png',
   '1080p-right.png',
-- 
2.41.0
