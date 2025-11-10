Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F18CD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95ABC10E3C4;
	Mon, 10 Nov 2025 13:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZ5x1P2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AB510E3C4
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762783056; x=1794319056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tR8skcNn9yY2HRG+RS0VPvcJD9QOhI2bcbjZBaeFWa0=;
 b=JZ5x1P2K1OOskXD9HRKDIGMYBqr/mvRp0/zTpwRQfSq7UTiYn1WoHnix
 E+L4TOh99MJZ5Gz5kxSKLradRZknmiH6408ix0XjWscWKliREgAtAL0qr
 hYfTPU8Rj+2NChk7RTX+qtMDwWP5oX+DOFIZMjp3VhxJKUQBMMvy429d2
 p1/TFFCEjnz1JQ6DfFE8Y3PyDRmvYHPAjmBPW9iQIYnIJZ1cM6JGAsgjz
 TjN75TTDoF+I0GzD7bjCCVW6eu94s5Ye/DAUuhYa5UQavZS328/5yWFiO
 T9qhVSnEOIilgA8Q7ur9OPI2iKz+qHHnKF9LZ9IYNwKThVtTmA9g0UPA/ A==;
X-CSE-ConnectionGUID: zbj9hfGaQOeoUMXVho/W7g==
X-CSE-MsgGUID: /vQ2vsfyRb2zSdWFRWuRkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64740032"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="64740032"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 05:57:36 -0800
X-CSE-ConnectionGUID: 1Vc/I/QfRvCB9A+sEWXU6g==
X-CSE-MsgGUID: iCfoQ9KLTCehF1FAtGOJbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188422956"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 05:57:35 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 2/2] xe_exercise_blt: Insert a flush between two consecutive
 FAST_COPY
Date: Mon, 10 Nov 2025 19:28:07 +0530
Message-ID: <20251110135805.3620715-4-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
References: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
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

As per the spec, a flush is required between two dependent BLT
instructions. In fast-copy-emit, the source of the second BLT
instruction was the destination of the previous BLT instuction.
Therefore a flush is required between them.

Bpsec: 57567,57555

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 include/intel_gpu_commands.h  |  4 ++++
 tests/intel/xe_exercise_blt.c | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
index cd281ba89..f6d367442 100644
--- a/include/intel_gpu_commands.h
+++ b/include/intel_gpu_commands.h
@@ -445,6 +445,10 @@
 
 #define XE2_STATE_SIP \
 	((0x3 << 29) | (0x0 << 27) | (0x1 << 24) | (0x1 << 17))
+
+#define XE2_MI_FLUSH_DW		(0x26 << 23)
+#define   FLUSH_LEN_DW		(2)
+#define   FLUSH_LEN_QW		(3)
 /*
  * Used to convert any address to canonical form.
  * Starting from gen8, some commands (e.g. STATE_BASE_ADDRESS,
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index a545654d3..06a2eedca 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -86,6 +86,7 @@ static int fast_copy_one_bb(int xe,
 	uint64_t bb_offset, alignment;
 	uint64_t bb_pos = 0;
 	int ret = 0;
+	uint32_t *bb;
 
 	alignment = xe_get_default_alignment(xe);
 
@@ -103,6 +104,19 @@ static int fast_copy_one_bb(int xe,
 	blt_tmp.print_bb = blt->print_bb;
 	bb_pos = emit_blt_fast_copy(xe, ahnd, &blt_tmp, bb_pos, false);
 
+	bb = xe_bo_map(xe, blt->bb.handle, blt->bb.size);
+	/*
+	 * Bspec asks to insert a flush between two BLIT instructions to resolve
+	 * BLIT level dependency. Though the spec is not clear in explaining
+	 * it, HW team requested for a flush instuction between these two BLIT
+	 * instuctions as they have a dependency.
+	 */
+	bb[bb_pos++] = XE2_MI_FLUSH_DW | FLUSH_LEN_DW;
+	bb[bb_pos++] = 0;
+	bb[bb_pos++] = 0;
+	bb[bb_pos++] = 0;
+	munmap(bb, blt->bb.size);
+
 	/* Second blit */
 	blt_copy_init(xe, &blt_tmp);
 	blt_tmp.src = blt->mid;
-- 
2.43.0

