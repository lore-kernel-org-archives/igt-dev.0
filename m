Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0293610E580
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 19:43:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Aug 2023 01:03:27 +0530
Message-Id: <20230802193330.3843896-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
References: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 4/7] tests/meson.build: Simplify builds for
 Chamelium targets
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

Move Chamelium based extra dependencies & source files to
corresponding generic dictionaries.

If we want to change extra source files for any Chamelium
target, we can simply update in the dictionary, no need to
re-wrire the rules.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/meson.build | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index b9f0a9c15..ad2dc8fb9 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -308,6 +308,7 @@ msm_progs = [
 
 chamelium_progs = [
 	'kms_chamelium_audio',
+	'kms_chamelium_color',
 	'kms_chamelium_edid',
 	'kms_chamelium_frames',
 	'kms_chamelium_hpd',
@@ -331,6 +332,11 @@ extra_sources = {
 	'dumb_buffer': ['dumb_buffer.c' ],
 	'testdisplay': [ 'testdisplay_hotplug.c' ],
 	'kms_color':  [ 'kms_color_helper.c' ],
+	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_color':  [ 'kms_color_helper.c' ],
+	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dsc': [ join_paths ('i915', 'kms_dsc_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('i915', 'kms_dsc_helper.c') ],
 }
@@ -423,9 +429,8 @@ endforeach
 if chamelium.found()
 	foreach prog : chamelium_progs
 		testexe = executable(prog,
-				 [join_paths('chamelium', prog + '.c'),
-					join_paths('chamelium', 'kms_chamelium_helper.c')],
-				 dependencies : test_deps,
+				 [join_paths('chamelium', prog + '.c')] + extra_sources.get(prog, []),
+				 dependencies : test_deps + extra_dependencies.get(prog, []),
 				 install_dir : libexecdir,
 				 install_rpath : libexecdir_rpathdir,
 				 install : true)
@@ -439,21 +444,6 @@ if chamelium.found()
 			     output : name + '.testlist')
 	endforeach
 	test_deps += chamelium
-
-	name = 'kms_chamelium_color'
-	testexe = executable('kms_chamelium_color',
-				[ 'chamelium/kms_chamelium_color.c', 'kms_color_helper.c' ],
-				dependencies : test_deps + [ chamelium ],
-				install_dir : libexecdir,
-				install_rpath : libexecdir_rpathdir,
-				install : true)
-	test_list += name
-	test_executables += testexe
-	testlist_files += custom_target(name + '.testlist',
-		     build_by_default : true,
-		     command : [testexe, '--show-testlist'],
-		     capture : true,
-		     output : name + '.testlist')
 endif
 
 subdir('amdgpu')
-- 
2.40.0
