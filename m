Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B831F513F8
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 04:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5E710E333;
	Fri,  6 Mar 2026 04:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGERSsWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE0210E333
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 04:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772770654; x=1804306654;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1CR4ACAmron/wuPEhh7mK9y0lnIxCU1tlz5Q5yAXZ6E=;
 b=NGERSsWHHvdOzQT0C+dm5GvmMSg4NDDsBB3MF3/Am2w8D763jj+EA0n+
 h9pH29CNJ9CeFqke8eG4c/V9mXyTdb3UNw+XEso6M2+srbVhEPhHcv9aF
 myMRr9Y9plj6UyZW4G3eRYO9kjQ15C2TvdBEO8VNw1JmkLRJnLmlBMDv8
 GrOjt8uyzUiCyW4gPkSRyp6TRr9pVDB22NaULoLnDhqY5cUtFDWY8yp+2
 Trklof75zf8hbPBm0YgLgVx0YWUF0qAM9qJtuqGS11tKQ6q9oiwVOc/P+
 k7tP9zRQ9NebjTDZr4vkA99MLPwZp/rnMYN4MjpnWJ7KkHKuBn9A4jbTQ g==;
X-CSE-ConnectionGUID: DDlpw6y4QWup6ZAXZlVjZg==
X-CSE-MsgGUID: o9UBqYUNTsCwad0XQabHdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85223361"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="85223361"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:17:34 -0800
X-CSE-ConnectionGUID: RoSkCSRhSnyEws5lHzLzMA==
X-CSE-MsgGUID: YknqDWkOTQmMrdkn/UAk1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="256799136"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 20:17:32 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 4/5] tests/intel/xe_pat: Use
 intel_get_defer_to_pat_mocs_index() to exercise coherency
Date: Fri,  6 Mar 2026 09:47:25 +0530
Message-ID: <20260306041720.1760867-11-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306041720.1760867-7-priyanka.dandamudi@intel.com>
References: <20260306041720.1760867-7-priyanka.dandamudi@intel.com>
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

With the existing moc indices the render and blit will be uncached on GPU side,
cached MOCS setting need to be selected specifically for blitter and render.
Otherwise the caching in the PAT index is overridden which means GPU vs CPU coherency
will not be exercised completely.
So, used intel_get_defer_to_pat_mocs_index() for xe2 and above versions
otherwise keep the existing UC MOCS setting.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_pat.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 166941812..aeb84dbb7 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -404,9 +404,13 @@ static void pat_index_blt(struct xe_pat_param *p)
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
@@ -430,12 +434,12 @@ static void pat_index_blt(struct xe_pat_param *p)
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
@@ -514,6 +518,8 @@ static void pat_index_blt(struct xe_pat_param *p)
 static void pat_index_render(struct xe_pat_param *p)
 {
 	int fd = p->fd;
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	uint8_t mocs_index;
 	igt_render_copyfunc_t render_copy = NULL;
 	int size, stride, width = p->size->width, height = p->size->height;
 	struct intel_buf src, dst;
@@ -529,6 +535,9 @@ static void pat_index_render(struct xe_pat_param *p)
 	if (p->r2_compressed) /* XXX */
 		return;
 
+	mocs_index = intel_get_device_info(dev_id)->graphics_ver >= 20 ?
+		     intel_get_defer_to_pat_mocs_index(fd) : DEFAULT_MOCS_INDEX;
+
 	bops = buf_ops_create(fd);
 
 	ibb = intel_bb_create_full(fd, 0, 0, NULL, xe_get_default_alignment(fd),
@@ -541,11 +550,11 @@ static void pat_index_render(struct xe_pat_param *p)
 
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
@@ -623,6 +632,8 @@ static void pat_index_render(struct xe_pat_param *p)
 static void pat_index_dw(struct xe_pat_param *p)
 {
 	int fd = p->fd;
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	uint8_t mocs_index;
 	int size, stride, width = p->size->width, height = p->size->height;
 	struct drm_xe_engine_class_instance *hwe;
 	struct intel_bb *ibb;
@@ -645,6 +656,9 @@ static void pat_index_dw(struct xe_pat_param *p)
 			break;
 	}
 
+	mocs_index = intel_get_device_info(dev_id)->graphics_ver >= 20 ?
+		     intel_get_defer_to_pat_mocs_index(fd) : DEFAULT_MOCS_INDEX;
+
 	vm = xe_vm_create(fd, 0, 0);
 	ctx = xe_exec_queue_create(fd, vm, hwe, 0);
 
@@ -658,12 +672,13 @@ static void pat_index_dw(struct xe_pat_param *p)
 
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

