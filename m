Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 14:32:48 +0200
Message-ID: <20230908123233.137134-33-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 14/17] lib/kunit: Load test modules in
 background
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For igt_runner to be able to correlate a stream of IGT results from
dynamic sub-subtests that correspond to individual kunit test cases, read
by the igt_runner from stdout / stderr of the test process, with a stream
of kernel messages read from /dev/kmsg, we need both result streams being
fed with data in parallel.  While our KTAP parser is currently started in
the background and reads KTAP results from /dev/kmsg in parallel with
execution of kunit tests performed by the kernel while we are loading a
kunit test module, results from the parser are then only stored as
intermediate data and not processed any further until the module loading
completes.  As a consequence, there is no synchronization between the two
streams.

Call the function that loads the kunit test module from a separate thread
and process the intermediate results immediately, as soon as available
from the background parser, without waiting for completion of module
loading.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index c692954911..bbde3929f2 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -25,6 +25,7 @@
 #include <signal.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <pthread.h>
 #include <sys/utsname.h>
 
 #include "igt_aux.h"
@@ -746,6 +747,21 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
 	kmod_module_info_free_list(pre);
 }
 
+struct modprobe_data {
+	struct kmod_module *kmod;
+	const char *opts;
+	int err;
+};
+
+static void *modprobe_task(void *arg)
+{
+	struct modprobe_data *data = arg;
+
+	data->err = modprobe(data->kmod, data->opts);
+
+	return NULL;
+}
+
 /**
  * igt_kunit:
  * @module_name: the name of the module
@@ -757,9 +773,11 @@ void igt_kselftest_get_tests(struct kmod_module *kmod,
  */
 static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 {
+	struct modprobe_data modprobe = { tst->kmod, opts, 0, };
 	struct kmod_module *kunit_kmod;
 	bool is_builtin;
 	struct ktap_test_results *results;
+	pthread_t modprobe_thread;
 	unsigned long taints;
 	int flags, ret;
 
@@ -777,18 +795,25 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 
 	results = ktap_parser_start(tst->kmsg, is_builtin);
 
-	if (igt_debug_on(igt_kmod_load(tst->module_name, opts) < 0)) {
+	if (igt_debug_on(pthread_create(&modprobe_thread, NULL,
+					modprobe_task, &modprobe))) {
 		ktap_parser_cancel();
 		igt_ignore_warn(ktap_parser_stop());
-		igt_skip("Unable to load %s module\n", tst->module_name);
+		igt_skip("Failed to create a modprobe thread\n");
 	}
 
 	while (READ_ONCE(results->still_running) || !igt_list_empty(&results->list))
 	{
 		struct ktap_test_results_element *result;
 
+		if (!pthread_tryjoin_np(modprobe_thread, NULL) && modprobe.err) {
+			ktap_parser_cancel();
+			break;
+		}
+
 		if (igt_kernel_tainted(&taints)) {
 			ktap_parser_cancel();
+			pthread_cancel(modprobe_thread);
 			break;
 		}
 
@@ -806,14 +831,20 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 		igt_dynamic(result->test_name) {
 			igt_assert(READ_ONCE(result->passed));
 
+			if (!pthread_tryjoin_np(modprobe_thread, NULL))
+				igt_assert_eq(modprobe.err, 0);
+
 			igt_fail_on(igt_kernel_tainted(&taints));
 		}
 
 		free(result);
 	}
 
+	pthread_join(modprobe_thread, NULL);
+
 	ret = ktap_parser_stop();
 
+	igt_skip_on(modprobe.err);
 	igt_skip_on(igt_kernel_tainted(&taints));
 	igt_skip_on_f(ret, "KTAP parser failed\n");
 }
-- 
2.41.0
