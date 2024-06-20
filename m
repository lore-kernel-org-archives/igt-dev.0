Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D701C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 09:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5C310E2D1;
	Thu, 20 Jun 2024 09:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Me3zBjtx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0710210E2D1
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718876908; x=1750412908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/6vgC+rD4WNEjZrUTsuGvvWUusWzUjmiX9+dxPKZk4I=;
 b=Me3zBjtx8HGCaWvG3O1iYZ5WerjILgoMjAFE5sNB7LwfaIt+Rdl2Aa3w
 GozOG2OsyH5bnzTZj6I28o6wUZHbQdInXxsmbmMIHpLaSjrGWo2NwjZ+v
 17+CfyDUSfnwfqu7JPPD0tpTIedWin3/ZFlGmCJSLvfYgHo4TYcoX6xTc
 mFywfB1mHrhJ4de7o6YmaN4gWtcidRWo09qPqG2THzwScNXN2Od+3bS23
 SinrjepBV4iOqVJHKdb89C6RG0RAF0a30NBmrUw7E/qVBcAavdR4JrXmH
 sogi69jKbC7SXgK70pgB8u7IQckn4CPLQpyHxgsElj5RPbeLPeO1tX1ha g==;
X-CSE-ConnectionGUID: TS90kZoPTDqo5pLYYKAJmA==
X-CSE-MsgGUID: mkK+I4vRTQGElb4GcnVphg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15973051"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15973051"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 02:48:28 -0700
X-CSE-ConnectionGUID: EdgrPBISQg+fMRVNu7KVPw==
X-CSE-MsgGUID: LbBvOJofSOa+jMxVMt1GXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42642547"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.55])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 02:48:26 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] lib/intel_cmds_info: Remove duplicate block-copy
 tiling definition
Date: Thu, 20 Jun 2024 11:48:21 +0200
Message-Id: <20240620094822.524239-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Block-copy definition for Xe2 duplicates DG2+ so remove it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_cmds_info.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
index 1416e02cd4..d581edb6eb 100644
--- a/lib/intel_cmds_info.c
+++ b/lib/intel_cmds_info.c
@@ -64,11 +64,6 @@ static const struct blt_cmd_info
 						 BLT_CMD_EXTENDED |
 						 BLT_CMD_SUPPORTS_COMPRESSION);
 
-static const struct blt_cmd_info
-		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
-						 BLT_CMD_EXTENDED |
-						 BLT_CMD_SUPPORTS_COMPRESSION);
-
 static const struct blt_cmd_info
 		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
 						 BLT_CMD_EXTENDED);
@@ -183,7 +178,7 @@ const struct intel_cmds_info gen12_pvc_cmds_info = {
 const struct intel_cmds_info xe2_cmds_info  = {
 	.blt_cmds = {
 		[XY_FAST_COPY] = &dg2_xy_fast_copy,
-		[XY_BLOCK_COPY] = &xe2_xy_block_copy,
+		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
 		[MEM_COPY] = &pvc_mem_copy,
 		[MEM_SET] = &pvc_mem_set,
 	},
-- 
2.34.1

