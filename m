Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003F7EA8130
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BE910E5CF;
	Tue, 10 Feb 2026 16:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpcI8gyI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC3A10E5CE
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770739825; x=1802275825;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kY2SAFleobbyDddQYBB4pi3+2Kn+37FTUEH3nNTEdpY=;
 b=JpcI8gyIvqu8F+D6gwHZZgDo9OE9p2u4Ezbqe1HuwEzjZb/K5uJaPIuQ
 zFhcKD3wT/qYaPB0bfI20EBniNI+lLSVRZrMVoq3rMENBcEPABn79FozN
 7cgQGWKBGy6v/ZTt0iBIgLK0gVJnU2uwZyrdrMYMaOQogaNSkYftczdIW
 z3wipvTKxi8BXRPgie+/kXblCtCs0h86CeNhpR0Izk9fnvLypbjteoPk8
 KO3JDNAin/FVQY2mXWQ5N7MEchxzMqrGO1ndIZOuRjDdGXv+fLmIz4lic
 FDyqVeJlXBDNs1atnK+LJO2Iagx5bFzUFjq/v6EkdY+B1aj/zw7UiSrHr g==;
X-CSE-ConnectionGUID: J4DL021bTUm3fhe2jyvQLA==
X-CSE-MsgGUID: /q+GIWGVQ++ravY4+Kbopg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71770669"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71770669"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:25 -0800
X-CSE-ConnectionGUID: +dR0um59Syaz2j8PS6GtHg==
X-CSE-MsgGUID: eDlf/0uLSwKRA6iYuL/rjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211061293"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.136])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:23 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/5] tests/kms: Clean up display varaibles used for
 igt_crtc_for_pipe()
Date: Tue, 10 Feb 2026 18:10:12 +0200
Message-ID: <20260210161016.29459-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
References: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently the 'display' parameter passed to igt_crtc_for_pipe()
calls is a bit inconsistent. Reuse the local 'display' variable
in case have one, and otherwise try to grab it from out typical
'data' structure.

Having a bit more common structure in the code will help
subsequent cocci cleanups around igt_crtc_for_pipe() usage.

 #include "scripts/iterators.cocci"

@find_data@
type T;
T DATA;
identifier DISPLAY;
@@
igt_display_require(&DATA.DISPLAY, ...);

@@
typedef igt_display_t;
identifier DISPLAY;
expression DISPLAY2;
@@
igt_display_t *DISPLAY = ...;
<+...
- igt_crtc_for_pipe(DISPLAY2
+ igt_crtc_for_pipe(DISPLAY
  ,...)
...+>

@@
typedef igt_display_t;
identifier DISPLAY, FUNC;
expression DISPLAY2;
@@
FUNC(..., igt_display_t *DISPLAY, ...)
{
<+...
- igt_crtc_for_pipe(DISPLAY2
+ igt_crtc_for_pipe(DISPLAY
  ,...)
...+>
}

@depends on find_data@
typedef igt_output_t;
igt_output_t *OUTPUT;
type find_data.T;
identifier find_data.DISPLAY, DATA;
@@
T *DATA = ...;
<+...
- igt_crtc_for_pipe(OUTPUT->display
+ igt_crtc_for_pipe(&DATA->DISPLAY
  ,...)
...+>

@depends on find_data@
typedef igt_output_t;
igt_output_t *OUTPUT;
type find_data.T;
identifier find_data.DISPLAY, DATA, FUNC;
@@
FUNC(..., T *DATA, ...)
{
<+...
- igt_crtc_for_pipe(OUTPUT->display
+ igt_crtc_for_pipe(&DATA->DISPLAY
  ,...)
...+>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_abm.c                        |  4 +--
 tests/amdgpu/amd_bypass.c                     |  2 +-
 tests/amdgpu/amd_color.c                      |  2 +-
 tests/amdgpu/amd_cursor_overlay.c             |  2 +-
 tests/amdgpu/amd_dp_dsc.c                     |  8 +++---
 tests/amdgpu/amd_hotplug.c                    |  2 +-
 tests/amdgpu/amd_mall.c                       |  2 +-
 tests/amdgpu/amd_max_bpc.c                    |  2 +-
 tests/amdgpu/amd_mem_leak.c                   |  2 +-
 tests/amdgpu/amd_mode_switch.c                |  2 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |  2 +-
 tests/amdgpu/amd_odm.c                        |  4 +--
 tests/amdgpu/amd_plane.c                      | 12 ++++-----
 tests/amdgpu/amd_psr.c                        | 14 +++++-----
 tests/amdgpu/amd_replay.c                     |  2 +-
 tests/amdgpu/amd_subvp.c                      |  2 +-
 tests/chamelium/kms_chamelium_helper.c        |  2 +-
 .../kms_chamelium_sharpness_filter.c          |  4 +--
 tests/intel/gem_eio.c                         |  2 +-
 tests/intel/gem_exec_reloc.c                  |  2 +-
 tests/intel/kms_big_fb.c                      |  4 +--
 tests/intel/kms_busy.c                        |  8 +++---
 tests/intel/kms_cdclk.c                       |  6 ++---
 tests/intel/kms_dirtyfb.c                     |  2 +-
 tests/intel/kms_dp_linktrain_fallback.c       |  2 +-
 tests/intel/kms_dsc.c                         |  2 +-
 tests/intel/kms_fb_coherency.c                |  4 +--
 tests/intel/kms_fbc_dirty_rect.c              |  2 +-
 tests/intel/kms_fence_pin_leak.c              |  2 +-
 tests/intel/kms_flip_scaled_crc.c             |  2 +-
 tests/intel/kms_joiner.c                      | 14 +++++-----
 tests/intel/kms_mmap_write_crc.c              |  4 +--
 tests/intel/kms_pipe_b_c_ivb.c                |  4 +--
 tests/intel/kms_pipe_stress.c                 |  2 +-
 tests/intel/kms_pm_lpsp.c                     |  2 +-
 tests/intel/kms_psr2_sf.c                     |  2 +-
 tests/intel/kms_psr2_su.c                     |  2 +-
 tests/intel/kms_pwrite_crc.c                  |  4 +--
 tests/intel/perf_pmu.c                        |  2 +-
 tests/intel/prime_mmap_kms.c                  |  2 +-
 tests/kms_async_flips.c                       |  2 +-
 tests/kms_atomic.c                            |  6 ++---
 tests/kms_atomic_interruptible.c              |  4 +--
 tests/kms_atomic_transition.c                 |  4 +--
 tests/kms_bw.c                                |  2 +-
 tests/kms_color.c                             |  2 +-
 tests/kms_concurrent.c                        |  6 ++---
 tests/kms_content_protection.c                |  2 +-
 tests/kms_cursor_crc.c                        |  8 +++---
 tests/kms_cursor_edge_walk.c                  |  4 +--
 tests/kms_cursor_legacy.c                     |  8 +++---
 tests/kms_display_modes.c                     |  8 +++---
 tests/kms_hdr.c                               |  2 +-
 tests/kms_lease.c                             |  2 +-
 tests/kms_panel_fitting.c                     |  6 ++---
 tests/kms_pipe_crc_basic.c                    | 16 ++++++------
 tests/kms_plane.c                             | 10 +++----
 tests/kms_plane_alpha_blend.c                 |  2 +-
 tests/kms_plane_cursor.c                      |  2 +-
 tests/kms_plane_lowres.c                      |  2 +-
 tests/kms_plane_multiple.c                    |  4 +--
 tests/kms_plane_scaling.c                     | 18 ++++++-------
 tests/kms_properties.c                        |  2 +-
 tests/kms_rmfb.c                              |  4 +--
 tests/kms_rotation_crc.c                      |  8 +++---
 tests/kms_scaling_modes.c                     |  2 +-
 tests/kms_sequence.c                          |  2 +-
 tests/kms_tiled_display.c                     |  2 +-
 tests/kms_universal_plane.c                   | 26 +++++++++----------
 tests/kms_vblank.c                            |  6 ++---
 tests/vmwgfx/vmw_prime.c                      |  4 +--
 tools/amd_hdmi_compliance.c                   |  2 +-
 72 files changed, 162 insertions(+), 162 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index c42436a536cb..f01b4f632e5f 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -131,7 +131,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -268,7 +268,7 @@ static void set_abm_level(data_t *data, igt_output_t *output, int level)
 	igt_assert_eq(close(fd), 0);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    igt_crtc_for_pipe(&data->display, data->pipe_id));
 	igt_plane_set_fb(data->primary, &data->ref_fb);
 	igt_display_commit_atomic(&data->display, 0, 0);
 }
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 61fc7c7c1a2f..3a2bab9dcef0 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -65,7 +65,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	igt_display_reset(display);
 
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index deec53d698fd..ea928b326c8a 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -180,7 +180,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	igt_display_reset(display);
 
diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index 1d8ffcc86e1d..3562fe00f16e 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -390,7 +390,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags, unsigned int
 	}
 
 	igt_output_set_crtc(data->output,
-		igt_crtc_for_pipe(data->output->display, data->pipe_id));
+		igt_crtc_for_pipe(&data->display, data->pipe_id));
 
 	/* Run the test for different cursor spots. */
 	test_cursor_spots(data, size, flags);
diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index a4352a59691b..d02d66def18a 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -135,7 +135,7 @@ static void test_dsc_enable(data_t *data)
 				      0,
 				      &ref_fb);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+				    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
 		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
@@ -283,7 +283,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 				      0,
 				      &ref_fb);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+				    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
 		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
@@ -379,7 +379,7 @@ static void test_dsc_link_settings(data_t *data)
 				      0,
 				      &ref_fb[crtc->pipe]);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+				    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
 		igt_plane_set_fb(data->primary[crtc->pipe],
 				 &ref_fb[crtc->pipe]);
 	}
@@ -506,7 +506,7 @@ static void test_dsc_bpc(data_t *data)
 					      0,
 					      &ref_fb[crtc->pipe]);
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+					    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
 			igt_plane_set_fb(data->primary[crtc->pipe],
 					 &ref_fb[crtc->pipe]);
 		}
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index 3672da047b1a..eff4ec42de00 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -165,7 +165,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 				      DRM_FORMAT_XRGB8888, 0,
 				      &ref_fb[crtc->pipe]);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+				    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
 		igt_plane_set_fb(data->primary[crtc->pipe],
 				 &ref_fb[crtc->pipe]);
 	}
diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index efc4766cc5a8..a8ca107578a7 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -62,7 +62,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	igt_display_reset(display);
 
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index f7ba4ee1f67d..0c30ffbc721d 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -56,7 +56,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	igt_display_reset(display);
 
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index 330f05988d88..ddf7c6d90b25 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -48,7 +48,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	igt_display_reset(display);
 
diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
index 014b0baf6bf3..0843cde573cb 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -113,7 +113,7 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 					    0.f, buffer1[j]);
 		}
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, j));
+				    igt_crtc_for_pipe(&data->display, j));
 		force_output_mode(data, output, kmode);
 		igt_plane_set_fb(data->primary[j], buffer1[j]);
 		drmModeFreeConnector(conn);
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 6b9e933f2f1b..5eb61b54a43d 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -328,7 +328,7 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
 					0, (buf + j));
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, j));
+					    igt_crtc_for_pipe(display, j));
 			igt_plane_set_fb(data->primary[j], (buf + j));
 			j++;
 		}
diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index 0c332d5d4a12..d9e48da1fa98 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -49,7 +49,7 @@ static void test_init(struct data *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -124,7 +124,7 @@ static void run_test_odmc(struct data *data, enum odmc_mode m, const drmModeMode
 			    &buffer);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, i));
+			    igt_crtc_for_pipe(display, i));
 
 	igt_plane_set_fb(data->primary, &buffer);
 
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index da51bc03ae49..296deb898e1d 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -570,7 +570,7 @@ static void test_multi_mpo_invalid(data_t *data)
 	igt_skip_on(!data->overlay2[0]);
 
 	igt_output_set_crtc(data->output[0],
-			    igt_crtc_for_pipe(data->output[0]->display, data->pipe_id[0]));
+			    igt_crtc_for_pipe(display, data->pipe_id[0]));
 
 	igt_create_color_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, 1.0, 1.0, 1.0, &fb[0].test_primary);
 	igt_create_fb(data->fd, w, h, DRM_FORMAT_NV12, 0, &fb[0].test_overlay);
@@ -647,7 +647,7 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
 		}
 
 		igt_output_set_crtc(data->output[n],
-				    igt_crtc_for_pipe(data->output[n]->display, data->pipe_id[n]));
+				    igt_crtc_for_pipe(display, data->pipe_id[n]));
 
 		igt_create_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, &fb[n].ref_primary);
 		igt_create_color_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, 1.0, 1.0, 1.0, &fb[n].ref_primary);
@@ -735,7 +735,7 @@ static void test_mpo_4k(data_t *data)
 			 0.00, 0.00, 0.00, 0.00);
 
 	igt_output_set_crtc(data->output[0],
-			    igt_crtc_for_pipe(data->output[0]->display, data->pipe_id[0]));
+			    igt_crtc_for_pipe(display, data->pipe_id[0]));
 	igt_plane_set_fb(data->primary[0], &r_fb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
@@ -801,9 +801,9 @@ static void test_mpo_swizzle_toggle_multihead(data_t *data)
 
 	/* Initial modeset */
 	igt_output_set_crtc(data->output[0],
-			    igt_crtc_for_pipe(data->output[0]->display, data->pipe_id[0]));
+			    igt_crtc_for_pipe(display, data->pipe_id[0]));
 	igt_output_set_crtc(data->output[1],
-			    igt_crtc_for_pipe(data->output[1]->display, data->pipe_id[1]));
+			    igt_crtc_for_pipe(display, data->pipe_id[1]));
 	force_output_mode(data, data->output[0], &test_mode_1);
 	force_output_mode(data, data->output[1], &test_mode_2);
 
@@ -872,7 +872,7 @@ static void test_mpo_swizzle_toggle(data_t *data)
 
 	/* Initial modeset */
 	igt_output_set_crtc(data->output[0],
-			    igt_crtc_for_pipe(data->output[0]->display, data->pipe_id[0]));
+			    igt_crtc_for_pipe(display, data->pipe_id[0]));
 	force_output_mode(data, data->output[0], &test_mode_1);
 
 	igt_plane_set_fb(data->primary[0], &fb_1920_xb24_linear);
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 736ce371c46f..e4b1a9ed5780 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -172,7 +172,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -373,7 +373,7 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 			    .5, .5, .5, &ref_fb);
 	igt_plane_set_fb(data->primary, &ref_fb);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    igt_crtc_for_pipe(&data->display, data->pipe_id));
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/*
@@ -413,7 +413,7 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 	draw_color_alpha(&data->ov_fb[1], 0, 0, pm_w_scale, pm_h_scale, .5, .5, .5, .0);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    igt_crtc_for_pipe(&data->display, data->pipe_id));
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
 	/* multiplane overlay to emulate video playback use case */
@@ -432,7 +432,7 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 			igt_plane_set_size(data->primary, pm_w_scale, pm_h_scale);
 		}
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+				    igt_crtc_for_pipe(&data->display, data->pipe_id));
 
 		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 		igt_require(ret == 0);
@@ -491,7 +491,7 @@ static void panning_rect_fb(data_t *data, igt_fb_t *rect_fb, int rect_w, int rec
 		igt_plane_set_fb(data->primary, rect_fb);
 		igt_plane_set_size(data->primary, rect_w, rect_h);
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+				    igt_crtc_for_pipe(&data->display, data->pipe_id));
 
 		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 		igt_require(ret == 0);
@@ -518,7 +518,7 @@ static void run_check_psr_su_ffu(data_t *data)
 			    .5, .5, .5, &ref_fb);
 	igt_plane_set_fb(data->primary, &ref_fb);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    igt_crtc_for_pipe(&data->display, data->pipe_id));
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/*
@@ -656,7 +656,7 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 	igt_plane_set_position(data->cursor, 0, 0);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    igt_crtc_for_pipe(&data->display, data->pipe_id));
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/*
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 2cbd34248c25..079916042ab3 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -62,7 +62,7 @@ static void test_init(struct test_data *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	igt_display_reset(display);
 
diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index 989193d68ded..6249490a4e5e 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -141,7 +141,7 @@ static void test_subvp(struct data *data)
 					&rfb);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe_id[crtc->pipe]));
+				    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
 		igt_plane_set_fb(data->primary[crtc->pipe], &rfb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	}
diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms_chamelium_helper.c
index 9eaeb3f769bf..c15a3096c5fe 100644
--- a/tests/chamelium/kms_chamelium_helper.c
+++ b/tests/chamelium/kms_chamelium_helper.c
@@ -153,7 +153,7 @@ igt_output_t *chamelium_prepare_output(chamelium_data_t *data,
 	igt_output_set_crtc(output, NULL);
 
 	pipe = chamelium_get_pipe_for_output(display, output);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	return output;
 }
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index 2d9cb6ccee98..f27b99e4bc30 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -43,7 +43,7 @@ static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 	bool ret = true;
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, pipe));
+			    igt_crtc_for_pipe(&data->display, pipe));
 	if (!intel_pipe_output_combo_valid(&data->display))
 		ret = false;
 	igt_output_set_crtc(data->output, NULL);
@@ -117,7 +117,7 @@ static void test_t(data_t *data, igt_plane_t *primary,
 	bool match[4], match_ok = false;
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    igt_crtc_for_pipe(&data->display, data->pipe_id));
 
 	mode = igt_output_get_mode(data->output);
 	height = mode->hdisplay;
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index 92420d0920e5..09ea3bf6b8cd 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -1042,7 +1042,7 @@ static void display_helper(igt_display_t *dpy, int *done)
 			continue;
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    igt_crtc_for_pipe(dpy, pipe));
 		mode = igt_output_get_mode(output);
 
 		if (fb.width != mode->hdisplay || fb.height != mode->vdisplay) {
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index 9cf6d8201888..c2c5765a543f 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -1518,7 +1518,7 @@ static void scanout(int i915,
 	output = igt_get_single_output_for_pipe(dpy, PIPE_A);
 	igt_require(output);
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, PIPE_A));
+			    igt_crtc_for_pipe(dpy, PIPE_A));
 
 	/*
 	 * Find where the scanout is in our GTT; on !full-ppgtt this will be
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 3946c7c00dfd..20d3a7d200f6 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -538,7 +538,7 @@ static bool test_pipe(data_t *data)
 		      data->format, data->modifier, &data->small_fb);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe));
+			    igt_crtc_for_pipe(&data->display, data->pipe));
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
@@ -598,7 +598,7 @@ max_hw_stride_async_flip_test(data_t *data)
 		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe));
+			    igt_crtc_for_pipe(&data->display, data->pipe));
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index a1878993d848..2c8d365080e1 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -79,7 +79,7 @@ set_fb_on_crtc(igt_display_t *dpy, int pipe,
 	drmModeModeInfoPtr mode;
 	igt_plane_t *primary;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(dpy, pipe));
 	mode = igt_output_get_mode(output);
 
 	igt_create_pattern_fb(dpy->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -164,7 +164,7 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
 		igt_crtc_refresh(igt_crtc_for_pipe(dpy, pipe), true);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    igt_crtc_for_pipe(dpy, pipe));
 		igt_display_commit2(dpy, COMMIT_ATOMIC);
 	}
 
@@ -295,7 +295,7 @@ static void test_hang(igt_display_t *dpy,
 		/* Test modeset enable with hang */
 		igt_plane_set_fb(primary, &fb[0]);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    igt_crtc_for_pipe(dpy, pipe));
 		test_atomic_commit_hang(dpy, primary, &fb[!hang_newfb]);
 	} else {
 		/*
@@ -359,7 +359,7 @@ pipe_output_combo_valid(igt_display_t *dpy,
 
 	igt_display_reset(dpy);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(dpy, pipe));
 	if (!intel_pipe_output_combo_valid(dpy))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 9e912c50f0a4..94b6a36695c8 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -144,7 +144,7 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 		igt_display_reset(display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    igt_crtc_for_pipe(display, pipe));
 		mode = *igt_output_get_highres_mode(output);
 		igt_require_f(is_4k(mode), "Mode >= 4K not found on output %s\n",
 			      igt_output_name(output));
@@ -194,7 +194,7 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	do_cleanup_display(display);
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	mode = igt_output_get_mode(output);
 	mode_lo = *get_lowres_mode(output);
 	mode_hi = *igt_output_get_highres_mode(output);
@@ -294,7 +294,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		height = max(height, mode->vdisplay);
 
 		igt_output_set_crtc(valid_outputs[i],
-				    igt_crtc_for_pipe(valid_outputs[i]->display, i));
+				    igt_crtc_for_pipe(display, i));
 		igt_output_override_mode(valid_outputs[i], &mode_highres[i]);
 	}
 
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 2611884ea8c4..863f9c5f8b18 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -230,7 +230,7 @@ static void prepare(data_t *data)
 	igt_plane_t *primary;
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe));
+			    igt_crtc_for_pipe(&data->display, data->pipe));
 
 	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index fdb5b782cf02..80f1db97ea3c 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -483,7 +483,7 @@ static void test_dsc_sst_fallback(data_t *data)
 				    &data->fb);
 		igt_output_override_mode(data->output, data->mode);
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(data->output->display, data->pipe));
+				    igt_crtc_for_pipe(&data->display, data->pipe));
 		data->primary = igt_output_get_plane_type(data->output,
 						DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(data->primary, &data->fb);
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index e70e0d202628..ab9793f5168a 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -165,7 +165,7 @@ static void update_display(data_t *data, uint32_t test_type)
 	}
 
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
index 2f917e97b792..840da92e2e0e 100644
--- a/tests/intel/kms_fb_coherency.c
+++ b/tests/intel/kms_fb_coherency.c
@@ -48,7 +48,7 @@ static void prepare_crtc(data_t *data)
 	igt_display_reset(display);
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	mode = igt_output_get_mode(output);
 
@@ -65,7 +65,7 @@ static void prepare_crtc(data_t *data)
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index 6c59a32bda16..d3a5273734ad 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -408,7 +408,7 @@ static bool prepare_test(data_t *data)
 
 	data->mode = igt_output_get_mode(data->output);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe));
+			    igt_crtc_for_pipe(&data->display, data->pipe));
 	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index 8dd39e157a95..dc18a3ffa804 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -141,7 +141,7 @@ static void run_single_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(pipe), igt_output_name(output));
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index f7d069309e80..19ae590df929 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -756,7 +756,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	if (modetoset)
 		igt_output_override_mode(output, modetoset);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 41f6126d2d1b..9c5b3d0c366e 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -153,7 +153,7 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 
 	igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe),
 		 kmstest_pipe_name(pipe + 1), output->name);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	return master_pipe;
 }
@@ -167,7 +167,7 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
 		  output->name, mode->hdisplay, mode->vdisplay, mode->vrefresh);
 
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, PIPE_A));
+			    igt_crtc_for_pipe(&data->display, PIPE_A));
 	igt_output_override_mode(output, mode);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
@@ -381,7 +381,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 			igt_assert(kmstest_mode_is_valid(&mode));
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, data->pipe_seq[i + j]));
+					    igt_crtc_for_pipe(&data->display, data->pipe_seq[i + j]));
 			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
 				 kmstest_pipe_name(data->pipe_seq[i + j]),
 				 igt_output_name(output), mode.hdisplay,
@@ -429,7 +429,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 		}
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe_seq[data->n_pipes - 1]));
+				    igt_crtc_for_pipe(&data->display, data->pipe_seq[data->n_pipes - 1]));
 		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
 				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
 				 igt_output_name(output), mode.hdisplay,
@@ -486,7 +486,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 				continue;
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, data->pipe_seq[j]));
+					    igt_crtc_for_pipe(&data->display, data->pipe_seq[j]));
 
 			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay, DRM_FORMAT_XRGB8888,
@@ -508,7 +508,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 							mode1 = igt_output_get_mode(non_ultra_joiner_output);
 
 							igt_output_set_crtc(non_ultra_joiner_output,
-									    igt_crtc_for_pipe(non_ultra_joiner_output->display, data->pipe_seq[k]));
+									    igt_crtc_for_pipe(&data->display, data->pipe_seq[k]));
 							plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 							igt_plane_set_fb(plane, &fb);
@@ -555,7 +555,7 @@ static void test_basic_max_non_joiner(data_t *data)
 		for (pipe = 0; pipe < data->n_pipes; pipe++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
 				igt_output_set_crtc(output,
-						    igt_crtc_for_pipe(output->display, pipe));
+						    igt_crtc_for_pipe(&data->display, pipe));
 				igt_require(max_non_joiner_mode_found(data->drm_fd,
 								      output->config.connector,
 								      max_dotclock, &mode));
diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index c68fd69c402d..329605f30c15 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -189,7 +189,7 @@ static void prepare_crtc(data_t *data)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	mode = igt_output_get_mode(output);
 
@@ -206,7 +206,7 @@ static void prepare_crtc(data_t *data)
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index f6261cb885b9..004676592790 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -102,7 +102,7 @@ disable_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_plane_t *primary;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 	primary = igt_output_get_plane(output, 0);
 	igt_plane_set_fb(primary, NULL);
 	return igt_display_commit(&data->display);
@@ -116,7 +116,7 @@ set_mode_on_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	struct igt_fb fb;
 	int fb_id;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	mode = igt_output_get_mode(output);
 
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 85bff58d6587..4f8d49f87a7b 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -343,7 +343,7 @@ static int commit_mode(struct data *data, igt_output_t *output,
 	int ret;
 
 	igt_output_override_mode(output, mode);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	ret = igt_display_try_commit_atomic(&data->display,
 					    DRM_MODE_ATOMIC_TEST_ONLY |
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 21f299429e23..34039b388c64 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -157,7 +157,7 @@ static bool test_constraint(data_t *data)
 
 	igt_display_reset(&data->display);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe));
+			    igt_crtc_for_pipe(&data->display, data->pipe));
 
 	mode = igt_output_get_mode(data->output);
 
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 6aeda119b3bc..4d754b41ce05 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -413,7 +413,7 @@ static void prepare(data_t *data)
 	}
 
 	igt_output_set_crtc(output,
-		            igt_crtc_for_pipe(output->display, data->pipe));
+		            igt_crtc_for_pipe(&data->display, data->pipe));
 
 	if (data->big_fb_test) {
 		fb_w = data->big_fb_width;
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 39ee3ee17e54..e748ea1eeaa4 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -301,7 +301,7 @@ static int check_psr2_support(data_t *data, enum pipe pipe)
 
 	igt_display_reset(display);
 	output = data->output;
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	prepare(data, output);
 	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2, output);
diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index 4a214d34e53b..4728d252d467 100644
--- a/tests/intel/kms_pwrite_crc.c
+++ b/tests/intel/kms_pwrite_crc.c
@@ -125,7 +125,7 @@ static void prepare_crtc(data_t *data)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	mode = igt_output_get_mode(output);
 
@@ -142,7 +142,7 @@ static void prepare_crtc(data_t *data)
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc for the white fb */
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index f87674f74e8f..91f80f2e0a54 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1051,7 +1051,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	/* create and set the primary plane fb */
 	mode = igt_output_get_mode(output);
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index b263a5822063..74fe05ca9605 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -175,7 +175,7 @@ static void prepare_crtc(gpu_process_t *gpu)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, gpu->pipe));
+			    igt_crtc_for_pipe(display, gpu->pipe));
 
 	mode = igt_output_get_mode(output);
 
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 8539d31efded..b19f5908856d 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -303,7 +303,7 @@ static void test_init(data_t *data)
 	data->refresh_rate = mode->vrefresh;
 
 	igt_output_set_crtc(data->output,
-		            igt_crtc_for_pipe(data->output->display, data->pipe));
+		            igt_crtc_for_pipe(&data->display, data->pipe));
 
 	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	if (data->overlay_path)
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index fa321cc3c7a1..9940f0eda5c8 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -684,7 +684,7 @@ static void test_only(data_t *data, igt_output_t *output, enum pipe pipe, uint32
 			      mode->hdisplay, mode->vdisplay,
 			      format, I915_TILING_NONE, &fb);
 	igt_plane_set_fb(data->primary, &fb);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
@@ -1382,7 +1382,7 @@ static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	drmModeModeInfo *mode;
 	igt_display_reset(&data->display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	data->primary = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, pipe),
 						DRM_PLANE_TYPE_PRIMARY);
@@ -1429,7 +1429,7 @@ pipe_output_combo_valid(igt_display_t *display,
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 8565fc501dc7..9ff43ef4a868 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -130,7 +130,7 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 	igt_display_reset(display);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	plane = igt_output_get_plane_type(output, plane_type);
@@ -313,7 +313,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index e017d58e1f5b..380ba7e96e49 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -144,7 +144,7 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(pipe), igt_output_name(output));
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	mode = igt_output_get_mode(output);
@@ -1097,7 +1097,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 1ff5f9c1ce3a..11f055b23464 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -225,7 +225,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 				    &buffer[i]);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, i));
+				    igt_crtc_for_pipe(display, i));
 
 		igt_plane_set_fb(data->primary[i], &buffer[i]);
 		igt_info("Assigning pipe %s to output %s with mode %s\n",
diff --git a/tests/kms_color.c b/tests/kms_color.c
index a50793651c11..4a9e12e440e7 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -895,7 +895,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		igt_display_reset(&data->display);
 		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, p));
+				    igt_crtc_for_pipe(&data->display, p));
 
 		if (is_intel_device(data->drm_fd) &&
 		    !igt_max_bpc_constraint(&data->display, p, output, 10)) {
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 53768adcc614..1ffec7374e62 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -166,7 +166,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	int i;
 	int format, modifier;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	crtc = primary->crtc;
@@ -287,7 +287,7 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 		drmModeModeInfo *mode_lo;
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    igt_crtc_for_pipe(&data->display, pipe));
 
 		mode_hi = igt_output_get_mode(output);
 		mode_lo = get_lowres_mode(data, mode_hi, output);
@@ -347,7 +347,7 @@ run_tests_for_pipe(data_t *data)
 			igt_display_reset(&data->display);
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    igt_crtc_for_pipe(&data->display, pipe));
 			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 40f9c418d7a5..dc1dd493b6f7 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -892,7 +892,7 @@ test_content_protection_mst(int content_type)
 		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    igt_crtc_for_pipe(display, pipe));
 		prepare_modeset_on_mst_output(output, false);
 		dp_mst_outputs++;
 		if (output_hdcp_capable(output, content_type))
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index d3bd54408efe..c336a32c2c0e 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -579,7 +579,7 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	/* create and set the primary plane fbs */
 	mode = igt_output_get_mode(output);
@@ -605,7 +605,7 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 	/* create the pipe_crc object for this pipe */
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* x/y position where the cursor is still fully visible */
@@ -782,7 +782,7 @@ static bool cursor_size_supported(data_t *data, int w, int h)
 
 	igt_display_reset(display);
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -887,7 +887,7 @@ static bool valid_pipe_output_combo(data_t *data)
 
 	igt_display_reset(display);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	if (intel_pipe_output_combo_valid(display))
 		ret = true;
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 688a2e5c67f3..2a29cd62f408 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -267,7 +267,7 @@ static void prepare_crtc(data_t *data)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	mode = igt_output_get_mode(data->output);
 	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -284,7 +284,7 @@ static void prepare_crtc(data_t *data)
 	data->jump_y = (mode->vdisplay - data->curh) / 2;
 
 	/* create the pipe_crc object for this pipe */
-	data->pipe_crc = igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&data->display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(display, data->pipe),
 						   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc w/o cursor */
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index ad2a15d0f33c..45e9a3949283 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -372,7 +372,7 @@ static void set_fb_on_crtc(igt_display_t *display, enum pipe pipe,
 	drmModeModeInfoPtr mode;
 	igt_plane_t *primary;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	mode = igt_output_get_mode(output);
 
 	igt_create_pattern_fb(display->drm_fd,
@@ -1102,7 +1102,7 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
 		 */
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    igt_crtc_for_pipe(display, pipe));
 		igt_plane_set_fb(cursor, NULL);
 		igt_display_commit_atomic(display, flags, NULL);
 
@@ -1261,7 +1261,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 				/* Commit page flip and modeset simultaneously. */
 				igt_plane_set_fb(plane, &fb_info);
 				igt_output_set_crtc(output2,
-						    igt_crtc_for_pipe(output2->display, enabled ? PIPE_NONE : pipe2));
+						    igt_crtc_for_pipe(display, enabled ? PIPE_NONE : pipe2));
 				enabled = !enabled;
 
 				wait_for_modeset(display, flags, 5, "Scheduling modeset");
@@ -1310,7 +1310,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 				flip_nonblocking(display, pipe2, atomic, &fb2_info, (void*)(ptrdiff_t)vblank_start);
 			} else {
 				igt_output_set_crtc(output2,
-						    igt_crtc_for_pipe(output2->display, enabled ? PIPE_NONE : pipe2));
+						    igt_crtc_for_pipe(display, enabled ? PIPE_NONE : pipe2));
 
 				igt_set_timeout(1, "Scheduling modeset\n");
 				do {
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index fc0ba956e45f..f3888375c966 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -88,18 +88,18 @@ static void run_extendedmode_basic(data_t *data,
 	igt_display_reset(display);
 
 	igt_output_set_crtc(output1,
-			    igt_crtc_for_pipe(output1->display, pipe1));
+			    igt_crtc_for_pipe(display, pipe1));
 	igt_output_set_crtc(output2,
-			    igt_crtc_for_pipe(output2->display, pipe2));
+			    igt_crtc_for_pipe(display, pipe2));
 
 	mode[0] = igt_output_get_mode(output1);
 	mode[1] = igt_output_get_mode(output2);
 
 	igt_assert_f(igt_fit_modes_in_bw(display), "Unable to fit modes in bw\n");
 
-	pipe_crc[0] = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe1),
+	pipe_crc[0] = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe1),
 				       IGT_PIPE_CRC_SOURCE_AUTO);
-	pipe_crc[1] = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe2),
+	pipe_crc[1] = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe2),
 				       IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[0]->vdisplay,
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 738651aefb27..275fcf52cfbc 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -208,7 +208,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	igt_display_t *display = &data->display;
 
 	data->pipe_id = pipe;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 	igt_assert(data->crtc);
 
 	igt_display_reset(display);
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 8c0412d32222..39f5e69440b4 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -161,7 +161,7 @@ static int prepare_crtc(data_t *data, bool is_master)
 		return -ENOENT;
 
 	/* select the pipe we want to use */
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	/* create and set the primary plane fb */
 	mode = igt_output_get_mode(output);
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index f4c2d0697539..ac1ebcf2a63f 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -74,7 +74,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	igt_display_t *display = &data->display;
 
 	igt_output_override_mode(output, mode);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	/* before allocating, free if any older fb */
 	igt_remove_fb(data->drm_fd, &data->fb1);
@@ -109,7 +109,7 @@ test_panel_fitting_legacy(data_t *d, igt_display_t *display,
 	drmModeModeInfo *mode, native_mode;
 	bool is_plane_scaling_active = true;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 	native_mode = *mode;
@@ -202,7 +202,7 @@ test_panel_fitting_fastset(igt_display_t *display, const enum pipe pipe, igt_out
 
 	mode = *igt_output_get_mode(output);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 8cca7e9e40a7..630738bb24f3 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -138,7 +138,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	mode = igt_output_get_mode(output);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -167,7 +167,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 		if (flags & TEST_NONBLOCK) {
 			igt_pipe_crc_t *pipe_crc;
 
-			pipe_crc = igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(&data->display, pipe),
+			pipe_crc = igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(display, pipe),
 							     IGT_PIPE_CRC_SOURCE_AUTO);
 			igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
 			igt_pipe_crc_start(pipe_crc);
@@ -183,7 +183,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 		} else {
 			igt_pipe_crc_t *pipe_crc;
 
-			pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+			pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 						    IGT_PIPE_CRC_SOURCE_AUTO);
 			igt_pipe_crc_start(pipe_crc);
 
@@ -245,7 +245,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 	struct igt_fb fb0, fb1;
 
 	igt_display_reset(display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 
@@ -268,7 +268,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 	igt_plane_set_fb(primary, &fb0);
 	igt_display_commit(display);
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
@@ -298,11 +298,11 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 	igt_crc_t crc[2];
 	igt_plane_t *primary;
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_display_reset(display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd,
@@ -342,7 +342,7 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 2be10f03280a..6bc92c21f832 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -238,7 +238,7 @@ test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 	char *crc_str;
 	int ret;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	primary = igt_output_get_plane(output, 0);
 
@@ -315,7 +315,7 @@ test_plane_position_with_output(data_t *data,
 	igt_debug("Testing connector %s using pipe %s plane %d\n", igt_output_name(output),
 		  kmstest_pipe_name(pipe), plane);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -451,7 +451,7 @@ test_plane_panning_with_output(data_t *data,
 	drmModeModeInfo *mode;
 	igt_crc_t crc;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane(output, 0);
@@ -1277,7 +1277,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &primary_fb);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &primary_fb);
 
@@ -1330,7 +1330,7 @@ static void test_planar_settings(data_t *data)
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
 	igt_require(output);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_display_commit_atomic(&data->display,
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index b46740d32271..8de93c334f66 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -219,7 +219,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	/* create the pipe_crc object for this pipe */
 	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	mode = igt_output_get_mode(output);
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 8095154718bc..770aae770f88 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -280,7 +280,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 
 	igt_plane_set_fb(data->primary, &data->pfb);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
+			    igt_crtc_for_pipe(&data->display, data->pipe_id));
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	test_cursor_spots(data, size, flags);
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index ce0101f76800..bdf0b6d64049 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -303,7 +303,7 @@ static void run_test(data_t *data, uint64_t modifier)
 
 			igt_display_reset(&data->display);
 			igt_output_set_crtc(data->output,
-					    igt_crtc_for_pipe(data->output->display, data->pipe));
+					    igt_crtc_for_pipe(&data->display, data->pipe));
 
 			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index b56ef2d82eed..0f43264c9197 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -143,7 +143,7 @@ get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe, igt_pipe_c
 	int ret;
 
 	igt_display_reset(&data->display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	plane[primary->index] = primary;
@@ -213,7 +213,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **pl
 	int* suffle;
 
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, pipe_id));
+			    igt_crtc_for_pipe(&data->display, pipe_id));
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	crtc = primary->crtc;
 
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 63fbc8c603bb..0ca1aaa0e979 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -726,7 +726,7 @@ test_scaler_with_modifier_pipe(data_t *d,
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	for_each_plane_on_pipe(display, pipe, plane) {
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
@@ -766,7 +766,7 @@ test_scaler_with_rotation_pipe(data_t *d,
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	for_each_plane_on_pipe(display, pipe, plane) {
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
@@ -804,7 +804,7 @@ test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	for_each_plane_on_pipe(display, pipe, plane) {
 		struct igt_vec tested_formats;
@@ -952,7 +952,7 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	for_each_connector_mode(output) {
 		mode = &output->config.connector->modes[j__];
 		igt_output_override_mode(output, mode);
@@ -1099,9 +1099,9 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 		 kmstest_pipe_name(pipe2), igt_output_name(output2));
 
 	igt_output_set_crtc(output1,
-			    igt_crtc_for_pipe(output1->display, pipe1));
+			    igt_crtc_for_pipe(display, pipe1));
 	igt_output_set_crtc(output2,
-			    igt_crtc_for_pipe(output2->display, pipe2));
+			    igt_crtc_for_pipe(display, pipe2));
 
 	igt_require(get_num_scalers(display, pipe1) >= 2);
 	igt_require(get_num_scalers(display, pipe2) >= 2);
@@ -1190,7 +1190,7 @@ static void invalid_parameter_tests(data_t *d)
 		igt_require(output);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    igt_crtc_for_pipe(&d->display, pipe));
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 		igt_require(get_num_scalers(&d->display, pipe) >= 1);
@@ -1287,7 +1287,7 @@ static void intel_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&d->display, pipe));
 
 	/*
 	 * Need to get the mode again, because it may have changed
@@ -1329,7 +1329,7 @@ pipe_output_combo_valid(igt_display_t *display,
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 3d21b79b2392..34bb6ac42618 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -80,7 +80,7 @@ static void prepare_pipe(igt_display_t *display, enum pipe pipe, igt_output_t *o
 	igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), fb);
 
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index e71d1b9a6fc4..aa619ed505b7 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -85,7 +85,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 	int num_active_planes = 0;
 
 	igt_display_reset(display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 
@@ -147,7 +147,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 		drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 		drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ATOMIC, 1);
 
-		igt_crtc_refresh(igt_crtc_for_pipe(&data->display, pipe),
+		igt_crtc_refresh(igt_crtc_for_pipe(display, pipe),
 				 true);
 	} else {
 		igt_remove_fb(data->drm_fd, &fb);
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 4ba6a19b5862..8ba842b9675d 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -299,7 +299,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 
 	cleanup_crtc(data);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	igt_require(intel_pipe_output_combo_valid(display));
 
 	igt_plane_set_rotation(plane, IGT_ROTATION_0);
@@ -312,7 +312,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	 */
 	if (!is_amdgpu_device(data->gfx_fd))
 		igt_display_commit2(display, COMMIT_ATOMIC);
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 				          IGT_PIPE_CRC_SOURCE_AUTO);
 
 	if (!is_amdgpu_device(data->gfx_fd) && start_crc)
@@ -941,7 +941,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		igt_display_reset(display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    igt_crtc_for_pipe(display, pipe));
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
@@ -953,7 +953,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		p[0].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		p[1].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
 
-		data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+		data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 						  IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_start(data->pipe_crc);
 
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index f74db2912561..7f9a031ddcc4 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -62,7 +62,7 @@ static void test_scaling_mode_on_output(igt_display_t *display, const enum pipe
 	struct igt_fb red, blue;
 	int ret;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	mode = *igt_output_get_mode(output);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 7fe314afaf7f..ff1c1338c063 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -106,7 +106,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	/* create and set the primary plane fb */
 	mode = igt_output_get_mode(output);
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 1e3bbfdd51e3..e767c14dfa0f 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -251,7 +251,7 @@ static void setup_mode(data_t *data)
 				conns[count].output = output;
 
 				igt_output_set_crtc(conns[count].output,
-						    igt_crtc_for_pipe(conns[count].output->display, conns[count].pipe));
+						    igt_crtc_for_pipe(&data->display, conns[count].pipe));
 				break;
 			}
 		}
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 33567597fa88..c28a71029f9c 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -99,7 +99,7 @@ functional_test_init(functional_test_t *test, igt_output_t *output, enum pipe pi
 	test->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -261,7 +261,7 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	/* Step 12: Legacy modeset to yellow FB (CRC 8) */
 	igt_plane_set_fb(primary, &test.yellow_fb);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	igt_display_commit2(display, COMMIT_LEGACY);
 	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_8);
 
@@ -349,7 +349,7 @@ sanity_test_init(sanity_test_t *test, igt_output_t *output, enum pipe pipe)
 	data_t *data = test->data;
 	drmModeModeInfo *mode;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -402,7 +402,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int i, ret;
 	int expect = 0;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 	mode = igt_output_get_mode(output);
 
 	sanity_test_init(&test, output, pipe);
@@ -492,7 +492,7 @@ pageflip_test_init(pageflip_test_t *test, igt_output_t *output, enum pipe pipe)
 	data_t *data = test->data;
 	drmModeModeInfo *mode;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -528,7 +528,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	fd_set fds;
 	int ret = 0;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	pageflip_test_init(&test, output, pipe);
 
@@ -550,7 +550,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * Note that crtc->primary->fb = NULL causes flip to return EBUSY for
 	 * historical reasons...
 	 */
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
 				   test.red_fb.fb_id, 0, NULL) == -EBUSY);
 
@@ -565,7 +565,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * completes, which we don't have a good way to specifically test for,
 	 * but at least we can make sure that nothing blows up.
 	 */
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
 				   test.red_fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT,
@@ -642,7 +642,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_require(display->has_cursor_plane);
 	igt_require_intel(data->drm_fd);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	mode = igt_output_get_mode(output);
 
 	/* Count GEM framebuffers before creating our cursor FB's */
@@ -712,7 +712,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * framebuffers can be removed before counting the framebuffer.
 	 */
 	if (is_intel_device(display->drm_fd))
-		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
+		igt_wait_for_vblank_count(igt_crtc_for_pipe(display, pipe),
 					  2);
 
 	/* We should be back to the same framebuffer count as when we started */
@@ -727,7 +727,7 @@ gen9_test_init(gen9_test_t *test, igt_output_t *output, enum pipe pipe)
 	data_t *data = test->data;
 	drmModeModeInfo *mode;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	mode = igt_output_get_mode(output);
 	test->w = mode->hdisplay / 2;
@@ -778,7 +778,7 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	int ret = 0;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
 
 	gen9_test_init(&test, output, pipe);
 
@@ -821,7 +821,7 @@ pipe_output_combo_valid(igt_display_t *display,
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 730a0f052a35..add8b7ec3cbf 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -130,7 +130,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	/* create and set the primary plane fb */
 	mode = igt_output_get_mode(output);
@@ -232,7 +232,7 @@ pipe_output_combo_valid(igt_display_t *display,
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
@@ -447,7 +447,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 
 	if (data->flags & MODESET) {
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, data->pipe));
+				    igt_crtc_for_pipe(display, data->pipe));
 		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
 
diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
index e5aca6169e3b..570bcc993496 100644
--- a/tests/vmwgfx/vmw_prime.c
+++ b/tests/vmwgfx/vmw_prime.c
@@ -204,7 +204,7 @@ static void prepare_crtc(struct gpu_process_t *gpu)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, gpu->pipe));
+			    igt_crtc_for_pipe(display, gpu->pipe));
 
 	mode = igt_output_get_mode(output);
 
@@ -231,7 +231,7 @@ static void prepare_crtc_surface(struct gpu_process_t *gpu)
 
 	/* select the pipe we want to use */
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(output->display, gpu->pipe));
+			    igt_crtc_for_pipe(display, gpu->pipe));
 
 	mode = igt_output_get_mode(output);
 
diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index 6bc2968d827b..ccdfaa410e38 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -385,7 +385,7 @@ static void test_init(data_t *data, int conn_id)
 	igt_display_t *display = &data->display;
 
 	data->pipe_id = PIPE_A;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	igt_display_reset(display);
 
-- 
2.52.0

