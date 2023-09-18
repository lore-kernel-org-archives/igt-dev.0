Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 15:42:54 +0200
Message-ID: <20230918134249.31645-23-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230918134249.31645-19-janusz.krzysztofik@linux.intel.com>
References: <20230918134249.31645-19-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 04/17] lib/kunit: Optimize calls to
 igt_success/skip/fail()
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

Calling igt_success() explicitly at the end of subtest body is not needed.
Other calls to igt_success() can be usually avoided by inverting test
result checks.  Optimize the code that now calls igt_success().

Moreover, using more advanced variants of igt_skip() and igt_fail() where
applicable makes the code more compact.  Go for it.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_kmod.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 34ddec3fad..1d1cd51170 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -814,12 +814,8 @@ static void __igt_kunit(const char *module_name, const char *opts)
 		if (READ_ONCE(results->head) != NULL) {
 			pthread_mutex_lock(&results->mutex);
 
-			igt_dynamic(results->head->test_name) {
-				if (READ_ONCE(results->head->passed))
-					igt_success();
-				else
-					igt_fail(IGT_EXIT_FAILURE);
-			}
+			igt_dynamic(results->head->test_name)
+				igt_assert(READ_ONCE(results->head->passed));
 
 			temp = results->head;
 			results->head = results->head->next;
@@ -834,8 +830,7 @@ unload:
 
 	igt_ktest_fini(&tst);
 
-	if (skip)
-		igt_skip("Skipping test, as probing KUnit module returned %d", skip);
+	igt_skip_on_f(skip, "Skipping test, as probing KUnit module failed\n");
 
 	if (fail)
 		igt_fail(IGT_EXIT_ABORT);
@@ -844,9 +839,6 @@ unload:
 
 	if (ret != 0)
 		igt_fail(IGT_EXIT_ABORT);
-
-	if (ret == 0)
-		igt_success();
 }
 
 void igt_kunit(const char *module_name, const char *name, const char *opts)
-- 
2.41.0
