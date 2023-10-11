Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:17:38 +0200
Message-ID: <20231011141734.590321-16-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
References: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 03/11] lib/kunit: Be more verbose on
 errors
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

Use a more verbose variant of igt_fail() when failing a dynamic sub-
subtest on kernel taint.  Also, print a debug message on string
duplication failure.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 05ff178b27..df0e650d49 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -834,7 +834,7 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 			if (!pthread_tryjoin_np(modprobe_thread, NULL))
 				igt_assert_eq(modprobe.err, 0);
 
-			igt_fail_on(igt_kernel_tainted(&taints));
+			igt_assert_eq(igt_kernel_tainted(&taints), 0);
 		}
 
 		free(result);
@@ -861,7 +861,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
 	 */
 	if (!name) {
 		name = strdup(module_name);
-		if (name) {
+		if (!igt_debug_on(!name)) {
 			char *suffix = strstr(name, "_test");
 
 			if (!suffix)
-- 
2.42.0
