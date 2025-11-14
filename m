Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43B7CE8D65
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6202710EAD9;
	Fri, 14 Nov 2025 17:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acOzIXVJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13BA10EAE8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140985; x=1794676985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j6TLPGJNfV+QjSVG12hqIrOr4WZCchpvC0TfkMV3OlA=;
 b=acOzIXVJC5XHpTOUjoLqRq16D1yNjq3+QonpKHUfCBs4s1f8hwn/JN8y
 umwuzAWB5tnIB68KKJoBuKeAre7AiFas49fHZWcnsNK7/kyq3oPKTI+0z
 ZeGksPxLOVs/2hHjBNYHmKMmNPLTXBiEpr7910t/xjhw2LycRRX5tirwH
 wzJxnC/z64u/MX7jH2rqJ0oMIFBzPmiH3d/y5N94rH+AB7vQhnQIHhONv
 BW6Y2dIcqciaJkaXZgMibpraUqC+wEj3KeOfn1bQM9ewdH2wfsFbeAmC6
 Ds57DfypMZYgM/nZcrzZuils6m5aFbmmT02WuxEz6YH+GOp5h885p4YSR g==;
X-CSE-ConnectionGUID: 2uKrXH9dRq2/CvYadS1uJw==
X-CSE-MsgGUID: RmC3UIgqRbGS492el91AnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871467"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871467"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:23:04 -0800
X-CSE-ConnectionGUID: rXF8p38hRAOTi62r0caJzQ==
X-CSE-MsgGUID: XFhstu9fTY+FaKPnkp9z7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981681"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:23:03 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 22/23] lib/kms: Skip when plane has invalid color pipeline
Date: Fri, 14 Nov 2025 22:59:07 +0530
Message-Id: <20251114172908.1027816-23-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

Replace assert with skip in igt_plane_set_color_pipeline() to avoid test
crash when color pipeline is not supported by KMD.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 30dde9ffa..8602c55c5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4448,12 +4448,12 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
  * @plane: Target plane.
  * @colorop: Colorop to set as color pipeline.
  *
- * This function sets the given @colorop as color pipeline on @plane, or fails
+ * This function sets the given @colorop as color pipeline on @plane, or skips
  * the test if it's an invalid color pipeline for the plane.
  */
 void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
 {
-	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
+	igt_skip_on_f(!igt_plane_is_valid_colorop(plane, colorop), "Invalid color pipeline for the plane\n");
 
 	plane->assigned_color_pipeline = colorop;
 	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
-- 
2.25.1

