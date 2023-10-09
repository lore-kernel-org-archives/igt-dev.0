Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Oct 2023 14:27:59 +0200
Message-ID: <20231009122750.519112-21-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231009122750.519112-13-janusz.krzysztofik@linux.intel.com>
References: <20231009122750.519112-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 08/11] lib/kunit: Provide all results
 cleanup helper
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

Planned changes require a couple of loops around kunit_result_free().
Since we already have such loop, move it into a helper in preparation for
future uses.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 387efbb59f..fed0855c84 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -885,13 +885,25 @@ static void kunit_result_free(struct igt_ktap_result **r,
 	*r = NULL;
 }
 
+static void kunit_results_free(struct igt_list_head *results,
+			       char **suite_name, char **case_name)
+{
+	struct igt_ktap_result *r, *rn;
+
+	igt_list_for_each_entry_safe(r, rn, results, link)
+		kunit_result_free(&r, suite_name, case_name);
+
+	free(*case_name);
+	free(*suite_name);
+}
+
 static void
 __igt_kunit(struct igt_ktest *tst, const char *name, const char *opts)
 {
 	struct modprobe_data modprobe = { pthread_self(), tst->kmod, opts, 0, };
 	char *suite_name = NULL, *case_name = NULL;
-	struct igt_ktap_result *r, *rn;
 	struct igt_ktap_results *ktap;
+	struct igt_ktap_result *r;
 	pthread_mutexattr_t attr;
 	IGT_LIST_HEAD(results);
 	unsigned long taints;
@@ -997,11 +1009,7 @@ __igt_kunit(struct igt_ktest *tst, const char *name, const char *opts)
 
 	} while (ret == -EINPROGRESS);
 
-	igt_list_for_each_entry_safe(r, rn, &results, link)
-		kunit_result_free(&r, &suite_name, &case_name);
-
-	free(case_name);
-	free(suite_name);
+	kunit_results_free(&results, &suite_name, &case_name);
 
 	switch (pthread_mutex_lock(&modprobe.lock)) {
 	case 0:
-- 
2.42.0
