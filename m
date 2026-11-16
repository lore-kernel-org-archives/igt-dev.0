Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344A4606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=chku2wuA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EB510EA4B;
	Mon, 16 Nov 2026 14:56:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFF210E755
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794840884; x=1826376884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=86aw7nrNXwI13FU8ErT6vPiQAZAO6p6gx0M0KnDTvRg=;
 b=chku2wuAuRDTlA5sQ52zFra1teVR4DBaphFLcwWTM/UnJGQuN0ewrdX9
 0cDAK74MzFWd+lfMOKJC7xkgzD9Mg0cMYV66JdbxhJOdpzEuztoQjfxS0
 pAMcA2tCwsR81hznQZhm+BOqDZKZ53kuY9rmfaZr2aLeY1hNiyZR4P/by
 a9dRZkJsrpQnz93aumFU55oXJ6XkFpsijd5z+1qDOiXUa2UZeUp/Cm/K+
 alZma/0iIbjb6X+80/XLVa8iOC+st2MdmPzqYpWPhiutXDqqKGTKM2IUM
 9XpF4tRuYKgROqYmAF1fJFjczNCdv+loNlkn+cXF5yiCpagdrFk4VbfJv g==;
X-CSE-ConnectionGUID: +EHWPT8ER7OgDVdBkd0UGw==
X-CSE-MsgGUID: L3cs6RrTSz+rKajQRSvugA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3594904"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3594904"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:54:39 -0800
X-CSE-ConnectionGUID: v6vTe1jDTduRel8VT/Umpw==
X-CSE-MsgGUID: 7Ylj5Z2FTuGeOlFE/EVp7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9412818"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:54:37 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 anshuman.gupta@intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com, sk.anirban@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 1/4] tests/xe_err_injection: add CPER tracefs event format
 validation
Date: Mon, 16 Nov 2026 20:24:07 +0530
Message-Id: <20261116145410.1649875-2-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116145410.1649875-1-ravi.kishore.koppuravuri@intel.com>
References: <20261116145410.1649875-1-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add CPER tracefs paths and verify that the existence of xe_error_cper
event and cper_on_query sysfs entry, exposes the expected format fields,
and supports enable/disable through tracefs and sysfs.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v3:
  - Introduced validation of configuring cper_on_query sysfs entry for CPER records
---
 tests/intel/xe_cper.h          |  21 ++++
 tests/intel/xe_err_injection.c | 180 +++++++++++++++++++++++++++++++++
 2 files changed, 201 insertions(+)
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
index 74ae9b243..6efe092c7 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -18,13 +18,17 @@
 #include <string.h>
 #include <time.h>
 #include <unistd.h>
+#include <sys/types.h>
+#include <sys/stat.h>
 
 #include "igt.h"
+#include "lib/igt_device.h"
 #include "lib/igt_drm_ras_nl.h"
 #include "lib/intel_chipset.h"
 #include "lib/intel_reg.h"
 #include "lib/intel_compute.h"
 
+#include "xe_cper.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_mmio.h"
@@ -531,6 +535,163 @@ static void require_cri_gpu(int fd)
 		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
 }
 
+/* ====================== CPER helper functions ====================== */
+/**
+ * is_dir_exist - check whether the given directory path exists
+ */
+static bool is_dir_exist(const char *path)
+{
+	struct stat st;
+
+	return stat(path, &st) == 0 && S_ISDIR(st.st_mode);
+}
+
+/**
+ * configure_xe_cper_tracefs - enable / disable the xe_error_cper trace event
+ */
+static void configure_xe_cper_tracefs(bool state)
+{
+	int fd;
+	const char val = state ? '1' : '0';
+
+	fd = open(XE_CPER_ENABLE, O_WRONLY);
+	igt_assert_f(fd >= 0, "Cannot open %s: %s\n", XE_CPER_ENABLE,
+		     strerror(errno));
+	igt_assert_eq(write(fd, &val, 1), 1);
+	igt_info("Trace event %sabled: %s\n", state ? "en" : "dis", XE_CPER_ENABLE);
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
+ * configure_cper_on_query_entry - enable or disable the device's cper_on_query sysfs attribute
+ */
+static void configure_cper_on_query_entry(int drm_fd, bool state)
+{
+	char pci_slot_name[NAME_MAX];
+	char path[PATH_MAX];
+	const char config_val = state ? '1' : '0';
+	int fd;
+
+	igt_device_get_pci_slot_name(drm_fd, pci_slot_name);
+	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/cper_on_query", pci_slot_name);
+
+	fd = open(path, O_WRONLY);
+	igt_assert_f(fd >= 0, "Cannot open %s: %s\n", path, strerror(errno));
+	igt_assert_f(write(fd, &config_val, 1) == 1,
+		     "Failed to %s cper_on_query at %s: %s\n",
+		     state ? "enable" : "disable", path, strerror(errno));
+	close(fd);
+
+	igt_info("%sabled: %s\n", state ? "en" : "dis", path);
+}
+
+/**
+ * SUBTEST: cper-validate-tracefs-event
+ * Description: Verify that the xe_error_cper tracefs event exists under
+ * /sys/kernel/debug/tracing/events/xe/xe_error_cper/, that its 'format'
+ * file contains the expected fields (dev, severity, platform_id, fru_id,
+ * intel_err_hdr_raw, cper_len, cper_raw), and that 'enable' can be toggled.
+ */
+
+/**
+ * test_cper_validate_tracefs_event - verify the tracefs event directory and format
+ * file contain the expected field names emitted by the xe_error_cper
+ * TRACE_EVENT definition (TP_STRUCT__entry fields).
+ */
+static void test_cper_validate_tracefs_event(int drm_fd)
+{
+	int fd;
+	char buf[4096] = { 0 };
+	char pci_slot_name[NAME_MAX];
+	char cper_on_query_path[PATH_MAX];
+	ssize_t n;
+
+	igt_require_f(is_dir_exist(XE_CPER_EVENT_DIR),
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
+	configure_xe_cper_tracefs(true);
+	fd = open(XE_CPER_ENABLE, O_RDONLY);
+	igt_assert(fd >= 0);
+	n = read(fd, buf, 2);
+	close(fd);
+	igt_assert_eq(buf[0], '1');
+
+	configure_xe_cper_tracefs(false);
+	fd = open(XE_CPER_ENABLE, O_RDONLY);
+	igt_assert(fd >= 0);
+	n = read(fd, buf, 2);
+	close(fd);
+	igt_assert_eq(buf[0], '0');
+
+	/* Verify cper_on_query sysfs attribute can be toggled */
+	igt_device_get_pci_slot_name(drm_fd, pci_slot_name);
+	snprintf(cper_on_query_path, sizeof(cper_on_query_path),
+		 "/sys/bus/pci/devices/%s/cper_on_query", pci_slot_name);
+	igt_require_f(access(cper_on_query_path, F_OK) == 0,
+		      "cper_on_query sysfs attribute not present at %s\n", cper_on_query_path);
+
+	configure_cper_on_query_entry(drm_fd, true);
+	fd = open(cper_on_query_path, O_RDONLY);
+	igt_assert(fd >= 0);
+	n = read(fd, buf, 2);
+	close(fd);
+	igt_assert_eq(buf[0], '1');
+
+	configure_cper_on_query_entry(drm_fd, false);
+	fd = open(cper_on_query_path, O_RDONLY);
+	igt_assert(fd >= 0);
+	n = read(fd, buf, 2);
+	close(fd);
+	igt_assert_eq(buf[0], '0');
+}
+
 enum xe_err_injection_type {
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
@@ -562,6 +723,21 @@ static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *m
 	}
 }
 
+enum xe_cper_test {
+	XE_CPER_VALIDATE_TRACEFS_EVENT,
+};
+
+static void run_cper_test(enum xe_cper_test test, int fd)
+{
+	switch (test) {
+	case XE_CPER_VALIDATE_TRACEFS_EVENT:
+		test_cper_validate_tracefs_event(fd);
+		break;
+	default:
+		igt_info("Invalid CPER test specified\n");
+	}
+}
+
 int igt_main()
 {
 	int fd;
@@ -608,6 +784,10 @@ int igt_main()
 	igt_subtest("inject_core_compute_corr_error_once")
 		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE, &mmio, fd);
 
+	igt_describe("Verify the xe_error_cper tracefs event exists and has the expected format.");
+	igt_subtest("cper-validate-tracefs-event")
+		run_cper_test(XE_CPER_VALIDATE_TRACEFS_EVENT, fd);
+
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
 		drm_close_driver(fd);
-- 
2.34.1

