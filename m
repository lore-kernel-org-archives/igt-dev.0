Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D35CA0FE9
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 00:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B40E10E185;
	Sat, 23 Aug 2025 00:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5+OHvfw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C817C10E027
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 00:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755909335; x=1787445335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bVwdRNjmVigQtgILHUEzP26wgwZorYw6ZG0eaqX80jY=;
 b=P5+OHvfwOyYm0O9J0x3BG6A0KFjFshd5DqUFm3SyhLqYvV2HLUesRNsn
 R0nDatwuQxA+2P/Zw3RC3UMFSk7fX550uqNDArvQEW0wciMdAdt9dxcCu
 ei2zFatw93lQgIebl4PRtyMbI6CgAI+ogDJiPJE58za2DhbALWQsW6A2X
 zkWRmuGc69pXyd9vckb+VI7maU0hbGPQ0iirNaFgunDzyOHSfp4i2wPI4
 2sfMwDM3cpguHeVsYu1OuSFkSr7gag6xKv0s1y2K0dtqXqtzpf5F3bUa2
 LvMouZIP9zbtuttC7FZVzbgrj3kE7MbveC6ijPi6rQXVrRKnh1OeWOLrY g==;
X-CSE-ConnectionGUID: hXy3ZkEuQlSgTsY85ArAmw==
X-CSE-MsgGUID: FIZR4JSkQOW5owx8f0PZvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58146829"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58146829"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:35:34 -0700
X-CSE-ConnectionGUID: P/qHGLUWQSKeyoTDkOVTmg==
X-CSE-MsgGUID: g5Mq2DVyTeC47N2WfwvV7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168732393"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:35:34 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/xe_oa: Fix waiting for mmaped reports
Date: Fri, 22 Aug 2025 17:34:04 -0700
Message-ID: <20250823003401.109978-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250823003401.109978-6-umesh.nerlige.ramappa@intel.com>
References: <20250823003401.109978-6-umesh.nerlige.ramappa@intel.com>
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
---
 tests/intel/xe_oa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 35d25150ec7d..745f364e52e9 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4448,6 +4448,7 @@ static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
 	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
 	uint64_t fmt = test_set->perf_oa_format;
 	uint32_t num_periodic_reports = 0;
+	uint32_t report_words = get_oa_format(fmt).size >> 2;
 	uint32_t *reports;
 
 	while (num_periodic_reports < n) {
@@ -4455,7 +4456,7 @@ static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
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

