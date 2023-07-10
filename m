Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB3510E241
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 11:54:02 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 235FA580BF0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 04:53:59 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qIpSn-002vvz-0o
 for igt-dev@lists.freedesktop.org; Mon, 10 Jul 2023 13:53:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Jul 2023 13:53:51 +0200
Message-Id: <20230710115354.699245-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 4/7] tests/meson.build: create testlists
 for tests
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

Let's dynamically create testlists for during build time, as this
can speed up a lot the validation check for testplan.

Ideally, all it would need to to that would be to use this
logic at the end of tests/meson.build:

    foreach testexe : test_executables
        prog = testexe.name()

        output = prog.split('/').get(-1) + '.testlist'
        custom_target(output,
                     build_by_default : true,
                     command : [ testexe, '--show-testlist'],
                     capture : true,
                     output : output)

Unfortunately, this requies Meson >= 0.54. So, we need to add
one custom_target per executable() call.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/meson.build |  2 +-
 tests/meson.build         | 55 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index bf73dd32a15f..e838f2eb1540 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -12,7 +12,7 @@ i915_test_config = join_paths(source_root, 'tests', 'i915', 'i915_test_config.js
 
 check_testlist = []
 if build_tests
-	doc_dependencies = test_executables
+	doc_dependencies = testlist_files
 	# Check if documentation matches the actual tests and tests can run
 	if not meson.is_cross_build()
 		build_info += 'Will Check if documentation is in sync with testlist'
diff --git a/tests/meson.build b/tests/meson.build
index 3116c458d60b..897f17ab4561 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -351,35 +351,57 @@ extra_dependencies = {
 
 test_executables = []
 test_list = []
+testlist_files = []
 
 foreach prog : test_progs
-	test_executables += executable(prog, [prog + '.c'] + extra_sources.get(prog, []),
+	testexe = executable(prog, [prog + '.c'] + extra_sources.get(prog, []),
 		   dependencies : test_deps + extra_dependencies.get(prog, []),
 		   install_dir : libexecdir,
 		   install_rpath : libexecdir_rpathdir,
 		   install : true)
+	test_executables += testexe
 	test_list += prog
+	name = prog.split('/').get(-1)
+	testlist_files += custom_target(name + '.testlist',
+		     build_by_default : true,
+		     command : [testexe, '--show-testlist'],
+		     capture : true,
+		     output : name + '.testlist')
 endforeach
 
 foreach prog : i915_progs
-	test_executables += executable(prog,
+	testexe = executable(prog,
 		   [join_paths('i915', prog + '.c')] + extra_sources.get(prog, []),
 		   dependencies : test_deps + extra_dependencies.get(prog, []),
 		   install_dir : libexecdir,
 		   install_rpath : libexecdir_rpathdir,
 		   install : true)
+	test_executables += testexe
 	test_list += prog
+	name = prog.split('/').get(-1)
+	testlist_files += custom_target(name + '.testlist',
+		     build_by_default : true,
+		     command : [testexe, '--show-testlist'],
+		     capture : true,
+		     output : name + '.testlist')
 endforeach
 
 if build_xe
 	foreach prog : xe_progs
-		test_executables += executable(prog,
+		testexe = executable(prog,
 			   [join_paths('xe', prog + '.c')] + extra_sources.get(prog, []),
 			   dependencies : test_deps + extra_dependencies.get(prog, []),
 			   install_dir : libexecdir,
 			   install_rpath : libexecdir_rpathdir,
 			   install : true)
 		test_list += prog
+		test_executables += testexe
+		name = prog.split('/').get(-1)
+		testlist_files += custom_target(name + '.testlist',
+			     build_by_default : true,
+			     command : [testexe, '--show-testlist'],
+			     capture : true,
+			     output : name + '.testlist')
 	endforeach
 	build_info += 'Xe **experimental** tests enabled.'
 endif
@@ -395,7 +417,7 @@ endforeach
 
 if chamelium.found()
 	foreach prog : chamelium_progs
-		test_executables += executable(prog,
+		testexe = executable(prog,
 				 [join_paths('chamelium', prog + '.c'),
 					join_paths('chamelium', 'kms_chamelium_helper.c')],
 				 dependencies : test_deps,
@@ -403,16 +425,30 @@ if chamelium.found()
 				 install_rpath : libexecdir_rpathdir,
 				 install : true)
 		test_list += prog
+		test_executables += testexe
+		name = prog.split('/').get(-1)
+		testlist_files += custom_target(name + '.testlist',
+			     build_by_default : true,
+			     command : [testexe, '--show-testlist'],
+			     capture : true,
+			     output : name + '.testlist')
 	endforeach
 	test_deps += chamelium
 
-	test_executables += executable('kms_chamelium_color',
+	name = 'kms_chamelium_color'
+	testexe = executable('kms_chamelium_color',
 				[ 'chamelium/kms_chamelium_color.c', 'kms_color_helper.c' ],
 				dependencies : test_deps + [ chamelium ],
 				install_dir : libexecdir,
 				install_rpath : libexecdir_rpathdir,
 				install : true)
-	test_list += 'kms_chamelium_color'
+	test_list += name
+	test_executables += testexe
+	testlist_files += custom_target(name + '.testlist',
+		     build_by_default : true,
+		     command : [testexe, '--show-testlist'],
+		     capture : true,
+		     output : name + '.testlist')
 endif
 
 subdir('amdgpu')
@@ -448,11 +484,16 @@ foreach prog : test_list
 	test('testcase check ' + prog, test_script, args : prog)
 endforeach
 
-executable('gem_stress', 'i915/gem_stress.c',
+testexe = executable('gem_stress', 'i915/gem_stress.c',
 	   install : true,
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   dependencies : igt_deps)
+testlist_files += custom_target('gem_stress.testlist',
+                build_by_default : true,
+                command : [testexe, '--show-testlist'],
+                capture : true,
+                output : 'gem_stress.testlist')
 
 image_files = [
   '1080p-left.png',
-- 
2.40.1
