Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACEC6E0A1
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 16:17:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j3so14553478ljg.8
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 09:17:34 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 21 Apr 2020 19:17:20 +0300
Message-Id: <20200421161725.12249-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
References: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 3/8] lib/params: overhaul param saving
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

More generic, use existing functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_params.c | 101 +++++++++++++++++++----------------------------
 1 file changed, 41 insertions(+), 60 deletions(-)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index f220e73b..b5ac1266 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -34,92 +34,74 @@
 #include "igt_params.h"
 #include "igt_sysfs.h"
 
-#define MODULE_PARAM_DIR "/sys/module/i915/parameters/"
-#define PARAM_NAME_MAX_SZ 32
-#define PARAM_VALUE_MAX_SZ 16
-#define PARAM_FILE_PATH_MAX_SZ (strlen(MODULE_PARAM_DIR) + PARAM_NAME_MAX_SZ)
-
 struct module_param_data {
-	char name[PARAM_NAME_MAX_SZ];
-	char original_value[PARAM_VALUE_MAX_SZ];
+	char *path;
+	char *name;
+	char *original_value;
 
 	struct module_param_data *next;
 };
 struct module_param_data *module_params = NULL;
 
-static void igt_module_param_exit_handler(int sig)
+static void igt_params_exit_handler(int sig)
 {
-	const size_t dir_len = strlen(MODULE_PARAM_DIR);
-	char file_path[PARAM_FILE_PATH_MAX_SZ];
 	struct module_param_data *data;
-	int fd;
-
-	/* We don't need to assert string sizes on this function since they were
-	 * already checked before being stored on the lists. Besides,
-	 * igt_assert() is not AS-Safe. */
-	strcpy(file_path, MODULE_PARAM_DIR);
+	int dir;
 
 	for (data = module_params; data != NULL; data = data->next) {
-		strcpy(file_path + dir_len, data->name);
-
-		fd = open(file_path, O_RDWR);
-		if (fd >= 0) {
-			int size = strlen (data->original_value);
-
-			if (size != write(fd, data->original_value, size)) {
-				const char msg[] = "WARNING: Module parameters "
-					"may not have been reset to their "
-					"original values\n";
-				assert(write(STDERR_FILENO, msg, sizeof(msg))
-				       == sizeof(msg));
-			}
-
-			close(fd);
+		dir = open(data->path, O_RDONLY);
+
+		if (!igt_sysfs_set(dir, data->name, data->original_value)) {
+			const char msg[] = "WARNING: Module parameters "
+				"may not have been reset to their "
+				"original values\n";
+			assert(write(STDERR_FILENO, msg, sizeof(msg))
+			       == sizeof(msg));
 		}
+
+		close(dir);
 	}
 	/* free() is not AS-Safe, so we can't call it here. */
 }
 
 /**
- * igt_save_module_param:
- * @name: name of the i915.ko module parameter
- * @file_path: full sysfs file path for the parameter
+ * igt_params_save:
+ * @dir: file handle for path
+ * @path: full path to the sysfs directory
+ * @name: name of the sysfs attribute
  *
- * Reads the current value of an i915.ko module parameter, saves it on an array,
- * then installs an exit handler to restore it when the program exits.
+ * Reads the current value of a sysfs attribute, saves it on an array, then
+ * installs an exit handler to restore it when the program exits.
  *
  * It is safe to call this function multiple times for the same parameter.
  *
  * Notice that this function is called by igt_set_module_param(), so that one -
  * or one of its wrappers - is the only function the test programs need to call.
  */
-static void igt_save_module_param(const char *name, const char *file_path)
+static void igt_params_save(int dir, const char *path, const char *name)
 {
 	struct module_param_data *data;
-	size_t n;
-	int fd;
 
 	/* Check if this parameter is already saved. */
 	for (data = module_params; data != NULL; data = data->next)
-		if (strncmp(data->name, name, PARAM_NAME_MAX_SZ) == 0)
+		if (strcmp(data->path, path) == 0 &&
+		    strcmp(data->name, name) == 0)
 			return;
 
 	if (!module_params)
-		igt_install_exit_handler(igt_module_param_exit_handler);
+		igt_install_exit_handler(igt_params_exit_handler);
 
 	data = calloc(1, sizeof (*data));
 	igt_assert(data);
 
-	strncpy(data->name, name, PARAM_NAME_MAX_SZ - 1);
-
-	fd = open(file_path, O_RDONLY);
-	igt_assert(fd >= 0);
+	data->path = strdup(path);
+	igt_assert(data->path);
 
-	n = read(fd, data->original_value, PARAM_VALUE_MAX_SZ);
-	igt_assert_f(n > 0 && n < PARAM_VALUE_MAX_SZ,
-		     "Need to increase PARAM_VALUE_MAX_SZ\n");
+	data->name = strdup(name);
+	igt_assert(data->name);
 
-	igt_assert(close(fd) == 0);
+	data->original_value = igt_sysfs_get(dir, name);
+	igt_assert(data->original_value);
 
 	data->next = module_params;
 	module_params = data;
@@ -205,22 +187,21 @@ bool igt_params_set(int device, const char *parameter, const char *fmt, ...)
  */
 void igt_set_module_param(const char *name, const char *val)
 {
-	char file_path[PARAM_FILE_PATH_MAX_SZ];
-	size_t len = strlen(val);
-	int fd;
+	const char *path = "/sys/module/i915/parameters";
+	int dir;
 
-	igt_assert_f(strlen(name) < PARAM_NAME_MAX_SZ,
-		     "Need to increase PARAM_NAME_MAX_SZ\n");
-	strcpy(file_path, MODULE_PARAM_DIR);
-	strcpy(file_path + strlen(MODULE_PARAM_DIR), name);
+	dir = open(path, O_RDONLY);
+	igt_assert(dir >= 0);
 
-	igt_save_module_param(name, file_path);
+	igt_params_save(dir, path, name);
 
-	fd = open(file_path, O_RDWR);
-	igt_assert(write(fd, val, len) == len);
-	igt_assert(close(fd) == 0);
+	igt_assert(igt_sysfs_set(dir, name, val));
+
+	igt_assert(close(dir) == 0);
 }
 
+#define PARAM_VALUE_MAX_SZ 16
+
 /**
  * igt_set_module_param_int:
  * @name: i915.ko parameter name
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
