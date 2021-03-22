Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C656E079
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 19:30:48 +0000 (UTC)
From: Arkadiusz Hiler <arek@hiler.eu>
Date: Mon, 22 Mar 2021 20:47:23 +0200
Message-Id: <20210322184723.124410-1-arek@hiler.eu>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] meson: Drop ':' in test names
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Since meson 0.56 colons are used to filter tests by subproject, and if
we use them in test names we get:

  DEPRECATION: ":" is not allowed in test name

Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
---
 assembler/meson.build | 2 +-
 lib/tests/meson.build | 4 ++--
 tests/meson.build     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/assembler/meson.build b/assembler/meson.build
index 68e6a920..3fdeda22 100644
--- a/assembler/meson.build
+++ b/assembler/meson.build
@@ -97,7 +97,7 @@ gen4asm_testcases_broken = [
 
 test_runner = find_program('test/run-test.sh')
 foreach testcase : gen4asm_testcases
-	test('assembler: ' + testcase, test_runner,
+	test('assembler ' + testcase, test_runner,
 			args : testcase,
 			env : [ 'srcdir=' + meson.current_source_dir(),
 				'top_builddir=' + meson.current_build_dir()])
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index 9cf5ff47..ceaf548b 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -38,11 +38,11 @@ endif
 foreach lib_test : lib_tests
 	exec = executable(lib_test, lib_test + '.c', install : false,
 			dependencies : igt_deps)
-	test('lib: ' + lib_test, exec)
+	test('lib ' + lib_test, exec)
 endforeach
 
 foreach lib_test : lib_fail_tests
 	exec = executable(lib_test, lib_test + '.c', install : false,
 			dependencies : igt_deps)
-	test('lib: ' + lib_test, exec, should_fail : true)
+	test('lib ' + lib_test, exec, should_fail : true)
 endforeach
diff --git a/tests/meson.build b/tests/meson.build
index 825e0183..54a1a3c7 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -404,7 +404,7 @@ test_list_target = custom_target('testlist',
 
 test_script = find_program('igt_command_line.sh')
 foreach prog : test_list
-	test('testcase check: ' + prog, test_script, args : prog)
+	test('testcase check ' + prog, test_script, args : prog)
 endforeach
 
 executable('gem_stress', 'i915/gem_stress.c',
-- 
2.31.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
