Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79B7C88E75
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 08:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6792310E86B;
	Fri, 18 Sep 2026 08:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqpCSjuW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376D610E95F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 08:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789719888; x=1821255888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/uAFDj6qhKtZJzZ/PnKLAIX97LnRJdD0E9p2XSQ5DiE=;
 b=YqpCSjuWcwhcb1pCHLfcpcFt25CyDrBBYBPHezABMN2JRJeytHpFjhA+
 fygsNpN7f3dXr/jaadocQY2Eh3IEHn5hMIedf9vxmh5m9uJO8a+LzMt6R
 g2UUAiWZXgYMDvZL+bmqFwvVx3/uowLKRG+xpop55Ph+CQ9w+3eQBnPTD
 nuGa1j+QHee9OnzIyz38y8kyDX43SSTtuhV+w4zSMyNZDAeG8daFCDyhC
 jvkNEgqeVbAYIQLtZJay7V/Ye8gVWfqLbwjQQRWHFuyYEkMbrfgBrdVbz
 eRZKdy73xGxjL5h9JWkRVoQ6W0SOzyirLNsY+R6Q/UEMUw3uYOuac8z+T g==;
X-CSE-ConnectionGUID: LZBvhjfwSwyhlZm9E5BG6g==
X-CSE-MsgGUID: UwvmPE6jTmeJrLJm640h4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100870705"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100870705"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 01:24:48 -0700
X-CSE-ConnectionGUID: FzvwJjV6TP6QaZTpwhXNvw==
X-CSE-MsgGUID: BIId5MdnQxOdov7Yw5hW/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270965416"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:24:46 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH i-g-t,
 v6 2/6] lib/igt_kms: Order IGT_COLOROP_FIXED_MATRIX_TYPE before
 IGT_COLOROP_NEXT
Date: Fri, 18 Sep 2026 14:03:46 +0530
Message-Id: <20260918083350.1021184-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260918083350.1021184-1-swati2.sharma@intel.com>
References: <20260918083350.1021184-1-swati2.sharma@intel.com>
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

Keep NEXT as the last property defined just to represent its
unique role as chain-terminator/pointer.

Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 38763980a..7f4354cdc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -724,8 +724,8 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
-	[IGT_COLOROP_NEXT] = "NEXT",
 	[IGT_COLOROP_FIXED_MATRIX_TYPE] = "FIXED_MATRIX_TYPE",
+	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 72e19056e..9dbbaec98 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -368,8 +368,8 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_LUT3D_INTERPOLATION,
-	IGT_COLOROP_NEXT,
 	IGT_COLOROP_FIXED_MATRIX_TYPE,
+	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
 
-- 
2.25.1

