Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA7F10E8B0
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 19:20:26 +0000 (UTC)
Date: Fri, 3 Feb 2023 11:20:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <Y91eYOfdMN3PIRdB@orsosgc001.jf.intel.com>
References: <20230201043903.1847377-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230201043903.1847377-1-riana.tauro@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/perf_pmu: Add a basic
 perf_pmu test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, tvrtko.ursulin@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 01, 2023 at 10:09:03AM +0530, Riana Tauro wrote:
>add a test that verifies the i915 pmu directory and
>reads all the events
>
>v2 : use igt_assert_eq instead of igt_assert
>     check errno after loop (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


>---
> lib/igt_perf.c        | 11 +++++++++++
> lib/igt_perf.h        |  1 +
> tests/i915/perf_pmu.c | 32 ++++++++++++++++++++++++++++++++
> 3 files changed, 44 insertions(+)
>
>diff --git a/lib/igt_perf.c b/lib/igt_perf.c
>index 11c91c5f..ffe078ad 100644
>--- a/lib/igt_perf.c
>+++ b/lib/igt_perf.c
>@@ -1,5 +1,6 @@
> #include <errno.h>
> #include <fcntl.h>
>+#include <limits.h>
> #include <stdint.h>
> #include <stdlib.h>
> #include <string.h>
>@@ -98,6 +99,16 @@ uint64_t igt_perf_type_id(const char *device)
> 	return strtoull(buf, NULL, 0);
> }
>
>+int igt_perf_events_dir(int i915)
>+{
>+	char buf[80];
>+	char path[PATH_MAX];
>+
>+	i915_perf_device(i915, buf, sizeof(buf));
>+	snprintf(path, sizeof(path), "/sys/bus/event_source/devices/%s/events", buf);
>+	return open(path, O_RDONLY);
>+}
>+
> static int
> _perf_open(uint64_t type, uint64_t config, int group, uint64_t format)
> {
>diff --git a/lib/igt_perf.h b/lib/igt_perf.h
>index 672bfea6..4d86e31a 100644
>--- a/lib/igt_perf.h
>+++ b/lib/igt_perf.h
>@@ -54,6 +54,7 @@ perf_event_open(struct perf_event_attr *attr,
> }
>
> uint64_t igt_perf_type_id(const char *device);
>+int igt_perf_events_dir(int i915);
> int igt_perf_open(uint64_t type, uint64_t config);
> int igt_perf_open_group(uint64_t type, uint64_t config, int group);
>
>diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
>index f363db2b..c1779fc9 100644
>--- a/tests/i915/perf_pmu.c
>+++ b/tests/i915/perf_pmu.c
>@@ -2132,6 +2132,34 @@ static void test_unload(unsigned int num_engines)
> 	igt_assert_eq(__igt_i915_driver_unload(NULL), 0);
> }
>
>+static void pmu_read(int i915)
>+{
>+	char val[128];
>+	int pmu_fd;
>+	struct dirent *de;
>+	DIR *dir;
>+
>+	pmu_fd = igt_perf_events_dir(i915);
>+	igt_require(pmu_fd >= 0);
>+
>+	dir = fdopendir(dup(pmu_fd));
>+	igt_assert(dir);
>+	rewinddir(dir);
>+
>+	errno = 0;
>+	while ((de = readdir(dir))) {
>+		if (de->d_type != DT_REG)
>+			continue;
>+
>+		igt_assert_eq(igt_sysfs_scanf(pmu_fd, de->d_name, "%127s", val), 1);
>+		igt_debug("'%s': %s\n", de->d_name, val);
>+	}
>+
>+	igt_assert_eq(errno, 0);
>+	closedir(dir);
>+	close(pmu_fd);
>+}
>+
> #define test_each_engine(T, i915, ctx, e) \
> 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
> 		igt_dynamic_f("%s", e->name)
>@@ -2167,6 +2195,10 @@ igt_main
> 		igt_require(num_engines);
> 	}
>
>+	igt_describe("Verify i915 pmu dir exists and read all events");
>+	igt_subtest("pmu-read")
>+		pmu_read(fd);
>+
> 	/**
> 	 * Test invalid access via perf API is rejected.
> 	 */
>-- 
>2.39.0
>
