Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Oct 2023 14:27:54 +0200
Message-ID: <20231009122750.519112-16-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231009122750.519112-13-janusz.krzysztofik@linux.intel.com>
References: <20231009122750.519112-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 03/11] lib/kunit: Fix misplaced
 igt_kunit() doc
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

When igt_kunit() was converted to a helper and wrapped with a new function
promoted to take the name and role of the library API, related
documentation was left unchanged and still placed in front the demoted
function.  Update that documentation and move it to where it now belongs.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index df0e650d49..426ae5b26f 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -762,15 +762,6 @@ static void *modprobe_task(void *arg)
 	return NULL;
 }
 
-/**
- * igt_kunit:
- * @module_name: the name of the module
- * @opts: options to load the module
- *
- * Loads the test module, parses its (k)tap dmesg output, then unloads it
- *
- * Returns: IGT default codes
- */
 static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 {
 	struct modprobe_data modprobe = { tst->kmod, opts, 0, };
@@ -849,6 +840,14 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 	igt_skip_on_f(ret, "KTAP parser failed\n");
 }
 
+/**
+ * igt_kunit:
+ * @module_name: the name of the module
+ * @name: the name of subtest, if different from that derived from module name
+ * @opts: options to load the module
+ *
+ * Loads the test module, parses its (k)tap dmesg output, then unloads it
+ */
 void igt_kunit(const char *module_name, const char *name, const char *opts)
 {
 	struct igt_ktest tst = { .kmsg = -1, };
-- 
2.42.0
