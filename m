Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70574CD5BB0
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 13:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C97810F540;
	Fri, 22 May 2026 13:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2X01EPL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0570910F576
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779455359; x=1810991359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FKq4/TbEb6feVCaLrBITXWSKM7zt4kIlzoIo293Mjcc=;
 b=h2X01EPLtQnaxaavdKQNwLbcvoSSqGezJIQNrdUUZnyrAR+qCfwz+px/
 Z9k8Oa+1FkrlLU1CsX3pQKyHSQURTgQgDxj99DqebobBrvN31/DXkiuc9
 dGRBoRIfEq6Jn8BNkTro3bK1Nvlmh+P117Pn6n65gvQDgm8EcnAYVDHgu
 EuJna8+YJZEPQIAZ5Ec6chtrgi63YtDE+da1lOrpQyWpMT95TBNzKIkHh
 uHlP1/ZxKVrQDf6880QGazkiGcdmeIBLwkHBP1vuvCv37+PuelDCQdS/y
 ESULz3/iqYayaDZX4HW13lq8N2pD5ASC9s1RT8QiTLr+1EGvv1c/RM5Lb Q==;
X-CSE-ConnectionGUID: FXXfF0QSQue7Jeqgm73z+Q==
X-CSE-MsgGUID: Z9qLgCcKR1i9MoMV2cp61A==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="82962074"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="82962074"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 06:09:18 -0700
X-CSE-ConnectionGUID: ZnqjKneoQFW0Qj3K4t9oyw==
X-CSE-MsgGUID: Bx3B6YwJThG4FFz3xsvzzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="240067368"
Received: from shawnle1-i9-build-machine.itwn.intel.com ([10.225.64.200])
 by orviesa010.jf.intel.com with ESMTP; 22 May 2026 06:09:18 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 1/2] Revert "tests/kms_vrr: Start virtual RR test above
 midpoint to avoid mode fallback"
Date: Fri, 22 May 2026 13:00:23 +0000
Message-Id: <20260522130024.1591744-2-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522130024.1591744-1-shawn.c.lee@intel.com>
References: <20260515063251.2239524-1-shawn.c.lee@intel.com>
 <20260522130024.1591744-1-shawn.c.lee@intel.com>
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

This reverts commit 862eb176244feac8ee711f381fe1be1fdc6a7ede.

The following patch will do full range testing. So no need to start at midpoint.

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6043d40f1d74..8f5c4a7c1501 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -786,16 +786,7 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 	/* Switch to Virtual RR */
 	virtual_mode = *igt_output_get_mode(output);
 
-	/*
-	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
-	 * modes are available. This avoids the driver mode adjustment. which can cause an
-	 * unintended clock change.
-	 */
-	vrefresh = (output->config.connector->count_modes > 1) ?
-		   (((data->range.max + data->range.min) / 2) + step_size) :
-		   data->range.min + step_size;
-
-	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
+	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
 		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
-- 
2.34.1

