Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF4CC19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 23:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B001810E871;
	Wed,  5 Mar 2025 23:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUisHc+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E7E10E870
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 23:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741218017; x=1772754017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wd/8YM90y3yNI4Vw2VInoNReVNozgz1uuFFBdfgRdF8=;
 b=aUisHc+bvtxPKZmw3xl6Itlv9gip4rvRUZrTx2YonY7DFddkuSQj3+Gh
 u+RKqIjhvWFIhzmf597EoP73EoV00phgfdjybYMNmGxebEJ7YRca6rnP2
 FVzENvqS5Z8rjiuUNOe7CNIzlCivZrzpiTlaVvuYM8PwWaEg/sCxAkg9X
 hf6UgYqAJLesrrTqJfYc1hSMWa2JLQd0XGqNSpGBftFAbo272ym+oL+fj
 JW3FixzdSxAurY+8umnmpVP4tcsfaLSrQkRH90m8pUF33BUf2xJAhapwx
 gz4aZfo2vi3Dc5hKxvmFVKhngM2EbbDMNAy1+UJKWIu67LRWvlQfkITmN w==;
X-CSE-ConnectionGUID: l8kTy7m7Rfyr2egmpf7Jjw==
X-CSE-MsgGUID: lPBPhYduRNWZl5tLpf/aJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41917117"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="41917117"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 15:40:16 -0800
X-CSE-ConnectionGUID: mSkUhTC+Q2mjMX1iw+KdFA==
X-CSE-MsgGUID: qbHmHylvTIyMWzf76TPnyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="118849548"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 15:40:16 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v5 6/6] tests/intel/xe_pxp: Test encrypted FBs
Date: Wed,  5 Mar 2025 15:39:47 -0800
Message-ID: <20250305233951.3488609-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
References: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
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

PXP allows a user to send an encrypted BO to the display HW without
having to decode it. The driver needs however to tell the HW that the
BO is encrypted, otherwise it won't be displayed correctly. Furthermore,
if PXP is terminated before the FB is displayed, we expect to see a black
screen instead of what's in the BO.

We can test both these flows by by displaying the expected image from a
non-encrypted FB and and making sure that the CRC match when we display
the encrypted FB.

v2: move igt_require calls inside the subtest
v3: move repeated code to an helper (Alan)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/intel/xe_pxp.c | 268 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 261 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 8f83c9a3b..961820a7e 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -27,8 +27,8 @@ IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated
  * Test category: functionality test
  */
 
-static int __pxp_bo_create(int fd, uint32_t vm, uint64_t size,
-			   uint32_t session_type, uint32_t *handle)
+static int __pxp_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
+			   uint32_t session_type, uint32_t flags, uint32_t *handle)
 {
 	struct drm_xe_ext_set_property ext = {
 		.base.next_extension = 0,
@@ -38,7 +38,7 @@ static int __pxp_bo_create(int fd, uint32_t vm, uint64_t size,
 	};
 	int ret = 0;
 
-	if (__xe_bo_create(fd, vm, size, system_memory(fd), 0, &ext, handle)) {
+	if (__xe_bo_create(fd, vm, size, placement, flags, &ext, handle)) {
 		ret = -errno;
 		errno = 0;
 	}
@@ -50,7 +50,19 @@ static uint32_t pxp_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t type)
 {
 	uint32_t handle;
 
-	igt_assert_eq(__pxp_bo_create(fd, vm, size, type, &handle), 0);
+	igt_assert_eq(__pxp_bo_create(fd, vm, size, system_memory(fd), type, 0, &handle), 0);
+
+	return handle;
+}
+
+static uint32_t pxp_bo_create_display(int fd, uint32_t vm, uint64_t size, uint32_t type)
+{
+	uint32_t handle;
+
+	igt_assert_eq(__pxp_bo_create(fd, vm, size, vram_if_possible(fd, 0), type,
+				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
+				      DRM_XE_GEM_CREATE_FLAG_SCANOUT,
+				      &handle), 0);
 
 	return handle;
 }
@@ -166,18 +178,18 @@ static void test_pxp_bo_alloc(int fd, bool pxp_supported)
 	int ret;
 
 	/* BO creation with DRM_XE_PXP_TYPE_NONE must always succeed */
-	ret = __pxp_bo_create(fd, 0, 4096, DRM_XE_PXP_TYPE_NONE, &bo);
+	ret = __pxp_bo_create(fd, 0, 4096, system_memory(fd), DRM_XE_PXP_TYPE_NONE, 0, &bo);
 	igt_assert_eq(ret, 0);
 	gem_close(fd, bo);
 
 	/* BO creation with DRM_XE_PXP_TYPE_HWDRM must only succeed if PXP is supported */
-	ret = __pxp_bo_create(fd, 0, 4096, DRM_XE_PXP_TYPE_HWDRM, &bo);
+	ret = __pxp_bo_create(fd, 0, 4096, system_memory(fd), DRM_XE_PXP_TYPE_HWDRM, 0, &bo);
 	igt_assert_eq(ret, pxp_supported ? 0 : -ENODEV);
 	if (!ret)
 		gem_close(fd, bo);
 
 	/* BO creation with an invalid type must always fail */
-	ret = __pxp_bo_create(fd, 0, 4096, 0xFF, &bo);
+	ret = __pxp_bo_create(fd, 0, 4096, system_memory(fd), 0xFF, 0, &bo);
 	igt_assert_eq(ret, -EINVAL);
 }
 
@@ -808,6 +820,225 @@ static void test_pxp_optout(int fd)
 	__test_pxp_stale_bo_bind(fd, PXP_TERMINATION_IRQ, false);
 }
 
+static void setup_fb(int fd, igt_fb_t *pxp_fb, int width, int height, uint32_t size)
+{
+	/* create an FB using a PXP BO */
+	igt_init_fb(pxp_fb, fd, width, height,
+		    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+
+	igt_calc_fb_size(pxp_fb);
+
+	pxp_fb->gem_handle = pxp_bo_create_display(fd, 0, size, DRM_XE_PXP_TYPE_HWDRM);
+
+	do_or_die(__kms_addfb(pxp_fb->fd, pxp_fb->gem_handle,
+			pxp_fb->width, pxp_fb->height,
+			pxp_fb->drm_format, pxp_fb->modifier,
+			pxp_fb->strides, pxp_fb->offsets, pxp_fb->num_planes, DRM_MODE_FB_MODIFIERS,
+			&pxp_fb->fb_id));
+}
+
+static void setup_protected_fb_from_ref(int fd, igt_fb_t *ref_fb, igt_fb_t *pxp_fb,
+					uint32_t q, uint32_t vm)
+{
+	struct intel_buf *srcbuf, *dstbuf;
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
+	igt_render_copyfunc_t render_copy;
+
+	render_copy = igt_get_render_copyfunc(intel_get_drm_devid(fd));
+	igt_assert(render_copy);
+
+	bops = buf_ops_create(fd);
+	igt_assert(bops);
+
+	/* create an FB using a PXP BO */
+	setup_fb(fd, pxp_fb, ref_fb->width, ref_fb->height, ref_fb->size);
+
+	/* copy the contents of ref_fb into the pxp BO */
+	srcbuf = igt_fb_create_intel_buf(fd, bops, ref_fb, "ref_fb");
+	dstbuf = igt_fb_create_intel_buf(fd, bops, pxp_fb, "pxp_fb");
+	intel_buf_set_pxp(dstbuf, true);
+
+	ibb = intel_bb_create_with_context(fd, q, vm, NULL, 4096);
+	igt_assert(ibb);
+	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, DRM_XE_PXP_HWDRM_DEFAULT_SESSION);
+
+	render_copy(ibb, srcbuf, 0, 0, pxp_fb->width, pxp_fb->height, dstbuf, 0, 0);
+	intel_bb_sync(ibb);
+
+	/* make sure the contents of the BOs don't match */
+	igt_assert_neq(bocmp(fd, pxp_fb->gem_handle, ref_fb->gem_handle, pxp_fb->size), 0);
+
+	intel_bb_destroy(ibb);
+	intel_buf_destroy(srcbuf);
+	intel_buf_destroy(dstbuf);
+	buf_ops_destroy(bops);
+}
+
+static void commit_fb(igt_display_t *display, igt_plane_t *plane, igt_fb_t *fb, drmModeModeInfo *mode)
+{
+	igt_plane_set_fb(plane, fb);
+	igt_fb_set_size(fb, plane, mode->hdisplay, mode->vdisplay);
+	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+}
+
+static void compare_crcs(int fd, igt_display_t *display, igt_fb_t *ref_fb, igt_fb_t *pxp_fb)
+{
+	igt_output_t *output;
+	drmModeModeInfo *mode;
+	igt_plane_t *plane;
+	igt_pipe_t *pipe;
+	igt_pipe_crc_t *pipe_crc;
+	igt_crc_t ref_crc, new_crc;
+
+	for_each_connected_output(display, output) {
+		mode = igt_output_get_mode(output);
+		pipe = &display->pipes[output->pending_pipe];
+		pipe_crc = igt_pipe_crc_new(fd, pipe->pipe,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
+		igt_output_set_pipe(output, pipe->pipe);
+
+		commit_fb(display, plane, ref_fb, mode);
+		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
+
+		commit_fb(display, plane, pxp_fb, mode);
+		igt_pipe_crc_collect_crc(pipe_crc, &new_crc);
+
+		igt_assert_crc_equal(&ref_crc, &new_crc);
+
+		/*
+		 * Testing with one pipe-output combination is sufficient.
+		 * So break the loop.
+		 */
+		break;
+	}
+}
+
+/**
+ * SUBTEST: display-pxp-fb
+ * Description: Test that an encrypted fb is displayed correctly by comparing
+ *              its CRCs with the ones generated by a non-encrypted FB
+ *              containing the same image
+ */
+
+static void test_display_pxp_fb(int fd, igt_display_t *display)
+{
+	igt_output_t *output;
+	drmModeModeInfo *mode;
+	igt_fb_t ref_fb, pxp_fb;
+	igt_plane_t *plane;
+	igt_pipe_t *pipe;
+	int width = 0, height = 0, i = 0;
+	uint32_t q;
+	uint32_t vm;
+
+	vm = xe_vm_create(fd, 0, 0);
+	q = create_pxp_rcs_queue(fd, vm); /* start the PXP session */
+
+	for_each_connected_output(display, output) {
+		mode = igt_output_get_mode(output);
+
+		width = max_t(int, width, mode->hdisplay);
+		height = max_t(int, height, mode->vdisplay);
+	}
+
+	igt_create_color_fb(fd, width, height, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    0, 1, 0, &ref_fb);
+
+	/* Do a modeset on all outputs */
+	for_each_connected_output(display, output) {
+		mode = igt_output_get_mode(output);
+		pipe = &display->pipes[i];
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_require(igt_pipe_connector_valid(i, output));
+		igt_output_set_pipe(output, i);
+
+		commit_fb(display, plane, &ref_fb, mode);
+
+		i++;
+	}
+
+	/* Create an encrypted FB with the same contents as ref_fb */
+	setup_protected_fb_from_ref(fd, &ref_fb, &pxp_fb, q, vm);
+
+	/* Flip both FBs and make sure the CRCs match */
+	compare_crcs(fd, display, &ref_fb, &pxp_fb);
+
+	igt_remove_fb(fd, &ref_fb);
+	igt_remove_fb(fd, &pxp_fb);
+	xe_exec_queue_destroy(fd, q);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: display-black-pxp-fb
+ * Description: Test that an invalid encrypted fb is correctly converted to a
+ *              black screen by comparing its CRCs with the ones generated by a
+ *              non-encrypted FB filled with black
+ */
+
+static void test_display_black_pxp_fb(int fd, igt_display_t *display)
+{
+	igt_output_t *output;
+	drmModeModeInfo *mode;
+	igt_fb_t ref_fb, pxp_fb;
+	igt_plane_t *plane;
+	igt_pipe_t *pipe;
+	int width = 0, height = 0, i = 0;
+	uint32_t q;
+	uint32_t vm;
+
+	vm = xe_vm_create(fd, 0, 0);
+	q = create_pxp_rcs_queue(fd, vm); /* start the PXP session */
+
+	for_each_connected_output(display, output) {
+		mode = igt_output_get_mode(output);
+
+		width = max_t(int, width, mode->hdisplay);
+		height = max_t(int, height, mode->vdisplay);
+	}
+
+	/* create a black fb */
+	igt_create_color_fb(fd, width, height, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    0, 0, 0, &ref_fb);
+
+	/* Do a modeset on all outputs */
+	for_each_connected_output(display, output) {
+		mode = igt_output_get_mode(output);
+		pipe = &display->pipes[i];
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_require(igt_pipe_connector_valid(i, output));
+		igt_output_set_pipe(output, i);
+
+		igt_plane_set_fb(plane, &ref_fb);
+		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
+		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		i++;
+	}
+
+	/* Create an fb filled with a non-black color */
+	setup_fb(fd, &pxp_fb, ref_fb.width, ref_fb.height, ref_fb.size);
+	fill_bo_content(fd, pxp_fb.gem_handle, pxp_fb.size, TSTSURF_INITCOLOR1);
+
+	/* invalidate the BO */
+	trigger_termination(fd, PXP_TERMINATION_IRQ);
+
+	/* Flip both FBs and make sure the CRCs match */
+	compare_crcs(fd, display, &ref_fb, &pxp_fb);
+
+	igt_remove_fb(fd, &ref_fb);
+	igt_remove_fb(fd, &pxp_fb);
+	xe_exec_queue_destroy(fd, q);
+	xe_vm_destroy(fd, vm);
+}
+
 static void require_pxp(bool pxp_supported)
 {
 	igt_require_f(pxp_supported, "PXP not supported\n");
@@ -820,6 +1051,12 @@ static void require_pxp_render(bool pxp_supported, uint32_t devid)
 		      "No rendercopy found for devid=%x\n", devid);
 }
 
+static void require_display(int xe_fd, igt_display_t *display)
+{
+	igt_require_pipe_crc(xe_fd);
+	igt_display_require(display, xe_fd);
+}
+
 static void dpms_on_off(int fd, drmModeResPtr res, int mode)
 {
 	int i;
@@ -961,6 +1198,23 @@ igt_main
 		}
 	}
 
+	igt_subtest_group {
+		igt_display_t display;
+
+		igt_describe("Test the flip of PXP objects to display");
+		igt_subtest("display-pxp-fb") {
+			require_display(xe_fd, &display);
+			require_pxp_render(pxp_supported, devid);
+			test_display_pxp_fb(xe_fd, &display);
+		}
+
+		igt_subtest("display-black-pxp-fb") {
+			require_display(xe_fd, &display);
+			require_pxp_render(pxp_supported, devid);
+			test_display_black_pxp_fb(xe_fd, &display);
+		}
+	}
+
 	igt_fixture {
 		drmModeFreeResources(res);
 		close(xe_fd);
-- 
2.43.0

