Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC5C6E527
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 12:18:08 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x77so2236555pfc.0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 05:18:08 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 20 Apr 2020 15:17:45 +0300
Message-Id: <20200420121747.23816-7-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200420121747.23816-1-juhapekka.heikkila@gmail.com>
References: <20200420121747.23816-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/8] igt/params: use igt_params_set_save for
 igt_set_module_param*
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
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
 lib/igt_params.c | 96 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 65 insertions(+), 31 deletions(-)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index 8de47b02..db7f7eb8 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -27,12 +27,14 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <sys/ioctl.h>
+#include <sys/stat.h>
 
 #include <i915_drm.h>
 
 #include "igt_core.h"
 #include "igt_params.h"
 #include "igt_sysfs.h"
+#include "igt_debugfs.h"
 
 struct module_param_data {
 	char *path;
@@ -107,15 +109,42 @@ static void igt_params_save(int dir, const char *path, const char *name)
 	module_params = data;
 }
 
-static int __igt_params_open(int device, char **outpath)
+static int __igt_params_open(int device, char **outpath, const char *param)
 {
 	int dir, params = -1;
 
-	dir = igt_sysfs_open(device);
+	dir = igt_debugfs_dir(device);
 	if (dir >= 0) {
 		params = openat(dir,
-				"device/driver/module/parameters",
+				"i915_params",
 				O_RDONLY);
+		if (params >= 0 ) {
+			char* debugfspath = malloc(PATH_MAX);
+			igt_debugfs_path(device, debugfspath, PATH_MAX);
+			if (param != NULL) {
+				struct stat buffer;
+				char filepath[PATH_MAX];
+				snprintf(filepath, PATH_MAX, "%s/%s", debugfspath, param);
+				if (stat(filepath, &buffer) == 0) {
+
+					if (outpath != NULL)
+						*outpath = debugfspath;
+					else
+						free(debugfspath);
+				} else {
+					free(debugfspath);
+					close(params);
+					params = -1;
+				}
+			} else if (outpath != NULL) {
+				/*
+				* Caller is responsible to free this.
+				*/
+				*outpath = debugfspath;
+			} else {
+				free(debugfspath);
+			}
+		}
 		close(dir);
 	}
 
@@ -124,11 +153,35 @@ static int __igt_params_open(int device, char **outpath)
 		char name[32] = "";
 		char path[PATH_MAX];
 
-		memset(&version, 0, sizeof(version));
-		version.name_len = sizeof(name);
-		version.name = name;
-		ioctl(device, DRM_IOCTL_VERSION, &version);
-
+		if (device == -1) {
+			/*
+			 * default to 1
+			 */
+			char searchpath[PATH_MAX];
+			char searchname[64];
+			int file;
+			const char *debugfs_root = igt_debugfs_mount();
+			char *foundname, *ctx;
+
+			igt_assert(debugfs_root);
+			snprintf(searchpath, PATH_MAX, "%s/dri/1/name", debugfs_root);
+			file = open(searchpath, O_RDONLY);
+			if (file < 0)
+				return -1;
+
+			read(file, searchname, sizeof(searchname));
+			close(file);
+
+			foundname = strtok_r(searchname, " ", &ctx);
+			igt_assert(foundname);
+
+			memcpy(name, foundname, (sizeof(name) < strlen(foundname)?sizeof(name):strlen(foundname)));
+		} else {
+			memset(&version, 0, sizeof(version));
+			version.name_len = sizeof(name);
+			version.name = name;
+			ioctl(device, DRM_IOCTL_VERSION, &version);
+		}
 		sprintf(path, "/sys/module/%s/parameters", name);
 		params = open(path, O_RDONLY);
 		if (params >= 0 && outpath)
@@ -150,7 +203,7 @@ static int __igt_params_open(int device, char **outpath)
  */
 int igt_params_open(int device)
 {
-	return __igt_params_open(device, NULL);
+	return __igt_params_open(device, NULL, NULL);
 }
 
 __attribute__((format(printf, 3, 0)))
@@ -161,7 +214,7 @@ static bool __igt_params_set(int device, const char *parameter,
 	int dir;
 	int ret;
 
-	dir = __igt_params_open(device, save ? &path : NULL);
+	dir = __igt_params_open(device, save ? &path : NULL, parameter);
 	if (dir < 0)
 		return false;
 
@@ -232,21 +285,9 @@ bool igt_params_set_save(int device, const char *parameter, const char *fmt, ...
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
@@ -257,12 +298,5 @@ void igt_set_module_param(const char *name, const char *val)
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
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
