Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9048CC27C55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 12:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093EB10E316;
	Mon, 10 Jun 2024 12:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zsvl3o0h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA0A10E316
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718020800; x=1749556800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lwp5zww32xP3HgkvmHAdZuzm/I4WJRyL/UHKojkY5ws=;
 b=Zsvl3o0hYG6tBJAd9QcVCqHI1yPnx+Qc3PI2DSCb6MTJvuxnhIJp9Qzk
 aUVHY2kfaoyG0FFcdrDHrTS5OO+d6pPmyZrIO+ZUMYra0rua+XsC/ekpV
 4tGLIsbFaMMElxhaE9cGniMB+1oqm+iaw1rrB4qgRYsCGE6rJ5wn/xGVh
 7IIXSLk4K8IBflyhVFF5+jAy5lV+KRi5iRtjicwNoRhTrhy4idVgFgb4L
 PJ+zdplR16oUnX6Eq2d3/6kFG69U7XCDLGeeyDnYC1hrFDPrkU8aTLJwv
 qG+hgeYTu9L+7SmyckBizAg8qy1kPtG2PoazHucBzUjuWapq8T8H1WwkE w==;
X-CSE-ConnectionGUID: ZTEqCOMLQsKClm3vtChVEw==
X-CSE-MsgGUID: utqvVgSHTdGxHs4/2GoFIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14626136"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14626136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 04:59:59 -0700
X-CSE-ConnectionGUID: Ku8DHz2dQdGy6A4Ir4C5Lw==
X-CSE-MsgGUID: pXdkbqMTRMCrhsYSAzcxjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43472026"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.54])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 04:59:57 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v2 1/5] lib/i915/fbc: print current fbc status if cannot
 be enabled
Date: Mon, 10 Jun 2024 14:59:37 +0300
Message-Id: <20240610115941.35279-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610115941.35279-1-vinod.govindapillai@intel.com>
References: <20240610115941.35279-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Print the current fbc status if the fbc is not enabled after
the timeout.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 3fac60087..07ed7f469 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -92,6 +92,10 @@ bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level)
 bool intel_fbc_wait_until_enabled(int device, enum pipe pipe)
 {
 	char last_fbc_buf[FBC_STATUS_BUF_LEN] = {'\0'};
+	bool enabled = igt_wait(_intel_fbc_is_enabled(device, pipe, IGT_LOG_DEBUG, last_fbc_buf), 2000, 1);
 
-	return igt_wait(_intel_fbc_is_enabled(device, pipe, IGT_LOG_DEBUG, last_fbc_buf), 2000, 1);
+	if (!enabled)
+		igt_info("FBC is not enabled: \n%s\n", last_fbc_buf);
+
+	return enabled;
 }
-- 
2.34.1

