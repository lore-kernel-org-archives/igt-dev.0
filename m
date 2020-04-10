Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308B089B7D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2020 10:22:01 +0000 (UTC)
From: Terrence Xu <terrence.xu@intel.com>
Date: Fri, 10 Apr 2020 18:20:46 +0800
Message-Id: <20200410102046.6428-1-terrence.xu@intel.com>
Subject: [igt-dev] [i-g-t] i915/perf: Correct the logic of finding i915 pmu
 event path
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
Cc: colin.xu@intel.com, zhenyu.z.wang@intel.com, gordon.jin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Hardcoded i915 PMU event path /sys/bus/event_source/devices/i915
isn't always correct when vGPU isn't on BDF 0:2.0 in virtualization
environment.

e.g. It will show as sys/bus/event_source/devices/i915-0000:00:03.0
when vGPU is on BDF 0:3.0.

Refine the path name so that intel_gpu_top can find the correct adapter.

Signed-off-by: Terrence Xu <terrence.xu@intel.com>
---
 lib/igt_perf.c        | 15 ++++++++++++++-
 tools/intel_gpu_top.c | 16 +++++++++++++++-
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index 418c1c188..3531209b3 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -7,6 +7,7 @@
 #include <sys/stat.h>
 #include <sys/sysinfo.h>
 #include <sys/sysmacros.h>
+#include <dirent.h>
 
 #include "igt_perf.h"
 
@@ -75,11 +76,23 @@ uint64_t i915_perf_type_id(int i915)
 uint64_t igt_perf_type_id(const char *device)
 {
 	char buf[64];
+	char dev[64];
 	ssize_t ret;
 	int fd;
+	DIR *dir;
+	struct dirent *dent;
+
+	dir = opendir("/sys/bus/event_source/devices/");
+
+	while ((dent = readdir(dir))) {
+		if (!(strncmp(dent->d_name, device, strlen(device)))) {
+			strcpy(dev, dent->d_name);
+			break;
+		}
+	}
 
 	snprintf(buf, sizeof(buf),
-		 "/sys/bus/event_source/devices/%s/type", device);
+		 "/sys/bus/event_source/devices/%s/type", dev);
 
 	fd = open(buf, O_RDONLY);
 	if (fd < 0)
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 8197482dd..065c40bba 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -170,11 +170,13 @@ static int engine_cmp(const void *__a, const void *__b)
 
 static struct engines *discover_engines(void)
 {
-	const char *sysfs_root = "/sys/devices/i915/events";
+	const char *sysfs_root = "/sys/bus/event_source/devices/";
 	struct engines *engines;
 	struct dirent *dent;
 	int ret = 0;
 	DIR *d;
+	char dev[64];
+	char eve[64];
 
 	engines = malloc(sizeof(struct engines));
 	if (!engines)
@@ -184,7 +186,19 @@ static struct engines *discover_engines(void)
 
 	engines->num_engines = 0;
 
+
 	d = opendir(sysfs_root);
+	while ((dent = readdir(d))) {
+
+		if (!(strncmp(dent->d_name, "i915", 4))) {
+			strcpy(dev, dent->d_name);
+			break;
+		}
+	}
+
+	sprintf(eve, "%s%s/events", sysfs_root, dev);
+
+	d = opendir(eve);
 	if (!d)
 		return NULL;
 
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
