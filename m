Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3895FC61DBD
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 17:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2B910F428;
	Fri, 28 Aug 2026 17:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CH+Kc64G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E9410E4BF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787936704; x=1819472704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M+tGdaiBo2S3OGHRCx9WOdSaGVc8qN4FxAkI8wNAIAU=;
 b=CH+Kc64Gesv/YBoKs49+pAKcDbYlmeBv3TYJ1GfrrFw0RyJQDsiiHyB4
 yMgD4B9zrQeqNRgOz9QnuKx4jtvNuz/PKStJoRWsHG3WxXeT7DMKeAP5J
 5N7uJ2bfYq9w+dvlDQTme8SQQvLV/tp0TSgmrl8VqOG1Ph77mNAvzfMjw
 OWGyuDfwSs77yVhwulpgLMsnCRgBVwtn5ZFgfskFEhoScl9kHpMpARMJ7
 EiIrZdZ/aksd0YioCx+N6GziBCtsnCRgDUYCIWAH3GROBKNuD7zohqdZR
 Br4+1hXp7w7LpYRjtKYgY2FyL2qCfJuBugzPZBKHLK2qaZ+RiyZ7PtqCN g==;
X-CSE-ConnectionGUID: CxETW/4+Q2epF45J7U+9+Q==
X-CSE-MsgGUID: Dzz0w+S9QO2MG9HQbB2yPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="98787261"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="98787261"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:05:03 -0700
X-CSE-ConnectionGUID: kPdSqOvPSNm+Lb446xTwZg==
X-CSE-MsgGUID: A0bjAKV/QNGgvUKY9ky1hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="264457901"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 10:05:00 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: badal.nilawar@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v2 4/4] tests/xe_err_injection: add CPER section descriptor
 validation
Date: Fri, 28 Aug 2026 22:34:39 +0530
Message-Id: <20260828170439.204268-5-ravi.kishore.koppuravuri@intel.com>
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

Add cper-section-descriptor test to validate the CPER section
offset, length, revision, section type GUID, and section severity
fields.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 tests/intel/xe_err_injection.c | 129 +++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index d98260d81..2c5c0d31c 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -741,6 +741,17 @@ static uint32_t hexbuf_get_u32le(const char *hexstr, size_t offset)
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
  * SUBTEST: cper-tracefs-event-format
  * Description: Verify that the xe_error_cper tracefs event exists under
@@ -895,6 +906,119 @@ static void test_cper_record_header(int drm_fd)
 	free(event_line);
 }
 
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
@@ -975,6 +1099,11 @@ int igt_main()
 	igt_subtest("cper-record-header")
 		test_cper_record_header(fd);
 
+	igt_describe("Inject a correctable error and verify the CPER section descriptor in the "
+		     "xe_error_cper trace event.");
+	igt_subtest("cper-section-descriptor")
+		test_cper_section_descriptor(fd);
+
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
 		drm_close_driver(fd);
-- 
2.34.1

