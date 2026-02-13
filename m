Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F9EEF48E8
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 08:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7707F10E7B8;
	Fri, 13 Feb 2026 08:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TG+/i78n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0793B10E7B8
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 08:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770972373; x=1802508373;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6W0vWLGdKzX7JQ4M972XEHBF6oRgSJqmoWvX0PvqHo0=;
 b=TG+/i78n7kLTd7UaR/0xuJA31pggvlyQKOtrnRkMAdD5lrseKLuHM9jK
 +V4ENHe+UnYvBrjQ+ABAJZIXcyd/U1NfHp90F2XwwQXVVs+s36fNDwlA8
 7xRmt8In4fNovfMKMneDMBIUJZBDWJgTLo4iZ8NtLtGdpObREWFGY6L7e
 8nP1BYU6XXeoWidlamQvAIca+LmRsaoIfjHLpZxanhbrXds+b+uW9JgBC
 gkbB0HzsXGqCDEDPOfmJ7b7StDvc12wFHs39DdQRbXg0VZSTfavCt2+lR
 /sbXR5DeGKuLDc5l3+4ffluZOwSntmZpNtwY5FCgzqUlw/I+E5DNS/Xq7 Q==;
X-CSE-ConnectionGUID: OOGhRhQBQCmFEdCfa4RZdA==
X-CSE-MsgGUID: gJq/BMcfQhSkss+no2e8Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72142242"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72142242"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:46:12 -0800
X-CSE-ConnectionGUID: swS0LU64QkOiK7yEww2vuw==
X-CSE-MsgGUID: HPodVxjuRaOJvwtnA3OIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="217337021"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2026 00:46:11 -0800
From: priyanka.dandamudi@intel.com
To: zbigniew.kempczynski@intel.com, matthew.auld@intel.com,
 igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 4/5] tests/intel/xe_pat: Use
 intel_get_defer_to_pat_mocs_index() to exercise coherency
Date: Fri, 13 Feb 2026 14:16:02 +0530
Message-ID: <20260213084603.1404162-5-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213084603.1404162-1-priyanka.dandamudi@intel.com>
References: <20260213084603.1404162-1-priyanka.dandamudi@intel.com>
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

With the existing moc indices the render and blit with be uncached on GPU side,
cached MOCS setting need to be selected specifically for blitter and render.
Otherwise the caching in the PAT index is overridden which means GPU vs CPU coherency
will not be exercised completely.
So, used intel_get_defer_to_pat_mocs_index() for xe2 and above versions
otherwise keep the existing UC MOCS setting.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_pat.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 132ac4773..f2dff62a9 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -338,9 +338,13 @@ static void pat_index_blt(struct xe_pat_param *p)
 	int bpp = 32;
 	uint32_t alias, name;
 	int fd = p->fd;
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	uint8_t mocs_index;
 	int i;
 
 	igt_require(blt_has_fast_copy(fd));
+	mocs_index = intel_get_device_info(dev_id)->graphics_ver >= 20 ?
+		     intel_get_defer_to_pat_mocs_index(fd) : intel_get_uc_mocs_index(fd);
 
 	vm = xe_vm_create(fd, 0, 0);
 	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
@@ -364,12 +368,12 @@ static void pat_index_blt(struct xe_pat_param *p)
 	blt_copy_init(fd, &blt);
 	blt.color_depth = CD_32bit;
 
-	blt_set_object(&src, p->r1_bo, size, p->r1, intel_get_uc_mocs_index(fd),
+	blt_set_object(&src, p->r1_bo, size, p->r1, mocs_index,
 		       p->r1_pat_index, T_LINEAR,
 		       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
 	blt_set_geom(&src, stride, 0, 0, width, height, 0, 0);
 
-	blt_set_object(&dst, p->r2_bo, size, p->r2, intel_get_uc_mocs_index(fd),
+	blt_set_object(&dst, p->r2_bo, size, p->r2, mocs_index,
 		       p->r2_pat_index, T_LINEAR,
 		       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
 	blt_set_geom(&dst, stride, 0, 0, width, height, 0, 0);
@@ -448,6 +452,8 @@ static void pat_index_blt(struct xe_pat_param *p)
 static void pat_index_render(struct xe_pat_param *p)
 {
 	int fd = p->fd;
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	uint8_t mocs_index;
 	igt_render_copyfunc_t render_copy = NULL;
 	int size, stride, width = p->size->width, height = p->size->height;
 	struct intel_buf src, dst;
@@ -463,6 +469,9 @@ static void pat_index_render(struct xe_pat_param *p)
 	if (p->r2_compressed) /* XXX */
 		return;
 
+	mocs_index = intel_get_device_info(dev_id)->graphics_ver >= 20 ?
+		     intel_get_defer_to_pat_mocs_index(fd) : DEFAULT_MOCS_INDEX;
+
 	bops = buf_ops_create(fd);
 
 	ibb = intel_bb_create_full(fd, 0, 0, NULL, xe_get_default_alignment(fd),
@@ -475,11 +484,11 @@ static void pat_index_render(struct xe_pat_param *p)
 
 	intel_buf_init_full(bops, p->r1_bo, &src, width, height, bpp, 0,
 			    I915_TILING_NONE, I915_COMPRESSION_NONE, size,
-			    stride, p->r1, p->r1_pat_index, DEFAULT_MOCS_INDEX);
+			    stride, p->r1, p->r1_pat_index, mocs_index);
 
 	intel_buf_init_full(bops, p->r2_bo, &dst, width, height, bpp, 0,
 			    I915_TILING_NONE, I915_COMPRESSION_NONE, size,
-			    stride, p->r2, p->r2_pat_index, DEFAULT_MOCS_INDEX);
+			    stride, p->r2, p->r2_pat_index, mocs_index);
 
 	/* Ensure we always see zeroes for the initial KMD zeroing */
 	render_copy(ibb,
@@ -557,6 +566,8 @@ static void pat_index_render(struct xe_pat_param *p)
 static void pat_index_dw(struct xe_pat_param *p)
 {
 	int fd = p->fd;
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	uint8_t mocs_index;
 	int size, stride, width = p->size->width, height = p->size->height;
 	struct drm_xe_engine_class_instance *hwe;
 	struct intel_bb *ibb;
@@ -579,6 +590,9 @@ static void pat_index_dw(struct xe_pat_param *p)
 			break;
 	}
 
+	mocs_index = intel_get_device_info(dev_id)->graphics_ver >= 20 ?
+		     intel_get_defer_to_pat_mocs_index(fd) : DEFAULT_MOCS_INDEX;
+
 	vm = xe_vm_create(fd, 0, 0);
 	ctx = xe_exec_queue_create(fd, vm, hwe, 0);
 
@@ -592,12 +606,13 @@ static void pat_index_dw(struct xe_pat_param *p)
 
 	intel_buf_init_full(bops, p->r1_bo, &r1_buf, width, height, bpp, 0,
 			    I915_TILING_NONE, I915_COMPRESSION_NONE, size,
-			    stride, p->r1, p->r1_pat_index, DEFAULT_MOCS_INDEX);
+			    stride, p->r1, p->r1_pat_index, mocs_index);
 	intel_bb_add_intel_buf(ibb, &r1_buf, true);
 
 	intel_buf_init_full(bops, p->r2_bo, &r2_buf, width, height, bpp, 0,
 			    I915_TILING_NONE, I915_COMPRESSION_NONE, size,
-			    stride, p->r2, p->r2_pat_index, DEFAULT_MOCS_INDEX);
+			    stride, p->r2, p->r2_pat_index, mocs_index);
+
 	intel_bb_add_intel_buf(ibb, &r2_buf, true);
 
 	/*
-- 
2.43.0

