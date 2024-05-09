Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9709DC25B74
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 19:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116DB10F0A4;
	Thu,  9 May 2024 19:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="WcbUly8Y";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F7210F0A4
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 19:15:40 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1ed41eb3382so8762005ad.0
 for <igt-dev@lists.freedesktop.org>; Thu, 09 May 2024 12:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715282140; x=1715886940;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61P72unsTE77IQzwoP1MSNHlX1Nx8C/5W/GiC96IjA0=;
 b=WcbUly8YqdxdaiDZNqA7jpQ2B0dYCsjq6Y1uclSDDlZljKY9M+DT7cB1gSzd0HARRd
 Z5OJBRPEE1qR3YAAau84tmCH87rwyrWmNKH5xGhgXBG06/fX8qiTLx60zi39QMzbC/53
 oBBNO++1N2EXuIgGDwOPK129+wrqXa3givJVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715282140; x=1715886940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61P72unsTE77IQzwoP1MSNHlX1Nx8C/5W/GiC96IjA0=;
 b=YQBL6jFejewSfpSiLmApxR1DSvW79yHqmVOhEN26MdCNyot3Qa9Uq7r2ZGQV0KUQQ4
 6KG/t4teF0cTmR6j+Iyn+rupjB5hfzWa5MZUU6adnZjG+cvCkF7FZEATmtCCxLC1jQfX
 iiVlY7V/NnduP8TwTZYDVZwp0DnrgsVSp863KTYf6gGvcHCf2X+4gAykV836MCp6ZYLQ
 nwaqXFW12qa0+LuRhlaZIUWIX5Pk9acwLBLRbVGIygaLfaItq71d8jSzxxl0sa2/huPp
 GuUJ2riBdsTsNrZkhgNFY3hcON+ZCx83w9nPL9//7CBvoG8FAXFAIHm9XUho8N14gFy/
 KD1w==
X-Gm-Message-State: AOJu0Yzpu2raoRbqL0e8YviP9QQlAERbyjBSJm4kusFxVkPwl5kA7RME
 gTDIESorjTzWdIhplMQ3yJIjyH9gNrhRGbagdZVilKXuFrKX5s8nNMJ+xa/FHpTysJ9Job1GeRU
 0DNKnmLLA4OvyQMb9FKoYDVhda9fQHa80Eini+cXpkhgj6aAtcduBatxads73WW4ARP6rJZdK24
 6zTiZXDbC/0nP/J41NYjhoGOiyBSli3yolXXu1XFL4SzMusOg=
X-Google-Smtp-Source: AGHT+IGLjzK7sxTlkCPc4E2lI72DvJbrWhRf0jlNVUcaEU40czrJXGGij6tONt5L0dnMmNtznKv0yg==
X-Received: by 2002:a17:902:e98b:b0:1e6:68d0:d6c9 with SMTP id
 d9443c01a7336-1ef43e27ab7mr6134765ad.40.1715282140020; 
 Thu, 09 May 2024 12:15:40 -0700 (PDT)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf2f70csm17827395ad.168.2024.05.09.12.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 12:15:39 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t 2/3] lib/vmwgfx: Allow using any buffer handle as a
 surface backing
Date: Thu,  9 May 2024 15:15:28 -0400
Message-Id: <20240509191529.3783796-3-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509191529.3783796-1-zack.rusin@broadcom.com>
References: <20240509191529.3783796-1-zack.rusin@broadcom.com>
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

Allow using any buffer handle as a surface backing to allow testing
prime/dma-buf imports. This will allow addition of vmwgfx specific
drm prime tests.

The code always expected a mob structure created via the explicit
alloc dmabuf ioctl which made using buffers created via dumb_buffer
drm interface impossible.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 lib/igt_vmwgfx.c                | 33 ++++++++++++++++-----------------
 lib/igt_vmwgfx.h                | 12 ++++++++----
 tests/vmwgfx/vmw_mob_stress.c   |  5 ++++-
 tests/vmwgfx/vmw_ref_count.c    |  6 +++---
 tests/vmwgfx/vmw_surface_copy.c |  8 ++++----
 tests/vmwgfx/vmw_tri.c          | 12 ++++++++----
 6 files changed, 43 insertions(+), 33 deletions(-)

diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
index 12b07b4a8..d2f699575 100644
--- a/lib/igt_vmwgfx.c
+++ b/lib/igt_vmwgfx.c
@@ -427,7 +427,7 @@ struct vmw_surface *vmw_ioctl_buffer_create(int fd, SVGA3dSurfaceAllFlags flags,
 	SVGA3dSize surface_size = { .width = size, .height = 1, .depth = 1 };
 
 	return vmw_create_surface_simple(fd, flags, SVGA3D_BUFFER, surface_size,
-					 mob);
+					 mob->handle);
 }
 
 /**
@@ -454,7 +454,7 @@ struct vmw_surface *vmw_ioctl_create_surface_full(
 	uint32 multisample_count, SVGA3dMSPattern multisample_pattern,
 	SVGA3dMSQualityLevel quality_level, SVGA3dTextureFilter autogen_filter,
 	uint32 num_mip_levels, uint32 array_size, SVGA3dSize size,
-	struct vmw_mob *mob, enum drm_vmw_surface_flags surface_flags)
+	uint32 buffer_handle, enum drm_vmw_surface_flags surface_flags)
 {
 	struct vmw_surface *surface;
 	int32 ret;
@@ -470,10 +470,8 @@ struct vmw_surface *vmw_ioctl_create_surface_full(
 	arg.req.base.array_size = array_size;
 	arg.req.base.autogen_filter = autogen_filter;
 	arg.req.base.drm_surface_flags |= surface_flags;
-	if (mob) {
-		arg.req.base.buffer_handle = mob->handle;
-	} else {
-		arg.req.base.buffer_handle = SVGA3D_INVALID_ID;
+	arg.req.base.buffer_handle = buffer_handle;
+	if (buffer_handle != SVGA3D_INVALID_ID) {
 		arg.req.base.drm_surface_flags |=
 			drm_vmw_surface_flag_create_buffer;
 	}
@@ -499,7 +497,6 @@ struct vmw_surface *vmw_ioctl_create_surface_full(
 	}
 
 	surface->base = arg.rep;
-	surface->mob = mob;
 	return surface;
 
 out_err1:
@@ -511,7 +508,7 @@ struct vmw_surface *vmw_create_surface_simple(int fd,
 					      SVGA3dSurfaceAllFlags flags,
 					      SVGA3dSurfaceFormat format,
 					      SVGA3dSize size,
-					      struct vmw_mob *mob)
+					      uint32 buffer_handle)
 {
 	/*
 	 * TODO:
@@ -531,7 +528,7 @@ struct vmw_surface *vmw_create_surface_simple(int fd,
 					     multisample_count,
 					     multisample_pattern, quality_level,
 					     SVGA3D_TEX_FILTER_NONE, 1,
-					     array_size, size, mob, 0);
+					     array_size, size, buffer_handle, 0);
 }
 
 /**
@@ -921,14 +918,14 @@ void vmw_create_default_objects(struct vmw_svga_device *device,
 		device->drm_fd,
 		SVGA3D_SURFACE_HINT_TEXTURE | SVGA3D_SURFACE_HINT_RENDERTARGET |
 			SVGA3D_SURFACE_BIND_RENDER_TARGET,
-		SVGA3D_R8G8B8A8_UNORM, *rt_size, NULL);
+		SVGA3D_R8G8B8A8_UNORM, *rt_size, SVGA3D_INVALID_ID);
 
 	objects->depth_rt = vmw_create_surface_simple(
 		device->drm_fd,
 		SVGA3D_SURFACE_HINT_DEPTHSTENCIL |
 			SVGA3D_SURFACE_HINT_RENDERTARGET |
 			SVGA3D_SURFACE_BIND_DEPTH_STENCIL,
-		SVGA3D_R24G8_TYPELESS, *rt_size, NULL);
+		SVGA3D_R24G8_TYPELESS, *rt_size, SVGA3D_INVALID_ID);
 
 	rtv_desc.tex.arraySize = 1;
 	rtv_desc.tex.firstArraySlice = 0;
@@ -1225,7 +1222,8 @@ void vmw_cmd_surface_copy(struct vmw_execbuf *cmd_buf, SVGA3dSurfaceImageId src,
 }
 
 uint8 *vmw_triangle_draw(struct vmw_svga_device *device, int32 cid,
-			 struct vmw_default_objects *objects, bool do_sync)
+			 struct vmw_default_objects *objects,
+			 uint32_t draw_flags)
 {
 	struct vmw_execbuf *cmd_buf;
 	struct drm_vmw_fence_rep cmd_fence;
@@ -1234,7 +1232,7 @@ uint8 *vmw_triangle_draw(struct vmw_svga_device *device, int32 cid,
 	SVGA3dVertexBuffer vb_binding;
 	SVGA3dRGBAFloat clear_color;
 	void *vertex_data;
-	uint8 *rendered_img;
+	uint8 *rendered_img = NULL;
 	struct vmw_vertex vertices[3] = {
 		{ 0.0, 0.75, 0.5, 1.0, 0.0, 1.0, 0.0, 1.0 },
 		{ 0.75, -0.75, 0.5, 1.0, 1.0, 0.0, 0.0, 1.0 },
@@ -1281,19 +1279,20 @@ uint8 *vmw_triangle_draw(struct vmw_svga_device *device, int32 cid,
 
 	/* Draw */
 	vmw_cmd_draw(cmd_buf, 3, 0);
-	vmw_cmd_draw(cmd_buf, 3, 0);
 
 	/* Readback */
-	vmw_cmd_readback_gb_surface(cmd_buf, objects->color_rt->base.handle);
+	if (draw_flags & vmw_triangle_draw_flags_readback)
+		vmw_cmd_readback_gb_surface(cmd_buf, objects->color_rt->base.handle);
 
 	/* Submit commands */
 	vmw_execbuf_submit(cmd_buf, &cmd_fence);
-	if (do_sync)
+	if (draw_flags & vmw_triangle_draw_flags_sync)
 		vmw_ioctl_fence_finish(device->drm_fd, &cmd_fence);
 	vmw_execbuf_destroy(cmd_buf);
 
 	/* Read framebuffer into system mem and save */
-	rendered_img = vmw_readback_surface(device->drm_fd, objects->color_rt);
+	if (draw_flags & vmw_triangle_draw_flags_readback)
+		rendered_img = vmw_readback_surface(device->drm_fd, objects->color_rt);
 
 	vmw_ioctl_surface_unref(device->drm_fd, vertex_buffer);
 	vmw_ioctl_mob_close_handle(device->drm_fd, vertex_mob);
diff --git a/lib/igt_vmwgfx.h b/lib/igt_vmwgfx.h
index c8ed43bac..961aac389 100644
--- a/lib/igt_vmwgfx.h
+++ b/lib/igt_vmwgfx.h
@@ -115,7 +115,6 @@ struct vmw_mob {
 struct vmw_surface {
 	struct drm_vmw_gb_surface_create_rep base;
 	struct drm_vmw_gb_surface_create_ext_req params;
-	struct vmw_mob *mob;
 };
 
 struct vmw_vertex {
@@ -194,13 +193,13 @@ struct vmw_surface *vmw_ioctl_create_surface_full(
 	uint32 multisample_count, SVGA3dMSPattern multisample_pattern,
 	SVGA3dMSQualityLevel quality_level, SVGA3dTextureFilter autogen_filter,
 	uint32 num_mip_levels, uint32 array_size, SVGA3dSize size,
-	struct vmw_mob *mob, enum drm_vmw_surface_flags surface_flags);
+	uint32 buffer_handle, enum drm_vmw_surface_flags surface_flags);
 
 struct vmw_surface *vmw_create_surface_simple(int fd,
 					      SVGA3dSurfaceAllFlags flags,
 					      SVGA3dSurfaceFormat format,
 					      SVGA3dSize size,
-					      struct vmw_mob *mob);
+					      uint32 buffer_handle);
 
 struct vmw_execbuf *vmw_execbuf_create(int drm_fd, int32_t cid);
 void vmw_execbuf_set_cid(struct vmw_execbuf *execbuf, int32_t cid);
@@ -261,8 +260,13 @@ void vmw_cmd_surface_copy(struct vmw_execbuf *cmd_buf, SVGA3dSurfaceImageId src,
 			  SVGA3dSurfaceImageId dest, const SVGA3dCopyBox *boxes,
 			  uint32 num_boxes);
 
+enum vmw_triangle_draw_flags {
+	vmw_triangle_draw_flags_none = 0,
+	vmw_triangle_draw_flags_sync = 1 << 0,
+	vmw_triangle_draw_flags_readback = 1 << 1,
+};
 uint8 *vmw_triangle_draw(struct vmw_svga_device *device, int32 cid,
-			 struct vmw_default_objects *objects, bool do_sync);
+			 struct vmw_default_objects *objects, uint32_t draw_flags);
 
 void vmw_triangle_assert_values(uint8 *rendered_img,
 				struct vmw_surface *color_rt);
diff --git a/tests/vmwgfx/vmw_mob_stress.c b/tests/vmwgfx/vmw_mob_stress.c
index 4af23d6f7..2e6a9422c 100644
--- a/tests/vmwgfx/vmw_mob_stress.c
+++ b/tests/vmwgfx/vmw_mob_stress.c
@@ -35,7 +35,10 @@ static void test_triangle_render(struct vmw_svga_device *device, int32 cid)
 
 	vmw_create_default_objects(device, cid, &objects,
 				   &vmw_default_rect_size);
-	rendered_tri = vmw_triangle_draw(device, cid, &objects, true);
+	rendered_tri =
+		vmw_triangle_draw(device, cid, &objects,
+				  vmw_triangle_draw_flags_sync |
+				  vmw_triangle_draw_flags_readback);
 	vmw_triangle_assert_values(rendered_tri, objects.color_rt);
 
 	free(rendered_tri);
diff --git a/tests/vmwgfx/vmw_ref_count.c b/tests/vmwgfx/vmw_ref_count.c
index 92d49dbd0..c765f2e70 100644
--- a/tests/vmwgfx/vmw_ref_count.c
+++ b/tests/vmwgfx/vmw_ref_count.c
@@ -72,7 +72,7 @@ create_and_write_shareable_surface(int32 fd, SVGA3dSize surface_size)
 	surface = vmw_ioctl_create_surface_full(
 		fd, SVGA3D_SURFACE_HINT_RENDERTARGET, SVGA3D_BUFFER, 0,
 		SVGA3D_MS_PATTERN_NONE, SVGA3D_MS_QUALITY_NONE,
-		SVGA3D_TEX_FILTER_NONE, 1, 1, surface_size, NULL,
+		SVGA3D_TEX_FILTER_NONE, 1, 1, surface_size, SVGA3D_INVALID_ID,
 		drm_vmw_surface_flag_shareable);
 
 	mob.handle = surface->base.buffer_handle;
@@ -125,7 +125,7 @@ igt_main
 		surface = vmw_ioctl_create_surface_full(
 			fd1, SVGA3D_SURFACE_HINT_RENDERTARGET, SVGA3D_BUFFER, 0,
 			SVGA3D_MS_PATTERN_NONE, SVGA3D_MS_QUALITY_NONE,
-			SVGA3D_TEX_FILTER_NONE, 1, 1, surface_size, mob,
+			SVGA3D_TEX_FILTER_NONE, 1, 1, surface_size, mob->handle,
 			drm_vmw_surface_flag_shareable);
 
 		write_to_mob(fd1, mob);
@@ -274,7 +274,7 @@ igt_main
 		surface = vmw_ioctl_create_surface_full(
 			fd1, SVGA3D_SURFACE_HINT_RENDERTARGET, SVGA3D_BUFFER, 0,
 			SVGA3D_MS_PATTERN_NONE, SVGA3D_MS_QUALITY_NONE,
-			SVGA3D_TEX_FILTER_NONE, 1, 1, surface_size, NULL,
+			SVGA3D_TEX_FILTER_NONE, 1, 1, surface_size, SVGA3D_INVALID_ID,
 			drm_vmw_surface_flag_shareable);
 
 		/* Shouldn't crash on multiple invocations */
diff --git a/tests/vmwgfx/vmw_surface_copy.c b/tests/vmwgfx/vmw_surface_copy.c
index 57e90334f..471de54aa 100644
--- a/tests/vmwgfx/vmw_surface_copy.c
+++ b/tests/vmwgfx/vmw_surface_copy.c
@@ -120,9 +120,9 @@ static void test_invalid_copies(int fd, int32 cid)
 		vmw_is_format_supported(fd, SVGA3D_DEVCAP_SURFACEFMT_A8R8G8B8));
 
 	s1 = vmw_create_surface_simple(fd, 0, SVGA3D_A8R8G8B8, surface_size,
-				       NULL);
+				       SVGA3D_INVALID_ID);
 	s2 = vmw_create_surface_simple(fd, 0, SVGA3D_A8R8G8B8, surface_size,
-				       NULL);
+				       SVGA3D_INVALID_ID);
 	cmd_buf = vmw_execbuf_create(fd, cid);
 
 	box.x = 0;
@@ -271,8 +271,8 @@ static void test_invalid_copies_3d(int fd, int32 cid)
 	igt_require(vmw_is_format_supported(fd, SVGA3D_DEVCAP_DXFMT_Z_D32));
 
 	s1 = vmw_create_surface_simple(fd, 0, SVGA3D_A8R8G8B8, surface_size,
-				       NULL);
-	s2 = vmw_create_surface_simple(fd, 0, SVGA3D_Z_D32, surface_size, NULL);
+				       SVGA3D_INVALID_ID);
+	s2 = vmw_create_surface_simple(fd, 0, SVGA3D_Z_D32, surface_size, SVGA3D_INVALID_ID);
 	cmd_buf = vmw_execbuf_create(fd, cid);
 
 	box.x = 0;
diff --git a/tests/vmwgfx/vmw_tri.c b/tests/vmwgfx/vmw_tri.c
index f5a59229c..61c4d5df8 100644
--- a/tests/vmwgfx/vmw_tri.c
+++ b/tests/vmwgfx/vmw_tri.c
@@ -36,7 +36,10 @@ static void draw_triangle(struct vmw_svga_device *device, int32 cid)
 
 	vmw_create_default_objects(device, cid, &objects,
 				   &vmw_default_rect_size);
-	rendered_img = vmw_triangle_draw(device, cid, &objects, true);
+	rendered_img =
+		vmw_triangle_draw(device, cid, &objects,
+				  vmw_triangle_draw_flags_sync |
+				  vmw_triangle_draw_flags_readback);
 
 	save_status = vmw_save_data_as_png(objects.color_rt, rendered_img,
 					   "vmw_tri.png");
@@ -65,7 +68,7 @@ static void replace_with_coherent_rt(struct vmw_svga_device *device,
 			SVGA3D_SURFACE_BIND_RENDER_TARGET,
 		SVGA3D_R8G8B8A8_UNORM, 0, SVGA3D_MS_PATTERN_NONE,
 		SVGA3D_MS_QUALITY_NONE, SVGA3D_TEX_FILTER_NONE, 1, 1, *rt_size,
-		NULL, drm_vmw_surface_flag_coherent);
+		SVGA3D_INVALID_ID, drm_vmw_surface_flag_coherent);
 
 	objects->depth_rt = vmw_ioctl_create_surface_full(
 		device->drm_fd,
@@ -74,7 +77,7 @@ static void replace_with_coherent_rt(struct vmw_svga_device *device,
 			SVGA3D_SURFACE_BIND_DEPTH_STENCIL,
 		SVGA3D_R24G8_TYPELESS, 0, SVGA3D_MS_PATTERN_NONE,
 		SVGA3D_MS_QUALITY_NONE, SVGA3D_TEX_FILTER_NONE, 1, 1, *rt_size,
-		NULL, drm_vmw_surface_flag_coherent);
+		SVGA3D_INVALID_ID, drm_vmw_surface_flag_coherent);
 
 	cmd_buf = vmw_execbuf_create(device->drm_fd, context_id);
 
@@ -160,7 +163,8 @@ static void draw_triangle_on_coherent_rt(struct vmw_svga_device *device,
 	default_ds_view_id = objects.ds_view_id;
 	replace_with_coherent_rt(device, cid, &objects, &vmw_default_rect_size);
 
-	rendered_img = vmw_triangle_draw(device, cid, &objects, false);
+	rendered_img = vmw_triangle_draw(device, cid, &objects,
+					 vmw_triangle_draw_flags_readback);
 
 	vmw_triangle_assert_values(rendered_img, objects.color_rt);
 
-- 
2.40.1

