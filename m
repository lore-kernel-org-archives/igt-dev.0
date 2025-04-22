Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C93AC369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 19:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C89910E3A0;
	Tue, 22 Apr 2025 19:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6svgQAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFEC10E3A3
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745350513; x=1776886513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5FmowCoUQV26sV+hp57odRoREoQ+12L3byAa/yWJO48=;
 b=D6svgQAbN1rrz4DSOFY7u99gtYmpR7UaAcoDUwzqazGffwMeg3hl7Rh3
 5xWTlJw+ZizdIh1VQrHx+NJjjkqFanGStEk86DM7ngG60f/Ou8XjVZPvG
 IPtqXHm3MgCQiQITdhxcoJVsqjyWn3fzuw3Wg2vXJUs2/MmFoJXxz1tMH
 cJsBqk6PFu92EYPs0BKNgPEzinRpjyrgChDkHvSTNlL1P2lTYtGAUiYNw
 xagSHSwf0y2najDd4yKdwM7zg6D30Ynvo4q7JFFjFi90rvlhOSXluLe8Q
 YrpH14LwExBzkwjzOxX307WhEd/h6Rwg48cR5dmGxcjwaSgIm7nZDPCBD w==;
X-CSE-ConnectionGUID: EtDOJYbrRhqi46DwEDIxIg==
X-CSE-MsgGUID: zb4Fspg1T+CVRQZOkLMZfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57584547"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57584547"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:12 -0700
X-CSE-ConnectionGUID: wKGARJ1HRv6jmcUs2kBuVQ==
X-CSE-MsgGUID: S2vGY8PMQza4jL6D2DQtVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136892149"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:12 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/6] tests/intel/xe_oa: Fix oa_tick_delta
Date: Tue, 22 Apr 2025 12:34:54 -0700
Message-ID: <20250422193458.1467567-3-ashutosh.dixit@intel.com>
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

oa_tick_delta should take into account whether OA report header is 64 or 32
bit when passing width to elapsed_delta.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 405549178a..a774fc289d 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -629,8 +629,11 @@ oa_tick_delta(const uint32_t *report1,
 	      const uint32_t *report0,
 	      enum intel_xe_oa_format_name format)
 {
+	struct oa_format fmt = get_oa_format(format);
+	uint32_t width = fmt.report_hdr_64bit ? 64 : 32;
+
 	return elapsed_delta(read_report_ticks(report1, format),
-			     read_report_ticks(report0, format), 32);
+			     read_report_ticks(report0, format), width);
 }
 
 static void
-- 
2.48.1

