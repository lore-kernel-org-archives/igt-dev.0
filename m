Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEF5CCF9FA
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 12:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBD610EB23;
	Fri, 31 Oct 2025 12:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/u6p8kM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866CA10EB1D
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 12:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761912503; x=1793448503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lgqJ5zfeMeM2X3ONJu9UCM1j2wN1Q4nOZVAea76+Wi4=;
 b=H/u6p8kMJ0/IwyZ7h2ZVELeoqaCPDd+mWoGySiMLUZS5bwPuuTjQcJ6G
 FZSt65lYQpLpVU/NHYWmrszkceQsC2CsIu7hQHi7aDPQILPHmydg5JciZ
 Zxt/pd8T1i1ltJPJsdLtBXh35IGIqUu1/N8hakTIlMaPxQkLVniMMtjJS
 pnH/TvFuEwisonPqjMlyL0GqL/vSMmT0/gtL83NbKQ1k/699LxFUFXJKO
 qlXAMiXsJC+Bg3MQaGIMUDIJPnfgFoIlr6wwLAMOOy2OmzMWTPhwf2L+j
 Ycyn8eQzvsLNIabjBkJAmM3y/sl5X8EKOgHH8mo6iuTINVfMcZJshuNs5 g==;
X-CSE-ConnectionGUID: hr+OgCEyQdejmK0j8Oiwtg==
X-CSE-MsgGUID: tARkgmWqQVW0pRg3fAL3/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63999527"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63999527"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:08:23 -0700
X-CSE-ConnectionGUID: 8Irq2caMTsWEikM+ubdhNQ==
X-CSE-MsgGUID: N1NNF7EvTJeuKjTJn9AekA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="209786927"
Received: from abityuts-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.98])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:08:23 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_peer2peer: gracefully handle ENOSUP
Date: Fri, 31 Oct 2025 12:08:15 +0000
Message-ID: <20251031120813.269203-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031120813.269203-3-matthew.auld@intel.com>
References: <20251031120813.269203-3-matthew.auld@intel.com>
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

Currently this blows up on the multi-dGPU setup we have in CI when
importing the VRAM from one device into the other via dma-buf, due the
P2P internals reporting this as unsupported on this machine. Trying to
manually white list the hostbridge device on the P2P side is also
unsuccessful since the read side test fails due to a data mismatch when
reading from the exported VRAM. There are also no hangs or errors in
dmesg although strangely the write side test passes. So it appears that
the direction of the copy is broken when reading the exported VRAM from
the importer side. Manually disabling/enabling iommu also make no
difference. And finally hacking the test to force same device
import/export makes the test pass, which should rule out any kind of
test defect. With that gracefully skip running the VRAM import subtests
if this is reported as unsupported by the kernel.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6433
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1173
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_peer2peer.c | 39 ++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
index b777d2b66..70374e56d 100644
--- a/tests/intel/xe_peer2peer.c
+++ b/tests/intel/xe_peer2peer.c
@@ -116,11 +116,24 @@ static void test_read(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
 	uint32_t im_xe = im_gpu->fd;
 	uint32_t ex_src, dmabuf;
 	uint32_t stride;
-
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
 	};
 	intel_ctx_t *ctx;
+	int err;
+
+	blt_copy_init(ex_xe, &ex_blt);
+	src = blt_create_object(&ex_blt, ex_reg, width, height, bpp, 0,
+				T_LINEAR, COMPRESSION_DISABLED, 0, true);
+
+	dmabuf = prime_handle_to_fd(ex_xe, src->handle);
+	err = __prime_fd_to_handle(im_xe, dmabuf, &ex_src);
+	if (err == -ENOTSUP) {
+		blt_destroy_object(ex_xe, src);
+		igt_assert(ex_reg != system_memory(ex_xe));
+		igt_skip("P2P VRAM import not supported on this device, skipping.\n");
+	}
+	igt_assert(!err);
 
 	vm = xe_vm_create(im_xe, 0, 0);
 	exec_queue = xe_exec_queue_create(im_xe, vm, &inst, 0);
@@ -129,17 +142,12 @@ static void test_read(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
 					 INTEL_ALLOCATOR_SIMPLE,
 					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
 
-	blt_copy_init(ex_xe, &ex_blt);
 	blt_copy_init(im_xe, &im_blt);
 
-	src = blt_create_object(&ex_blt, ex_reg, width, height, bpp, 0,
-				T_LINEAR, COMPRESSION_DISABLED, 0, true);
 	dst = blt_create_object(&im_blt, im_reg, width, height, bpp, 0,
 				T_LINEAR, COMPRESSION_DISABLED, 0, true);
 	blt_surface_fill_rect(ex_xe, src, width, height);
 
-	dmabuf = prime_handle_to_fd(ex_xe, src->handle);
-	ex_src = prime_fd_to_handle(im_xe, dmabuf);
 	im_src = calloc(1, sizeof(*im_src));
 
 	stride = width * 4;
@@ -198,11 +206,23 @@ static void test_write(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
 	uint32_t im_xe = im_gpu->fd;
 	uint32_t ex_dst, dmabuf;
 	uint32_t stride;
-
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
 	};
 	intel_ctx_t *ctx;
+	int err;
+
+	blt_copy_init(ex_xe, &ex_blt);
+	dst = blt_create_object(&ex_blt, ex_reg, width, height, bpp, 0,
+				T_LINEAR, COMPRESSION_DISABLED, 0, true);
+	dmabuf = prime_handle_to_fd(ex_xe, dst->handle);
+	err = __prime_fd_to_handle(im_xe, dmabuf, &ex_dst);
+	if (err == -ENOTSUP) {
+		blt_destroy_object(ex_xe, dst);
+		igt_assert(ex_reg != system_memory(ex_xe));
+		igt_skip("P2P VRAM import not supported on this device, skipping.\n");
+	}
+	igt_assert(!err);
 
 	vm = xe_vm_create(im_xe, 0, 0);
 	exec_queue = xe_exec_queue_create(im_xe, vm, &inst, 0);
@@ -211,17 +231,12 @@ static void test_write(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
 					 INTEL_ALLOCATOR_SIMPLE,
 					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
 
-	blt_copy_init(ex_xe, &ex_blt);
 	blt_copy_init(im_xe, &im_blt);
 
-	dst = blt_create_object(&ex_blt, ex_reg, width, height, bpp, 0,
-				T_LINEAR, COMPRESSION_DISABLED, 0, true);
 	src = blt_create_object(&im_blt, im_reg, width, height, bpp, 0,
 				T_LINEAR, COMPRESSION_DISABLED, 0, true);
 	blt_surface_fill_rect(im_xe, src, width, height);
 
-	dmabuf = prime_handle_to_fd(ex_xe, dst->handle);
-	ex_dst = prime_fd_to_handle(im_xe, dmabuf);
 	im_dst = calloc(1, sizeof(*im_dst));
 
 	stride = width * 4;
-- 
2.51.0

