Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06775C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 15:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEB1113283;
	Wed,  6 Mar 2024 15:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSVIEn8/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5160F113276
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709737563; x=1741273563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OSL/owOU1knJ2UUxKGKJHJ6IqcVwUjIsRoHAEipanFU=;
 b=GSVIEn8/qwLe6FPBzgc9hQEeO6SrkhCzPwLkdotHodEuEBBGYvmnsHWl
 KVwGhnJO/lAeiRUfDGnGD+ydcN31UCM6VYMmH38CBkaOR5h0YXVnDQTEE
 1sdBMkT5vyKvQ0q0/d6HGmECmog7A2wWZGP/fIBWtlzdjAzcx6ME6dWKE
 JMa7nQOM8VnpcJgI+WMc5y6IaTbSzHK7CR6JkI8bFwYU+KDwr1dpmu8r5
 XMGzd1ETsQn2iVhrG996aunOpWC62/+/8IexB8heA0jE+xKnUIpUgAWj7
 31i7Gk8+fK8chfklmE2pSfzI61LCR+1NG8eFPxFePk25TKcvqFZUAhwrW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4240922"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4240922"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:06:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="47296604"
Received: from dawidzix-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.249.140.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:06:02 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 2/6] lib/gpu_cmds: default to uc MOCS index
Date: Wed,  6 Mar 2024 15:04:48 +0000
Message-ID: <20240306150453.254144-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240306150453.254144-1-matthew.auld@intel.com>
References: <20240306150453.254144-1-matthew.auld@intel.com>
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

