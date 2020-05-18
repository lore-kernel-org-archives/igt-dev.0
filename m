Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 18 May 2020 21:50:10 +0100
Message-Id: <20200518205010.1539621-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Cleanup __igt_params_open()
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

The device always exist, so use it to derive the module name required to
lookup either the debugfs params directory or the sysfs module parameters.

Fixes: 2f5cee33ce55 ("igt/params: use igt_params_set_save for igt_set_module_param*")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_params.c | 116 +++++++----------------------------------------
 1 file changed, 17 insertions(+), 99 deletions(-)

diff --git a/lib/igt_params.c b/lib/igt_params.c
index d8649dfd9..9d9a11c0b 100644
--- a/lib/igt_params.c
+++ b/lib/igt_params.c
@@ -131,117 +131,35 @@ static void igt_params_save(int dir, const char *path, const char *name)
  */
 static int __igt_params_open(int device, char **outpath, const char *param)
 {
+	drm_version_t version;
 	int dir, params = -1;
-	struct stat buffer;
-	char searchname[64];
-	char searchpath[PATH_MAX];
-	char *foundname, *ctx;
+	char path[PATH_MAX];
+	char name[32];
+
+	memset(&version, 0, sizeof(version));
+	version.name_len = sizeof(name);
+	version.name = name;
+	if (ioctl(device, DRM_IOCTL_VERSION, &version))
+		return -1;
 
 	dir = igt_debugfs_dir(device);
 	if (dir >= 0) {
-		int devname;
-
-		devname = openat(dir, "name", O_RDONLY);
-		igt_require_f(devname >= 0,
-		              "Driver need to name itself in debugfs!");
-
-		read(devname, searchname, sizeof(searchname));
-		close(devname);
-
-		foundname = strtok_r(searchname, " ", &ctx);
-		igt_require_f(foundname,
-		              "Driver need to name itself in debugfs!");
-
-		snprintf(searchpath, PATH_MAX, "%s_params", foundname);
-		params = openat(dir, searchpath, O_RDONLY);
-
-		if (params >= 0) {
-			char *debugfspath = malloc(PATH_MAX);
-
-			igt_debugfs_path(device, debugfspath, PATH_MAX);
-			if (param != NULL) {
-				char filepath[PATH_MAX];
-
-				snprintf(filepath, PATH_MAX, "%s/%s",
-					 debugfspath, param);
-
-				if (stat(filepath, &buffer) == 0) {
-					if (outpath != NULL)
-						*outpath = debugfspath;
-					else
-						free(debugfspath);
-				} else {
-					free(debugfspath);
-					close(params);
-					params = -1;
-				}
-			} else if (outpath != NULL) {
-				/*
-				 * Caller is responsible to free this.
-				 */
-				*outpath = debugfspath;
-			} else {
-				free(debugfspath);
-			}
-		}
+		snprintf(path, PATH_MAX, "%s_params", name);
+		params = openat(dir, path, O_RDONLY);
 		close(dir);
 	}
 
 	if (params < 0) { /* builtin? */
-		drm_version_t version;
-		char name[32] = "";
-		char path[PATH_MAX];
-
-		if (device == -1) {
-			/*
-			 * find default device
-			 */
-			int file, i;
-			const char *debugfs_root = igt_debugfs_mount();
-
-			igt_assert(debugfs_root);
-
-			for (i = 0; i < 63; i++) {
-				char testpath[PATH_MAX];
-
-				snprintf(searchpath, PATH_MAX,
-					 "%s/dri/%d/name", debugfs_root, i);
-
-				file = open(searchpath, O_RDONLY);
-
-				if (file < 0)
-					continue;
-
-				read(file, searchname, sizeof(searchname));
-				close(file);
-
-				foundname = strtok_r(searchname, " ", &ctx);
-				if (!foundname)
-					continue;
-
-				snprintf(testpath, PATH_MAX,
-					 "/sys/module/%s/parameters",
-					 foundname);
-
-				if (stat(testpath, &buffer) == 0 &&
-				    S_ISDIR(buffer.st_mode)) {
-					snprintf(name, sizeof(name), "%s",
-						 foundname);
-					break;
-				}
-			}
-		} else {
-			memset(&version, 0, sizeof(version));
-			version.name_len = sizeof(name);
-			version.name = name;
-			ioctl(device, DRM_IOCTL_VERSION, &version);
-		}
 		snprintf(path, sizeof(path), "/sys/module/%s/parameters", name);
 		params = open(path, O_RDONLY);
-		if (params >= 0 && outpath)
-			*outpath = strdup(path);
 	}
 
+	/*
+	 * Caller is responsible to free this.
+	 */
+	if (params >= 0 && outpath)
+		*outpath = strdup(path);
+
 	return params;
 }
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
