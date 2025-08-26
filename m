Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C667CA0FF0
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 22:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3251D10E6D4;
	Tue, 26 Aug 2025 22:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AhYP/jFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD89F10E2E6
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 22:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756248273; x=1787784273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=La70DOxXPXb0YYxFZB3Cv/VuzW1PnqicTYo42EiYQos=;
 b=AhYP/jFNeIRMC3bBb/JSRlme73tJIzBNSVjwPqWxKbbTB8YmoR5hB05/
 YvWJ/+b00fpgvEyGzgHs2BMDELW7DjSg8aY9Zeo59jBl2Qz4Ge1u0yUfh
 zv9RcHGWj2azXTj+a4I/oZGY+Q/5ebcyaaqBqt94WzofPr5vx3sqBA/Ai
 p87cl6j4d8JSu0md5wpyBTgEdYXPsUjJdRvCeGr6V/Vziu/G6QZIYP8zi
 cqEmre5TRW/aEZ+/0fcAE+bSb0agmyO0PRX8YDDSMYOvYTWeNdTeloE8B
 zXIvUFsFCYo//C8CSm0dbpfii/nM5hv9n0LvVS7X6MmpaZw2CQEoG4fS3 g==;
X-CSE-ConnectionGUID: mX/YJRE7TySBFoZjWdsyUg==
X-CSE-MsgGUID: i2sBI16JQRuMGhJ6gg8LrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58595535"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58595535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:44:32 -0700
X-CSE-ConnectionGUID: lmF9DQxiRuu2iTPDmWgXrQ==
X-CSE-MsgGUID: sAZ3yLw6S0GWh7qR2ep3fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="200647267"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:44:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 2/4] tests/intel/xe_oa: Fix waiting for mmaped reports
Date: Tue, 26 Aug 2025 15:42:59 -0700
Message-ID: <20250826224256.510692-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826224256.510692-6-umesh.nerlige.ramappa@intel.com>
References: <20250826224256.510692-6-umesh.nerlige.ramappa@intel.com>
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

When iterating over reports using a uint32_t pointer, ensure that the
report size is expressed in 32 bits.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index f81e95dcd8d6..d10ef00d6abc 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4450,6 +4450,7 @@ static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
 	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
 	uint64_t fmt = test_set->perf_oa_format;
 	uint32_t num_periodic_reports = 0;
+	uint32_t report_words = get_oa_format(fmt).size >> 2;
 	uint32_t *reports;
 
 	while (num_periodic_reports < n) {
@@ -4457,7 +4458,7 @@ static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
 		num_periodic_reports = 0;
 		for (reports = (uint32_t *)oa_vaddr;
 		     reports[0] && oa_timestamp(reports, fmt) && oa_report_is_periodic(reports);
-		     reports += get_oa_format(fmt).size) {
+		     reports += report_words) {
 			num_periodic_reports++;
 		}
 	}
-- 
2.43.0

