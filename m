Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C070C369A7
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC4D10E2C6;
	Tue,  8 Apr 2025 18:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJDYquS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7335710E2BE
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744135946; x=1775671946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oKu5Qc68PewP/BygUxfOWEBPGCh3LrzvZUQ5pz4ow/U=;
 b=FJDYquS+5jvlxIlewB2k4DfMZEf3gYyCEa3n5LvfOkw012ihstP0PypV
 zhempV3u2FfswE9hQLYCydVaa0BUwmXrl3wbNDLW83Tn2UiR0ccpRyaxl
 PtCbHeHHHuxwdQfAI/6HkuQibs2CKU9d0iYrjf3CdoIRnyX0zp+99NmRI
 ItLEY7Zoz08huRvgWFogp7mpfeNhW0TMkYxbmlCCF3W6ENxSjzZat3mfp
 5PAdCWMOkfszwMlsd9eBfS/f1x/hVDQrr8L2YmXho5vz8rokkhkyBOUWH
 BLXC+zKmjKBG35g/cRAYumZ9KSfFi0Ih/RPKnKZttna+mkmJwh6SliNjj w==;
X-CSE-ConnectionGUID: VuDDcb4nSFed/7H43RR51g==
X-CSE-MsgGUID: 3wVcGcmBR4eci9O6hkm0+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45479359"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45479359"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:25 -0700
X-CSE-ConnectionGUID: LYuHuV0qQpKkmfUwnWguBA==
X-CSE-MsgGUID: AobNK4ilQ5+nyosgJSRy3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128683614"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 5/6] tests/intel/xe_oa: Reduce test_non_zero_reason
 execution time
Date: Tue,  8 Apr 2025 11:12:09 -0700
Message-ID: <20250408181210.1052760-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
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

Only check every 128th report to reduce test execution time. Without this
patch execution times for buffer-size subtest for OA buffer sizes > 16
M (with PEC report sanity checks) are excessive. E.g. for 128 MB size:

	Starting subtest: buffer-size
	Starting dynamic subtest: ccs-0-128M
	Dynamic subtest ccs-0-128M: SUCCESS (133.654s)
	Subtest buffer-size: SUCCESS (133.654s)

With this patch:

	Starting subtest: buffer-size
	Starting dynamic subtest: ccs-0-128M
	Dynamic subtest ccs-0-128M: SUCCESS (11.209s)
	Subtest buffer-size: SUCCESS (11.209s)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index cc9702322d..f3ce37ff5a 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2646,13 +2646,14 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 	igt_debug("Got %u bytes\n", total_len);
 
 	last_report = NULL;
-	for (uint32_t offset = 0; offset < total_len; offset += report_size) {
+	for (uint32_t offset = 0, n = 0; offset < total_len; offset += report_size) {
 		const uint32_t *report = (void *) (buf + offset);
 		uint32_t reason = (report[0] >> OAREPORT_REASON_SHIFT) & OAREPORT_REASON_MASK;
 
 		igt_assert_neq(reason, 0);
 
-		if (last_report) {
+		/* Only check every 128th report to reduce test execution time */
+		if (last_report && !(n++ % 128)) {
 			sanity_check_reports(last_report, report, fmt);
 			pec_sanity_check_reports(last_report, report, metric_set(hwe));
 		}
-- 
2.48.1

