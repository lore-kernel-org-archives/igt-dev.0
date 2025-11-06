Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD02DCCFA13
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 12:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF0F10E8B1;
	Thu,  6 Nov 2025 12:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctOelwL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC2210E048
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762431524; x=1793967524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D9yDQ4gCvB5l3p0Fhcr8Aue2Lp3Z2bj95qCqmdYRcZk=;
 b=ctOelwL1zB6pVNR0Uy5nIso3jTRWj66gGPxHEth8OjeXvKnDksyjxeFC
 CKbzM3RljmvJ85skIkpbib6tbTOFD7sgF7I9T8MAW7JoTZdeiIz3eeJEF
 wvI5USzZR6yCFvq55yNBC7ssCzRYGrCjJ+303DK3vUf80F0by08N45qiN
 2WwIOPxkFeDnKLzu3J79QJUomTHRWG0qeU0QUVLHhoHzRk/VxdC3ac4mI
 rQrl9rUy+rZgELQFkarUmdozXfCZglaMIdBF6x8g09Y5TK+u85HFAwoGQ
 OYYw7GH07ZcF/KEncgp8O/jjZTKy+LLTOYR1cZPUPRlVhnve9+RtacoM7 w==;
X-CSE-ConnectionGUID: aIW8H0udQsieUjuTD6vtRw==
X-CSE-MsgGUID: bFEboz7gR7mMVnhhNM5nLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75680586"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75680586"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:18:44 -0800
X-CSE-ConnectionGUID: miZa6nH3SPON+ChXTjn47Q==
X-CSE-MsgGUID: /JsjwdC/RrW5JtZPQfR5hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187459108"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.194])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:18:42 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Subject: [PATCH i-g-t v4 2/2] tests/intel/xe_peer2peer: gracefully handle
 ENOTSUP
Date: Thu,  6 Nov 2025 12:18:33 +0000
Message-ID: <20251106121831.150128-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106121831.150128-3-matthew.auld@intel.com>
References: <20251106121831.150128-3-matthew.auld@intel.com>
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

v2 (Kamil & Sanjay)
  - s/ENOSUP/ENOTSUP/ in commit title

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6433
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1173
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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
2.51.1

