Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2650FE77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 03:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7A110E1CE;
	Mon,  6 Jan 2025 03:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2RpjnsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C65610E1CE
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 03:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736135858; x=1767671858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tVaWxpS2vCuHrXQs+Aob/Im14NhzT7wQiIsreUYv+Nk=;
 b=R2RpjnsTy+sGG07IRJRZSKf0ogYzwR+KRFfpH+2O3zWxYYaXaiBBoW6A
 2ww/HBeKPtCVOYmcbzfUfgLqbF+yetqRESFPFyLBlbW6MObN7APItovUx
 ohH0O7EIekfCJfcG7K+dwcdNm3WnXncxFbEUp+Cu16YEnHHfKyRpB5/kM
 Z27O2Zcisl/zcB6CAiefFJogO8hFjxWbpfHZll0tuLU9SlrELSK9Y6C3y
 MdJdzaMg7xk2/IgW3FGtWq+i3n7Y4Wq7BweLSku0FEYxTW2T1a8INcwe4
 1m3UsqPD4XsF6U8icfw4YuoIVHprFeV8ed/FIH+j45F66u0wuumv6FfQf A==;
X-CSE-ConnectionGUID: njdgSk0nRaGRDhN0QkgESQ==
X-CSE-MsgGUID: SB7ALxfiQXq4eSOmb13crA==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46858245"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46858245"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 19:57:37 -0800
X-CSE-ConnectionGUID: 5hdjc+rQRmGb9L8jsdknCw==
X-CSE-MsgGUID: JJcnz4gHQLu0N0bfwDVM9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="139669349"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 19:57:35 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, sai.teja.pottumuttu@intel.com,
 lucas.demarchi@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_oa: Remove hardcoded time
 heuristics
Date: Mon,  6 Jan 2025 09:16:38 +0530
Message-Id: <20250106034638.1746051-3-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106034638.1746051-1-sai.teja.pottumuttu@intel.com>
References: <20250106034638.1746051-1-sai.teja.pottumuttu@intel.com>
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

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index ad3526406..b271278d6 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4367,6 +4367,29 @@ static void map_oa_buffer_forked_access(const struct drm_xe_engine_class_instanc
 	munmap(vaddr, size);
 }
 
+static void wait_for_periodic_reports(void *oa_vaddr,
+				      uint32_t n,
+				      const struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t fmt = test_set->perf_oa_format;
+	struct oa_format format = get_oa_format(fmt);
+	uint32_t num_periodic_reports = 0;
+	uint32_t *reports;
+
+	while (num_periodic_reports < n) {
+		usleep(100 * period_us);
+		num_periodic_reports = 0;
+		for (reports = (uint32_t *)oa_vaddr;
+		     reports[0] && oa_timestamp(reports, fmt);
+		     reports += format.size) {
+			if (oa_report_is_periodic(reports))
+				num_periodic_reports++;
+		}
+	}
+}
+
 static void check_reports(void *oa_vaddr, uint32_t oa_size,
 			  const struct drm_xe_engine_class_instance *hwe)
 {
@@ -4396,12 +4419,10 @@ static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_in
 {
 	void *vaddr;
 	uint32_t size;
-	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
 
 	vaddr = map_oa_buffer(&size);
 
-	/* wait for approx 100 reports */
-	usleep(100 * period_us);
+	wait_for_periodic_reports(vaddr, 20, hwe);
 	check_reports(vaddr, size, hwe);
 
 	munmap(vaddr, size);
@@ -4426,12 +4447,11 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
 	};
 	void *vaddr;
 	uint32_t size;
-	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
 
 	stream_fd = __perf_open(drm_fd, &param, false);
 	vaddr = map_oa_buffer(&size);
 
-	usleep(100 * period_us);
+	wait_for_periodic_reports(vaddr, 20, hwe);
 	check_reports(vaddr, size, hwe);
 
 	munmap(vaddr, size);
-- 
2.34.1

