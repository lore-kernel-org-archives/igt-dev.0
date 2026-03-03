Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371AFE67A6B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 06:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB0510E63F;
	Tue,  3 Mar 2026 06:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2OTOcwl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636EB10E63D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 06:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772519434; x=1804055434;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CHqQa+ZqS5dlZTlecQJAgyaMLKEYec4JNLPOMhOuBwA=;
 b=l2OTOcwl3gPgGJmFTXfNvCYunJcYf3yTgeLQxvZtroecCgtAIvkYXsb1
 gcPjo7YE7glMxvQeHhtAr1rfiTBLbZhiLqia/8QTUPC0NB21gmbnfTX9N
 5Ubc8wTwqi+oa+E59iILcSjkpcd9sMlH2TBzz239jak7rKKMLnTO6YGoA
 O4Owsf20n9oUrrAVq2Xw7qB3aZCwTv4oUMhLKj8abKHaaXIlcZgTEflu3
 atj9wWePc1qTtModesp+IZb8xzzIjTxvpH4i6nRmH6z8qBmYSGYWxU++2
 XTgq66oz90EJP9NiZTXLcZfqPlYaY9ZzZMUtp1/5ij61JMqqH21bW78G2 Q==;
X-CSE-ConnectionGUID: TUCWNkvhRZac4KexAmNITQ==
X-CSE-MsgGUID: h9MLmEKnQLW/H27YUb0IGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73729981"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="73729981"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:30:34 -0800
X-CSE-ConnectionGUID: BSizheFgSWa5amV5VSZLvw==
X-CSE-MsgGUID: TmlkhAvkSQi9YGBJvG/TKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="215838472"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa007.fm.intel.com with ESMTP; 02 Mar 2026 22:30:32 -0800
From: priyanka.dandamudi@intel.com
To: zbigniew.kempczynski@intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 1/2] lib/gpu_cmds: Add support for compute walker
 interrupt
Date: Tue,  3 Mar 2026 12:00:29 +0530
Message-ID: <20260303063030.1685514-2-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303063030.1685514-1-priyanka.dandamudi@intel.com>
References: <20260303063030.1685514-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Make some lib functions global to be used in compute walker interrupt test.
Add support for compute walker interrupts and its post sync operations.
Make some dependent library functions globally accessible.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/gpgpu_shader.c |  4 ++--
 lib/gpgpu_shader.h |  2 ++
 lib/gpu_cmds.c     | 15 ++++++++++++---
 lib/gpu_cmds.h     |  9 ++++++++-
 4 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 874f2c63d6..20f39aa769 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -151,7 +151,7 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
 		      engine | I915_EXEC_NO_RELOC, false);
 }
 
-static void
+void
 fill_inline_data(uint32_t *inline_data, uint64_t target_offset, struct intel_buf *target,
 		 uint32_t x_dim)
 {
@@ -265,7 +265,7 @@ __xe3p_gpgpu_execfunc(struct intel_bb *ibb,
 	/* Inline data is at 32th dword of COMPUTE_WALKER_2 */
 	inline_data = intel_bb_ptr(ibb) + 4 * 32;
 	/* Pass a value of "SIMD_SIZE(16) * x_dim" as the argument for width */
-	xe3p_emit_compute_walk2(ibb, 0, 0, x_dim * 16, y_dim, &idd, x_dim * y_dim);
+	xe3p_emit_compute_walk2(ibb, 0, 0, x_dim * 16, y_dim, &idd, x_dim * y_dim, NULL);
 	fill_inline_data(inline_data, xe_canonical_va(ibb->fd, target->addr.offset), target, x_dim);
 
 	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
index fc931a72b4..7c10572bca 100644
--- a/lib/gpgpu_shader.h
+++ b/lib/gpgpu_shader.h
@@ -83,6 +83,8 @@ void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes
 
 uint32_t gpgpu_shader__get_max_threads_in_tg(struct gpgpu_shader *shdr);
 
+void fill_inline_data(uint32_t *inline_data, uint64_t target_offset,
+		      struct intel_buf *target, uint32_t x_dim);
 void gpgpu_shader__wait(struct gpgpu_shader *shdr);
 void gpgpu_shader__breakpoint_on(struct gpgpu_shader *shdr, uint32_t cmd_no);
 void gpgpu_shader__breakpoint(struct gpgpu_shader *shdr);
diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index cd912eb2ac..10c8bfb8dd 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -1272,7 +1272,8 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
 			unsigned int x, unsigned int y,
 			unsigned int width, unsigned int height,
 			struct xe3p_interface_descriptor_data *pidd,
-			uint32_t max_threads)
+			uint32_t max_threads,
+			struct xe3p_cw2_interrupt_data *intdata)
 {
 	/*
 	 * Max Threads represent range: [1, 2^16-1],
@@ -1353,8 +1354,16 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
 	}
 
 	/* Post Sync command payload 0 */
-	for (int i = 0; i < 5; i++) {					//dw26-30
-		intel_bb_out(ibb, 0);
+	if (intdata != NULL) {
+		intel_bb_out(ibb, intdata->post_sync_op);
+		intel_bb_out(ibb, intdata->post_sync_addr);
+		intel_bb_out(ibb, intdata->post_sync_addr >> 32);
+		intel_bb_out(ibb, intdata->post_sync_val);
+		intel_bb_out(ibb, intdata->post_sync_val >> 32);
+	} else {
+		for (int i = 0; i < 5; i++) {					//dw26-30
+			intel_bb_out(ibb, 0);
+		}
 	}
 
 	/* Inline data */
diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
index c38eaad865..b3bfb137b0 100644
--- a/lib/gpu_cmds.h
+++ b/lib/gpu_cmds.h
@@ -39,6 +39,12 @@
 #include "intel_bufops.h"
 #include <assert.h>
 
+struct xe3p_cw2_interrupt_data {
+	uint32_t post_sync_op;
+	uint64_t post_sync_addr;
+	uint64_t post_sync_val;
+};
+
 uint32_t
 gen7_fill_curbe_buffer_data(struct intel_bb *ibb, uint8_t color);
 
@@ -159,6 +165,7 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
 			unsigned int x, unsigned int y,
 			unsigned int width, unsigned int height,
 			struct xe3p_interface_descriptor_data *pidd,
-			uint32_t max_threads);
+			uint32_t max_threads,
+			struct xe3p_cw2_interrupt_data *intdata);
 
 #endif /* GPU_CMDS_H */
-- 
2.43.0

