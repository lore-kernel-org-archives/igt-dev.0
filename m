Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE5CE7718A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 08:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5387010EB03;
	Wed, 18 Dec 2024 08:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9ZsLwVZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFD510EB03
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734511883; x=1766047883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yrfM37rbEB+5trpqks6jNJdL02VJn8u15KPzgD5yoNk=;
 b=A9ZsLwVZZUYlqx8wB1GAA6pKnWmdFtYnlJZzwpxzrk8pG6YFFzU/pCpF
 y8ummNlTPP0nOPjUz/r7bq+KVazN1IWUbrVK8zXp4HxskRpWr/s+ut7PK
 qL30Km/0kzUfEXb6K5VDiLrTMIllvqZFQuoRF3PSDY8ioRxp+nWGAc0uk
 m3MbXNR4r1jLfQ+j3jTn3WC+CcLqUQ0NfNJBUXMxWwYTisqRu1EUX/GrT
 yvh79Ws2OMTzcYUpi1xmFS6TQQ6p/rrmMNY4xYkgI36TusQKvQyuoeb4T
 iZe3duqEdsmPFqLcqP/7b1VED5XCiYb7Txnbdm2TQE6SSsrUnt64ouDNC w==;
X-CSE-ConnectionGUID: qTNKHbD6T2q2qa58jWMFiA==
X-CSE-MsgGUID: vrI5vC0MQAuQ0lxya7zZlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34867304"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="34867304"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:51:16 -0800
X-CSE-ConnectionGUID: 2COpfnIyQ26gONYEa+jJWQ==
X-CSE-MsgGUID: 0VEgEDCZQ5mNDWjNrcV3+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102891008"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:51:14 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_oa: Remove hardcoded time heuristics
Date: Wed, 18 Dec 2024 14:11:34 +0530
Message-Id: <20241218084134.2898703-3-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218084134.2898703-1-sai.teja.pottumuttu@intel.com>
References: <20241218084134.2898703-1-sai.teja.pottumuttu@intel.com>
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
make it more robust and reliable.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index ad3526406..2cae56b47 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4367,6 +4367,28 @@ static void map_oa_buffer_forked_access(const struct drm_xe_engine_class_instanc
 	munmap(vaddr, size);
 }
 
+static void wait_for_20_periodic_reports(void *oa_vaddr,
+					 const struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t fmt = test_set->perf_oa_format;
+	struct oa_format format = get_oa_format(fmt);
+	uint32_t num_periodic_reports = 0;
+	uint32_t *reports;
+
+	while (num_periodic_reports < 20) {
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
@@ -4396,12 +4418,10 @@ static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_in
 {
 	void *vaddr;
 	uint32_t size;
-	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
 
 	vaddr = map_oa_buffer(&size);
 
-	/* wait for approx 100 reports */
-	usleep(100 * period_us);
+	wait_for_20_periodic_reports(vaddr, hwe);
 	check_reports(vaddr, size, hwe);
 
 	munmap(vaddr, size);
@@ -4426,12 +4446,11 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
 	};
 	void *vaddr;
 	uint32_t size;
-	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
 
 	stream_fd = __perf_open(drm_fd, &param, false);
 	vaddr = map_oa_buffer(&size);
 
-	usleep(100 * period_us);
+	wait_for_20_periodic_reports(vaddr, hwe);
 	check_reports(vaddr, size, hwe);
 
 	munmap(vaddr, size);
-- 
2.34.1

