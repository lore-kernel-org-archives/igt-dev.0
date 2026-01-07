Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F08CD0D16C
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 19:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5409810E5E4;
	Wed,  7 Jan 2026 19:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gab3DfBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2C410E5E4
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767815030; x=1799351030;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vHDLckTbxVOWAxJNZ9vgVigDM+6h2s4V9V++LYHsjhg=;
 b=gab3DfBgIdIrrmg1gUEaaGF9zeJZPrOBrC2KJdIA+nUwucSQTJxbJnZi
 4LhukDDrVQ26t40C9Idv8mLeFbnmzXToEOUgwJhU8A0/IHiGl7PrKTy2p
 xvo5PJwj8oY5i498wRZ0HuMf+AqD7guj2unUvmrZGk+9XNAerNqVL5X0P
 rIwdvgZc7cSdpims5gA7nBZUW1n9NcECNvNU9zk0alZOpEuNSoVMCu7ct
 ms6egbYAgd7jCQDu332lfDqv9SYfYQGQ5cu5rQgF7WNPJBznBoMf8EkJA
 H07fczG93NpMNO8hl7lTk/cZ4FrFWcujaGWwzGLai6X9b06+owfV7f5a0 Q==;
X-CSE-ConnectionGUID: HN3FsVptT2GOYpagxzKVBw==
X-CSE-MsgGUID: zah/9sOcRxSrUoOu6ejj2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69091806"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69091806"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 11:43:49 -0800
X-CSE-ConnectionGUID: r88Q0Nu8T+iSIxxLvtvjgQ==
X-CSE-MsgGUID: eAOU/Dz9Qr2lQ4nbNtn6Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="203457757"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 11:43:49 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com, Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t] tests/intel/xe_ccs: split block-multicopy into 3 submissions
Date: Thu,  8 Jan 2026 03:43:29 +0800
Message-ID: <e2bd6e36919fb6d43e182f17eac21195d1d31e4e.1767814525.git.jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.52.0
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

Split the block multicopy test into separate batch buffer
submissions. Submitting multiple block copies within a
single submission can  result in incorrect ordering between
stages. Run each copy as it's own submission then wait for
completion between stages to ensure proper sequencing
to prevent the read-after-write hazards.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_ccs.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index a21922ee5..33dde0c1f 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -281,8 +281,6 @@ static int blt_block_copy3(int xe,
 	struct blt_copy_data blt0;
 	struct blt_block_copy_data_ext ext0;
 	uint64_t bb_offset, alignment;
-	uint64_t bb_pos = 0;
-	int ret;
 
 	igt_assert_f(ahnd, "block-copy3 supports softpin only\n");
 	igt_assert_f(blt3, "block-copy3 requires data to do blit\n");
@@ -303,7 +301,9 @@ static int blt_block_copy3(int xe,
 	blt0.print_bb = blt3->print_bb;
 	ext0.src = ext3->src;
 	ext0.dst = ext3->mid;
-	bb_pos = emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, false);
+	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
+	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
+	intel_ctx_xe_sync((intel_ctx_t *)ctx, true);
 
 	/* Second blit mid -> dst */
 	blt_copy_init(xe, &blt0);
@@ -314,7 +314,9 @@ static int blt_block_copy3(int xe,
 	blt0.print_bb = blt3->print_bb;
 	ext0.src = ext3->mid;
 	ext0.dst = ext3->dst;
-	bb_pos = emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, false);
+	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
+	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
+	intel_ctx_xe_sync((intel_ctx_t *)ctx, true);
 
 	/* Third blit dst -> final */
 	blt_copy_init(xe, &blt0);
@@ -325,11 +327,11 @@ static int blt_block_copy3(int xe,
 	blt0.print_bb = blt3->print_bb;
 	ext0.src = ext3->dst;
 	ext0.dst = ext3->final;
-	bb_pos = emit_blt_block_copy(xe, ahnd, &blt0, &ext0, bb_pos, true);
+	emit_blt_block_copy(xe, ahnd, &blt0, &ext0, 0, true);
 
 	intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 
-	return ret;
+	return 0;
 }
 
 #define CHECK_MIN_WIDTH 2
-- 
2.52.0

