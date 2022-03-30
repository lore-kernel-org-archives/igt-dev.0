Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 30 Mar 2022 12:52:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <20220330195229.GD59408@unerlige-ril-10.165.21.154>
References: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
 <20220222135605.1120767-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220222135605.1120767-2-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 01/11] lib: Helper library
 for parsing i915 fdinfo output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 01:55:55PM +0000, Tvrtko Ursulin wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
>Tests and intel_gpu_top will share common code for parsing this file.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>---
> lib/igt_drm_fdinfo.c | 183 +++++++++++++++++++++++++++++++++++++++++++
> lib/igt_drm_fdinfo.h |  48 ++++++++++++
> lib/meson.build      |   7 ++
> 3 files changed, 238 insertions(+)
> create mode 100644 lib/igt_drm_fdinfo.c
> create mode 100644 lib/igt_drm_fdinfo.h
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>new file mode 100644
>index 000000000000..28c1bdbda08e
>--- /dev/null
>+++ b/lib/igt_drm_fdinfo.c
>@@ -0,0 +1,183 @@
>+/*
>+ * Copyright © 2022 Intel Corporation
>+ *
>+ * Permission is hereby granted, free of charge, to any person obtaining a
>+ * copy of this software and associated documentation files (the "Software"),
>+ * to deal in the Software without restriction, including without limitation
>+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>+ * and/or sell copies of the Software, and to permit persons to whom the
>+ * Software is furnished to do so, subject to the following conditions:
>+ *
>+ * The above copyright notice and this permission notice (including the next
>+ * paragraph) shall be included in all copies or substantial portions of the
>+ * Software.
>+ *
>+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
>+ * IN THE SOFTWARE.
>+ *
>+ */
>+
>+#include <ctype.h>
>+#include <sys/types.h>
>+#include <sys/stat.h>
>+#include <fcntl.h>
>+#include <stdio.h>
>+#include <string.h>
>+#include <stdlib.h>
>+#include <unistd.h>
>+
>+#include "drmtest.h"
>+
>+#include "igt_drm_fdinfo.h"
>+
>+static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
>+{
>+	size_t count;
>+	int fd;
>+
>+	fd = openat(at, name, O_RDONLY);
>+	if (fd < 0)
>+		return 0;
>+
>+	buf[sz - 1] = 0;

Wondering if this ^ should be after the read() in case 4096 bytes are read.

>+	count = read(fd, buf, sz);
>+	close(fd);
>+
>+	return count;
>+}
>+
>+static int parse_engine(char *line, struct drm_client_fdinfo *info,
>+			size_t prefix_len, uint64_t *val)
>+{
>+	static const char *e2class[] = {
>+		"render",
>+		"copy",
>+		"video",
>+		"video-enhance",
>+	};
>+	ssize_t name_len;
>+	char *name, *p;
>+	int found = -1;
>+	unsigned int i;
>+
>+	p = index(line, ':');
>+	if (!p || p == line)
>+		return -1;
>+
>+	name_len = p - line - prefix_len;
>+	if (name_len < 1)
>+		return -1;
>+
>+	name = line + prefix_len;
>+
>+	for (i = 0; i < ARRAY_SIZE(e2class); i++) {
>+		if (!strncmp(name, e2class[i], name_len)) {
>+			found = i;
>+			break;
>+		}
>+	}
>+
>+	if (found >= 0) {
>+		while (*++p && isspace(*p));
>+		*val = strtoull(p, NULL, 10);
>+	}
>+
>+	return found;
>+}
>+
>+static const char *find_kv(const char *buf, const char *key, size_t keylen)
>+{
>+	const char *p = buf;
>+
>+	p = index(buf, ':');
>+	if (!p || p == buf)
>+		return NULL;
>+
>+	if ((p - buf) != keylen)
>+		return NULL;
>+
>+	while (*++p && isspace(*p));
>+	if (*p && !strncmp(buf, key, keylen))

nit: why not just do the strncmp early in this function since buf, key, 
keylen have not changed?

>+		return p;
>+
>+	return NULL;
>+}
>+
>+bool
>+__igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info)
>+{
>+	char buf[4096], *_buf = buf;
>+	char *l, *ctx = NULL;
>+	unsigned int good = 0;
>+	size_t count;
>+

Should buf be zeroed out here?

>+	count = read_fdinfo(buf, sizeof(buf), dir, fd);
>+	if (!count)
>+		return false;
>+
>+	while ((l = strtok_r(_buf, "\n", &ctx))) {
>+		uint64_t val = 0;
>+		const char *v;
>+		int idx;
>+
>+		_buf = NULL;
>+
>+		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
>+			strncpy(info->driver, v, sizeof(info->driver) - 1);
>+			good++;
>+		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
>+			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>+		}  else if ((v = find_kv(l, "drm-client-id",
>+					 strlen("drm-client-id")))) {
>+			info->id = atol(v);
>+			good++;
>+		} else if (!strncmp(l, "drm-engine-", 11) &&
>+			   strncmp(l, "drm-engine-capacity-", 20)) {
>+			idx = parse_engine(l, info, strlen("drm-engine-"),
>+					   &val);
>+			if (idx >= 0) {
>+				if (!info->capacity[idx])
>+					info->capacity[idx] = 1;
>+				info->busy[idx] = val;
>+				info->num_engines++;
>+			}
>+		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>+			idx = parse_engine(l, info,
>+					   strlen("drm-engine-capacity-"),
>+					   &val);
>+			if (idx >= 0)
>+				info->capacity[idx] = val;
>+		}
>+	}
>+
>+	if (good < 2 || !info->num_engines)
>+		return false; /* fdinfo format not as expected */
>+
>+	return true;
>+}
>+
>+bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info)
>+{
>+	char fd[64];
>+	int dir, ret;
>+	bool res;
>+
>+	ret = snprintf(fd, sizeof(fd), "%u", drm_fd);
>+	if (ret < 0 || ret == sizeof(fd))
>+		return false;
>+
>+	dir = open("/proc/self/fdinfo", O_DIRECTORY | O_RDONLY);
>+	if (dir < 0)
>+		return false;
>+
>+	res = __igt_parse_drm_fdinfo(dir, fd, info);
>+
>+	close(dir);
>+
>+	return res;
>+}
>diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
>new file mode 100644
>index 000000000000..c527bab9a204
>--- /dev/null
>+++ b/lib/igt_drm_fdinfo.h
>@@ -0,0 +1,48 @@
>+/*
>+ * Copyright © 2022 Intel Corporation
>+ *
>+ * Permission is hereby granted, free of charge, to any person obtaining a
>+ * copy of this software and associated documentation files (the "Software"),
>+ * to deal in the Software without restriction, including without limitation
>+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>+ * and/or sell copies of the Software, and to permit persons to whom the
>+ * Software is furnished to do so, subject to the following conditions:
>+ *
>+ * The above copyright notice and this permission notice (including the next
>+ * paragraph) shall be included in all copies or substantial portions of the
>+ * Software.
>+ *
>+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
>+ * IN THE SOFTWARE.
>+ *
>+ */
>+
>+#ifndef IGT_DRM_FDINFO_H
>+#define IGT_DRM_FDINFO_H
>+
>+#include <sys/types.h>
>+#include <dirent.h>
>+#include <stdint.h>
>+#include <stdbool.h>
>+
>+struct drm_client_fdinfo {
>+	char driver[128];
>+	char pdev[128];
>+	unsigned long id;
>+
>+	unsigned int num_engines;
>+	unsigned int capacity[16];
>+	uint64_t busy[16];

I see 16 in a lot of places, wondering if it could use a #define?

Thanks,
Umesh

>+};
>+
>+bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info);
>+
>+bool __igt_parse_drm_fdinfo(int dir, const char *fd,
>+			    struct drm_client_fdinfo *info);
>+
>+#endif /* IGT_DRM_FDINFO_H */
>diff --git a/lib/meson.build b/lib/meson.build
>index 3e43316d1e36..d00817dc58bc 100644
>--- a/lib/meson.build
>+++ b/lib/meson.build
>@@ -16,6 +16,7 @@ lib_sources = [
> 	'igt_debugfs.c',
> 	'igt_device.c',
> 	'igt_device_scan.c',
>+	'igt_drm_fdinfo.c',
> 	'igt_aux.c',
> 	'igt_gt.c',
> 	'igt_halffloat.c',
>@@ -216,6 +217,12 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
> lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
> 				  include_directories : inc)
>
>+lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
>+	['igt_drm_fdinfo.c'],
>+	include_directories : inc)
>+
>+lib_igt_drm_fdinfo = declare_dependency(link_with : lib_igt_drm_fdinfo_build,
>+				  include_directories : inc)
> i915_perf_files = [
>   'igt_list.c',
>   'i915/perf.c',
>-- 
>2.32.0
>
