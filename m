Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67B8D2127D
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 11:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9970F10E7EE;
	Thu, 17 Oct 2024 11:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CRgAhDmz";
	dkim-atps=neutral
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08A310E7EE
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 11:23:55 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-20c8b557f91so9153475ad.2
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729164235; x=1729769035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NUfsu7pHeLPmNnaBVAfktAOzMZ2l/Rn6FSkUkM3IIgI=;
 b=CRgAhDmzvqm2VUuGK4SnHEuIVhhHC10VwMtCivom1tNq0xfhf6xRyuj1gKwdJPn+DO
 nrt/9HCr68X+nvEz4HtPVwoGWHRlm1XvriWyPyEOPDCIiSUJDjBld6ja8G2ouCRZ0uOc
 ClSQIslpAIpPYOPTYmGysIPftxx8uay31FA50bcRrFfG/09cKmyK5gsyD3i5/cfaY6C3
 ZDkl8IAtaCZvfZ1+YUynKq1OzoRlA/MIVwbURGhgG7zHQJ2uZrIj/IRbVRD//JF59tQd
 rvfSKGi0hX9HBwuqGp0WT9mAGYtOJmtaLYrUrTtyYCDspYbZpeeY99WzToLaE0LsBLTx
 gHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729164235; x=1729769035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NUfsu7pHeLPmNnaBVAfktAOzMZ2l/Rn6FSkUkM3IIgI=;
 b=WOmmADA1Q/s6Ny24FmClpGJ7raE4xkCoYtD+waCVBhVQMUm20vuAH5vyLfPKzH62P5
 Px+wciLflRwqNDlSJB/stW5XE7HFLsRkCQurVxDKu7AF1jZSu5uYZPsZozMg4n2oQ2Kd
 PY7RpqH0QltnSLyDV3dFZbFGxoGvu7p9HloT/Tz4ZYr7+JwniRtfcXtotLPzymPsfvrd
 bhBNK/GyYx5y7PHblzyQJLWD58F6aWlNMZfj++Jm54e/MgIU5g6FChWkYPhuyKy+wL6E
 UDnTmwYRLa6y94itoK1wzzgIJSwASvsKFzazIknnD0mFnlnAetxRxUaanCRbWlkXXTlV
 5zuw==
X-Gm-Message-State: AOJu0Yx+Yhu0InXsxrp5zgu5X73oXthpT/v+4V5y7VhZkE9Haw+RO3Y4
 W19KqFqzwsljVxZuV2qivz9a+t3SrOlHkojTJS4bIbHd4Ad+En7ZOTBF/K3Mw4Q=
X-Google-Smtp-Source: AGHT+IFCgnBI3ag3+OOszc0DaKYb5EUVxiZmAm0j3WGaT8cpkkXJJK05DR3B8Z0xOz+Q4F5YMyvpeA==
X-Received: by 2002:a17:902:e5c2:b0:20c:d2e4:dc33 with SMTP id
 d9443c01a7336-20d27e9ac61mr93956725ad.14.1729164235101; 
 Thu, 17 Oct 2024 04:23:55 -0700 (PDT)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ea9c70586fsm4738972a12.60.2024.10.17.04.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 04:23:54 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 3/3] tests/intel/kms_ccs: use igt_fb functions
 instead of locally defined
Date: Thu, 17 Oct 2024 14:27:28 +0300
Message-ID: <20241017112728.3503205-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017112728.3503205-1-juhapekka.heikkila@gmail.com>
References: <20241017112728.3503205-1-juhapekka.heikkila@gmail.com>
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

There's all needed things in igt_fb to create compressed framebuffer
for Intel Xe2, let's used those and remove duplicates from kms_ccs

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_ccs.c | 212 ++++++------------------------------------
 1 file changed, 30 insertions(+), 182 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index cd65ba7b4..a5d3ff5e6 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -608,160 +608,8 @@ static void fast_clear_fb(int drm_fd, struct igt_fb *fb, const float *cc_color)
 	buf_ops_destroy(bops);
 }
 
-static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
-					   uint32_t plane, uint32_t memregion,
-					   uint8_t pat_index)
-{
-	uint32_t name, handle;
-	struct blt_copy_object *blt;
-	uint64_t stride;
-
-	blt = malloc(sizeof(*blt));
-	igt_assert(blt);
-
-	name = gem_flink(fb->fd, fb->gem_handle);
-	handle = gem_open(fb->fd, name);
-
-	stride = fb->strides[plane] / 4;
-
-	blt_set_object(blt, handle, fb->size, memregion,
-		       intel_get_uc_mocs_index(fb->fd),
-		       pat_index,
-		       T_TILE4,
-		       COMPRESSION_DISABLED,
-		       COMPRESSION_TYPE_3D);
-
-	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
-	blt->plane_offset = fb->offsets[plane];
-	blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
-				  PROT_READ | PROT_WRITE);
-	return blt;
-}
-
-static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb,
-					int color_plane)
-{
-	switch (fb->plane_bpp[color_plane]) {
-	case 8:
-		return CD_8bit;
-	case 16:
-		return CD_16bit;
-	case 32:
-		return CD_32bit;
-	case 64:
-		return CD_64bit;
-	case 96:
-		return CD_96bit;
-	case 128:
-		return CD_128bit;
-	default:
-		igt_assert(0);
-	}
-}
-
-static uint32_t blt_compression_format(struct blt_copy_data *blt,
-				       const struct igt_fb *fb,
-				       int color_plane)
-{
-	switch (igt_reduce_format(fb->drm_format)) {
-	case DRM_FORMAT_XRGB16161616F:
-		return 0x7; /* CMF_R16_G16_B16_A16 */
-	case DRM_FORMAT_XRGB2101010:
-		return 0x3; /* CMF_R10_G10_B10_A2 */
-	case DRM_FORMAT_XRGB8888:
-	case DRM_FORMAT_XYUV8888:
-		return 0x2; /* CMF_R8_G8_B8_A8 */
-	case DRM_FORMAT_YUYV:
-		return 0x1; /* CMF_R8_G8 (treated as 16bpp format) */
-	case DRM_FORMAT_NV12:
-		if (color_plane)
-			return 0x1; /* CMF_R8_G8 */
-		else
-			return 0x0; /* CMF_R8 */
-	case DRM_FORMAT_P010:
-		if (color_plane)
-			return 0x6; /* CMF_R16_G16 */
-		else
-			return 0x5; /* CMF_R16 */
-	default:
-		igt_assert_f(0, "Unknown format\n");
-	}
-}
-
-static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb)
-{
-	uint64_t ahnd = 0;
-
-	struct blt_copy_data blt = {};
-	struct blt_copy_object *src, *dst;
-	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
-	uint32_t mem_region;
-	intel_ctx_t *xe_ctx;
-	uint32_t vm, exec_queue;
-	uint32_t xe_bb;
-	uint64_t bb_size = 4096;
-	struct igt_fb *dst_fb = fb, *src_fb = temp_fb;
-
-	struct drm_xe_engine_class_instance inst = {
-		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
-	};
-
-	vm = xe_vm_create(src_fb->fd, 0, 0);
-
-	exec_queue = xe_exec_queue_create(src_fb->fd, vm, &inst, 0);
-	xe_ctx = intel_ctx_xe(src_fb->fd, vm, exec_queue, 0, 0, 0);
-	mem_region = vram_if_possible(src_fb->fd, 0);
-
-	ahnd = intel_allocator_open_full(src_fb->fd, xe_ctx->vm, 0, 0,
-						INTEL_ALLOCATOR_SIMPLE,
-						ALLOC_STRATEGY_LOW_TO_HIGH, 0);
-
-	bb_size = ALIGN(bb_size + xe_cs_prefetch_size(src_fb->fd),
-			xe_get_default_alignment(src_fb->fd));
-	xe_bb = xe_bo_create(src_fb->fd, 0, bb_size,
-			     vram_if_possible(dst_fb->fd, 0), 0);
-
-	for (int i = 0; i < dst_fb->num_planes; i++) {
-		src = blt_fb_init(src_fb, i, mem_region, intel_get_pat_idx_uc(src_fb->fd));
-		dst = blt_fb_init(dst_fb, i, mem_region, intel_get_pat_idx_wt(dst_fb->fd));
-
-		blt_copy_init(src_fb->fd, &blt);
-		blt.color_depth = blt_get_bpp(src_fb, i);
-		blt_set_copy_object(&blt.src, src);
-		blt_set_copy_object(&blt.dst, dst);
-
-		blt_set_object_ext(&ext.src,
-				blt_compression_format(&blt, src_fb, i),
-				src_fb->plane_width[i], src_fb->plane_height[i],
-				SURFACE_TYPE_2D);
-
-		blt_set_object_ext(&ext.dst,
-				blt_compression_format(&blt, dst_fb, i),
-				dst_fb->plane_width[i], dst_fb->plane_height[i],
-				SURFACE_TYPE_2D);
-
-		pext = &ext;
-
-		blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
-
-		blt_block_copy(src_fb->fd, xe_ctx, NULL, ahnd, &blt, pext);
-
-		blt_destroy_object(src_fb->fd, src);
-		blt_destroy_object(dst_fb->fd, dst);
-	}
-
-	put_ahnd(ahnd);
-	gem_close(dst_fb->fd, xe_bb);
-	xe_exec_queue_destroy(dst_fb->fd, exec_queue);
-	xe_vm_destroy(dst_fb->fd, vm);
-	free(xe_ctx);
-
-	access_flat_ccs_surface(fb, true);
-}
-
 static struct igt_fb *get_fb(data_t *data, u64 modifier, double r, double g,
-			     double b, int width, int height, u32 format,
-			     int *goodfb)
+			     double b, int width, int height, u32 format)
 {
 	for (int i = 0; i < data->fb_list_length; i++) {
 		if (data->fb_list[i].width == width &&
@@ -769,12 +617,8 @@ static struct igt_fb *get_fb(data_t *data, u64 modifier, double r, double g,
 		    data->fb_list[i].modifier == modifier &&
 		    data->fb_list[i].format == format &&
 		    data->fb_list[i].r == r && data->fb_list[i].g == g &&
-		    data->fb_list[i].b == b) {
-			if (goodfb)
-				*goodfb = true;
-
+		    data->fb_list[i].b == b)
 			return &data->fb_list[i].fb;
-		}
 	}
 
 	data->fb_list = realloc(data->fb_list, sizeof(*data->fb_list) *
@@ -787,7 +631,30 @@ static struct igt_fb *get_fb(data_t *data, u64 modifier, double r, double g,
 	data->fb_list[data->fb_list_length].modifier = modifier;
 	data->fb_list[data->fb_list_length].format = format;
 
-	if (r + g + b == 0)
+	if (modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
+	    modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
+		struct igt_fb *temp_fb, *fb;
+		/* copy xe2 framebuffer to compresssed memory
+		 */
+
+		igt_create_fb(data->drm_fd, width, height, format, modifier,
+			      &data->fb_list[data->fb_list_length++].fb);
+
+		/* temp fb non compressed linear fb */
+		temp_fb = get_fb(data, DRM_FORMAT_MOD_NONE, r, g, b,
+				 width, height, data->format);
+
+		/* because of possible realloc happening get 'current' fb
+		 * back from the list
+		 */
+		fb = get_fb(data, modifier, r, g, b, width, height,
+			    data->format);
+
+		igt_xe2_blit_with_dst_pat(fb, temp_fb, intel_get_pat_idx_wt(fb->fd));
+		access_flat_ccs_surface(fb, true);
+		return fb;
+
+	} else if (r + g + b == 0)
 		igt_create_pattern_fb(data->drm_fd, width, height, format,
 				      modifier,
 				      &data->fb_list[data->fb_list_length].fb);
@@ -809,7 +676,6 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	bool do_fast_clear = igt_fb_is_gen12_rc_ccs_cc_modifier(data->ccs_modifier);
 	bool do_solid_fill = do_fast_clear || data->plane;
 	int c = !!data->plane;
-	int goodfb = false;
 	const float cc_color[4] = {colors[!!data->plane].r,
 				   colors[!!data->plane].g,
 				   colors[!!data->plane].b,
@@ -829,14 +695,16 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 		create_fb_prepare_add(data->drm_fd, width, height,
 				data->format, modifier,
 				fb, &f);
+		do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
+		fb->fb_id = f.fb_id;
 	} else {
 		if (do_solid_fill)
 			temp_fb = get_fb(data, modifier,
 					colors[c].r, colors[c].g, colors[c].b,
-					width, height, data->format, &goodfb);
+					width, height, data->format);
 		else
 			temp_fb = get_fb(data, modifier, 0.0, 0.0, 0.0,
-					width, height, data->format, &goodfb);
+					width, height, data->format);
 
 		*fb = *temp_fb;
 		addfb_init(fb, &f);
@@ -848,32 +716,12 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	} else {
 		if (do_fast_clear && (fb_flags & FB_COMPRESSED)) {
 			fast_clear_fb(data->drm_fd, fb, cc_color);
-		} else if (!goodfb &&
-			  (modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
-			   modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS)) {
-			if (do_solid_fill)
-				temp_fb = get_fb(data, I915_FORMAT_MOD_4_TILED,
-						 colors[c].r,
-						 colors[c].g,
-						 colors[c].b,
-						 width, height,
-						 data->format, NULL);
-			else
-				temp_fb = get_fb(data, I915_FORMAT_MOD_4_TILED,
-						 0.0, 0.0, 0.0,
-						 width, height,
-						 data->format, NULL);
-
-			xe2_ccs_blit(data, fb, temp_fb);
 		}
 	}
 
-	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
-
 	if (check_ccs_planes)
 		check_all_ccs_planes(data->drm_fd, fb, cc_color, !(data->flags & TEST_RANDOM));
 
-	fb->fb_id = f.fb_id;
 }
 
 static igt_plane_t *first_sdr_plane(data_t *data)
-- 
2.45.2

