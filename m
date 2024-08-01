Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39713C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 06:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0103910E89F;
	Thu,  1 Aug 2024 06:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2nAHNGQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D4B10E89F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722494126; x=1754030126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1sEK8wvVYJXO9vT02Ab3DGGKP990WJfV4biCLtqK+r4=;
 b=l2nAHNGQe5DPEwl3wT+Gr2bmMSIfUlnujky0MV/JHaT1hz8B5U92RioN
 C1hPhmgU/WDybNCHOjXQ6sAG/3lPBdTBl5xxmmPEWhNf93yzPNtsY5ohT
 3VHI5ckTiOhGror+sN+ii2/zxMONFfsG/tWfElKzQfjkteIscbuMEkh5m
 UEUTsLecBv1WpeTsK3I7f2/CBXZ5La+UAhrQAeKgQkd7jVdSCbIxyM5zV
 z2JI15Oh0PZpAFMhXn8wN2i9D/rwNK6PgZs48WkUFGfTCDl7i6fpkagzZ
 kRLgfqekUwVOmhfswo34u6PVeKTW8ecpZ8c+r00IKufoFm8UwuSQ6pXiA g==;
X-CSE-ConnectionGUID: rwAKfcpFSuyRi7aNTPOxJA==
X-CSE-MsgGUID: kP4qXfySQyeMM2Q6EQEMqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31809789"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="31809789"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:35:26 -0700
X-CSE-ConnectionGUID: trXu87XYTM28hzMuDTTd9w==
X-CSE-MsgGUID: Qnrs0YJCRWKgBzY6PC5gcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="59727616"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:35:24 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [i-g-t 3/3] tests/kms: Apply igt.cocci transforms
Date: Thu,  1 Aug 2024 11:56:02 +0530
Message-ID: <20240801062602.2047179-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240801062602.2047179-1-bhanuprakash.modem@intel.com>
References: <20240801062602.2047179-1-bhanuprakash.modem@intel.com>
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

A number of KMS tests are using checks like "igt_assert(x < y)" rather
than using the dedicated comparison assertions that print the actual
values on assertion failure. Run all KMS tests through Coccinelle to
apply these conversions and also apply some other general coding style
cleanup:

       spatch --in-place --sp-file lib/igt.cocci tests/kms_*
       spatch --in-place --sp-file lib/igt.cocci tests/intel/kms_*
       spatch --in-place --sp-file lib/igt.cocci tests/testdisplay*
       spatch --in-place --sp-file lib/igt.cocci tests/fbdev.c

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_big_fb.c      |  2 +-
 tests/intel/kms_busy.c        |  2 +-
 tests/intel/kms_ccs.c         | 14 ++++++--------
 tests/intel/kms_cdclk.c       |  5 ++---
 tests/intel/kms_dsc_helper.c  |  4 ++--
 tests/intel/kms_fbcon_fbt.c   |  3 +--
 tests/intel/kms_pm_dc.c       |  9 ++++-----
 tests/intel/kms_pm_rpm.c      |  2 +-
 tests/intel/kms_psr.c         | 18 +++++++++---------
 tests/kms_async_flips.c       | 22 +++++++++++-----------
 tests/kms_atomic_transition.c |  6 +++---
 tests/kms_cursor_legacy.c     |  2 +-
 tests/kms_dither.c            |  2 +-
 tests/kms_dp_aux_dev.c        |  4 ++--
 tests/kms_hdmi_inject.c       | 12 ++++++------
 tests/kms_lease.c             |  8 ++++----
 tests/kms_plane.c             |  9 +++++----
 tests/kms_plane_multiple.c    |  2 +-
 tests/kms_prime.c             |  6 +++---
 tests/kms_properties.c        |  6 +++---
 tests/kms_setmode.c           |  2 +-
 tests/kms_tiled_display.c     |  2 +-
 tests/kms_vrr.c               |  2 +-
 tests/kms_writeback.c         | 10 +++++-----
 24 files changed, 75 insertions(+), 79 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 605813f7f..b808b4a02 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -307,7 +307,7 @@ static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
 		igt_remove_fb(data->drm_fd, &col_fb);
 	}
 
-	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
+	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
 	newfb->fb_id = f.fb_id;
 }
 
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index db45e286e..5917b888f 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -388,7 +388,7 @@ static void gpu_engines_init_timeouts(int fd, int max_engines,
 
 	*num_engines = 0;
 	for_each_physical_engine(fd, e) {
-		igt_assert(*num_engines < max_engines);
+		igt_assert_lt(*num_engines, max_engines);
 
 		props[*num_engines].engine = *e;
 		props[*num_engines].preempt_timeout = 0;
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index c91370a9a..6b66a06db 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -272,7 +272,7 @@ create_fb_prepare_add(int drm_fd, int width, int height,
 		      igt_fb_t *fb, struct drm_mode_fb_cmd2 *f)
 {
 	igt_create_bo_for_fb(drm_fd, width, height, format, modifier, fb);
-	igt_assert(fb->gem_handle > 0);
+	igt_assert_lt_u32(0, fb->gem_handle);
 
 	addfb_init(fb, f);
 }
@@ -314,7 +314,7 @@ static void check_ccs_plane(int drm_fd, igt_fb_t *fb, int plane)
 		if (*(uint32_t *)(ccs_p + i))
 			break;
 
-	igt_assert(gem_munmap(map, fb->size) == 0);
+	igt_assert_eq(0, gem_munmap(map, fb->size));
 
 	igt_assert_f(i < ccs_size,
 		     "CCS plane %d (for main plane %d) lacks compression meta-data\n",
@@ -348,9 +348,9 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
 		       (uint8_t)(cc_color[1] * 0xff) << 8 |
 		       (uint8_t)(cc_color[2] * 0xff);
 
-	igt_assert(native_color == cc_p[4].d);
+	igt_assert_eq_u32(native_color, cc_p[4].d);
 
-	igt_assert(gem_munmap(map, fb->size) == 0);
+	igt_assert_eq(0, gem_munmap(map, fb->size));
 };
 
 static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float *cc_color, bool check_cc_plane)
@@ -453,7 +453,7 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
 	for (i = 0; i < fb->size; i++)
 		p[i] = rand();
 
-	igt_assert(gem_munmap(map, fb->size) == 0);
+	igt_assert_eq(0, gem_munmap(map, fb->size));
 
 	/* randomize also ccs surface on Xe2 */
 	if (AT_LEAST_GEN(intel_get_drm_devid(drm_fd), 20))
@@ -728,7 +728,6 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	struct drm_mode_fb_cmd2 f = {0};
 	uint64_t modifier;
 	cairo_t *cr;
-	int ret;
 	const float cc_color[4] = {colors[!!data->plane].r,
 				   colors[!!data->plane].g,
 				   colors[!!data->plane].b,
@@ -793,8 +792,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 		}
 	}
 
-	ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
-	igt_assert_eq(ret, 0);
+	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
 
 	if (check_ccs_planes)
 		check_all_ccs_planes(data->drm_fd, fb, cc_color, !(data->flags & TEST_RANDOM));
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 7baf7d98e..6fe6e6c3f 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -236,9 +236,8 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	mode_hi = get_highres_mode(output);
 	igt_require(mode_hi != NULL);
 
-	if (mode_hi->hdisplay == mode_lo->hdisplay &&
-	    mode_hi->vdisplay == mode_lo->vdisplay)
-		igt_skip("Highest and lowest mode resolutions are same; no transition\n");
+	igt_skip_on_f(mode_hi->hdisplay == mode_lo->hdisplay && mode_hi->vdisplay == mode_lo->vdisplay,
+		      "Highest and lowest mode resolutions are same; no transition\n");
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index 58057aca3..0de09b8e9 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -35,7 +35,7 @@ void save_force_dsc_en(int drmfd, igt_output_t *output)
 		igt_is_force_dsc_enabled(drmfd, output->name);
 	force_dsc_restore_fd =
 		igt_get_dsc_debugfs_fd(drmfd, output->name);
-	igt_assert(force_dsc_restore_fd >= 0);
+	igt_assert_lte(0, force_dsc_restore_fd);
 }
 
 void restore_force_dsc_en(void)
@@ -163,7 +163,7 @@ void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output)
 		igt_is_force_dsc_fractional_bpp_enabled(drmfd, output->name);
 	force_dsc_fractional_bpp_restore_fd =
 		igt_get_dsc_fractional_bpp_debugfs_fd(drmfd, output->name);
-	igt_assert(force_dsc_fractional_bpp_restore_fd >= 0);
+	igt_assert_lte(0, force_dsc_fractional_bpp_restore_fd);
 }
 
 void restore_force_dsc_fractional_bpp_en(void)
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 71e42f19c..edf6f8d4e 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -317,8 +317,7 @@ static void fbc_skips_on_fbcon(int debugfs_fd)
 	for (i = 0; skip == false && i < ARRAY_SIZE(reasons); i++)
 		skip = strstr(buf, reasons[i]);
 
-	if (skip)
-		igt_skip("fbcon modeset is not compatible with FBC\n");
+	igt_skip_on_f(skip, "fbcon modeset is not compatible with FBC\n");
 }
 
 static void psr_skips_on_fbcon(int debugfs_fd)
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index e1318bfa6..1aef1e02d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -230,11 +230,10 @@ static uint32_t get_dc_counter(char *dc_data)
 	long ret;
 	char *s = strchr(dc_data, ':');
 
-	assert(s);
+	igt_assert(s);
 	s++;
 	ret = strtol(s, &e, 10);
-	assert(((ret != LONG_MIN && ret != LONG_MAX) || errno != ERANGE) &&
-	       e > s && *e == '\n' && ret >= 0);
+	igt_assert(((ret != LONG_MIN && ret != LONG_MAX) || errno != ERANGE) && e > s && *e == '\n' && ret >= 0);
 	return ret;
 }
 
@@ -611,8 +610,8 @@ static void test_deep_pkgc_state(data_t *data)
 	}
 
 	/* Skip the test if no VRR capable output is found */
-	if (!vrr_supported)
-		igt_skip("No VRR capable output found, skipping the test.\n");
+	igt_skip_on_f(!vrr_supported,
+		      "No VRR capable output found, skipping the test.\n");
 
 	igt_display_reset(display);
 
diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 66c68b902..5af3e81bc 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1527,7 +1527,7 @@ static void pm_test_tiling(void)
 			gem_set_tiling(drm_fd, handles[j],
 					tiling_modes[i], stride);
 			gem_get_tiling(drm_fd, handles[j], &ti, &sw);
-			igt_assert(tiling_modes[i] == ti);
+			igt_assert_eq_u32(tiling_modes[i], ti);
 		}
 
 		enable_one_screen_and_wait(&ms_data);
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index f3caa9ecc..cf0ce4bb8 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -499,27 +499,27 @@ static void fill_render(data_t *data, const struct igt_fb *fb,
 
 static bool psr_wait_entry_if_enabled(data_t *data)
 {
-	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
-		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
-			 data->op_psr_mode);
+	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, data->op_psr_mode),
+		      "enable_psr modparam doesn't allow psr mode %d\n",
+		      data->op_psr_mode);
 
 	return psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output);
 }
 
 static bool psr_wait_update_if_enabled(data_t *data)
 {
-	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
-		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
-			 data->op_psr_mode);
+	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, data->op_psr_mode),
+		      "enable_psr modparam doesn't allow psr mode %d\n",
+		      data->op_psr_mode);
 
 	return psr_wait_update(data->debugfs_fd, data->op_psr_mode, data->output);
 }
 
 static bool psr_enable_if_enabled(data_t *data)
 {
-	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
-		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
-			 data->op_psr_mode);
+	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, data->op_psr_mode),
+		      "enable_psr modparam doesn't allow psr mode %d\n",
+		      data->op_psr_mode);
 
 	return psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, data->output);
 }
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 1c80e9514..5b70c4033 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -147,7 +147,7 @@ static void wait_flip_event(data_t *data)
 		break;
 	case 1:
 		ret = drmHandleEvent(data->drm_fd, &evctx);
-		igt_assert(ret == 0);
+		igt_assert_eq(ret, 0);
 		break;
 	default:
 		/* unexpected */
@@ -275,7 +275,7 @@ static void test_async_flip(data_t *data)
 					      data->bufs[frame % NUM_FBS].fb_id,
 					      flags, data);
 
-			igt_assert(ret == 0);
+			igt_assert_eq(ret, 0);
 
 			wait_flip_event(data);
 
@@ -286,7 +286,7 @@ static void test_async_flip(data_t *data)
 						      data->bufs[frame % NUM_FBS].fb_id,
 						      flags, data);
 
-				igt_assert(ret == 0);
+				igt_assert_eq(ret, 0);
 
 				wait_flip_event(data);
 			}
@@ -298,7 +298,7 @@ static void test_async_flip(data_t *data)
 		if (frame == 1 && data->allow_fail)
 			igt_skip_on(ret == -EINVAL);
 		else
-			igt_assert(ret == 0);
+			igt_assert_eq(ret, 0);
 
 		wait_flip_event(data);
 
@@ -335,7 +335,7 @@ static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int
 	wait_vbl.request.type = DRM_VBLANK_RELATIVE | pipe_id_flag;
 	wait_vbl.request.sequence = 1;
 
-	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl) == 0);
+	do_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl);
 	*vbl_time = wait_vbl.reply.tval_sec * 1000000 + wait_vbl.reply.tval_usec;
 	*seq = wait_vbl.reply.sequence;
 }
@@ -358,7 +358,7 @@ static void test_timestamp(data_t *data)
 			      data->bufs[0].fb_id,
 			      flags, data);
 
-	igt_assert(ret == 0);
+	igt_assert_eq(ret, 0);
 
 	wait_flip_event(data);
 
@@ -368,7 +368,7 @@ static void test_timestamp(data_t *data)
 			      data->bufs[0].fb_id,
 			      flags, data);
 
-	igt_assert(ret == 0);
+	igt_assert_eq(ret, 0);
 
 	wait_flip_event(data);
 
@@ -423,7 +423,7 @@ static void test_cursor(data_t *data)
 			      data->bufs[0].fb_id,
 			      flags, data);
 
-	igt_assert(ret == 0);
+	igt_assert_eq(ret, 0);
 
 	wait_flip_event(data);
 
@@ -459,7 +459,7 @@ static void test_invalid(data_t *data)
 	/* first async flip is expected to allow modifier changes */
 	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id,
 			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
-	igt_assert(ret == 0);
+	igt_assert_eq(ret, 0);
 	wait_flip_event(data);
 
 	/* subsequent async flips should reject modifier changes */
@@ -483,7 +483,7 @@ static void queue_vblank(data_t *data)
 		.request.signal = (long)data,
 	};
 
-	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl) == 0);
+	do_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl);
 }
 
 static void vblank_handler_crc(int fd_, unsigned int sequence, unsigned int tv_sec,
@@ -533,7 +533,7 @@ static void wait_events_crc(data_t *data)
 			break;
 		case 1:
 			ret = drmHandleEvent(data->drm_fd, &evctx);
-			igt_assert(ret == 0);
+			igt_assert_eq(ret, 0);
 			break;
 		default:
 			/* unexpected */
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 89348f435..f4f8afc66 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -522,7 +522,7 @@ static int fd_completed(int fd)
 	int ret;
 
 	ret = poll(&pfd, 1, 0);
-	igt_assert(ret >= 0);
+	igt_assert_lte(0, ret);
 	return ret;
 }
 
@@ -633,8 +633,8 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 			break;
 		}
 
-		if (!ret)
-			igt_skip("Cannot run tests without proper size sprite planes\n");
+		igt_skip_on_f(!ret,
+			      "Cannot run tests without proper size sprite planes\n");
 	}
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5b97028c7..4e2cfde17 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -970,7 +970,7 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 		igt_assert(shared != MAP_FAILED);
 
 		cpu = sched_getcpu();
-		igt_assert(cpu >= 0);
+		igt_assert_lte(0, cpu);
 
 		CPU_ZERO(&mask);
 		CPU_SET(cpu, &mask);
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 21b1210b4..d8255f190 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -95,7 +95,7 @@ static dither_status_t get_dither_state(data_t *data, enum pipe pipe)
 	dither_status_t status;
 
 	dir = igt_debugfs_dir(data->drm_fd);
-	igt_assert(dir >= 0);
+	igt_assert_lte(0, dir);
 
 	igt_require_intel(data->drm_fd);
 
diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index 3e1d8be3a..c8ada3fec 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -80,7 +80,7 @@ static bool test(int drm_fd, uint32_t connector_id)
 	connector = drmModeGetConnectorCurrent(drm_fd, connector_id);
 	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
 	drmModeFreeConnector(connector);
-	igt_assert(dir_fd >= 0);
+	igt_assert_lte(0, dir_fd);
 
 	if (connector->connection != DRM_MODE_CONNECTED &&
 	    is_mst_connector(drm_fd, connector_id)) {
@@ -107,7 +107,7 @@ static bool test(int drm_fd, uint32_t connector_id)
 		snprintf(path, sizeof(path), "/dev/%s", ent->d_name);
 
 		fd = open(path, O_RDONLY);
-		igt_assert(fd >= 0);
+		igt_assert_lte(0, fd);
 
 		ret = read(fd, buf, sizeof(buf));
 		igt_info("%s: %s\n", path,
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index d28be38e4..79dfae40e 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -118,8 +118,8 @@ hdmi_inject_4k(int drm_fd, drmModeConnector *connector)
 	edid = igt_kms_get_4k_edid();
 	kmstest_force_edid(drm_fd, connector, edid);
 
-	if (!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON))
-		igt_skip("Could not force connector on\n");
+	igt_skip_on_f(!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON),
+		      "Could not force connector on\n");
 
 	cid = connector->connector_id;
 
@@ -152,7 +152,7 @@ hdmi_inject_4k(int drm_fd, drmModeConnector *connector)
 			     &connector->connector_id, 1,
 			     &connector->modes[i]);
 
-	igt_assert(ret == 0);
+	igt_assert_eq(ret, 0);
 
 	igt_remove_fb(drm_fd, &fb);
 
@@ -173,8 +173,8 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
 	edid = igt_kms_get_hdmi_audio_edid();
 	kmstest_force_edid(drm_fd, connector, edid);
 
-	if (!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON))
-		igt_skip("Could not force connector on\n");
+	igt_skip_on_f(!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON),
+		      "Could not force connector on\n");
 
 	cid = connector->connector_id;
 	connector = drmModeGetConnectorCurrent(drm_fd, cid);
@@ -197,7 +197,7 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
 			     &connector->modes[0]);
 
 
-	igt_assert(ret == 0);
+	igt_assert_eq(ret, 0);
 
 	/*
 	 * Test if we have /proc/asound/HDMI/eld#0.0 and is its contents are
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 9e56d8b8b..0f3a68fed 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -547,8 +547,8 @@ static void atomic_implicit_crtc(data_t *data)
 		if (strcmp(prop->name, "CRTC_ID") == 0)
 			crtc_id_prop = props->props[i];
 
-		printf("prop name %s, prop id %u, prop id %u\n",
-		       prop->name, props->props[i], prop->prop_id);
+		igt_info("prop name %s, prop id %u, prop id %u\n", prop->name,
+			 props->props[i], prop->prop_id);
 		drmModeFreeProperty(prop);
 		if (crtc_id_prop)
 			break;
@@ -564,7 +564,7 @@ static void atomic_implicit_crtc(data_t *data)
 	igt_assert(req);
 	ret = drmModeAtomicAddProperty(req, data->plane_id,
 				       crtc_id_prop, data->crtc_id);
-	igt_assert(ret >= 0);
+	igt_assert_lte(0, ret);
 
 	/* sanity check */
 	ret = drmModeAtomicCommit(data->master.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
@@ -579,7 +579,7 @@ static void atomic_implicit_crtc(data_t *data)
 	igt_assert(req);
 	ret = drmModeAtomicAddProperty(req, data->connector_id,
 				       crtc_id_prop, data->crtc_id);
-	igt_assert(ret >= 0);
+	igt_assert_lte(0, ret);
 
 	/* sanity check */
 	ret = drmModeAtomicCommit(data->master.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index aac8e3ef0..28df846d3 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -875,10 +875,11 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 		}
 	}
 
-	if (crc_mismatch_count)
-		igt_warn("CRC mismatches with format " IGT_FORMAT_FMT " on %s.%u with %d/%d solid colors tested (0x%X)\n",
-			 IGT_FORMAT_ARGS(format), kmstest_pipe_name(pipe),
-			 plane->index, crc_mismatch_count, data->num_colors, crc_mismatch_mask);
+	igt_warn_on_f(crc_mismatch_count,
+		      "CRC mismatches with format " IGT_FORMAT_FMT " on %s.%u with %d/%d solid colors tested (0x%X)\n",
+		      IGT_FORMAT_ARGS(format), kmstest_pipe_name(pipe),
+		      plane->index, crc_mismatch_count, data->num_colors,
+		      crc_mismatch_mask);
 
 	return result;
 }
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 6bffb1f68..b7922c357 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -317,7 +317,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 	igt_plane_t *plane;
 	int i;
 	int err, c = 0;
-	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
+	int iterations = max(1, opt.iterations);
 	bool loop_forever;
 	char info[256];
 
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 0b5dbf06e..e52eba8cf 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -219,7 +219,7 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
 			    DRM_FORMAT_XRGB8888,
 			    handles, pitches, offsets,
 			    &fb->fb_id, 0);
-	igt_assert(ret == 0);
+	igt_assert_eq(ret, 0);
 }
 
 static void set_fb(struct igt_fb *fb,
@@ -235,7 +235,7 @@ static void set_fb(struct igt_fb *fb,
 	igt_plane_set_fb(primary, fb);
 	ret = igt_display_commit(display);
 
-	igt_assert(ret == 0);
+	igt_assert_eq(ret, 0);
 }
 
 static void collect_crc_for_fb(int importer_fd, struct igt_fb *fb, igt_display_t *display,
@@ -368,7 +368,7 @@ static void kms_poll_state_restore(void)
 {
 	int sysfs_fd;
 
-	igt_assert((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
+	igt_assert_lte(0, (sysfs_fd = open(KMS_HELPER, O_RDONLY)));
 	__igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
 	close(sysfs_fd);
 
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index c0e5be1c9..a93c93ccc 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -136,7 +136,7 @@ static void max_bpc_prop_test(int fd, uint32_t id, uint32_t type, drmModePropert
 			igt_assert_eq(ret, 0);
 		} else {
 			ret = drmModeAtomicAddProperty(req, id, prop_id, i);
-			igt_assert(ret >= 0);
+			igt_assert_lte(0, ret);
 
 			ret = drmModeAtomicCommit(fd, req, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 			igt_assert_eq(ret, 0);
@@ -199,7 +199,7 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
 			igt_assert_eq(ret, 0);
 		} else {
 			ret = drmModeAtomicAddProperty(req, id, prop_id, prop_value);
-			igt_assert(ret >= 0);
+			igt_assert_lte(0, ret);
 
 			ret = drmModeAtomicCommit(fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 			igt_assert_eq(ret, 0);
@@ -384,7 +384,7 @@ static void test_invalid_properties(int fd,
 			igt_assert(req);
 
 			ret = drmModeAtomicAddProperty(req, id1, prop_id, prop_value);
-			igt_assert(ret >= 0);
+			igt_assert_lte(0, ret);
 
 			ret = drmModeAtomicCommit(fd, req, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 			igt_assert_eq(ret, -ENOENT);
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 95c5bfadc..bc7b8fabb 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -862,7 +862,7 @@ static void iterate_combinations(int n, int k, bool allow_repetitions,
 	int v;
 
 	if (!k) {
-		igt_assert(set->count < set->capacity);
+		igt_assert_lt(set->count, set->capacity);
 		set->items[set->count++] = *comb;
 		return;
 	}
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 2c9d63799..ce42b890b 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -564,7 +564,7 @@ static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *
 		DRM_MODE_PAGE_FLIP_EVENT, data);
 	while (!got_all_page_flips(data)) {
 		ret = poll(pfd, 1, 1000);
-		igt_assert(ret == 1);
+		igt_assert_eq(ret, 1);
 		drmHandleEvent(data->drm_fd, drm_event);
 	}
 }
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 7e8885f16..04405c93c 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -263,7 +263,7 @@ get_vrr_range(data_t *data, igt_output_t *output)
 	range_t range;
 
 	fd = igt_debugfs_connector_dir(data->drm_fd, output->name, O_RDONLY);
-	igt_assert(fd >= 0);
+	igt_assert_lte(0, fd);
 
 	res = igt_debugfs_simple_read(fd, "vrr_range", buf, sizeof(buf));
 	igt_require(res > 0);
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 65d4db26b..e1d31bb93 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -136,11 +136,11 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 
 		ret = igt_create_fb(display->drm_fd, width, height,
 				    fourcc[i], modifier, &input_fb);
-		igt_assert(ret >= 0);
+		igt_assert_lte(0, ret);
 
 		ret = igt_create_fb(display->drm_fd, width, height,
 				    fourcc[i], modifier, &output_fb);
-		igt_assert(ret >= 0);
+		igt_assert_lte(0, ret);
 
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(plane, &input_fb);
@@ -293,7 +293,7 @@ static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb, ig
 		ret = do_writeback_test(output, invalid_tests[i].fb_id,
 					invalid_tests[i].out_fence_ptr,
 					invalid_tests[i].ptr_valid);
-		igt_assert(ret != 0);
+		igt_assert_neq(ret, 0);
 	}
 }
 
@@ -308,11 +308,11 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
 
 	/* Zero WRITEBACK_FB_ID */
 	ret = do_writeback_test(output, 0, NULL, false);
-	igt_assert(ret == 0);
+	igt_assert_eq(ret, 0);
 
 	/* Valid output buffer */
 	ret = do_writeback_test(output, valid_fb->fb_id, NULL, false);
-	igt_assert(ret == 0);
+	igt_assert_eq(ret, 0);
 }
 
 static void fill_fb(igt_fb_t *fb, uint32_t pixel)
-- 
2.43.2

