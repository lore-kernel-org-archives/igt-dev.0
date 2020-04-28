Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D1C6EBFC
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2020 20:24:06 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x15so11357389pfa.1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2020 13:24:06 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 28 Apr 2020 23:22:54 +0300
Message-Id: <20200428202255.31309-7-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/7] igt/params: use igt_params_set_save for
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

Unify parameter access. Here is also decided 'default' device
if -1 is specified as device. Derault being that device
which is first to match requirements, starting search
from zero upwards.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_params.c | 134 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 100 insertions(+), 34 deletions(-)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index d9cf986c..dc35f233 100644
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
@@ -107,15 +109,59 @@ static void igt_params_save(int dir, const char *path, const char *name)
 	module_params = data;
 }
 
-static int __igt_params_open(int device, char **outpath)
+static int __igt_params_open(int device, char **outpath, const char *param)
 {
 	int dir, params = -1;
+	struct stat buffer;
+	char searchname[64];
+	char searchpath[PATH_MAX];
+	char *foundname, *ctx;
 
-	dir = igt_sysfs_open(device);
+	dir = igt_debugfs_dir(device);
 	if (dir >= 0) {
-		params = openat(dir,
-				"device/driver/module/parameters",
-				O_RDONLY);
+		int devname;
+
+		devname = openat(dir, "name", O_RDONLY);
+		igt_assert(devname >= 0);
+
+		read(devname, searchname, sizeof(searchname));
+		close(devname);
+
+		foundname = strtok_r(searchname, " ", &ctx);
+		igt_assert(foundname);
+
+		snprintf(searchpath, PATH_MAX, "%s_params", foundname);
+		params = openat(dir, searchpath, O_RDONLY);
+
+		if (params >= 0) {
+			char *debugfspath = malloc(PATH_MAX);
+
+			igt_debugfs_path(device, debugfspath, PATH_MAX);
+			if (param != NULL) {
+				char filepath[PATH_MAX];
+
+				snprintf(filepath, PATH_MAX, "%s/%s",
+					 debugfspath, param);
+
+				if (stat(filepath, &buffer) == 0) {
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
+				 * Caller is responsible to free this.
+				 */
+				*outpath = debugfspath;
+			} else {
+				free(debugfspath);
+			}
+		}
 		close(dir);
 	}
 
@@ -124,12 +170,51 @@ static int __igt_params_open(int device, char **outpath)
 		char name[32] = "";
 		char path[PATH_MAX];
 
-		memset(&version, 0, sizeof(version));
-		version.name_len = sizeof(name);
-		version.name = name;
-		ioctl(device, DRM_IOCTL_VERSION, &version);
-
-		sprintf(path, "/sys/module/%s/parameters", name);
+		if (device == -1) {
+			/*
+			 * find default device
+			 */
+			int file, i;
+			const char *debugfs_root = igt_debugfs_mount();
+
+			igt_assert(debugfs_root);
+
+			for (i = 0; i < 63; i++) {
+				char testpath[PATH_MAX];
+
+				snprintf(searchpath, PATH_MAX,
+					 "%s/dri/%d/name", debugfs_root, i);
+
+				file = open(searchpath, O_RDONLY);
+
+				if (file < 0)
+					continue;
+
+				read(file, searchname, sizeof(searchname));
+				close(file);
+
+				foundname = strtok_r(searchname, " ", &ctx);
+				if (!foundname)
+					continue;
+
+				snprintf(testpath, PATH_MAX,
+					 "/sys/module/%s/parameters",
+					 foundname);
+
+				if (stat(testpath, &buffer) == 0 &&
+				    S_ISDIR(buffer.st_mode)) {
+					snprintf(name, sizeof(name), "%s",
+						 foundname);
+					break;
+				}
+			}
+		} else {
+			memset(&version, 0, sizeof(version));
+			version.name_len = sizeof(name);
+			version.name = name;
+			ioctl(device, DRM_IOCTL_VERSION, &version);
+		}
+		snprintf(path, sizeof(path), "/sys/module/%s/parameters", name);
 		params = open(path, O_RDONLY);
 		if (params >= 0 && outpath)
 			*outpath = strdup(path);
@@ -150,7 +235,7 @@ static int __igt_params_open(int device, char **outpath)
  */
 int igt_params_open(int device)
 {
-	return __igt_params_open(device, NULL);
+	return __igt_params_open(device, NULL, NULL);
 }
 
 __attribute__((format(printf, 3, 0)))
@@ -161,7 +246,7 @@ static bool __igt_params_set(int device, const char *parameter,
 	int dir;
 	int ret;
 
-	dir = __igt_params_open(device, save ? &path : NULL);
+	dir = __igt_params_open(device, save ? &path : NULL, parameter);
 	if (dir < 0)
 		return false;
 
@@ -233,21 +318,9 @@ bool igt_params_set_save(int device, const char *parameter, const char *fmt, ...
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
@@ -258,12 +331,5 @@ void igt_set_module_param(const char *name, const char *val)
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
