Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E386E196
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Dec 2019 16:31:29 +0000 (UTC)
From: "Robert M. Fosha" <robert.m.fosha@intel.com>
Date: Fri, 27 Dec 2019 08:23:12 -0800
Message-Id: <20191227162312.19920-1-robert.m.fosha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_perf: Support multiple GPUs
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

With discrete graphics system can have both integrated and discrete GPU
handled by i915.

Update path to PMU for non-integrated devices to include PCI device name
string to match driver implementation. Integrated devices keep legacy
path.

Signed-off-by: Robert M. Fosha <robert.m.fosha@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/igt_perf.c    | 53 ++++++++++++++++++++++++++++++++++++++++++++---
 tools/meson.build |  2 +-
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index e3dec2cc..f4a0036f 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -5,27 +5,74 @@
 #include <string.h>
 #include <errno.h>
 #include <sys/sysinfo.h>
+#include <sys/stat.h>
 
 #include "igt_perf.h"
 
+#include "drmtest.h"
+#include "igt_debugfs.h"
+
+static char *perf_event_sysfs_path(void)
+{
+	int drm_fd;
+	static const char unique[] = "unique=";
+	static const char prefix[] = "/sys/bus/event_source/devices/i915";
+	char path[100];
+	char buf[100];
+	char *busid;
+	struct stat st;
+
+	drm_fd = drm_open_driver(DRIVER_INTEL);
+	igt_debugfs_read(drm_fd, "name", buf);
+	close(drm_fd);
+
+	strtok(buf, "\n");
+
+	busid = strstr(buf, unique);
+	if (!busid || strlen(busid) <= strlen(unique))
+		goto err_path;
+
+	busid += strlen(unique);
+	snprintf(path, sizeof(path), "%s-%s/type", prefix, busid);
+	if (stat(path, &st) || !S_ISREG(st.st_mode))
+		goto err_path;
+
+	return strndup(path, sizeof(path));
+
+err_path:
+	snprintf(path, sizeof(path), "%s/type", prefix);
+	return strndup(path, sizeof(path));
+
+}
+
 uint64_t i915_type_id(void)
 {
+	char *type_path;
 	char buf[64];
 	ssize_t ret;
 	int fd;
 
-	fd = open("/sys/bus/event_source/devices/i915/type", O_RDONLY);
+	type_path = perf_event_sysfs_path();
+	if (type_path == NULL)
+		goto err_type_id;
+
+	fd = open(type_path, O_RDONLY);
 	if (fd < 0)
-		return 0;
+		goto err_type_id;
 
 	ret = read(fd, buf, sizeof(buf) - 1);
 	close(fd);
 	if (ret < 1)
-		return 0;
+		goto err_type_id;
 
 	buf[ret] = '\0';
 
+	free(type_path);
 	return strtoull(buf, NULL, 0);
+
+err_type_id:
+	free(type_path);
+	return 0;
 }
 
 static int
diff --git a/tools/meson.build b/tools/meson.build
index 74822a33..c71a3ed2 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -99,7 +99,7 @@ shared_library('intel_aubdump', 'aubdump.c',
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-	   dependencies : lib_igt_perf)
+	   dependencies : [ igt_deps, lib_igt_perf ])
 
 executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
 	   dependencies : [tool_deps],
-- 
2.21.0.5.gaeb582a983

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
