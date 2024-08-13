Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A54DC52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 12:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0451710E339;
	Tue, 13 Aug 2024 12:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKngB9q2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919FF10E336
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723553146; x=1755089146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MXeBMRh+Xz8l3D5er3BDOsFFlqbqo7KlikYzVyK1xe4=;
 b=RKngB9q2sdieSwxIJ/03u4BF8anRkctcSNsPb4k/l0cD77kyY+rJobbr
 sNKz8D4JPZgkp65aJPtgbdaFbBp3Ppmj3OrXSxFE3JNiPFw12aRCEbXJH
 VFppv/+/8K2sQ1mGYWghMLZXWcmN1AN+An1LE5m9Em6j3xgM5CFJlVEZc
 9ZGp/OSguI/wCyBYXELSmhKOJegEwQaBS19FyKZ7S2HRAIwZ2DxygsJg9
 id6qQIDLI7m3tJcWda7cSUFQpoLAMUjssJ4QXyj9ruhU+uBzznHFtUPMZ
 0bfmDVYNMCES9vdtYCG4rfw0/WnniU0abcVbpDJ4UGj0BwuPEdSsd+QXH g==;
X-CSE-ConnectionGUID: 739TTkTjQUujHtEIvrkGTg==
X-CSE-MsgGUID: 47M8oNt6RzWi2dFKeAMUGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21582218"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21582218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:45:45 -0700
X-CSE-ConnectionGUID: f0Lf+YHeQKi7Rc4wv9Njjw==
X-CSE-MsgGUID: HBgABMTZQ9K3yM04b6fiRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63338259"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.213])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:45:44 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH i-g-t] lib|tests: Don't dereference engine outside
 for_each_ctx_engine macro
Date: Tue, 13 Aug 2024 14:45:36 +0200
Message-Id: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Engine used inside for_each_ctx_engine() macro is valid only inside its
block as it is accessing local stack memory. Using outside the block works
by an accident if luckily nothing will overwrite this stack before use.
Fix found risky usages by using engine only inside the block or do its
copy.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
---
 lib/igt_fb.c                    |  8 ++++----
 tests/intel/gem_lmem_swapping.c | 14 ++++++++++----
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ab162a5b74..addff2cfba 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3050,13 +3050,13 @@ static void blitcopy(const struct igt_fb *dst_fb,
 						   dst_fb->size);
 		} else if (ahnd && block_copy_ok(src_fb) && block_copy_ok(dst_fb)) {
 			for_each_ctx_engine(src_fb->fd, ictx, e) {
-				if (gem_engine_can_block_copy(src_fb->fd, e))
+				if (gem_engine_can_block_copy(src_fb->fd, e)) {
+					do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
+						      bb, bb_size, ictx, e);
 					break;
+				}
 			}
 			igt_assert_f(e, "No block copy capable engine found!\n");
-
-			do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
-				      bb, bb_size, ictx, e);
 		} else {
 			igt_blitter_src_copy(dst_fb->fd,
 					     ahnd, ctx, NULL,
diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
index b8f24742b8..b125261519 100644
--- a/tests/intel/gem_lmem_swapping.c
+++ b/tests/intel/gem_lmem_swapping.c
@@ -189,6 +189,7 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
 {
 	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
 	const struct intel_execution_engine2 *e;
+	struct intel_execution_engine2 ec;
 	struct blt_copy_data blt = {};
 	struct blt_copy_batch *cmd;
 	uint64_t size = 4096;
@@ -196,8 +197,10 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
 
 	obj->seed = seed;
 	for_each_ctx_engine(i915, ctx, e) {
-		if (gem_engine_can_block_copy(i915, e))
+		if (gem_engine_can_block_copy(i915, e)) {
+			ec = *e;
 			break;
+		}
 	}
 	igt_assert_f(e, "Ctx don't have blt engine\n");
 
@@ -224,7 +227,7 @@ init_object_ccs(int i915, struct object *obj, struct blt_copy_object *tmp,
 	blt_set_object_ext(&ext.dst, 0, obj->blt_obj->x2, obj->blt_obj->y2,
 			   SURFACE_TYPE_2D);
 
-	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
+	blt_block_copy(i915, ctx, &ec, ahnd, &blt, pext);
 	free(cmd);
 }
 
@@ -255,14 +258,17 @@ verify_object_ccs(int i915, const struct object *obj,
 {
 	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
 	const struct intel_execution_engine2 *e;
+	struct intel_execution_engine2 ec;
 	struct blt_copy_data blt = {};
 	struct blt_copy_batch *cmd;
 	uint64_t size = 4096;
 	unsigned long j, val, *buf;
 
 	for_each_ctx_engine(i915, ctx, e) {
-		if (gem_engine_can_block_copy(i915, e))
+		if (gem_engine_can_block_copy(i915, e)) {
+			ec = *e;
 			break;
+		}
 	}
 	igt_assert_f(e, "Ctx don't have blt engine\n");
 
@@ -284,7 +290,7 @@ verify_object_ccs(int i915, const struct object *obj,
 	blt_set_object_ext(&ext.src, 0, obj->blt_obj->x2, obj->blt_obj->y2,
 			   SURFACE_TYPE_2D);
 	blt_set_object_ext(&ext.dst, 0, tmp->x2, tmp->y2, SURFACE_TYPE_2D);
-	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
+	blt_block_copy(i915, ctx, &ec, ahnd, &blt, pext);
 
 	buf = gem_mmap__device_coherent(i915, tmp->handle, 0,
 					obj->size, PROT_READ);
-- 
2.34.1

