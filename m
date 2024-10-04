Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8550CF8853
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 22:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBD910E00D;
	Fri,  4 Oct 2024 22:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="a5++anSs";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F4A10E00D
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 22:31:22 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20ba9f3824fso21393565ad.0
 for <igt-dev@lists.freedesktop.org>; Fri, 04 Oct 2024 15:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1728081081; x=1728685881;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DodWvJ9ra8c3yRRqadVgD5I03ihT3T93B9OYulQu9EU=;
 b=a5++anSsMWTDBLLlTY34d6vw+/YX6GiCRanHfefK+oRlkg2gmK3jDegm8gLJ3JSIrN
 iymf0HJsbCNslM4yAoWAp6j1j/37+ooTrUV9CZwBYXY+p0Q1t3xLG8rfT/ZzFiMPck0k
 kiUJTHioXQ88w51Xv+/9PBwzPMhl/RtmWVETQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728081081; x=1728685881;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DodWvJ9ra8c3yRRqadVgD5I03ihT3T93B9OYulQu9EU=;
 b=KgVhpcL9syhkhzgOztI6jXZLA2xEjHATH1GvchlDVppgBd2lT5HDP+ivRl+bFSSyRA
 esyA0ZF0I9U9d7DVlsa9H//mytDGfOyA3tVtq6z0IlgqtXB4Nj7CRRm2jz6+p+pN8K6r
 8XvVvNWL1to0/w0FGcZ6R85UfHPsx3tPrsj9StYMQEzbASqJ6ae45KER/dyqaixll3VM
 3ULr2cKQ0GkrMNUknBKuq4cT/xVa+YLEsbMALN8sENq16jG9LhsAbQNsIZ9Z/mDBwUMd
 bIjlULP1vYaFabob0r3skwnJBY4hFlZDSZ3XfXBzfW4+DpZVSn8Wxh5m+4MMz+RCYwTi
 6ItQ==
X-Gm-Message-State: AOJu0YyiBw7+hSCuHxHR9YmoX1OanLs501JvSjZygRX/odKfEtuDFxpG
 W8bJ6PxdP3p0W1S/b3r0WGV2K/nrtE0KM6OX5KO08T/2WqKrFU9T5ePtzcd4t5UqrvMtW6I0Hhv
 d4BiAoufaDYNJplMaZ88iWwys8dvA5j8GJ81vmG4fWgXF9NjpXtSlUcKgsYlJ0b6EEYahUNHGaC
 9dVcjIQ5SO8XdIIEvB+owBzD6mqvWzYnrfTUdVfloiNrv/A2vD4FYYMug=
X-Google-Smtp-Source: AGHT+IFY9Ox5Yl63ruR7xSxW9bQ3SFnlwshhNoBXXIRCRE4Qf3H/uedqvOmocIksVwaqO7dxb2KNbg==
X-Received: by 2002:a17:902:e80c:b0:20b:7094:8d14 with SMTP id
 d9443c01a7336-20bfde58014mr66633695ad.5.1728081081314; 
 Fri, 04 Oct 2024 15:31:21 -0700 (PDT)
Received: from localhost.localdomain ([216.221.25.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c1393a15fsm3241245ad.121.2024.10.04.15.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 15:31:20 -0700 (PDT)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH] tests/vmwgfx: Add test that draws triangle without using 3d
 commands.
Date: Fri,  4 Oct 2024 15:30:53 -0700
Message-ID: <20241004223053.317136-1-maaz.mombasawala@broadcom.com>
X-Mailer: git-send-email 2.43.0
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
Reply-To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The vmwgfx driver can be used in VMs with 3d disabled, in which case 3d
commands are not available, but buffers can still be created and used.
Validate buffers on such vms with a test that uses cairo to draw a
triangle on a vmwgfx mob and validate it with the same image in system
memory.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
---
 lib/igt_vmwgfx.c       | 78 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_vmwgfx.h       |  3 ++
 tests/vmwgfx/vmw_tri.c | 30 +++++++++++++---
 3 files changed, 107 insertions(+), 4 deletions(-)

diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
index b62d7a326..74c13b52b 100644
--- a/lib/igt_vmwgfx.c
+++ b/lib/igt_vmwgfx.c
@@ -1348,3 +1348,81 @@ bool vmw_is_format_supported(int drm_fd, SVGA3dDevCapIndex dev_cap_index)
 	result = vmw_format_get_caps(drm_fd, dev_cap_index);
 	return result.u & SVGA3D_FORMAT_POSITIVE;
 }
+
+static void draw_triangle_2d(cairo_t *cr, int width, int height)
+{
+	cairo_pattern_t *r_pat, *g_pat, *b_pat;
+
+	cairo_rectangle(cr, 0, 0, width, height);
+	cairo_set_source_rgb(cr, 0.5, 0.5, 0.5);
+	cairo_fill(cr);
+
+	cairo_scale(cr, width, height);
+
+	cairo_move_to(cr, 0.5, 0.125);
+	cairo_line_to(cr, 0.125, 0.875);
+	cairo_line_to(cr, 0.875, 0.875);
+	cairo_close_path(cr);
+
+	r_pat = cairo_pattern_create_linear(0.125, 0.875, 0.675, 0.475);
+	cairo_pattern_add_color_stop_rgba(r_pat, 0, 1, 0, 0, 1);
+	cairo_pattern_add_color_stop_rgba(r_pat, 1, 0, 0, 0, 0);
+
+	g_pat = cairo_pattern_create_linear(0.5, 0.125, 0.5, 0.875);
+	cairo_pattern_add_color_stop_rgba(g_pat, 0, 0, 1, 0, 1);
+	cairo_pattern_add_color_stop_rgba(g_pat, 1, 0, 0, 0, 0);
+
+	b_pat = cairo_pattern_create_linear(0.875, 0.875, 0.325, 0.475);
+	cairo_pattern_add_color_stop_rgba(b_pat, 0, 0, 0, 1, 1);
+	cairo_pattern_add_color_stop_rgba(b_pat, 1, 0, 0, 0, 0);
+
+	cairo_set_source(cr, r_pat);
+	cairo_fill_preserve(cr);
+	cairo_set_source(cr, g_pat);
+	cairo_fill_preserve(cr);
+	cairo_set_source(cr, b_pat);
+	cairo_fill(cr);
+
+	cairo_pattern_destroy(r_pat);
+	cairo_pattern_destroy(g_pat);
+	cairo_pattern_destroy(b_pat);
+}
+
+
+/**
+ * Tests if mob can be used without invoking 3d commands.
+ */
+void vmw_triangle_test_2d(int fd, struct vmw_mob *mob, const uint32 width,
+			  const uint32 height, const uint32 stride)
+{
+	cairo_surface_t *mob_cr_srf, *mem_cr_srf;
+	cairo_t *cr_mob, *cr_mem;
+	void *data, *mob_data, *mem_data;
+	const uint32 size = height * stride;
+
+	data = vmw_ioctl_mob_map(fd, mob);
+	mob_cr_srf = cairo_image_surface_create_for_data(data,
+		CAIRO_FORMAT_ARGB32, width, height, stride);
+	cr_mob = cairo_create(mob_cr_srf);
+	draw_triangle_2d(cr_mob, width, height);
+
+	mem_cr_srf = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, width,
+		height);
+	cr_mem = cairo_create(mem_cr_srf);
+	draw_triangle_2d(cr_mem, width, height);
+
+	mob_data = cairo_image_surface_get_data(mob_cr_srf);
+	mem_data = cairo_image_surface_get_data(mem_cr_srf);
+
+	igt_assert_f(mob_data != NULL, "No data in mob image.\n");
+	igt_assert_f(mem_data != NULL, "No data in system memory image.\n");
+
+	igt_assert_f(memcmp(mob_data, mem_data, size) == 0,
+		     "Mob and system memory images are not identical\n");
+
+	cairo_destroy(cr_mob);
+	cairo_surface_destroy(mob_cr_srf);
+	cairo_destroy(cr_mem);
+	cairo_surface_destroy(mem_cr_srf);
+	vmw_ioctl_mob_unmap(mob);
+}
diff --git a/lib/igt_vmwgfx.h b/lib/igt_vmwgfx.h
index a630d201d..bfc591128 100644
--- a/lib/igt_vmwgfx.h
+++ b/lib/igt_vmwgfx.h
@@ -257,4 +257,7 @@ SVGA3dDevCapResult vmw_format_get_caps(int drm_fd,
 
 bool vmw_is_format_supported(int drm_fd, SVGA3dDevCapIndex dev_cap_index);
 
+void vmw_triangle_test_2d(int fd, struct vmw_mob *mob, const uint32 width,
+			  const uint32 height, const uint32 stride);
+
 #endif /* IGT_VMWGFX_H */
diff --git a/tests/vmwgfx/vmw_tri.c b/tests/vmwgfx/vmw_tri.c
index 61c4d5df8..1cb54707a 100644
--- a/tests/vmwgfx/vmw_tri.c
+++ b/tests/vmwgfx/vmw_tri.c
@@ -189,15 +189,17 @@ igt_main
 	{
 		vmw_svga_device_init(&device, vmw_svga_device_node_render);
 		igt_require(device.drm_fd != -1);
-
-		cid = vmw_ioctl_context_create(device.drm_fd);
-		igt_require(cid != SVGA3D_INVALID_ID);
 	}
 
 	igt_describe("Tests rendering of a trivial triangle.");
 	igt_subtest("tri")
 	{
+		cid = vmw_ioctl_context_create(device.drm_fd);
+		igt_require(cid != SVGA3D_INVALID_ID);
+
 		draw_triangle(&device, cid);
+
+		vmw_ioctl_context_destroy(device.drm_fd, cid);
 	}
 
 	/*
@@ -207,12 +209,32 @@ igt_main
 	igt_describe("Tests rendering of a triangle with coherency.");
 	igt_subtest("tri-no-sync-coherent")
 	{
+		cid = vmw_ioctl_context_create(device.drm_fd);
+		igt_require(cid != SVGA3D_INVALID_ID);
+
 		draw_triangle_on_coherent_rt(&device, cid);
+
+		vmw_ioctl_context_destroy(device.drm_fd, cid);
+	}
+
+	igt_describe("Tests drawing a triangle without 3d commands");
+	igt_subtest("tri-2d")
+	{
+		struct vmw_mob *mob;
+		const uint32 width = vmw_default_rect_size.width;
+		const uint32 height = vmw_default_rect_size.height;
+		const uint32 stride = width * 4;
+		const uint32 size = height * stride;
+
+		mob = vmw_ioctl_mob_create(device.drm_fd, size);
+
+		vmw_triangle_test_2d(device.drm_fd, mob, width, height, stride);
+
+		vmw_ioctl_mob_close_handle(device.drm_fd, mob);
 	}
 
 	igt_fixture
 	{
-		vmw_ioctl_context_destroy(device.drm_fd, cid);
 		vmw_svga_device_fini(&device);
 	}
 }
-- 
2.43.0

