Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2B3F8E4A8
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 04:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8528810E28E;
	Fri, 17 Apr 2026 04:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVqlgoyC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473F210E28E
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 04:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776399921; x=1807935921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nc5koUzOSDsIiqZjEc0ZgTR69bAHvsPrcRRcQQUlu1E=;
 b=UVqlgoyCmyk8Vrt2fodYCHXBTJIR4b20MBBD8mGErnUzgB5CB29GUAu7
 sAG+IVy2XvHdna8YTmsCnkcgdEUq0CjbG7nqHaSGPVrQcRy9MX2Ug/soN
 RPTT0Y6R2BkK+dQtY2mMu+eiv22wLeCQfdzA+0R44pcr+hKYedxSM5FgX
 WhZd6vSCidyuHU0b7uWsIeZLgBG1xMRwWjKvd3jXhAGP0r7lyrfeb25EC
 lfaWkzGNbF9DRKdBzGxiK+tUhomoJKGchvOUIuSnEhBvzIYsN8m2bAinv
 L/DRclozrKAcLr7WzDTWpqJHa6v3j28VILu4vB/1v98/qYAokwQafujRT A==;
X-CSE-ConnectionGUID: 65Eg6exqSai9zw6Wf6WILg==
X-CSE-MsgGUID: bylkm58UTHmkMnANRJ8Qrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81282680"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81282680"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 21:25:21 -0700
X-CSE-ConnectionGUID: KqitmoOeSCeWnQG5KiP0tg==
X-CSE-MsgGUID: a2ew/FsFRbmlH+pG3hbXBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="229922452"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 21:25:20 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 1/4] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 commit 1b85a9b04681
Date: Fri, 17 Apr 2026 09:40:28 +0530
Message-ID: <20260417041031.2187889-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
References: <20260417041031.2187889-1-ankit.k.nautiyal@intel.com>
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

Synchronize intel_vbt_defs.h with kernel commit:
1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")

Bspec:20142
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_vbt_defs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 6612d3a4ec49..550a9bfba868 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -1090,6 +1090,7 @@ struct bdb_edp {
 	u16 edp_dsc_disable;					/* 251+ */
 	u16 t6_delay_support;					/* 260+ */
 	u16 link_idle_time[16];					/* 260+ */
+	u16 joiner_enable;					/* 261+ */
 } __packed;
 
 /*
-- 
2.45.2

