Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2AEC61DBD
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 17:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8811B10F442;
	Fri, 28 Aug 2026 17:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dx6uzi90";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625BF10E4BF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 17:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787936701; x=1819472701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LBc7E1KF/tBpBVLjx64kHW5RlMyclYXKY0Ky6szRSDs=;
 b=Dx6uzi90dgTntlZNdKuWWUOr1tv7/CYqHzgWruy3dmUk8T8BB6uznJDf
 RwSi+QAYaeXXbzL9PD/JCxZ/EHD4+eCieDMIjKY8P1ubvdX3+zyeomX+Q
 zpuHwN6bXTHnsT2asC29kq7uR5BZG2uh6ijj/Of+OB+aBU883s0Q8rZ47
 paM5NoLB2N893wEezTmFYgNBdT/IXpT8JuhsReTWJgHMeY0GJqibNCjUO
 7SI8pdFKU+V6UMTLeha7jPB3cU1x7cGclIMCP0cmbQVmK1K5L/KcivPZe
 vf9+iqN/T3/BGlIRN5bEXuxMOOFhVZcfnk8MHHJ493J81K2t80KEfj6uG w==;
X-CSE-ConnectionGUID: TqtyTF/qSemw9I5R0dKMVw==
X-CSE-MsgGUID: izS5yOUcRV+DNjASPSjU8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="98787257"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="98787257"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:05:01 -0700
X-CSE-ConnectionGUID: lZjB456EQouFIZ96eC/lkQ==
X-CSE-MsgGUID: JmBZL3klTsCrAlvaHsMm9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="264457890"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:04:57 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: badal.nilawar@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v2 3/4] tests/xe_err_injection: add CPER record header
 validation
Date: Fri, 28 Aug 2026 22:34:38 +0530
Message-Id: <20260828170439.204268-4-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260828170439.204268-1-ravi.kishore.koppuravuri@intel.com>
References: <20260828170439.204268-1-ravi.kishore.koppuravuri@intel.com>
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

Add the cper-record-header test to capture the xe_error_cper trace
event and validate the CPER signature, revision, signature terminator,
section count, severity, and record length.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 tests/intel/xe_cper.h          | 21 ++++++++
 tests/intel/xe_err_injection.c | 88 ++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/tests/intel/xe_cper.h b/tests/intel/xe_cper.h
index 706c63715..ff061d35b 100644
--- a/tests/intel/xe_cper.h
+++ b/tests/intel/xe_cper.h
@@ -18,4 +18,25 @@
 /* Timeout waiting for a trace event to appear (seconds) */
 #define CPER_EVENT_TIMEOUT_SEC		10
 
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
 #endif /* XE_CPER_H */
diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index c52fee2de..d98260d81 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -812,6 +812,89 @@ static void test_tracefs_event_format(void)
 	igt_assert_eq(buf[0], '0');
 }
 
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
 static void igt_require_cri(int fd)
 {
 	uint16_t dev_id = xe_dev_id(fd);
@@ -887,6 +970,11 @@ int igt_main()
 	igt_subtest("cper-tracefs-event-format")
 		test_tracefs_event_format();
 
+	igt_describe("Inject a correctable error and verify the CPER record header fields in the "
+		     "xe_error_cper trace event.");
+	igt_subtest("cper-record-header")
+		test_cper_record_header(fd);
+
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
 		drm_close_driver(fd);
-- 
2.34.1

