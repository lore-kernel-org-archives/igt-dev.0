Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959ECD3C912
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484CA89B78;
	Wed, 10 Dec 2025 14:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ln0inzhv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D0B89B78
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765376717; x=1796912717;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=IjSayfu1ckKKPkXHKm21wiwhLvilO24aGNBOSo4uGno=;
 b=Ln0inzhvGEhx1XchxdHD8q0QODRXhSgXOBYz/qBEoIRrVlEMuejaABWK
 Cs5nYaA9qScIVlY5ermHORKVpMFy9wbzHuqB82Snv0/W7fqSH1zD4cWAR
 yiNhjVjRzNw97A7U1GpQVuJbGIHeW/2qYzawj12VjBcK3mtYw4zyHpFiA
 qL3G3LAuV6SEzjDGtRF4YJlCq9+8YAtuXNV//Z4yRrVyKO7BbV4a3wPwH
 mVsdyEihWxmJX8uSdUq5dwV9JsPYWc9ECqZBYUkfRki/SxHV43FmxPLWZ
 ObuuLMX4XXfaWGz2UbFQdqIgsdTwIvH825W7Y4mAXWtDxePBzQOH8cA8o g==;
X-CSE-ConnectionGUID: LHw5kA2YTXiK94bI4ZaonQ==
X-CSE-MsgGUID: HxOKunCXSeewf4aL/QlSzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67283358"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67283358"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:25:17 -0800
X-CSE-ConnectionGUID: sHtxu6l9TCuAMPqUk3vhYw==
X-CSE-MsgGUID: 2aN0cnG6RauZ9iikphB2IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="201641428"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:25:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 05/10] lib/kms: Use igt_crtc_for_pipe() everywhere
In-Reply-To: <20251210093903.15934-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-6-ville.syrjala@linux.intel.com>
Date: Wed, 10 Dec 2025 16:25:10 +0200
Message-ID: <420526a14d54fe8b7ff466b7093b7e6f48a451cf@intel.com>
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
> Replace all the naked display->pipes[] stuff with igt_crtc_for_pipe().
>
> One step towards using 'crtcs' instead of 'pipes'.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> expression D, P;
> identifier M;
> @@
> (
> - D.pipes[P].M
> + igt_crtc_for_pipe(&D, P)->M
> |
> - D->pipes[P].M
> + igt_crtc_for_pipe(D, P)->M
> |
> - &D.pipes[P]
> + igt_crtc_for_pipe(&D, P)
> |
> - &D->pipes[P]
> + igt_crtc_for_pipe(D, P)
> |
> - D->pipes[P]
> + XXX

Is that just to catch any remaining references that didn't match the
earlier ones?

> )
>
> @@
> expression display, pipe;
> @@
> igt_crtc_for_pipe(...)
> {
> <...
> - igt_crtc_for_pipe(display, pipe)
> + &display->pipes[pipe]
> ...>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

I'm guessing most of these places shouldn't be using pipe to begin with,
but that's for another patch. This is nice cleanup.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c                                 | 38 ++++++++++---------
>  lib/igt_kms.h                                 |  6 ++-
>  tests/amdgpu/amd_abm.c                        |  2 +-
>  tests/amdgpu/amd_assr.c                       |  2 +-
>  tests/amdgpu/amd_bypass.c                     |  2 +-
>  tests/amdgpu/amd_color.c                      |  2 +-
>  tests/amdgpu/amd_dp_dsc.c                     |  3 +-
>  tests/amdgpu/amd_hotplug.c                    |  3 +-
>  tests/amdgpu/amd_ilr.c                        |  2 +-
>  tests/amdgpu/amd_link_settings.c              |  2 +-
>  tests/amdgpu/amd_mall.c                       |  2 +-
>  tests/amdgpu/amd_max_bpc.c                    |  2 +-
>  tests/amdgpu/amd_mem_leak.c                   |  2 +-
>  tests/amdgpu/amd_mode_switch.c                |  4 +-
>  tests/amdgpu/amd_multidisplay_modeset.c       |  6 +--
>  tests/amdgpu/amd_odm.c                        |  2 +-
>  tests/amdgpu/amd_plane.c                      |  2 +-
>  tests/amdgpu/amd_psr.c                        |  2 +-
>  tests/amdgpu/amd_replay.c                     |  2 +-
>  tests/amdgpu/amd_subvp.c                      |  3 +-
>  tests/chamelium/kms_chamelium_color.c         | 10 ++---
>  .../kms_chamelium_sharpness_filter.c          |  4 +-
>  tests/intel/gem_eio.c                         |  2 +-
>  tests/intel/gem_pxp.c                         |  4 +-
>  tests/intel/kms_big_fb.c                      |  6 +--
>  tests/intel/kms_busy.c                        |  6 +--
>  tests/intel/kms_cdclk.c                       |  2 +-
>  tests/intel/kms_flip_scaled_crc.c             |  4 +-
>  tests/intel/kms_frontbuffer_tracking.c        | 16 +++++---
>  tests/intel/kms_joiner_helper.c               |  2 +-
>  tests/intel/kms_pipe_stress.c                 | 10 +++--
>  tests/intel/kms_pm_dc.c                       |  4 +-
>  tests/intel/kms_sharpness_filter.c            |  2 +-
>  tests/intel/perf_pmu.c                        |  2 +-
>  tests/intel/xe_pxp.c                          |  6 +--
>  tests/kms_async_flips.c                       |  2 +-
>  tests/kms_atomic.c                            | 18 +++++----
>  tests/kms_atomic_transition.c                 | 33 ++++++++--------
>  tests/kms_bw.c                                |  3 +-
>  tests/kms_color.c                             | 10 ++---
>  tests/kms_color_helper.c                      |  4 +-
>  tests/kms_concurrent.c                        |  4 +-
>  tests/kms_cursor_crc.c                        |  8 ++--
>  tests/kms_cursor_edge_walk.c                  |  2 +-
>  tests/kms_cursor_legacy.c                     | 26 +++++++------
>  tests/kms_display_modes.c                     | 16 +++++---
>  tests/kms_dither.c                            |  2 +-
>  tests/kms_hdr.c                               |  2 +-
>  tests/kms_invalid_mode.c                      |  2 +-
>  tests/kms_lease.c                             | 37 +++++++++---------
>  tests/kms_multipipe_modeset.c                 |  4 +-
>  tests/kms_pipe_crc_basic.c                    |  6 ++-
>  tests/kms_plane.c                             | 10 ++---
>  tests/kms_plane_alpha_blend.c                 | 15 +++++---
>  tests/kms_plane_cursor.c                      |  8 ++--
>  tests/kms_plane_multiple.c                    |  4 +-
>  tests/kms_plane_scaling.c                     |  8 ++--
>  tests/kms_properties.c                        | 12 ++++--
>  tests/kms_rotation_crc.c                      |  3 +-
>  tests/kms_sequence.c                          |  2 +-
>  tests/kms_tiled_display.c                     |  2 +-
>  tests/kms_universal_plane.c                   | 10 +++--
>  tests/kms_vblank.c                            |  4 +-
>  tools/amd_hdmi_compliance.c                   |  2 +-
>  64 files changed, 239 insertions(+), 189 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a6bc41fb357d..951144bae955 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2839,7 +2839,7 @@ void igt_display_reset(igt_display_t *display)
>  	display->first_commit =3D true;
>=20=20
>  	for_each_pipe(display, pipe) {
> -		igt_pipe_t *pipe_obj =3D &display->pipes[pipe];
> +		igt_pipe_t *pipe_obj =3D igt_crtc_for_pipe(display, pipe);
>  		igt_plane_t *plane;
>=20=20
>  		for_each_plane_on_pipe(display, pipe, plane)
> @@ -2870,7 +2870,7 @@ static void igt_fill_display_format_mod(igt_display=
_t *display);
>   */
>  void igt_require_pipe(igt_display_t *display, enum pipe pipe)
>  {
> -	igt_skip_on_f(pipe >=3D igt_display_n_crtcs(display) || !display->pipes=
[pipe].valid,
> +	igt_skip_on_f(pipe >=3D igt_display_n_crtcs(display) || !igt_crtc_for_p=
ipe(display, pipe)->valid,
>  			"Pipe %s does not exist\n",
>  			kmstest_pipe_name(pipe));
>  }
> @@ -3013,7 +3013,7 @@ void igt_display_reset_outputs(igt_display_t *displ=
ay)
>  	igt_display_reset(display);
>=20=20
>  	for_each_pipe(display, i) {
> -		igt_pipe_t *pipe =3D &display->pipes[i];
> +		igt_pipe_t *pipe =3D igt_crtc_for_pipe(display, i);
>  		igt_output_t *output;
>=20=20
>  		if (!igt_pipe_has_valid_output(display, i))
> @@ -3118,7 +3118,7 @@ void igt_display_require(igt_display_t *display, in=
t drm_fd)
>  			__intel_get_pipe_from_crtc_id(drm_fd,
>  						      resources->crtcs[i], i) : i;
>=20=20
> -		pipe =3D &display->pipes[pipe_enum];
> +		pipe =3D igt_crtc_for_pipe(display, pipe_enum);
>  		pipe->pipe =3D pipe_enum;
>=20=20
>  		pipe->valid =3D true;
> @@ -3156,7 +3156,7 @@ void igt_display_require(igt_display_t *display, in=
t drm_fd)
>  	display->n_colorops =3D 0;
>=20=20
>  	for_each_pipe(display, i) {
> -		igt_pipe_t *pipe =3D &display->pipes[i];
> +		igt_pipe_t *pipe =3D igt_crtc_for_pipe(display, i);
>  		igt_plane_t *plane;
>  		int p =3D 1, crtc_mask =3D 0;
>  		int j, type;
> @@ -3461,7 +3461,7 @@ void igt_display_fini(igt_display_t *display)
>  	}
>=20=20
>  	for (i =3D 0; i < igt_display_n_crtcs(display); i++)
> -		igt_pipe_fini(&display->pipes[i]);
> +		igt_pipe_fini(igt_crtc_for_pipe(display, i));
>=20=20
>  	for (i =3D 0; i < display->n_outputs; i++)
>  		igt_output_fini(&display->outputs[i]);
> @@ -3532,7 +3532,7 @@ static igt_pipe_t *igt_output_get_driving_pipe(igt_=
output_t *output)
>=20=20
>  	igt_assert(pipe >=3D 0 && pipe < igt_display_n_crtcs(display));
>=20=20
> -	return &display->pipes[pipe];
> +	return igt_crtc_for_pipe(display, pipe);
>  }
>=20=20
>  static igt_plane_t *igt_pipe_get_plane(igt_pipe_t *pipe, int plane_idx)
> @@ -3658,7 +3658,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_disp=
lay_t *display, igt_output_t
>  	       sizeof(*chosen_outputs) * igt_display_n_crtcs(display));
>=20=20
>  	for (i =3D 0; i < igt_display_n_crtcs(display); i++) {
> -		igt_pipe_t *pipe =3D &display->pipes[i];
> +		igt_pipe_t *pipe =3D igt_crtc_for_pipe(display, i);
>  		if (pipe->valid)
>  			full_pipe_mask |=3D (1 << i);
>  	}
> @@ -4815,7 +4815,7 @@ static int igt_atomic_commit(igt_display_t *display=
, uint32_t flags, void *user_
>  	req =3D drmModeAtomicAlloc();
>=20=20
>  	for_each_pipe(display, pipe) {
> -		igt_pipe_t *pipe_obj =3D &display->pipes[pipe];
> +		igt_pipe_t *pipe_obj =3D igt_crtc_for_pipe(display, pipe);
>  		igt_plane_t *plane;
>=20=20
>  		/*
> @@ -4866,7 +4866,7 @@ display_commit_changed(igt_display_t *display, enum=
 igt_commit_style s)
>  	enum pipe pipe;
>=20=20
>  	for_each_pipe(display, pipe) {
> -		igt_pipe_t *pipe_obj =3D &display->pipes[pipe];
> +		igt_pipe_t *pipe_obj =3D igt_crtc_for_pipe(display, pipe);
>  		igt_plane_t *plane;
>=20=20
>  		if (s =3D=3D COMMIT_ATOMIC) {
> @@ -4969,7 +4969,8 @@ static int do_display_commit(igt_display_t *display,
>  		ret =3D igt_atomic_commit(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL=
);
>  	} else {
>  		for_each_pipe(display, pipe) {
> -			igt_pipe_t *pipe_obj =3D &display->pipes[pipe];
> +			igt_pipe_t *pipe_obj =3D igt_crtc_for_pipe(display,
> +								 pipe);
>=20=20
>  			ret =3D igt_pipe_commit(pipe_obj, s, fail_on_error);
>  			if (ret)
> @@ -5296,7 +5297,7 @@ void igt_output_set_pipe(igt_output_t *output, enum=
 pipe pipe)
>  		old_pipe =3D igt_output_get_driving_pipe(output);
>=20=20
>  	if (pipe !=3D PIPE_NONE)
> -		pipe_obj =3D &display->pipes[pipe];
> +		pipe_obj =3D igt_crtc_for_pipe(display, pipe);
>=20=20
>  	LOG(display, "%s: set_pipe(%s)\n", igt_output_name(output),
>  	    kmstest_pipe_name(pipe));
> @@ -5316,7 +5317,8 @@ void igt_output_set_pipe(igt_output_t *output, enum=
 pipe pipe)
>  		}
>  	}
>=20=20
> -	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, pipe =3D=3D PI=
PE_NONE ? 0 : display->pipes[pipe].crtc_id);
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID,
> +				  pipe =3D=3D PIPE_NONE ? 0 : igt_crtc_for_pipe(display, pipe)->crtc=
_id);
>=20=20
>  	igt_output_refresh(output);
>=20=20
> @@ -5450,7 +5452,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
>   */
>  void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force)
>  {
> -	igt_pipe_t *pipe_obj =3D &display->pipes[pipe];
> +	igt_pipe_t *pipe_obj =3D igt_crtc_for_pipe(display, pipe);
>=20=20
>  	if (force && display->is_atomic) {
>  		igt_output_t *output =3D igt_pipe_get_output(pipe_obj);
> @@ -7196,9 +7198,9 @@ bool igt_check_bigjoiner_support(igt_display_t *dis=
play)
>  				}
>  			}
>=20=20
> -			if (!display->pipes[pipes[i].idx + 1].valid) {
> +			if (!igt_crtc_for_pipe(display, pipes[i].idx + 1)->valid) {
>  				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigj=
oiner Secondary.\n",
> -					 kmstest_pipe_name(display->pipes[pipes[i].idx + 1].pipe));
> +					 kmstest_pipe_name(igt_crtc_for_pipe(display, pipes[i].idx + 1)->pi=
pe));
>  				return false;
>  			}
>=20=20
> @@ -7218,9 +7220,9 @@ bool igt_check_bigjoiner_support(igt_display_t *dis=
play)
>  				 max_dotclock, pipes[i - 1].force_joiner ? "Yes" : "No");
>  			kmstest_dump_mode(pipes[i - 1].mode);
>=20=20
> -			if (!display->pipes[pipes[i - 1].idx + 1].valid) {
> +			if (!igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)->valid) {
>  				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigj=
oiner Secondary.\n",
> -					 kmstest_pipe_name(display->pipes[pipes[i - 1].idx + 1].pipe));
> +					 kmstest_pipe_name(igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)=
->pipe));
>  				return false;
>  			}
>=20=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 5bb5c2cac19c..fd3c8448983e 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1074,7 +1074,8 @@ static inline bool igt_pipe_is_prop_changed(igt_dis=
play_t *display,
>  					    enum pipe pipe,
>  					    enum igt_atomic_crtc_properties prop)
>  {
> -	return igt_pipe_obj_is_prop_changed(&display->pipes[pipe], prop);
> +	return igt_pipe_obj_is_prop_changed(igt_crtc_for_pipe(display, pipe),
> +					    prop);
>  }
>=20=20
>  /**
> @@ -1132,7 +1133,8 @@ static inline void igt_pipe_set_prop_value(igt_disp=
lay_t *display,
>  					   enum igt_atomic_crtc_properties prop,
>  					   uint64_t value)
>  {
> -	igt_pipe_obj_set_prop_value(&display->pipes[pipe], prop, value);
> +	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(display, pipe), prop,
> +				    value);
>  }
>=20=20
>  extern bool igt_pipe_obj_try_prop_enum(igt_pipe_t *pipe,
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 84677fef80d6..9be5cfe8efc1 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -131,7 +131,7 @@ static void test_init(data_t *data)
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
>  	data->pipe_id =3D PIPE_A;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
> index 8a42baa0ba86..ebd6654ee2a1 100644
> --- a/tests/amdgpu/amd_assr.c
> +++ b/tests/amdgpu/amd_assr.c
> @@ -168,7 +168,7 @@ static void present_visual_pattern(data_t *data, igt_=
output_t *output)
>  	mode =3D igt_output_get_mode(output);
>  	igt_assert(mode);
>=20=20
> -	pipe =3D &data->display.pipes[PIPE_A];
> +	pipe =3D igt_crtc_for_pipe(&data->display, PIPE_A);
>  	primary =3D
>  		igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  	igt_output_set_pipe(output, PIPE_A);
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index a3fc39c50a51..40828fa52b1f 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -65,7 +65,7 @@ static void test_init(data_t *data)
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
>  	data->pipe_id =3D PIPE_A;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index 917d30b20a47..fcfbe48d1eeb 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -180,7 +180,7 @@ static void test_init(data_t *data)
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
>  	data->pipe_id =3D PIPE_A;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index 788ff911691d..fe40d0901548 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -65,7 +65,8 @@ static void test_init(data_t *data)
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D PIPE_A + i;
> -		data->pipe[i] =3D &data->display.pipes[data->pipe_id[i]];
> +		data->pipe[i] =3D igt_crtc_for_pipe(&data->display,
> +						  data->pipe_id[i]);
>  		data->primary[i] =3D igt_pipe_get_plane_type(
>  				data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
>  		data->pipe_crc[i] =3D
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index 8d875a5b888f..d80eb65bd263 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -55,7 +55,8 @@ static void test_init(data_t *data)
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D PIPE_A + i;
> -		data->pipe[i] =3D &data->display.pipes[data->pipe_id[i]];
> +		data->pipe[i] =3D igt_crtc_for_pipe(&data->display,
> +						  data->pipe_id[i]);
>  		data->primary[i] =3D igt_pipe_get_plane_type(
>  			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
>  		data->overlay[i] =3D igt_pipe_get_plane_type_index(
> diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
> index 5767d4ac4c11..680b46763af3 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -98,7 +98,7 @@ static void test_init(data_t *data, igt_output_t *outpu=
t)
>=20=20
>  	igt_require(data->pipe_id !=3D PIPE_NONE);
>=20=20
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe_id,
>  					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
> diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_set=
tings.c
> index fb83f3c13932..6e6037ae5fbc 100644
> --- a/tests/amdgpu/amd_link_settings.c
> +++ b/tests/amdgpu/amd_link_settings.c
> @@ -100,7 +100,7 @@ static void test_init(data_t *data, igt_output_t *out=
put)
>=20=20
>  	igt_require(data->pipe_id !=3D PIPE_NONE);
>=20=20
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_output_set_pipe(output, data->pipe_id);
>=20=20
> diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
> index a3e82a33f8f9..27589b865a53 100644
> --- a/tests/amdgpu/amd_mall.c
> +++ b/tests/amdgpu/amd_mall.c
> @@ -62,7 +62,7 @@ static void test_init(data_t *data)
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
>  	data->pipe_id =3D PIPE_A;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
> index 869a3e5c52b7..9771c67338c7 100644
> --- a/tests/amdgpu/amd_max_bpc.c
> +++ b/tests/amdgpu/amd_max_bpc.c
> @@ -56,7 +56,7 @@ static void test_init(data_t *data)
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
>  	data->pipe_id =3D PIPE_A;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
> index 9863ec78d143..1b6b2b730c5b 100644
> --- a/tests/amdgpu/amd_mem_leak.c
> +++ b/tests/amdgpu/amd_mem_leak.c
> @@ -47,7 +47,7 @@ static void test_init(data_t *data)
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
>  	data->pipe_id =3D PIPE_A;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switc=
h.c
> index 8b6b93d68df7..c443578f5f09 100644
> --- a/tests/amdgpu/amd_mode_switch.c
> +++ b/tests/amdgpu/amd_mode_switch.c
> @@ -41,8 +41,8 @@ static void test_init(data_t *data)
>  	for_each_pipe(display, i) {
>  		igt_output_t *output =3D &display->outputs[i];
>=20=20
> -		data->primary[i] =3D igt_pipe_get_plane_type(
> -			&data->display.pipes[i], DRM_PLANE_TYPE_PRIMARY);
> +		data->primary[i] =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->=
display, i),
> +							   DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  		data->output[i] =3D output;
>  	}
> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_m=
ultidisplay_modeset.c
> index 4e97438ad978..91455ed1dfb8 100644
> --- a/tests/amdgpu/amd_multidisplay_modeset.c
> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
> @@ -160,9 +160,9 @@ static void test_init(struct data_t *data)
>  		 * tested
>  		 */
>  		output =3D igt_get_single_output_for_pipe(display, i);
> -		pipes =3D &display->pipes[i];
> -		data->primary[i] =3D igt_pipe_get_plane_type(
> -			&data->display.pipes[i], DRM_PLANE_TYPE_PRIMARY);
> +		pipes =3D igt_crtc_for_pipe(display, i);
> +		data->primary[i] =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->=
display, i),
> +							   DRM_PLANE_TYPE_PRIMARY);
>  		data->output[i] =3D output;
>=20=20
>  		/* dp rx crc only available for eDP, SST DP, MST DP */
> diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
> index 101c89e60e4e..483b30e8ac8f 100644
> --- a/tests/amdgpu/amd_odm.c
> +++ b/tests/amdgpu/amd_odm.c
> @@ -49,7 +49,7 @@ static void test_init(struct data *data)
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
>  	data->pipe_id =3D PIPE_A;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
> index ad7d921d2aa3..0dbac17a6e7f 100644
> --- a/tests/amdgpu/amd_plane.c
> +++ b/tests/amdgpu/amd_plane.c
> @@ -156,7 +156,7 @@ static void test_init(data_t *data)
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D PIPE_A + i;
> -		data->pipe[i] =3D &display->pipes[data->pipe_id[i]];
> +		data->pipe[i] =3D igt_crtc_for_pipe(display, data->pipe_id[i]);
>  		data->primary[i] =3D igt_pipe_get_plane_type(
>  			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
>  		data->overlay[i] =3D igt_pipe_get_plane_type_index(
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index 040c39f0abdb..789d243f8e86 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -172,7 +172,7 @@ static void test_init(data_t *data)
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
>  	data->pipe_id =3D PIPE_A;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> index d06f56df233c..8b194f797938 100644
> --- a/tests/amdgpu/amd_replay.c
> +++ b/tests/amdgpu/amd_replay.c
> @@ -62,7 +62,7 @@ static void test_init(struct test_data *data)
>=20=20
>  	/* It doesn't matter which pipe we choose on amdpgu. */
>  	data->pipe_id =3D PIPE_A;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_display_reset(display);
>=20=20
> diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
> index fca9d6036ca2..a0a546a3e398 100644
> --- a/tests/amdgpu/amd_subvp.c
> +++ b/tests/amdgpu/amd_subvp.c
> @@ -65,7 +65,8 @@ static void test_init(struct data *data)
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D PIPE_A + i;
> -		data->pipe[i] =3D &data->display.pipes[data->pipe_id[i]];
> +		data->pipe[i] =3D igt_crtc_for_pipe(&data->display,
> +						  data->pipe_id[i]);
>  		data->primary[i] =3D igt_pipe_get_plane_type(data->pipe[i],
>  							   DRM_PLANE_TYPE_PRIMARY);
>  		data->pipe_crc[i] =3D igt_pipe_crc_new(data->fd,
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_=
chamelium_color.c
> index fd4f2aad46d6..195556c9368c 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -433,16 +433,16 @@ prep_pipe(data_t *data, enum pipe p)
>  {
>  	igt_require_pipe(&data->display, p);
>=20=20
> -	if (igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_DEGAMMA_LUT=
_SIZE)) {
> +	if (igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRT=
C_DEGAMMA_LUT_SIZE)) {
>  		data->degamma_lut_size =3D
> -			igt_pipe_obj_get_prop(&data->display.pipes[p],
> +			igt_pipe_obj_get_prop(igt_crtc_for_pipe(&data->display, p),
>  					      IGT_CRTC_DEGAMMA_LUT_SIZE);
>  		igt_assert_lt(0, data->degamma_lut_size);
>  	}
>=20=20
> -	if (igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_GAMMA_LUT_S=
IZE)) {
> +	if (igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRT=
C_GAMMA_LUT_SIZE)) {
>  		data->gamma_lut_size =3D
> -			igt_pipe_obj_get_prop(&data->display.pipes[p],
> +			igt_pipe_obj_get_prop(igt_crtc_for_pipe(&data->display, p),
>  					      IGT_CRTC_GAMMA_LUT_SIZE);
>  		igt_assert_lt(0, data->gamma_lut_size);
>  	}
> @@ -456,7 +456,7 @@ static int test_setup(data_t *data, enum pipe p)
>  	igt_display_reset(&data->display);
>  	prep_pipe(data, p);
>=20=20
> -	pipe =3D &data->display.pipes[p];
> +	pipe =3D igt_crtc_for_pipe(&data->display, p);
>  	igt_require(pipe->n_planes >=3D 0);
>=20=20
>  	data->primary =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/cha=
melium/kms_chamelium_sharpness_filter.c
> index 014532d5c6b8..25e0275630f0 100644
> --- a/tests/chamelium/kms_chamelium_sharpness_filter.c
> +++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
> @@ -180,7 +180,7 @@ static int test_setup(data_t *data, enum pipe p)
>=20=20
>  	igt_display_reset(&data->display);
>=20=20
> -	pipe =3D &data->display.pipes[p];
> +	pipe =3D igt_crtc_for_pipe(&data->display, p);
>  	igt_require(pipe->n_planes >=3D 0);
>=20=20
>  	data->primary =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> @@ -217,7 +217,7 @@ static void test_sharpness_filter(data_t *data,  enum=
 pipe p)
>  	int port_idx =3D test_setup(data, p);
>=20=20
>  	igt_require(port_idx >=3D 0);
> -	igt_require(igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_SHA=
RPNESS_STRENGTH));
> +	igt_require(igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, p),=
 IGT_CRTC_SHARPNESS_STRENGTH));
>=20=20
>  	if (!pipe_output_combo_valid(data, p))
>  		return;
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index 5f58cfe699a4..0d4aa1bd33cb 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -1035,7 +1035,7 @@ static void display_helper(igt_display_t *dpy, int =
*done)
>  		int pipe;
>=20=20
>  		pipe =3D rand() % igt_display_n_crtcs(dpy);
> -		if (!dpy->pipes[pipe].valid)
> +		if (!igt_crtc_for_pipe(dpy, pipe)->valid)
>  			continue;
>  		output =3D igt_get_single_output_for_pipe(dpy, pipe);
>  		if (!output)
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index b80b7d33ee6c..49edf744f943 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -1226,7 +1226,7 @@ static void test_display_protected_crc(int i915, ig=
t_display_t *display)
>  	/* Do a modeset on all outputs */
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
> -		pipe =3D &display->pipes[i];
> +		pipe =3D igt_crtc_for_pipe(display, i);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(i, output));
>  		igt_output_set_pipe(output, i);
> @@ -1243,7 +1243,7 @@ static void test_display_protected_crc(int i915, ig=
t_display_t *display)
>=20=20
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
> -		pipe =3D &display->pipes[output->pending_pipe];
> +		pipe =3D igt_crtc_for_pipe(display, output->pending_pipe);
>  		pipe_crc =3D igt_pipe_crc_new(i915, pipe->pipe,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 686c6772ef4b..7316547d276d 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -375,7 +375,7 @@ static void prep_fb(data_t *data)
>=20=20
>  static void set_c8_lut(data_t *data)
>  {
> -	igt_pipe_t *pipe =3D &data->display.pipes[data->pipe];
> +	igt_pipe_t *pipe =3D igt_crtc_for_pipe(&data->display, data->pipe);
>  	struct drm_color_lut *lut;
>  	int i, lut_size =3D 256;
>=20=20
> @@ -396,7 +396,7 @@ static void set_c8_lut(data_t *data)
>=20=20
>  static void unset_lut(data_t *data)
>  {
> -	igt_pipe_t *pipe =3D &data->display.pipes[data->pipe];
> +	igt_pipe_t *pipe =3D igt_crtc_for_pipe(&data->display, data->pipe);
>=20=20
>  	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, NULL, 0);
>  }
> @@ -517,7 +517,7 @@ static bool test_pipe(data_t *data)
>  		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
>=20=20
>  	if (data->format =3D=3D DRM_FORMAT_C8 &&
> -	    !igt_pipe_obj_has_prop(&data->display.pipes[data->pipe],
> +	    !igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, data->pipe=
),
>  				   IGT_CRTC_GAMMA_LUT))
>  		return false;
>=20=20
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index b2eb418db1fa..53ed4b39813b 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -130,7 +130,7 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
>  		igt_assert(gem_bo_busy(dpy->drm_fd, fb->gem_handle));
>  		if (!modeset)
>  			do_or_die(drmModePageFlip(dpy->drm_fd,
> -						  dpy->pipes[pipe].crtc_id, fb->fb_id,
> +						  igt_crtc_for_pipe(dpy, pipe)->crtc_id, fb->fb_id,
>  						  DRM_MODE_PAGE_FLIP_EVENT, fb));
>  		else {
>  			igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRI=
MARY), fb);
> @@ -204,7 +204,7 @@ static void test_flip(igt_display_t *dpy, int pipe,
>  		struct drm_event_vblank ev;
>=20=20
>  		do_or_die(drmModePageFlip(dpy->drm_fd,
> -					  dpy->pipes[pipe].crtc_id,
> +					  igt_crtc_for_pipe(dpy, pipe)->crtc_id,
>  					  fb[warmup[i]].fb_id,
>  					  DRM_MODE_PAGE_FLIP_EVENT,
>  					  &fb[warmup[i]]));
> @@ -335,7 +335,7 @@ test_pageflip_modeset_hang(igt_display_t *dpy,
>  			 .dependency =3D fb.gem_handle,
>  			 .flags =3D IGT_SPIN_NO_PREEMPTION);
>=20=20
> -	do_or_die(drmModePageFlip(dpy->drm_fd, dpy->pipes[pipe].crtc_id, fb.fb_=
id, DRM_MODE_PAGE_FLIP_EVENT, &fb));
> +	do_or_die(drmModePageFlip(dpy->drm_fd, igt_crtc_for_pipe(dpy, pipe)->cr=
tc_id, fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT, &fb));
>=20=20
>  	/* Kill crtc with hung fb */
>  	igt_plane_set_fb(primary, NULL);
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 8238b89582ee..3aeaba226cda 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -240,7 +240,7 @@ static void set_mode(data_t *data, int count, drmMode=
ModeInfo *mode,
>  	igt_plane_t *plane;
>=20=20
>  	for (int i =3D 0; i < count; i++) {
> -		pipe =3D &display->pipes[i];
> +		pipe =3D igt_crtc_for_pipe(display, i);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  		igt_output_override_mode(valid_outputs[i], &mode[i]);
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_sca=
led_crc.c
> index f057b5070bcb..dd5967c91486 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -537,7 +537,7 @@ static void free_fbs(data_t *data)
>=20=20
>  static void set_lut(data_t *data, enum pipe pipe)
>  {
> -	igt_pipe_t *pipe_obj =3D &data->display.pipes[pipe];
> +	igt_pipe_t *pipe_obj =3D igt_crtc_for_pipe(&data->display, pipe);
>  	struct drm_color_lut *lut;
>  	drmModeCrtc *drm_crtc;
>  	int i, lut_size;
> @@ -569,7 +569,7 @@ static void set_lut(data_t *data, enum pipe pipe)
>=20=20
>  static void clear_lut(data_t *data, enum pipe pipe)
>  {
> -	igt_pipe_t *pipe_obj =3D &data->display.pipes[pipe];
> +	igt_pipe_t *pipe_obj =3D igt_crtc_for_pipe(&data->display, pipe);
>=20=20
>  	igt_pipe_obj_set_prop_value(pipe_obj, IGT_CRTC_GAMMA_LUT, 0);
>  }
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_fro=
ntbuffer_tracking.c
> index c32f9c582e86..069f03a6c9f1 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1110,21 +1110,24 @@ static void init_mode_params(struct modeset_param=
s *params,
>  	params->output =3D output;
>  	params->mode =3D *mode;
>=20=20
> -	params->primary.plane =3D igt_pipe_get_plane_type(&drm.display.pipes[pi=
pe], DRM_PLANE_TYPE_PRIMARY);
> +	params->primary.plane =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&dr=
m.display, pipe),
> +							DRM_PLANE_TYPE_PRIMARY);
>  	params->primary.fb =3D NULL;
>  	params->primary.x =3D 0;
>  	params->primary.y =3D 0;
>  	params->primary.w =3D mode->hdisplay;
>  	params->primary.h =3D mode->vdisplay;
>=20=20
> -	params->cursor.plane =3D igt_pipe_get_plane_type(&drm.display.pipes[pip=
e], DRM_PLANE_TYPE_CURSOR);
> +	params->cursor.plane =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&drm=
.display, pipe),
> +						       DRM_PLANE_TYPE_CURSOR);
>  	params->cursor.fb =3D NULL;
>  	params->cursor.x =3D 0;
>  	params->cursor.y =3D 0;
>  	params->cursor.w =3D 64;
>  	params->cursor.h =3D 64;
>=20=20
> -	params->sprite.plane =3D igt_pipe_get_plane_type(&drm.display.pipes[pip=
e], DRM_PLANE_TYPE_OVERLAY);
> +	params->sprite.plane =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&drm=
.display, pipe),
> +						       DRM_PLANE_TYPE_OVERLAY);
>  	igt_require(params->sprite.plane);
>  	params->sprite.fb =3D NULL;
>  	params->sprite.x =3D 0;
> @@ -3112,7 +3115,8 @@ static void page_flip_for_params(struct modeset_par=
ams *params,
>=20=20
>  	switch (type) {
>  	case FLIP_PAGEFLIP:
> -		rc =3D drmModePageFlip(drm.fd, drm.display.pipes[params->pipe].crtc_id,
> +		rc =3D drmModePageFlip(drm.fd,
> +				     igt_crtc_for_pipe(&drm.display, params->pipe)->crtc_id,
>  				     params->primary.fb->fb_id,
>  				     DRM_MODE_PAGE_FLIP_EVENT, NULL);
>  		igt_assert_eq(rc, 0);
> @@ -3724,7 +3728,9 @@ static void stridechange_subtest(const struct test_=
mode *t)
>  	 * Try to set a new stride. with the page flip api. This is allowed
>  	 * with the atomic page flip helper, but not with the legacy page flip.
>  	 */
> -	rc =3D drmModePageFlip(drm.fd, drm.display.pipes[params->pipe].crtc_id,=
 new_fb->fb_id, 0, NULL);
> +	rc =3D drmModePageFlip(drm.fd,
> +			     igt_crtc_for_pipe(&drm.display, params->pipe)->crtc_id,
> +			     new_fb->fb_id, 0, NULL);
>  	igt_assert(rc =3D=3D -EINVAL || rc =3D=3D 0);
>  	do_assertions(rc ? 0 : DONT_ASSERT_FBC_STATUS);
>  }
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_hel=
per.c
> index d2a3117fec26..a59efcd1217a 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -105,7 +105,7 @@ void igt_set_all_master_pipes_for_platform(igt_displa=
y_t *display, uint32_t *mas
>=20=20
>  	*master_pipes =3D 0;
>  	for (pipe =3D PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
> -		if (display->pipes[pipe].valid && display->pipes[pipe + 1].valid) {
> +		if (igt_crtc_for_pipe(display, pipe)->valid && igt_crtc_for_pipe(displ=
ay, pipe + 1)->valid) {
>  			*master_pipes |=3D BIT(pipe);
>  			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
>  		}
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 282288f8e943..7d212a07cb75 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -588,8 +588,8 @@ static void stress_pipes(struct data *data, struct ti=
mespec *start,
>  		if (!data->highest_mode[pipe])
>  			continue;
>=20=20
> -		igt_assert_f(data->display.pipes[pipe].n_planes < MAX_PLANES,
> -			    "Currently we don't support more than %d planes!",
> +		igt_assert_f(igt_crtc_for_pipe(&data->display, pipe)->n_planes < MAX_P=
LANES,
> +			     "Currently we don't support more than %d planes!",
>  			     MAX_PLANES);
>=20=20
>  		ret =3D pipe_stress(data, output, pipe,
> @@ -748,7 +748,8 @@ static void destroy_framebuffers(struct data *data)
>=20=20
>  		for (j =3D 0; j < MAX_PLANES; j++) {
>  			if (data->fb[i * MAX_PLANES + j].fb_id) {
> -				igt_plane_set_fb(&data->display.pipes[i].planes[j], NULL);
> +				igt_plane_set_fb(&igt_crtc_for_pipe(&data->display, i)->planes[j],
> +						 NULL);
>  				igt_remove_fb(data->display.drm_fd, &data->fb[i * MAX_PLANES + j]);
>  				data->fb[i * MAX_PLANES + j].fb_id =3D 0;
>  			}
> @@ -812,7 +813,8 @@ static void prepare_test(struct data *data)
>  			data->pipe_crc[i] =3D NULL;
>=20=20
>  		if (data->num_planes[i] =3D=3D -1)
> -			data->num_planes[i] =3D data->display.pipes[i].n_planes;
> +			data->num_planes[i] =3D igt_crtc_for_pipe(&data->display,
> +								i)->n_planes;
>=20=20
>  		igt_info("Max number of planes is %d for pipe %d\n",
>  			 data->num_planes[i], i);
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index dbdd7b3e3eaa..47b2db268568 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -697,7 +697,9 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
>  	/* Wait for the vblank to sync the frame time */
> -	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_=
offset, 1);
> +	igt_wait_for_vblank_count(data->drm_fd,
> +				  igt_crtc_for_pipe(&data->display, pipe)->crtc_offset,
> +				  1);
>  	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
>  	/* Add a half-frame delay to ensure the flip occurs when the frame is a=
ctive. */
>  	usleep(delay * 0.5);
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpne=
ss_filter.c
> index 41a42c60868a..3714153276b0 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -436,7 +436,7 @@ run_sharpness_filter_test(data_t *data, enum test_typ=
e type)
>=20=20
>  			data->output =3D output;
>  			data->pipe_id =3D pipe;
> -			data->pipe =3D &display->pipes[data->pipe_id];
> +			data->pipe =3D igt_crtc_for_pipe(display, data->pipe_id);
>  			data->mode =3D igt_output_get_mode(data->output);
>=20=20
>  			if (!has_sharpness_filter(data->pipe)) {
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 8fd5ace40b07..ef95b50cd1ab 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1066,7 +1066,7 @@ static void prepare_crtc(data_t *data, int fd, igt_=
output_t *output)
>  	igt_display_commit(display);
>=20=20
>  	igt_wait_for_vblank(fd,
> -			display->pipes[data->pipe].crtc_offset);
> +			igt_crtc_for_pipe(display, data->pipe)->crtc_offset);
>  }
>=20=20
>  static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index c6274bf616bf..351897e1ce68 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -845,7 +845,7 @@ static void compare_crcs(int fd, igt_display_t *displ=
ay, igt_fb_t *ref_fb, igt_f
>=20=20
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
> -		pipe =3D &display->pipes[output->pending_pipe];
> +		pipe =3D igt_crtc_for_pipe(display, output->pending_pipe);
>  		pipe_crc =3D igt_pipe_crc_new(fd, pipe->pipe,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> @@ -902,7 +902,7 @@ static void test_display_pxp_fb(int fd, igt_display_t=
 *display)
>  	/* Do a modeset on all outputs */
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
> -		pipe =3D &display->pipes[i];
> +		pipe =3D igt_crtc_for_pipe(display, i);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(i, output));
>  		igt_output_set_pipe(output, i);
> @@ -959,7 +959,7 @@ static void test_display_black_pxp_fb(int fd, igt_dis=
play_t *display)
>  	/* Do a modeset on all outputs */
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
> -		pipe =3D &display->pipes[i];
> +		pipe =3D igt_crtc_for_pipe(display, i);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>  		igt_require(igt_pipe_connector_valid(i, output));
>  		igt_output_set_pipe(output, i);
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 6b2da0013b25..6762f172c4fa 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -299,7 +299,7 @@ static void test_init(data_t *data)
>=20=20
>  	mode =3D igt_output_get_mode(data->output);
>=20=20
> -	data->crtc_id =3D data->display.pipes[data->pipe].crtc_id;
> +	data->crtc_id =3D igt_crtc_for_pipe(&data->display, data->pipe)->crtc_i=
d;
>  	data->refresh_rate =3D mode->vrefresh;
>=20=20
>  	igt_output_set_pipe(data->output, data->pipe);
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index d25528e65fa5..01a058673913 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -488,7 +488,7 @@ plane_immutable_zpos(data_t *data, igt_output_t *outp=
ut, enum pipe pipe, int n_p
>  		int zpos;
>  		igt_plane_t *temp;
>=20=20
> -		temp =3D &data->display.pipes[pipe].planes[k];
> +		temp =3D &igt_crtc_for_pipe(&data->display, pipe)->planes[k];
>=20=20
>  		if (!igt_plane_has_prop(temp, IGT_PLANE_ZPOS))
>  			continue;
> @@ -1333,8 +1333,9 @@ static void atomic_setup(data_t *data, enum pipe pi=
pe, igt_output_t *output)
>  	igt_display_reset(&data->display);
>  	igt_output_set_pipe(output, pipe);
>=20=20
> -	data->primary =3D igt_pipe_get_plane_type(&data->display.pipes[pipe], D=
RM_PLANE_TYPE_PRIMARY);
> -	data->pipe =3D &data->display.pipes[pipe];
> +	data->primary =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->disp=
lay, pipe),
> +						DRM_PLANE_TYPE_PRIMARY);
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, pipe);
>  	mode =3D igt_output_get_mode(output);
>=20=20
>  	igt_create_pattern_fb(data->drm_fd,
> @@ -1418,7 +1419,8 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>  	igt_subtest_with_dynamic("plane-overlay-legacy") {
>  		for_each_pipe_with_single_output(&data.display, pipe, output) {
>  			igt_plane_t *overlay =3D
> -				igt_pipe_get_plane_type(&data.display.pipes[pipe], DRM_PLANE_TYPE_OV=
ERLAY);
> +				igt_pipe_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
> +							DRM_PLANE_TYPE_OVERLAY);
>  			uint32_t format =3D plane_get_igt_format(overlay);
>=20=20
>  			if (!pipe_output_combo_valid(&data.display, pipe, output))
> @@ -1456,7 +1458,8 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>  	igt_subtest_with_dynamic("plane-primary-overlay-mutable-zpos") {
>  		for_each_pipe_with_single_output(&data.display, pipe, output) {
>  			igt_plane_t *overlay =3D
> -				igt_pipe_get_plane_type(&data.display.pipes[pipe], DRM_PLANE_TYPE_OV=
ERLAY);
> +				igt_pipe_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
> +							DRM_PLANE_TYPE_OVERLAY);
>=20=20
>  			if (!pipe_output_combo_valid(&data.display, pipe, output))
>  				continue;
> @@ -1483,7 +1486,7 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>  		     "only higher zpos planes cover the lower zpos ones.");
>  	igt_subtest_with_dynamic("plane-immutable-zpos") {
>  		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			int n_planes =3D data.display.pipes[pipe].n_planes;
> +			int n_planes =3D igt_crtc_for_pipe(&data.display, pipe)->n_planes;
>=20=20
>  			if (!pipe_output_combo_valid(&data.display, pipe, output))
>  				continue;
> @@ -1527,7 +1530,8 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>  	igt_subtest_with_dynamic("plane-cursor-legacy") {
>  		for_each_pipe_with_single_output(&data.display, pipe, output) {
>  			igt_plane_t *cursor =3D
> -				igt_pipe_get_plane_type(&data.display.pipes[pipe], DRM_PLANE_TYPE_CU=
RSOR);
> +				igt_pipe_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
> +							DRM_PLANE_TYPE_CURSOR);
>=20=20
>  			if (!pipe_output_combo_valid(&data.display, pipe, output))
>  				continue;
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 18f79136c30f..ab04b9f711b7 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -163,14 +163,14 @@ run_primary_test(data_t *data, enum pipe pipe, igt_=
output_t *output)
>=20=20
>  		if (!(i & 1))
>  			igt_wait_for_vblank(data->drm_fd,
> -					data->display.pipes[pipe].crtc_offset);
> +					igt_crtc_for_pipe(&data->display, pipe)->crtc_offset);
>=20=20
>  		igt_plane_set_fb(primary, (i & 1) ? fb : NULL);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
>  		if (i & 1)
>  			igt_wait_for_vblank(data->drm_fd,
> -					data->display.pipes[pipe].crtc_offset);
> +					igt_crtc_for_pipe(&data->display, pipe)->crtc_offset);
>=20=20
>  		igt_plane_set_fb(primary, (i & 1) ? NULL : fb);
>  	}
> @@ -327,7 +327,7 @@ static void setup_parms(data_t *data, enum pipe pipe,
>  	uint64_t cursor_width, cursor_height;
>  	unsigned sprite_width, sprite_height, prev_w, prev_h;
>  	bool max_sprite_width, max_sprite_height, alpha =3D true;
> -	uint32_t n_planes =3D data->display.pipes[pipe].n_planes;
> +	uint32_t n_planes =3D igt_crtc_for_pipe(&data->display, pipe)->n_planes;
>  	uint32_t n_overlays =3D 0, overlays[n_planes];
>  	igt_plane_t *plane;
>  	uint32_t iter_mask =3D 3;
> @@ -438,7 +438,8 @@ static void setup_parms(data_t *data, enum pipe pipe,
>  			igt_assert_f(n_planes >=3D 3, "No planes left to proceed with!");
>  			if (n_overlays > 0) {
>  				uint32_t plane_to_remove =3D hars_petruska_f54_1_random_unsafe_max(n=
_overlays);
> -				removed_plane =3D &data->display.pipes[pipe].planes[overlays[plane_t=
o_remove]];
> +				removed_plane =3D &igt_crtc_for_pipe(&data->display,
> +								   pipe)->planes[overlays[plane_to_remove]];
>  				igt_plane_set_fb(removed_plane, NULL);
>  				while (plane_to_remove < (n_overlays - 1)) {
>  					overlays[plane_to_remove] =3D overlays[plane_to_remove + 1];
> @@ -479,7 +480,7 @@ static void prepare_fencing(data_t *data, enum pipe p=
ipe)
>=20=20
>  	igt_require_sw_sync();
>=20=20
> -	n_planes =3D data->display.pipes[pipe].n_planes;
> +	n_planes =3D igt_crtc_for_pipe(&data->display, pipe)->n_planes;
>  	timeline =3D calloc(n_planes, sizeof(*timeline));
>  	igt_assert_f(timeline !=3D NULL, "Failed to allocate memory for timelin=
es\n");
>  	thread =3D calloc(n_planes, sizeof(*thread));
> @@ -510,7 +511,7 @@ static void unprepare_fencing(data_t *data, enum pipe=
 pipe)
>  static void atomic_commit(data_t *data_v, enum pipe pipe, unsigned int f=
lags, void *data, bool fencing)
>  {
>  	if (fencing)
> -		igt_pipe_request_out_fence(&data_v->display.pipes[pipe]);
> +		igt_pipe_request_out_fence(igt_crtc_for_pipe(&data_v->display, pipe));
>=20=20
>  	igt_display_commit_atomic(&data_v->display, flags, data);
>  }
> @@ -528,7 +529,7 @@ static int fd_completed(int fd)
>  static void wait_for_transition(data_t *data, enum pipe pipe, bool nonbl=
ocking, bool fencing)
>  {
>  	if (fencing) {
> -		int fence_fd =3D data->display.pipes[pipe].out_fence_fd;
> +		int fence_fd =3D igt_crtc_for_pipe(&data->display, pipe)->out_fence_fd;
>=20=20
>  		if (!nonblocking)
>  			igt_assert(fd_completed(fence_fd));
> @@ -557,7 +558,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt=
_output_t *output,
>  {
>  	drmModeModeInfo *mode, override_mode;
>  	igt_plane_t *plane;
> -	igt_pipe_t *pipe_obj =3D &data->display.pipes[pipe];
> +	igt_pipe_t *pipe_obj =3D igt_crtc_for_pipe(&data->display, pipe);
>  	uint32_t iter_max, i;
>  	struct plane_parms parms[pipe_obj->n_planes];
>  	unsigned flags =3D 0;
> @@ -804,8 +805,8 @@ static unsigned set_combinations(data_t *data, unsign=
ed mask, struct igt_fb *fb)
>  	unset_output_pipe(&data->display);
>=20=20
>  	for_each_pipe(&data->display, pipe) {
> -		igt_plane_t *plane =3D igt_pipe_get_plane_type(&data->display.pipes[pi=
pe],
> -			DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_t *plane =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&data=
->display, pipe),
> +							     DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  		enum pipe old_pipe =3D plane->ref->pipe->pipe;
>=20=20
> @@ -814,8 +815,8 @@ static unsigned set_combinations(data_t *data, unsign=
ed mask, struct igt_fb *fb)
>  		 * currently is holding the plane
>  		 */
>  		if (old_pipe !=3D pipe) {
> -			igt_plane_t *old_plane =3D igt_pipe_get_plane_type(&data->display.pip=
es[old_pipe],
> -				DRM_PLANE_TYPE_PRIMARY);
> +			igt_plane_t *old_plane =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(=
&data->display, old_pipe),
> +									 DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  			igt_plane_set_fb(old_plane, NULL);
>  			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> @@ -823,8 +824,8 @@ static unsigned set_combinations(data_t *data, unsign=
ed mask, struct igt_fb *fb)
>  	}
>=20=20
>  	for_each_pipe(&data->display, pipe) {
> -		igt_plane_t *plane =3D igt_pipe_get_plane_type(&data->display.pipes[pi=
pe],
> -			DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_t *plane =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&data=
->display, pipe),
> +							     DRM_PLANE_TYPE_PRIMARY);
>  		drmModeModeInfo *mode =3D NULL;
>=20=20
>  		if (!(mask & (1 << pipe))) {
> @@ -918,7 +919,7 @@ retry:
>  				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .5, .5, .5, &data->f=
bs[1]);
>=20=20
>  	for_each_pipe(&data->display, i) {
> -		igt_pipe_t *pipe =3D &data->display.pipes[i];
> +		igt_pipe_t *pipe =3D igt_crtc_for_pipe(&data->display, i);
>  		igt_plane_t *plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PR=
IMARY);
>  		drmModeModeInfo *mode =3D NULL;
>=20=20
> @@ -953,7 +954,7 @@ retry:
>  			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>=20=20
>  			if (fencing)
> -				igt_pipe_request_out_fence(&data->display.pipes[i]);
> +				igt_pipe_request_out_fence(igt_crtc_for_pipe(&data->display, i));
>  		} else {
>  			igt_plane_set_fb(plane, NULL);
>  		}
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 9100dd329e30..a8a094f4d1f1 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -125,7 +125,8 @@ static void test_init(data_t *data, bool physical)
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D i;
> -		data->pipe[i] =3D &data->display.pipes[data->pipe_id[i]];
> +		data->pipe[i] =3D igt_crtc_for_pipe(&data->display,
> +						  data->pipe_id[i]);
>  		data->primary[i] =3D igt_pipe_get_plane_type(
>  			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
>  		data->pipe_crc[i] =3D
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index b3f3a34a559c..d7c713a775b0 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -724,16 +724,16 @@ prep_pipe(data_t *data, enum pipe p)
>  {
>  	igt_require_pipe(&data->display, p);
>=20=20
> -	if (igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_DEGAMMA_LUT=
_SIZE)) {
> +	if (igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRT=
C_DEGAMMA_LUT_SIZE)) {
>  		data->degamma_lut_size =3D
> -			igt_pipe_obj_get_prop(&data->display.pipes[p],
> +			igt_pipe_obj_get_prop(igt_crtc_for_pipe(&data->display, p),
>  					      IGT_CRTC_DEGAMMA_LUT_SIZE);
>  		igt_assert_lt(0, data->degamma_lut_size);
>  	}
>=20=20
> -	if (igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_GAMMA_LUT_S=
IZE)) {
> +	if (igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRT=
C_GAMMA_LUT_SIZE)) {
>  		data->gamma_lut_size =3D
> -			igt_pipe_obj_get_prop(&data->display.pipes[p],
> +			igt_pipe_obj_get_prop(igt_crtc_for_pipe(&data->display, p),
>  					      IGT_CRTC_GAMMA_LUT_SIZE);
>  		igt_assert_lt(0, data->gamma_lut_size);
>  	}
> @@ -746,7 +746,7 @@ static void test_setup(data_t *data, enum pipe p)
>  	prep_pipe(data, p);
>  	igt_require_pipe_crc(data->drm_fd);
>=20=20
> -	pipe =3D &data->display.pipes[p];
> +	pipe =3D igt_crtc_for_pipe(&data->display, p);
>  	igt_require(pipe->n_planes >=3D 0);
>=20=20
>  	data->primary =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> index 143dff43e76b..3ca56138e97d 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -319,7 +319,7 @@ invalid_lut_sizes(data_t *data, enum pipe p,
>  		  enum igt_atomic_crtc_properties prop, int size)
>  {
>  	igt_display_t *display =3D &data->display;
> -	igt_pipe_t *pipe =3D &display->pipes[p];
> +	igt_pipe_t *pipe =3D igt_crtc_for_pipe(display, p);
>  	struct drm_color_lut *lut;
>  	size_t lut_size =3D size * sizeof(lut[0]);
>=20=20
> @@ -362,7 +362,7 @@ invalid_degamma_lut_sizes(data_t *data, enum pipe p)
>  void invalid_ctm_matrix_sizes(data_t *data, enum pipe p)
>  {
>  	igt_display_t *display =3D &data->display;
> -	igt_pipe_t *pipe =3D &display->pipes[p];
> +	igt_pipe_t *pipe =3D igt_crtc_for_pipe(display, p);
>  	void *ptr;
>=20=20
>  	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_CTM));
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index bb8cbe703622..b3cc2cec4931 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -306,7 +306,7 @@ test_resolution_with_output(data_t *data, enum pipe p=
ipe, int max_planes, igt_ou
>  static void
>  run_test(data_t *data, enum pipe pipe, igt_output_t *output)
>  {
> -	int n_planes =3D data->display.pipes[pipe].n_planes;
> +	int n_planes =3D igt_crtc_for_pipe(&data->display, pipe)->n_planes;
>  	igt_display_reset(&data->display);
>=20=20
>  	if (!opt.user_seed)
> @@ -346,7 +346,7 @@ run_tests_for_pipe(data_t *data)
>  			if (!intel_pipe_output_combo_valid(&data->display))
>  				continue;
>=20=20
> -			igt_require(data->display.pipes[pipe].n_planes > 0);
> +			igt_require(igt_crtc_for_pipe(&data->display, pipe)->n_planes > 0);
>  			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output))
>  				run_test(data, pipe, output);
>  		}
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 7ca2ca82c0bd..fe5a63eb0a64 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -215,7 +215,7 @@ static void cursor_disable(data_t *data)
>=20=20
>  	/* do this wait here so it will not need to be added everywhere */
>  	igt_wait_for_vblank_count(data->drm_fd,
> -				  data->display.pipes[data->pipe].crtc_offset,
> +				  igt_crtc_for_pipe(&data->display, data->pipe)->crtc_offset,
>  				  data->vblank_wait_count);
>  }
>=20=20
> @@ -301,7 +301,7 @@ static void do_single_test(data_t *data, int x, int y=
, bool hw_test,
>=20=20
>  		/* Extra vblank wait is because nonblocking cursor ioctl */
>  		igt_wait_for_vblank_count(data->drm_fd,
> -					  display->pipes[data->pipe].crtc_offset,
> +					  igt_crtc_for_pipe(display, data->pipe)->crtc_offset,
>  					  data->vblank_wait_count);
>=20=20
>  		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
> @@ -351,7 +351,7 @@ static void do_single_test(data_t *data, int x, int y=
, bool hw_test,
>  		 */
>  		if (is_amdgpu_device(data->drm_fd))
>  			igt_wait_for_vblank_count(data->drm_fd,
> -				display->pipes[data->pipe].crtc_offset,
> +				igt_crtc_for_pipe(display, data->pipe)->crtc_offset,
>  				data->vblank_wait_count);
>=20=20
>  		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
> @@ -736,7 +736,7 @@ static void timed_cursor_changes(data_t *data, void (=
changefunc)(data_t *, enum
>=20=20
>  	/* Extra vblank wait is because nonblocking cursor ioctl */
>  	igt_wait_for_vblank_count(data->drm_fd,
> -				  data->display.pipes[data->pipe].crtc_offset,
> +				  igt_crtc_for_pipe(&data->display, data->pipe)->crtc_offset,
>  				  data->vblank_wait_count);
>=20=20
>  	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc1);
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 27f861378763..e84dfeb9aefb 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -127,7 +127,7 @@ static void cursor_move(data_t *data, int x, int y, i=
nt i)
>  		   (IS_CHERRYVIEW(data->devid) && data->pipe =3D=3D PIPE_C &&
>  		    x < 0 && x > -data->curw));
>  	igt_wait_for_vblank(data->drm_fd,
> -			display->pipes[data->pipe].crtc_offset);
> +			igt_crtc_for_pipe(display, data->pipe)->crtc_offset);
>  }
>=20=20
>  #define XSTEP 8
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index ec35992bac6a..566d920124ad 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -289,13 +289,15 @@ static void stress(igt_display_t *display,
>  	if (pipe < 0) {
>  		num_crtcs =3D igt_display_n_crtcs(display);
>  		for_each_pipe(display, n) {
> -			arg.crtc_id =3D crtc_id[n] =3D display->pipes[n].crtc_id;
> +			arg.crtc_id =3D crtc_id[n] =3D igt_crtc_for_pipe(display,
> +								     n)->crtc_id;
>  			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
>  		}
>  	} else {
>  		num_crtcs =3D 1;
> -		if(display->pipes[pipe].valid) {
> -			arg.crtc_id =3D crtc_id[0] =3D display->pipes[pipe].crtc_id;
> +		if(igt_crtc_for_pipe(display, pipe)->valid) {
> +			arg.crtc_id =3D crtc_id[0] =3D igt_crtc_for_pipe(display,
> +								     pipe)->crtc_id;
>  			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
>  		}
>  	}
> @@ -410,7 +412,7 @@ static void set_cursor_hotspot(igt_plane_t *cursor, i=
nt  hot_x, int hot_y)
>  static void populate_cursor_args(igt_display_t *display, enum pipe pipe,
>  				 struct drm_mode_cursor *arg, struct igt_fb *fb)
>  {
> -	arg->crtc_id =3D display->pipes[pipe].crtc_id;
> +	arg->crtc_id =3D igt_crtc_for_pipe(display, pipe)->crtc_id;
>  	arg->flags =3D DRM_MODE_CURSOR_MOVE;
>  	arg->x =3D 128;
>  	arg->y =3D 128;
> @@ -468,7 +470,7 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>=20=20
>  static void flip_nonblocking(igt_display_t *display, enum pipe pipe_id, =
bool atomic, struct igt_fb *fb, void *data)
>  {
> -	igt_pipe_t *pipe =3D &display->pipes[pipe_id];
> +	igt_pipe_t *pipe =3D igt_crtc_for_pipe(display, pipe_id);
>  	igt_plane_t *primary =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_P=
RIMARY);
>  	int ret;
>=20=20
> @@ -532,7 +534,7 @@ static void transition_nonblocking(igt_display_t *dis=
play, enum pipe pipe_id,
>  				   struct igt_fb *prim_fb, struct igt_fb *argb_fb,
>  				   bool hide_sprite)
>  {
> -	igt_pipe_t *pipe =3D &display->pipes[pipe_id];
> +	igt_pipe_t *pipe =3D igt_crtc_for_pipe(display, pipe_id);
>  	igt_plane_t *primary =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_P=
RIMARY);
>  	igt_plane_t *sprite =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_OV=
ERLAY);
>=20=20
> @@ -600,8 +602,8 @@ static void prepare_flip_test(igt_display_t *display,
>=20=20
>  	if (mode =3D=3D flip_test_atomic_transitions ||
>  	    mode =3D=3D flip_test_atomic_transitions_varying_size) {
> -		igt_require(display->pipes[flip_pipe].n_planes > 1 &&
> -		            display->pipes[flip_pipe].planes[1].type !=3D DRM_PLANE_TY=
PE_CURSOR);
> +		igt_require(igt_crtc_for_pipe(display, flip_pipe)->n_planes > 1 &&
> +		            igt_crtc_for_pipe(display, flip_pipe)->planes[1].type !=3D=
 DRM_PLANE_TYPE_CURSOR);
>=20=20
>  		igt_create_color_pattern_fb(display->drm_fd, prim_fb->width, prim_fb->=
height,
>  					    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, argb_fb=
);
> @@ -633,8 +635,8 @@ static void flip(igt_display_t *display,
>=20=20
>  	if (mode =3D=3D flip_test_atomic_transitions ||
>  		mode =3D=3D flip_test_atomic_transitions_varying_size) {
> -		igt_require(igt_pipe_get_plane_type(&display->pipes[flip_pipe],
> -					DRM_PLANE_TYPE_OVERLAY));
> +		igt_require(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, flip_pi=
pe),
> +						    DRM_PLANE_TYPE_OVERLAY));
>  	}
>=20=20
>  	set_fb_on_crtc(display, flip_pipe, output, &fb_info);
> @@ -1289,11 +1291,11 @@ static void two_screens_flip_vs_cursor(igt_displa=
y_t *display, int nloops, bool
>  			continue;
>  		}
>=20=20
> -		if (vbl.crtc_id =3D=3D display->pipes[pipe].crtc_id) {
> +		if (vbl.crtc_id =3D=3D igt_crtc_for_pipe(display, pipe)->crtc_id) {
>  			vblank_start =3D kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK=
_NEXTONMISS);
>  			flip_nonblocking(display, pipe, atomic, &fb_info, (void*)(ptrdiff_t)v=
blank_start);
>  		} else {
> -			igt_assert(vbl.crtc_id =3D=3D display->pipes[pipe2].crtc_id);
> +			igt_assert(vbl.crtc_id =3D=3D igt_crtc_for_pipe(display, pipe2)->crtc=
_id);
>=20=20
>  			nloops--;
>=20=20
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index b8b1fa8e555c..a5588904b0d3 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -103,8 +103,10 @@ static void run_extendedmode_basic(data_t *data,
>  	igt_create_color_fb(data->drm_fd, mode[1]->hdisplay, mode[1]->vdisplay,
>  			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, 0, 1, &fbs[1]);
>=20=20
> -	plane[0] =3D igt_pipe_get_plane_type(&display->pipes[pipe1], DRM_PLANE_=
TYPE_PRIMARY);
> -	plane[1] =3D igt_pipe_get_plane_type(&display->pipes[pipe2], DRM_PLANE_=
TYPE_PRIMARY);
> +	plane[0] =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pipe1),
> +					   DRM_PLANE_TYPE_PRIMARY);
> +	plane[1] =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pipe2),
> +					   DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  	igt_plane_set_fb(plane[0], &fbs[0]);
>  	igt_fb_set_size(&fbs[0], plane[0], mode[0]->hdisplay, mode[0]->vdisplay=
);
> @@ -157,10 +159,12 @@ static void run_extendedmode_basic(data_t *data,
>  	igt_output_set_pipe(output1, PIPE_NONE);
>  	igt_output_set_pipe(output2, PIPE_NONE);
>=20=20
> -	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe1],
> -			  DRM_PLANE_TYPE_PRIMARY), NULL);
> -	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
> -			  DRM_PLANE_TYPE_PRIMARY), NULL);
> +	igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pip=
e1),
> +						 DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
> +	igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pip=
e2),
> +						 DRM_PLANE_TYPE_PRIMARY),
> +			 NULL);
>  	igt_assert_f(igt_fit_modes_in_bw(display), "Unable to fit modes in bw\n=
");
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>=20=20
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index a4cb004e8e24..102bab1debd1 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -74,7 +74,7 @@ typedef struct {
>  /* Prepare test data. */
>  static void prepare_test(data_t *data, igt_output_t *output, enum pipe p)
>  {
> -	igt_pipe_t *pipe =3D &data->display.pipes[p];
> +	igt_pipe_t *pipe =3D igt_crtc_for_pipe(&data->display, p);
>=20=20
>  	igt_assert(pipe);
>=20=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index ab0ec47cbfad..45840945d658 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -213,7 +213,7 @@ static void prepare_test(data_t *data, igt_output_t *=
output, enum pipe pipe)
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	data->pipe_id =3D pipe;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>  	igt_assert(data->pipe);
>=20=20
>  	igt_display_reset(display);
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 78c73e72ffa3..2b385d4931f2 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -277,7 +277,7 @@ test_output(data_t *data)
>=20=20
>  	kmstest_unset_all_crtcs(data->drm_fd, data->res);
>=20=20
> -	crtc_id =3D data->display.pipes[data->pipe].crtc_id;
> +	crtc_id =3D igt_crtc_for_pipe(&data->display, data->pipe)->crtc_id;
>=20=20
>  	ret =3D drmModeSetCrtc(data->drm_fd, crtc_id,
>  			     fb.fb_id, 0, 0,
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 495b9aebba53..df16fc7af78e 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -153,7 +153,7 @@ static int prepare_crtc(data_t *data, bool is_master)
>  	lease_t *lease =3D is_master ? &data->master : &data->lease;
>  	igt_display_t *display =3D &lease->display;
>  	igt_output_t *output =3D connector_id_to_output(display, data->connecto=
r_id);
> -	enum pipe pipe =3D display->pipes[data->pipe].pipe;
> +	enum pipe pipe =3D igt_crtc_for_pipe(display, data->pipe)->pipe;
>  	igt_plane_t *primary;
>  	int ret;
>=20=20
> @@ -179,7 +179,8 @@ static int prepare_crtc(data_t *data, bool is_master)
>  	if (ret)
>  		return ret;
>=20=20
> -	igt_wait_for_vblank(lease->fd, display->pipes[pipe].crtc_offset);
> +	igt_wait_for_vblank(lease->fd,
> +			    igt_crtc_for_pipe(display, pipe)->crtc_offset);
>=20=20
>  	lease->output =3D output;
>  	lease->mode =3D mode;
> @@ -377,7 +378,7 @@ static void page_flip_implicit_plane(data_t *data)
>  	display =3D &data->master.display;
>=20=20
>  	igt_wait_for_vblank(data->master.fd,
> -			display->pipes[pipe].crtc_offset);
> +			igt_crtc_for_pipe(display, pipe)->crtc_offset);
>=20=20
>  	do_or_die(drmModePageFlip(data->lease.fd, data->crtc_id,
>  			      data->master.primary_fb.fb_id,
> @@ -388,7 +389,7 @@ static void page_flip_implicit_plane(data_t *data)
>  	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
>=20=20
>  	igt_wait_for_vblank(data->master.fd,
> -			display->pipes[pipe].crtc_offset);
> +			igt_crtc_for_pipe(display, pipe)->crtc_offset);
>=20=20
>  	igt_assert_eq(drmModePageFlip(data->lease.fd, data->crtc_id,
>  				      data->master.primary_fb.fb_id,
> @@ -714,8 +715,9 @@ static void lease_unleased_crtc(data_t *data)
>  	for_each_pipe(&data->master.display, p) {
>  		if (bad_crtc_id !=3D 0)
>  			break;
> -		if (data->master.display.pipes[p].crtc_id !=3D data->crtc_id)
> -			bad_crtc_id =3D data->master.display.pipes[p].crtc_id;
> +		if (igt_crtc_for_pipe(&data->master.display, p)->crtc_id !=3D data->cr=
tc_id)
> +			bad_crtc_id =3D igt_crtc_for_pipe(&data->master.display,
> +							p)->crtc_id;
>  	}
>=20=20
>  	/* Give up if there isn't another crtc */
> @@ -895,11 +897,11 @@ static void invalid_create_leases(data_t *data)
>  	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
>=20=20
>  	/* no connector, non-universal_plane */
> -	object_ids[0] =3D data->master.display.pipes[0].crtc_id;
> +	object_ids[0] =3D igt_crtc_for_pipe(&data->master.display, 0)->crtc_id;
>  	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
>=20=20
>  	/* sanity check */
> -	object_ids[0] =3D data->master.display.pipes[0].crtc_id;
> +	object_ids[0] =3D igt_crtc_for_pipe(&data->master.display, 0)->crtc_id;
>  	object_ids[1] =3D data->master.display.outputs[0].id;
>  	mcl.object_count =3D 2;
>  	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
> @@ -910,7 +912,7 @@ static void invalid_create_leases(data_t *data)
>  	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
>=20=20
>  	/* sanity check */
> -	object_ids[2] =3D igt_pipe_get_plane_type(&data->master.display.pipes[0=
],
> +	object_ids[2] =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->mast=
er.display, 0),
>  						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
>  	mcl.object_count =3D 3;
>  	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
> @@ -1075,9 +1077,9 @@ static int _create_simple_lease(int master_fd, data=
_t *data, int expected_ret)
>  	uint32_t object_ids[3];
>  	struct drm_mode_create_lease mcl;
>=20=20
> -	object_ids[0] =3D data->master.display.pipes[0].crtc_id;
> +	object_ids[0] =3D igt_crtc_for_pipe(&data->master.display, 0)->crtc_id;
>  	object_ids[1] =3D data->master.display.outputs[0].id;
> -	object_ids[2] =3D igt_pipe_get_plane_type(&data->master.display.pipes[0=
],
> +	object_ids[2] =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->mast=
er.display, 0),
>  						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
>  	mcl.object_ids =3D (uint64_t) (uintptr_t) object_ids;
>  	mcl.object_count =3D 3;
> @@ -1165,12 +1167,12 @@ static void implicit_plane_lease(data_t *data)
>  	struct drm_mode_create_lease mcl;
>  	struct drm_mode_get_lease mgl;
>  	int ret;
> -	uint32_t cursor_id =3D igt_pipe_get_plane_type(&data->master.display.pi=
pes[0],
> +	uint32_t cursor_id =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&data-=
>master.display, 0),
>  						     DRM_PLANE_TYPE_CURSOR)->drm_plane->plane_id;
>=20=20
> -	object_ids[0] =3D data->master.display.pipes[0].crtc_id;
> +	object_ids[0] =3D igt_crtc_for_pipe(&data->master.display, 0)->crtc_id;
>  	object_ids[1] =3D data->master.display.outputs[0].id;
> -	object_ids[2] =3D igt_pipe_get_plane_type(&data->master.display.pipes[0=
],
> +	object_ids[2] =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->mast=
er.display, 0),
>  						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
>  	mcl.object_ids =3D (uint64_t) (uintptr_t) object_ids;
>  	mcl.object_count =3D 3;
> @@ -1298,11 +1300,12 @@ int igt_main()
>=20=20
>  					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe),
>  						      igt_output_name(output)) {
> -						data.crtc_id =3D display->pipes[data.pipe].crtc_id;
> +						data.crtc_id =3D igt_crtc_for_pipe(display,
> +										 data.pipe)->crtc_id;
>  						data.connector_id =3D output->id;
>  						data.plane_id =3D
> -							igt_pipe_get_plane_type(&data.master.display.pipes[data.pipe],
> -									DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
> +							igt_pipe_get_plane_type(igt_crtc_for_pipe(&data.master.display, d=
ata.pipe),
> +										DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
>  						f->func(&data);
>  					}
>  					terminate_lease(data.lease.fd);
> diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
> index 28c71fdec00a..3a1944b48874 100644
> --- a/tests/kms_multipipe_modeset.c
> +++ b/tests/kms_multipipe_modeset.c
> @@ -75,7 +75,7 @@ static void run_test(data_t *data, int valid_outputs)
>=20=20
>  	/* Collect reference CRC by Committing individually on all outputs*/
>  	for_each_connected_output(display, output) {
> -		pipe =3D &display->pipes[i];
> +		pipe =3D igt_crtc_for_pipe(display, i);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  		mode =3D NULL;
> @@ -100,7 +100,7 @@ static void run_test(data_t *data, int valid_outputs)
>  	i =3D 0;
>  	/* Simultaneously commit on all outputs */
>  	for_each_connected_output(display, output) {
> -		pipe =3D &display->pipes[i];
> +		pipe =3D igt_crtc_for_pipe(display, i);
>  		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  		mode =3D NULL;
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index ca8f76c8aa27..1699b68ff3d0 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -169,11 +169,13 @@ static void test_read_crc(data_t *data, enum pipe p=
ipe,
>=20=20
>  			pipe_crc =3D igt_pipe_crc_new_nonblock(data->drm_fd, pipe,
>  							     IGT_PIPE_CRC_SOURCE_AUTO);
> -			igt_wait_for_vblank(data->drm_fd, display->pipes[pipe].crtc_offset);
> +			igt_wait_for_vblank(data->drm_fd,
> +					    igt_crtc_for_pipe(display, pipe)->crtc_offset);
>  			igt_pipe_crc_start(pipe_crc);
>=20=20
>  			igt_wait_for_vblank_count(data->drm_fd,
> -					display->pipes[pipe].crtc_offset, N_CRCS);
> +					igt_crtc_for_pipe(display, pipe)->crtc_offset,
> +					N_CRCS);
>  			n_crcs =3D igt_pipe_crc_get_crcs(pipe_crc, N_CRCS+1, &crcs);
>  			igt_pipe_crc_stop(pipe_crc);
>  			igt_pipe_crc_free(pipe_crc);
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 5f18eac13ac1..84455e77bbb2 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -127,7 +127,7 @@ static color_t blue  =3D { 0.0f, 0.0f, 1.0f };
>   */
>  static void test_init(data_t *data, enum pipe pipe)
>  {
> -	igt_require(data->display.pipes[pipe].n_planes > 0);
> +	igt_require(igt_crtc_for_pipe(&data->display, pipe)->n_planes > 0);
>  	if (data->pipe_crc)
>  		igt_pipe_crc_free(data->pipe_crc);
>  	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> @@ -337,7 +337,7 @@ test_plane_position_with_output(data_t *data,
>  static void
>  test_plane_position(data_t *data, enum pipe pipe)
>  {
> -	int n_planes =3D data->display.pipes[pipe].n_planes;
> +	int n_planes =3D igt_crtc_for_pipe(&data->display, pipe)->n_planes;
>  	igt_output_t *output =3D data->output;
>  	igt_crc_t reference_crc;
>=20=20
> @@ -522,7 +522,7 @@ static const color_t colors_reduced[] =3D {
>  static void set_legacy_lut(data_t *data, enum pipe pipe,
>  			   uint16_t mask)
>  {
> -	igt_pipe_t *pipe_obj =3D &data->display.pipes[pipe];
> +	igt_pipe_t *pipe_obj =3D igt_crtc_for_pipe(&data->display, pipe);
>  	drmModeCrtc *drm_crtc;
>  	uint16_t *lut;
>  	int i, lut_size;
> @@ -549,7 +549,7 @@ static void set_legacy_lut(data_t *data, enum pipe pi=
pe,
>  static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,
>  			      uint16_t mask)
>  {
> -	igt_pipe_t *pipe_obj =3D &data->display.pipes[pipe];
> +	igt_pipe_t *pipe_obj =3D igt_crtc_for_pipe(&data->display, pipe);
>  	drmModeCrtc *drm_crtc;
>  	uint16_t *r, *g, *b;
>  	int i, lut_size;
> @@ -793,7 +793,7 @@ restart_round:
>  				igt_display_t *display =3D &data->display;
>=20=20
>  				igt_wait_for_vblank(data->drm_fd,
> -						display->pipes[pipe].crtc_offset);
> +						igt_crtc_for_pipe(display, pipe)->crtc_offset);
>  			}
>  		}
>=20=20
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 037a5c1060a2..99ce90616720 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -214,7 +214,8 @@ static void prepare_crtc(data_t *data, igt_output_t *=
output, enum pipe pipe)
>  	drmModeModeInfo *mode;
>  	igt_display_t *display =3D &data->display;
>  	int w, h;
> -	igt_plane_t *primary =3D igt_pipe_get_plane_type(&display->pipes[pipe],=
 DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_t *primary =3D igt_pipe_get_plane_type(igt_crtc_for_pipe(disp=
lay, pipe),
> +						       DRM_PLANE_TYPE_PRIMARY);
>=20=20
>  	/* create the pipe_crc object for this pipe */
>  	igt_pipe_crc_free(data->pipe_crc);
> @@ -387,7 +388,8 @@ static void constant_alpha_mid(data_t *data, enum pip=
e pipe, igt_plane_t *plane)
>  	igt_crc_t ref_crc, crc;
>=20=20
>  	if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
> -		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PL=
ANE_TYPE_PRIMARY), &data->gray_fb);
> +		igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pi=
pe), DRM_PLANE_TYPE_PRIMARY),
> +				 &data->gray_fb);
>=20=20
>  	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "None");
>  	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7fff);
> @@ -412,7 +414,8 @@ static void constant_alpha_max(data_t *data, enum pip=
e pipe, igt_plane_t *plane)
>  	igt_crc_t ref_crc, crc;
>=20=20
>  	if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
> -		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PL=
ANE_TYPE_PRIMARY), &data->gray_fb);
> +		igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pi=
pe), DRM_PLANE_TYPE_PRIMARY),
> +				 &data->gray_fb);
>=20=20
>  	igt_plane_set_fb(plane, &data->argb_fb_100);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> @@ -442,7 +445,8 @@ static void alpha_7efc(data_t *data, enum pipe pipe, =
igt_plane_t *plane)
>  	igt_crc_t ref_crc =3D {}, crc =3D {};
>=20=20
>  	if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
> -		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PL=
ANE_TYPE_PRIMARY), &data->gray_fb);
> +		igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pi=
pe), DRM_PLANE_TYPE_PRIMARY),
> +				 &data->gray_fb);
>=20=20
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  	igt_pipe_crc_start(data->pipe_crc);
> @@ -496,7 +500,8 @@ static void coverage_premult_constant(data_t *data, e=
num pipe pipe, igt_plane_t
>=20=20
>  	/* Set a background color on the primary fb for testing */
>  	if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
> -		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PL=
ANE_TYPE_PRIMARY), &data->gray_fb);
> +		igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pi=
pe), DRM_PLANE_TYPE_PRIMARY),
> +				 &data->gray_fb);
>=20=20
>  	igt_require(igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, =
"Coverage"));
>  	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 3f9afe674259..7817d6df9f1d 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -94,7 +94,7 @@ static void test_init(data_t *data, enum pipe pipe_id, =
igt_output_t *output,
>  		      unsigned int flags)
>  {
>  	data->pipe_id =3D pipe_id;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>  	data->output =3D output;
>=20=20
>  	data->mode =3D igt_output_get_mode(data->output);
> @@ -188,7 +188,9 @@ static void test_cursor_pos(data_t *data, int x, int =
y, unsigned int flags)
>  	/* Wait for one more vblank since cursor updates are not
>  	 * synchronized to the same frame on AMD hw */
>  	if(is_amdgpu_device(data->drm_fd))
> -		igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[data->pipe=
_id].crtc_offset, 1);
> +		igt_wait_for_vblank_count(data->drm_fd,
> +					  igt_crtc_for_pipe(&data->display, data->pipe_id)->crtc_offset,
> +					  1);
>=20=20
>  	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &test_crc);
>  	igt_pipe_crc_stop(data->pipe_crc);
> @@ -326,7 +328,7 @@ int igt_main()
>  		igt_subtest_with_dynamic_f("%s", tests[i].name) {
>  			for_each_pipe_with_single_output(&data.display, pipe, output) {
>  				if ((tests[i].flags & TEST_OVERLAY) &&
> -				    !igt_pipe_get_plane_type(&data.display.pipes[pipe],
> +				    !igt_pipe_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
>  							     DRM_PLANE_TYPE_OVERLAY))
>  					continue;
>=20=20
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 2f1bd16a1b33..0ce12749f7c8 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -403,7 +403,7 @@ static void
>  test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, =
uint64_t modifier)
>  {
>  	int n_planes =3D opt.all_planes ?
> -			data->display.pipes[pipe].n_planes : DEFAULT_N_PLANES;
> +			igt_crtc_for_pipe(&data->display, pipe)->n_planes : DEFAULT_N_PLANES;
>=20=20
>  	if (!opt.user_seed)
>  		opt.seed =3D time(NULL);
> @@ -464,7 +464,7 @@ static void test_plane_position_2_display(data_t *dat=
a, enum pipe pipe1, enum pi
>  	color_t blue  =3D { 0.0f, 0.0f, 1.0f };
>  	igt_crc_t crc1, crc2;
>  	int n_planes =3D opt.all_planes ?
> -		       data->display.pipes[0].n_planes : DEFAULT_N_PLANES;
> +		       igt_crtc_for_pipe(&data->display, 0)->n_planes : DEFAULT_N_PLAN=
ES;
>=20=20
>  	/*
>  	 * Note: We could use the dynamic way of calculating the maximum planes=
 here
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index bdb290b5430e..10b168615226 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -963,7 +963,7 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
>  		w2 =3D get_width(mode, sf_plane2);
>  		h2 =3D get_height(mode, sf_plane2);
>=20=20
> -		n_planes =3D display->pipes[pipe].n_planes;
> +		n_planes =3D igt_crtc_for_pipe(display, pipe)->n_planes;
>  		igt_require(n_planes >=3D 2);
>=20=20
>  		switch (test_type) {
> @@ -990,9 +990,9 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
>  		for (int k =3D 0; k < n_planes - 1; k +=3D 2) {
>  			igt_plane_t *p1, *p2;
>=20=20
> -			p1 =3D &display->pipes[pipe].planes[k];
> +			p1 =3D &igt_crtc_for_pipe(display, pipe)->planes[k];
>  			igt_require(p1);
> -			p2 =3D &display->pipes[pipe].planes[k+1];
> +			p2 =3D &igt_crtc_for_pipe(display, pipe)->planes[k+1];
>  			igt_require(p2);
>=20=20
>  			if (p1->type =3D=3D DRM_PLANE_TYPE_CURSOR || p2->type =3D=3D DRM_PLAN=
E_TYPE_CURSOR)
> @@ -1015,7 +1015,7 @@ static void
>  test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
>  {
>  	igt_display_t *display =3D &d->display;
> -	igt_pipe_t *pipe_obj =3D &display->pipes[pipe];
> +	igt_pipe_t *pipe_obj =3D igt_crtc_for_pipe(display, pipe);
>  	int width, height;
>  	igt_plane_t *plane[3];
>  	drmModeModeInfo *mode;
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 64514b4d2676..95bfe293a242 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -291,7 +291,9 @@ static void run_crtc_property_tests(igt_display_t *di=
splay, enum pipe pipe, igt_
>=20=20
>  	igt_info("Testing crtc properties on %s (output: %s)\n", kmstest_pipe_n=
ame(pipe), output->name);
>=20=20
> -	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[p=
ipe].crtc_id, atomic, false);
> +	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC,
> +			igt_crtc_for_pipe(display, pipe)->crtc_id, atomic,
> +			false);
>=20=20
>  	cleanup_pipe(display, pipe, output, &fb);
>  }
> @@ -482,7 +484,9 @@ static void test_object_invalid_properties(igt_displa=
y_t *display,
>  	enum pipe pipe;
>=20=20
>  	for_each_pipe(display, pipe)
> -		test_invalid_properties(display->drm_fd, id, type, display->pipes[pipe=
].crtc_id, DRM_MODE_OBJECT_CRTC, atomic);
> +		test_invalid_properties(display->drm_fd, id, type,
> +				        igt_crtc_for_pipe(display, pipe)->crtc_id,
> +				        DRM_MODE_OBJECT_CRTC, atomic);
>=20=20
>  	for_each_pipe(display, pipe)
>  		for_each_plane_on_pipe(display, pipe, plane)
> @@ -888,7 +892,9 @@ static void invalid_properties(igt_display_t *display=
, bool atomic)
>  		igt_skip_on(!display->is_atomic);
>=20=20
>  	for_each_pipe(display, pipe)
> -		test_object_invalid_properties(display, display->pipes[pipe].crtc_id, =
DRM_MODE_OBJECT_CRTC, atomic);
> +		test_object_invalid_properties(display,
> +				               igt_crtc_for_pipe(display, pipe)->crtc_id,
> +				               DRM_MODE_OBJECT_CRTC, atomic);
>=20=20
>  	for_each_pipe(display, pipe)
>  		for_each_plane_on_pipe(display, pipe, plane)
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 6f10da8fbf7c..d37a14e275f7 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -1353,7 +1353,8 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  		igt_display_require_output(&data.display);
>=20=20
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			igt_plane_t *primary =3D &data.display.pipes[pipe].planes[0];
> +			igt_plane_t *primary =3D &igt_crtc_for_pipe(&data.display,
> +								  pipe)->planes[0];
>=20=20
>  			test_plane_rotation_exhaust_fences(&data, pipe, output, primary);
>  			break;
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 46edcc50d2ab..80a586ce62f5 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -123,7 +123,7 @@ static void prepare_crtc(data_t *data, int fd, igt_ou=
tput_t *output)
>  	igt_display_commit(display);
>=20=20
>  	igt_wait_for_vblank(fd,
> -			display->pipes[data->pipe].crtc_offset);
> +			igt_crtc_for_pipe(display, data->pipe)->crtc_offset);
>  }
>=20=20
>  static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index d6f5eda7d841..003e6ea408e8 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -328,7 +328,7 @@ static data_connector_t *conn_for_crtc(data_t *data, =
unsigned int crtc_id)
>  	for (int i =3D 0; i < data->num_h_tiles; i++) {
>  		data_connector_t *conn =3D &data->conns[i];
>=20=20
> -		if (data->display.pipes[conn->pipe].crtc_id =3D=3D crtc_id)
> +		if (igt_crtc_for_pipe(&data->display, conn->pipe)->crtc_id =3D=3D crtc=
_id)
>  			return conn;
>  	}
>=20=20
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 47c805cd36cd..a4913ec13819 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -172,10 +172,10 @@ functional_test_pipe(data_t *data, enum pipe pipe, =
igt_output_t *output)
>  	 * drm_universal_plane_init(), the type enum can get interpreted as a
>  	 * boolean and show up in userspace as the wrong type.
>  	 */
> -	for (i =3D 0; i < display->pipes[pipe].n_planes; i++)
> -		if (display->pipes[pipe].planes[i].type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +	for (i =3D 0; i < igt_crtc_for_pipe(display, pipe)->n_planes; i++)
> +		if (igt_crtc_for_pipe(display, pipe)->planes[i].type =3D=3D DRM_PLANE_=
TYPE_PRIMARY)
>  			num_primary++;
> -		else if (display->pipes[pipe].planes[i].type =3D=3D DRM_PLANE_TYPE_CUR=
SOR)
> +		else if (igt_crtc_for_pipe(display, pipe)->planes[i].type =3D=3D DRM_P=
LANE_TYPE_CURSOR)
>  			num_cursor++;
>=20=20
>  	igt_warn_on(num_primary !=3D 1);
> @@ -711,7 +711,9 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, i=
gt_output_t *output)
>  	 * framebuffer.
>  	 */
>  	if (is_xe_device(data->drm_fd))
> -		igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc=
_offset, 2);
> +		igt_wait_for_vblank_count(data->drm_fd,
> +					  igt_crtc_for_pipe(&data->display, pipe)->crtc_offset,
> +					  2);
>=20=20
>  	/* We should be back to the same framebuffer count as when we started */
>  	count2 =3D intel_gem_fb_count(data);
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index bce767a2ab83..1803308c56e1 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -144,7 +144,7 @@ static void prepare_crtc(data_t *data, int fd, igt_ou=
tput_t *output)
>  	igt_display_commit(display);
>=20=20
>  	igt_wait_for_vblank(fd,
> -			display->pipes[data->pipe].crtc_offset);
> +			igt_crtc_for_pipe(display, data->pipe)->crtc_offset);
>  }
>=20=20
>  static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
> @@ -251,7 +251,7 @@ static void crtc_id_subtest(data_t *data, int fd)
>  	uint64_t val;
>  	union drm_wait_vblank vbl;
>=20=20
> -	crtc_id =3D display->pipes[p].crtc_id;
> +	crtc_id =3D igt_crtc_for_pipe(display, p)->crtc_id;
>  	if (drmGetCap(display->drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &val) =3D=
=3D 0)
>  		expected_crtc_id =3D crtc_id;
>  	else
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index d21301733b5c..bcb7e00b0b07 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -385,7 +385,7 @@ static void test_init(data_t *data, int conn_id)
>  	igt_display_t *display =3D &data->display;
>=20=20
>  	data->pipe_id =3D PIPE_A;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D igt_crtc_for_pipe(&data->display, data->pipe_id);
>=20=20
>  	igt_display_reset(display);

--=20
Jani Nikula, Intel
