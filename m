Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Oct 2023 14:28:02 +0200
Message-ID: <20231009122750.519112-24-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231009122750.519112-13-janusz.krzysztofik@linux.intel.com>
References: <20231009122750.519112-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 11/11] lib/kunit: Execute kunit test
 cases only when needed
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

v2: Always pass last result to next dynamic sub-subtest, fetch first
    result right after loading the kunit test module for execution.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 66 ++++++++++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 150fe49803..69915adc40 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -981,33 +981,37 @@ static void __igt_kunit(struct igt_ktest *tst,
 
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
 
-			if (igt_list_empty(&results)) {
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
+
+				igt_assert(igt_list_empty(&results));
 				igt_assert_eq(ret, -EINPROGRESS);
 				ret = kunit_kmsg_result_get(&results, &modprobe,
 							    tst->kmsg, ktap);
 				igt_fail_on(igt_list_empty(&results));
-			}
 
-			r = igt_list_first_entry(&results, r, link);
+				r = igt_list_first_entry(&results, r, link);
+			}
 
 			while (igt_debug_on_f(strcmp(r->suite_name, t->suite_name),
 					      "suite_name expected: %s, got: %s\n",
@@ -1079,30 +1083,30 @@ static void __igt_kunit(struct igt_ktest *tst,
 			igt_assert_eq(igt_kernel_tainted(&taints), 0);
 		}
 
-		kunit_result_free(&r, &suite_name, &case_name);
-
 		if (igt_debug_on(ret != -EINPROGRESS))
 			break;
 	}
 
 	kunit_results_free(&results, &suite_name, &case_name);
 
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
