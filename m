Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75901C44502
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 08:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2672C10E0A7;
	Wed, 21 Jan 2026 08:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7sFHjtt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA6410E0A7
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768985411; x=1800521411;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=NIdAd1fNEcNKQI5jqjZeOkAdQoTNnZjWI3pLavD3ZEc=;
 b=J7sFHjtt2o6ZA3VKUjXE4x6MAiWW05Dx7fQ/cW+VbheweJXvwxghcA2o
 IbdtmGVVXoc9SRV1Vl2ghgOKoFLr9yUgvzf9chllWiMVPUjydd0AtGlJz
 om+/NLL8c6xpZPW176ByNymyOr1v96uOTsQ0qfMnGEhI3p95/lS/yg7yl
 ps7m/Gm7lJ2h7J4LrUKuSn1qlLR65xBZfQXIoTT5kU1EScNNu6AyNsuj+
 0lvBYtELkG4aEFPgpk+ZFCIZrqAz9vUZENM4iGU8t2l308QxhVB3a3UAa
 J/PzQ+lKmJomVFlH7N6anN6zTxr4l6W69vaLS/Kl7QcbeB6BHBTJJPXbz g==;
X-CSE-ConnectionGUID: 2d4a0o7uSm2P9kQvL9Y6pw==
X-CSE-MsgGUID: yZMbGgJsRTeqg4uCNoQrfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70113384"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70113384"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:50:10 -0800
X-CSE-ConnectionGUID: PN7WJLfiTmWUrkbj7/AjrQ==
X-CSE-MsgGUID: U4NQWRq7SPOgGImCyK0ysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="210892459"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:50:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/12] igt/kms: Nuke igt_pipe_is_prop_changed()
 and igt_pipe_set_prop_value()
In-Reply-To: <20260120171656.15840-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-2-ville.syrjala@linux.intel.com>
Date: Wed, 21 Jan 2026 10:50:05 +0200
Message-ID: <a0b553eb12bfca4e1285cbeb0e4548ffbc159f76@intel.com>
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

On Tue, 20 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Remove the pipe based igt_pipe_is_prop_changed() and
> igt_pipe_set_prop_value() wrappers and just use the crtc
> based variants directly. One step towards eliminating
> pipe usage from tests.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> @@
> - igt_pipe_is_prop_changed(...) { ... }
>
> @@
> @@
> - igt_pipe_set_prop_value(...) { ... }
>
> @@
> expression DISPLAY, PIPE;
> @@
> (
> - igt_pipe_is_prop_changed(DISPLAY, PIPE
> + igt_pipe_obj_is_prop_changed(igt_crtc_for_pipe(DISPLAY, PIPE)
> 	,...)
> |
> - igt_pipe_set_prop_value(DISPLAY, PIPE
> + igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(DISPLAY, PIPE)
> 	,...)
> )
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.h                                 | 32 -------------------
>  tests/amdgpu/amd_freesync_video_mode.c        |  5 +--
>  .../kms_chamelium_sharpness_filter.c          | 10 +++---
>  tests/intel/kms_pm_dc.c                       |  5 +--
>  tests/intel/kms_sharpness_filter.c            |  6 ++--
>  tests/kms_atomic_transition.c                 |  2 +-
>  tests/kms_content_protection.c                |  8 ++---
>  tests/kms_vrr.c                               | 11 ++++---
>  8 files changed, 26 insertions(+), 53 deletions(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a271c94a97fd..b848ca2eb973 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1067,21 +1067,6 @@ static inline bool igt_pipe_obj_is_prop_changed(ig=
t_crtc_t *pipe_obj,
>  	return pipe_obj->changed & (1 << prop);
>  }
>=20=20
> -/**
> - * igt_pipe_is_prop_changed:
> - * @pipe: Pipe object to check.
> - * @prop: Property to check.
> - *
> - * Check whether a given @prop changed for the @pipe.
> - */
> -static inline bool igt_pipe_is_prop_changed(igt_display_t *display,
> -					    enum pipe pipe,
> -					    enum igt_atomic_crtc_properties prop)
> -{
> -	return igt_pipe_obj_is_prop_changed(igt_crtc_for_pipe(display, pipe),
> -					    prop);
> -}
> -
>  /**
>   * igt_pipe_obj_set_prop_changed:
>   * @pipe_obj: Pipe object to check.
> @@ -1124,23 +1109,6 @@ static inline void igt_pipe_obj_set_prop_value(igt=
_crtc_t *pipe_obj,
>  	igt_pipe_obj_set_prop_changed(pipe_obj, prop);
>  }
>=20=20
> -/**
> - * igt_pipe_set_prop_value:
> - * @pipe: Pipe to check.
> - * @prop: Property to check.
> - * @value: Value to set.
> - *
> - * Sets the given @prop with the @value for the @pipe.
> - */
> -static inline void igt_pipe_set_prop_value(igt_display_t *display,
> -					   enum pipe pipe,
> -					   enum igt_atomic_crtc_properties prop,
> -					   uint64_t value)
> -{
> -	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(display, pipe), prop,
> -				    value);
> -}
> -
>  extern bool igt_pipe_obj_try_prop_enum(igt_crtc_t *pipe,
>  				       enum igt_atomic_crtc_properties prop,
>  				       const char *val);
> diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_fr=
eesync_video_mode.c
> index c1a3e8161304..812212ac5f2b 100644
> --- a/tests/amdgpu/amd_freesync_video_mode.c
> +++ b/tests/amdgpu/amd_freesync_video_mode.c
> @@ -548,8 +548,9 @@ static bool has_vrr(igt_output_t *output)
>  /* Toggles variable refresh rate on the pipe. */
>  static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
>  {
> -	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED,
> -				enabled);
> +	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
> +				    IGT_CRTC_VRR_ENABLED,
> +				    enabled);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
>=20=20
> diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/cha=
melium/kms_chamelium_sharpness_filter.c
> index 6f161660b043..fb6e95a92b5e 100644
> --- a/tests/chamelium/kms_chamelium_sharpness_filter.c
> +++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
> @@ -53,15 +53,15 @@ static bool pipe_output_combo_valid(data_t *data, enu=
m pipe pipe)
>=20=20
>  static void set_filter_strength_on_pipe(data_t *data)
>  {
> -	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> -				IGT_CRTC_SHARPNESS_STRENGTH,
> -				data->filter_strength);
> +	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, data->pip=
e_id),
> +				    IGT_CRTC_SHARPNESS_STRENGTH,
> +				    data->filter_strength);
>  }
>=20=20
>  static void reset_filter_strength_on_pipe(data_t *data)
>  {
> -	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> -				IGT_CRTC_SHARPNESS_STRENGTH, 0);
> +	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, data->pip=
e_id),
> +				    IGT_CRTC_SHARPNESS_STRENGTH, 0);
>  }
>=20=20
>  static void paint_image(igt_fb_t *fb)
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 5e59ba6e03a3..9055e66a2ffa 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -663,8 +663,9 @@ static void test_deep_pkgc_state(data_t *data)
>  				 * TODO: Add check for vmin =3D vmax =3D flipline if VRR enabled
>  				 * when KMD allows for such capability.
>  				 */
> -				igt_pipe_set_prop_value(display, pipe,
> -							IGT_CRTC_VRR_ENABLED, false);
> +				igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(display, pipe),
> +							    IGT_CRTC_VRR_ENABLED,
> +							    false);
>  				igt_assert(igt_display_try_commit_atomic(display,
>  									 DRM_MODE_ATOMIC_ALLOW_MODESET,
>  									 NULL) =3D=3D 0);
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpne=
ss_filter.c
> index 06ceb640a976..ffc43dbaf129 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -173,9 +173,9 @@ typedef struct {
>=20=20
>  static void set_filter_strength_on_pipe(data_t *data)
>  {
> -	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> -				IGT_CRTC_SHARPNESS_STRENGTH,
> -				data->filter_strength);
> +	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, data->pip=
e_id),
> +				    IGT_CRTC_SHARPNESS_STRENGTH,
> +				    data->filter_strength);
>  }
>=20=20
>  static bool has_scaling_mode(igt_output_t *output)
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 4631d54725db..6aa3439eedae 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -829,7 +829,7 @@ static unsigned set_combinations(data_t *data, unsign=
ed mask, struct igt_fb *fb)
>  		drmModeModeInfo *mode =3D NULL;
>=20=20
>  		if (!(mask & (1 << pipe))) {
> -			if (igt_pipe_is_prop_changed(&data->display, pipe, IGT_CRTC_ACTIVE)) {
> +			if (igt_pipe_obj_is_prop_changed(igt_crtc_for_pipe(&data->display, pi=
pe), IGT_CRTC_ACTIVE)) {
>  				event_mask |=3D 1 << pipe;
>  				igt_plane_set_fb(plane, NULL);
>  			}
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index c1a84c63f791..f7896592b3ff 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -484,12 +484,12 @@ static void test_content_protection_on_output(igt_o=
utput_t *output,
>  		test_cp_lic(output);
>=20=20
>  	if (data.cp_tests & CP_DPMS) {
> -		igt_pipe_set_prop_value(display, pipe,
> -					IGT_CRTC_ACTIVE, 0);
> +		igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(display, pipe),
> +					    IGT_CRTC_ACTIVE, 0);
>  		igt_display_commit2(display, commit_style);
>=20=20
> -		igt_pipe_set_prop_value(display, pipe,
> -					IGT_CRTC_ACTIVE, 1);
> +		igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(display, pipe),
> +					    IGT_CRTC_ACTIVE, 1);
>  		igt_display_commit2(display, commit_style);
>=20=20
>  		ret =3D wait_for_prop_value(output, CP_ENABLED,
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 0e54672a7d83..f05b3b87ad57 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -309,8 +309,9 @@ static bool vrr_capable(igt_output_t *output)
>  static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
>  			    bool need_modeset, bool enabled)
>  {
> -	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED,
> -				enabled);
> +	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
> +				    IGT_CRTC_VRR_ENABLED,
> +				    enabled);
>=20=20
>  	igt_assert(igt_display_try_commit_atomic(&data->display,
>  						 need_modeset ? DRM_MODE_ATOMIC_ALLOW_MODESET : 0,
> @@ -405,7 +406,8 @@ static void prepare_test(data_t *data, igt_output_t *=
output, enum pipe pipe)
>  	/* Clear vrr_enabled state before enabling it, because
>  	 * it might be left enabled if the previous test fails.
>  	 */
> -	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, 0);
> +	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
> +				    IGT_CRTC_VRR_ENABLED, 0);
>=20=20
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
> @@ -968,7 +970,8 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t =
*output, uint32_t flags)
>=20=20
>  static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *out=
put)
>  {
> -	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, fal=
se);
> +	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
> +				    IGT_CRTC_VRR_ENABLED, false);
>=20=20
>  	if (data->primary)
>  		igt_plane_set_fb(data->primary, NULL);

--=20
Jani Nikula, Intel
