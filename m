Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C516EC10
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2020 16:14:07 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r17so82133lff.2
 for <igt-dev@lists.freedesktop.org>; Thu, 09 Apr 2020 09:14:07 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu,  9 Apr 2020 19:13:42 +0300
Message-Id: <20200409161344.31934-7-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200409161344.31934-1-juhapekka.heikkila@gmail.com>
References: <20200409161344.31934-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 6/8] RFC igt/params: use igt_params_set_save
 for igt_set_module_param*
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Unify parameter access. Based on original patch from Jani Nikula.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_params.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index 8de47b02..83ff2155 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -33,6 +33,7 @@
 #include "igt_core.h"
 #include "igt_params.h"
 #include "igt_sysfs.h"
+#include "igt_debugfs.h"
 
 struct module_param_data {
 	char *path;
@@ -111,11 +112,18 @@ static int __igt_params_open(int device, char **outpath)
 {
 	int dir, params = -1;
 
-	dir = igt_sysfs_open(device);
+	dir = igt_debugfs_dir(device);
 	if (dir >= 0) {
 		params = openat(dir,
-				"device/driver/module/parameters",
+				"i915_params",
 				O_RDONLY);
+		if (outpath != NULL) {
+			/*
+			 * Caller is responsible to free this.
+			 */
+			char* path = malloc(PATH_MAX);
+			*outpath = igt_debugfs_path(device, path, PATH_MAX);
+		}
 		close(dir);
 	}
 
@@ -232,21 +240,9 @@ bool igt_params_set_save(int device, const char *parameter, const char *fmt, ...
  */
 void igt_set_module_param(const char *name, const char *val)
 {
-	const char *path = "/sys/module/i915/parameters";
-	int dir;
-
-	dir = open(path, O_RDONLY);
-	igt_assert(dir >= 0);
-
-	igt_params_save(dir, path, name);
-
-	igt_assert(igt_sysfs_set(dir, name, val));
-
-	igt_assert(close(dir) == 0);
+	igt_assert(igt_params_set_save(-1, name, "%s", val));
 }
 
-#define PARAM_VALUE_MAX_SZ 16
-
 /**
  * igt_set_module_param_int:
  * @name: i915.ko parameter name
@@ -257,12 +253,5 @@ void igt_set_module_param(const char *name, const char *val)
  */
 void igt_set_module_param_int(const char *name, int val)
 {
-	char str[PARAM_VALUE_MAX_SZ];
-	int n;
-
-	n = snprintf(str, PARAM_VALUE_MAX_SZ, "%d\n", val);
-	igt_assert_f(n < PARAM_VALUE_MAX_SZ,
-		     "Need to increase PARAM_VALUE_MAX_SZ\n");
-
-	igt_set_module_param(name, str);
+	igt_assert(igt_params_set_save(-1, name, "%d", val));
 }
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
