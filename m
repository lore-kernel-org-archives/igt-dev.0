Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAA9C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 14:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E8B10E9FD;
	Wed, 28 Feb 2024 14:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9uhTGQc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3116510E9FD
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709132089; x=1740668089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s9UwN7OnFaD87jn5B0mg4jKtvrZIo36YpOru2otF41A=;
 b=d9uhTGQck5hSqIo9kr8hMbd3Wl3S2RplO8lpHgcR5kJYUhC3rxQjK4pS
 47J1BcXIZMeqeQdbAgv7yRJIzNGwCLB7OshH047T6mtw5B7v7Ey3SJUXP
 BF/n5L55ctHryBdyRY1kqGqZ05L7ST8ACJnCoQ3mCpPTe3oLOZ6RI4rJw
 gUjC9bp6giw07w+n+iauJCsNnJyTqlVzqv9gvN0nVYiyqAjFzjx8GkaAE
 egAkapOBXVdTw68cHZab810uxlBm78ALBAkNCVGjksiXUYNkngk9N26Gz
 fJ6jUvF2COxE1dZzKS70YoGPrb/WLfExNtlgXEAF5cipDANEfCMOrmBQH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="21080659"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="21080659"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7493070"
Received: from wbosek-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:46 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 7/7] tests/xe_intel_bb: Dump do png without detiling
Date: Wed, 28 Feb 2024 15:54:07 +0100
Message-Id: <20240228145407.370325-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
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

On my work on Lunarlake I often needed to inspect surface without
detiling. Replace dumping surface exactly how it looks in the memory.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_intel_bb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index ef12715dea..c3a4b5450e 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -913,9 +913,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	if (write_png) {
 		snprintf(name, sizeof(name) - 1,
 			 "render_dst_tiling_%d.png", tiling);
-		intel_buf_write_to_png(&src, "render_src_tiling_none.png");
-		intel_buf_write_to_png(&dst, name);
-		intel_buf_write_to_png(&final, "render_final_tiling_none.png");
+		intel_buf_raw_write_to_png(&src, "render_src_tiling_none.png");
+		intel_buf_raw_write_to_png(&dst, name);
+		intel_buf_raw_write_to_png(&final, "render_final_tiling_none.png");
 	}
 
 	/* We'll fail on src <-> final compare so just warn */
-- 
2.34.1

