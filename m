Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDE710E397
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 15:29:09 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0F30E580D3A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 08:28:56 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qH4R3-001vyM-2c
 for igt-dev@lists.freedesktop.org; Wed, 05 Jul 2023 17:28:53 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Jul 2023 17:28:49 +0200
Message-Id: <20230705152850.461010-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230705152850.461010-1-mauro.chehab@linux.intel.com>
References: <20230705152850.461010-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] tests/meson.build: add gem_stress to
 the test_list logic
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

This test seems to be somewhat abandoned at the build system,
as it was not used to update the test lists and their dependencies.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/meson.build | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index 246a585aa423..7620bd3598f0 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -516,6 +516,13 @@ test_executables += executable('sw_sync', 'sw_sync.c',
 	   install : true)
 test_list += 'sw_sync'
 
+test_executables += executable('gem_stress', 'i915/gem_stress.c',
+	   install : true,
+	   install_dir : libexecdir,
+	   install_rpath : libexecdir_rpathdir,
+	   dependencies : igt_deps)
+test_list += 'gem_stress'
+
 subdir('amdgpu')
 
 subdir('v3d')
@@ -559,12 +566,6 @@ foreach testexe : test_executables
 	test('testcase check ' + prog, test_script, args : prog)
 endforeach
 
-executable('gem_stress', 'i915/gem_stress.c',
-	   install : true,
-	   install_dir : libexecdir,
-	   install_rpath : libexecdir_rpathdir,
-	   dependencies : igt_deps)
-
 image_files = [
   '1080p-left.png',
   '1080p-right.png',
-- 
2.40.1
