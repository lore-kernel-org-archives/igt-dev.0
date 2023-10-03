Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 11:10:54 +0200
Message-ID: <20231003091044.407965-20-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
References: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 9/9] lib/kunit: Execute kunit test cases
 only when needed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

IGT user interface allows to request execution of only those dynamic sub-
subtests that match a user provided name pattern.  If the user pattern
doesn't match any names of test cases provided by a kunit test module used
with the subtest to be run then no results from any dynamic sub-subtests
will be reported.  Since we already know the list of test cases provided
by the kunit test module, there is no need to load that module to execute
them unless the user pattern matches at least one of those test cases.

Don't load the kunit test module in execute mode before entering the loop
of dynamic sub-subtests, and do that only from the first actually executed
dynamic sub-subtest.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 59 ++++++++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 4fba77ead4..a8a140c9f1 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -962,24 +962,29 @@ static void __igt_kunit(struct igt_ktest *tst,
 
 	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
 
-	igt_skip_on(pthread_mutexattr_init(&attr));
-	igt_skip_on(pthread_mutexattr_setrobust(&attr, PTHREAD_MUTEX_ROBUST));
-	igt_skip_on(pthread_mutex_init(&modprobe.lock, &attr));
-
 	ktap = igt_ktap_alloc(&results);
 	igt_require(ktap);
 
-	if (igt_debug_on(pthread_create(&modprobe.thread, NULL,
-					modprobe_task, &modprobe))) {
-		igt_ktap_free(ktap);
-		igt_skip("Failed to create a modprobe thread\n");
-	}
-
 	igt_list_for_each_entry(t, tests, link) {
 		igt_dynamic_f("%s%s%s",
 			      strcmp(t->suite_name, name) ?  t->suite_name : "",
 			      strcmp(t->suite_name, name) ? "-" : "",
 			      t->case_name) {
+			if (!modprobe.thread) {
+				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
+				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
+							  PTHREAD_MUTEX_ROBUST),
+					      0);
+				igt_assert_eq(pthread_mutex_init(&modprobe.lock,
+								 &attr), 0);
+
+				modprobe.err = pthread_create(&modprobe.thread,
+							      NULL,
+							      modprobe_task,
+							      &modprobe);
+				igt_assert_eq(modprobe.err, 0);
+			}
+
 			if (!r) {
 				if (igt_list_empty(&results)) {
 					igt_assert_eq(ret, -EINPROGRESS);
@@ -1075,22 +1080,24 @@ static void __igt_kunit(struct igt_ktest *tst,
 	free(case_name);
 	free(suite_name);
 
-	switch (pthread_mutex_lock(&modprobe.lock)) {
-	case 0:
-		igt_debug_on(pthread_cancel(modprobe.thread));
-		igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
-		igt_debug_on(pthread_join(modprobe.thread, NULL));
-		break;
-	case EOWNERDEAD:
-		/* leave the mutex unrecoverable */
-		igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
-		break;
-	case ENOTRECOVERABLE:
-		break;
-	default:
-		igt_debug("pthread_mutex_lock() failed\n");
-		igt_debug_on(pthread_join(modprobe.thread, NULL));
-		break;
+	if (modprobe.thread) {
+		switch (pthread_mutex_lock(&modprobe.lock)) {
+		case 0:
+			igt_debug_on(pthread_cancel(modprobe.thread));
+			igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
+			igt_debug_on(pthread_join(modprobe.thread, NULL));
+			break;
+		case EOWNERDEAD:
+			/* leave the mutex unrecoverable */
+			igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
+			break;
+		case ENOTRECOVERABLE:
+			break;
+		default:
+			igt_debug("pthread_mutex_lock() failed\n");
+			igt_debug_on(pthread_join(modprobe.thread, NULL));
+			break;
+		}
 	}
 
 	igt_ktap_free(ktap);
-- 
2.42.0
