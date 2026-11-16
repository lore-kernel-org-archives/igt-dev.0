Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54842606A329
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z2YLcx9b
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CA810EA69;
	Mon, 16 Nov 2026 14:59:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2FE10E755
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794840897; x=1826376897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1EOyM2UCw6Un9zb9f3e2jqiVTBLV3/WrGMsRuHtuzSk=;
 b=Z2YLcx9bU3ZMjCDfmlB7bm/Iohj2jjCzttut/5cX1YYFKVK8aF0NsgHo
 HjN3zVzRmhMzXoJu9jbCa0VoNXsZr5+RpArnQxojeHHiZ1kFw158jd2ZA
 Q+Czb4ONrKHJZhSt8N9pa6okiEitcPUr/unu79qZRsKp7BCR0wQPQMl/B
 TaOc3TkAHyPe1A5PpP+QxbEI0u0bGq3jrYApm1k9WaUMSgPuETsx8wrMy
 1e/iGr/V7VvTM2jAESR9q3hkSbNr/1jobbr13rygBZP8pBW2vZ93KBkbm
 /121Gxx8yIjqiM5re278b65pkQTaMRu8Tt7UW6Ji11JtoTNV3aWn6RdvT A==;
X-CSE-ConnectionGUID: whrlOBR7QoiUWCKP7rBZXA==
X-CSE-MsgGUID: mn9cSpHdQu2/FGPcaRlxNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3594925"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3594925"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:54:57 -0800
X-CSE-ConnectionGUID: C7iOgmx9SmyQnPGN2TtHFg==
X-CSE-MsgGUID: ZjNmQu84SvybubVylaV3rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9412839"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:54:54 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 anshuman.gupta@intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com, sk.anirban@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 3/4] tests/xe_err_injection: add CPER record header
 validation
Date: Mon, 16 Nov 2026 20:24:09 +0530
Message-Id: <20261116145410.1649875-4-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116145410.1649875-1-ravi.kishore.koppuravuri@intel.com>
References: <20261116145410.1649875-1-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Add the cper-record-header test to capture the xe_error_cper trace
event and validate the CPER signature, revision, signature terminator,
section count, severity, and record length.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v3:
  - Added support to read the error counter before waiting for the CPER trace event
  - Cosmetic changes
---
 tests/intel/xe_cper.h          |  21 +++++++
 tests/intel/xe_err_injection.c | 102 +++++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+)

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
index 0b50effb3..747a727bf 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -848,6 +848,99 @@ static void test_cper_validate_tracefs_event(int drm_fd)
 	igt_assert_eq(buf[0], '0');
 }
 
+/**
+ * SUBTEST: cper-validate-record-header
+ * Description: Inject a correctable hardware error and verify the CPER
+ * record header fields (signature "CPER", revision 0x0100, record_length,
+ * section_count >= 1, error_severity) by reading the xe_error_cper
+ * tracefs event output.
+ */
+
+/**
+ * test_cper_validate_record_header - inject a correctable error, capture the
+ * xe_error_cper trace event and validate CPER record header fields from
+ * the cper_raw hex dump:
+ *   bytes  0-3:   signature == "CPER" (0x52455043)
+ *   bytes  4-5:   revision  == 0x0100
+ *   bytes  6-9:   signature_end == 0xFFFFFFFF
+ *   bytes 10-11:  section_count >= 1
+ *   bytes 12-15:  error_severity in [0..3]
+ *   bytes 20-23:  record_length >= CPER_RECORD_HEADER_SIZE
+ */
+static void test_cper_validate_record_header(int drm_fd)
+{
+	char *event_line;
+	const char *cper_raw;
+	uint32_t sig, sig_end, rec_len, sev, counter;
+	uint16_t rev, sec_cnt;
+
+	igt_require_f(is_dir_exist(XE_CPER_EVENT_DIR),
+		      "xe_error_cper trace event not present at %s\n"
+		      "(kernel xe driver may not have CONFIG_TRACING enabled)\n",
+		      XE_CPER_EVENT_DIR);
+
+	start_cper_tracing(drm_fd);
+	counter = get_counter(NODE_ID_CORRECTABLE_ERROR, ERROR_ID_CORE_COMPUTE);
+	if (counter < 0) {
+		stop_cper_tracing(drm_fd);
+		igt_assert_f(false, "Failed to read error counter after injection\n");
+	}
+
+	event_line = wait_for_cper_event(drm_fd);
+	igt_assert_f(event_line,
+		     "No xe_error_cper trace event received within %d seconds "
+		     "after injecting CSC hardware error\n",
+		     CPER_EVENT_TIMEOUT_SEC);
+
+	igt_info("Captured trace event: %s\n", event_line);
+	stop_cper_tracing(drm_fd);
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
 enum xe_err_injection_type {
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
@@ -881,6 +974,7 @@ static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *m
 
 enum xe_cper_test {
 	XE_CPER_VALIDATE_TRACEFS_EVENT,
+	XE_CPER_VALIDATE_RECORD_HEADER,
 };
 
 static void run_cper_test(enum xe_cper_test test, int fd)
@@ -889,6 +983,9 @@ static void run_cper_test(enum xe_cper_test test, int fd)
 	case XE_CPER_VALIDATE_TRACEFS_EVENT:
 		test_cper_validate_tracefs_event(fd);
 		break;
+	case XE_CPER_VALIDATE_RECORD_HEADER:
+		test_cper_validate_record_header(fd);
+		break;
 	default:
 		igt_info("Invalid CPER test specified\n");
 	}
@@ -944,6 +1041,11 @@ int igt_main()
 	igt_subtest("cper-validate-tracefs-event")
 		run_cper_test(XE_CPER_VALIDATE_TRACEFS_EVENT, fd);
 
+	igt_describe("Inject a correctable error and verify the CPER record header fields in the "
+		     "xe_error_cper trace event.");
+	igt_subtest("cper-validate-record-header")
+		run_cper_test(XE_CPER_VALIDATE_RECORD_HEADER, fd);
+
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
 		drm_close_driver(fd);
-- 
2.34.1

