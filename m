Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76113C54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 12:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230C610E2F8;
	Mon, 26 May 2025 12:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GaKN0NrU";
	dkim-atps=neutral
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339EE10E35C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 12:20:53 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-73712952e1cso1481204b3a.1
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748262052; x=1748866852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SorttEvZHXcCA/SO4ng8AUd/TeoJor2bDKGJ933PvOA=;
 b=GaKN0NrUxo867Rc+icj7+lh07snJrUJXz0Nj+qhQfnqoVvZBWgnkWIcZHxhJcyqGKP
 pSZrY/ppcWSaZmvPdHQfglqDpil9Gl7xkGSUz+6kZ5e3wtvdZNDCJ1rYtRQjHJ9um593
 BUg230wYKMvSIJJ8S5Au8X23pJC+KEaiAJfSOky7Dqp/x6XsKU+XDpsRVtMrJw/anxy/
 w1NWN4IwigJ4EZVmxPm7ZqANSFADrDdtPkFk6KDx/pm9Hbu2NiiREjYWzvGHBuh9nZnS
 J7fl6LVgY3dIERvjjX93EX8Z3jyCo6jp8vSkfOLpGEZEymRacFen4tTa0U/4vTkThahJ
 q8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748262052; x=1748866852;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SorttEvZHXcCA/SO4ng8AUd/TeoJor2bDKGJ933PvOA=;
 b=GhVznVz+NTRE9C+/JGinUh8uP0Htq52DdiW8drCv1ltlPbQW/42va8Vm3yTn9jlv4S
 K8LWiAP7JmEyNRgrZxB63VeJ6BFTAbi0OWQ97h3IdoO5j6zlY0RAVDmnrVaSObUygP0o
 UojejP1azsGwLmDyBuptm9ypaq30Era8MbxLPhj27iNmKh+8Azo27fMGdg/B+VzOejRB
 984MDiaIFh1ZH6pXp8dCnqk4jn9cti1iUXyXk/ZJv1TZsR5IrMFMILMxPT+1Bc0msc0N
 HEeKpwWmmdpRtUUWKS/w6Klq+Lq+TEIS0Niatzey3sj+IpMuxmL4AddC4vZXwh1J9HE9
 z5ig==
X-Gm-Message-State: AOJu0Yyiuz1nDiyfL3hu1pP7VhykTV3aPt+mWXMqZApCyOqbNM/BtkdF
 X+EFdAS7nP0XZAFaCtMEzy74eM/UldrYqJXIGg3BrUS1nvvXadBV5PZVFueofUkR
X-Gm-Gg: ASbGnct6XN0Wy4msEw1651GQTkvzhvS04tbMpLSZOR0ZTNO9TGghPOD8hQeUDpDIYzI
 zukpw06irXMHcvN5ilpXaiAaF8hiFLNv0rygW2/nGMfV+ftZ7EUicMsgPjg03T0R5MxSSOnpvAZ
 myd479DLpTc8U5qb+zRmhi5RFMIMHPPJVqn1VF7eVUHKpZ0wrRFGKi5loOiQ74Gjpu4DbELyhrS
 sM/ADOr3dgA9D5qq/Y5fuud2bU+P93s66VM27+gP7yDCbO3ThiyBkHa350JhMiYdYGLhibHoNRM
 FV2xD2Y+J/JfJlNtphHroxRbafJWjPFYB6g2kihUGc1vPxfAeck7cPj/
X-Google-Smtp-Source: AGHT+IEIlPLxdB7dnKwKFK+pBxQ2j+UvUD6o60l1XKR5aeUZXPwJCena+/ubfwW8EUbyY37ZztXRuA==
X-Received: by 2002:a17:90b:3891:b0:2ee:f677:aa14 with SMTP id
 98e67ed59e1d1-3110f30dfe4mr13336507a91.13.1748262052234; 
 Mon, 26 May 2025 05:20:52 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3110b9a447bsm4658026a91.3.2025.05.26.05.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 05:20:51 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/kms_getfb: replace CCS with NV12 and use libigt
 functions
Date: Mon, 26 May 2025 15:20:39 +0300
Message-ID: <20250526122039.50519-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Replace use of CCS with NV12 making tests non-Intel specific. While doing so
had to do bit of replacing legacy igt code.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_getfb.c | 339 +++++++++++++++++-----------------------------
 1 file changed, 122 insertions(+), 217 deletions(-)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 496d2c45a..7c4a42856 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -66,8 +66,8 @@
  */
 
 /**
- * SUBTEST: getfb-reject-ccs
- * Description: Tests error handling while requesting CCS buffers it should
+ * SUBTEST: getfb-reject-nv12
+ * Description: Tests error handling while requesting NV12 buffers it should
  *              refuse because getfb supports returning a single buffer handle.
  *
  * SUBTEST: getfb-%s-different-handles
@@ -81,8 +81,8 @@
  */
 
 /**
- * SUBTEST: getfb2-accept-ccs
- * Description: Tests outputs are correct when retrieving a CCS framebuffer.
+ * SUBTEST: getfb2-accept-nv12
+ * Description: Tests outputs are correct when retrieving a NV12 framebuffer.
  *
  * SUBTEST: getfb2-into-addfb2
  * Description: Output check by passing the output of GETFB2 into ADDFB2.
@@ -126,111 +126,13 @@ static bool has_getfb_iface(int fd)
 	}
 }
 
-static bool has_addfb2_iface(int fd)
-{
-	struct drm_mode_fb_cmd2 arg = { };
-	int err;
-
-	err = 0;
-	if (drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &arg))
-		err = -errno;
-	switch (err) {
-	case -ENOTTY: /* ioctl unrecognised (kernel too old) */
-	case -ENOTSUP: /* driver doesn't support KMS */
-		return false;
-	default:
-		return true;
-	}
-}
-
-static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
-{
-	struct drm_mode_fb_cmd2 add = {
-		.width = 1024,
-		.height = 1024,
-		.pixel_format = DRM_FORMAT_XRGB8888,
-		.flags = DRM_MODE_FB_MODIFIERS,
-	};
-	int size;
-	uint32_t devid;
-
-	igt_require(has_addfb2_iface(fd));
-	devid = intel_get_drm_devid(fd);
-
-	igt_require_f(intel_graphics_ver(devid) < IP_VER(20, 0),
-		      "No ccs modifiers on Xe2\n");
-
-	if (HAS_FLATCCS(devid)) {
-		add.modifier[0] = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
-		add.pitches[0] = ALIGN(add.width * 4, 4 * 512);
-		size = add.pitches[0] * ALIGN(add.height, 8);
-		size = ALIGN(size, 4096);
-	} else if ((intel_display_ver(devid)) >= 12) {
-		add.modifier[0] = IS_METEORLAKE(devid) ?
-			I915_FORMAT_MOD_4_TILED_MTL_RC_CCS :
-			I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
-
-		add.modifier[1] = IS_METEORLAKE(devid) ?
-			I915_FORMAT_MOD_4_TILED_MTL_RC_CCS :
-			I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
-
-		/* The main surface for Gen12+ is 4x4 tiles aligned
-		 * For 32bpp the pitch is 4*4*32 bytes i.e. 512 bytes
-		 */
-		add.pitches[0] = ALIGN(add.width * 4, 4 * 128);
-
-		/* The main surface height is 4 tile rows aligned */
-		add.offsets[1] = add.pitches[0] * ALIGN(add.height, 128);
-
-		/* CCS surface pitch is 64 bytes aligned which corresponds to
-		 * 4 tiles on the main surface
-		 */
-		add.pitches[1] = DIV_ROUND_UP(add.width, 128) * 64;
-
-		size = add.offsets[1];
-		/* CCS surface height is 4 tile rows aligned */
-		size += add.pitches[1] * DIV_ROUND_UP(add.height, 128) * 4;
-
-		/* GEM object is page aligned */
-		size = ALIGN(size, 4096);
-	} else {
-		add.modifier[0] = I915_FORMAT_MOD_Y_TILED_CCS;
-		add.modifier[1] = I915_FORMAT_MOD_Y_TILED_CCS;
-
-		/* An explanation of the magic numbers can be found in kms_ccs.c. */
-		add.pitches[0] = ALIGN(add.width * 4, 128);
-		add.offsets[1] = add.pitches[0] * ALIGN(add.height, 32);
-		add.pitches[1] = ALIGN(ALIGN(add.width * 4, 32) / 32, 128);
-
-		size = add.offsets[1];
-		size += add.pitches[1] * ALIGN(ALIGN(add.height, 16) / 16, 32);
-	}
-
-	if (is_i915_device(fd))
-		add.handles[0] = gem_buffer_create_fb_obj(fd, size);
-	else
-		add.handles[0] = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0), 0);
-	igt_require(add.handles[0] != 0);
-
-	if (!HAS_FLATCCS(devid))
-		add.handles[1] = add.handles[0];
-
-	if (drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &add) == 0)
-		*ret = add;
-	else
-		gem_close(fd, add.handles[0]);
-}
-
 /**
  * Find and return an arbitrary valid property ID.
  */
-static uint32_t get_any_prop_id(int fd)
+static uint32_t get_any_prop_id(struct igt_display *display)
 {
-	igt_display_t display;
-
-	igt_display_require(&display, fd);
-	for (int i = 0; i < display.n_outputs; i++) {
-		igt_output_t *output = &display.outputs[i];
+	for (int i = 0; i < display->n_outputs; i++) {
+		igt_output_t *output = &display->outputs[i];
 		if (output->props[IGT_CONNECTOR_DPMS] != 0)
 			return output->props[IGT_CONNECTOR_DPMS];
 	}
@@ -238,213 +140,214 @@ static uint32_t get_any_prop_id(int fd)
 	return 0;
 }
 
-static void test_handle_input(int fd)
+static void test_handle_input(struct igt_display *display)
 {
-	struct drm_mode_fb_cmd2 add = {};
+	struct igt_fb fb;
 
 	igt_fixture {
-		add.width = 1024;
-		add.height = 1024;
-		add.pixel_format = DRM_FORMAT_XRGB8888;
-		add.pitches[0] = 1024*4;
-		add.handles[0] = igt_create_bo_with_dimensions(fd, 1024, 1024,
-			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
-		igt_require(add.handles[0] != 0);
-		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
+		igt_create_fb(display->drm_fd, 1024, 1024,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			      &fb);
 	}
 
 	igt_describe("Tests error handling for a zero'd input.");
 	igt_subtest("getfb-handle-zero") {
 		struct drm_mode_fb_cmd get = { .fb_id = 0 };
-		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, ENOENT);
+		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get,
+			     ENOENT);
 	}
 
 	igt_describe("Tests error handling when passing an valid "
 		     "handle.");
 	igt_subtest("getfb-handle-valid") {
-		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
-		do_ioctl(fd, DRM_IOCTL_MODE_GETFB, &get);
+		struct drm_mode_fb_cmd get = { .fb_id = fb.fb_id };
+		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get);
 		igt_assert_neq_u32(get.handle, 0);
-		igt_assert_eq_u32(get.width, add.width);
-		igt_assert_eq_u32(get.height, add.height);
-		igt_assert_eq_u32(get.pitch, add.pitches[0]);
+		igt_assert_eq_u32(get.width, fb.width);
+		igt_assert_eq_u32(get.height, fb.height);
+		igt_assert_eq_u32(get.pitch, fb.strides[0]);
 		igt_assert_eq_u32(get.depth, 24);
 		igt_assert_eq_u32(get.bpp, 32);
-		gem_close(fd, get.handle);
+		gem_close(display->drm_fd, get.handle);
 	}
 
 	igt_describe("Tests error handling when passing a handle that "
 		     "has been closed.");
 	igt_subtest("getfb-handle-closed") {
-		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
-		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add.fb_id);
-		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, ENOENT);
+		struct drm_mode_fb_cmd get = { .fb_id = fb.fb_id };
+		igt_remove_fb(display->drm_fd, &fb);
+		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get,
+			     ENOENT);
 	}
 
 	igt_describe("Tests error handling when passing an invalid "
 		     "handle.");
 	igt_subtest("getfb-handle-not-fb") {
-		struct drm_mode_fb_cmd get = { .fb_id = get_any_prop_id(fd) };
+		struct drm_mode_fb_cmd get = {
+			.fb_id = get_any_prop_id(display)
+		};
+
 		igt_require(get.fb_id > 0);
-		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, ENOENT);
+		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get,
+			     ENOENT);
 	}
 
 	igt_fixture
-		gem_close(fd, add.handles[0]);
+		igt_remove_fb(display->drm_fd, &fb);
 }
 
-static void test_duplicate_handles(int fd)
+static void test_duplicate_handles(struct igt_display *display)
 {
-	struct drm_mode_fb_cmd2 add = {};
+	struct igt_fb fb;
 
 	igt_fixture {
-		add.width = 1024;
-		add.height = 1024;
-		add.pixel_format = DRM_FORMAT_XRGB8888;
-		add.pitches[0] = 1024*4;
-		add.handles[0] = igt_create_bo_with_dimensions(fd, 1024, 1024,
-			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
-		igt_assert(add.handles[0]);
-		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
+		igt_create_fb(display->drm_fd, 1024, 1024,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			      &fb);
 	}
 
 	igt_describe("Tests error handling while requesting for two different "
 		     "handles from same fd.");
 	igt_subtest("getfb-addfb-different-handles") {
-		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
+		struct drm_mode_fb_cmd get = { .fb_id = fb.fb_id };
 
-		do_ioctl(fd, DRM_IOCTL_MODE_GETFB, &get);
-		igt_assert_neq_u32(get.handle, add.handles[0]);
-		gem_close(fd, get.handle);
+		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get);
+		igt_assert_neq_u32(get.handle, fb.gem_handle);
+		gem_close(display->drm_fd, get.handle);
 	}
 
 	igt_describe("Tests error handling while requesting for two different "
 		     "handles from different fd.");
 	igt_subtest("getfb-repeated-different-handles") {
-		struct drm_mode_fb_cmd get1 = { .fb_id = add.fb_id };
-		struct drm_mode_fb_cmd get2 = { .fb_id = add.fb_id };
+		struct drm_mode_fb_cmd get1 = { .fb_id = fb.fb_id };
+		struct drm_mode_fb_cmd get2 = { .fb_id = fb.fb_id };
 
-		do_ioctl(fd, DRM_IOCTL_MODE_GETFB, &get1);
-		do_ioctl(fd, DRM_IOCTL_MODE_GETFB, &get2);
+		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get1);
+		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get2);
 		igt_assert_neq_u32(get1.handle, get2.handle);
 
-		gem_close(fd, get1.handle);
-		gem_close(fd, get2.handle);
+		gem_close(display->drm_fd, get1.handle);
+		gem_close(display->drm_fd, get2.handle);
 	}
 
-	igt_describe("Tests error handling while requesting CCS buffers "
+	igt_describe("Tests error handling while requesting NV12 buffers "
 		     "it should refuse because getfb supports returning "
 		     "a single buffer handle.");
-	igt_subtest("getfb-reject-ccs") {
-		struct drm_mode_fb_cmd2 add_ccs = { };
+	igt_subtest("getfb-reject-nv12") {
 		struct drm_mode_fb_cmd get = { };
+		struct igt_fb nv12_fb;
 
-		igt_require_intel(fd);
-		igt_require_f(!HAS_FLATCCS(intel_get_drm_devid(fd)),
-			      "skip because flat ccs has only one buffer.\n");
+		igt_require(igt_display_has_format_mod(display, 
+						       DRM_FORMAT_NV12,
+						       DRM_FORMAT_MOD_LINEAR));
 
-		get_ccs_fb(fd, &add_ccs);
-		igt_require(add_ccs.handles[0] != 0);
-		get.fb_id = add_ccs.fb_id;
-		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, EINVAL);
+		igt_create_fb(display->drm_fd, 1024, 1024,
+			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR,
+			      &nv12_fb);
 
-		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add_ccs.fb_id);
-		gem_close(fd, add_ccs.handles[0]);
-	}
+		get.fb_id = nv12_fb.fb_id;
+		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB, &get,
+			     EINVAL);
 
-	igt_fixture {
-		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add.fb_id);
-		gem_close(fd, add.handles[0]);
+		igt_remove_fb(display->drm_fd, &nv12_fb);
 	}
+
+	igt_fixture
+		igt_remove_fb(display->drm_fd, &fb);
 }
 
-static void test_getfb2(int fd)
+static void test_getfb2(struct igt_display *display)
 {
-	struct drm_mode_fb_cmd2 add_basic = {};
+	struct igt_fb fb;
 
 	igt_fixture {
 		struct drm_mode_fb_cmd2 get = {};
 
-		add_basic.width = 1024;
-		add_basic.height = 1024;
-		add_basic.pixel_format = DRM_FORMAT_XRGB8888;
-		add_basic.pitches[0] = 1024*4;
-		add_basic.handles[0] = igt_create_bo_with_dimensions(fd, 1024, 1024,
-			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
-		igt_assert(add_basic.handles[0]);
-		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add_basic);
+		igt_create_fb(display->drm_fd, 1024, 1024,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			      &fb);
 
-		get.fb_id = add_basic.fb_id;
-		do_ioctl(fd, DRM_IOCTL_MODE_GETFB2, &get);
+		get.fb_id = fb.fb_id;
+		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &get);
 		igt_assert_neq_u32(get.handles[0], 0);
-		gem_close(fd, get.handles[0]);
+		gem_close(display->drm_fd, get.handles[0]);
 	}
 
 	igt_describe("Tests error handling for a zero'd input.");
 	igt_subtest("getfb2-handle-zero") {
 		struct drm_mode_fb_cmd2 get = {};
-		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB2, &get, ENOENT);
+		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &get,
+			     ENOENT);
 	}
 
 	igt_describe("Tests error handling when passing a handle that "
 		     "has been closed.");
 	igt_subtest("getfb2-handle-closed") {
-		struct drm_mode_fb_cmd2 add = add_basic;
+		struct igt_fb test_fb;
 		struct drm_mode_fb_cmd2 get = { };
 
-		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
-		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add.fb_id);
+		igt_create_fb(display->drm_fd, fb.width, fb.height,
+			      fb.drm_format, fb.modifier, &test_fb);
 
-		get.fb_id = add.fb_id;
-		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB2, &get, ENOENT);
+		get.fb_id = test_fb.fb_id;
+		igt_remove_fb(display->drm_fd, &test_fb);
+
+		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &get,
+			     ENOENT);
 	}
 
 	igt_describe("Tests error handling when passing an invalid "
 		     "handle.");
 	igt_subtest("getfb2-handle-not-fb") {
-		struct drm_mode_fb_cmd2 get = { .fb_id = get_any_prop_id(fd) };
+		struct drm_mode_fb_cmd2 get = {
+			.fb_id = get_any_prop_id(display)
+		};
 		igt_require(get.fb_id > 0);
-		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB2, &get, ENOENT);
+		do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &get,
+			     ENOENT);
 	}
 
 	igt_describe("Tests outputs are correct when retrieving a "
-		     "CCS framebuffer.");
-	igt_subtest("getfb2-accept-ccs") {
-		struct drm_mode_fb_cmd2 add_ccs = { };
+		     "NV12 framebuffer.");
+	igt_subtest("getfb2-accept-nv12") {
+		struct igt_fb nv12_fb;
 		struct drm_mode_fb_cmd2 get = { };
 		int i;
 
-		igt_require_intel(fd);
-		get_ccs_fb(fd, &add_ccs);
-		igt_require(add_ccs.fb_id != 0);
-		get.fb_id = add_ccs.fb_id;
-		do_ioctl(fd, DRM_IOCTL_MODE_GETFB2, &get);
+		igt_require(igt_display_has_format_mod(display, 
+						       DRM_FORMAT_NV12,
+						       DRM_FORMAT_MOD_LINEAR));
+
+		igt_create_fb(display->drm_fd, 1024, 1024,
+			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR,
+			      &nv12_fb);
+
+		get.fb_id = nv12_fb.fb_id;
+		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &get);
 
-		igt_assert_eq_u32(get.width, add_ccs.width);
-		igt_assert_eq_u32(get.height, add_ccs.height);
+		igt_assert_eq_u32(get.width, nv12_fb.width);
+		igt_assert_eq_u32(get.height, nv12_fb.height);
 		igt_assert(get.flags & DRM_MODE_FB_MODIFIERS);
 
 		for (i = 0; i < ARRAY_SIZE(get.handles); i++) {
-			igt_assert_eq_u32(get.pitches[i], add_ccs.pitches[i]);
-			igt_assert_eq_u32(get.offsets[i], add_ccs.offsets[i]);
-			if (add_ccs.handles[i] != 0) {
+			igt_assert_eq_u32(get.pitches[i], nv12_fb.strides[i]);
+			igt_assert_eq_u32(get.offsets[i], nv12_fb.offsets[i]);
+			if (i < 2) { 
 				igt_assert_neq_u32(get.handles[i], 0);
 				igt_assert_neq_u32(get.handles[i],
-						   add_ccs.handles[i]);
+						   nv12_fb.gem_handle);
 				igt_assert_eq_u64(get.modifier[i],
-						  add_ccs.modifier[i]);
+						  fb.modifier);
 			} else {
 				igt_assert_eq_u32(get.handles[i], 0);
 				igt_assert_eq_u64(get.modifier[i], 0);
 			}
 		}
 
-		if (!HAS_FLATCCS(intel_get_drm_devid(fd)))
+		if (is_intel_device(display->drm_fd))
 			igt_assert_eq_u32(get.handles[0], get.handles[1]);
 
-		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &get.fb_id);
-		gem_close(fd, add_ccs.handles[0]);
-		gem_close(fd, get.handles[0]);
+		igt_remove_fb(display->drm_fd, &nv12_fb);
 	}
 
 	igt_describe("Output check by passing the output of GETFB2 "
@@ -452,18 +355,16 @@ static void test_getfb2(int fd)
 	igt_subtest("getfb2-into-addfb2") {
 		struct drm_mode_fb_cmd2 cmd = { };
 
-		cmd.fb_id = add_basic.fb_id;
-		do_ioctl(fd, DRM_IOCTL_MODE_GETFB2, &cmd);
-		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &cmd);
+		cmd.fb_id = fb.fb_id;
+		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_GETFB2, &cmd);
+		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_ADDFB2, &cmd);
 
-		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &cmd.fb_id);
-		gem_close(fd, cmd.handles[0]);
+		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_RMFB, &cmd.fb_id);
+		gem_close(display->drm_fd, cmd.handles[0]);
 	}
 
-	igt_fixture {
-		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add_basic.fb_id);
-		gem_close(fd, add_basic.handles[0]);
-	}
+	igt_fixture
+		igt_remove_fb(display->drm_fd, &fb);
 }
 
 static void test_handle_protection(void) {
@@ -527,24 +428,28 @@ static void test_handle_protection(void) {
 igt_main
 {
 	int fd;
+	igt_display_t display;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require(has_getfb_iface(fd));
+		igt_display_require(&display, fd);
 	}
 
 	igt_subtest_group
-		test_handle_input(fd);
+		test_handle_input(&display);
 
 	igt_subtest_group
-		test_duplicate_handles(fd);
+		test_duplicate_handles(&display);
 
 	igt_subtest_group
-		test_getfb2(fd);
+		test_getfb2(&display);
 
 	igt_subtest_group
 		test_handle_protection();
 
-	igt_fixture
+	igt_fixture {
+		igt_display_fini(&display);
 		drm_close_driver(fd);
+	}
 }
-- 
2.45.2

