Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6BB606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 14:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WGZwFkQ0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDD610EA24;
	Mon, 16 Nov 2026 14:57:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D113C10E667
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794840903; x=1826376903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x5+SiruZ1qqTYGyjw/mzL95mSVTcwOy4iEm1zr2t4Xg=;
 b=WGZwFkQ0f9bZaeaGJHJtPFaHo4IlCzUgOPSysLQLPaB7EOAN0aVrZzy8
 QdsYywBqN21zZMaVv1zOVQU+q7UJAtx4GoEOFZSFoHJMy2lLhCj9YKKy0
 SoRctYEhztxAyVgAkYPt/4/3CxjV7ShBFkVgd68btfVsCcQfyVkDSDWcD
 ihQHD3SpubOcAEl6LOnjK71qcZUKla7aJ8wr8a4LSekFlJZBt6UeTAExh
 f0N95T63KC5ftYhU6bYE0qkLmFNSyOzbE/WGQq2gH5907AnnI8j70ogRd
 lnVMGS86c+Au342PcVsaPi7yYcSwZwR6fOQ689B7gX77Iw9znUHYbAqwS A==;
X-CSE-ConnectionGUID: liTfWtBdQjWwfT7qfY1oEQ==
X-CSE-MsgGUID: FOUJDHTrTaqmkhsThDMWQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3594935"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3594935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:55:02 -0800
X-CSE-ConnectionGUID: 1y2nZK+QROGdzjNcUKeEfQ==
X-CSE-MsgGUID: tUtBjTmzQPq+/FdRYQMaSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9412856"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:55:00 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 anshuman.gupta@intel.com, raag.jadav@intel.com,
 mallesh.koujalagi@intel.com, sk.anirban@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 4/4] tests/xe_err_injection: add CPER section descriptor
 validation
Date: Mon, 16 Nov 2026 20:24:10 +0530
Message-Id: <20261116145410.1649875-5-ravi.kishore.koppuravuri@intel.com>
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

Add cper-section-descriptor test to validate the CPER section
offset, length, revision, section type GUID, and section severity
fields.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v3:
  - Cosmetic changes
---
 tests/intel/xe_err_injection.c | 144 +++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 747a727bf..f9b88ebf2 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -754,6 +754,17 @@ static uint32_t hexbuf_get_u32le(const char *hexstr, size_t offset)
 	return v;
 }
 
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
 /**
  * SUBTEST: cper-validate-tracefs-event
  * Description: Verify that the xe_error_cper tracefs event exists under
@@ -941,6 +952,130 @@ static void test_cper_validate_record_header(int drm_fd)
 	free(event_line);
 }
 
+/**
+ * SUBTEST: cper-validate-section-desc
+ * Description: Verify the CPER section descriptor fields: section_type
+ * GUID matches INTEL_CPER_SECTION_ACCEL_GENERIC, section_offset and
+ * section_length are consistent with record_length, and section_severity
+ * matches the injected error severity.
+ */
+
+/**
+ * test_cper_validate_section_desc - validate the CPER section descriptor which
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
+static void test_cper_validate_section_desc(int drm_fd)
+{
+	char *event_line;
+	const char *cper_raw;
+	uint32_t sec_off, sec_len, sec_sev, rec_len, counter;
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
+		     "No xe_error_cper trace event received\n");
+
+	stop_cper_tracing(drm_fd);
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
 enum xe_err_injection_type {
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
@@ -975,6 +1110,7 @@ static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *m
 enum xe_cper_test {
 	XE_CPER_VALIDATE_TRACEFS_EVENT,
 	XE_CPER_VALIDATE_RECORD_HEADER,
+	XE_CPER_VALIDATE_SECTION_DESC,
 };
 
 static void run_cper_test(enum xe_cper_test test, int fd)
@@ -986,6 +1122,9 @@ static void run_cper_test(enum xe_cper_test test, int fd)
 	case XE_CPER_VALIDATE_RECORD_HEADER:
 		test_cper_validate_record_header(fd);
 		break;
+	case XE_CPER_VALIDATE_SECTION_DESC:
+		test_cper_validate_section_desc(fd);
+		break;
 	default:
 		igt_info("Invalid CPER test specified\n");
 	}
@@ -1046,6 +1185,11 @@ int igt_main()
 	igt_subtest("cper-validate-record-header")
 		run_cper_test(XE_CPER_VALIDATE_RECORD_HEADER, fd);
 
+	igt_describe("Inject a correctable error and verify the CPER section descriptor in the "
+		     "xe_error_cper trace event.");
+	igt_subtest("cper-validate-section-desc")
+		run_cper_test(XE_CPER_VALIDATE_SECTION_DESC, fd);
+
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
 		drm_close_driver(fd);
-- 
2.34.1

