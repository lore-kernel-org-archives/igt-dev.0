Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9119910F05C
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Aug 2022 18:30:42 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 Aug 2022 18:30:14 +0000
Message-Id: <20220823183036.5270-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 01/23] i915/perf: Check regularly if we are
 done reading reports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

If we pass a user buffer as large as the OA buffer, the OA unit will
return all available reports. In the second part of the
buffer-fill/enable-disable tests, we are collecting all reports within a
time window, but we only check the time window in the outer while loop.
We may have read well past that window if OA returns more reports. Fix
this rare failure by checking for the window within the inner for loop.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 5502a3fb..51e2dc87 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -2522,6 +2522,9 @@ test_buffer_fill(void)
 						first_timestamp = report[1];
 					last_timestamp = report[1];
 
+					if (((last_timestamp - first_timestamp) * oa_period) < (fill_duration / 2))
+						break;
+
 					if (oa_report_is_periodic(oa_exponent, report)) {
 						memcpy(last_periodic_report, report,
 						       sizeof(last_periodic_report));
@@ -2537,6 +2540,8 @@ test_buffer_fill(void)
 
 		do_ioctl(stream_fd, I915_PERF_IOCTL_DISABLE, 0);
 
+		igt_debug("first ts = %u, last ts = %u\n", first_timestamp, last_timestamp);
+
 		igt_debug("%f < %zu < %f\n",
 			  report_size * n_full_oa_reports * 0.45,
 			  n_periodic_reports * report_size,
@@ -2732,6 +2737,9 @@ test_enable_disable(void)
 						  oa_report_is_periodic(oa_exponent, report),
 						  oa_report_get_ctx_id(report));
 
+					if (((last_timestamp - first_timestamp) * oa_period) < (fill_duration / 2))
+						break;
+
 					if (oa_report_is_periodic(oa_exponent, report)) {
 						memcpy(last_periodic_report, report,
 						       sizeof(last_periodic_report));
@@ -2755,6 +2763,8 @@ test_enable_disable(void)
 
 		do_ioctl(stream_fd, I915_PERF_IOCTL_DISABLE, 0);
 
+		igt_debug("first ts = %u, last ts = %u\n", first_timestamp, last_timestamp);
+
 		igt_debug("%f < %zu < %f\n",
 			  report_size * n_full_oa_reports * 0.45,
 			  n_periodic_reports * report_size,
-- 
2.25.1
