Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7221B6ED6F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 12:52:16 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 20 Feb 2020 14:52:06 +0200
Message-Id: <20200220125207.16423-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Update selftests to use dynamic
 subtests
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
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Use the new igt_subtest_with_dynamic to nicely group the dynamic
subtests together.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
Acked-by: Petri Latvala <petri.latvala@intel.com>
Acked-by: Tomi Sarvela <tomi.p.sarvela@intel.com>
---
 lib/igt_kmod.c            | 23 +++++++++++++++++++----
 tests/igt_command_line.sh |  9 ++-------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 05019c24..e701545d 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -21,6 +21,7 @@
  * IN THE SOFTWARE.
  */
 
+#include <ctype.h>
 #include <signal.h>
 #include <errno.h>
 
@@ -602,6 +603,18 @@ void igt_kselftest_fini(struct igt_kselftest *tst)
 	kmod_module_unref(tst->kmod);
 }
 
+static const char *unfilter(const char *filter, const char *name)
+{
+	if (!filter)
+		return name;
+
+	name += strlen(filter);
+	if (!isalpha(*name))
+		name++;
+
+	return name;
+}
+
 void igt_kselftests(const char *module_name,
 		    const char *options,
 		    const char *result,
@@ -618,10 +631,12 @@ void igt_kselftests(const char *module_name,
 		igt_require(igt_kselftest_begin(&tst) == 0);
 
 	igt_kselftest_get_tests(tst.kmod, filter, &tests);
-	igt_list_for_each_entry_safe(tl, tn, &tests, link) {
-		igt_subtest_f("%s", tl->name)
-			igt_kselftest_execute(&tst, tl, options, result);
-		free(tl);
+	igt_subtest_with_dynamic(filter ?: "all") {
+		igt_list_for_each_entry_safe(tl, tn, &tests, link) {
+			igt_dynamic_f("%s", unfilter(filter, tl->name))
+				igt_kselftest_execute(&tst, tl, options, result);
+			free(tl);
+		}
 	}
 
 	igt_fixture {
diff --git a/tests/igt_command_line.sh b/tests/igt_command_line.sh
index 291b6526..5356877c 100755
--- a/tests/igt_command_line.sh
+++ b/tests/igt_command_line.sh
@@ -89,13 +89,8 @@ check_test ()
 	fi
 
 	if [ $RET -eq 0 -a -z "$LIST" ]; then
-		# Subtest enumeration of kernel selftest launchers depends
-		# on the running kernel. If selftests are not enabled,
-		# they will output nothing and exit with 0.
-		if [ "$testname" != "i915_selftest" -a "$testname" != "drm_mm" -a "$testname" != "kms_selftest" -a "$testname" != "dmabuf" ]; then
-			echo "    test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!"
-			fail $test
-		fi
+		echo "    test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!"
+		fail $test
 	fi
 }
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
