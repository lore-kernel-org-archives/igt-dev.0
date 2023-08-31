Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A763F10E648
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 11:45:24 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.5.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 82C97580ABF
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 04:44:58 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qbg6Z-001vmB-2g
 for igt-dev@lists.freedesktop.org; Thu, 31 Aug 2023 13:44:55 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Aug 2023 13:44:38 +0200
Message-ID: <20230831114454.460399-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/meson.build: only generate
 testlists on native builds
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

cross-compiling will produce binaries that don't run at the
build machine. On such cases, we cannot produce testlist files.

Detect it, to avoid IGT builds to fail on cross builds.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

v2: no changes. Just rebased on the top of upstream/master

 tests/meson.build | 96 +++++++++++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 40 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index c683e468da78..adb178d0bd39 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -370,11 +370,13 @@ foreach prog : test_progs
 	test_executables += testexe
 	test_list += prog
 	name = prog.split('/').get(-1)
-	testlist_files += custom_target(name + '.testlist',
-		     build_by_default : true,
-		     command : [testexe, '--show-testlist'],
-		     capture : true,
-		     output : name + '.testlist')
+	if not meson.is_cross_build()
+		testlist_files += custom_target(name + '.testlist',
+			    build_by_default : true,
+			    command : [testexe, '--show-testlist'],
+			    capture : true,
+			    output : name + '.testlist')
+	endif
 endforeach
 
 foreach prog : i915_progs
@@ -387,11 +389,13 @@ foreach prog : i915_progs
 	test_executables += testexe
 	test_list += prog
 	name = prog.split('/').get(-1)
-	testlist_files += custom_target(name + '.testlist',
-		     build_by_default : true,
-		     command : [testexe, '--show-testlist'],
-		     capture : true,
-		     output : name + '.testlist')
+	if not meson.is_cross_build()
+		testlist_files += custom_target(name + '.testlist',
+			    build_by_default : true,
+			    command : [testexe, '--show-testlist'],
+			    capture : true,
+			    output : name + '.testlist')
+	endif
 endforeach
 
 if build_xe
@@ -405,11 +409,13 @@ if build_xe
 		test_list += prog
 		test_executables += testexe
 		name = prog.split('/').get(-1)
-		testlist_files += custom_target(name + '.testlist',
-			     build_by_default : true,
-			     command : [testexe, '--show-testlist'],
-			     capture : true,
-			     output : name + '.testlist')
+		if not meson.is_cross_build()
+			testlist_files += custom_target(name + '.testlist',
+				    build_by_default : true,
+				    command : [testexe, '--show-testlist'],
+				    capture : true,
+				    output : name + '.testlist')
+		endif
 	endforeach
 	build_info += 'Xe **experimental** tests enabled.'
 endif
@@ -435,11 +441,13 @@ if chamelium.found()
 		test_list += prog
 		test_executables += testexe
 		name = prog.split('/').get(-1)
-		testlist_files += custom_target(name + '.testlist',
-			     build_by_default : true,
-			     command : [testexe, '--show-testlist'],
-			     capture : true,
-			     output : name + '.testlist')
+		if not meson.is_cross_build()
+			testlist_files += custom_target(name + '.testlist',
+				    build_by_default : true,
+				    command : [testexe, '--show-testlist'],
+				    capture : true,
+				    output : name + '.testlist')
+		endif
 	endforeach
 	test_deps += chamelium
 
@@ -452,11 +460,13 @@ if chamelium.found()
 				install : true)
 	test_list += name
 	test_executables += testexe
-	testlist_files += custom_target(name + '.testlist',
-		     build_by_default : true,
-		     command : [testexe, '--show-testlist'],
-		     capture : true,
-		     output : name + '.testlist')
+	if not meson.is_cross_build()
+		testlist_files += custom_target(name + '.testlist',
+			    build_by_default : true,
+			    command : [testexe, '--show-testlist'],
+			    capture : true,
+			    output : name + '.testlist')
+	endif
 endif
 
 subdir('amdgpu')
@@ -468,11 +478,13 @@ subdir('vc4')
 subdir('vmwgfx')
 
 gen_testlist = find_program('generate_testlist.sh')
-test_list_target = custom_target('testlist',
-	      output : 'test-list.txt',
-	      command : [ gen_testlist, '@OUTPUT@', test_list ],
-	      install : true,
-	      install_dir : libexecdir)
+if not meson.is_cross_build()
+	test_list_target = custom_target('testlist',
+		    output : 'test-list.txt',
+		    command : [ gen_testlist, '@OUTPUT@', test_list ],
+		    install : true,
+		    install_dir : libexecdir)
+endif
 
 test_executables += executable('gem_concurrent_all', 'i915/gem_concurrent_all.c',
 	   dependencies : test_deps + [ libatomic ],
@@ -481,11 +493,13 @@ test_executables += executable('gem_concurrent_all', 'i915/gem_concurrent_all.c'
 	   install : true)
 test_list += 'gem_concurrent_all'
 
-test_list_full_target = custom_target('testlist-full',
-	      output : 'test-list-full.txt',
-	      command : [ gen_testlist, '@OUTPUT@', test_list ],
-	      install : true,
-	      install_dir : libexecdir)
+if not meson.is_cross_build()
+	test_list_full_target = custom_target('testlist-full',
+		    output : 'test-list-full.txt',
+		    command : [ gen_testlist, '@OUTPUT@', test_list ],
+		    install : true,
+		    install_dir : libexecdir)
+endif
 
 test_script = find_program('igt_command_line.sh')
 foreach prog : test_list
@@ -497,11 +511,13 @@ testexe = executable('gem_stress', 'i915/gem_stress.c',
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   dependencies : igt_deps)
-testlist_files += custom_target('gem_stress.testlist',
-                build_by_default : true,
-                command : [testexe, '--show-testlist'],
-                capture : true,
-                output : 'gem_stress.testlist')
+if not meson.is_cross_build()
+	testlist_files += custom_target('gem_stress.testlist',
+			build_by_default : true,
+			command : [testexe, '--show-testlist'],
+			capture : true,
+			output : 'gem_stress.testlist')
+endif
 
 image_files = [
   '1080p-left.png',
-- 
2.41.0
