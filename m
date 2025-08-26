Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B12CA0FED
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 22:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF3410E6D3;
	Tue, 26 Aug 2025 22:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bo4PPAAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE5410E2F7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 22:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756248272; x=1787784272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ue/EFk+CPDrGFMMX6acU7cOmC0rYhptWgR92Y4DVK5g=;
 b=Bo4PPAAZMWH3ggRHIBlWtWMdzdPJFFkx0sD5NNtvhA3ndttaykM2WTUp
 VmASyWZQVBprui38AaeBqw1kjp5GzdNnzu3LNFNbGfA1Iajef0O3B2Uiz
 z60mptVaFoLHlo8HP6mjOLzQlHM+xZW+5Qs5xGcLUjtZyYJRPIB4SaSA6
 uexEK2E3nGgXQZ6hJQ+l4uBLkg9WfOYmqc4L2Eth5jMQj8qJKrR1snN37
 yCZ/yZmBAgyABmw/U6myM70S2+m2mOFvhAope0nLaZLo54LVac5eREIaS
 G3yaizwALEgAZwqAGm2k6mOZkvo6wlFEckr3FjNeaIjWlzxLROIajgvTU w==;
X-CSE-ConnectionGUID: WvySVarlS8qi8+PLVC6DuA==
X-CSE-MsgGUID: WMXss52zQPqkV8gkYYZ3fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58595534"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58595534"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:44:32 -0700
X-CSE-ConnectionGUID: 8y3HwliQQjehOZ0HTRYf3g==
X-CSE-MsgGUID: A/jU+rJOTAegjTzWGXgaMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="200647264"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:44:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 1/4] tests/intel/xe_oa: Fix report dumps in sanity
 check
Date: Tue, 26 Aug 2025 15:42:58 -0700
Message-ID: <20250826224256.510692-7-umesh.nerlige.ramappa@intel.com>
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

Fix report dumps in sanity check to dump the right amount of dwords.

v2: Fix double dump on Xe2 separately (Ashutosh)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index c7952c46dc3d..f81e95dcd8d6 100644
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
-- 
2.43.0

