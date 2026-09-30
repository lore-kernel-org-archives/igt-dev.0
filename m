Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93414CA5FC7
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 15:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3850010E3E2;
	Wed, 30 Sep 2026 15:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdF+osZy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421E610E234
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790782698; x=1822318698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eNWL+WdXZd5yEwbaBKiO1yIYPGPxFWUn4a1QDyNbkKo=;
 b=VdF+osZyHxRvsOLOHT1/EuSxLtPQmt4ONHKaXFUET7ncvLuMPXL/2qr5
 f+vw6oP+EXB7VqbT132YDQ7/Xk/xiemQ07dstlpPS7E/oDA/7gm7Q4woZ
 3YlQCWYzMNtNclNPOFMeZ5NsrjPwrnV1MlyXGU4UPmtrkHvaVM+t7Axfa
 vzIXvHCcFMdW9mKDmqmHOjxUadGKxgDE0G5L1MDcvqEJeRZ6QpGe4CVIa
 PaKOT4e7MZhugNfYIV4l0R09vTKd2oCpDXbaDrWf7EmNbSBOHhq7hRbyk
 3UcXIq4Vo1BPdmqyRL60udvC6jtJCKRGqFEBldoueVJk1WIWvm63KcbdL Q==;
X-CSE-ConnectionGUID: jBURQyLPTmC//DkP3MmK5Q==
X-CSE-MsgGUID: FJrjgVcqT5SP4ghG+3PloQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102198127"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="102198127"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:38:18 -0700
X-CSE-ConnectionGUID: c/mX38l6QyuXXsbPCFtfpg==
X-CSE-MsgGUID: B9MCDSUOTia9/OKGUDAm5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="279046845"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:38:15 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ravi.kishore.koppuravuri@intel.com, raag.jadav@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v2 2/3] From: Ravi Kishore Koppuravuri
 ravi.kishore.koppuravuri@intel.com DO NOT REVIEW. COMPILATION ONLY.
Date: Wed, 30 Sep 2026 21:07:57 +0530
Message-ID: <20260930153755.2447513-7-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930153755.2447513-5-soham.purkait@intel.com>
References: <20260930153755.2447513-5-soham.purkait@intel.com>
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

From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

This patch is from https://patchwork.freedesktop.org/series/172806/
Added only for Compilation.

Signed-off-by: Soham Purkait soham.purkait@intel.com
---
 tests/intel/xe_cper.h          |  42 +++
 tests/intel/xe_err_injection.c | 488 +++++++++++++++++++++++++++++++++
 2 files changed, 530 insertions(+)
 create mode 100644 tests/intel/xe_cper.h

diff --git a/tests/intel/xe_cper.h b/tests/intel/xe_cper.h
new file mode 100644
index 000000000..ff061d35b
--- /dev/null
+++ b/tests/intel/xe_cper.h
@@ -0,0 +1,42 @@
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
+/* Standard UEFI CPER record header signature: "CPER" in little-endian */
+#define CPER_SIG_RECORD			0x52455043U  /* "CPER" */
+#define CPER_SIG_END			0xFFFFFFFFU
+#define CPER_REVISION			0x0100U
+
+/* CPER error_severity values (UEFI spec Table N-3) */
+#define CPER_SEV_RECOVERABLE		0U
+#define CPER_SEV_FATAL			1U
+#define CPER_SEV_CORRECTED		2U
+#define CPER_SEV_INFORMATIONAL		3U
+
+/* Intel Accelerator section type GUID string representation */
+#define INTEL_CPER_SECTION_ACCEL_GENERIC_STR \
+	"ea9d8f84-4258-5227-8028-b9b13e6d58b0"
+
+/* Sizes from the spec */
+#define CPER_RECORD_HEADER_SIZE		128U
+#define CPER_SECTION_DESC_SIZE		72U
+#define CPER_INTEL_PUB_HDR_SIZE		328U
+#define UUID_SIZE			16U
+
+#endif /* XE_CPER_H */
diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 5492c0b9a..6dcc2b1c4 100644
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
@@ -570,6 +574,476 @@ static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
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
+ * tracefs_read_trace - read the current trace buffer into a dynamically allocated buffer.
+ * Caller must free() the dynamic memory.
+ */
+static char *tracefs_read_trace(void)
+{
+	int fd;
+	char *buf;
+	ssize_t n;
+	size_t cap = 65536, used = 0;
+
+	fd = open(TRACEFS_TRACE, O_RDONLY);
+	igt_assert_f(fd >= 0, "Cannot open trace file: %s\n", strerror(errno));
+
+	igt_info("Reading trace buffer: %s\n", TRACEFS_TRACE);
+
+	/* trace file size is not known ahead of time; read in chunks */
+	buf = malloc(cap);
+	igt_assert(buf);
+
+	while (1) {
+		n = read(fd, buf + used, cap - used - 1);
+		if (n <= 0)
+			break;
+		used += n;
+		if (used >= cap - 1) {
+			cap *= 2;
+			buf = realloc(buf, cap);
+			igt_assert(buf);
+		}
+	}
+	buf[used] = '\0';
+	close(fd);
+	igt_info("Read %zu bytes from trace buffer\n", used);
+	return buf;
+}
+
+/**
+ * wait_for_cper_event - enable tracing, get_error_counter, wait up to
+ * CPER_EVENT_TIMEOUT_SEC for an xe_error_cper line to appear.
+ * Returns a malloc'd copy of the matching trace line, or NULL.
+ * Caller must free().
+ */
+static char *wait_for_cper_event(int drm_fd)
+{
+	char *trace, *line, *match = NULL;
+	int elapsed = 0, ret;
+	struct app_context ctx;
+
+	tracefs_enable_xe_cper(true);
+	tracefs_clear_trace();
+
+	/* Call igt_get_error_counter to dump the cper in tracefs */
+	ret = igt_init_nl_socket(&ctx);
+	if (ret < 0)
+		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
+
+	ctx.node_id = 0;
+	ctx.error_id = 1;
+	ret = igt_get_error_counter(&ctx);
+	if (ret < 0) {
+		igt_cleanup_nl_socket(&ctx);
+		igt_assert_f(false, "Failed to query GT correctable error counter\n");
+	}
+
+	/* Poll the trace buffer until xe_error_cper appears or timeout */
+	do {
+		sleep(1);
+		elapsed++;
+		trace = tracefs_read_trace();
+
+		/* Walk lines looking for "xe_error_cper:" */
+		for (line = strtok(trace, "\n"); line; line = strtok(NULL, "\n")) {
+			if (strstr(line, "xe_error_cper:")) {
+				match = strdup(line);
+				break;
+			}
+		}
+		free(trace);
+	} while (!match && elapsed < CPER_EVENT_TIMEOUT_SEC);
+
+	igt_cleanup_nl_socket(&ctx);
+	tracefs_enable_xe_cper(false);
+	tracefs_clear_trace();
+
+	return match;
+}
+
+/**
+ * parse_cper_event_field - extract a "key=value" token from a trace line.
+ * Returns a pointer into a static buffer; valid until the next call.
+ */
+static const char *parse_cper_event_field(const char *line, const char *key)
+{
+	static char val[512];
+	const char *p;
+	int klen;
+	size_t vlen;
+
+	klen = strlen(key);
+	p = strstr(line, key);
+	if (!p)
+		return NULL;
+	p += klen;
+	if (*p != '=')
+		return NULL;
+	p++;
+
+	if (!strcmp(key, "cper_raw"))
+		return p;
+
+	vlen = strcspn(p, " \t\n");
+
+	if (vlen >= sizeof(val))
+		vlen = sizeof(val) - 1;
+	memcpy(val, p, vlen);
+	val[vlen] = '\0';
+	return val;
+}
+
+/**
+ * hexbuf_get_byte - read byte at 'offset' from a "xx xx xx ..." hex string.
+ */
+static uint8_t hexbuf_get_byte(const char *hexstr, size_t offset)
+{
+	unsigned int b;
+	const char *p = hexstr;
+	size_t i;
+
+	for (i = 0; i <= offset; i++) {
+		while (*p == ' ')
+			p++;
+		igt_assert_f(sscanf(p, "%02x", &b) == 1,
+			     "Failed to parse hex byte %zu in '%s'\n", i, hexstr);
+		p += 2;
+	}
+	return (uint8_t)b;
+}
+
+/**
+ * hexbuf_get_u32le - read a 4-byte little-endian u32 starting at byte offset.
+ */
+static uint32_t hexbuf_get_u32le(const char *hexstr, size_t offset)
+{
+	uint32_t v = 0;
+	int i;
+
+	for (i = 0; i < 4; i++)
+		v |= (uint32_t)hexbuf_get_byte(hexstr, offset + i) << (8 * i);
+	return v;
+}
+
+static void format_guid(const uint8_t guid[UUID_SIZE], char string[37])
+{
+	snprintf(string, 37,
+		 "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-"
+		 "%02x%02x%02x%02x%02x%02x",
+		 guid[3], guid[2], guid[1], guid[0],
+		 guid[5], guid[4], guid[7], guid[6],
+		 guid[8], guid[9], guid[10], guid[11], guid[12], guid[13],
+		 guid[14], guid[15]);
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
+/**
+ * SUBTEST: cper-record-header
+ * Description: Inject a correctable hardware error and verify the CPER
+ * record header fields (signature "CPER", revision 0x0100, record_length,
+ * section_count >= 1, error_severity) by reading the xe_error_cper
+ * tracefs event output.
+ */
+
+/**
+ * test_cper_record_header - inject a correctable error, capture the
+ * xe_error_cper trace event and validate CPER record header fields from
+ * the cper_raw hex dump:
+ *   bytes  0-3:   signature == "CPER" (0x52455043)
+ *   bytes  4-5:   revision  == 0x0100
+ *   bytes  6-9:   signature_end == 0xFFFFFFFF
+ *   bytes 10-11:  section_count >= 1
+ *   bytes 12-15:  error_severity in [0..3]
+ *   bytes 20-23:  record_length >= CPER_RECORD_HEADER_SIZE
+ */
+static void test_cper_record_header(int drm_fd)
+{
+	char *event_line;
+	const char *cper_raw;
+	uint32_t sig, sig_end, rec_len, sev;
+	uint16_t rev, sec_cnt;
+
+	igt_require_f(tracefs_event_exists(),
+		      "xe_error_cper trace event not available\n");
+
+	event_line = wait_for_cper_event(drm_fd);
+	igt_assert_f(event_line,
+		     "No xe_error_cper trace event received within %d seconds "
+		     "after injecting CSC hardware error\n",
+		     CPER_EVENT_TIMEOUT_SEC);
+
+	igt_info("Captured trace event: %s\n", event_line);
+
+	cper_raw = parse_cper_event_field(event_line, "cper_raw");
+	igt_assert_f(cper_raw, "cper_raw field not found in trace event\n");
+
+	/* signature: bytes 0-3 LE == "CPER" */
+	sig = hexbuf_get_u32le(cper_raw, 0);
+	igt_assert_f(sig == CPER_SIG_RECORD,
+		     "CPER signature mismatch: got 0x%08x, expected 0x%08x\n",
+		     sig, CPER_SIG_RECORD);
+
+	/* revision: bytes 4-5 */
+	rev = (uint16_t)hexbuf_get_byte(cper_raw, 4) |
+	      ((uint16_t)hexbuf_get_byte(cper_raw, 5) << 8);
+	igt_assert_f(rev == CPER_REVISION,
+		     "CPER revision mismatch: got 0x%04x, expected 0x%04x\n",
+		     rev, CPER_REVISION);
+
+	/* signature_end: bytes 6-9 */
+	sig_end = hexbuf_get_u32le(cper_raw, 6);
+	igt_assert_f(sig_end == CPER_SIG_END,
+		     "CPER signature_end mismatch: got 0x%08x, expected 0x%08x\n",
+		     sig_end, CPER_SIG_END);
+
+	/* section_count: bytes 10-11 */
+	sec_cnt = (uint16_t)hexbuf_get_byte(cper_raw, 10) |
+		  ((uint16_t)hexbuf_get_byte(cper_raw, 11) << 8);
+	igt_assert_f(sec_cnt >= 1,
+		     "CPER section_count must be >= 1, got %u\n", sec_cnt);
+
+	/* error_severity: bytes 12-15 */
+	sev = hexbuf_get_u32le(cper_raw, 12);
+	igt_assert_f(sev <= CPER_SEV_INFORMATIONAL,
+		     "CPER error_severity out of range: got %u\n", sev);
+
+	/* record_length: bytes 20-23 */
+	rec_len = hexbuf_get_u32le(cper_raw, 20);
+	igt_assert_f(rec_len >= CPER_RECORD_HEADER_SIZE,
+		     "CPER record_length too small: got %u, min %u\n",
+		     rec_len, CPER_RECORD_HEADER_SIZE);
+
+	igt_info("\nCPER record header status: OK\nsignature=0x%08x\nrevision=0x%04x"
+		 "\nsection_count=%u\nerror_severity=%u\nrecord_length=%u\n\n",
+		 sig, rev, sec_cnt, sev, rec_len);
+
+	free(event_line);
+}
+
+/**
+ * SUBTEST: cper-section-descriptor
+ * Description: Verify the CPER section descriptor fields: section_type
+ * GUID matches INTEL_CPER_SECTION_ACCEL_GENERIC, section_offset and
+ * section_length are consistent with record_length, and section_severity
+ * matches the injected error severity.
+ */
+
+/**
+ * test_cper_section_descriptor - validate the CPER section descriptor which
+ * immediately follows the 128-byte record header.
+ *
+ * From the Intel Accelerator Common CPER spec:
+ *   header[0..127]  = CPER record header
+ *   header[128..131] = section_offset (u32 LE) — offset of section body
+ *                      from start of record header
+ *   header[132..135] = section_length (u32 LE)
+ *   header[136..137] = revision (u16 LE) == 0x0100
+ *   header[140..143] = flags (u32 LE)
+ *   header[144..159] = section_type GUID (16 bytes)
+ *   header[176..179] = section_severity (u32 LE)
+ */
+static void test_cper_section_descriptor(int drm_fd)
+{
+	char *event_line;
+	const char *cper_raw;
+	uint32_t sec_off, sec_len, sec_sev, rec_len;
+	uint16_t sec_rev;
+	/* GUID bytes from INTEL_CPER_SECTION_ACCEL_GENERIC:
+	 * {ea9d8f84-4258-5227-8028-b9b13e6d58b0}
+	 * In GUID wire format (mixed endian): ea9d8f84 4258 5227 8028 b9b13e6d58b0
+	 * Byte layout in CPER: 84 8f 9d ea  58 42  27 52  80 28  b9 b1 3e 6d 58 b0
+	 */
+	static const uint8_t expected_guid[UUID_SIZE] = {
+		0x84, 0x8f, 0x9d, 0xea,  /* Data1 LE */
+		0x58, 0x42,              /* Data2 LE */
+		0x27, 0x52,              /* Data3 LE */
+		0x80, 0x28,              /* Data4[0..1] */
+		0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0  /* Data4[2..7] */
+	};
+	uint8_t actual_guid[UUID_SIZE];
+	char actual_guid_string[37];
+	int i;
+	uint32_t rec_sev;
+
+	igt_require_f(tracefs_event_exists(),
+		      "xe_error_cper trace event not available\n");
+
+	event_line = wait_for_cper_event(drm_fd);
+	igt_assert_f(event_line,
+		     "No xe_error_cper trace event received\n");
+
+	cper_raw = parse_cper_event_field(event_line, "cper_raw");
+	igt_assert_f(cper_raw, "cper_raw field not found\n");
+
+	/* record_length for bounds check */
+	rec_len = hexbuf_get_u32le(cper_raw, 20);
+	igt_assert_f(rec_len >= CPER_RECORD_HEADER_SIZE + CPER_SECTION_DESC_SIZE,
+		     "record_length %u too small to contain section descriptor\n",
+		     rec_len);
+
+	/* section descriptor starts at byte 128 */
+	sec_off = hexbuf_get_u32le(cper_raw, 128);
+	igt_assert_f(sec_off >= CPER_RECORD_HEADER_SIZE + CPER_SECTION_DESC_SIZE,
+		     "section_offset %u must be beyond header+descriptor\n",
+		     sec_off);
+	igt_assert_f(sec_off < rec_len,
+		     "section_offset %u >= record_length %u\n",
+		     sec_off, rec_len);
+
+	sec_len = hexbuf_get_u32le(cper_raw, 132);
+	igt_assert_f(sec_len > 0,
+		     "section_length must be > 0\n");
+	igt_assert_f(sec_off + sec_len <= rec_len,
+		     "section_offset(%u) + section_length(%u) > record_length(%u)\n",
+		     sec_off, sec_len, rec_len);
+
+	/* section revision @ byte 136 */
+	sec_rev = (uint16_t)hexbuf_get_byte(cper_raw, 136) |
+		  ((uint16_t)hexbuf_get_byte(cper_raw, 137) << 8);
+	igt_assert_f(sec_rev == CPER_REVISION,
+		     "section_descriptor revision mismatch: 0x%04x\n", sec_rev);
+
+	/* section_type GUID @ bytes 144..159 */
+	for (i = 0; i < (int)UUID_SIZE; i++)
+		actual_guid[i] = hexbuf_get_byte(cper_raw, 144 + i);
+
+	format_guid(actual_guid, actual_guid_string);
+
+	igt_assert_f(memcmp(actual_guid, expected_guid, UUID_SIZE) == 0,
+		     "section_type GUID mismatch — expected GUID is: %s\n"
+		     "actual GUID is: %s\n",
+		     INTEL_CPER_SECTION_ACCEL_GENERIC_STR, actual_guid_string);
+
+	/* section_severity @ bytes 176..179 */
+	sec_sev = hexbuf_get_u32le(cper_raw, 176);
+	igt_assert_f(sec_sev <= CPER_SEV_INFORMATIONAL,
+		     "section_severity out of range: %u\n", sec_sev);
+
+	/* section_severity must match record error_severity */
+	rec_sev = hexbuf_get_u32le(cper_raw, 12);
+	igt_assert_f(sec_sev == rec_sev,
+		     "section_severity(%u) != record error_severity(%u)\n",
+		     sec_sev, rec_sev);
+
+	igt_info("\nCPER section descriptor status OK::\nsection_offset=%u\n"
+		 "section_length=%u\nrevision=0x%04x\nsection_severity=%u\nGUID=%s\n",
+		 sec_off, sec_len, sec_rev, sec_sev,
+		 INTEL_CPER_SECTION_ACCEL_GENERIC_STR);
+
+	free(event_line);
+}
+
 static void igt_require_cri(int fd)
 {
 	uint16_t dev_id = xe_dev_id(fd);
@@ -641,6 +1115,20 @@ int igt_main()
 	igt_subtest("test_l2-bank-single-corr-err")
 		inject_error("test_l2-bank-single-corr-err", &mmio, fd);
 
+	igt_describe("Verify the xe_error_cper tracefs event exists and has the expected format.");
+	igt_subtest("cper-tracefs-event-format")
+		test_tracefs_event_format();
+
+	igt_describe("Inject a correctable error and verify the CPER record header fields in the "
+		     "xe_error_cper trace event.");
+	igt_subtest("cper-record-header")
+		test_cper_record_header(fd);
+
+	igt_describe("Inject a correctable error and verify the CPER section descriptor in the "
+		     "xe_error_cper trace event.");
+	igt_subtest("cper-section-descriptor")
+		test_cper_section_descriptor(fd);
+
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
 		drm_close_driver(fd);
-- 
2.43.0

