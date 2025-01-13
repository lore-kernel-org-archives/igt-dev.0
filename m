Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343F0E7719F
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 06:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C6410E1E0;
	Mon, 13 Jan 2025 06:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmtgCWad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93B710E1E0
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 06:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736749929; x=1768285929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0cpisTYzeiZxelOcFvs3Xo0ANmHZFBPzIN918/lSQtY=;
 b=lmtgCWadWddFWdTtFPIzm5FymDggdbwu1UhtE9wFE7taRgxgn6w7LfhN
 UNO9zI96doNFMbYbUkVUy4YtBQJdp/AYaFglFNxCcOybZbKoUSQOee4MP
 slLc+Ao8bwPgMil8rJkFrdzVCYSqtMvn6VmWv+f1Qwu5K3RsO+UsfqbW0
 lllJcO6NL5Jw2tOAY0b7URa+Klpaz1wZjmk3I42I7iqgt2Q8X5Qxf4sF2
 X8sBzZScLzYUTO6+0xV4s4EF8CYxzbDHoYTY029uWEkKv4GSqprqRDaj8
 jLfAcLVjyAM4CbnCaTjxj4nXKm0jq5/gw8G0y6ATMirKrTUAFfnQVspej w==;
X-CSE-ConnectionGUID: +tWfphlXTe2ETKHaO3cDGQ==
X-CSE-MsgGUID: FX1uGvoGThWffc73pFg9/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48411416"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="48411416"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 22:32:08 -0800
X-CSE-ConnectionGUID: X/kD5dgASRqWHJZ8yNJRCw==
X-CSE-MsgGUID: /CCuNzJsR5iu+9SdoCyE6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135260595"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 22:32:06 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t v3 3/3] tests/intel/xe_oa: Remove hardcoded time
 heuristics
Date: Mon, 13 Jan 2025 11:49:49 +0530
Message-Id: <20250113061949.753864-4-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113061949.753864-1-sai.teja.pottumuttu@intel.com>
References: <20250113061949.753864-1-sai.teja.pottumuttu@intel.com>
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

Some tests in xe_oa tests have hardcoded timing heuristics. Refactor it to
make it more robust and reliable. The patch extends the wait time logically
but usually it would take a single iteration for the required reports to be
available so wait time doesn't change much.

v2:
 - Extend commit message [Lucas]
 - Make wait function more generic [Lucas]

v3:
 - Change wait function name [Ashutosh]
 - Address nits [Ashutosh]

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index cd081ecff..df7fa3229 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4367,6 +4367,26 @@ static void map_oa_buffer_forked_access(const struct drm_xe_engine_class_instanc
 	munmap(vaddr, size);
 }
 
+static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
+					   const struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t fmt = test_set->perf_oa_format;
+	uint32_t num_periodic_reports = 0;
+	uint32_t *reports;
+
+	while (num_periodic_reports < n) {
+		usleep(4 * n * period_us);
+		num_periodic_reports = 0;
+		for (reports = (uint32_t *)oa_vaddr;
+		     reports[0] && oa_timestamp(reports, fmt) && oa_report_is_periodic(reports);
+		     reports += get_oa_format(fmt).size) {
+			num_periodic_reports++;
+		}
+	}
+}
+
 static void check_reports(void *oa_vaddr, uint32_t oa_size,
 			  const struct drm_xe_engine_class_instance *hwe)
 {
@@ -4396,12 +4416,10 @@ static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_in
 {
 	void *vaddr;
 	uint32_t size;
-	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
 
 	vaddr = map_oa_buffer(&size);
 
-	/* wait for approx 100 reports */
-	usleep(100 * period_us);
+	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
 	check_reports(vaddr, size, hwe);
 
 	munmap(vaddr, size);
@@ -4426,12 +4444,11 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
 	};
 	void *vaddr;
 	uint32_t size;
-	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
 
 	stream_fd = __perf_open(drm_fd, &param, false);
 	vaddr = map_oa_buffer(&size);
 
-	usleep(100 * period_us);
+	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
 	check_reports(vaddr, size, hwe);
 
 	munmap(vaddr, size);
-- 
2.34.1

