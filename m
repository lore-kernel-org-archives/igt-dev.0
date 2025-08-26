Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D223DCA0FF0
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 22:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A91D10E2F7;
	Tue, 26 Aug 2025 22:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRHYtDWI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AC410E2E6
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 22:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756248272; x=1787784272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kQJ0fIMB7VsZ6oBWVCl3/QCiyICXlh+N9/Sro2TXFtw=;
 b=nRHYtDWI64uOxzZWoqict+oVsTOR0akp825OHdIU1D0l7w6AgawSN/pr
 MkgXZ0K78m+20pwnKrhaN4wIkpjkDA6Jte7ovAz7B/PXH7GJ5r7f4mNem
 lw5Mxs5buUv5CV+4IR//ceZfrMYPFMfeMPXuta5YMp9HWxBbcPVz3wS57
 VaLX7oY99Emxa2nkiZ3jlfd1WbKxgVuKy1LMvl74V8EoLE4/W7lAyoG3h
 9XC4RiILgiNf3Tm881lLUJe2kiJaT3W3myZeoRwye55ziccrBY8cVkjZy
 UvztqS5E2WAcAiy8+ntEGmJFcwhpWTmuibek5GZ8rK8bKEc/YNIU8ZWho A==;
X-CSE-ConnectionGUID: 4NyFfnRFRbmYKtalsv3VyA==
X-CSE-MsgGUID: lUx08T4LSNqmTs5vesF50g==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58595533"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58595533"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:44:32 -0700
X-CSE-ConnectionGUID: txjW+XzXTxWuLvZv+1zvog==
X-CSE-MsgGUID: CkU+MQkeTPeEQNT/YsHYzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="200647274"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:44:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 4/4] tests/intel/xe_oa: Add an option to capture
 register accesses in ftrace
Date: Tue, 26 Aug 2025 15:43:01 -0700
Message-ID: <20250826224256.510692-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826224256.510692-6-umesh.nerlige.ramappa@intel.com>
References: <20250826224256.510692-6-umesh.nerlige.ramappa@intel.com>
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

v2: (Ashutosh)
- Update commit title
- Check ftrace buffer size sooner. Use defaults
- s/Mb/MB
- x 1024 instead of x 1000

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 63 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 24442e4b83c6..2fb7c332226e 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -307,6 +307,8 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
 		.bc_report = 0 },
 };
 
+static bool oa_trace = false;
+static uint32_t oa_trace_buf_mb = 1;
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
+	if (!oa_trace)
+		return;
+
+	snprintf(cmd, sizeof(cmd) - 1, "echo %d > /sys/kernel/debug/tracing/buffer_size_kb", oa_trace_buf_mb * 1024);
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
+	if (!oa_trace)
+		return;
+
+	system("echo 0 > /sys/kernel/debug/tracing/tracing_on");
+	system("cat /sys/kernel/debug/tracing/trace");
+}
+
 static void
 dump_report(const uint32_t *report, uint32_t size, const char *message) {
 	uint32_t i;
@@ -4958,7 +4985,39 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 	igt_require_f(hwe, "no render engine\n"); \
 	igt_dynamic_f("rcs-%d", hwe->engine_instance)
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	uint32_t tmp;
+
+	switch (opt) {
+	case 'b':
+		tmp = strtoul(optarg, NULL, 0);
+		if (tmp <= 20 && tmp >= 1)
+			oa_trace_buf_mb = tmp;
+
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
+static const char *help_str =  "  --trace		| -t\t\tEnable ftrace\n"
+			       "  --trace_buf_size_mb	| -b\t\tSet ftrace buffer size in MB (default = 1, min = 1, max = 20)\n";
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
@@ -5002,6 +5061,7 @@ igt_main
 		 */
 		igt_assert_eq(drm_fd, -1);
 
+		enable_trace_log();
 		drm_fd = drm_open_driver(DRIVER_XE);
 		xe_dev = xe_device_get(drm_fd);
 
@@ -5235,5 +5295,6 @@ igt_main
 			intel_xe_perf_free(intel_xe_perf);
 
 		drm_close_driver(drm_fd);
+		disable_trace_log();
 	}
 }
-- 
2.43.0

