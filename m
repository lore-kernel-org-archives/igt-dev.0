Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAE2CA0EED
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 00:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D9B10E027;
	Sat, 23 Aug 2025 00:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ybkns5S9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115B310E027
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 00:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755909335; x=1787445335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ne1/h6KAUQaQw/nrTBFBX81Wq3SqX3HOeCk2M3D13hs=;
 b=Ybkns5S9SnO44PIZ9o9G9SgIbxBbuFG+F3QxC4nQS307KCiIJjChVBhV
 9ioxbsU9VP48JfBjas+uzxA75d4QMa0Sa+aLLsv+a009zD6RpzZWGwNjy
 e4lSpzIjT/FNKqvJBVZNyLL89GSSk5gzUwwalbnezTFb9CdKMZAiUf68S
 AYN5OTUaX96hCJJr5/K6GZ6GtUyuGXAqfYrMrh+6pmAhYRrn5JzPk+4XY
 5HyMGz9fqp/cKMlaHFUte7rk6ugh4tKF+XTMLIdKUrlVRzbhwzcI7BabH
 yhMoc4q8hjVT7T8cPhUOeJlO7ci2jbJJ/uWR7mDItlZO/1zLLoEBFtl8i w==;
X-CSE-ConnectionGUID: Mn+2JMbQRzGfpRn3ozAq7A==
X-CSE-MsgGUID: KSt5b/aSQuiqqBmqiZ7vAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58146831"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58146831"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:35:35 -0700
X-CSE-ConnectionGUID: HD7Mite2RYCkOJ7sJ957Zg==
X-CSE-MsgGUID: IzVyXCwnTY2BFcMsDEqOwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168732398"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:35:34 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/xe_oa: Add an option to capture ftrace
Date: Fri, 22 Aug 2025 17:34:06 -0700
Message-ID: <20250823003401.109978-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250823003401.109978-6-umesh.nerlige.ramappa@intel.com>
References: <20250823003401.109978-6-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Capture ftrace with the --trace option when needed. This is not intended
to run as default, but more of a debug functionality when manually
running individual tests.

In addition configure the ftrace buffer using the --trace_buf_size_mb

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 58 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 7381e7b9bd44..e5473a5ff70f 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -307,6 +307,8 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
 		.bc_report = 0 },
 };
 
+static bool oa_trace = false;
+static uint32_t oa_trace_buf_mb = 20;
 static int drm_fd = -1;
 static int sysfs = -1;
 static int pm_fd = -1;
@@ -389,6 +391,31 @@ static u32 get_stream_status(int fd)
 	return status.oa_status;
 }
 
+static void enable_trace_log(void)
+{
+	char cmd[64] = {0};
+
+	if (!oa_trace || oa_trace_buf_mb > 20)
+		return;
+
+	snprintf(cmd, sizeof(cmd) - 1, "echo %d > /sys/kernel/debug/tracing/buffer_size_kb", oa_trace_buf_mb * 1000);
+	system(cmd);
+	system("echo 0 > /sys/kernel/debug/tracing/tracing_on");
+	system("echo > /sys/kernel/debug/tracing/trace");
+	system("echo 1 > /sys/kernel/debug/tracing/events/xe/enable");
+	system("echo 1 > /sys/kernel/debug/tracing/events/xe/xe_reg_rw/enable");
+	system("echo 1 > /sys/kernel/debug/tracing/tracing_on");
+}
+
+static void disable_trace_log(void)
+{
+	if (!oa_trace || oa_trace_buf_mb > 20)
+		return;
+
+	system("echo 0 > /sys/kernel/debug/tracing/tracing_on");
+	system("cat /sys/kernel/debug/tracing/trace");
+}
+
 static void
 dump_report(const uint32_t *report, uint32_t size, const char *message) {
 	uint32_t i;
@@ -4937,7 +4964,34 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 	igt_require_f(hwe, "no render engine\n"); \
 	igt_dynamic_f("rcs-%d", hwe->engine_instance)
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 'b':
+		oa_trace_buf_mb = strtoul(optarg, NULL, 0);
+		igt_debug("Trace buffer %d Mb\n", oa_trace_buf_mb);
+		break;
+	case 't':
+		oa_trace = true;
+		igt_debug("Trace enabled\n");
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const char *help_str =  "  --trace | -t\t\tEnable ftrace\n"
+			       "  --trace_buf_size_mb | -b\t\tSet ftrace buffer size in Mb (default = 0, max = 20)\n";
+
+static struct option long_options[] = {
+	{"trace", 0, 0, 't'},
+	{"trace_buf_size_mb", 0, 0, 'b'},
+	{ NULL, 0, 0, 0 }
+};
+
+igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 {
 	const struct sync_section {
 		const char *name;
@@ -4981,6 +5035,7 @@ igt_main
 		 */
 		igt_assert_eq(drm_fd, -1);
 
+		enable_trace_log();
 		drm_fd = drm_open_driver(DRIVER_XE);
 		xe_dev = xe_device_get(drm_fd);
 
@@ -5210,5 +5265,6 @@ igt_main
 			intel_xe_perf_free(intel_xe_perf);
 
 		drm_close_driver(drm_fd);
+		disable_trace_log();
 	}
 }
-- 
2.43.0

