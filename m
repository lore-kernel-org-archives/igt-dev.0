Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu,  6 Jan 2022 16:49:13 +0000
Message-Id: <20220106164915.56855-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220106164915.56855-1-tvrtko.ursulin@linux.intel.com>
References: <20220106164915.56855-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib: Helper library for parsing i915
 fdinfo output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Tests and intel_gpu_top will share common code for parsing this file.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_fdinfo.c | 161 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_fdinfo.h |  47 +++++++++++++
 lib/meson.build      |   7 ++
 3 files changed, 215 insertions(+)
 create mode 100644 lib/igt_drm_fdinfo.c
 create mode 100644 lib/igt_drm_fdinfo.h

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
new file mode 100644
index 000000000000..86cc64da8c68
--- /dev/null
+++ b/lib/igt_drm_fdinfo.c
@@ -0,0 +1,161 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#include <ctype.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include "drmtest.h"
+
+#include "igt_drm_fdinfo.h"
+
+static FILE *fropenat(DIR *at, const char *name)
+{
+	FILE *f;
+	int fd;
+
+	fd = openat(dirfd(at), name, O_RDONLY);
+	if (fd < 0)
+		return NULL;
+
+	f = fdopen(fd, "r");
+	if (!f)
+		close(fd);
+
+	return f;
+}
+
+static size_t read_fdinfo(char *buf, const size_t sz, DIR *at, const char *name)
+{
+	size_t count;
+	FILE *f;
+
+	f = fropenat(at, name);
+	if (!f)
+		return 0;
+
+	memset(buf, 0, sz);
+	count = fread(buf, 1, sz, f);
+	fclose(f);
+
+	return count;
+}
+
+static bool parse_engine(char *line, struct drm_client_fdinfo *info)
+{
+	static const char *e2class[] = {
+		"render",
+		"copy",
+		"video",
+		"video-enhance",
+	};
+	bool found = false;
+	char name[256];
+	unsigned int i;
+	uint64_t val;
+	char *t;
+
+	t = line;
+	while (!isdigit(*t))
+		t++;
+	val = strtoull(t, NULL, 10);
+
+	t = line;
+	while (*t != ':')
+		t++;
+	*t = 0;
+
+	if (sscanf(line, "drm-engine-%s", name) != 1)
+		return false;
+
+	for (i = 0; i < ARRAY_SIZE(e2class); i++) {
+		if (!strcmp(name, e2class[i])) {
+			info->busy[i] = val;
+			found = true;
+			break;
+		}
+	}
+
+	return found;
+}
+
+bool
+__igt_parse_drm_fdinfo(DIR *dir, const char *fd, struct drm_client_fdinfo *info)
+{
+	char buf[4096], *_buf = buf;
+	char *l, *ctx = NULL;
+	unsigned int good = 0;
+	size_t count;
+
+	count = read_fdinfo(buf, sizeof(buf), dir, fd);
+	if (!count)
+		return false;
+
+	while ((l = strtok_r(_buf, "\n", &ctx))) {
+		_buf = NULL;
+
+		if (sscanf(l, "drm-driver:\t%s", info->driver)) {
+			good++;
+		} else if (sscanf(l, "drm-pdev:\t%s", info->pdev)) {
+			good++;
+		}  else if (sscanf(l, "drm-client-id:\t%lu", &info->id) == 1) {
+			good++;
+		} else if (!strncmp(l, "drm-engine-", 11)) {
+			if (parse_engine(l, info))
+				info->num_engines++;
+		}
+	}
+
+	if (good < 3 || !info->num_engines)
+		return false; /* fdinfo format not as expected */
+
+	return true;
+}
+
+bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info)
+{
+	char fd[64];
+	DIR *dir;
+	bool res;
+	int ret;
+
+	ret = snprintf(fd, sizeof(fd), "%u", drm_fd);
+	if (ret < 0 || ret == sizeof(fd))
+		return false;
+
+	dir = opendir("/proc/self/fdinfo");
+	if (!dir)
+		return false;
+
+	res = __igt_parse_drm_fdinfo(dir, fd, info);
+
+	closedir(dir);
+
+	return res;
+}
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
new file mode 100644
index 000000000000..103cf5562cbe
--- /dev/null
+++ b/lib/igt_drm_fdinfo.h
@@ -0,0 +1,47 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#ifndef IGT_DRM_FDINFO_H
+#define IGT_DRM_FDINFO_H
+
+#include <sys/types.h>
+#include <dirent.h>
+#include <stdint.h>
+#include <stdbool.h>
+
+struct drm_client_fdinfo {
+	char driver[128];
+	char pdev[128];
+	unsigned long id;
+
+	unsigned int num_engines;
+	uint64_t busy[16];
+};
+
+bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info);
+
+bool __igt_parse_drm_fdinfo(DIR *dir, const char *fd,
+			    struct drm_client_fdinfo *info);
+
+#endif /* IGT_DRM_FDINFO_H */
diff --git a/lib/meson.build b/lib/meson.build
index b9568a71bf46..b456db809e98 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -16,6 +16,7 @@ lib_sources = [
 	'igt_debugfs.c',
 	'igt_device.c',
 	'igt_device_scan.c',
+	'igt_drm_fdinfo.c',
 	'igt_aux.c',
 	'igt_gt.c',
 	'igt_halffloat.c',
@@ -215,6 +216,12 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
 lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
 				  include_directories : inc)
 
+lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
+	['igt_drm_fdinfo.c'],
+	include_directories : inc)
+
+lib_igt_drm_fdinfo = declare_dependency(link_with : lib_igt_drm_fdinfo_build,
+				  include_directories : inc)
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.32.0
