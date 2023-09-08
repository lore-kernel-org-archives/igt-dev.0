Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:44:41 +0200
Message-ID: <20230908104438.125454-21-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230908104438.125454-19-janusz.krzysztofik@linux.intel.com>
References: <20230908104438.125454-19-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/17] lib/kunit: Stop loading kunit module
 explicitly
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

Since kmod functions we use for module loading can process module
dependencies, there is no need to load the "kunit" module explicitly
before loading a kunit test module.  For the same reason we already don't
unload the "kunit" module explicitly on cleanup.  Drop the unnecessary
operation.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 97667a896f..faf31afabc 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -789,12 +789,6 @@ static void __igt_kunit(const char *module_name, const char *opts)
 		goto unload;
 	}
 
-	/* The KUnit module is required for running any KUnit tests */
-	ret = igt_kmod_load("kunit", NULL);
-	if (ret) {
-		skip = ret;
-		goto unload;
-	}
 	ret = kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod);
 	if (ret) {
 		igt_warn("Unable to load KUnit\n");
-- 
2.41.0
