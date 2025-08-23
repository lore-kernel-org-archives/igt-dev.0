Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5394CA0EEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 00:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D77D10E069;
	Sat, 23 Aug 2025 00:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfXr+izv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF73910E069
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 00:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755909335; x=1787445335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=80LEq+xxRxmyGAp3SHH2OmFkytMRel5/k+adSu43DvI=;
 b=IfXr+izvpayrGhI0EKzMv4r8ufLPQFJqE6+b4EpUd8LprAVTzlnU91Du
 6j+8OanFyjGP55xFQ24lsvNKk4LKh2XPEaqQQc9sE7Cwz/eu+kqV59TuI
 s3TGOh8zaMRNgPhl8giGG79u1rfJ28l0xVQVDneJbZn/IqWS2bCM5ThHR
 mPljDcIVnzkXblVI4QQhhkZ/gHNI4eP5xI786wyrBLukg9lo2Us8ILyN9
 g38wisx2CSanIyKtUW0WFlwTBAVB2Frl8RLbAcGMdkN7xgYM6NYSqn+HO
 kxRd2YCXZHHgxeZGk7sUdGvWCHJS/1RRAzaye/izKp89MXimnQXXnisFB A==;
X-CSE-ConnectionGUID: AzV9JTS6RvuVt8SS2AGfog==
X-CSE-MsgGUID: pudswUm+ShONubq0qR59NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58146828"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58146828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:35:34 -0700
X-CSE-ConnectionGUID: BXd/nOf6Rq28j0BzVZwPCg==
X-CSE-MsgGUID: Ee5LuvI4RWe6p8bz1R7eng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168732390"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:35:34 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 1/4] tests/intel/xe_oa: Fix report dumps in sanity check
Date: Fri, 22 Aug 2025 17:34:03 -0700
Message-ID: <20250823003401.109978-7-umesh.nerlige.ramappa@intel.com>
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

Fix report dumps in sanity check to dump the right amount of dwords.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 63b59028fc5d..35d25150ec7d 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1052,8 +1052,8 @@ static void pec_sanity_check_reports(const u32 *report0, const u32 *report1,
 		return;
 	}
 
-	dump_report(report0, set->perf_raw_size, "pec_report0");
-	dump_report(report1, set->perf_raw_size, "pec_report1");
+	dump_report(report0, set->perf_raw_size / 4, "pec_report0");
+	dump_report(report1, set->perf_raw_size / 4, "pec_report1");
 
 	pec_sanity_check(report0, report1, set);
 }
@@ -1471,8 +1471,6 @@ read_2_oa_reports(int format_id,
 				break;
 			}
 
-			dump_report(report, format_size / 4, "oa-formats");
-
 			igt_debug("read report: reason = %x, timestamp = %"PRIx64", exponent mask=%x\n",
 				  report[0], oa_timestamp(report, format_id), exponent_mask);
 
-- 
2.43.0

