Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7B2C7115D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 05:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F27C10E196;
	Thu, 29 Aug 2024 05:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IrYbDnUy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94BB10E196
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 05:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724909049; x=1756445049;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S2a+g/439N+nDddsGKas80+eUR9Jpqwmn6ozIyYzqM0=;
 b=IrYbDnUy/YPHmyQQMjSCK8B+R4iZMxIjbHYdmKLjg9WtZCg5vfv1oj3T
 JQx74RjVLNtmVqiKsjan81GZx5JzzPiFskINbAMaIBqSXh91r5JhuUoU1
 m9/DGFpbY+u1Vk5hsCA1pdgI/bTuRpxriFrChjB/ooQNcV4xXpcsuzUO7
 5ao41x7D2v3POpmTSYiKspwDijk42TVD68IJc6Jl/OHEa+JAlBrfCPYc9
 e4k5BvpbXcPjT6S5lbAhH+0yAHNq4rHbj5q85T+67flZj/nrrNw4VpI8/
 1V1hLmYuQPxkJDnXCUv2cycgc+0azmoH7WxvcAEXtr+CB/eReLBsm+9S/ Q==;
X-CSE-ConnectionGUID: 2mEDXj+SRCCOjoEEJXRlNw==
X-CSE-MsgGUID: JVzLRIS6Qq+BP4Jp4Mx0xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27352867"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="27352867"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 22:24:08 -0700
X-CSE-ConnectionGUID: F/SZcA2xRSyA3ydBHZtvYA==
X-CSE-MsgGUID: uKXZ6vLhSfSknLUda33wpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="94200495"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 22:24:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [CI i-g-t 1/5] tests/intel/xe_drm_fdinfo: Print timestamp for debug
Date: Wed, 28 Aug 2024 22:23:50 -0700
Message-ID: <20240829052354.1872909-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_spin is capable of writing the timestamp from the GPU side. This is a
good way to compare what we are reading from the fdinfo with what the
GPU is seeing. Example output:

(xe_drm_fdinfo:10404) DEBUG: rcs: spinner ended (timestamp=9817720)
(xe_drm_fdinfo:10404) DEBUG: bcs: spinner ended (timestamp=9755785)
(xe_drm_fdinfo:10404) DEBUG: vecs: spinner ended (timestamp=9653024)
(xe_drm_fdinfo:10404) DEBUG: ccs: spinner ended (timestamp=9722776)
(xe_drm_fdinfo:10404) DEBUG: rcs: sample 1: cycles 19513436, total_cycles 130596422980
(xe_drm_fdinfo:10404) DEBUG: rcs: sample 2: cycles 29331470, total_cycles 130606141449

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index e3a99a2dc..074a89711 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -416,6 +416,7 @@ spin_sync_start(int fd, struct spin_ctx *ctx)
 		return;
 
 	ctx->spin_opts.addr = ctx->addr;
+	ctx->spin_opts.write_timestamp = true;
 	ctx->spin_opts.preempt = true;
 	xe_spin_init(ctx->spin, &ctx->spin_opts);
 
@@ -448,7 +449,8 @@ spin_sync_end(int fd, struct spin_ctx *ctx)
 	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	ctx->ended = true;
-	igt_debug("%s: spinner ended\n", engine_map[ctx->class]);
+	igt_debug("%s: spinner ended (timestamp=%u)\n", engine_map[ctx->class],
+		  ctx->spin->timestamp);
 }
 
 static void
-- 
2.43.0

