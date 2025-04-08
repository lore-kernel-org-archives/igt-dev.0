Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFF6C369A6
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F9810E2D2;
	Tue,  8 Apr 2025 18:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnZMkPE/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A47D10E29E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744135946; x=1775671946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xg/Zy8dwumLi2c4/7lxRPSn2Mv0knj/VTjbkNuKh/1A=;
 b=GnZMkPE/aeKCsFEi4r8MTVqiO0jXH/VpPg3C9CBoJ45SVqGHlvAeTKo6
 2ztIZVkODTQORBUODXT2n6xfIcM92UXeqZ4jrAmo0I3rvBq8STZdmwA3H
 TfwFFvWkb+PbxA4I1nm2ddbUA4aFtPStpQFOoMwlN1Byj9zkLAQQOKoSh
 ac1qS1zRrPdu04Uc27sYtBpsI3QUKjven9+EW1h1K2eDky+WO1Ovjn5bE
 rDVx8SwBuVhM2H2roqFiFZPiqf7fpNU6sYwvkcAT4FgP2pwKi1+Zjyg3N
 0VixZcjPsYm1xlT8Mh0HaUdNzDX5v7DFm7M2pkOyeedJGi7LPzwLVVuB2 w==;
X-CSE-ConnectionGUID: qDV9z9T5TeeTXGEj1ELhAw==
X-CSE-MsgGUID: 9ghCAf0KS4ekTFC5bNrdMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45479357"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45479357"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:25 -0700
X-CSE-ConnectionGUID: Ti+2a7r3ScK+9nKoNNPLFA==
X-CSE-MsgGUID: 5JEzosnbS82SgJ5qf/tjAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128683611"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/xe_oa: Only sanity check timer PEC
 reports
Date: Tue,  8 Apr 2025 11:12:08 -0700
Message-ID: <20250408181210.1052760-5-ashutosh.dixit@intel.com>
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

Empirical testing revealed that when reports of different types/reasons are
intermixed, this throws off gpu_ticks and test_event1_cycles_xecore* in PEC
data, causing test failures. To avoid this, restrict testing to only
timer/periodic reports.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index eaf97ae0df..cc9702322d 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1031,6 +1031,19 @@ static void pec_sanity_check_two(const u32 *report0, const u32 *report1,
 	u64 *pec0 = (u64 *)(report0 + 8);
 	u64 *pec1 = (u64 *)(report1 + 8);
 
+	/*
+	 * Empirical testing revealed that when reports of different types/reasons are
+	 * intermixed, this throws off gpu_ticks and test_event1_cycles_xecore* in PEC
+	 * data, causing test failures. To avoid this, restrict testing to only
+	 * timer/periodic reports.
+	 */
+	if (strcmp(read_report_reason(report0), "timer") ||
+	    strcmp(read_report_reason(report1), "timer")) {
+		igt_debug("Only checking timer reports: %s->%s\n",
+		  read_report_reason(report0), read_report_reason(report1));
+		return;
+	}
+
 	igt_debug("tick delta = %#lx\n", tick_delta);
 
 	/* Difference in test_event1_cycles_xecore* values should be close to tick_delta */
-- 
2.48.1

