Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B0410E3D9
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:38:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 12:01:24 +0530
Message-Id: <20230523063243.669540-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 03/82] tests/color: Move color helpers to lib
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

The correct place for helpers is lib as the tests directory is
supposed to have test files, also having the helpers in tests
dir will break the compilation of testplan. Hence move all
helpers to library.

Expectation is to have an executable binary for each .c file
the "tests" dir.

V2: - Drop special case compilation method

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 .../igt_color_helper.c                        |  2 +-
 .../igt_color_helper.h                        |  0
 lib/meson.build                               |  1 +
 tests/chamelium/kms_chamelium_color.c         |  2 +-
 tests/kms_color.c                             |  2 +-
 tests/meson.build                             | 20 ++-----------------
 6 files changed, 6 insertions(+), 21 deletions(-)
 rename tests/kms_color_helper.c => lib/igt_color_helper.c (99%)
 rename tests/kms_color_helper.h => lib/igt_color_helper.h (100%)

diff --git a/tests/kms_color_helper.c b/lib/igt_color_helper.c
similarity index 99%
rename from tests/kms_color_helper.c
rename to lib/igt_color_helper.c
index b01c38ef6..87fd096c1 100644
--- a/tests/kms_color_helper.c
+++ b/lib/igt_color_helper.c
@@ -22,7 +22,7 @@
  *
  */
 
-#include "kms_color_helper.h"
+#include "igt_color_helper.h"
 
 bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 {
diff --git a/tests/kms_color_helper.h b/lib/igt_color_helper.h
similarity index 100%
rename from tests/kms_color_helper.h
rename to lib/igt_color_helper.h
diff --git a/lib/meson.build b/lib/meson.build
index 75e52580b..1cc859f17 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -20,6 +20,7 @@ lib_sources = [
 	'igt_chamelium_helper.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
+	'igt_color_helper.c',
 	'igt_crc.c',
 	'igt_debugfs.c',
 	'igt_device.c',
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 26239a6b8..bbb929b64 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -22,7 +22,7 @@
  *
  */
 
-#include "kms_color_helper.h"
+#include "igt_color_helper.h"
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verify instead of CRC");
 
diff --git a/tests/kms_color.c b/tests/kms_color.c
index fdc7120c7..cd2d38329 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -22,7 +22,7 @@
  *
  */
 
-#include "kms_color_helper.h"
+#include "igt_color_helper.h"
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
 
diff --git a/tests/meson.build b/tests/meson.build
index 48e9164f8..1c33e5605 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -21,6 +21,7 @@ test_progs = [
 	'kms_atomic_interruptible',
 	'kms_atomic_transition',
 	'kms_bw',
+	'kms_color',
 	'kms_concurrent',
 	'kms_content_protection',
 	'kms_cursor_crc',
@@ -281,6 +282,7 @@ msm_progs = [
 
 chamelium_progs = [
 	'kms_chamelium_audio',
+	'kms_chamelium_color',
 	'kms_chamelium_edid',
 	'kms_chamelium_frames',
 	'kms_chamelium_hpd',
@@ -471,24 +473,6 @@ executable('testdisplay', ['testdisplay.c', 'testdisplay_hotplug.c'],
 	   install : true)
 test_list += 'testdisplay'
 
-test_executables += executable('kms_color',
-	   [ 'kms_color.c', 'kms_color_helper.c' ],
-	   dependencies : test_deps,
-	   install_dir : libexecdir,
-	   install_rpath : libexecdir_rpathdir,
-	   install : true)
-test_list += 'kms_color'
-
-if chamelium.found()
-       test_executables += executable('kms_chamelium_color',
-                             [ 'chamelium/kms_chamelium_color.c', 'kms_color_helper.c' ],
-                             dependencies : test_deps + [ chamelium ],
-                             install_dir : libexecdir,
-                             install_rpath : libexecdir_rpathdir,
-                             install : true)
-       test_list += 'kms_chamelium_color'
-endif
-
 test_executables += executable('sw_sync', 'sw_sync.c',
 	   dependencies : test_deps + [ libatomic ],
 	   install_dir : libexecdir,
-- 
2.40.0
