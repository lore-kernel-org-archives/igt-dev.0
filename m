Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23B36E986
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Mar 2021 07:20:44 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Wed, 24 Mar 2021 12:28:07 +0530
Message-Id: <1616569087-30691-1-git-send-email-jigar.bhatt@intel.com>
Subject: [igt-dev] [i-g-t RFC] tests/i915_pm_rpm: Add suspend-resume-latency
 test
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
List-ID: <igt-dev@lists.freedesktop.org>

Measuring the suspend-resume time using
tracefs, writing Suspend Started, Suspend Completed,
Resume Ended timestamp into tracefs file.
After writing it's reading from tracefs file and
measuring different, suspend and resume ,
individual must be less than 1 sec.

Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_rpm.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 694a3ea..67d823c 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1998,6 +1998,83 @@ static int opt_handler(int opt, int opt_index, void *data)
 	return IGT_OPT_HANDLER_SUCCESS;
 }
 
+static void dpms_off(struct mode_set_data *data)
+{
+        for (int i = 0; i < data->res->count_connectors; i++) {
+                drmModeConnectorPtr c = data->connectors[i];
+                kmstest_set_connector_dpms(drm_fd, c, DRM_MODE_DPMS_OFF);
+        }
+}
+static void dpms_on(struct mode_set_data *data)
+{
+        igt_display_t display;
+
+        igt_display_require(&display, drm_fd);
+        for (int i = 0; i < data->res->count_connectors; i++) {
+                drmModeConnectorPtr c = data->connectors[i];
+                kmstest_set_connector_dpms(drm_fd, c, DRM_MODE_DPMS_ON);
+        }
+
+}
+
+static uint32_t get_trace_timestamp(char *dc_data)
+{
+        char *e;
+        long ret;
+        char *s = strchr(dc_data, ':');
+
+        assert(s);
+        s++;
+        ret = strtol(s, &e, 10);
+        assert(((ret != LONG_MIN && ret != LONG_MAX) || errno != ERANGE) &&
+               e > s && *e == '\n' && ret >= 0);
+        return ret;
+}
+
+static long int get_timestamp(void)
+{
+        struct timespec start;
+
+        clock_gettime(CLOCK_MONOTONIC_RAW, &start);
+        return ( start.tv_sec * 1000000 + (start.tv_nsec / 1000));
+}
+
+static void read_trace(void)
+{
+        int fd;
+        char buf[4096];
+
+        fd=open("/sys/kernel/debug/tracing/trace",O_RDONLY);
+        igt_assert(fd>0);
+        igt_assert(read(fd, buf, sizeof(buf)));
+        igt_assert(((float)(get_trace_timestamp(strstr(buf,"Suspend_Completed")) -
+			get_trace_timestamp(strstr(buf,"Suspend_Started")))/1000000)<2);
+        igt_assert(((float)(get_trace_timestamp(strstr(buf,"Resume_Ended")) -
+			get_trace_timestamp(strstr(buf,"Suspend_Completed")))/1000000)<1);
+        close(fd);
+}
+
+static void test_suspend_resume_latency(struct mode_set_data *data)
+{
+        int fd;
+        char msg[400];
+
+        fd=open("/sys/kernel/debug/tracing/trace_marker",O_WRONLY);
+        igt_assert(fd>0);
+        snprintf(msg,100,"Suspend_Started : %ld",get_timestamp());
+        write(fd,msg,strlen(msg));
+        dpms_off(data);
+        igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+        snprintf(msg,100,"Suspend_Completed : %ld",get_timestamp());
+        write(fd,msg,strlen(msg));
+        dpms_on(data);
+        igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
+        snprintf(msg,100,"Resume_Ended : %ld",get_timestamp());
+        write(fd,msg,strlen(msg));
+        close(fd);
+        read_trace();
+}
+
 const char *help_str =
 	"  --stress\t\tMake the stress-tests more stressful.\n"
 	"  --stay\t\tDisable all screen and try to go into runtime pm. Useful for debugging.";
@@ -2147,6 +2224,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		pm_test_caching();
 	}
 
+	igt_subtest("suspend-resume-latency") {
+                test_suspend_resume_latency(&ms_data);
+        }
+
 	igt_fixture
 		teardown_environment(false);
 
-- 
2.8.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
