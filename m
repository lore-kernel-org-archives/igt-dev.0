Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A9DC369D1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 19:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962D110E3A3;
	Tue, 22 Apr 2025 19:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYAzDqxF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C66A10E3A3
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745350513; x=1776886513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vOyVkRO0U2/lC4aSgyn3V8mBmI2MdW+8zA4Mp3ChKMA=;
 b=MYAzDqxF80Jw91xafplQcbDyMaWj1dDVyl+IpoUYTDjs+ZlW2CfrPpl8
 CBeu9Ewo7yVe5+zITlEVdO9ZiXtptqM43jLkhB2nQxlPmjMZMtnc6RD/E
 l6etND4FvB/SN/sPgH3glhBAyRqnwPn177IOCvt5+FEySqgX/fKvzi66x
 T55NCaOG5yyqCU7m57GjhIIttg+/liAzNjs4A8a4soNoKe7P7xnxrsF50
 eJjrZJqla+OrxkiTYrob6mHoR6g/RpT6qqA5rb2WivXuiEJ5+3FnD2S9Z
 BrHUWOrQNAtKhp14pJcIbRixj016VHpJOmpsvKfaqkfrwI1Fr5MCt4mmZ A==;
X-CSE-ConnectionGUID: /+5EyU+0QcmP/QAa69zlpw==
X-CSE-MsgGUID: 5haD9tR1ScKlGWnFEbU+Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57584549"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57584549"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:13 -0700
X-CSE-ConnectionGUID: eZs9KizKQf65nX8moNFaYg==
X-CSE-MsgGUID: OL/q3NoqRZOi4/49UyZEpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136892155"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:13 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/xe_oa: Only sanity check timer PEC
 reports
Date: Tue, 22 Apr 2025 12:34:56 -0700
Message-ID: <20250422193458.1467567-5-ashutosh.dixit@intel.com>
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

Empirical testing revealed that when reports of different types/reasons are
intermixed, this throws off gpu_ticks and test_event1_cycles_xecore* in PEC
data, causing test failures. To avoid this, restrict testing to only
timer/periodic reports.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 07e15943ea..83495bbacf 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1034,6 +1034,19 @@ static void pec_sanity_check_two(const u32 *report0, const u32 *report1,
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

