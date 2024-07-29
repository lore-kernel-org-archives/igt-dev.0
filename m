Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C00FC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 04:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4BB10E2F0;
	Mon, 29 Jul 2024 04:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="b5SpTe2s";
	dkim-atps=neutral
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC5A10E2EB
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 04:38:58 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-70d316f0060so1698420b3a.1
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Jul 2024 21:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722227937; x=1722832737;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fb2IE54tl5sXlokujGH95ucIePVoqobDwe+h78k5F9s=;
 b=b5SpTe2sfCqXAai1NC2hiPDCqN0DORT6N+o66zPFVJTCviBop2CvKY3NmyrWYr/Lij
 wo5kymXKbrRTWHAprmPHIngoJVPCZFSozUPlvRKMJHno4goHjkyTKRXElqmS97TTAfiR
 IK+llQFHhHYoObTtk7PPRiu7dlU8f82arCWBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722227937; x=1722832737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fb2IE54tl5sXlokujGH95ucIePVoqobDwe+h78k5F9s=;
 b=bGeckCZKRtHyla9+NpAzHwGV3gigR6hs1QGGzF+I5ZZyLvh/xXDJ2z+CLjNbZ6W4on
 NnVp9XplLgXb/Z0YQbWQbjb5qs201xwYnbI7Hvkf1q2gn2Zf08boiPbGMXyXQGAZ5WuY
 P2lPdqjnmqFcblulLlPEvNsFivVQtZU0Y0zwAWacxpKgH0vx6Wxs17tYUoS3RLaoD2PX
 sDxY/pCJgmakObrVBMkuReXBg/PE75LOnD77GPc8FSYlSGz7BMDjN+0WtUhTj0sZ4h+e
 XQn/R7qa8gHD5eC+lAuFgain9FgF0h5orHCS20+TM1+I89A6kWU18lANU77q7iMvPQ0K
 DPiw==
X-Gm-Message-State: AOJu0Yy1s+6uWqLnVfclWdT2Hrp0r4CR7RLCGnGk9zVGEeqFOkQUDl6m
 5Z3KB8ToWLbJ/AhY4VHNBNDJQmS+eHmyGHTCZWYSrbLF/qFcVWtcKhpElROjk009E4oQD+gnBui
 PdOH1a3Y93s4tffMbm3o4aGtX89HPLTmCA+p3XWco7FWr+Ox0Cbh7io4cCBYhu6h6velmV22OGf
 cWeJOotGJCMcOyJiSfdkL6T55IGI1AeHP1Uy8jqh8YRbl4ZHc=
X-Google-Smtp-Source: AGHT+IGLDA92elanFc9xv5VScYDO7jwnsLoWIQ2IWtkJqpoTIwvecMtZW4gOv5+/+iA8ecxdj661+Q==
X-Received: by 2002:a05:6a21:6f83:b0:1c4:d14f:248f with SMTP id
 adf61e73a8af0-1c4d14f27e9mr1330853637.13.1722227937198; 
 Sun, 28 Jul 2024 21:38:57 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead88c19bsm5963392b3a.183.2024.07.28.21.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 21:38:56 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, kamil.konieczny@linux.intel.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t v4 4/4] tests/vmwgfx: Fix and extend the reference
 counting test
Date: Mon, 29 Jul 2024 00:37:56 -0400
Message-ID: <20240729043846.1892343-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729043846.1892343-1-zack.rusin@broadcom.com>
References: <20240729043846.1892343-1-zack.rusin@broadcom.com>
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

Fix a few issues related to buffer management in the reference counting
test. Extend it to include various prime related reference counting
issues.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 lib/igt_vmwgfx.c             |  45 +++-----
 lib/igt_vmwgfx.h             |  30 +-----
 tests/vmwgfx/vmw_ref_count.c | 204 +++++++++++++++++++++++++++++------
 3 files changed, 189 insertions(+), 90 deletions(-)

diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
index d2f699575..b62d7a326 100644
--- a/lib/igt_vmwgfx.c
+++ b/lib/igt_vmwgfx.c
@@ -1,28 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
-/**********************************************************
- * Copyright 2021-2023 VMware, Inc.
- *
- * Permission is hereby granted, free of charge, to any person
- * obtaining a copy of this software and associated documentation
- * files (the "Software"), to deal in the Software without
- * restriction, including without limitation the rights to use, copy,
- * modify, merge, publish, distribute, sublicense, and/or sell copies
- * of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be
- * included in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- *
- **********************************************************/
+/*
+ * Copyright (c) 2021-2024 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ */
 
 #include "igt_vmwgfx.h"
 
@@ -154,6 +134,7 @@ bool vmw_save_data_as_png(struct vmw_surface *surface, void *data,
 	/* Can separate this into another function as it grows */
 	switch (surface->params.base.format) {
 	case SVGA3D_R8G8B8A8_UNORM:
+	case SVGA3D_B8G8R8X8_UNORM:
 		format = CAIRO_FORMAT_ARGB32;
 		break;
 	default:
@@ -345,11 +326,15 @@ void vmw_ioctl_mob_close_handle(int fd, struct vmw_mob *mob)
 	free(mob);
 }
 
-struct vmw_surface vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type)
+struct vmw_surface *vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type)
 {
 	int ret;
-	union drm_vmw_gb_surface_reference_ext_arg arg;
-	struct vmw_surface surface;
+	union drm_vmw_gb_surface_reference_ext_arg arg = {0};
+	struct vmw_surface *surface;
+
+	surface = calloc(1, sizeof(struct vmw_surface));
+	if (!surface)
+		return NULL;
 
 	arg.req.handle_type = handle_type;
 	arg.req.sid = sid;
@@ -359,8 +344,8 @@ struct vmw_surface vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type)
 	if (ret != 0)
 		fprintf(stderr, "%s Failed\n", __func__);
 
-	surface.base = arg.rep.crep;
-	surface.params = arg.rep.creq;
+	surface->base = arg.rep.crep;
+	surface->params = arg.rep.creq;
 	return surface;
 }
 
@@ -471,7 +456,7 @@ struct vmw_surface *vmw_ioctl_create_surface_full(
 	arg.req.base.autogen_filter = autogen_filter;
 	arg.req.base.drm_surface_flags |= surface_flags;
 	arg.req.base.buffer_handle = buffer_handle;
-	if (buffer_handle != SVGA3D_INVALID_ID) {
+	if (buffer_handle == SVGA3D_INVALID_ID) {
 		arg.req.base.drm_surface_flags |=
 			drm_vmw_surface_flag_create_buffer;
 	}
diff --git a/lib/igt_vmwgfx.h b/lib/igt_vmwgfx.h
index bf037b74d..a630d201d 100644
--- a/lib/igt_vmwgfx.h
+++ b/lib/igt_vmwgfx.h
@@ -1,28 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
-/**********************************************************
- * Copyright 2021-2023 VMware, Inc.
- *
- * Permission is hereby granted, free of charge, to any person
- * obtaining a copy of this software and associated documentation
- * files (the "Software"), to deal in the Software without
- * restriction, including without limitation the rights to use, copy,
- * modify, merge, publish, distribute, sublicense, and/or sell copies
- * of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be
- * included in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- *
- **********************************************************/
+/*
+ * Copyright (c) 2021-2024 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ */
 
 #ifndef IGT_VMWGFX_H
 #define IGT_VMWGFX_H
@@ -186,7 +166,7 @@ struct vmw_surface *vmw_ioctl_buffer_create(int fd, SVGA3dSurfaceAllFlags flags,
 					    uint32_t size, struct vmw_mob *mob);
 void vmw_ioctl_surface_unref(int fd, struct vmw_surface *buffer);
 
-struct vmw_surface vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type);
+struct vmw_surface *vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type);
 
 struct vmw_surface *vmw_ioctl_create_surface_full(
 	int fd, SVGA3dSurfaceAllFlags flags, SVGA3dSurfaceFormat format,
diff --git a/tests/vmwgfx/vmw_ref_count.c b/tests/vmwgfx/vmw_ref_count.c
index c765f2e70..c74940e02 100644
--- a/tests/vmwgfx/vmw_ref_count.c
+++ b/tests/vmwgfx/vmw_ref_count.c
@@ -1,33 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
-/**********************************************************
- * Copyright 2021-2023 VMware, Inc.
- *
- * Permission is hereby granted, free of charge, to any person
- * obtaining a copy of this software and associated documentation
- * files (the "Software"), to deal in the Software without
- * restriction, including without limitation the rights to use, copy,
- * modify, merge, publish, distribute, sublicense, and/or sell copies
- * of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be
- * included in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- *
- **********************************************************/
+/*
+ * Copyright (c) 2021-2024 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ */
 
 #include "igt_vmwgfx.h"
 
 IGT_TEST_DESCRIPTION("Perform tests related to vmwgfx's ref_count codepaths.");
 
+#define NUM_SURFACES 10
 static uint32 data[10] = { 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };
 
 static void write_to_mob(int fd, struct vmw_mob *mob)
@@ -35,6 +16,7 @@ static void write_to_mob(int fd, struct vmw_mob *mob)
 	void *write_data;
 
 	write_data = vmw_ioctl_mob_map(fd, mob);
+	igt_assert(write_data);
 	memcpy(write_data, data, sizeof(data));
 	vmw_ioctl_mob_unmap(mob);
 }
@@ -73,7 +55,7 @@ create_and_write_shareable_surface(int32 fd, SVGA3dSize surface_size)
 		fd, SVGA3D_SURFACE_HINT_RENDERTARGET, SVGA3D_BUFFER, 0,
 		SVGA3D_MS_PATTERN_NONE, SVGA3D_MS_QUALITY_NONE,
 		SVGA3D_TEX_FILTER_NONE, 1, 1, surface_size, SVGA3D_INVALID_ID,
-		drm_vmw_surface_flag_shareable);
+		drm_vmw_surface_flag_shareable | drm_vmw_surface_flag_create_buffer);
 
 	mob.handle = surface->base.buffer_handle;
 	mob.map_handle = surface->base.buffer_map_handle;
@@ -86,17 +68,22 @@ create_and_write_shareable_surface(int32 fd, SVGA3dSize surface_size)
 
 static bool ref_surface_and_check_contents(int32 fd, uint32 surface_handle)
 {
-	struct vmw_surface surface;
+	struct vmw_surface *surface;
 	struct vmw_mob mob = { 0 };
+	bool data_valid;
 
 	surface = vmw_ioctl_surface_ref(fd, surface_handle,
 					DRM_VMW_HANDLE_LEGACY);
 
-	mob.handle = surface.base.handle;
-	mob.size = surface.base.buffer_size;
-	mob.map_handle = surface.base.buffer_map_handle;
+	mob.handle = surface->base.handle;
+	mob.size = surface->base.buffer_size;
+	mob.map_handle = surface->base.buffer_map_handle;
+
+	data_valid = verify_mob_data(fd, &mob);
 
-	return verify_mob_data(fd, &mob);
+	vmw_ioctl_surface_unref(fd, surface);
+
+	return data_valid;
 }
 
 igt_main
@@ -293,7 +280,7 @@ igt_main
 	igt_subtest("surface_alloc_ref_unref")
 	{
 		struct vmw_surface *surface;
-		struct vmw_surface ref_surface;
+		struct vmw_surface *ref_surface;
 		struct vmw_mob readback_mob = { 0 };
 
 		surface = create_and_write_shareable_surface(fd1, surface_size);
@@ -303,15 +290,162 @@ igt_main
 
 		vmw_ioctl_surface_unref(fd1, surface);
 
-		readback_mob.handle = ref_surface.base.handle;
-		readback_mob.size = ref_surface.base.buffer_size;
-		readback_mob.map_handle = ref_surface.base.buffer_map_handle;
+		readback_mob.handle = ref_surface->base.handle;
+		readback_mob.size = ref_surface->base.buffer_size;
+		readback_mob.map_handle = ref_surface->base.buffer_map_handle;
 
 		igt_assert(verify_mob_data(fd1, &readback_mob));
+
+		vmw_ioctl_surface_unref(fd1, ref_surface);
 	}
 
-	igt_fixture
+	igt_describe("Test refing a surface from the buffer handle.");
+	igt_subtest("surface_buffer_ref")
 	{
+		struct vmw_surface *surfaces[NUM_SURFACES] = {0};
+		struct vmw_surface *refs[NUM_SURFACES] = {0};
+		struct vmw_surface *buf_refs[NUM_SURFACES] = {0};
+		int i;
+		SVGA3dSize surf_size;
+
+		for (i = 0; i < NUM_SURFACES; ++i) {
+			surf_size.width = 32 + i * 16;
+			surf_size.height = 32 + i * 16;
+			surf_size.depth = 1;
+
+			surfaces[i] = vmw_create_surface_simple(fd1,
+								SVGA3D_SURFACE_HINT_TEXTURE |
+								SVGA3D_SURFACE_HINT_RENDERTARGET |
+								SVGA3D_SURFACE_BIND_RENDER_TARGET,
+								SVGA3D_R8G8B8A8_UNORM, surf_size,
+								SVGA3D_INVALID_ID);
+			igt_assert(surfaces[i]);
+		}
+
+		for (i = 0; i < NUM_SURFACES; ++i) {
+			int prime_fd = prime_handle_to_fd_for_mmap(fd1,
+								   surfaces[i]->base.handle);
+
+			refs[i] = vmw_ioctl_surface_ref(fd1, prime_fd,
+							DRM_VMW_HANDLE_PRIME);
+			igt_assert_eq(surfaces[i]->base.handle,
+				      refs[i]->base.handle);
+			igt_assert_eq(surfaces[i]->base.backup_size,
+				      refs[i]->base.backup_size);
+			igt_assert_eq(surfaces[i]->base.buffer_size,
+				      refs[i]->base.buffer_size);
+			igt_assert_eq(surfaces[i]->base.buffer_map_handle,
+				      refs[i]->base.buffer_map_handle);
+			igt_assert_eq(surfaces[i]->params.base.format,
+				      refs[i]->params.base.format);
+		}
+
+		for (i = 0; i < NUM_SURFACES; ++i) {
+			int prime_fd = prime_handle_to_fd_for_mmap(fd1,
+								   surfaces[i]->base.buffer_handle);
+
+			buf_refs[i] = vmw_ioctl_surface_ref(fd1, prime_fd,
+							    DRM_VMW_HANDLE_PRIME);
+			igt_assert_eq(surfaces[i]->base.handle,
+				      buf_refs[i]->base.handle);
+			igt_assert_eq(surfaces[i]->base.backup_size,
+				      buf_refs[i]->base.backup_size);
+			igt_assert_eq(surfaces[i]->base.buffer_size,
+				      buf_refs[i]->base.buffer_size);
+			igt_assert_eq(surfaces[i]->base.buffer_map_handle,
+				      buf_refs[i]->base.buffer_map_handle);
+			igt_assert_eq(surfaces[i]->params.base.format,
+				      buf_refs[i]->params.base.format);
+		}
+
+		for (i = 0; i < NUM_SURFACES; ++i) {
+			vmw_ioctl_surface_unref(fd1, buf_refs[i]);
+			vmw_ioctl_surface_unref(fd1, refs[i]);
+			vmw_ioctl_surface_unref(fd1, surfaces[i]);
+		}
+	}
+
+	igt_describe("Test refcounts on prime surfaces.");
+	igt_subtest("surface_prime_refs") {
+		struct vmw_surface *surfaces[NUM_SURFACES] = {0};
+		int prime_fds[NUM_SURFACES] = {0};
+		struct vmw_surface *refs[NUM_SURFACES] = {0};
+		int i;
+		SVGA3dSize surf_size;
+
+		for (i = 0; i < NUM_SURFACES; ++i) {
+			surf_size.width = 32 + i * 16;
+			surf_size.height = 32 + i * 16;
+			surf_size.depth = 1;
+
+			surfaces[i] = vmw_create_surface_simple(fd1,
+								SVGA3D_SURFACE_HINT_TEXTURE |
+								SVGA3D_SURFACE_HINT_RENDERTARGET |
+								SVGA3D_SURFACE_BIND_RENDER_TARGET,
+								SVGA3D_R8G8B8A8_UNORM, surf_size,
+								SVGA3D_INVALID_ID);
+			igt_assert(surfaces[i]);
+		}
+
+		for (i = 0; i < NUM_SURFACES; ++i) {
+			prime_fds[i] = prime_handle_to_fd(fd1,
+							  surfaces[i]->base.handle);
+			igt_assert_neq(prime_fds[i], 0);
+			igt_assert_neq(prime_fds[i], -1);
+			vmw_ioctl_surface_unref(fd1, surfaces[i]);
+		}
+
+		for (i = 0; i < NUM_SURFACES; ++i) {
+			refs[i] = vmw_ioctl_surface_ref(fd1, prime_fds[i],
+							DRM_VMW_HANDLE_PRIME);
+			close(prime_fds[i]);
+			igt_assert_neq(refs[i]->base.handle, 0);
+			igt_assert_neq(refs[i]->base.backup_size, 0);
+			igt_assert_neq(refs[i]->base.buffer_size, 0);
+		}
+	}
+
+	igt_describe("Test refcounts on prime surfaces with buffer handles.");
+	igt_subtest("surface_buffer_prime_refs") {
+		struct vmw_surface *surfaces[NUM_SURFACES] = {0};
+		int prime_fds[NUM_SURFACES] = {0};
+		struct vmw_surface *refs[NUM_SURFACES] = {0};
+		int i;
+		SVGA3dSize surf_size;
+
+		for (i = 0; i < NUM_SURFACES; ++i) {
+			surf_size.width = 32 + i * 16;
+			surf_size.height = 32 + i * 16;
+			surf_size.depth = 1;
+
+			surfaces[i] = vmw_create_surface_simple(fd1,
+								SVGA3D_SURFACE_HINT_TEXTURE |
+								SVGA3D_SURFACE_HINT_RENDERTARGET |
+								SVGA3D_SURFACE_BIND_RENDER_TARGET,
+								SVGA3D_R8G8B8A8_UNORM, surf_size,
+								SVGA3D_INVALID_ID);
+			igt_assert(surfaces[i]);
+		}
+
+		for (i = 0; i < NUM_SURFACES; ++i) {
+			prime_fds[i] = prime_handle_to_fd(fd1,
+							  surfaces[i]->base.buffer_handle);
+			igt_assert_neq(prime_fds[i], 0);
+			igt_assert_neq(prime_fds[i], -1);
+			vmw_ioctl_surface_unref(fd1, surfaces[i]);
+		}
+
+		for (i = 0; i < NUM_SURFACES; ++i) {
+			refs[i] = vmw_ioctl_surface_ref(fd1, prime_fds[i],
+							DRM_VMW_HANDLE_PRIME);
+			close(prime_fds[i]);
+			igt_assert_neq(refs[i]->base.handle, 0);
+			igt_assert_neq(refs[i]->base.backup_size, 0);
+			igt_assert_neq(refs[i]->base.buffer_size, 0);
+		}
+	}
+
+	igt_fixture {
 		drm_close_driver(fd1);
 		drm_close_driver(fd2);
 	}
-- 
2.43.0

