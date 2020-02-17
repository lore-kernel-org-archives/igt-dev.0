Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C644A6E943
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 12:44:49 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 17 Feb 2020 12:44:30 +0000
Message-Id: <20200217124430.667389-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
References: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] lib: Update selftests to use dynamic
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

Use the new igt_subtest_with_dynamic to nicely group the dynamic
subtests together.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
Acked-by: Petri Latvala <petri.latvala@intel.com>
Acked-by: Tomi Sarvela <tomi.p.sarvela@intel.com>
---
I shall leave it to Tomi or Petri to handle the timing of the push to
make sure CI remains intact :)
---
 lib/igt_kmod.c            | 23 +++++++++++++++++++----
 tests/igt_command_line.sh |  9 ++-------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 05019c24c..e701545d3 100644
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
index 291b65268..5356877c7 100755
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
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
