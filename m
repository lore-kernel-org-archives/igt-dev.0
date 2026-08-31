Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39DCC61DD3
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 19:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E9810E33F;
	Mon, 31 Aug 2026 19:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlpIAIEd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6276910E33F
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 19:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788204036; x=1819740036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JrfXI2HtN6tf7EDQ+bk5rauPCgzPaFQkc8owUQKdY+s=;
 b=jlpIAIEd8LceUrCB9hqjm/A5AB6FkEBRf8i1Y4My8SyQOXWHBwd/pV6i
 PAxpxgl8W9np3evFH/SFg880FiNhUKllhdAq5BC2M7Zq8CX0ISackZxB2
 Dq91d6vpH6M17lKNZtXXvj6x0Xv5CsFK/Y7toQEmhTSIN86HAtqZ87KK/
 i+CF/mCydxXj4YlmxyEWLLEKgt5PgvHxET2g7+GlRZEAuGsoxVAVSy2x8
 K99FXMTMsJUSdkGWOsz6QHjAgSHbCyfPx8KhGN2PcAuuVOXRJPxPrnwTU
 m8fCeskasbN2gs8sRvzZIwxIch4gzYEnYGcIB3Vg+Oohq9K60daCsCHDA Q==;
X-CSE-ConnectionGUID: 44xDtZZCQE+jIqo+W8w2YA==
X-CSE-MsgGUID: fBZtwUb+QP+ufajsM7pCQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88549103"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88549103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 12:20:36 -0700
X-CSE-ConnectionGUID: EmTVqWFeS9mV2RCN10sqLw==
X-CSE-MsgGUID: AHQUlvZLR+K35ItmLBoJ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="272392315"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 12:20:34 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 2/7] lib/igt_kms: Order IGT_COLOROP_FIXED_MATRIX_TYPE before
 IGT_COLOROP_NEXT
Date: Tue,  1 Sep 2026 00:59:30 +0530
Message-Id: <20260831192935.463134-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831192935.463134-1-swati2.sharma@intel.com>
References: <20260831192935.463134-1-swati2.sharma@intel.com>
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
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Assisted-by: GitHub Copilot
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1e27a25f6..7f3b464b2 100644
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
index c8fa11b47..8ba8e3891 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -362,8 +362,8 @@ enum igt_atomic_colorop_properties {
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

