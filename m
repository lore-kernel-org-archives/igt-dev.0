Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C953AC5478C
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 17:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5515E10E120;
	Fri,  1 Mar 2024 17:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7U145vG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F20710E120
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709313402; x=1740849402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pkFuNxo99472VMJkjtwELGAitCFsuyWafFLTgmz/AIQ=;
 b=m7U145vGLPNvqacnKRMUFKvpUy9eFCL5gV+zHcjugIRvfXryxge+DYDk
 iveyLZZBAub6ou36G2/lJcCCME3Wgf1w1coGB7uumuVsObS7d1yInvhQn
 qB4ZK7GAANbnGJetOz1yrKyiXqQDopkDv1KEIe12Y953jGYNrlHN3ucwQ
 RF7emivPVhgjTgFrT1kEG3r2t0c1PEskg+HwRZPdpq4YcV/M5f00OiW8M
 vFWeSa9bj0ouD3bKPJC287rn+vOK28JCtMI9+fFvIiS9cu4SxD1nD0Gsl
 otAFcrqAtYiNBQi0LsX6NTJc2UvF9K+N3Sfc5jdGyPtj1grPFbksZL6ea Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="26323426"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; d="scan'208";a="26323426"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:16:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8681345"
Received: from knomani-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.3.163])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 09:16:40 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/xe_pat: verify wb-transient with pipe
 crc
Date: Fri,  1 Mar 2024 17:16:18 +0000
Message-ID: <20240301171618.395851-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240301171618.395851-1-matthew.auld@intel.com>
References: <20240301171618.395851-1-matthew.auld@intel.com>
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

On Xe2 using the L3:XD (wb-transient) caching mode, which is intended
for display use, verify we don't observe display corruption when
rendering unto the display surface. Transient cache entries should be
flushed by the time we do the flip, if not we will detect pipe crc
mismatch vs reference fb.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_pat.c | 121 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 6918ebe7e..bee93ac2f 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -10,6 +10,8 @@
  * Functionality: pat_index
  */
 
+#include <fcntl.h>
+
 #include "igt.h"
 #include "igt_vgem.h"
 #include "intel_blt.h"
@@ -722,6 +724,122 @@ static void prime_external_import_coh(void)
 	drm_close_driver(fd2);
 }
 
+/**
+ * SUBTEST: display-vs-wb-transient
+ * Test category: functionality test
+ * Description: Scanout with dirty L3:XD
+ */
+static void display_vs_wb_transient(int fd)
+{
+	uint16_t pat_index_modes[] = {
+		0, /* UC (baseline) */
+		6, /* L3:XD (uncompressed) */
+	};
+	uint32_t devid = intel_get_drm_devid(fd);
+	igt_render_copyfunc_t render_copy = NULL;
+	igt_crc_t ref_crc = {}, crc = {};
+	igt_plane_t *primary;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_pipe_crc_t *pipe_crc;
+	drmModeModeInfoPtr mode;
+	struct intel_bb *ibb;
+	struct buf_ops *bops;
+	struct igt_fb src_fb, dst_fb;
+	struct intel_buf src, dst;
+	enum pipe pipe;
+	int bpp = 32;
+	int i;
+
+	igt_require(intel_get_device_info(devid)->graphics_ver >= 20);
+
+	render_copy = igt_get_render_copyfunc(devid);
+	igt_require(render_copy);
+	igt_require(xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER));
+
+	igt_display_require(&display, fd);
+	igt_display_require_output(&display);
+	kmstest_set_vt_graphics_mode();
+
+	bops = buf_ops_create(fd);
+	ibb = intel_bb_create(fd, SZ_4K);
+
+	for_each_pipe_with_valid_output(&display, pipe, output) {
+		igt_display_reset(&display);
+
+		igt_output_set_pipe(output, pipe);
+		if (!intel_pipe_output_combo_valid(&display))
+			continue;
+
+		mode = igt_output_get_mode(output);
+		pipe_crc = igt_pipe_crc_new(fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+		break;
+	}
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_create_fb(fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &src_fb);
+	igt_draw_fill_fb(fd, &src_fb, 0xFF);
+
+	igt_plane_set_fb(primary, &src_fb);
+	igt_assert_eq(igt_display_commit2(&display, COMMIT_ATOMIC), 0);
+	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
+
+	intel_buf_init_full(bops, src_fb.gem_handle, &src, src_fb.width,
+			    src_fb.height, bpp, 0, I915_TILING_NONE,
+			    I915_COMPRESSION_NONE, src_fb.size,
+			    src_fb.strides[0], 0, DEFAULT_PAT_INDEX,
+			    DEFAULT_MOCS_INDEX);
+
+	for (i = 0; i < ARRAY_SIZE(pat_index_modes); i++) {
+		int fw_handle;
+
+		igt_create_fb(fd, mode->hdisplay, mode->vdisplay,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &dst_fb);
+
+		intel_buf_init_full(bops, dst_fb.gem_handle, &dst,
+				    dst_fb.width, dst_fb.height, bpp, 0,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE,
+				    dst_fb.size, dst_fb.strides[0], 0,
+				    pat_index_modes[i],
+				    intel_get_deferred_mocs_index(fd));
+
+		/* c0 -> c6 might flush caches */
+		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_assert(fw_handle >= 0);
+
+		render_copy(ibb,
+			    &src,
+			    0, 0, dst_fb.width, dst_fb.height,
+			    &dst,
+			    0, 0);
+		intel_bb_sync(ibb);
+
+		/*
+		 * Display engine is not coherent with GPU/CPU caches, however
+		 * with new L3:XD caching mode, the GPU cache entries marked as
+		 * transient should be automatically flushed by the time we do
+		 * the flip.
+		 */
+
+		igt_plane_set_fb(primary, &dst_fb);
+		igt_assert_eq(igt_display_commit2(&display, COMMIT_ATOMIC), 0);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc);
+
+		igt_assert_crc_equal(&crc, &ref_crc);
+
+		intel_bb_reset(ibb, false);
+
+		intel_buf_close(dst.bops, &dst);
+		igt_remove_fb(fd, &dst_fb);
+		close(fw_handle);
+	}
+
+	igt_remove_fb(fd, &src_fb);
+	intel_bb_destroy(ibb);
+}
+
 static uint8_t get_pat_idx_uc(int fd, bool *compressed)
 {
 	if (compressed)
@@ -1054,6 +1172,9 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 						     ARRAY_SIZE(xe2_pat_index_modes));
 	}
 
+	igt_subtest("display-vs-wb-transient")
+		display_vs_wb_transient(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.43.2

