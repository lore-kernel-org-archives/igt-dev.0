Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE56C3ABB2
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 06:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7E910E03A;
	Fri, 30 May 2025 06:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a64c/RXz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2652610E792
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 06:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748587291; x=1780123291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tUXy+WmLM3B5MHKkh+wpo0nkkoruxYcY2Wrs5K2PEaM=;
 b=a64c/RXzHDT7LmPtMV9QjN0daHI1KiZIX7xGRK6Cyg3mkAAEqEG5Uu+E
 5IpdYfXL3QPKnVrycAwc6Z++OtHuQAxf9qZZFGZRPD+YN90B4qv7c4ajq
 8Q796gckZ5xLB0xT+Bq8eHDROZYJe3N1hQbErbLjwX1sBW8u280BAnpZ0
 SawKDHnmVTPukcEnUMHO304k0fgMEqquyOR+xPHyjvxqUdVKGyBWak4kQ
 5ovKaU25UXPbIO6uXY15MVSUEpYwcTugwlH/mGLx32xg+mmdh9SWe897R
 D8FOe+3cpf9L2yleqZwrLIIpPxHGymDITf4V/H8PpMlk/dyF3GvdBwep8 Q==;
X-CSE-ConnectionGUID: 0gYBGatQQaCviZnMPCkjHw==
X-CSE-MsgGUID: 1rz3m/eATW+tyfb62zZX0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73204999"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="73204999"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:31 -0700
X-CSE-ConnectionGUID: UIa5oaXoSeWtHL5xW2R2nA==
X-CSE-MsgGUID: W/Vv/qPnQkWCSLGUe9Qy1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143755811"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:29 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 06/11] tests/xe_copy_basic: replace size to rect
 which keeps objects geometry
Date: Fri, 30 May 2025 08:40:45 +0200
Message-ID: <20250530064050.1560398-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
References: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
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

Testing byte/page + linear/matrix mem-copy requires passing different
pitch/width/height so replace simple size to geometry.

Change mem-copy and mem-set to use rect instead of size for
copying bytes.

Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_copy_basic.c | 44 ++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index f252d29fd4..d55991c4f8 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -19,6 +19,12 @@
 
 #define MEM_FILL 0x8b
 
+struct rect {
+	uint32_t pitch;
+	uint32_t width;
+	uint32_t height;
+};
+
 /**
  * TEST: Test to validate copy commands on xe
  * Category: Core
@@ -42,7 +48,7 @@
  */
 static void
 mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
-	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
+	 uint32_t size, uint32_t pitch, uint32_t width, uint32_t height, uint32_t region)
 {
 	struct blt_mem_copy_data mem = {};
 	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
@@ -57,9 +63,9 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 
 	blt_mem_copy_init(fd, &mem, MODE_BYTE, TYPE_LINEAR);
-	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
+	blt_set_mem_object(&mem.src, src_handle, size, pitch, width, height,
 			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
-	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
+	blt_set_mem_object(&mem.dst, dst_handle, size, pitch, width, height,
 			   region, dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	mem.src.ptr = xe_bo_map(fd, src_handle, size);
 	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
@@ -125,13 +131,14 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 	munmap(mem.dst.ptr, size);
 }
 
-static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t region)
+static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t region)
 {
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
 	};
-	uint32_t src_handle, dst_handle, vm, exec_queue, src_size, dst_size;
-	uint32_t bo_size = ALIGN(size, xe_get_default_alignment(fd));
+	uint32_t src_handle, dst_handle, vm, exec_queue;
+	uint32_t pitch = rect->pitch ?: rect->width;
+	uint32_t bo_size = ALIGN(pitch * rect->height, xe_get_default_alignment(fd));
 	intel_ctx_t *ctx;
 
 	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
@@ -140,13 +147,11 @@ static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t reg
 	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
 	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
 
-	src_size = bo_size;
-	dst_size = bo_size;
-
 	if (cmd == MEM_COPY)
-		mem_copy(fd, src_handle, dst_handle, ctx, src_size, size, 1, region);
+		mem_copy(fd, src_handle, dst_handle, ctx, bo_size,
+			 pitch, rect->width, rect->height, region);
 	else if (cmd == MEM_SET)
-		mem_set(fd, dst_handle, ctx, dst_size, size, 1, MEM_FILL, region);
+		mem_set(fd, dst_handle, ctx, bo_size, rect->width, 1, MEM_FILL, region);
 
 	gem_close(fd, src_handle);
 	gem_close(fd, dst_handle);
@@ -160,7 +165,10 @@ igt_main
 	int fd;
 	struct igt_collection *set, *regions;
 	uint32_t region;
-	uint64_t size[] = {0xFD, 0x369, 0x3FFF, 0xFFFE};
+	struct rect linear[] = { { 0, 0xfd, 1 },
+				 { 0, 0x369, 1 },
+				 { 0, 0x3fff, 1 },
+				 { 0, 0xfffe, 1 } };
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -170,22 +178,22 @@ igt_main
 					       DRM_XE_MEM_REGION_CLASS_VRAM);
 	}
 
-	for (int i = 0; i < ARRAY_SIZE(size); i++) {
-		igt_subtest_f("mem-copy-linear-0x%"PRIx64"", size[i]) {
+	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
+		igt_subtest_f("mem-copy-linear-0x%x", linear[i].width) {
 			igt_require(blt_has_mem_copy(fd));
 			for_each_variation_r(regions, 1, set) {
 				region = igt_collection_get_value(regions, 0);
-				copy_test(fd, size[i], MEM_COPY, region);
+				copy_test(fd, &linear[i], MEM_COPY, region);
 			}
 		}
 	}
 
-	for (int i = 0; i < ARRAY_SIZE(size); i++) {
-		igt_subtest_f("mem-set-linear-0x%"PRIx64"", size[i]) {
+	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
+		igt_subtest_f("mem-set-linear-0x%x", linear[i].width) {
 			igt_require(blt_has_mem_set(fd));
 			for_each_variation_r(regions, 1, set) {
 				region = igt_collection_get_value(regions, 0);
-				copy_test(fd, size[i], MEM_SET, region);
+				copy_test(fd, &linear[i], MEM_SET, region);
 			}
 		}
 	}
-- 
2.43.0

