Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421C1C61DCB
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 17:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FAF10E4BF;
	Fri, 28 Aug 2026 17:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JweUb5od";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A37110E4BF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787936696; x=1819472696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ugyvRzSEFP2kcBjcxdZK0kGF2BQrgD7AXC+4kuzi7hs=;
 b=JweUb5odPLbX9eSTXADDx/xV2IdMcsWlaZxp7dtuYbVHpbQZUYceeQy1
 GasKdtq16uGqxpqtxgHKVI06hWO4UkmIA9tIICrODdfrS52PHTAvhLgnF
 tLJqhu2jE7BlVxN/fEPeZjSSNsNp0kXvzRRZ9lpwdZI+ZeWLOx4ouUxRW
 crSmYbFU0hBx4lQhyzV52jMSo3bR5jrLZmbZFDlxiV9fXDxXP/PpSpkVh
 6iEdj2TloA6jNoX11XXhfhHXhI4DGEqXY0akSCKVhxj4D3+8NsZc39Mbf
 R9uygY1O/tp7tpj9KIv/58Ee4OF5czagiP82MnnD6vOVJQ8AOW2bxmin5 A==;
X-CSE-ConnectionGUID: +9A+Wn2YRr+B5SlEXVlJPg==
X-CSE-MsgGUID: rAkUKBSwQ9WiFVqXhZR0GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="98787249"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="98787249"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:04:56 -0700
X-CSE-ConnectionGUID: zlM59Q+VTe+GwuEChN1hhw==
X-CSE-MsgGUID: Gm2Yj/dFRcOMO3Hx7NZiyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="264457881"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:04:52 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: badal.nilawar@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v2 1/4] tests/xe_err_injection: validate CPER tracefs event
 format
Date: Fri, 28 Aug 2026 22:34:36 +0530
Message-Id: <20260828170439.204268-2-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260828170439.204268-1-ravi.kishore.koppuravuri@intel.com>
References: <20260828170439.204268-1-ravi.kishore.koppuravuri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add CPER tracefs paths and verify that the xe_error_cper event
exists, exposes the expected format fields, and supports enable/disable
through tracefs.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 tests/intel/xe_cper.h          |  21 ++++++
 tests/intel/xe_err_injection.c | 119 +++++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 tests/intel/xe_cper.h

diff --git a/tests/intel/xe_cper.h b/tests/intel/xe_cper.h
new file mode 100644
index 000000000..706c63715
--- /dev/null
+++ b/tests/intel/xe_cper.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef XE_CPER_H
+#define XE_CPER_H
+
+/* tracefs paths */
+#define TRACEFS_ROOT		"/sys/kernel/tracing"
+#define XE_CPER_EVENT_DIR	TRACEFS_ROOT "/events/xe/xe_error_cper"
+#define XE_CPER_ENABLE		XE_CPER_EVENT_DIR "/enable"
+#define XE_CPER_FORMAT		XE_CPER_EVENT_DIR "/format"
+#define TRACEFS_TRACE_PIPE	TRACEFS_ROOT "/trace_pipe"
+#define TRACEFS_TRACE		TRACEFS_ROOT "/trace"
+#define TRACEFS_TRACE_CLEAR	TRACEFS_ROOT "/trace"
+
+/* Timeout waiting for a trace event to appear (seconds) */
+#define CPER_EVENT_TIMEOUT_SEC		10
+
+#endif /* XE_CPER_H */
diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index d17d049f4..37f4c2edd 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -17,6 +17,9 @@
 #include <time.h>
 #include <fcntl.h>
 #include <unistd.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+
 
 #include "igt.h"
 #include "lib/igt_drm_netlink.h"
@@ -24,6 +27,7 @@
 #include "lib/intel_reg.h"
 #include "lib/intel_compute.h"
 
+#include "xe_cper.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_mmio.h"
@@ -545,6 +549,117 @@ static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
 	CLEANUP_ON_ERROR(ctx, fw_handle);
 }
 
+/* ====================== CPER helper functions ====================== */
+/**
+ * tracefs_event_exists - check xe_error_cper event directory is present
+ */
+static bool tracefs_event_exists(void)
+{
+	struct stat st;
+
+	return stat(XE_CPER_EVENT_DIR, &st) == 0 && S_ISDIR(st.st_mode);
+}
+
+/**
+ * tracefs_enable_xe_cper - enable / disable the xe_error_cper trace event
+ */
+static void tracefs_enable_xe_cper(bool enable)
+{
+	int fd;
+	const char val = enable ? '1' : '0';
+
+	fd = open(XE_CPER_ENABLE, O_WRONLY);
+	igt_assert_f(fd >= 0, "Cannot open %s: %s\n", XE_CPER_ENABLE,
+		     strerror(errno));
+	igt_assert_eq(write(fd, &val, 1), 1);
+	igt_info("Trace event %sabled: %s\n", enable ? "en" : "dis", XE_CPER_ENABLE);
+	close(fd);
+}
+
+/**
+ * tracefs_clear_trace - wipe the trace ring buffer
+ */
+static void tracefs_clear_trace(void)
+{
+	int fd = open(TRACEFS_TRACE_CLEAR, O_WRONLY | O_TRUNC);
+
+	if (fd >= 0)
+		close(fd);
+
+	igt_info("Cleared trace buffer: %s\n", TRACEFS_TRACE_CLEAR);
+}
+
+/**
+ * SUBTEST: cper-tracefs-event-format
+ * Description: Verify that the xe_error_cper tracefs event exists under
+ * /sys/kernel/debug/tracing/events/xe/xe_error_cper/, that its 'format'
+ * file contains the expected fields (dev, severity, platform_id, fru_id,
+ * intel_err_hdr_raw, cper_len, cper_raw), and that 'enable' can be toggled.
+ */
+
+/**
+ * test_tracefs_event_format - verify the tracefs event directory and format
+ * file contain the expected field names emitted by the xe_error_cper
+ * TRACE_EVENT definition (TP_STRUCT__entry fields).
+ */
+static void test_tracefs_event_format(void)
+{
+	int fd;
+	char buf[4096] = { 0 };
+	ssize_t n;
+
+	igt_require_f(tracefs_event_exists(),
+		      "xe_error_cper trace event not present at %s\n"
+		      "(kernel xe driver may not have CONFIG_TRACING enabled)\n",
+		      XE_CPER_EVENT_DIR);
+
+	fd = open(XE_CPER_FORMAT, O_RDONLY);
+	igt_assert_f(fd >= 0, "Cannot open %s: %s\n", XE_CPER_FORMAT,
+		     strerror(errno));
+	n = read(fd, buf, sizeof(buf) - 1);
+	close(fd);
+	igt_assert_f(n > 0, "Empty format file at %s\n", XE_CPER_FORMAT);
+	buf[n] = '\0';
+
+	/* Verify that all TP_STRUCT__entry fields are present in the format */
+	igt_assert_f(strstr(buf, "dev"),
+		     "Missing 'dev' field in xe_error_cper format\n");
+	igt_assert_f(strstr(buf, "platform_id"),
+		     "Missing 'platform_id' field in xe_error_cper format\n");
+	igt_assert_f(strstr(buf, "fru_id"),
+		     "Missing 'fru_id' field in xe_error_cper format\n");
+	igt_assert_f(strstr(buf, "sev"),
+		     "Missing 'sev' field in xe_error_cper format\n");
+	igt_assert_f(strstr(buf, "ihdr_raw"),
+		     "Missing 'ihdr_raw' field in xe_error_cper format\n");
+	igt_assert_f(strstr(buf, "cper_len"),
+		     "Missing 'cper_len' field in xe_error_cper format\n");
+	igt_assert_f(strstr(buf, "cper"),
+		     "Missing 'cper' dynamic array field in xe_error_cper format\n");
+
+	igt_info("xe_error_cper tracefs format verified:\n"
+		     "Below is the content of %s:\n"
+		     "=========================================\n"
+		     "%s"
+		     "=========================================\n"
+		     "\n", XE_CPER_FORMAT, buf);
+
+	/* Verify enable/disable toggle */
+	tracefs_enable_xe_cper(true);
+	fd = open(XE_CPER_ENABLE, O_RDONLY);
+	igt_assert(fd >= 0);
+	n = read(fd, buf, 2);
+	close(fd);
+	igt_assert_eq(buf[0], '1');
+
+	tracefs_enable_xe_cper(false);
+	fd = open(XE_CPER_ENABLE, O_RDONLY);
+	igt_assert(fd >= 0);
+	n = read(fd, buf, 2);
+	close(fd);
+	igt_assert_eq(buf[0], '0');
+}
+
 static void igt_require_cri(int fd)
 {
 	uint16_t dev_id = xe_dev_id(fd);
@@ -616,6 +731,10 @@ int igt_main()
 	igt_subtest("test_l2-bank-single-corr-err")
 		inject_error("test_l2-bank-single-corr-err", &mmio, fd);
 
+	igt_describe("Verify the xe_error_cper tracefs event exists and has the expected format.");
+	igt_subtest("cper-tracefs-event-format")
+		test_tracefs_event_format();
+
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
 		drm_close_driver(fd);
-- 
2.34.1

