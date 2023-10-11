Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:17:41 +0200
Message-ID: <20231011141734.590321-19-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
References: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 06/11] lib/kunit: Omit suite name prefix
 if the same as subtest name
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

Kunit test modules usually contain one test suite, named after the module
name with the trailing "_test" or "_kunit" suffix omitted.  Since we
follow the same convention when we derive subtest names from module names,
there is a great chance that those two names match.  Take this into
account when composing names for IGT dynamic sub-subtest names and drop
the leading test suite name component when it is the same as subtest name.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_kmod.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 93d9479219..d014644fb4 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -888,7 +888,8 @@ static void kunit_result_free(struct igt_ktap_result **r,
 	*r = NULL;
 }
 
-static void __igt_kunit(struct igt_ktest *tst, const char *opts)
+static void
+__igt_kunit(struct igt_ktest *tst, const char *name, const char *opts)
 {
 	struct modprobe_data modprobe = { tst->kmod, opts, 0, pthread_self(), };
 	char *suite_name = NULL, *case_name = NULL;
@@ -931,7 +932,11 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 
 		r = igt_list_first_entry(&results, r, link);
 
-		igt_dynamic_f("%s-%s", r->suite_name, r->case_name) {
+		igt_dynamic_f("%s%s%s",
+			      strcmp(r->suite_name, name) ?  r->suite_name : "",
+			      strcmp(r->suite_name, name) ? "-" : "",
+			      r->case_name) {
+
 			if (r->code == IGT_EXIT_INVALID) {
 				/* parametrized test case, get actual result */
 				kunit_result_free(&r, &suite_name, &case_name);
@@ -1072,7 +1077,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 	 * and for documentation.
 	 */
 	igt_subtest_with_dynamic(name)
-		__igt_kunit(&tst, opts);
+		__igt_kunit(&tst, name, opts);
 
 	igt_fixture
 		igt_ktest_end(&tst);
-- 
2.42.0
