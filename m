Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DC8C369D9
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 19:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713AA10E615;
	Tue, 22 Apr 2025 19:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhulIm7C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384A310E5FC
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745350513; x=1776886513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=58MJuUpjueEaLrOR9uaXntVQMDq7ui3sPPE3w00UItc=;
 b=lhulIm7CHIkBDaRjlxnLTRRtDq/t7wcguxT2KQ1kh77QVh5nK3S+gTv1
 w8tMmDosc/cdtAkQ1W6vQBYj3Z6/w0dsEnjyTi6waVLCc1ztkqykeH6qr
 8DondKIrbnoVqSPGwYBstTXsTSEDT5QpaRx4YOfDGUNWCcw6Jf1ut/Ml1
 ZzmjJN+vViiL/vaMg48l0To2efsvfn6D6+r4SoApXPJNXBjxILbs1NERh
 B8OBSJENF8LVo5Ah8bMQcjg2bQWMQgoZK/Hjb937Mce1c2xjbICVNIudk
 P1p3SNzZJmQAtzXMaWBEglNnxTztux7Uzoc4OGnJ0mxWuVR8/+7ikmnQw A==;
X-CSE-ConnectionGUID: RNjSGTboTdySpVkeQHez5w==
X-CSE-MsgGUID: QkhMgc0ATXCPUZv3XHTNmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57584550"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57584550"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:13 -0700
X-CSE-ConnectionGUID: q8omqCpZTXirUjhlVWm3sA==
X-CSE-MsgGUID: Ano4ytesTDO43qu4Cd0M7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136892158"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:13 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 5/6] tests/intel/xe_oa: Reduce test_non_zero_reason
 execution time
Date: Tue, 22 Apr 2025 12:34:57 -0700
Message-ID: <20250422193458.1467567-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250422193458.1467567-1-ashutosh.dixit@intel.com>
References: <20250422193458.1467567-1-ashutosh.dixit@intel.com>
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

Only check a single report from a random location to reduce
test_non_zero_reason execution time.

Before:
	Starting subtest: non-zero-reason
	Starting dynamic subtest: rcs-0
	Dynamic subtest rcs-0: SUCCESS (11.108s)
	Subtest non-zero-reason: SUCCESS (11.108s)

With this patch:
	Starting subtest: non-zero-reason
	Starting dynamic subtest: rcs-0
	Dynamic subtest rcs-0: SUCCESS (1.200s)
	Subtest non-zero-reason: SUCCESS (1.200s)

v2: Check one report at a random location (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 83495bbacf..c01adbad34 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2616,7 +2616,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 	uint8_t *buf = malloc(buf_size);
 	uint32_t total_len = 0;
 	const uint32_t *last_report;
-	int len;
+	int len, check_idx;
 	u32 oa_status;
 
 	igt_assert(buf);
@@ -2651,6 +2651,9 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 
 	igt_debug("Got %u bytes\n", total_len);
 
+	check_idx = random() % (total_len / report_size);
+	check_idx = check_idx ?: 1;
+
 	last_report = NULL;
 	for (uint32_t offset = 0; offset < total_len; offset += report_size) {
 		const uint32_t *report = (void *) (buf + offset);
@@ -2660,9 +2663,10 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 
 		/*
 		 * Only check for default OA buffer size, since non-default
-		 * sizes can drop reports due to buffer overrun.
+		 * sizes can drop reports due to buffer overrun. Also, only
+		 * check one random report to reduce test execution time.
 		 */
-		if (!oa_buffer_size && last_report) {
+		if (!oa_buffer_size && last_report && (offset / report_size == check_idx)) {
 			sanity_check_reports(last_report, report, fmt);
 			pec_sanity_check_reports(last_report, report, metric_set(hwe));
 		}
-- 
2.48.1

