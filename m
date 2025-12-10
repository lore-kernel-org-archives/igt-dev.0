Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECCED3C912
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E127C10E144;
	Wed, 10 Dec 2025 14:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/9q6na9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E14010E144
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765377737; x=1796913737;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=yFeYnhTLDucwigSBbxBk/Bu3PDBYWm7JIeJ14giIKRs=;
 b=C/9q6na9/bXi2pNkXHUXFZpHEWRmp2PGlb6XFS8XWWCN97TvfBzDKJ6Z
 2MR6e0r8/d1zxCN2XnkrrPVVfLlvkwG25MUxl82vN/aBIhTGEvCm9tRkf
 t6XkQKm1/WKxCrurvoKAVk0yreMgFzqgq4/tuT2LTVdRKcfLxyM7KYBIP
 Ds6UAC8GpzM97WFrnL//Bx5fuaefdSV7bb8y4Vhdhf0hzbVZitL2ViYEg
 fD1sO3QJqJf9zt8PbQDYh/6o+7lPVrtd/D+3725LSqccBMlYiXLhAmWbJ
 oIPhuNKyBR2tBbJy4cMEllkcA9UW8/hP+qQXu0E9Bg3a6etJBpf9skmXt A==;
X-CSE-ConnectionGUID: ema0TPTUT+6h4Ln9xi0EFQ==
X-CSE-MsgGUID: 8VC+y8AkQEWsWnKzqjGxBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67308276"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67308276"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:42:16 -0800
X-CSE-ConnectionGUID: yOdJB1AmSz2VmT+EMWUFfQ==
X-CSE-MsgGUID: tC/GKiHHSZOIzlAuFYvq5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="200959837"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:42:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 09/10] lib/kms: Replace igt_output_set_pipe() with
 igt_output_set_crtc()
In-Reply-To: <20251210093903.15934-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-10-ville.syrjala@linux.intel.com>
Date: Wed, 10 Dec 2025 16:42:10 +0200
Message-ID: <994ae9e056d14db5d8a8b1c06fd3b0f15c7776a9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 10 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace all igt_output_set_pipe() uses with igt_output_set_crtc().
> This is one small step towards using 'crtcs' instead of 'pipes'.
>
> The results aren't super pretty as most callers end up doing
> "igt_output_set_crtc(..., igt_crtc_for_pipe(...))" but we'll
> try to clean all that up once all tests get properly weaned
> off 'pipes'.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> @@
> - igt_output_set_pipe(...) { ... }
>
> @@
> expression OUTPUT, PIPE;
> igt_pipe_t *CRTC;
> igt_plane_t *PLANE;
> @@
> (
> - igt_output_set_pipe(OUTPUT, PIPE_NONE)
> + igt_output_set_crtc(OUTPUT, NULL)
> |
> - igt_output_set_pipe(OUTPUT, PLANE->pipe->pipe)
> + igt_output_set_crtc(OUTPUT, PLANE->pipe)
> |
> - igt_output_set_pipe(OUTPUT, CRTC->pipe)
> + igt_output_set_crtc(OUTPUT, CRTC)
> |
> - igt_output_set_pipe(OUTPUT, PIPE)
> + igt_output_set_crtc(OUTPUT, igt_crtc_for_pipe(OUTPUT->display, PIPE))
> )
>
> @@
> identifier CRTC;
> expression DISPLAY1, DISPLAY2, PIPE;
> @@
> CRTC =3D igt_crtc_for_pipe(DISPLAY1, PIPE)
> <+...
> - igt_crtc_for_pipe(DISPLAY2, PIPE)
> + CRTC
> ...+>
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

On the condition that igt_crtc_for_pipe() is modified to return NULL for
PIPE_NONE,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  benchmarks/kms_fb_stress.c                    |  3 +-
>  lib/igt_kms.c                                 | 18 +------
>  lib/igt_kms.h                                 |  1 -
>  tests/amdgpu/amd_abm.c                        |  6 ++-
>  tests/amdgpu/amd_assr.c                       |  5 +-
>  tests/amdgpu/amd_bypass.c                     |  3 +-
>  tests/amdgpu/amd_color.c                      |  3 +-
>  tests/amdgpu/amd_dp_dsc.c                     | 12 +++--
>  tests/amdgpu/amd_freesync_video_mode.c        |  5 +-
>  tests/amdgpu/amd_hotplug.c                    |  3 +-
>  tests/amdgpu/amd_ilr.c                        |  5 +-
>  tests/amdgpu/amd_link_settings.c              |  5 +-
>  tests/amdgpu/amd_mall.c                       |  3 +-
>  tests/amdgpu/amd_max_bpc.c                    |  3 +-
>  tests/amdgpu/amd_mem_leak.c                   |  3 +-
>  tests/amdgpu/amd_mode_switch.c                |  3 +-
>  tests/amdgpu/amd_multidisplay_modeset.c       |  5 +-
>  tests/amdgpu/amd_odm.c                        |  6 ++-
>  tests/amdgpu/amd_plane.c                      | 18 ++++---
>  tests/amdgpu/amd_psr.c                        | 23 +++++---
>  tests/amdgpu/amd_replay.c                     |  3 +-
>  tests/amdgpu/amd_subvp.c                      |  3 +-
>  tests/chamelium/kms_chamelium_color.c         | 16 +++---
>  tests/chamelium/kms_chamelium_edid.c          |  5 +-
>  tests/chamelium/kms_chamelium_helper.c        | 11 ++--
>  tests/chamelium/kms_chamelium_hpd.c           |  8 +--
>  .../kms_chamelium_sharpness_filter.c          | 10 ++--
>  tests/drm_read.c                              |  3 +-
>  tests/intel/gem_eio.c                         |  3 +-
>  tests/intel/gem_exec_reloc.c                  |  3 +-
>  tests/intel/gem_pxp.c                         |  5 +-
>  tests/intel/kms_big_fb.c                      | 11 ++--
>  tests/intel/kms_busy.c                        | 20 +++----
>  tests/intel/kms_ccs.c                         |  3 +-
>  tests/intel/kms_cdclk.c                       | 15 +++---
>  tests/intel/kms_dirtyfb.c                     |  8 +--
>  tests/intel/kms_dp_linktrain_fallback.c       |  6 ++-
>  tests/intel/kms_draw_crc.c                    |  3 +-
>  tests/intel/kms_dsc.c                         |  5 +-
>  tests/intel/kms_fb_coherency.c                |  8 +--
>  tests/intel/kms_fbc_dirty_rect.c              |  5 +-
>  tests/intel/kms_fence_pin_leak.c              |  7 +--
>  tests/intel/kms_flip_scaled_crc.c             | 10 ++--
>  tests/intel/kms_flip_tiling.c                 |  5 +-
>  tests/intel/kms_frontbuffer_tracking.c        | 24 ++++++---
>  tests/intel/kms_joiner.c                      | 20 ++++---
>  tests/intel/kms_joiner_helper.c               |  6 ++-
>  tests/intel/kms_mmap_write_crc.c              |  8 +--
>  tests/intel/kms_pipe_b_c_ivb.c                |  6 +--
>  tests/intel/kms_pipe_stress.c                 |  2 +-
>  tests/intel/kms_pm_backlight.c                |  7 +--
>  tests/intel/kms_pm_dc.c                       |  8 +--
>  tests/intel/kms_pm_lpsp.c                     |  7 +--
>  tests/intel/kms_pm_rpm.c                      |  3 +-
>  tests/intel/kms_psr.c                         |  5 +-
>  tests/intel/kms_psr2_sf.c                     | 11 ++--
>  tests/intel/kms_psr2_su.c                     |  8 +--
>  tests/intel/kms_psr_stress_test.c             |  5 +-
>  tests/intel/kms_pwrite_crc.c                  |  8 +--
>  tests/intel/kms_sharpness_filter.c            |  5 +-
>  tests/intel/perf_pmu.c                        |  5 +-
>  tests/intel/prime_mmap_kms.c                  |  5 +-
>  tests/intel/xe_pat.c                          |  3 +-
>  tests/intel/xe_pxp.c                          |  8 +--
>  tests/kms_async_flips.c                       |  6 ++-
>  tests/kms_atomic.c                            | 12 ++---
>  tests/kms_atomic_interruptible.c              | 10 ++--
>  tests/kms_atomic_transition.c                 | 35 +++++++------
>  tests/kms_bw.c                                |  3 +-
>  tests/kms_color.c                             | 23 ++++----
>  tests/kms_color_helper.c                      |  5 +-
>  tests/kms_colorop.c                           |  3 +-
>  tests/kms_concurrent.c                        | 12 +++--
>  tests/kms_content_protection.c                |  8 +--
>  tests/kms_cursor_crc.c                        | 15 +++---
>  tests/kms_cursor_edge_walk.c                  |  8 +--
>  tests/kms_cursor_legacy.c                     | 52 ++++++++++---------
>  tests/kms_debugfs.c                           |  5 +-
>  tests/kms_display_modes.c                     | 16 +++---
>  tests/kms_dither.c                            |  9 ++--
>  tests/kms_feature_discovery.c                 |  6 ++-
>  tests/kms_flip_event_leak.c                   |  5 +-
>  tests/kms_hdr.c                               | 13 +++--
>  tests/kms_invalid_mode.c                      |  3 +-
>  tests/kms_lease.c                             |  7 +--
>  tests/kms_multipipe_modeset.c                 | 10 ++--
>  tests/kms_panel_fitting.c                     |  6 +--
>  tests/kms_pipe_crc_basic.c                    | 16 +++---
>  tests/kms_plane.c                             | 21 ++++----
>  tests/kms_plane_alpha_blend.c                 |  5 +-
>  tests/kms_plane_cursor.c                      |  6 ++-
>  tests/kms_plane_lowres.c                      |  5 +-
>  tests/kms_plane_multiple.c                    | 20 ++++---
>  tests/kms_plane_scaling.c                     | 32 +++++++-----
>  tests/kms_prime.c                             |  3 +-
>  tests/kms_properties.c                        | 18 ++++---
>  tests/kms_rmfb.c                              |  7 +--
>  tests/kms_rotation_crc.c                      | 13 +++--
>  tests/kms_scaling_modes.c                     |  5 +-
>  tests/kms_sequence.c                          |  8 +--
>  tests/kms_tiled_display.c                     |  6 +--
>  tests/kms_universal_plane.c                   | 42 +++++++--------
>  tests/kms_vblank.c                            | 14 ++---
>  tests/kms_vrr.c                               |  7 +--
>  tests/kms_writeback.c                         |  5 +-
>  tests/nouveau_crc.c                           |  5 +-
>  tests/vmwgfx/vmw_prime.c                      |  8 +--
>  tools/amd_hdmi_compliance.c                   |  3 +-
>  tools/intel_pm_rpm.c                          |  2 +-
>  109 files changed, 574 insertions(+), 412 deletions(-)
>
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index 49ca5c7239d7..4bc23eb4bbd9 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -166,7 +166,8 @@ int igt_simple_main()
>  		igt_debug("Selecting pipe %s to %s\n",
>  			  kmstest_pipe_name(pipe),
>  			  igt_output_name(data.wb_output));
> -		igt_output_set_pipe(data.wb_output, pipe);
> +		igt_output_set_crtc(data.wb_output,
> +				    igt_crtc_for_pipe(data.wb_output->display, pipe));
>  		break;
>  	}
>=20=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 40c521b3a331..082b126f8a49 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3412,7 +3412,7 @@ void igt_modeset_disable_all_outputs(igt_display_t =
*display)
>  	for (i =3D 0; i < display->n_outputs; i++) {
>  		igt_output_t *output =3D &display->outputs[i];
>=20=20
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  	}
>=20=20
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> @@ -5336,20 +5336,6 @@ void igt_output_set_crtc(igt_output_t *output, igt=
_pipe_t *pipe_obj)
>  	}
>  }
>=20=20
> -/**
> - * igt_output_set_pipe:
> - * @output: Target output for which the pipe is being set to
> - * @pipe_obj: Display pipe to set to
> - *
> - * This function sets a @pipe to a specific @output connector by
> - * setting the CRTC_ID property of the @pipe. The pipe
> - * is only activated for all pipes except PIPE_NONE.
> - */
> -void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
> -{
> -	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
> -}
> -
>  static
>  bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
>  						  igt_output_t *outputs[IGT_MAX_PIPES],
> @@ -7913,7 +7899,7 @@ void igt_detach_crtc(igt_display_t *display, igt_ou=
tput_t *output)
>  	if (igt_get_writeback_fb_id(output) =3D=3D 0)
>  		return;
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  }
>=20=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 9ec0f08ada24..8f257c86d88f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -590,7 +590,6 @@ drmModeModeInfo *igt_output_get_lowres_mode(igt_outpu=
t_t *output);
>  void igt_output_override_mode(igt_output_t *output, const drmModeModeInf=
o *mode);
>  int igt_output_preferred_vrefresh(igt_output_t *output);
>  void igt_output_set_crtc(igt_output_t *output, igt_pipe_t *pipe_obj);
> -void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
>  igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx);
>  igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_t=
ype);
>  int igt_output_count_plane_type(igt_output_t *output, int plane_type);
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 9be5cfe8efc1..00560ce3ac00 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -146,7 +146,8 @@ static void test_init(data_t *data)
>  	data->primary =3D
>  		 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> @@ -266,7 +267,8 @@ static void set_abm_level(data_t *data, igt_output_t =
*output, int level)
>=20=20
>  	igt_assert_eq(close(fd), 0);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>  	igt_plane_set_fb(data->primary, &data->ref_fb);
>  	igt_display_commit_atomic(&data->display, 0, 0);
>  }
> diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
> index ebd6654ee2a1..976582ade9eb 100644
> --- a/tests/amdgpu/amd_assr.c
> +++ b/tests/amdgpu/amd_assr.c
> @@ -171,7 +171,8 @@ static void present_visual_pattern(data_t *data, igt_=
output_t *output)
>  	pipe =3D igt_crtc_for_pipe(&data->display, PIPE_A);
>  	primary =3D
>  		igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -	igt_output_set_pipe(output, PIPE_A);
> +	igt_output_set_crtc(output,
> +			    pipe);
>=20=20
>  	igt_create_fb(data->fd, mode->hdisplay, mode->vdisplay,
>  			DRM_FORMAT_XRGB8888, 0, &fb);
> @@ -188,7 +189,7 @@ static void present_visual_pattern(data_t *data, igt_=
output_t *output)
>=20=20
>  	igt_plane_set_fb(primary, NULL);
>  	igt_remove_fb(data->fd, &fb);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
>=20=20
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 40828fa52b1f..460e69dfa7c1 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -92,7 +92,8 @@ static void test_init(data_t *data)
>  	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe_id,
>  					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  	data->width =3D data->mode->hdisplay;
>  	data->height =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index fcfbe48d1eeb..422b111768c0 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -196,7 +196,8 @@ static void test_init(data_t *data)
>  	data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index fe40d0901548..b1809b65aa0e 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -133,7 +133,8 @@ static void test_dsc_enable(data_t *data)
>  				      DRM_FORMAT_XRGB8888,
>  				      0,
>  				      &ref_fb);
> -		igt_output_set_pipe(output, data->pipe_id[i]);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
>  		igt_plane_set_fb(data->primary[i], &ref_fb);
>  		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>=20=20
> @@ -279,7 +280,8 @@ static void test_dsc_slice_dimensions_change(data_t *=
data)
>  				      DRM_FORMAT_XRGB8888,
>  				      0,
>  				      &ref_fb);
> -		igt_output_set_pipe(output, data->pipe_id[i]);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
>  		igt_plane_set_fb(data->primary[i], &ref_fb);
>  		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>=20=20
> @@ -369,7 +371,8 @@ static void test_dsc_link_settings(data_t *data)
>  				      DRM_FORMAT_XRGB8888,
>  				      0,
>  				      &ref_fb[i]);
> -		igt_output_set_pipe(output, data->pipe_id[i]);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
>  		igt_plane_set_fb(data->primary[i], &ref_fb[i]);
>  	}
>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> @@ -489,7 +492,8 @@ static void test_dsc_bpc(data_t *data)
>  					      DRM_FORMAT_XRGB8888,
>  					      0,
>  					      &ref_fb[i]);
> -			igt_output_set_pipe(output, data->pipe_id[i]);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
>  			igt_plane_set_fb(data->primary[i], &ref_fb[i]);
>  		}
>=20=20
> diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_fr=
eesync_video_mode.c
> index 4db975e26347..c1a3e8161304 100644
> --- a/tests/amdgpu/amd_freesync_video_mode.c
> +++ b/tests/amdgpu/amd_freesync_video_mode.c
> @@ -750,7 +750,7 @@ static void init_data(data_t *data, igt_output_t *out=
put)
>  static void finish_test(data_t *data, enum pipe pipe, igt_output_t *outp=
ut)
>  {
>  	igt_plane_set_fb(data->primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_output_override_mode(output, NULL);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
> @@ -847,7 +847,8 @@ run_test(data_t *data, uint32_t scene)
>  		for_each_pipe(&data->display, pipe)
>  			if (igt_pipe_connector_valid(pipe, output)) {
>  				igt_display_reset(&data->display);
> -				igt_output_set_pipe(output, pipe);
> +				igt_output_set_crtc(output,
> +						    igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
>  				mode_transition(data, pipe, output, scene);
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index d80eb65bd263..71c859799f74 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -161,7 +161,8 @@ static void test_hotplug_basic(data_t *data, bool sus=
pend)
>=20=20
>  		igt_create_pattern_fb(data->fd, data->w[i], data->h[i],
>  				      DRM_FORMAT_XRGB8888, 0, &ref_fb[i]);
> -		igt_output_set_pipe(output, data->pipe_id[i]);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
>  		igt_plane_set_fb(data->primary[i], &ref_fb[i]);
>  	}
>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
> index 5875dc36d69b..16ef6ffe40f1 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -73,7 +73,7 @@ static void set_all_output_pipe_to_none(data_t *data)
>  	igt_output_t *output;
>=20=20
>  	for_each_connected_output(&data->display, output) {
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  	}
>=20=20
>  	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET=
, NULL);
> @@ -103,7 +103,8 @@ static void test_init(data_t *data, igt_output_t *out=
put)
>  	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe_id,
>  					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
>=20=20
> -	igt_output_set_pipe(output, data->pipe_id);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, data->pipe_id));
>=20=20
>  	data->primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
>  }
> diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_set=
tings.c
> index 6e6037ae5fbc..3ea4168f93ed 100644
> --- a/tests/amdgpu/amd_link_settings.c
> +++ b/tests/amdgpu/amd_link_settings.c
> @@ -75,7 +75,7 @@ static void set_all_output_pipe_to_none(data_t *data)
>  	igt_output_t *output;
>=20=20
>  	for_each_connected_output(&data->display, output) {
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  	}
>=20=20
>  	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET=
, NULL);
> @@ -102,7 +102,8 @@ static void test_init(data_t *data, igt_output_t *out=
put)
>=20=20
>  	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
> -	igt_output_set_pipe(output, data->pipe_id);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, data->pipe_id));
>=20=20
>  	data->primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
>  }
> diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
> index 27589b865a53..a1a04d0ea9c3 100644
> --- a/tests/amdgpu/amd_mall.c
> +++ b/tests/amdgpu/amd_mall.c
> @@ -88,7 +88,8 @@ static void test_init(data_t *data)
>  	data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
> index 9771c67338c7..bb362926c6b9 100644
> --- a/tests/amdgpu/amd_max_bpc.c
> +++ b/tests/amdgpu/amd_max_bpc.c
> @@ -85,7 +85,8 @@ static void test_init(data_t *data)
>  	data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
> index 1b6b2b730c5b..ef2b59be4a1c 100644
> --- a/tests/amdgpu/amd_mem_leak.c
> +++ b/tests/amdgpu/amd_mem_leak.c
> @@ -67,7 +67,8 @@ static void test_init(data_t *data)
>  	data->primary =3D
>  		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switc=
h.c
> index c443578f5f09..d142873e9372 100644
> --- a/tests/amdgpu/amd_mode_switch.c
> +++ b/tests/amdgpu/amd_mode_switch.c
> @@ -112,7 +112,8 @@ static void run_mode_switch_first_last(data_t *data, =
int num_pipes)
>  					    DRM_FORMAT_MOD_NONE, 1.f, 0.f,
>  					    0.f, buffer1[j]);
>  		}
> -		igt_output_set_pipe(output, j);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, j));
>  		force_output_mode(data, output, kmode);
>  		igt_plane_set_fb(data->primary[j], buffer1[j]);
>  		drmModeFreeConnector(conn);
> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_m=
ultidisplay_modeset.c
> index 91455ed1dfb8..94bc99f4143f 100644
> --- a/tests/amdgpu/amd_multidisplay_modeset.c
> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
> @@ -134,7 +134,7 @@ static void set_all_output_pipe_to_none(struct data_t=
 *data)
>  	igt_output_t *output;
>=20=20
>  	for_each_connected_output(&data->display, output) {
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  	}
>=20=20
>  	igt_display_commit_atomic(&data->display,
> @@ -329,7 +329,8 @@ static void multiple_display_test(struct data_t *data=
, enum sub_test test_mode)
>  					kmode->vdisplay, DRM_FORMAT_XRGB8888,
>  					0, (buf + j));
>=20=20
> -			igt_output_set_pipe(output, j);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, j));
>  			igt_plane_set_fb(data->primary[j], (buf + j));
>  			j++;
>  		}
> diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
> index 483b30e8ac8f..0e0a55396b73 100644
> --- a/tests/amdgpu/amd_odm.c
> +++ b/tests/amdgpu/amd_odm.c
> @@ -77,7 +77,8 @@ static void test_init(struct data *data)
>  		      "ODM Combine isn't supported on HDMI 1.x\n");
>=20=20
>  	data->primary =3D igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PR=
IMARY);
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  	igt_display_reset(display);
>  }
> @@ -121,7 +122,8 @@ static void run_test_odmc(struct data *data, enum odm=
c_mode m, const drmModeMode
>  			    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
>  			    &buffer);
>=20=20
> -	igt_output_set_pipe(data->output, i);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, i));
>=20=20
>  	igt_plane_set_fb(data->primary, &buffer);
>=20=20
> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
> index 0dbac17a6e7f..cb1fcab930e3 100644
> --- a/tests/amdgpu/amd_plane.c
> +++ b/tests/amdgpu/amd_plane.c
> @@ -566,7 +566,8 @@ static void test_multi_mpo_invalid(data_t *data)
>  	/* Skip test if we don't have 2 overlay planes */
>  	igt_skip_on(!data->overlay2[0]);
>=20=20
> -	igt_output_set_pipe(data->output[0], data->pipe_id[0]);
> +	igt_output_set_crtc(data->output[0],
> +			    igt_crtc_for_pipe(data->output[0]->display, data->pipe_id[0]));
>=20=20
>  	igt_create_color_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, 1.0, 1.0, 1=
.0, &fb[0].test_primary);
>  	igt_create_fb(data->fd, w, h, DRM_FORMAT_NV12, 0, &fb[0].test_overlay);
> @@ -641,7 +642,8 @@ static void test_display_mpo(data_t *data, enum test =
test, uint32_t format, int
>  			h =3D data->h[n] =3D test_mode_3.vdisplay;
>  		}
>=20=20
> -		igt_output_set_pipe(data->output[n], data->pipe_id[n]);
> +		igt_output_set_crtc(data->output[n],
> +				    igt_crtc_for_pipe(data->output[n]->display, data->pipe_id[n]));
>=20=20
>  		igt_create_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, &fb[n].ref_prima=
ry);
>  		igt_create_color_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, 1.0, 1.0, =
1.0, &fb[n].ref_primary);
> @@ -728,7 +730,8 @@ static void test_mpo_4k(data_t *data)
>  	draw_color_alpha(&o_fb, cutout_x, cutout_y, cutout_w, cutout_h,
>  			 0.00, 0.00, 0.00, 0.00);
>=20=20
> -	igt_output_set_pipe(data->output[0], data->pipe_id[0]);
> +	igt_output_set_crtc(data->output[0],
> +			    igt_crtc_for_pipe(data->output[0]->display, data->pipe_id[0]));
>  	igt_plane_set_fb(data->primary[0], &r_fb);
>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>=20=20
> @@ -793,8 +796,10 @@ static void test_mpo_swizzle_toggle_multihead(data_t=
 *data)
>  	test_init(data);
>=20=20
>  	/* Initial modeset */
> -	igt_output_set_pipe(data->output[0], data->pipe_id[0]);
> -	igt_output_set_pipe(data->output[1], data->pipe_id[1]);
> +	igt_output_set_crtc(data->output[0],
> +			    igt_crtc_for_pipe(data->output[0]->display, data->pipe_id[0]));
> +	igt_output_set_crtc(data->output[1],
> +			    igt_crtc_for_pipe(data->output[1]->display, data->pipe_id[1]));
>  	force_output_mode(data, data->output[0], &test_mode_1);
>  	force_output_mode(data, data->output[1], &test_mode_2);
>=20=20
> @@ -862,7 +867,8 @@ static void test_mpo_swizzle_toggle(data_t *data)
>  	test_init(data);
>=20=20
>  	/* Initial modeset */
> -	igt_output_set_pipe(data->output[0], data->pipe_id[0]);
> +	igt_output_set_crtc(data->output[0],
> +			    igt_crtc_for_pipe(data->output[0]->display, data->pipe_id[0]));
>  	force_output_mode(data, data->output[0], &test_mode_1);
>=20=20
>  	igt_plane_set_fb(data->primary[0], &fb_1920_xb24_linear);
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index 789d243f8e86..9071a2e9d780 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -196,7 +196,8 @@ static void test_init(data_t *data)
>  	data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> @@ -330,7 +331,7 @@ static void run_check_psr(data_t *data, bool test_nul=
l_crtc) {
>  			if (output->config.connector->connector_type !=3D DRM_MODE_CONNECTOR_=
DisplayPort)
>  				continue;
>=20=20
> -			igt_output_set_pipe(output, PIPE_NONE);
> +			igt_output_set_crtc(output, NULL);
>  			igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		}
>  	}
> @@ -371,7 +372,8 @@ static void run_check_psr_su_mpo(data_t *data, bool s=
caling, float scaling_ratio
>  	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, DR=
M_FORMAT_MOD_LINEAR,
>  			    .5, .5, .5, &ref_fb);
>  	igt_plane_set_fb(data->primary, &ref_fb);
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>  	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET=
, NULL);
>=20=20
>  	/*
> @@ -410,7 +412,8 @@ static void run_check_psr_su_mpo(data_t *data, bool s=
caling, float scaling_ratio
>  	draw_color_alpha(&data->ov_fb[0], 0, 0, data->pfb_w, data->pfb_h, .5, .=
5, .5, .0);
>  	draw_color_alpha(&data->ov_fb[1], 0, 0, pm_w_scale, pm_h_scale, .5, .5,=
 .5, .0);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>  	igt_display_commit_atomic(&data->display, 0, NULL);
>=20=20
>  	/* multiplane overlay to emulate video playback use case */
> @@ -428,7 +431,8 @@ static void run_check_psr_su_mpo(data_t *data, bool s=
caling, float scaling_ratio
>  			igt_plane_set_fb(data->overlay, &data->ov_fb[1]);
>  			igt_plane_set_size(data->primary, pm_w_scale, pm_h_scale);
>  		}
> -		igt_output_set_pipe(data->output, data->pipe_id);
> +		igt_output_set_crtc(data->output,
> +				    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  		ret =3D igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FL=
IP_EVENT, NULL);
>  		igt_require(ret =3D=3D 0);
> @@ -486,7 +490,8 @@ static void panning_rect_fb(data_t *data, igt_fb_t *r=
ect_fb, int rect_w, int rec
>  		igt_plane_set_fb(data->overlay, &data->ov_fb[i % 2]);
>  		igt_plane_set_fb(data->primary, rect_fb);
>  		igt_plane_set_size(data->primary, rect_w, rect_h);
> -		igt_output_set_pipe(data->output, data->pipe_id);
> +		igt_output_set_crtc(data->output,
> +				    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  		ret =3D igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FL=
IP_EVENT, NULL);
>  		igt_require(ret =3D=3D 0);
> @@ -512,7 +517,8 @@ static void run_check_psr_su_ffu(data_t *data)
>  	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, DR=
M_FORMAT_MOD_LINEAR,
>  			    .5, .5, .5, &ref_fb);
>  	igt_plane_set_fb(data->primary, &ref_fb);
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>  	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET=
, NULL);
>=20=20
>  	/*
> @@ -649,7 +655,8 @@ static void run_check_psr_su_cursor(data_t *data, boo=
l test_mpo)
>  	igt_plane_set_fb(data->cursor, &data->cs_fb);
>  	igt_plane_set_position(data->cursor, 0, 0);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>  	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET=
, NULL);
>=20=20
>  	/*
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> index 8b194f797938..38fe80a236f6 100644
> --- a/tests/amdgpu/amd_replay.c
> +++ b/tests/amdgpu/amd_replay.c
> @@ -77,7 +77,8 @@ static void test_init(struct test_data *data)
>  	data->primary =3D
>  		 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  	data->w =3D data->mode->hdisplay;
>  	data->h =3D data->mode->vdisplay;
> diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
> index a0a546a3e398..0998a0c960d0 100644
> --- a/tests/amdgpu/amd_subvp.c
> +++ b/tests/amdgpu/amd_subvp.c
> @@ -141,7 +141,8 @@ static void test_subvp(struct data *data)
>  					0,
>  					&rfb);
>=20=20
> -		igt_output_set_pipe(output, data->pipe_id[i]);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, data->pipe_id[i]));
>  		igt_plane_set_fb(data->primary[i], &rfb);
>  		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  	}
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_=
chamelium_color.c
> index 195556c9368c..72c02dbbc339 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -84,7 +84,7 @@ static bool test_pipe_degamma(data_t *data,
>=20=20
>  	degamma_full =3D generate_table_max(data->degamma_lut_size);
>=20=20
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> +	igt_output_set_crtc(output, primary->pipe);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
>  	fb_id =3D igt_create_fb(data->drm_fd,
> @@ -140,7 +140,7 @@ static bool test_pipe_degamma(data_t *data,
>=20=20
>  	disable_degamma(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
>  	free_lut(degamma_full);
>=20=20
> @@ -173,7 +173,7 @@ static bool test_pipe_gamma(data_t *data,
>=20=20
>  	gamma_full =3D generate_table_max(data->gamma_lut_size);
>=20=20
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> +	igt_output_set_crtc(output, primary->pipe);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
>  	fb_id =3D igt_create_fb(data->drm_fd,
> @@ -229,7 +229,7 @@ static bool test_pipe_gamma(data_t *data,
>=20=20
>  	disable_gamma(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
>  	free_lut(gamma_full);
>=20=20
> @@ -260,7 +260,7 @@ static bool test_pipe_ctm(data_t *data,
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
>=20=20
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> +	igt_output_set_crtc(output, primary->pipe);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
>  	fb_id =3D igt_create_fb(data->drm_fd,
> @@ -324,7 +324,7 @@ static bool test_pipe_ctm(data_t *data,
>  	igt_plane_set_fb(primary, NULL);
>  	disable_degamma(primary->pipe);
>  	disable_gamma(primary->pipe);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
>  	free_lut(degamma_linear);
>  	free_lut(gamma_linear);
> @@ -363,7 +363,7 @@ static bool test_pipe_limited_range_ctm(data_t *data,
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
>=20=20
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> +	igt_output_set_crtc(output, primary->pipe);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
>  	fb_id0 =3D igt_create_fb(data->drm_fd,
> @@ -415,7 +415,7 @@ static bool test_pipe_limited_range_ctm(data_t *data,
>  				  IGT_CONNECTOR_BROADCAST_RGB,
>  				  BROADCAST_RGB_FULL);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	/* Verify frame dumps are equal. */
>  	ret =3D chamelium_frame_match_or_dump_frame_pair(data->chamelium, port,
> diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_c=
hamelium_edid.c
> index 566a4f0ac886..5b1a063fffbe 100644
> --- a/tests/chamelium/kms_chamelium_edid.c
> +++ b/tests/chamelium/kms_chamelium_edid.c
> @@ -303,7 +303,8 @@ static void edid_stress_resolution(chamelium_data_t *=
data,
>  		chamelium_create_fb_for_mode(data, &fb, &mode);
>  		output =3D chamelium_get_output_for_port(data, port);
>  		pipe =3D chamelium_get_pipe_for_output(&data->display, output);
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		chamelium_enable_output(data, port, output, &mode, &fb);
>=20=20
>  		/* Capture the screen resolution and verify. */
> @@ -357,7 +358,7 @@ static void edid_resolution_list(chamelium_data_t *da=
ta,
>=20=20
>  	output =3D chamelium_get_output_for_port(data, port);
>  	pipe =3D chamelium_get_pipe_for_output(&data->display, output);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	for (i =3D 0; i < count_modes; ++i)
>  		igt_debug("#%d %s %uHz\n", i, modes[i].name, modes[i].vrefresh);
> diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms=
_chamelium_helper.c
> index 26c5f87f151b..328ff9292d0d 100644
> --- a/tests/chamelium/kms_chamelium_helper.c
> +++ b/tests/chamelium/kms_chamelium_helper.c
> @@ -150,10 +150,10 @@ igt_output_t *chamelium_prepare_output(chamelium_da=
ta_t *data,
>  	output =3D chamelium_get_output_for_port(data, port);
>=20=20
>  	/* Refresh pipe to update connected status */
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	pipe =3D chamelium_get_pipe_for_output(display, output);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	return output;
>  }
> @@ -207,14 +207,15 @@ enum pipe chamelium_get_pipe_for_output(igt_display=
_t *display,
>  	enum pipe pipe;
>=20=20
>  	for_each_pipe(display, pipe) {
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  		if (!intel_pipe_output_combo_valid(display)) {
> -			igt_output_set_pipe(output, PIPE_NONE);
> +			igt_output_set_crtc(output, NULL);
>  			continue;
>  		}
>=20=20
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  		return pipe;
>  	}
>=20=20
> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_ch=
amelium_hpd.c
> index d1460533f276..8f13b380a46b 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -266,7 +266,8 @@ static void test_hotplug(chamelium_data_t *data, stru=
ct chamelium_port *port,
>  				chamelium_create_fb_for_mode(data, &fb, &mode);
>  			}
>=20=20
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			chamelium_enable_output(data, port, output, &mode, &fb);
>  		}
>=20=20
> @@ -279,7 +280,7 @@ static void test_hotplug(chamelium_data_t *data, stru=
ct chamelium_port *port,
>  		igt_flush_uevents(mon);
>=20=20
>  		if (modeset_mode =3D=3D TEST_MODESET_ON_OFF) {
> -			igt_output_set_pipe(output, PIPE_NONE);
> +			igt_output_set_crtc(output, NULL);
>  			igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		}
>  	}
> @@ -315,7 +316,8 @@ static void test_hotplug_for_each_pipe(chamelium_data=
_t *data,
>  		output =3D chamelium_get_output_for_port(data, port);
>=20=20
>  		/* If pipe is valid for output then set it */
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (intel_pipe_output_combo_valid(&data->display))
>  			igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
> diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/cha=
melium/kms_chamelium_sharpness_filter.c
> index 25e0275630f0..0507ad7ac38a 100644
> --- a/tests/chamelium/kms_chamelium_sharpness_filter.c
> +++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
> @@ -42,10 +42,11 @@ static bool pipe_output_combo_valid(data_t *data, enu=
m pipe pipe)
>  {
>  	bool ret =3D true;
>=20=20
> -	igt_output_set_pipe(data->output, pipe);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, pipe));
>  	if (!intel_pipe_output_combo_valid(&data->display))
>  		ret =3D false;
> -	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_set_crtc(data->output, NULL);
>=20=20
>  	return ret;
>  }
> @@ -102,7 +103,7 @@ static void destroy_frame_dumps(struct chamelium_fram=
e_dump *frames[], int count
>  static void cleanup(data_t *data)
>  {
>  	igt_remove_fb(data->drm_fd, &data->fb);
> -	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_set_crtc(data->output, NULL);
>  	igt_output_override_mode(data->output, NULL);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
> @@ -115,7 +116,8 @@ static void test_t(data_t *data, igt_plane_t *primary,
>  	int height, width;
>  	bool match[4], match_ok =3D false;
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  	mode =3D igt_output_get_mode(data->output);
>  	height =3D mode->hdisplay;
> diff --git a/tests/drm_read.c b/tests/drm_read.c
> index 151294fa710f..c44e207f7dd8 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -299,7 +299,8 @@ int igt_main()
>  					      DRM_FORMAT_XRGB8888,
>  					      DRM_FORMAT_MOD_LINEAR, &fb);
>=20=20
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +				            igt_crtc_for_pipe(output->display, pipe));
>  			igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRI=
MARY), &fb);
>  			break;
>  		}
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index 0d4aa1bd33cb..2191274ae8d3 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -1041,7 +1041,8 @@ static void display_helper(igt_display_t *dpy, int =
*done)
>  		if (!output)
>  			continue;
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		mode =3D igt_output_get_mode(output);
>=20=20
>  		if (fb.width !=3D mode->hdisplay || fb.height !=3D mode->vdisplay) {
> diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
> index 5b51d7b384bb..eecc201308c2 100644
> --- a/tests/intel/gem_exec_reloc.c
> +++ b/tests/intel/gem_exec_reloc.c
> @@ -1517,7 +1517,8 @@ static void scanout(int i915,
>=20=20
>  	output =3D igt_get_single_output_for_pipe(dpy, PIPE_A);
>  	igt_require(output);
> -	igt_output_set_pipe(output, PIPE_A);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, PIPE_A));
>=20=20
>  	/*
>  	 * Find where the scanout is in our GTT; on !full-ppgtt this will be
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index 49edf744f943..9c1d724ac3cc 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -1229,7 +1229,8 @@ static void test_display_protected_crc(int i915, ig=
t_display_t *display)
>  		pipe =3D igt_crtc_for_pipe(display, i);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(i, output));
> -		igt_output_set_pipe(output, i);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, i));
>=20=20
>  		igt_plane_set_fb(plane, &ref_fb);
>  		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
> @@ -1248,7 +1249,7 @@ static void test_display_protected_crc(int i915, ig=
t_display_t *display)
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
> -		igt_output_set_pipe(output, pipe->pipe);
> +		igt_output_set_crtc(output, pipe);
>=20=20
>  		igt_plane_set_fb(plane, &ref_fb);
>  		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 7316547d276d..1ddda65e4ab6 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -536,7 +536,8 @@ static bool test_pipe(data_t *data)
>  	igt_create_fb(data->drm_fd, width, height,
>  		      data->format, data->modifier, &data->small_fb);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe));
>=20=20
>  	primary =3D igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIM=
ARY);
>  	igt_plane_set_fb(primary, NULL);
> @@ -595,7 +596,8 @@ max_hw_stride_async_flip_test(data_t *data)
>  	igt_info("Using (pipe %s + %s) to run the subtest.\n",
>  		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe));
>=20=20
>  	primary =3D igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIM=
ARY);
>=20=20
> @@ -708,7 +710,8 @@ static void test_scanout(data_t *data)
>  	for_each_pipe_with_valid_output(&data->display, data->pipe, data->outpu=
t) {
>  		igt_display_reset(&data->display);
>=20=20
> -		igt_output_set_pipe(data->output, data->pipe);
> +		igt_output_set_crtc(data->output,
> +				    igt_crtc_for_pipe(data->output->display, data->pipe));
>  		if (!intel_pipe_output_combo_valid(&data->display))
>  			continue;
>=20=20
> @@ -905,7 +908,7 @@ static void test_cleanup(data_t *data)
>  		return;
>=20=20
>  	igt_pipe_crc_free(data->pipe_crc);
> -	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_set_crtc(data->output, NULL);
>  	igt_remove_fb(data->drm_fd, &data->big_fb);
>  	igt_remove_fb(data->drm_fd, &data->big_fb_flip[0]);
>  	igt_remove_fb(data->drm_fd, &data->big_fb_flip[1]);
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index 53ed4b39813b..c38d45dd020d 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -79,7 +79,7 @@ set_fb_on_crtc(igt_display_t *dpy, int pipe,
>  	drmModeModeInfoPtr mode;
>  	igt_plane_t *primary;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	mode =3D igt_output_get_mode(output);
>=20=20
>  	igt_create_pattern_fb(dpy->drm_fd, mode->hdisplay, mode->vdisplay,
> @@ -101,7 +101,7 @@ static void do_cleanup_display(igt_display_t *dpy)
>  			igt_plane_set_fb(plane, NULL);
>=20=20
>  	for_each_connected_output(dpy, output)
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>=20=20
>  	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY=
);
>  }
> @@ -134,7 +134,7 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
>  						  DRM_MODE_PAGE_FLIP_EVENT, fb));
>  		else {
>  			igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRI=
MARY), fb);
> -			igt_output_set_pipe(output, PIPE_NONE);
> +			igt_output_set_crtc(output, NULL);
>  			igt_display_commit_atomic(dpy,
>  						  DRM_MODE_ATOMIC_NONBLOCK |
>  						  DRM_MODE_PAGE_FLIP_EVENT |
> @@ -163,7 +163,8 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
>  		/* Clear old mode blob. */
>  		igt_pipe_refresh(dpy, pipe, true);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		igt_display_commit2(dpy, COMMIT_ATOMIC);
>  	}
>=20=20
> @@ -287,13 +288,14 @@ static void test_hang(igt_display_t *dpy,
>=20=20
>  	if (modeset) {
>  		/* Test modeset disable with hang */
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  		igt_plane_set_fb(primary, &fb[1]);
>  		test_atomic_commit_hang(dpy, primary, &fb[hang_newfb]);
>=20=20
>  		/* Test modeset enable with hang */
>  		igt_plane_set_fb(primary, &fb[0]);
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		test_atomic_commit_hang(dpy, primary, &fb[!hang_newfb]);
>  	} else {
>  		/*
> @@ -339,7 +341,7 @@ test_pageflip_modeset_hang(igt_display_t *dpy,
>=20=20
>  	/* Kill crtc with hung fb */
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY=
);
>=20=20
>  	igt_assert(read(dpy->drm_fd, &ev, sizeof(ev)) =3D=3D sizeof(ev));
> @@ -357,10 +359,10 @@ pipe_output_combo_valid(igt_display_t *dpy,
>=20=20
>  	igt_display_reset(dpy);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	if (!intel_pipe_output_combo_valid(dpy))
>  		ret =3D false;
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	return ret;
>  }
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 9087c6a38680..6512e206f047 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -1153,7 +1153,8 @@ static void test_output(data_t *data, const int tes=
tnum)
>  			for_each_pipe_with_valid_output(&data->display, data->pipe, data->out=
put) {
>  				igt_display_reset(&data->display);
>=20=20
> -				igt_output_set_pipe(data->output, data->pipe);
> +				igt_output_set_crtc(data->output,
> +						    igt_crtc_for_pipe(data->output->display, data->pipe));
>  				if (!intel_pipe_output_combo_valid(&data->display))
>  					continue;
>=20=20
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 3aeaba226cda..441ffa200e64 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -123,7 +123,7 @@ static void do_cleanup_display(igt_display_t *dpy)
>  			igt_plane_set_fb(plane, NULL);
>=20=20
>  	for_each_connected_output(dpy, output)
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>=20=20
>  	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY=
);
>  }
> @@ -143,7 +143,8 @@ static void test_plane_scaling(data_t *data, enum pip=
e pipe, igt_output_t *outpu
>  		do_cleanup_display(display);
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		mode =3D *igt_output_get_highres_mode(output);
>  		igt_require_f(is_4k(mode), "Mode >=3D 4K not found on output %s\n",
>  			      igt_output_name(output));
> @@ -193,7 +194,7 @@ static void test_mode_transition(data_t *data, enum p=
ipe pipe, igt_output_t *out
>  	do_cleanup_display(display);
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	mode =3D igt_output_get_mode(output);
>  	mode_lo =3D *get_lowres_mode(output);
>  	mode_hi =3D *igt_output_get_highres_mode(output);
> @@ -292,7 +293,8 @@ static void test_mode_transition_on_all_outputs(data_=
t *data)
>  		width =3D max(width, mode->hdisplay);
>  		height =3D max(height, mode->vdisplay);
>=20=20
> -		igt_output_set_pipe(valid_outputs[i], i);
> +		igt_output_set_crtc(valid_outputs[i],
> +				    igt_crtc_for_pipe(valid_outputs[i]->display, i));
>  		igt_output_override_mode(valid_outputs[i], &mode_highres[i]);
>  	}
>=20=20
> @@ -325,9 +327,10 @@ static void run_cdclk_test(data_t *data, uint32_t fl=
ags)
>  	enum pipe pipe;
>=20=20
>  	for_each_pipe_with_valid_output(display, pipe, output) {
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(display)) {
> -			igt_output_set_pipe(output, PIPE_NONE);
> +			igt_output_set_crtc(output, NULL);
>  			continue;
>  		}
>=20=20
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 758d6fd8965d..5697afb2b3e1 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -229,7 +229,8 @@ static void prepare(data_t *data)
>  {
>  	igt_plane_t *primary;
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe));
>=20=20
>  	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
>  					 IGT_PIPE_CRC_SOURCE_AUTO);
> @@ -287,7 +288,7 @@ static void cleanup(data_t *data)
>=20=20
>  	igt_pipe_crc_free(data->pipe_crc);
>=20=20
> -	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_set_crtc(data->output, NULL);
>=20=20
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
> @@ -394,7 +395,8 @@ int igt_main()
>  						continue;
>=20=20
>  					igt_display_reset(&data.display);
> -					igt_output_set_pipe(data.output, data.pipe);
> +					igt_output_set_crtc(data.output,
> +							    igt_crtc_for_pipe(data.output->display, data.pipe));
>  					if (!intel_pipe_output_combo_valid(&data.display))
>  						continue;
>=20=20
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp=
_linktrain_fallback.c
> index 10c4d9e65ebf..5e6ba922420c 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -103,7 +103,8 @@ static void setup_pipe_on_outputs(data_t *data,
>  		igt_info("Setting pipe %s on output %s\n",
>  			 kmstest_pipe_name(data->pipe),
>  			 igt_output_name(outputs[i]));
> -		igt_output_set_pipe(outputs[i], data->pipe);
> +		igt_output_set_crtc(outputs[i],
> +				    igt_crtc_for_pipe(outputs[i]->display, data->pipe));
>  		i++;
>  	}
>  }
> @@ -479,7 +480,8 @@ static void test_dsc_sst_fallback(data_t *data)
>  				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
>  				    &data->fb);
>  		igt_output_override_mode(data->output, data->mode);
> -		igt_output_set_pipe(data->output, data->pipe);
> +		igt_output_set_crtc(data->output,
> +				    igt_crtc_for_pipe(data->output->display, data->pipe));
>  		data->primary =3D igt_output_get_plane_type(data->output,
>  						DRM_PLANE_TYPE_PRIMARY);
>  		igt_plane_set_fb(data->primary, &data->fb);
> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> index 020a2ad8674f..6f9786ba2454 100644
> --- a/tests/intel/kms_draw_crc.c
> +++ b/tests/intel/kms_draw_crc.c
> @@ -98,7 +98,8 @@ static void find_modeset_params(void)
>  	for_each_pipe_with_valid_output(&display, pipe, output) {
>  		igt_display_reset(&display);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(&display))
>  			continue;
>=20=20
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 1bb79bbcbbb6..e70cae2524a8 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -122,7 +122,7 @@ static void test_cleanup(data_t *data)
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
>  }
>=20=20
> @@ -164,7 +164,8 @@ static void update_display(data_t *data, uint32_t tes=
t_type)
>  		force_dsc_fractional_bpp_enable(data->drm_fd, data->output);
>  	}
>=20=20
> -	igt_output_set_pipe(output, data->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, data->pipe));
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
> diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherenc=
y.c
> index e1344b97bc0a..59bc29d19177 100644
> --- a/tests/intel/kms_fb_coherency.c
> +++ b/tests/intel/kms_fb_coherency.c
> @@ -47,7 +47,8 @@ static void prepare_crtc(data_t *data)
>=20=20
>  	igt_display_reset(display);
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, data->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, data->pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>=20=20
> @@ -144,7 +145,7 @@ static void cleanup_crtc(data_t *data)
>=20=20
>  	igt_plane_set_fb(data->primary, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(display);
>=20=20
>  	igt_remove_fb(data->drm_fd, &data->fb[0]);
> @@ -226,7 +227,8 @@ static void select_valid_pipe_output_combo(data_t *da=
ta)
>  	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(data->output, data->pipe);
> +		igt_output_set_crtc(data->output,
> +				    igt_crtc_for_pipe(data->output->display, data->pipe));
>  		if (intel_pipe_output_combo_valid(display))
>  			return;
>  	}
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty=
_rect.c
> index 06ac749d7a27..e063493ef4f4 100644
> --- a/tests/intel/kms_fbc_dirty_rect.c
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -397,7 +397,7 @@ static void cleanup(data_t *data)
>=20=20
>  	igt_pipe_crc_free(data->pipe_crc);
>=20=20
> -	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_set_crtc(data->output, NULL);
>=20=20
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
> @@ -407,7 +407,8 @@ static bool prepare_test(data_t *data)
>  	igt_display_reset(&data->display);
>=20=20
>  	data->mode =3D igt_output_get_mode(data->output);
> -	igt_output_set_pipe(data->output, data->pipe);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe));
>  	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
> diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin=
_leak.c
> index 2e3165300eb8..15ae038d8b08 100644
> --- a/tests/intel/kms_fence_pin_leak.c
> +++ b/tests/intel/kms_fence_pin_leak.c
> @@ -141,7 +141,7 @@ static void run_single_test(data_t *data, enum pipe p=
ipe, igt_output_t *output)
>  	igt_info("Using (pipe %s + %s) to run the subtest.\n",
>  		 kmstest_pipe_name(pipe), igt_output_name(output));
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -197,7 +197,7 @@ static void run_single_test(data_t *data, enum pipe p=
ipe, igt_output_t *output)
>  	}
>=20=20
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(display);
>=20=20
>  	igt_remove_fb(data->drm_fd, &fb[1]);
> @@ -215,7 +215,8 @@ static void run_test(data_t *data)
>  	for_each_pipe_with_valid_output(display, p, output) {
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(output, p);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, p));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_sca=
led_crc.c
> index dd5967c91486..d9452dff0b84 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -611,7 +611,7 @@ static void test_flip_to_scaled(data_t *data, uint32_=
t index,
>  	if (modetoset)
>  		igt_output_override_mode(output, modetoset);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> @@ -676,7 +676,7 @@ static void test_flip_to_scaled(data_t *data, uint32_=
t index,
>  	clear_lut(data, pipe);
>=20=20
>  	modetoset =3D NULL;
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
> @@ -750,7 +750,8 @@ int igt_main()
>  					igt_display_reset(&data.display);
>=20=20
>  					modetoset =3D find_mode(&data, output);
> -					igt_output_set_pipe(output, pipe);
> +					igt_output_set_crtc(output,
> +							    igt_crtc_for_pipe(output->display, pipe));
>  					igt_output_override_mode(output, modetoset);
>=20=20
>  					if (modetoset && intel_pipe_output_combo_valid(&data.display)) {
> @@ -764,7 +765,8 @@ int igt_main()
>  					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>  						igt_display_reset(&data.display);
>=20=20
> -						igt_output_set_pipe(output, pipe);
> +						igt_output_set_crtc(output,
> +								    igt_crtc_for_pipe(output->display, pipe));
>  						if (!intel_pipe_output_combo_valid(&data.display))
>  							continue;
>=20=20
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index 9bcaacb826b1..e7ada7740cd2 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -176,7 +176,7 @@ static void test_cleanup(data_t *data, enum pipe pipe=
, igt_output_t *output)
>  	/* Clean up. */
>  	igt_plane_set_fb(primary, NULL);
>  	pipe_crc_free(data);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	igt_remove_fb(data->drm_fd, &data->fb[0]);
>  	igt_remove_fb(data->drm_fd, &data->fb[1]);
> @@ -234,7 +234,8 @@ int igt_main()
>  			igt_display_reset(&data.display);
>  			pipe_crc_free(&data);
>=20=20
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			if (!intel_pipe_output_combo_valid(&data.display))
>  				continue;
>=20=20
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_fro=
ntbuffer_tracking.c
> index 069f03a6c9f1..f2e7c72f6f4c 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1169,7 +1169,8 @@ static bool find_connector(bool edp_only, bool pipe=
_a,
>  			continue;
>=20=20
>  		if (output =3D=3D forbidden_output || pipe =3D=3D forbidden_pipe) {
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			igt_output_override_mode(output, connector_get_mode(output));
>=20=20
>  			continue;
> @@ -1178,7 +1179,8 @@ static bool find_connector(bool edp_only, bool pipe=
_a,
>  		if (c->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP && opt.no_edp)
>  			continue;
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		igt_output_override_mode(output, connector_get_mode(output));
>  		if (intel_pipe_output_combo_valid(&drm.display)) {
>  			*ret_output =3D output;
> @@ -1480,7 +1482,8 @@ static void __set_prim_plane_for_params(struct mode=
set_params *params)
>  static void __set_mode_for_params(struct modeset_params *params)
>  {
>  	igt_output_override_mode(params->output, &params->mode);
> -	igt_output_set_pipe(params->output, params->pipe);
> +	igt_output_set_crtc(params->output,
> +			    igt_crtc_for_pipe(params->output->display, params->pipe));
>=20=20
>  	__set_prim_plane_for_params(params);
>  }
> @@ -1939,7 +1942,8 @@ static void init_blue_crc(enum pixel_format format,=
 enum tiling_type tiling)
>=20=20
>  	fill_fb(&blue, COLOR_PRIM_BG);
>=20=20
> -	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
> +	igt_output_set_crtc(prim_mode_params.output,
> +			    igt_crtc_for_pipe(prim_mode_params.output->display, prim_mode_par=
ams.pipe));
>  	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mod=
e);
>  	igt_plane_set_fb(prim_mode_params.primary.plane, &blue);
>  	igt_display_commit(&drm.display);
> @@ -1994,7 +1998,8 @@ static void init_crcs(enum pixel_format format, enu=
m tiling_type tiling,
>  					 IGT_DRAW_PWRITE : IGT_DRAW_BLT, r);
>  	}
>=20=20
> -	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
> +	igt_output_set_crtc(prim_mode_params.output,
> +			    igt_crtc_for_pipe(prim_mode_params.output->display, prim_mode_par=
ams.pipe));
>  	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mod=
e);
>  	for (r =3D 0; r < pattern->n_rects; r++) {
>  		igt_plane_set_fb(prim_mode_params.primary.plane, &tmp_fbs[r]);
> @@ -2400,8 +2405,10 @@ static void update_modeset_cached_params(enum igt_=
draw_method method)
>  {
>  	bool found =3D false;
>=20=20
> -	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
> -	igt_output_set_pipe(scnd_mode_params.output, scnd_mode_params.pipe);
> +	igt_output_set_crtc(prim_mode_params.output,
> +			    igt_crtc_for_pipe(prim_mode_params.output->display, prim_mode_par=
ams.pipe));
> +	igt_output_set_crtc(scnd_mode_params.output,
> +			    igt_crtc_for_pipe(scnd_mode_params.output->display, scnd_mode_par=
ams.pipe));
>=20=20
>  	found =3D igt_override_all_active_output_modes_to_fit_bw(&drm.display);
>  	igt_require_f(found, "No valid mode combo found.\n");
> @@ -2724,7 +2731,8 @@ static void plane_fbc_rte_subtest(const struct test=
_mode *t)
>  	do_assertions(ASSERT_FBC_DISABLED | DONT_ASSERT_CRC);
>=20=20
>  	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mod=
e);
> -	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
> +	igt_output_set_crtc(prim_mode_params.output,
> +			    igt_crtc_for_pipe(prim_mode_params.output->display, prim_mode_par=
ams.pipe));
>=20=20
>  	wanted_crc =3D &blue_crcs[t->format].crc;
>=20=20
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index bf77f6626f5b..c34a73908100 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -152,7 +152,7 @@ static enum pipe setup_pipe(data_t *data, igt_output_=
t *output, enum pipe pipe,
>=20=20
>  	igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_=
name(pipe),
>  		 kmstest_pipe_name(pipe + 1), output->name);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	return master_pipe;
>  }
> @@ -165,7 +165,8 @@ static void set_joiner_mode(data_t *data, igt_output_=
t *output, drmModeModeInfo
>  	igt_info("Committing joiner mode for output %s with mode %dx%d@%d\n",
>  		  output->name, mode->hdisplay, mode->vdisplay, mode->vrefresh);
>=20=20
> -	igt_output_set_pipe(output, PIPE_A);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, PIPE_A));
>  	igt_output_override_mode(output, mode);
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM=
_FORMAT_XRGB8888,
> @@ -351,7 +352,8 @@ static void test_invalid_modeset_two_joiner(data_t *d=
ata,
>  				mode =3D *igt_output_get_mode(output);
>  			}
>=20=20
> -			igt_output_set_pipe(output, data->pipe_seq[i + j]);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, data->pipe_seq[i + j]));
>  			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
>  				 kmstest_pipe_name(data->pipe_seq[i + j]),
>  				 igt_output_name(output), mode.hdisplay,
> @@ -398,7 +400,8 @@ static void test_joiner_on_last_pipe(data_t *data, bo=
ol force_joiner)
>  			mode =3D *igt_output_get_mode(output);
>  		}
>=20=20
> -		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, data->pipe_seq[data->n_pipes =
- 1]));
>  		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
>  				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
>  				 igt_output_name(output), mode.hdisplay,
> @@ -454,7 +457,8 @@ static void test_ultra_joiner(data_t *data, bool inva=
lid_pipe, bool two_display,
>  			if (two_display && j !=3D PIPE_A)
>  				continue;
>=20=20
> -			igt_output_set_pipe(output, data->pipe_seq[j]);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, data->pipe_seq[j]));
>=20=20
>  			primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay, DRM=
_FORMAT_XRGB8888,
> @@ -475,7 +479,8 @@ static void test_ultra_joiner(data_t *data, bool inva=
lid_pipe, bool two_display,
>=20=20
>  							mode1 =3D igt_output_get_mode(non_ultra_joiner_output);
>=20=20
> -							igt_output_set_pipe(non_ultra_joiner_output, data->pipe_seq[k]);
> +							igt_output_set_crtc(non_ultra_joiner_output,
> +									    igt_crtc_for_pipe(non_ultra_joiner_output->display, data->p=
ipe_seq[k]));
>  							plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMAR=
Y);
>=20=20
>  							igt_plane_set_fb(plane, &fb);
> @@ -521,7 +526,8 @@ static void test_basic_max_non_joiner(data_t *data)
>=20=20
>  		for (pipe =3D 0; pipe < data->n_pipes; pipe++) {
>  			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> -				igt_output_set_pipe(output, pipe);
> +				igt_output_set_crtc(output,
> +						    igt_crtc_for_pipe(output->display, pipe));
>  				igt_require(max_non_joiner_mode_found(data->drm_fd,
>  								      output->config.connector,
>  								      max_dotclock, &mode));
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_hel=
per.c
> index a59efcd1217a..7dd87c5c36ea 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -168,11 +168,13 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>  						out->name);
>  				return false;
>  			}
> -			igt_output_set_pipe(out, start);
> +			igt_output_set_crtc(out,
> +					    igt_crtc_for_pipe(out->display, start));
>  			igt_debug("Using pipe %s as master.\n",
>  					kmstest_pipe_name(start));
>  		} else
> -			igt_output_set_pipe(out, start);
> +			igt_output_set_crtc(out,
> +					    igt_crtc_for_pipe(out->display, start));
>=20=20
>  		for (i =3D 0; i < needed; i++)
>  			*used_pipes_mask |=3D BIT(start + i);
> diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_writ=
e_crc.c
> index ad3dd1b20333..98a3ca4edd99 100644
> --- a/tests/intel/kms_mmap_write_crc.c
> +++ b/tests/intel/kms_mmap_write_crc.c
> @@ -193,7 +193,8 @@ static void prepare_crtc(data_t *data)
>  	igt_display_reset(display);
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, data->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, data->pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>=20=20
> @@ -227,7 +228,7 @@ static void cleanup_crtc(data_t *data)
>=20=20
>  	igt_plane_set_fb(data->primary, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(display);
>=20=20
>  	igt_remove_fb(data->drm_fd, &data->fb[0]);
> @@ -296,7 +297,8 @@ int igt_main_args("n", NULL, NULL, opt_handler, NULL)
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
>  			igt_display_reset(&data.display);
>=20=20
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			if (!intel_pipe_output_combo_valid(&data.display))
>  				continue;
>=20=20
> diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_iv=
b.c
> index 2dde4660e77c..4559c8b9e951 100644
> --- a/tests/intel/kms_pipe_b_c_ivb.c
> +++ b/tests/intel/kms_pipe_b_c_ivb.c
> @@ -102,7 +102,7 @@ disable_pipe(data_t *data, enum pipe pipe, igt_output=
_t *output)
>  {
>  	igt_plane_t *primary;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	primary =3D igt_output_get_plane(output, 0);
>  	igt_plane_set_fb(primary, NULL);
>  	return igt_display_commit(&data->display);
> @@ -116,7 +116,7 @@ set_mode_on_pipe(data_t *data, enum pipe pipe, igt_ou=
tput_t *output)
>  	struct igt_fb fb;
>  	int fb_id;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>=20=20
> @@ -162,7 +162,7 @@ find_outputs(data_t *data, igt_output_t **output1, ig=
t_output_t **output2)
>  		if (pipe =3D=3D PIPE_C && output !=3D *output1 && !*output2)
>  			*output2 =3D output;
>=20=20
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  	}
>=20=20
>  	igt_skip_on_f(!*output1 || !*output2, "Not enough connected outputs\n");
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 7d212a07cb75..e8e01556ba25 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -343,7 +343,7 @@ static int commit_mode(struct data *data, igt_output_=
t *output,
>  	int ret;
>=20=20
>  	igt_output_override_mode(output, mode);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	ret =3D igt_display_try_commit_atomic(&data->display,
>  					    DRM_MODE_ATOMIC_TEST_ONLY |
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backligh=
t.c
> index 7d62d0503d51..360887f1772f 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -166,7 +166,7 @@ check_suspend(igt_output_t *output)
>=20=20
>  static void test_cleanup(igt_display_t *display, igt_output_t *output)
>  {
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>  	igt_pm_restore_sata_link_power_management();
>  }
> @@ -181,9 +181,10 @@ static void test_setup(igt_display_t display, igt_ou=
tput_t *output)
>  	igt_display_reset(&display);
>=20=20
>  	for_each_pipe(&display, pipe) {
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(&display)) {
> -			igt_output_set_pipe(output, PIPE_NONE);
> +			igt_output_set_crtc(output, NULL);
>  			continue;
>  		}
>  		mode =3D igt_output_get_mode(output);
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 8cc260fac0e5..5e59ba6e03a3 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -135,7 +135,8 @@ static void set_output_on_pipe_b(data_t *data)
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>  			continue;
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> @@ -169,7 +170,8 @@ static void setup_output(data_t *data)
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>  			continue;
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		data->output =3D output;
>  		data->mode =3D igt_output_get_mode(output);
>=20=20
> @@ -678,7 +680,7 @@ static void test_deep_pkgc_state(data_t *data)
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	for_each_connector_mode(output) {
>  		data->mode =3D &output->config.connector->modes[j__];
>  		delay =3D (MSEC / (data->mode->vrefresh));
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 07916d42cb85..a8801261dafa 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -105,7 +105,7 @@ static void screens_disabled_subtest(data_t *data)
>=20=20
>  	for (int i =3D 0; i < data->display.n_outputs; i++) {
>  		data->output =3D &data->display.outputs[i];
> -		igt_output_set_pipe(data->output, PIPE_NONE);
> +		igt_output_set_crtc(data->output, NULL);
>  		igt_display_commit(&data->display);
>  		valid_output++;
>  	}
> @@ -145,7 +145,7 @@ static void test_cleanup(data_t *data)
>  	primary =3D igt_output_get_plane_type(data->output,
>  					    DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_set_crtc(data->output, NULL);
>  	igt_display_commit(&data->display);
>  	igt_remove_fb(data->drm_fd, &data->fb);
>  	data->output =3D NULL;
> @@ -156,7 +156,8 @@ static bool test_constraint(data_t *data)
>  	drmModeModeInfo *mode;
>=20=20
>  	igt_display_reset(&data->display);
> -	igt_output_set_pipe(data->output, data->pipe);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe));
>=20=20
>  	mode =3D igt_output_get_mode(data->output);
>=20=20
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index c5948f18ce41..d7d0989b9a67 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1629,7 +1629,8 @@ static void set_prefered_mode(void)
>=20=20
>  	for_each_pipe_with_valid_output(display, pipe, output) {
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index 7b93608f3e4a..8bb4b15482ae 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -697,10 +697,11 @@ static enum pipe get_pipe_for_output(igt_display_t =
*display,
>  	enum pipe pipe;
>=20=20
>  	for_each_pipe(display, pipe) {
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  		if (!intel_pipe_output_combo_valid(display)) {
> -			igt_output_set_pipe(output, PIPE_NONE);
> +			igt_output_set_crtc(output, NULL);
>  			continue;
>  		}
>=20=20
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index 61a195a45d2a..f42863874e5e 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -424,11 +424,12 @@ static void prepare(data_t *data)
>  	if (data->coexist_feature & FEATURE_DSC) {
>  		save_force_dsc_en(data->drm_fd, output);
>  		force_dsc_enable(data->drm_fd, output);
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  	}
>=20=20
> -	igt_output_set_pipe(output, data->pipe);
> +	igt_output_set_crtc(output,
> +		            igt_crtc_for_pipe(output->display, data->pipe));
>=20=20
>  	if (data->big_fb_test) {
>  		fb_w =3D data->big_fb_width;
> @@ -1045,7 +1046,7 @@ static void cleanup(data_t *data)
>  	if (data->coexist_feature & FEATURE_DSC)
>  		restore_force_dsc_en();
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
> @@ -1082,10 +1083,10 @@ pipe_output_combo_valid(igt_display_t *display,
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	if (!intel_pipe_output_combo_valid(display))
>  		ret =3D false;
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	return ret;
>  }
> diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
> index fd0963ab7d3d..24318037ea44 100644
> --- a/tests/intel/kms_psr2_su.c
> +++ b/tests/intel/kms_psr2_su.c
> @@ -127,7 +127,8 @@ static void setup_output(data_t *data)
>  			continue;
>=20=20
>  		igt_display_reset(display);
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> @@ -300,7 +301,7 @@ static int check_psr2_support(data_t *data, enum pipe=
 pipe)
>=20=20
>  	igt_display_reset(display);
>  	output =3D data->output;
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	prepare(data, output);
>  	status =3D psr_wait_entry(data->debugfs_fd, PSR_MODE_2, output);
> @@ -372,7 +373,8 @@ int igt_main()
>  				for (i =3D 0; i < n_pipes; i++) {
>  					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
>  							igt_output_name(outputs[i])) {
> -						igt_output_set_pipe(outputs[i], pipes[i]);
> +						igt_output_set_crtc(outputs[i],
> +								    igt_crtc_for_pipe(outputs[i]->display, pipes[i]));
>  						if (data.op =3D=3D FRONTBUFFER &&
>  						    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >=3D 12) {
>  							/*
> diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stre=
ss_test.c
> index 8fe4a25d74ff..87016eb94f4f 100644
> --- a/tests/intel/kms_psr_stress_test.c
> +++ b/tests/intel/kms_psr_stress_test.c
> @@ -94,9 +94,10 @@ static void setup_output(data_t *data)
>  			continue;
>=20=20
>  		igt_display_reset(display);
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(display)) {
> -			igt_output_set_pipe(output, PIPE_NONE);
> +			igt_output_set_crtc(output, NULL);
>  			continue;
>  		}
>=20=20
> diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
> index 03944c201f61..d1cd9674381c 100644
> --- a/tests/intel/kms_pwrite_crc.c
> +++ b/tests/intel/kms_pwrite_crc.c
> @@ -124,7 +124,8 @@ static void prepare_crtc(data_t *data)
>  	drmModeModeInfo *mode;
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, data->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, data->pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>=20=20
> @@ -158,7 +159,7 @@ static void cleanup_crtc(data_t *data)
>=20=20
>  	igt_plane_set_fb(data->primary, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(display);
>=20=20
>  	igt_remove_fb(data->drm_fd, &data->fb[0]);
> @@ -173,7 +174,8 @@ static void run_test(data_t *data)
>  	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(data->output, data->pipe);
> +		igt_output_set_crtc(data->output,
> +				    igt_crtc_for_pipe(data->output->display, data->pipe));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpne=
ss_filter.c
> index 3714153276b0..c1242e8d514c 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -445,10 +445,11 @@ run_sharpness_filter_test(data_t *data, enum test_t=
ype type)
>  				continue;
>  			}
>=20=20
> -			igt_output_set_pipe(data->output, data->pipe_id);
> +			igt_output_set_crtc(data->output,
> +					    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  			if (!intel_pipe_output_combo_valid(display)) {
> -				igt_output_set_pipe(data->output, PIPE_NONE);
> +				igt_output_set_crtc(data->output, NULL);
>  				continue;
>  			}
>=20=20
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 5d96f91a6704..57113981d70a 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1050,7 +1050,8 @@ static void prepare_crtc(data_t *data, int fd, igt_=
output_t *output)
>  	igt_plane_t *primary;
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, data->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, data->pipe));
>=20=20
>  	/* create and set the primary plane fb */
>  	mode =3D igt_output_get_mode(output);
> @@ -1078,7 +1079,7 @@ static void cleanup_crtc(data_t *data, int fd, igt_=
output_t *output)
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(display);
>  }
>=20=20
> diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
> index 37bc174a5c1e..c19c3763fc04 100644
> --- a/tests/intel/prime_mmap_kms.c
> +++ b/tests/intel/prime_mmap_kms.c
> @@ -161,7 +161,7 @@ static void cleanup_crtc(gpu_process_t *gpu)
>=20=20
>  	igt_plane_set_fb(gpu->primary, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(display);
>=20=20
>  	igt_remove_fb(gpu->drm_fd, &gpu->fb);
> @@ -174,7 +174,8 @@ static void prepare_crtc(gpu_process_t *gpu)
>  	drmModeModeInfo *mode;
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, gpu->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, gpu->pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>=20=20
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 193b63a1d079..2fd3635fdc5c 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -852,7 +852,8 @@ static void display_vs_wb_transient(int fd)
>  	for_each_pipe_with_valid_output(&display, pipe, output) {
>  		igt_display_reset(&display);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(&display))
>  			continue;
>=20=20
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 351897e1ce68..b525bff8da0b 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -850,7 +850,7 @@ static void compare_crcs(int fd, igt_display_t *displ=
ay, igt_fb_t *ref_fb, igt_f
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
> -		igt_output_set_pipe(output, pipe->pipe);
> +		igt_output_set_crtc(output, pipe);
>=20=20
>  		commit_fb(display, plane, ref_fb, mode);
>  		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> @@ -905,7 +905,8 @@ static void test_display_pxp_fb(int fd, igt_display_t=
 *display)
>  		pipe =3D igt_crtc_for_pipe(display, i);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(i, output));
> -		igt_output_set_pipe(output, i);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, i));
>=20=20
>  		commit_fb(display, plane, &ref_fb, mode);
>=20=20
> @@ -962,7 +963,8 @@ static void test_display_black_pxp_fb(int fd, igt_dis=
play_t *display)
>  		pipe =3D igt_crtc_for_pipe(display, i);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(i, output));
> -		igt_output_set_pipe(output, i);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, i));
>=20=20
>  		igt_plane_set_fb(plane, &ref_fb);
>  		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 6762f172c4fa..71570385c32e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -302,7 +302,8 @@ static void test_init(data_t *data)
>  	data->crtc_id =3D igt_crtc_for_pipe(&data->display, data->pipe)->crtc_i=
d;
>  	data->refresh_rate =3D mode->vrefresh;
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe);
> +	igt_output_set_crtc(data->output,
> +		            igt_crtc_for_pipe(data->output->display, data->pipe));
>=20=20
>  	data->plane =3D igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_=
PRIMARY);
>  	if (data->overlay_path)
> @@ -915,7 +916,8 @@ static void run_test(data_t *data, void (*test)(data_=
t *))
>  	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(data->output, data->pipe);
> +		igt_output_set_crtc(data->output,
> +				    igt_crtc_for_pipe(data->output->display, data->pipe));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 01a058673913..236c1d5445e2 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -677,7 +677,7 @@ static void test_only(data_t *data, igt_output_t *out=
put, enum pipe pipe, uint32
>  			      mode->hdisplay, mode->vdisplay,
>  			      format, I915_TILING_NONE, &fb);
>  	igt_plane_set_fb(data->primary, &fb);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | D=
RM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>=20=20
> @@ -696,7 +696,7 @@ static void test_only(data_t *data, igt_output_t *out=
put, enum pipe pipe, uint32
>  	crtc_get_current_state(data->pipe, old_crtc_values);
>=20=20
>  	igt_plane_set_fb(data->primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | D=
RM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>=20=20
> @@ -1331,7 +1331,7 @@ static void atomic_setup(data_t *data, enum pipe pi=
pe, igt_output_t *output)
>  {
>  	drmModeModeInfo *mode;
>  	igt_display_reset(&data->display);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	data->primary =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->disp=
lay, pipe),
>  						DRM_PLANE_TYPE_PRIMARY);
> @@ -1357,7 +1357,7 @@ static void atomic_clear(data_t *data, enum pipe pi=
pe, igt_output_t *output)
>  		igt_plane_set_position(plane, 0, 0);
>  	}
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	crtc_commit(data->primary->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_R=
ELAX_NONE);
>  	igt_remove_fb(data->drm_fd, &data->fb);
>  }
> @@ -1376,10 +1376,10 @@ pipe_output_combo_valid(igt_display_t *display,
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	if (!intel_pipe_output_combo_valid(display))
>  		ret =3D false;
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	return ret;
>  }
> diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interrup=
tible.c
> index 9bce0bf1f829..b519fc635a54 100644
> --- a/tests/kms_atomic_interruptible.c
> +++ b/tests/kms_atomic_interruptible.c
> @@ -85,7 +85,7 @@ static int block_plane(igt_display_t *display, igt_outp=
ut_t *output, enum plane_
>  		signal(SIGCONT, SIG_IGN);
>=20=20
>  		if (test_type =3D=3D test_legacy_modeset || test_type =3D=3D test_atom=
ic_modeset) {
> -			igt_output_set_pipe(output, PIPE_NONE);
> +			igt_output_set_crtc(output, NULL);
>  		}
>  		igt_plane_set_fence_fd(plane, sw_sync_timeline_create_fence(timeline, =
1));
>=20=20
> @@ -130,7 +130,7 @@ static void run_plane_test(igt_display_t *display, en=
um pipe pipe, igt_output_t
>  	igt_display_reset(display);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	plane =3D igt_output_get_plane_type(output, plane_type);
> @@ -301,7 +301,7 @@ static void run_plane_test(igt_display_t *display, en=
um pipe pipe, igt_output_t
>=20=20
>  	igt_plane_set_fb(plane, NULL);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  	igt_remove_fb(display->drm_fd, &fb);
>  }
> @@ -313,10 +313,10 @@ static bool pipe_output_combo_valid(igt_display_t *=
display,
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	if (!intel_pipe_output_combo_valid(display))
>  		ret =3D false;
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	return ret;
>  }
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 63c7cf9f9f08..5b8728631a75 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -144,7 +144,7 @@ run_primary_test(data_t *data, enum pipe pipe, igt_ou=
tput_t *output)
>  	igt_info("Using (pipe %s + %s) to run the subtest.\n",
>  		 kmstest_pipe_name(pipe), igt_output_name(output));
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  	mode =3D igt_output_get_mode(output);
> @@ -584,16 +584,17 @@ run_transition_test(data_t *data, enum pipe pipe, i=
gt_output_t *output,
>  	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>  		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fbs[0]);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, pipe_obj);
>=20=20
>  	wm_setup_plane(data, pipe, 0, NULL, false);
>=20=20
>  	if (flags & DRM_MODE_ATOMIC_ALLOW_MODESET) {
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>=20=20
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    pipe_obj);
>  	}
>=20=20
>  	setup_parms(data, pipe, mode, &data->fbs[0], &data->argb_fb, &data->spr=
ite_fb, parms, &iter_max);
> @@ -674,7 +675,8 @@ run_transition_test(data_t *data, enum pipe pipe, igt=
_output_t *output,
>  		    n_enable_planes < pipe_obj->n_planes)
>  			continue;
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    pipe_obj);
>=20=20
>  		if (!wm_setup_plane(data, pipe, i, parms, fencing))
>  			continue;
> @@ -683,7 +685,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt=
_output_t *output,
>  		wait_for_transition(data, pipe, nonblocking, fencing);
>=20=20
>  		if (type =3D=3D TRANSITION_MODESET_DISABLE) {
> -			igt_output_set_pipe(output, PIPE_NONE);
> +			igt_output_set_crtc(output, NULL);
>=20=20
>  			if (!wm_setup_plane(data, pipe, 0, parms, fencing))
>  				continue;
> @@ -731,7 +733,7 @@ static void test_cleanup(data_t *data, enum pipe pipe=
, igt_output_t *output, boo
>  	if (fencing)
>  		unprepare_fencing(data, pipe);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	for_each_plane_on_pipe(&data->display, pipe, plane)
>  		igt_plane_set_fb(plane, NULL);
> @@ -791,7 +793,7 @@ static void unset_output_pipe(igt_display_t *display)
>  	int i;
>=20=20
>  	for (i =3D 0; i < display->n_outputs; i++)
> -		igt_output_set_pipe(&display->outputs[i], PIPE_NONE);
> +		igt_output_set_crtc(&display->outputs[i], NULL);
>  }
>=20=20
>  static unsigned set_combinations(data_t *data, unsigned mask, struct igt=
_fb *fb)
> @@ -841,19 +843,21 @@ static unsigned set_combinations(data_t *data, unsi=
gned mask, struct igt_fb *fb)
>  			if (output->pending_pipe !=3D PIPE_NONE)
>  				continue;
>=20=20
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			if (intel_pipe_output_combo_valid(&data->display)) {
>  				mode =3D igt_output_get_mode(output);
>  				break;
>  			} else {
> -				igt_output_set_pipe(output, PIPE_NONE);
> +				igt_output_set_crtc(output, NULL);
>  			}
>  		}
>=20=20
>  		if (!mode)
>  			return 0;
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		igt_plane_set_fb(plane, fb);
>  		igt_fb_set_size(fb, plane, mode->hdisplay, mode->vdisplay);
>  		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> @@ -932,7 +936,8 @@ retry:
>  			if (output->pending_pipe !=3D PIPE_NONE)
>  				continue;
>=20=20
> -			igt_output_set_pipe(output, i);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, i));
>  			if (intel_pipe_output_combo_valid(&data->display)) {
>  				mode =3D igt_output_get_mode(output);
>=20=20
> @@ -942,7 +947,7 @@ retry:
>=20=20
>  				break;
>  			} else {
> -				igt_output_set_pipe(output, PIPE_NONE);
> +				igt_output_set_crtc(output, NULL);
>  			}
>  		}
>=20=20
> @@ -1088,10 +1093,10 @@ static bool pipe_output_combo_valid(igt_display_t=
 *display,
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	if (!intel_pipe_output_combo_valid(display))
>  		ret =3D false;
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	return ret;
>  }
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index a8a094f4d1f1..2622eae89eda 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -223,7 +223,8 @@ static void run_test_linear_tiling(data_t *data, int =
pipe, const drmModeModeInfo
>  				    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
>  				    &buffer[i]);
>=20=20
> -		igt_output_set_pipe(output, i);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, i));
>=20=20
>  		igt_plane_set_fb(data->primary[i], &buffer[i]);
>  		igt_info("Assigning pipe %s to output %s with mode %s\n",
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index c68ccafd390a..072d0ad09474 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -100,7 +100,7 @@ static bool test_pipe_degamma(data_t *data,
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	degamma_full =3D generate_table_max(data->degamma_lut_size);
>=20=20
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> +	igt_output_set_crtc(output, primary->pipe);
>  	igt_output_override_mode(output, mode);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
> @@ -152,7 +152,7 @@ static bool test_pipe_degamma(data_t *data,
>=20=20
>  	disable_degamma(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
>  	igt_remove_fb(data->drm_fd, &fb);
>  	igt_remove_fb(data->drm_fd, &fb_modeset);
> @@ -187,7 +187,7 @@ static bool test_pipe_gamma(data_t *data,
>=20=20
>  	gamma_full =3D generate_table_max(data->gamma_lut_size);
>=20=20
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> +	igt_output_set_crtc(output, primary->pipe);
>  	igt_output_override_mode(output, mode);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
> @@ -238,7 +238,7 @@ static bool test_pipe_gamma(data_t *data,
>=20=20
>  	disable_gamma(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
>  	igt_remove_fb(data->drm_fd, &fb);
>  	igt_remove_fb(data->drm_fd, &fb_modeset);
> @@ -281,7 +281,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	green_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
>  	blue_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
>=20=20
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> +	igt_output_set_crtc(output, primary->pipe);
>  	igt_output_override_mode(output, mode);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
> @@ -345,7 +345,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	igt_display_commit(&data->display);
>=20=20
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
>  	igt_remove_fb(data->drm_fd, &fb);
>  	igt_remove_fb(data->drm_fd, &fb_modeset);
> @@ -384,7 +384,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>  		degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_zero =3D generate_table_zero(data->gamma_lut_size);
>=20=20
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> +	igt_output_set_crtc(output, primary->pipe);
>=20=20
>  	/* Ensure we have a clean state to start with. */
>  	disable_degamma(primary->pipe);
> @@ -483,7 +483,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>=20=20
>  end:
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
>=20=20
>  	free_lut(degamma_linear);
> @@ -516,7 +516,7 @@ static bool test_pipe_ctm(data_t *data,
>=20=20
>  	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
>=20=20
> -	igt_output_set_pipe(output, primary->pipe->pipe);
> +	igt_output_set_crtc(output, primary->pipe);
>  	igt_output_override_mode(output, mode);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
> @@ -587,7 +587,7 @@ static bool test_pipe_ctm(data_t *data,
>=20=20
>  	disable_ctm(primary->pipe);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
>  	igt_remove_fb(data->drm_fd, &fb);
>  	igt_remove_fb(data->drm_fd, &fb_modeset);
> @@ -896,7 +896,8 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe=
 p)
>=20=20
>  		igt_display_reset(&data->display);
>  		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
> -		igt_output_set_pipe(output, p);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, p));
>=20=20
>  		if (is_intel_device(data->drm_fd) &&
>  		    !igt_max_bpc_constraint(&data->display, p, output, 10)) {
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> index 3ca56138e97d..37639a261cd2 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -28,10 +28,11 @@ bool pipe_output_combo_valid(data_t *data, enum pipe =
pipe)
>  {
>  	bool ret =3D true;
>=20=20
> -	igt_output_set_pipe(data->output, pipe);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, pipe));
>  	if (!intel_pipe_output_combo_valid(&data->display))
>  		ret =3D false;
> -	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_set_crtc(data->output, NULL);
>=20=20
>  	return ret;
>  }
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 2714312834c1..6bce0ab057bb 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -154,7 +154,8 @@ static igt_output_t *kms_writeback_get_output(igt_dis=
play_t *display, __u32 four
>  			continue;
>=20=20
>  		for_each_pipe(display, pipe) {
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  			if (check_writeback_config(display, output, override_mode, fourcc_in,=
 fourcc_out)) {
>  				igt_debug("Using connector %u:%s on pipe %d\n",
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index b3cc2cec4931..0c05453496e7 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -97,7 +97,7 @@ static void test_fini(data_t *data, enum pipe pipe, int=
 n_planes,
>  	}
>=20=20
>  	/* reset the constraint on the pipe */
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_AT=
OMIC : COMMIT_LEGACY);
>=20=20
>  	free(data->plane);
> @@ -166,7 +166,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_=
planes,
>  	int i;
>  	int format, modifier;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	p =3D primary->pipe;
> @@ -283,7 +283,8 @@ test_resolution_with_output(data_t *data, enum pipe p=
ipe, int max_planes, igt_ou
>  		const drmModeModeInfo *mode_hi;
>  		drmModeModeInfo *mode_lo;
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  		mode_hi =3D igt_output_get_mode(output);
>  		mode_lo =3D get_lowres_mode(data, mode_hi, output);
> @@ -292,7 +293,7 @@ test_resolution_with_output(data_t *data, enum pipe p=
ipe, int max_planes, igt_ou
>  		igt_output_override_mode(output, mode_lo);
>  		free(mode_lo);
>  		if (is_amdgpu_device(data->drm_fd))
> -			igt_output_set_pipe(output, PIPE_NONE);
> +			igt_output_set_crtc(output, NULL);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
>  		/* switch back to higher resolution */
> @@ -342,7 +343,8 @@ run_tests_for_pipe(data_t *data)
>  		for_each_valid_output_on_pipe(&data->display, pipe, output) {
>  			igt_display_reset(&data->display);
>=20=20
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			if (!intel_pipe_output_combo_valid(&data->display))
>  				continue;
>=20=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 20a06ab58071..377bab9a3afb 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -609,7 +609,7 @@ test_fini(igt_output_t *output, enum igt_commit_style=
 commit_style)
>  	primary =3D igt_output_get_plane_type(output,
>  					    DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(&data.display, commit_style);
>  }
>=20=20
> @@ -672,7 +672,8 @@ test_content_protection(enum igt_commit_style commit_=
style, int content_type)
>  			}
>=20=20
>  			igt_display_reset(display);
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +				            igt_crtc_for_pipe(output->display, pipe));
>  			if (!intel_pipe_output_combo_valid(display))
>  				continue;
>=20=20
> @@ -808,7 +809,8 @@ test_content_protection_mst(int content_type)
>=20=20
>  		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		prepare_modeset_on_mst_output(output, false);
>  		dp_mst_outputs++;
>  		if (output_hdcp_capable(output, content_type))
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index ff682b93a242..24553e1bda09 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -559,7 +559,7 @@ static void cleanup_crtc(data_t *data)
>  	cairo_surface_destroy(data->surface);
>  	data->surface =3D NULL;
>=20=20
> -	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_set_crtc(data->output, NULL);
>  	igt_plane_set_fb(data->primary, NULL);
>  	igt_display_commit(display);
>=20=20
> @@ -578,7 +578,8 @@ static void prepare_crtc(data_t *data, int cursor_w, =
int cursor_h)
>  	igt_display_reset(display);
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, data->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, data->pipe));
>=20=20
>  	/* create and set the primary plane fbs */
>  	mode =3D igt_output_get_mode(output);
> @@ -780,7 +781,8 @@ static bool cursor_size_supported(data_t *data, int w=
, int h)
>  		    h <=3D data->cursor_max_h);
>=20=20
>  	igt_display_reset(display);
> -	igt_output_set_pipe(output, data->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, data->pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -807,7 +809,7 @@ static bool cursor_size_supported(data_t *data, int w=
, int h)
>  	igt_plane_set_fb(cursor, NULL);
>=20=20
>  	igt_remove_fb(data->drm_fd, &primary_fb);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	return ret =3D=3D 0;
>  }
> @@ -884,12 +886,13 @@ static bool valid_pipe_output_combo(data_t *data)
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	igt_display_reset(display);
> -	igt_output_set_pipe(data->output, data->pipe);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe));
>=20=20
>  	if (intel_pipe_output_combo_valid(display))
>  		ret =3D true;
>=20=20
> -	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_set_crtc(data->output, NULL);
>=20=20
>  	return ret;
>  }
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index ff8fe3402fe8..d77787e51b97 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -266,7 +266,8 @@ static void prepare_crtc(data_t *data)
>  	cleanup_crtc(data);
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(data->output, data->pipe);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe));
>=20=20
>  	mode =3D igt_output_get_mode(data->output);
>  	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> @@ -399,11 +400,12 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  						continue;
>=20=20
>  					igt_display_reset(&data.display);
> -					igt_output_set_pipe(data.output, data.pipe);
> +					igt_output_set_crtc(data.output,
> +							    igt_crtc_for_pipe(data.output->display, data.pipe));
>  					if (!intel_pipe_output_combo_valid(&data.display))
>  						continue;
>=20=20
> -					igt_output_set_pipe(data.output, PIPE_NONE);
> +					igt_output_set_crtc(data.output, NULL);
>=20=20
>  					igt_dynamic_f("pipe-%s-%s",
>  						      kmstest_pipe_name(data.pipe),
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 566d920124ad..509cff1cf335 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -256,8 +256,8 @@ static void override_output_modes(igt_display_t *disp=
lay,
>  	bool found =3D igt_override_all_active_output_modes_to_fit_bw(display);
>  	igt_require_f(found, "No valid mode combo found.\n");
>=20=20
> -	igt_output_set_pipe(output1, PIPE_NONE);
> -	igt_output_set_pipe(output2, PIPE_NONE);
> +	igt_output_set_crtc(output1, NULL);
> +	igt_output_set_crtc(output2, NULL);
>  }
>=20=20
>  static void stress(igt_display_t *display,
> @@ -373,7 +373,7 @@ static void set_fb_on_crtc(igt_display_t *display, en=
um pipe pipe,
>  	drmModeModeInfoPtr mode;
>  	igt_plane_t *primary;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	mode =3D igt_output_get_mode(output);
>=20=20
>  	igt_create_pattern_fb(display->drm_fd,
> @@ -442,7 +442,8 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>  			if((*output)->pending_pipe !=3D PIPE_NONE)
>  				continue;
>=20=20
> -			igt_output_set_pipe(*output, pipe);
> +			igt_output_set_crtc(*output,
> +					    igt_crtc_for_pipe((*output)->display, pipe));
>  			if (intel_pipe_output_combo_valid(display)) {
>  				found =3D true;
>=20=20
> @@ -453,7 +454,7 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>  				}
>  				break;
>  			}
> -			igt_output_set_pipe(*output, PIPE_NONE);
> +			igt_output_set_crtc(*output, NULL);
>  		}
>  		if (found)
>  			break;
> @@ -707,11 +708,11 @@ static void flip(igt_display_t *display,
>  	igt_plane_set_fb(cursor, NULL);
>  	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMA=
RY),
>  			 NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	if (flip_pipe !=3D cursor_pipe) {
>  		igt_plane_set_fb(igt_output_get_plane_type(output2, DRM_PLANE_TYPE_PRI=
MARY),
>  			 NULL);
> -		igt_output_set_pipe(output2, PIPE_NONE);
> +		igt_output_set_crtc(output2, NULL);
>  	}
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>=20=20
> @@ -873,7 +874,7 @@ static void basic_flip_cursor(igt_display_t *display,
>  	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMA=
RY),
>  			 NULL);
>  	igt_plane_set_fb(cursor, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>=20=20
>  	igt_remove_fb(display->drm_fd, &fb_info);
> @@ -1041,7 +1042,7 @@ static void flip_vs_cursor(igt_display_t *display, =
enum flip_test mode, int nloo
>  	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMA=
RY),
>  			 NULL);
>  	igt_plane_set_fb(cursor, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>=20=20
>  	igt_remove_fb(display->drm_fd, &fb_info);
> @@ -1080,7 +1081,7 @@ static void nonblocking_modeset_vs_cursor(igt_displ=
ay_t *display, int loops)
>  	 * Start disabled. No way around it, since the first atomic
>  	 * commit may be unreliable with amount of events sent.
>  	 */
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>=20=20
>  	while (loops--) {
> @@ -1097,7 +1098,8 @@ static void nonblocking_modeset_vs_cursor(igt_displ=
ay_t *display, int loops)
>  		 * works as intended. It should block until the modeset completes.
>  		 */
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		igt_plane_set_fb(cursor, NULL);
>  		igt_display_commit_atomic(display, flags, NULL);
>=20=20
> @@ -1113,7 +1115,7 @@ static void nonblocking_modeset_vs_cursor(igt_displ=
ay_t *display, int loops)
>  		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
>  		igt_reset_timeout();
>=20=20
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  		igt_display_commit_atomic(display, flags, NULL);
>=20=20
>  		igt_assert_eq(0, poll(&pfd, 1, 0));
> @@ -1132,7 +1134,7 @@ static void nonblocking_modeset_vs_cursor(igt_displ=
ay_t *display, int loops)
>=20=20
>  	igt_plane_set_fb(primary, NULL);
>  	igt_plane_set_fb(cursor, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>=20=20
>  	igt_remove_fb(display->drm_fd, &fb_info);
> @@ -1225,7 +1227,7 @@ static void two_screens_flip_vs_cursor(igt_display_=
t *display, int nloops, bool
>  			DRM_MODE_ATOMIC_NONBLOCK | DRM_MODE_PAGE_FLIP_EVENT;
>=20=20
>  		/* Disable pipe2 */
> -		igt_output_set_pipe(output2, PIPE_NONE);
> +		igt_output_set_crtc(output2, NULL);
>  		igt_display_commit_atomic(display, flags, NULL);
>  		enabled =3D false;
>=20=20
> @@ -1255,7 +1257,8 @@ static void two_screens_flip_vs_cursor(igt_display_=
t *display, int nloops, bool
>=20=20
>  				/* Commit page flip and modeset simultaneously. */
>  				igt_plane_set_fb(plane, &fb_info);
> -				igt_output_set_pipe(output2, enabled ? PIPE_NONE : pipe2);
> +				igt_output_set_crtc(output2,
> +						    igt_crtc_for_pipe(output2->display, enabled ? PIPE_NONE : pipe=
2));
>  				enabled =3D !enabled;
>=20=20
>  				wait_for_modeset(display, flags, 5, "Scheduling modeset");
> @@ -1303,7 +1306,8 @@ static void two_screens_flip_vs_cursor(igt_display_=
t *display, int nloops, bool
>  				vblank_start =3D kmstest_get_vblank(display->drm_fd, pipe2, DRM_VBLA=
NK_NEXTONMISS);
>  				flip_nonblocking(display, pipe2, atomic, &fb2_info, (void*)(ptrdiff_=
t)vblank_start);
>  			} else {
> -				igt_output_set_pipe(output2, enabled ? PIPE_NONE : pipe2);
> +				igt_output_set_crtc(output2,
> +						    igt_crtc_for_pipe(output2->display, enabled ? PIPE_NONE : pipe=
2));
>=20=20
>  				igt_set_timeout(1, "Scheduling modeset\n");
>  				do {
> @@ -1329,8 +1333,8 @@ done:
>  			 NULL);
>  	igt_plane_set_fb(cursor, NULL);
>  	igt_plane_set_fb(cursor2, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_output_set_pipe(output2, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
> +	igt_output_set_crtc(output2, NULL);
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>=20=20
>  	igt_remove_fb(display->drm_fd, &fb_info);
> @@ -1439,7 +1443,7 @@ static void cursor_vs_flip(igt_display_t *display, =
enum flip_test mode, int nloo
>  	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMA=
RY),
>  			 NULL);
>  	igt_plane_set_fb(cursor, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>=20=20
>  	igt_remove_fb(display->drm_fd, &fb_info);
> @@ -1569,8 +1573,8 @@ static void two_screens_cursor_vs_flip(igt_display_=
t *display, int nloops, bool
>  			 NULL);
>  	igt_plane_set_fb(cursors[0], NULL);
>  	igt_plane_set_fb(cursors[1], NULL);
> -	igt_output_set_pipe(outputs[0], PIPE_NONE);
> -	igt_output_set_pipe(outputs[1], PIPE_NONE);
> +	igt_output_set_crtc(outputs[0], NULL);
> +	igt_output_set_crtc(outputs[1], NULL);
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>=20=20
>  	igt_remove_fb(display->drm_fd, &fb_info[0]);
> @@ -1644,7 +1648,7 @@ static void flip_vs_cursor_crc(igt_display_t *displ=
ay, bool atomic)
>  	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMA=
RY),
>  			 NULL);
>  	igt_plane_set_fb(cursor, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>=20=20
>  	igt_remove_fb(display->drm_fd, &fb_info);
> @@ -1755,7 +1759,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *=
display, bool atomic)
>  	/* Clean-up */
>  	igt_plane_set_fb(plane_primary, NULL);
>  	igt_plane_set_fb(cursor, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>=20=20
>  	igt_remove_fb(display->drm_fd, &fb_info[1]);
> @@ -1820,7 +1824,7 @@ static void modeset_atomic_cursor_hotspot(igt_displ=
ay_t *display)
>  	/* Clean-up */
>  	set_cursor_hotspot(cursor, init_hot_x, init_hot_y);
>  	igt_plane_set_fb(cursor, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>=20=20
>  	igt_remove_fb(display->drm_fd, &cursor_fb);
> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
> index e77c91afff9f..8cdb020fe482 100644
> --- a/tests/kms_debugfs.c
> +++ b/tests/kms_debugfs.c
> @@ -48,7 +48,8 @@ static void igt_display_all_on(igt_display_t *display)
>  			if (output->pending_pipe !=3D PIPE_NONE)
>  				continue;
>=20=20
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  			mode =3D igt_output_get_mode(output);
>  			igt_create_pattern_fb(display->drm_fd,
> @@ -83,7 +84,7 @@ static void igt_display_all_off(igt_display_t *display)
>  	igt_plane_t *plane;
>=20=20
>  	for_each_connected_output(display, output)
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>=20=20
>  	for_each_pipe(display, pipe)
>  		for_each_plane_on_pipe(display, pipe, plane)
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index a5588904b0d3..818ebf32c2f0 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -87,8 +87,10 @@ static void run_extendedmode_basic(data_t *data,
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output1, pipe1);
> -	igt_output_set_pipe(output2, pipe2);
> +	igt_output_set_crtc(output1,
> +			    igt_crtc_for_pipe(output1->display, pipe1));
> +	igt_output_set_crtc(output2,
> +			    igt_crtc_for_pipe(output2->display, pipe2));
>=20=20
>  	mode[0] =3D igt_output_get_mode(output1);
>  	mode[1] =3D igt_output_get_mode(output2);
> @@ -156,8 +158,8 @@ static void run_extendedmode_basic(data_t *data,
>  	igt_pipe_crc_free(pipe_crc[0]);
>  	igt_pipe_crc_free(pipe_crc[1]);
>=20=20
> -	igt_output_set_pipe(output1, PIPE_NONE);
> -	igt_output_set_pipe(output2, PIPE_NONE);
> +	igt_output_set_crtc(output1, NULL);
> +	igt_output_set_crtc(output2, NULL);
>=20=20
>  	igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pip=
e1),
>  						 DRM_PLANE_TYPE_PRIMARY),
> @@ -203,8 +205,10 @@ static void run_extendedmode_test(data_t *data) {
>=20=20
>  					igt_display_reset(display);
>=20=20
> -					igt_output_set_pipe(output1, pipe1);
> -					igt_output_set_pipe(output2, pipe2);
> +					igt_output_set_crtc(output1,
> +							    igt_crtc_for_pipe(output1->display, pipe1));
> +					igt_output_set_crtc(output2,
> +							    igt_crtc_for_pipe(output2->display, pipe2));
>=20=20
>  					if (!intel_pipe_output_combo_valid(display))
>  						continue;
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index 102bab1debd1..3731b7d4b4ea 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -81,7 +81,7 @@ static void prepare_test(data_t *data, igt_output_t *ou=
tput, enum pipe p)
>  	data->primary =3D
>  		igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -	igt_output_set_pipe(output, p);
> +	igt_output_set_crtc(output, pipe);
>  }
>=20=20
>  /* Returns the current state of dithering from the crtc debugfs. */
> @@ -168,7 +168,7 @@ static void test_dithering(data_t *data, enum pipe pi=
pe,
>  cleanup:
>  	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, bpc);
>  	igt_plane_set_fb(data->primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>  	igt_remove_fb(data->drm_fd, &data->fb);
>=20=20
> @@ -218,10 +218,11 @@ run_dither_test(data_t *data, int fb_bpc, int fb_fo=
rmat, int output_bpc)
>  		}
>=20=20
>  		for_each_pipe(display, pipe) {
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  			if (!intel_pipe_output_combo_valid(display)) {
> -				igt_output_set_pipe(output, PIPE_NONE);
> +				igt_output_set_crtc(output, NULL);
>  				continue;
>  			}
>=20=20
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index a0615a113f1c..da80ecf66855 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -100,7 +100,8 @@ int igt_main() {
>  				for_each_pipe(&display, pipe) {
>  					for_each_valid_output_on_pipe(&display, pipe, output) {
>  						if (output->pending_pipe =3D=3D PIPE_NONE) {
> -							igt_output_set_pipe(output, pipe);
> +							igt_output_set_crtc(output,
> +									    igt_crtc_for_pipe(output->display, pipe));
>  							output_count++;
>  							break;
>  						}
> @@ -108,7 +109,8 @@ int igt_main() {
>  				}
>=20=20
>  				for (int i =3D 0; i < display.n_outputs; i++) {
> -					igt_output_set_pipe(&display.outputs[i], PIPE_NONE);
> +					igt_output_set_crtc(&display.outputs[i],
> +							    NULL);
>  				}
>  			}
>=20=20
> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
> index eafda2110a39..ce8993ccb681 100644
> --- a/tests/kms_flip_event_leak.c
> +++ b/tests/kms_flip_event_leak.c
> @@ -97,7 +97,7 @@ static void test(data_t *data, enum pipe pipe, igt_outp=
ut_t *output)
>  	igt_device_set_master(data->drm_fd);
>=20=20
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
>=20=20
>  	igt_remove_fb(data->drm_fd, &fb[0]);
> @@ -121,7 +121,8 @@ int igt_main()
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
>  			igt_display_reset(&data.display);
>=20=20
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			if (!intel_pipe_output_combo_valid(&data.display))
>  				continue;
>=20=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 45840945d658..e6092dbfce99 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -230,7 +230,8 @@ static void prepare_test(data_t *data, igt_output_t *=
output, enum pipe pipe)
>  	data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>  	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>=20=20
>  	data->w =3D data->mode->hdisplay;
> @@ -333,9 +334,10 @@ static void test_bpc_switch(data_t *data, uint32_t f=
lags)
>  		}
>=20=20
>  		for_each_pipe(display, pipe) {
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			if (!intel_pipe_output_combo_valid(display)) {
> -				igt_output_set_pipe(output, PIPE_NONE);
> +				igt_output_set_crtc(output, NULL);
>  				continue;
>  			}
>=20=20
> @@ -741,9 +743,10 @@ static void test_hdr(data_t *data, uint32_t flags)
>  		}
>=20=20
>  		for_each_pipe(display, pipe) {
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			if (!intel_pipe_output_combo_valid(display)) {
> -				igt_output_set_pipe(output, PIPE_NONE);
> +				igt_output_set_crtc(output, NULL);
>  				continue;
>  			}
>=20=20
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 2b385d4931f2..a3d52deafd7f 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -359,7 +359,8 @@ int igt_main()
>  			for_each_pipe_with_valid_output(&data.display, pipe, output) {
>  				igt_display_reset(&data.display);
>=20=20
> -				igt_output_set_pipe(output, pipe);
> +				igt_output_set_crtc(output,
> +						    igt_crtc_for_pipe(output->display, pipe));
>  				if (!intel_pipe_output_combo_valid(&data.display))
>  					continue;
>=20=20
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index d2e55ffcf538..4111a26b4c8b 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -161,7 +161,7 @@ static int prepare_crtc(data_t *data, bool is_master)
>  		return -ENOENT;
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	/* create and set the primary plane fb */
>  	mode =3D igt_output_get_mode(output);
> @@ -196,7 +196,7 @@ static void cleanup_crtc(lease_t *lease, igt_output_t=
 *output)
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(display);
>  }
>=20=20
> @@ -1291,7 +1291,8 @@ int igt_main()
>  				for_each_pipe_with_valid_output(display, data.pipe, output) {
>  					igt_display_reset(display);
>=20=20
> -					igt_output_set_pipe(output, data.pipe);
> +					igt_output_set_crtc(output,
> +							    igt_crtc_for_pipe(output->display, data.pipe));
>  					if (!intel_pipe_output_combo_valid(display))
>  						continue;
>=20=20
> diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
> index 3a1944b48874..7ce142f44fd4 100644
> --- a/tests/kms_multipipe_modeset.c
> +++ b/tests/kms_multipipe_modeset.c
> @@ -64,7 +64,7 @@ static void run_test(data_t *data, int valid_outputs)
>  		mode =3D igt_output_get_mode(output);
>  		igt_assert(mode);
>=20=20
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>=20=20
>  		width =3D max(width, mode->hdisplay);
>  		height =3D max(height, mode->vdisplay);
> @@ -83,7 +83,8 @@ static void run_test(data_t *data, int valid_outputs)
>  		pipe_crcs[i] =3D igt_pipe_crc_new(display->drm_fd, i,
>  						IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
> -		igt_output_set_pipe(output, i);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, i));
>  		mode =3D igt_output_get_mode(output);
>  		igt_assert(mode);
>=20=20
> @@ -93,7 +94,7 @@ static void run_test(data_t *data, int valid_outputs)
>=20=20
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  		igt_pipe_crc_collect_crc(pipe_crcs[i], &ref_crcs[i]);
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  		i++;
>  	}
>=20=20
> @@ -105,7 +106,8 @@ static void run_test(data_t *data, int valid_outputs)
>=20=20
>  		mode =3D NULL;
>=20=20
> -		igt_output_set_pipe(output, i);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, i));
>  		mode =3D igt_output_get_mode(output);
>  		igt_assert(mode);
>=20=20
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index 14cebf384d91..9bfb7d3f1356 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -74,7 +74,7 @@ static void prepare_crtc(data_t *data, igt_output_t *ou=
tput, enum pipe pipe,
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	igt_output_override_mode(output, mode);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	/* before allocating, free if any older fb */
>  	igt_remove_fb(data->drm_fd, &data->fb1);
> @@ -109,7 +109,7 @@ test_panel_fitting_legacy(data_t *d, igt_display_t *d=
isplay,
>  	drmModeModeInfo *mode, native_mode;
>  	bool is_plane_scaling_active =3D true;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>  	native_mode =3D *mode;
> @@ -202,7 +202,7 @@ test_panel_fitting_fastset(igt_display_t *display, co=
nst enum pipe pipe, igt_out
>=20=20
>  	mode =3D *igt_output_get_mode(output);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	sprite =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 0a52b651ee72..c74c0a02ae2f 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -138,7 +138,7 @@ static void test_read_crc(data_t *data, enum pipe pip=
e,
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	mode =3D igt_output_get_mode(output);
>=20=20
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -219,7 +219,7 @@ static void test_read_crc(data_t *data, enum pipe pip=
e,
>  	}
>=20=20
>  	/* Clean-up */
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_display_commit(display);
>  }
> @@ -245,7 +245,7 @@ static void test_compare_crc(data_t *data, enum pipe =
pipe, igt_output_t *output,
>  	struct igt_fb fb0, fb1;
>=20=20
>  	igt_display_reset(display);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>=20=20
> @@ -282,7 +282,7 @@ static void test_compare_crc(data_t *data, enum pipe =
pipe, igt_output_t *output,
>  	/* Clean-up */
>  	igt_pipe_crc_free(pipe_crc);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(display);
>=20=20
>  	igt_remove_fb(data->drm_fd, &fb0);
> @@ -302,7 +302,7 @@ static void test_disable_crc_after_crtc(data_t *data,=
 enum pipe pipe,
>  				    IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_display_reset(display);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>  	igt_create_color_fb(data->drm_fd,
> @@ -330,7 +330,7 @@ static void test_disable_crc_after_crtc(data_t *data,=
 enum pipe pipe,
>  	/* Clean-up */
>  	igt_pipe_crc_free(pipe_crc);
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(display);
>  	igt_remove_fb(data->drm_fd, &data->fb);
>  }
> @@ -342,10 +342,10 @@ static bool pipe_output_combo_valid(igt_display_t *=
display,
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	if (!intel_pipe_output_combo_valid(display))
>  		ret =3D false;
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	return ret;
>  }
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index c8701cf1a07d..535ce84d3074 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -194,7 +194,7 @@ test_grab_crc(data_t *data, igt_output_t *output, enu=
m pipe pipe,
>  	char *crc_str;
>  	int ret;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	primary =3D igt_output_get_plane(output, 0);
>=20=20
> @@ -271,7 +271,7 @@ test_plane_position_with_output(data_t *data,
>  	igt_debug("Testing connector %s using pipe %s plane %d\n", igt_output_n=
ame(output),
>  		  kmstest_pipe_name(pipe), plane);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -327,7 +327,7 @@ test_plane_position_with_output(data_t *data,
>  	igt_plane_set_fb(sprite, NULL);
>=20=20
>  	/* reset the constraint on the pipe */
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_AT=
OMIC : COMMIT_LEGACY);
>=20=20
>  	igt_remove_fb(data->drm_fd, &primary_fb);
> @@ -407,7 +407,7 @@ test_plane_panning_with_output(data_t *data,
>  	drmModeModeInfo *mode;
>  	igt_crc_t crc;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>  	primary =3D igt_output_get_plane(output, 0);
> @@ -436,7 +436,7 @@ test_plane_panning_with_output(data_t *data,
>  	igt_plane_set_fb(primary, NULL);
>=20=20
>  	/* reset states to neutral values, assumed by other tests */
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_fb_set_position(&primary_fb, primary, 0, 0);
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_AT=
OMIC : COMMIT_LEGACY);
>=20=20
> @@ -1215,7 +1215,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>  		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &primary_fb);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, &primary_fb);
>=20=20
> @@ -1235,7 +1235,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  	set_legacy_lut(data, pipe, 0xffff);
>=20=20
>  	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_AT=
OMIC : COMMIT_LEGACY);
>=20=20
>  	igt_remove_fb(data->drm_fd, &primary_fb);
> @@ -1264,7 +1264,7 @@ static void test_planar_settings(data_t *data)
>  	output =3D igt_get_single_output_for_pipe(&data->display, pipe);
>  	igt_require(output);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  	igt_display_commit_atomic(&data->display,
> @@ -1347,11 +1347,12 @@ static void run_test(data_t *data, void (*test)(d=
ata_t *, enum pipe))
>  	for_each_pipe_with_single_output(&data->display, pipe, data->output) {
>  		igt_display_reset(&data->display);
>=20=20
> -		igt_output_set_pipe(data->output, pipe);
> +		igt_output_set_crtc(data->output,
> +				    igt_crtc_for_pipe(data->output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(&data->display))
>  			continue;
>=20=20
> -		igt_output_set_pipe(data->output, PIPE_NONE);
> +		igt_output_set_crtc(data->output, NULL);
>  		test(data, pipe);
>=20=20
>  		if (is_pipe_limit_reached(++count))
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 99ce90616720..cfb67861086a 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -578,7 +578,7 @@ static void run_test_on_pipe_planes(data_t *data, enu=
m pipe pipe, igt_output_t *
>  			break;
>  	}
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  }
>=20=20
> @@ -705,7 +705,8 @@ static void run_subtests(data_t *data)
>=20=20
>  				igt_display_reset(&data->display);
>=20=20
> -				igt_output_set_pipe(output, pipe);
> +				igt_output_set_crtc(output,
> +						    igt_crtc_for_pipe(output->display, pipe));
>  				if (!intel_pipe_output_combo_valid(&data->display))
>  					continue;
>=20=20
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index b9aa0deed292..03fdb847d8c9 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -276,7 +276,8 @@ static void test_cursor(data_t *data, int size, unsig=
ned int flags)
>  			    DRM_FORMAT_MOD_LINEAR, 1.0, 0.0, 1.0, &data->cfb);
>=20=20
>  	igt_plane_set_fb(data->primary, &data->pfb);
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
>  	test_cursor_spots(data, size, flags);
> @@ -333,7 +334,8 @@ int igt_main()
>=20=20
>  				igt_display_reset(display);
>=20=20
> -				igt_output_set_pipe(output, pipe);
> +				igt_output_set_crtc(output,
> +						    igt_crtc_for_pipe(output->display, pipe));
>  				if (!intel_pipe_output_combo_valid(display))
>  					continue;
>=20=20
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index 5dac21ea6def..4b4b4b4597f3 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -283,7 +283,7 @@ static void test_cleanup(data_t *data)
>  {
>  	igt_pipe_crc_free(data->pipe_crc);
>=20=20
> -	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_set_crtc(data->output, NULL);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
>=20=20
> @@ -301,7 +301,8 @@ static void run_test(data_t *data, uint64_t modifier)
>  			data->output =3D output;
>=20=20
>  			igt_display_reset(&data->display);
> -			igt_output_set_pipe(data->output, data->pipe);
> +			igt_output_set_crtc(data->output,
> +					    igt_crtc_for_pipe(data->output->display, data->pipe));
>=20=20
>  			if (!intel_pipe_output_combo_valid(&data->display))
>  				continue;
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 0ce12749f7c8..79af0d93a370 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -120,7 +120,7 @@ static void test_init(data_t *data, enum pipe pipe, i=
nt n_planes)
>  static void test_fini(data_t *data, igt_output_t *output, int n_planes)
>  {
>  	/* reset the constraint on the pipe */
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	igt_pipe_crc_free(data->pipe_crc1);
>  	data->pipe_crc1 =3D NULL;
> @@ -143,7 +143,7 @@ get_reference_crc(data_t *data, igt_output_t *output,=
 enum pipe pipe, igt_pipe_c
>  	int ret;
>=20=20
>  	igt_display_reset(&data->display);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	plane[primary->index] =3D primary;
> @@ -212,7 +212,8 @@ prepare_planes(data_t *data, enum pipe pipe_id, color=
_t *color, igt_plane_t **pl
>  	int i;
>  	int* suffle;
>=20=20
> -	igt_output_set_pipe(output, pipe_id);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, pipe_id));
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	pipe =3D primary->pipe;
>=20=20
> @@ -357,7 +358,7 @@ test_plane_position_with_output(data_t *data, enum pi=
pe pipe,
>  		for_each_plane_on_pipe(&data->display, pipe, plane)
>  			igt_plane_set_fb(plane, NULL);
>=20=20
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
>  		for (int x =3D 0; x < c; x++)
> @@ -387,7 +388,7 @@ test_plane_position_with_output(data_t *data, enum pi=
pe pipe,
>  		for_each_plane_on_pipe(&data->display, pipe, plane)
>  			igt_plane_set_fb(plane, NULL);
>=20=20
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
>  		for (int x =3D 0; x < c; x++)
> @@ -527,8 +528,10 @@ static void run_2_display_test(data_t *data, uint64_=
t modifier, const char *name
>=20=20
>  					igt_display_reset(display);
>=20=20
> -					igt_output_set_pipe(output1, pipe1);
> -					igt_output_set_pipe(output2, pipe2);
> +					igt_output_set_crtc(output1,
> +							    igt_crtc_for_pipe(output1->display, pipe1));
> +					igt_output_set_crtc(output2,
> +							    igt_crtc_for_pipe(output2->display, pipe2));
>=20=20
>  					if (!intel_pipe_output_combo_valid(display))
>  						continue;
> @@ -559,7 +562,8 @@ static void run_test(data_t *data, uint64_t modifier,=
 const char *name)
>  	for_each_pipe_with_valid_output(display, pipe, output) {
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 10b168615226..25adadb87bf8 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -726,7 +726,7 @@ test_scaler_with_modifier_pipe(data_t *d,
>=20=20
>  	cleanup_crtc(d);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	for_each_plane_on_pipe(display, pipe, plane) {
>  		if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> @@ -766,7 +766,7 @@ test_scaler_with_rotation_pipe(data_t *d,
>=20=20
>  	cleanup_crtc(d);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	for_each_plane_on_pipe(display, pipe, plane) {
>  		if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> @@ -804,7 +804,7 @@ test_scaler_with_pixel_format_pipe(data_t *d, double =
sf_plane,
>=20=20
>  	cleanup_crtc(d);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	for_each_plane_on_pipe(display, pipe, plane) {
>  		struct igt_vec tested_formats;
> @@ -854,7 +854,8 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>  			if((*output)->pending_pipe !=3D PIPE_NONE)
>  				continue;
>=20=20
> -			igt_output_set_pipe(*output, pipe);
> +			igt_output_set_crtc(*output,
> +					    igt_crtc_for_pipe((*output)->display, pipe));
>  			if (intel_pipe_output_combo_valid(display)) {
>  				found =3D true;
>=20=20
> @@ -865,7 +866,7 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>  				}
>  				break;
>  			}
> -			igt_output_set_pipe(*output, PIPE_NONE);
> +			igt_output_set_crtc(*output, NULL);
>  		}
>  		if (found)
>  			break;
> @@ -952,7 +953,7 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
>=20=20
>  	cleanup_crtc(d);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	for_each_connector_mode(output) {
>  		mode =3D &output->config.connector->modes[j__];
>  		igt_output_override_mode(output, mode);
> @@ -1023,7 +1024,7 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe,=
 igt_output_t *output)
>=20=20
>  	cleanup_crtc(d);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, pipe_obj);
>=20=20
>  	width =3D height =3D 20;
>  	mode =3D igt_output_get_mode(output);
> @@ -1095,8 +1096,10 @@ static void test_scaler_with_multi_pipe_plane(data=
_t *d)
>  		 kmstest_pipe_name(pipe1), igt_output_name(output1),
>  		 kmstest_pipe_name(pipe2), igt_output_name(output2));
>=20=20
> -	igt_output_set_pipe(output1, pipe1);
> -	igt_output_set_pipe(output2, pipe2);
> +	igt_output_set_crtc(output1,
> +			    igt_crtc_for_pipe(output1->display, pipe1));
> +	igt_output_set_crtc(output2,
> +			    igt_crtc_for_pipe(output2->display, pipe2));
>=20=20
>  	igt_require(get_num_scalers(display, pipe1) >=3D 2);
>  	igt_require(get_num_scalers(display, pipe2) >=3D 2);
> @@ -1184,7 +1187,8 @@ static void invalid_parameter_tests(data_t *d)
>  		output =3D igt_get_single_output_for_pipe(&d->display, pipe);
>  		igt_require(output);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  		igt_require(get_num_scalers(&d->display, pipe) >=3D 1);
> @@ -1219,7 +1223,7 @@ static void invalid_parameter_tests(data_t *d)
>=20=20
>  	igt_fixture() {
>  		igt_remove_fb(d->drm_fd, &fb);
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  	}
>  }
>=20=20
> @@ -1281,7 +1285,7 @@ static void intel_max_source_size_test(data_t *d, e=
num pipe pipe, igt_output_t *
>=20=20
>  	cleanup_crtc(d);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	/*
>  	 * Need to get the mode again, because it may have changed
> @@ -1323,10 +1327,10 @@ pipe_output_combo_valid(igt_display_t *display,
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	if (!intel_pipe_output_combo_valid(display))
>  		ret =3D false;
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	return ret;
>  }
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index b4469d83339b..f443e9838a2b 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -124,7 +124,8 @@ static igt_output_t *setup_display(int importer_fd, i=
gt_display_t *display,
>  	for_each_pipe_with_valid_output(display, *pipe, output) {
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(output, *pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, *pipe));
>  		if (intel_pipe_output_combo_valid(display)) {
>  			found =3D true;
>  			break;
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 95bfe293a242..62e936bc5e51 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -80,7 +80,7 @@ static void prepare_pipe(igt_display_t *display, enum p=
ipe pipe, igt_output_t *o
>  	igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
>  			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMA=
RY), fb);
>=20=20
> @@ -94,7 +94,7 @@ static void cleanup_pipe(igt_display_t *display, enum p=
ipe pipe, igt_output_t *o
>  	for_each_plane_on_pipe(display, pipe, plane)
>  		igt_plane_set_fb(plane, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>=20=20
> @@ -328,7 +328,8 @@ static void colorop_properties(igt_display_t *display=
, bool atomic)
>  		for_each_valid_output_on_pipe(display, pipe, output) {
>  			igt_display_reset(display);
>=20=20
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			if (!intel_pipe_output_combo_valid(display))
>  				continue;
>=20=20
> @@ -352,7 +353,8 @@ static void plane_properties(igt_display_t *display, =
bool atomic)
>  	for_each_pipe_with_single_output(display, pipe, output) {
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> @@ -371,7 +373,8 @@ static void crtc_properties(igt_display_t *display, b=
ool atomic)
>  	for_each_pipe_with_single_output(display, pipe, output) {
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> @@ -393,9 +396,10 @@ static void connector_properties(igt_display_t *disp=
lay, bool atomic)
>  		for_each_pipe(display, pipe) {
>  			igt_display_reset(display);
>=20=20
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>  			if (!intel_pipe_output_combo_valid(display)) {
> -				igt_output_set_pipe(output, PIPE_NONE);
> +				igt_output_set_crtc(output, NULL);
>  				continue;
>  			}
>=20=20
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
> index b5b041857c7a..4726d4745d58 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -85,7 +85,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output,=
 enum pipe pipe, bool reo
>  	int num_active_planes =3D 0;
>=20=20
>  	igt_display_reset(display);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>=20=20
> @@ -167,7 +167,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *outpu=
t, enum pipe pipe, bool reo
>  		drmModeFreePlane(planeres);
>  	}
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  }
>=20=20
>  static void
> @@ -180,7 +180,8 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
>  	for_each_pipe_with_single_output(display, pipe, output) {
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index d37a14e275f7..c0642a389121 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -299,7 +299,7 @@ static void prepare_crtc(data_t *data, igt_output_t *=
output, enum pipe pipe,
>=20=20
>  	cleanup_crtc(data);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	igt_require(intel_pipe_output_combo_valid(display));
>=20=20
>  	igt_plane_set_rotation(plane, IGT_ROTATION_0);
> @@ -609,7 +609,8 @@ static void test_plane_rotation(data_t *data, int pla=
ne_type, bool test_bad_form
>=20=20
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> @@ -647,7 +648,8 @@ static void test_plane_rotation(data_t *data, int pla=
ne_type, bool test_bad_form
>  			break;
>  		pipe_count++;
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  		plane =3D igt_output_get_plane_type(output, plane_type);
>  		igt_require(plane_rotation_requirements(data, plane));
> @@ -940,7 +942,8 @@ static void test_multi_plane_rotation(data_t *data, e=
num pipe pipe)
>=20=20
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> @@ -1079,7 +1082,7 @@ static void test_multi_plane_rotation(data_t *data,=
 enum pipe pipe)
>  		lastroundirotation =3D 0;
>  		lastroundjrotation =3D 0;
>=20=20
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  	}
>  	data->pipe_crc =3D NULL;
>=20=20
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
> index 4edefe4ec5b1..588513750257 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -62,7 +62,7 @@ static void test_scaling_mode_on_output(igt_display_t *=
display, const enum pipe
>  	struct igt_fb red, blue;
>  	int ret;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	mode =3D *igt_output_get_mode(output);
>=20=20
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -121,7 +121,8 @@ static void test_scaling_mode(data_t *data, uint32_t =
flags)
>  			continue;
>  		}
>=20=20
> -		igt_output_set_pipe(output, pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, pipe));
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 1d3b98728e15..cfeec133de58 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -105,7 +105,8 @@ static void prepare_crtc(data_t *data, int fd, igt_ou=
tput_t *output)
>  	igt_display_reset(&data->display);
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, data->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, data->pipe));
>=20=20
>  	/* create and set the primary plane fb */
>  	mode =3D igt_output_get_mode(output);
> @@ -135,7 +136,7 @@ static void cleanup_crtc(data_t *data, int fd, igt_ou=
tput_t *output)
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
>  }
>=20=20
> @@ -311,7 +312,8 @@ int igt_main()
>  				for_each_pipe_with_valid_output(&data.display, p, output) {
>  					igt_display_reset(&data.display);
>=20=20
> -					igt_output_set_pipe(output, p);
> +					igt_output_set_crtc(output,
> +							    igt_crtc_for_pipe(output->display, p));
>  					if (!intel_pipe_output_combo_valid(&data.display))
>  						continue;
>=20=20
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index 003e6ea408e8..b63b03c0cd51 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -198,7 +198,7 @@ static void test_cleanup(data_t *data)
>  	for (count =3D 0; count < data->num_h_tiles; count++) {
>  		if (conns[count].output) {
>  			reset_plane(conns[count].output);
> -			igt_output_set_pipe(conns[count].output, PIPE_NONE);
> +			igt_output_set_crtc(conns[count].output, NULL);
>  		}
>  	}
>  	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
> @@ -250,8 +250,8 @@ static void setup_mode(data_t *data)
>  				conns[count].pipe =3D pipe;
>  				conns[count].output =3D output;
>=20=20
> -				igt_output_set_pipe(conns[count].output,
> -						    conns[count].pipe);
> +				igt_output_set_crtc(conns[count].output,
> +						    igt_crtc_for_pipe(conns[count].output->display, conns[count].p=
ipe));
>  				break;
>  			}
>  		}
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 4f43050791f8..aa5927cdf726 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -99,7 +99,7 @@ functional_test_init(functional_test_t *test, igt_outpu=
t_t *output, enum pipe pi
>  	test->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>  	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> @@ -136,7 +136,7 @@ functional_test_fini(functional_test_t *test, igt_out=
put_t *output)
>  	igt_remove_fb(test->data->drm_fd, &test->red_fb);
>  	igt_remove_fb(test->data->drm_fd, &test->yellow_fb);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
>  }
>=20=20
> @@ -254,14 +254,14 @@ functional_test_pipe(data_t *data, enum pipe pipe, =
igt_output_t *output)
>  	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_7);
>=20=20
>  	/* Step 11: Disable primary plane */
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_display_commit2(display, COMMIT_UNIVERSAL);
>=20=20
>  	/* Step 12: Legacy modeset to yellow FB (CRC 8) */
>  	igt_plane_set_fb(primary, &test.yellow_fb);
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	igt_display_commit2(display, COMMIT_LEGACY);
>  	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_8);
>=20=20
> @@ -349,7 +349,7 @@ sanity_test_init(sanity_test_t *test, igt_output_t *o=
utput, enum pipe pipe)
>  	data_t *data =3D test->data;
>  	drmModeModeInfo *mode;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>  	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> @@ -383,7 +383,7 @@ sanity_test_fini(sanity_test_t *test, igt_output_t *o=
utput)
>  	igt_remove_fb(test->data->drm_fd, &test->undersized_fb);
>  	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
>  }
>=20=20
> @@ -402,7 +402,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_ou=
tput_t *output)
>  	int i, ret;
>  	int expect =3D 0;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	mode =3D igt_output_get_mode(output);
>=20=20
>  	sanity_test_init(&test, output, pipe);
> @@ -492,7 +492,7 @@ pageflip_test_init(pageflip_test_t *test, igt_output_=
t *output, enum pipe pipe)
>  	data_t *data =3D test->data;
>  	drmModeModeInfo *mode;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>  	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> @@ -513,7 +513,7 @@ pageflip_test_fini(pageflip_test_t *test, igt_output_=
t *output)
>  	igt_remove_fb(test->data->drm_fd, &test->red_fb);
>  	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
>  }
>=20=20
> @@ -528,7 +528,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_=
output_t *output)
>  	fd_set fds;
>  	int ret =3D 0;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	pageflip_test_init(&test, output, pipe);
>=20=20
> @@ -539,7 +539,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_=
output_t *output)
>  	igt_display_commit2(&data->display, COMMIT_LEGACY);
>=20=20
>  	/* Disable the primary plane */
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
> @@ -550,7 +550,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_=
output_t *output)
>  	 * Note that crtc->primary->fb =3D NULL causes flip to return EBUSY for
>  	 * historical reasons...
>  	 */
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
>  				   test.red_fb.fb_id, 0, NULL) =3D=3D -EBUSY);
>=20=20
> @@ -565,12 +565,12 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, ig=
t_output_t *output)
>  	 * completes, which we don't have a good way to specifically test for,
>  	 * but at least we can make sure that nothing blows up.
>  	 */
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
>  				   test.red_fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT,
>  				   &test) =3D=3D 0);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
> @@ -600,7 +600,7 @@ cursor_leak_test_fini(data_t *data,
>  	for (i =3D 0; i < 10; i++)
>  		igt_remove_fb(data->drm_fd, &curs[i]);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  }
>=20=20
>  static int
> @@ -642,7 +642,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, i=
gt_output_t *output)
>  	igt_require(display->has_cursor_plane);
>  	igt_require_intel(data->drm_fd);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	mode =3D igt_output_get_mode(output);
>=20=20
>  	/* Count GEM framebuffers before creating our cursor FB's */
> @@ -726,7 +726,7 @@ gen9_test_init(gen9_test_t *test, igt_output_t *outpu=
t, enum pipe pipe)
>  	data_t *data =3D test->data;
>  	drmModeModeInfo *mode;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>  	test->w =3D mode->hdisplay / 2;
> @@ -761,7 +761,7 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *outpu=
t)
>  	igt_remove_fb(test->data->drm_fd, &test->smallred_fb);
>  	igt_remove_fb(test->data->drm_fd, &test->smallblue_fb);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
>  }
>=20=20
> @@ -777,7 +777,7 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, =
igt_output_t *output)
>=20=20
>  	int ret =3D 0;
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	gen9_test_init(&test, output, pipe);
>=20=20
> @@ -820,10 +820,10 @@ pipe_output_combo_valid(igt_display_t *display,
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	if (!intel_pipe_output_combo_valid(display))
>  		ret =3D false;
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	return ret;
>  }
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 9057905acd67..ed72c3576784 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -129,7 +129,8 @@ static void prepare_crtc(data_t *data, int fd, igt_ou=
tput_t *output)
>  	igt_display_reset(display);
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, data->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, data->pipe));
>=20=20
>  	/* create and set the primary plane fb */
>  	mode =3D igt_output_get_mode(output);
> @@ -148,7 +149,7 @@ static void prepare_crtc(data_t *data, int fd, igt_ou=
tput_t *output)
>=20=20
>  static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
>  {
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
>  	igt_remove_fb(fd, &data->primary_fb);
>  }
> @@ -231,10 +232,10 @@ pipe_output_combo_valid(igt_display_t *display,
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_pipe(output, pipe);
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>  	if (!intel_pipe_output_combo_valid(display))
>  		ret =3D false;
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>=20=20
>  	return ret;
>  }
> @@ -420,7 +421,7 @@ static void vblank_ts_cont(data_t *data, int fd, int =
nchildren)
>  	}
>=20=20
>  	if (data->flags & MODESET) {
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMM=
IT_LEGACY);
>  	}
>=20=20
> @@ -445,7 +446,8 @@ static void vblank_ts_cont(data_t *data, int fd, int =
nchildren)
>  	}
>=20=20
>  	if (data->flags & MODESET) {
> -		igt_output_set_pipe(output, data->pipe);
> +		igt_output_set_crtc(output,
> +				    igt_crtc_for_pipe(output->display, data->pipe));
>  		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMM=
IT_LEGACY);
>  	}
>=20=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 4f4d7667c7d2..0e54672a7d83 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -973,7 +973,7 @@ static void test_cleanup(data_t *data, enum pipe pipe=
, igt_output_t *output)
>  	if (data->primary)
>  		igt_plane_set_fb(data->primary, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_output_override_mode(output, NULL);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
> @@ -1093,10 +1093,11 @@ run_vrr_test(data_t *data, test_t test, uint32_t =
flags)
>  			continue;
>=20=20
>  		for_each_pipe(&data->display, pipe) {
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  			if (!intel_pipe_output_combo_valid(&data->display)) {
> -				igt_output_set_pipe(output, PIPE_NONE);
> +				igt_output_set_crtc(output, NULL);
>  				continue;
>  			}
>=20=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 3760cdc6814f..0b968baa260a 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -170,7 +170,8 @@ static igt_output_t *kms_writeback_get_output(igt_dis=
play_t *display)
>  			continue;
>=20=20
>  		for_each_pipe(display, pipe) {
> -			igt_output_set_pipe(output, pipe);
> +			igt_output_set_crtc(output,
> +					    igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  			if (data.custom_mode)
>  				override_mode =3D data.user_mode;
> @@ -201,7 +202,7 @@ static void cleanup_writeback(igt_display_t *display,=
 igt_output_t *output)
>  				  to_user_pointer(NULL));
>  	igt_output_set_writeback_fb(output, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  }
>=20=20
> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> index bf913cf13ad4..7887ff409e9e 100644
> --- a/tests/nouveau_crc.c
> +++ b/tests/nouveau_crc.c
> @@ -344,7 +344,7 @@ int igt_main()
>  			 * one
>  			 */
>  			if (data.output) {
> -				igt_output_set_pipe(data.output, PIPE_NONE);
> +				igt_output_set_crtc(data.output, NULL);
>  				igt_display_commit(&data.display);
>  			}
>=20=20
> @@ -354,7 +354,8 @@ int igt_main()
>  			/* None of these tests need to perform modesets, just page flips. So =
running
>  			 * display setup here is fine
>  			 */
> -			igt_output_set_pipe(data.output, pipe);
> +			igt_output_set_crtc(data.output,
> +					    igt_crtc_for_pipe(data.output->display, pipe));
>  			data.primary =3D igt_output_get_plane(data.output, 0);
>  			igt_create_color_fb(data.drm_fd,
>  					    data.mode->hdisplay,
> diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
> index dd1e40cec14e..5f704089b146 100644
> --- a/tests/vmwgfx/vmw_prime.c
> +++ b/tests/vmwgfx/vmw_prime.c
> @@ -185,7 +185,7 @@ static void cleanup_crtc(struct gpu_process_t *gpu)
>=20=20
>  	igt_plane_set_fb(gpu->primary, NULL);
>=20=20
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(display);
>=20=20
>  	igt_remove_fb(gpu->mdevice.drm_fd, &gpu->fb);
> @@ -203,7 +203,8 @@ static void prepare_crtc(struct gpu_process_t *gpu)
>  	int ret;
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, gpu->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, gpu->pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>=20=20
> @@ -229,7 +230,8 @@ static void prepare_crtc_surface(struct gpu_process_t=
 *gpu)
>  	int prime_fd;
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_pipe(output, gpu->pipe);
> +	igt_output_set_crtc(output,
> +			    igt_crtc_for_pipe(output->display, gpu->pipe));
>=20=20
>  	mode =3D igt_output_get_mode(output);
>=20=20
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index bcb7e00b0b07..a94370178847 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -409,7 +409,8 @@ static void test_init(data_t *data, int conn_id)
>  	data->primary =3D
>  		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -	igt_output_set_pipe(data->output, data->pipe_id);
> +	igt_output_set_crtc(data->output,
> +			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
>=20=20
>  	if (data->timeout_seconds > 0) {
>  		struct sigaction sa;
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index c1cc54b82ad2..940107314190 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -76,7 +76,7 @@ static void disable_all_displays(data_t *data)
>=20=20
>  	for (int i =3D 0; i < data->display.n_outputs; i++) {
>  		output =3D &data->display.outputs[i];
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_set_crtc(output, NULL);
>  		igt_display_commit(&data->display);
>  	}
>  }

--=20
Jani Nikula, Intel
