Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECAF10E435
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 15:06:47 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D41D0580DAB
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 08:06:45 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qHQZ9-002SAD-1g
 for igt-dev@lists.freedesktop.org; Thu, 06 Jul 2023 17:06:43 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:06:37 +0200
Message-Id: <20230706150638.581415-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230706150638.581415-1-mauro.chehab@linux.intel.com>
References: <20230706150638.581415-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 4/5] tests/meson.build: create testlists
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
 tests/meson.build | 54 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 7 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index 3116c458d60b..6fe5d863c70a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -353,33 +353,54 @@ test_executables = []
 test_list = []
 
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
+	custom_target(name + '.testlist',
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
+	custom_target(name + '.testlist',
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
+		custom_target(name + '.testlist',
+			     build_by_default : true,
+			     command : [testexe, '--show-testlist'],
+			     capture : true,
+			     output : name + '.testlist')
 	endforeach
 	build_info += 'Xe **experimental** tests enabled.'
 endif
@@ -395,7 +416,7 @@ endforeach
 
 if chamelium.found()
 	foreach prog : chamelium_progs
-		test_executables += executable(prog,
+		testexe = executable(prog,
 				 [join_paths('chamelium', prog + '.c'),
 					join_paths('chamelium', 'kms_chamelium_helper.c')],
 				 dependencies : test_deps,
@@ -403,16 +424,30 @@ if chamelium.found()
 				 install_rpath : libexecdir_rpathdir,
 				 install : true)
 		test_list += prog
+		test_executables += testexe
+		name = prog.split('/').get(-1)
+		custom_target(name + '.testlist',
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
+	custom_target(name + '.testlist',
+		     build_by_default : true,
+		     command : [testexe, '--show-testlist'],
+		     capture : true,
+		     output : name + '.testlist')
 endif
 
 subdir('amdgpu')
@@ -448,11 +483,16 @@ foreach prog : test_list
 	test('testcase check ' + prog, test_script, args : prog)
 endforeach
 
-executable('gem_stress', 'i915/gem_stress.c',
+testexe = executable('gem_stress', 'i915/gem_stress.c',
 	   install : true,
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   dependencies : igt_deps)
+custom_target('gem_stress.testlist',
+                build_by_default : true,
+                command : [testexe, '--show-testlist'],
+                capture : true,
+                output : 'gem_stress.testlist')
 
 image_files = [
   '1080p-left.png',
-- 
2.40.1
