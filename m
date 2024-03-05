Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4838EC54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 12:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DDC112A86;
	Tue,  5 Mar 2024 12:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LzFQe68b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8190B112A85
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 12:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709641099; x=1741177099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UfmiXhU0RoX9NypSqUXt2zJYi5r3GdTEQrE8N4EKfgQ=;
 b=LzFQe68bnZzsKkCW6FM4tbVgguvavuHC+S0xs9wP/Ntbmq9zexQX4nFM
 LP7P3I7szKMKforLgfLCUV25rc5EEyhMrYr1uqG4W0Et7Mpq62lbJgYGJ
 UvfAh/mM+dhzCnmKDVJL/cDFgpP7fGLEK2mwB+zTuBk1+lLVQc6biOolZ
 pukdsbs0NgB8BeZWp7qTd/DppYMqdXnEbAYm85ANuNfYvw5Dx0FEc2yZP
 k1ZISMt0dq8l+9KVKGth4A6bOSPAaRNPDLfKUkTnJbI4V4BTuEOpy6Q2N
 F9hNh9OiamckVBI9rMKnJamcYhMJkGUlSD12O7mBc9/NOIFtfWiX4xv5H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15616289"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15616289"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:18:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9779423"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.249.140.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:18:17 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 2/6] lib/gpu_cmds: default to uc MOCS index
Date: Tue,  5 Mar 2024 12:17:50 +0000
Message-ID: <20240305121754.182425-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240305121754.182425-1-matthew.auld@intel.com>
References: <20240305121754.182425-1-matthew.auld@intel.com>
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

Currently we just default to index=0, but that can have different
meaning between HW versions. Rather just default to UC mocs index.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/gpu_cmds.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 49ba364f9..d909efde8 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -214,10 +214,10 @@ gen9_fill_surface_state(struct intel_bb *ibb,
 	ss->ss0.vertical_alignment = 1; /* align 4 */
 	ss->ss0.horizontal_alignment = 1; /* align 4 */
 
-	if (mocs == INTEL_BUF_MOCS_UC)
-		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
-	else if (mocs == INTEL_BUF_MOCS_WB)
+	if (mocs == INTEL_BUF_MOCS_WB)
 		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
+	else
+		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
 
 	if (buf->tiling == I915_TILING_X)
 		ss->ss0.tiled_mode = 2;
@@ -275,10 +275,10 @@ gen11_fill_surface_state(struct intel_bb *ibb,
 	ss->ss0.vertical_alignment = vertical_alignment; /* align 4 */
 	ss->ss0.horizontal_alignment = horizontal_alignment; /* align 4 */
 
-	if (mocs == INTEL_BUF_MOCS_UC)
-		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
-	else if (mocs == INTEL_BUF_MOCS_WB)
+	if (mocs == INTEL_BUF_MOCS_WB)
 		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
+	else
+		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
 
 	if (buf->tiling == I915_TILING_X)
 		ss->ss0.tiled_mode = 2;
@@ -931,10 +931,10 @@ xehp_fill_surface_state(struct intel_bb *ibb,
 	ss->ss0.vertical_alignment = 1; /* align 4 */
 	ss->ss0.horizontal_alignment = 1; /* align 4 */
 
-	if (mocs == INTEL_BUF_MOCS_UC)
-		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
-	else if (mocs == INTEL_BUF_MOCS_WB)
+	if (mocs == INTEL_BUF_MOCS_WB)
 		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
+	else
+		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
 
 	if (buf->tiling == I915_TILING_X)
 		ss->ss0.tiled_mode = 2;
-- 
2.43.2

