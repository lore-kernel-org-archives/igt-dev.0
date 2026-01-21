Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98810C44501
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 08:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4355C10E712;
	Wed, 21 Jan 2026 08:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wd6oOHDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A256E10E0A7
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768985736; x=1800521736;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=5XxU7QSOQk7f2hDQmaWyTXEqaTf/POQqT4uulb5Ba6o=;
 b=Wd6oOHDsWCnLsbzLdQBA4rb71wR6sJfVE7WRTikbhtLiDQsLddEyY4DM
 8nKqND41oGU5sK1uSaMvv7GI5CSxrx8kAPmFcxmxzEUspNfxXz4oC3dFT
 zioFpE+thq0Vz5G/9Qm2egECNFODRyqGv5SJyfEuss/PczsYo0+8w7RFm
 2eRSw/42F7JgtyJZONXMw3QJrCY3n5KooZTw9QebVBx7edTH1xfKsD2wO
 OAwlCLCl8QC+qdJjPIc7f3UwdFoyFaGEhYk1pn5kJRAZKveEwHhX0cGBw
 SMPT7cXXYj49B2j8Loa+ZfbmkKrTpGo/j5hZggauVtg91YYr22Lc1j0f2 Q==;
X-CSE-ConnectionGUID: LhrHbWefSoWH7kglTIgVsw==
X-CSE-MsgGUID: tKIjanS+Tp2Qq6V1GpGQJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70114057"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70114057"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:55:35 -0800
X-CSE-ConnectionGUID: FpDOv8B4TtaAIH9KKKekVg==
X-CSE-MsgGUID: bXNLXRR1SUiy7fPsAX4iiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="210894116"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:55:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 02/12] lib/kms: Rename igt_pipe_obj_*_prop()
In-Reply-To: <20260120171656.15840-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-3-ville.syrjala@linux.intel.com>
Date: Wed, 21 Jan 2026 10:55:30 +0200
Message-ID: <326a50e12498b76974ba76191ace8ea4098eae45@intel.com>
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
> Rename all the 'pipe_obj' property functions to
> use the 'crtc' terminology instead.
>
> Done with cocci (with manual fixups for docs):
>  #include "scripts/iterators.cocci"
>
> @@
> @@
> (
> - igt_pipe_obj_has_prop
> + igt_crtc_has_prop
> |
> - igt_pipe_obj_get_prop
> + igt_crtc_get_prop
> |
> - igt_pipe_obj_is_prop_changed
> + igt_crtc_is_prop_changed
> |
> - igt_pipe_obj_set_prop_changed
> + igt_crtc_set_prop_changed
> |
> - igt_pipe_obj_clear_prop_changed
> + igt_crtc_clear_prop_changed
> |
> - igt_pipe_obj_set_prop_value
> + igt_crtc_set_prop_value
> |
> - igt_pipe_obj_replace_prop_blob
> + igt_crtc_replace_prop_blob
> |
> - igt_pipe_obj_set_prop_enum
> + igt_crtc_set_prop_enum
> |
> - igt_pipe_obj_try_prop_enum
> + igt_crtc_try_prop_enum
> )
>  (...) { ... }
>
> @@
> @@
> (
> - igt_pipe_obj_has_prop
> + igt_crtc_has_prop
> |
> - igt_pipe_obj_get_prop
> + igt_crtc_get_prop
> |
> - igt_pipe_obj_is_prop_changed
> + igt_crtc_is_prop_changed
> |
> - igt_pipe_obj_set_prop_changed
> + igt_crtc_set_prop_changed
> |
> - igt_pipe_obj_clear_prop_changed
> + igt_crtc_clear_prop_changed
> |
> - igt_pipe_obj_set_prop_value
> + igt_crtc_set_prop_value
> |
> - igt_pipe_obj_replace_prop_blob
> + igt_crtc_replace_prop_blob
> |
> - igt_pipe_obj_set_prop_enum
> + igt_crtc_set_prop_enum
> |
> - igt_pipe_obj_try_prop_enum
> + igt_crtc_try_prop_enum
> )
>  (...);
>
> @@
> @@
> (
> - igt_pipe_obj_has_prop
> + igt_crtc_has_prop
> |
> - igt_pipe_obj_get_prop
> + igt_crtc_get_prop
> |
> - igt_pipe_obj_is_prop_changed
> + igt_crtc_is_prop_changed
> |
> - igt_pipe_obj_set_prop_changed
> + igt_crtc_set_prop_changed
> |
> - igt_pipe_obj_clear_prop_changed
> + igt_crtc_clear_prop_changed
> |
> - igt_pipe_obj_set_prop_value
> + igt_crtc_set_prop_value
> |
> - igt_pipe_obj_replace_prop_blob
> + igt_crtc_replace_prop_blob
> |
> - igt_pipe_obj_set_prop_enum
> + igt_crtc_set_prop_enum
> |
> - igt_pipe_obj_try_prop_enum
> + igt_crtc_try_prop_enum
> )
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c                                 | 90 +++++++++----------
>  lib/igt_kms.h                                 | 30 +++----
>  tests/amdgpu/amd_bypass.c                     |  6 +-
>  tests/amdgpu/amd_color.c                      | 20 ++---
>  tests/amdgpu/amd_freesync_video_mode.c        |  2 +-
>  tests/amdgpu/amd_plane.c                      |  4 +-
>  tests/chamelium/kms_chamelium_color.c         | 16 ++--
>  tests/chamelium/kms_chamelium_helper.c        | 12 +--
>  .../kms_chamelium_sharpness_filter.c          |  6 +-
>  tests/intel/kms_big_fb.c                      |  6 +-
>  tests/intel/kms_flip_scaled_crc.c             |  4 +-
>  tests/intel/kms_pm_dc.c                       |  2 +-
>  tests/intel/kms_sharpness_filter.c            |  4 +-
>  tests/kms_atomic.c                            | 38 ++++----
>  tests/kms_atomic_transition.c                 |  2 +-
>  tests/kms_color.c                             | 34 +++----
>  tests/kms_color_helper.c                      | 24 ++---
>  tests/kms_content_protection.c                |  4 +-
>  tests/kms_vrr.c                               |  6 +-
>  19 files changed, 155 insertions(+), 155 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 3cb1273f3041..d5436c4cdd2e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2733,27 +2733,27 @@ static void igt_plane_reset(igt_plane_t *plane)
>=20=20
>  static void igt_pipe_reset(igt_crtc_t *pipe)
>  {
> -	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, 0);
> -	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_ACTIVE, 0);
> -	igt_pipe_obj_clear_prop_changed(pipe, IGT_CRTC_OUT_FENCE_PTR);
> +	igt_crtc_set_prop_value(pipe, IGT_CRTC_MODE_ID, 0);
> +	igt_crtc_set_prop_value(pipe, IGT_CRTC_ACTIVE, 0);
> +	igt_crtc_clear_prop_changed(pipe, IGT_CRTC_OUT_FENCE_PTR);
>=20=20
> -	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_CTM))
> -		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_CTM, 0);
> +	if (igt_crtc_has_prop(pipe, IGT_CRTC_CTM))
> +		igt_crtc_set_prop_value(pipe, IGT_CRTC_CTM, 0);
>=20=20
> -	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_GAMMA_LUT))
> -		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_GAMMA_LUT, 0);
> +	if (igt_crtc_has_prop(pipe, IGT_CRTC_GAMMA_LUT))
> +		igt_crtc_set_prop_value(pipe, IGT_CRTC_GAMMA_LUT, 0);
>=20=20
> -	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT))
> -		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_DEGAMMA_LUT, 0);
> +	if (igt_crtc_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT))
> +		igt_crtc_set_prop_value(pipe, IGT_CRTC_DEGAMMA_LUT, 0);
>=20=20
> -	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
> -		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
> +	if (igt_crtc_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
> +		igt_crtc_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
>=20=20
> -	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_VRR_ENABLED))
> -		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_VRR_ENABLED, 0);
> +	if (igt_crtc_has_prop(pipe, IGT_CRTC_VRR_ENABLED))
> +		igt_crtc_set_prop_value(pipe, IGT_CRTC_VRR_ENABLED, 0);
>=20=20
> -	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH))
> -		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_SHARPNESS_STRENGTH, 0);
> +	if (igt_crtc_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH))
> +		igt_crtc_set_prop_value(pipe, IGT_CRTC_SHARPNESS_STRENGTH, 0);
>=20=20
>  	pipe->out_fence_fd =3D -1;
>  }
> @@ -4061,7 +4061,7 @@ static int igt_primary_plane_commit_legacy(igt_plan=
e_t *primary,
>=20=20
>  	if (!igt_plane_is_prop_changed(primary, IGT_PLANE_FB_ID) &&
>  	    !(primary->changed & IGT_PLANE_COORD_CHANGED_MASK) &&
> -	    !igt_pipe_obj_is_prop_changed(primary->pipe, IGT_CRTC_MODE_ID))
> +	    !igt_crtc_is_prop_changed(primary->pipe, IGT_CRTC_MODE_ID))
>  		return 0;
>=20=20
>  	crtc_id =3D pipe->crtc_id;
> @@ -4210,7 +4210,7 @@ static int igt_pipe_commit(igt_crtc_t *pipe,
>  	int ret;
>=20=20
>  	for (i =3D 0; i < IGT_NUM_CRTC_PROPS; i++)
> -		if (igt_pipe_obj_is_prop_changed(pipe, i) &&
> +		if (igt_crtc_is_prop_changed(pipe, i) &&
>  		    !is_atomic_prop(i)) {
>  			igt_assert(pipe->props[i]);
>=20=20
> @@ -4659,7 +4659,7 @@ igt_output_replace_prop_blob(igt_output_t *output, =
enum igt_atomic_connector_pro
>  }
>=20=20
>  /**
> - * igt_pipe_obj_get_prop:
> + * igt_crtc_get_prop:
>   * @pipe: Target pipe.
>   * @prop: Property to return.
>   *
> @@ -4669,16 +4669,16 @@ igt_output_replace_prop_blob(igt_output_t *output=
, enum igt_atomic_connector_pro
>   * is a blob, the blob id is returned. This can be passed
>   * to drmModeGetPropertyBlob() to get the contents of the blob.
>   */
> -uint64_t igt_pipe_obj_get_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_pr=
operties prop)
> +uint64_t igt_crtc_get_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_proper=
ties prop)
>  {
> -	igt_assert(igt_pipe_obj_has_prop(pipe, prop));
> +	igt_assert(igt_crtc_has_prop(pipe, prop));
>=20=20
>  	return igt_mode_object_get_prop(pipe->display, DRM_MODE_OBJECT_CRTC,
>  					pipe->crtc_id, pipe->props[prop]);
>  }
>=20=20
>  /**
> - * igt_pipe_obj_try_prop_enum:
> + * igt_crtc_try_prop_enum:
>   * @pipe_obj: Target pipe object.
>   * @prop: Property to check.
>   * @val: Value to set.
> @@ -4686,7 +4686,7 @@ uint64_t igt_pipe_obj_get_prop(igt_crtc_t *pipe, en=
um igt_atomic_crtc_properties
>   * Returns: False if the given @pipe_obj doesn't have the enum @prop or
>   * failed to set the enum property @val else True.
>   */
> -bool igt_pipe_obj_try_prop_enum(igt_crtc_t *pipe_obj,
> +bool igt_crtc_try_prop_enum(igt_crtc_t *pipe_obj,
>  				enum igt_atomic_crtc_properties prop,
>  				const char *val)
>  {
> @@ -4699,12 +4699,12 @@ bool igt_pipe_obj_try_prop_enum(igt_crtc_t *pipe_=
obj,
>  						 pipe_obj->props[prop], val, &uval))
>  		return false;
>=20=20
> -	igt_pipe_obj_set_prop_value(pipe_obj, prop, uval);
> +	igt_crtc_set_prop_value(pipe_obj, prop, uval);
>  	return true;
>  }
>=20=20
>  /**
> - * igt_pipe_obj_set_prop_enum:
> + * igt_crtc_set_prop_enum:
>   * @pipe_obj: Target pipe object.
>   * @prop: Property to check.
>   * @val: Value to set.
> @@ -4712,15 +4712,15 @@ bool igt_pipe_obj_try_prop_enum(igt_crtc_t *pipe_=
obj,
>   * This function tries to set given enum property @prop value @val to
>   * the given @pipe_obj, and terminate the execution if its failed.
>   */
> -void igt_pipe_obj_set_prop_enum(igt_crtc_t *pipe_obj,
> +void igt_crtc_set_prop_enum(igt_crtc_t *pipe_obj,
>  				enum igt_atomic_crtc_properties prop,
>  				const char *val)
>  {
> -	igt_assert(igt_pipe_obj_try_prop_enum(pipe_obj, prop, val));
> +	igt_assert(igt_crtc_try_prop_enum(pipe_obj, prop, val));
>  }
>=20=20
>  /**
> - * igt_pipe_obj_replace_prop_blob:
> + * igt_crtc_replace_prop_blob:
>   * @pipe: pipe to set property on.
>   * @prop: property for which the blob will be replaced.
>   * @ptr: Pointer to contents for the property.
> @@ -4736,7 +4736,7 @@ void igt_pipe_obj_set_prop_enum(igt_crtc_t *pipe_ob=
j,
>   * it works better with legacy commit.
>   */
>  void
> -igt_pipe_obj_replace_prop_blob(igt_crtc_t *pipe, enum igt_atomic_crtc_pr=
operties prop, const void *ptr, size_t length)
> +igt_crtc_replace_prop_blob(igt_crtc_t *pipe, enum igt_atomic_crtc_proper=
ties prop, const void *ptr, size_t length)
>  {
>  	igt_display_t *display =3D pipe->display;
>  	uint64_t *blob =3D &pipe->values[prop];
> @@ -4751,7 +4751,7 @@ igt_pipe_obj_replace_prop_blob(igt_crtc_t *pipe, en=
um igt_atomic_crtc_properties
>  						     ptr, length, &blob_id) =3D=3D 0);
>=20=20
>  	*blob =3D blob_id;
> -	igt_pipe_obj_set_prop_changed(pipe, prop);
> +	igt_crtc_set_prop_changed(pipe, prop);
>  }
>=20=20
>  /*
> @@ -4762,7 +4762,7 @@ static void igt_atomic_prepare_crtc_commit(igt_crtc=
_t *pipe_obj, drmModeAtomicRe
>  	int i;
>=20=20
>  	for (i =3D 0; i < IGT_NUM_CRTC_PROPS; i++) {
> -		if (!igt_pipe_obj_is_prop_changed(pipe_obj, i))
> +		if (!igt_crtc_is_prop_changed(pipe_obj, i))
>  			continue;
>=20=20
>  		igt_debug("Pipe %s: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n=
",
> @@ -4876,7 +4876,7 @@ display_commit_changed(igt_display_t *display, enum=
 igt_commit_style s)
>  		igt_plane_t *plane;
>=20=20
>  		if (s =3D=3D COMMIT_ATOMIC) {
> -			if (igt_pipe_obj_is_prop_changed(pipe_obj, IGT_CRTC_OUT_FENCE_PTR))
> +			if (igt_crtc_is_prop_changed(pipe_obj, IGT_CRTC_OUT_FENCE_PTR))
>  				igt_assert(pipe_obj->out_fence_fd >=3D 0);
>=20=20
>  			pipe_obj->values[IGT_CRTC_OUT_FENCE_PTR] =3D 0;
> @@ -4884,11 +4884,11 @@ display_commit_changed(igt_display_t *display, en=
um igt_commit_style s)
>  		} else {
>  			for (i =3D 0; i < IGT_NUM_CRTC_PROPS; i++)
>  				if (!is_atomic_prop(i))
> -					igt_pipe_obj_clear_prop_changed(pipe_obj, i);
> +					igt_crtc_clear_prop_changed(pipe_obj, i);
>=20=20
>  			if (s !=3D COMMIT_UNIVERSAL) {
> -				igt_pipe_obj_clear_prop_changed(pipe_obj, IGT_CRTC_MODE_ID);
> -				igt_pipe_obj_clear_prop_changed(pipe_obj, IGT_CRTC_ACTIVE);
> +				igt_crtc_clear_prop_changed(pipe_obj, IGT_CRTC_MODE_ID);
> +				igt_crtc_clear_prop_changed(pipe_obj, IGT_CRTC_ACTIVE);
>  			}
>  		}
>=20=20
> @@ -5274,9 +5274,9 @@ void igt_output_override_mode(igt_output_t *output,=
 const drmModeModeInfo *mode)
>=20=20
>  	if (pipe) {
>  		if (output->display->is_atomic)
> -			igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, igt_output_get=
_mode(output), sizeof(*mode));
> +			igt_crtc_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, igt_output_get_mod=
e(output), sizeof(*mode));
>  		else
> -			igt_pipe_obj_set_prop_changed(pipe, IGT_CRTC_MODE_ID);
> +			igt_crtc_set_prop_changed(pipe, IGT_CRTC_MODE_ID);
>  	}
>  }
>=20=20
> @@ -5334,11 +5334,11 @@ void igt_output_set_crtc(igt_output_t *output, ig=
t_crtc_t *pipe_obj)
>  		old_output =3D igt_pipe_get_output(old_pipe);
>  		if (!old_output) {
>  			if (display->is_atomic)
> -				igt_pipe_obj_replace_prop_blob(old_pipe, IGT_CRTC_MODE_ID, NULL, 0);
> +				igt_crtc_replace_prop_blob(old_pipe, IGT_CRTC_MODE_ID, NULL, 0);
>  			else
> -				igt_pipe_obj_set_prop_changed(old_pipe, IGT_CRTC_MODE_ID);
> +				igt_crtc_set_prop_changed(old_pipe, IGT_CRTC_MODE_ID);
>=20=20
> -			igt_pipe_obj_set_prop_value(old_pipe, IGT_CRTC_ACTIVE, 0);
> +			igt_crtc_set_prop_value(old_pipe, IGT_CRTC_ACTIVE, 0);
>  		}
>  	}
>=20=20
> @@ -5349,11 +5349,11 @@ void igt_output_set_crtc(igt_output_t *output, ig=
t_crtc_t *pipe_obj)
>=20=20
>  	if (pipe_obj) {
>  		if (display->is_atomic)
> -			igt_pipe_obj_replace_prop_blob(pipe_obj, IGT_CRTC_MODE_ID, igt_output=
_get_mode(output), sizeof(drmModeModeInfo));
> +			igt_crtc_replace_prop_blob(pipe_obj, IGT_CRTC_MODE_ID, igt_output_get=
_mode(output), sizeof(drmModeModeInfo));
>  		else
> -			igt_pipe_obj_set_prop_changed(pipe_obj, IGT_CRTC_MODE_ID);
> +			igt_crtc_set_prop_changed(pipe_obj, IGT_CRTC_MODE_ID);
>=20=20
> -		igt_pipe_obj_set_prop_value(pipe_obj, IGT_CRTC_ACTIVE, 1);
> +		igt_crtc_set_prop_value(pipe_obj, IGT_CRTC_ACTIVE, 1);
>  	}
>  }
>=20=20
> @@ -5484,9 +5484,9 @@ void igt_pipe_refresh(igt_display_t *display, enum =
pipe pipe, bool force)
>=20=20
>  		pipe_obj->values[IGT_CRTC_MODE_ID] =3D 0;
>  		if (output)
> -			igt_pipe_obj_replace_prop_blob(pipe_obj, IGT_CRTC_MODE_ID, igt_output=
_get_mode(output), sizeof(drmModeModeInfo));
> +			igt_crtc_replace_prop_blob(pipe_obj, IGT_CRTC_MODE_ID, igt_output_get=
_mode(output), sizeof(drmModeModeInfo));
>  	} else
> -		igt_pipe_obj_set_prop_changed(pipe_obj, IGT_CRTC_MODE_ID);
> +		igt_crtc_set_prop_changed(pipe_obj, IGT_CRTC_MODE_ID);
>  }
>=20=20
>  /**
> @@ -5805,7 +5805,7 @@ void igt_plane_set_rotation(igt_plane_t *plane, igt=
_rotation_t rotation)
>   */
>  void igt_pipe_request_out_fence(igt_crtc_t *pipe)
>  {
> -	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)&p=
ipe->out_fence_fd);
> +	igt_crtc_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)&pipe-=
>out_fence_fd);
>  }
>=20=20
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b848ca2eb973..f12baf94504e 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1038,7 +1038,7 @@ extern void igt_output_replace_prop_blob(igt_output=
_t *output,
>  					 enum igt_atomic_connector_properties prop,
>  					 const void *ptr, size_t length);
>  /**
> - * igt_pipe_obj_has_prop:
> + * igt_crtc_has_prop:
>   * @pipe: Pipe to check.
>   * @prop: Property to check.
>   *
> @@ -1047,76 +1047,76 @@ extern void igt_output_replace_prop_blob(igt_outp=
ut_t *output,
>   * Returns: True if the property is supported, otherwise false.
>   */
>  static inline bool
> -igt_pipe_obj_has_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties =
prop)
> +igt_crtc_has_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
>  {
>  	return pipe->props[prop];
>  }
>=20=20
> -uint64_t igt_pipe_obj_get_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_pr=
operties prop);
> +uint64_t igt_crtc_get_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_proper=
ties prop);
>=20=20
>  /**
> - * igt_pipe_obj_is_prop_changed:
> + * igt_crtc_is_prop_changed:
>   * @pipe_obj: Pipe object to check.
>   * @prop: Property to check.
>   *
>   * Check whether a given @prop changed for the @pipe_obj.
>   */
> -static inline bool igt_pipe_obj_is_prop_changed(igt_crtc_t *pipe_obj,
> +static inline bool igt_crtc_is_prop_changed(igt_crtc_t *pipe_obj,
>  						enum igt_atomic_crtc_properties prop)
>  {
>  	return pipe_obj->changed & (1 << prop);
>  }
>=20=20
>  /**
> - * igt_pipe_obj_set_prop_changed:
> + * igt_crtc_set_prop_changed:
>   * @pipe_obj: Pipe object to check.
>   * @prop: Property to check.
>   *
>   * Sets the given @prop for the @pipe_obj.
>   */
> -static inline void igt_pipe_obj_set_prop_changed(igt_crtc_t *pipe_obj,
> +static inline void igt_crtc_set_prop_changed(igt_crtc_t *pipe_obj,
>  						 enum igt_atomic_crtc_properties prop)
>  {
>  	pipe_obj->changed |=3D 1 << prop;
>  }
>=20=20
>  /**
> - * igt_pipe_obj_clear_prop_changed:
> + * igt_crtc_clear_prop_changed:
>   * @pipe_obj: Pipe object to check.
>   * @prop: Property to check.
>   *
>   * Clears the given @prop for the @pipe_obj.
>   */
> -static inline void igt_pipe_obj_clear_prop_changed(igt_crtc_t *pipe_obj,
> +static inline void igt_crtc_clear_prop_changed(igt_crtc_t *pipe_obj,
>  						   enum igt_atomic_crtc_properties prop)
>  {
>  	pipe_obj->changed &=3D ~(1 << prop);
>  }
>=20=20
>  /**
> - * igt_pipe_obj_set_prop_value:
> + * igt_crtc_set_prop_value:
>   * @pipe_obj: Pipe object to check.
>   * @prop: Property to check.
>   * @value: Value to set.
>   *
>   * Sets the given @prop with the @value for the @pipe_obj.
>   */
> -static inline void igt_pipe_obj_set_prop_value(igt_crtc_t *pipe_obj,
> +static inline void igt_crtc_set_prop_value(igt_crtc_t *pipe_obj,
>  					       enum igt_atomic_crtc_properties prop,
>  					       uint64_t value)
>  {
>  	pipe_obj->values[prop] =3D value;
> -	igt_pipe_obj_set_prop_changed(pipe_obj, prop);
> +	igt_crtc_set_prop_changed(pipe_obj, prop);
>  }
>=20=20
> -extern bool igt_pipe_obj_try_prop_enum(igt_crtc_t *pipe,
> +extern bool igt_crtc_try_prop_enum(igt_crtc_t *pipe,
>  				       enum igt_atomic_crtc_properties prop,
>  				       const char *val);
>=20=20
> -extern void igt_pipe_obj_set_prop_enum(igt_crtc_t *pipe,
> +extern void igt_crtc_set_prop_enum(igt_crtc_t *pipe,
>  				       enum igt_atomic_crtc_properties prop,
>  				       const char *val);
> -extern void igt_pipe_obj_replace_prop_blob(igt_crtc_t *pipe,
> +extern void igt_crtc_replace_prop_blob(igt_crtc_t *pipe,
>  					   enum igt_atomic_crtc_properties prop,
>  					   const void *ptr, size_t length);
>  void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force=
);
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 7f768ea4e209..80aa46890fc1 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -359,9 +359,9 @@ static void bypass_8bpc_test(data_t *data)
>  	 *   no regamma
>  	 *   no CTM
>  	 */
> -	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_DEGAMMA_LUT, NULL, =
0);
> -	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_GAMMA_LUT, NULL, 0);
> -	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_CTM, NULL, 0);
> +	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_DEGAMMA_LUT, NULL, 0);
> +	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_GAMMA_LUT, NULL, 0);
> +	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_CTM, NULL, 0);
>=20=20
>  	igt_plane_set_fb(data->primary, &fb);
>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index 9631fc34d9f4..ed3e9170f615 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -159,7 +159,7 @@ static void set_degamma_lut(data_t *data, lut_t const=
 *lut)
>  	size_t size =3D lut ? sizeof(lut->data[0]) * lut->size : 0;
>  	const void *ptr =3D lut ? lut->data : NULL;
>=20=20
> -	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_DEGAMMA_LUT, ptr,
> +	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_DEGAMMA_LUT, ptr,
>  				       size);
>  }
>=20=20
> @@ -169,7 +169,7 @@ static void set_regamma_lut(data_t *data, lut_t const=
 *lut)
>  	size_t size =3D lut ? sizeof(lut->data[0]) * lut->size : 0;
>  	const void *ptr =3D lut ? lut->data : NULL;
>=20=20
> -	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_GAMMA_LUT, ptr,
> +	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_GAMMA_LUT, ptr,
>  				       size);
>  }
>=20=20
> @@ -228,10 +228,10 @@ static void test_crtc_linear_degamma(data_t *data)
>=20=20
>  	test_init(data);
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
>=20=20
>  	data->degamma_lut_size =3D
> -		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
> +		igt_crtc_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
>=20=20
>  	lut_init(&lut_linear, data->degamma_lut_size);
>  	lut_gen_linear(&lut_linear, 0xffff);
> @@ -275,10 +275,10 @@ static void test_crtc_linear_regamma(data_t *data)
>=20=20
>  	test_init(data);
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
>=20=20
>  	data->regamma_lut_size =3D
> -		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
> +		igt_crtc_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
>=20=20
>  	lut_init(&lut_linear, data->regamma_lut_size);
>  	lut_gen_linear(&lut_linear, 0xffff);
> @@ -338,14 +338,14 @@ static void test_crtc_lut_accuracy(data_t *data)
>=20=20
>  	test_init(data);
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
> -	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
>=20=20
>  	data->degamma_lut_size =3D
> -		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
> +		igt_crtc_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
>=20=20
>  	data->regamma_lut_size =3D
> -		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
> +		igt_crtc_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
>=20=20
>  	lut_init(&lut_degamma, data->degamma_lut_size);
>  	lut_gen_degamma_srgb(&lut_degamma, 0xffff);
> diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_fr=
eesync_video_mode.c
> index 812212ac5f2b..964833994533 100644
> --- a/tests/amdgpu/amd_freesync_video_mode.c
> +++ b/tests/amdgpu/amd_freesync_video_mode.c
> @@ -548,7 +548,7 @@ static bool has_vrr(igt_output_t *output)
>  /* Toggles variable refresh rate on the pipe. */
>  static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
>  {
> -	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
> +	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
>  				    IGT_CRTC_VRR_ENABLED,
>  				    enabled);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
> index 53fb6a12f558..06d2ace58a49 100644
> --- a/tests/amdgpu/amd_plane.c
> +++ b/tests/amdgpu/amd_plane.c
> @@ -265,7 +265,7 @@ static void set_regamma_lut(data_t *data, lut_t const=
 *lut, int n)
>  {
>  	size_t size =3D lut ? sizeof(lut->data) * lut->size : 0;
>  	const void *ptr =3D lut ? lut->data : NULL;
> -	igt_pipe_obj_replace_prop_blob(data->pipe[n], IGT_CRTC_GAMMA_LUT, ptr,
> +	igt_crtc_replace_prop_blob(data->pipe[n], IGT_CRTC_GAMMA_LUT, ptr,
>  				       size);
>  }
>=20=20
> @@ -627,7 +627,7 @@ static void test_display_mpo(data_t *data, enum test =
test, uint32_t format, int
>  	igt_skip_on_f(valid_outputs < display_count,
>  			"Valid outputs (%d) should be equal or greater than %d\n", valid_outp=
uts, display_count);
>=20=20
> -	regamma_lut_size =3D igt_pipe_obj_get_prop(data->pipe[0], IGT_CRTC_GAMM=
A_LUT_SIZE);
> +	regamma_lut_size =3D igt_crtc_get_prop(data->pipe[0], IGT_CRTC_GAMMA_LU=
T_SIZE);
>  	igt_assert_lt(0, regamma_lut_size);
>  	lut_init(&lut, regamma_lut_size);
>  	lut_gen(&lut);
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_=
chamelium_color.c
> index 2512f7b7e049..86d43509244a 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -80,7 +80,7 @@ static bool test_pipe_degamma(data_t *data,
>  	};
>  	bool ret;
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
>=20=20
>  	degamma_full =3D generate_table_max(data->degamma_lut_size);
>=20=20
> @@ -169,7 +169,7 @@ static bool test_pipe_gamma(data_t *data,
>  	};
>  	bool ret;
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
>=20=20
>  	gamma_full =3D generate_table_max(data->gamma_lut_size);
>=20=20
> @@ -255,7 +255,7 @@ static bool test_pipe_ctm(data_t *data,
>  	int fb_id, fb_modeset_id, fbref_id;
>  	bool ret =3D true;
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
> +	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM));
>=20=20
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
> @@ -358,7 +358,7 @@ static bool test_pipe_limited_range_ctm(data_t *data,
>  	int fb_id0, fb_id1;
>  	bool ret =3D false;
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
> +	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM));
>=20=20
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
> @@ -433,16 +433,16 @@ prep_pipe(data_t *data, enum pipe p)
>  {
>  	igt_require_pipe(&data->display, p);
>=20=20
> -	if (igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRT=
C_DEGAMMA_LUT_SIZE)) {
> +	if (igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRTC_DE=
GAMMA_LUT_SIZE)) {
>  		data->degamma_lut_size =3D
> -			igt_pipe_obj_get_prop(igt_crtc_for_pipe(&data->display, p),
> +			igt_crtc_get_prop(igt_crtc_for_pipe(&data->display, p),
>  					      IGT_CRTC_DEGAMMA_LUT_SIZE);
>  		igt_assert_lt(0, data->degamma_lut_size);
>  	}
>=20=20
> -	if (igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRT=
C_GAMMA_LUT_SIZE)) {
> +	if (igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRTC_GA=
MMA_LUT_SIZE)) {
>  		data->gamma_lut_size =3D
> -			igt_pipe_obj_get_prop(igt_crtc_for_pipe(&data->display, p),
> +			igt_crtc_get_prop(igt_crtc_for_pipe(&data->display, p),
>  					      IGT_CRTC_GAMMA_LUT_SIZE);
>  		igt_assert_lt(0, data->gamma_lut_size);
>  	}
> diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms=
_chamelium_helper.c
> index 328ff9292d0d..12735c541de1 100644
> --- a/tests/chamelium/kms_chamelium_helper.c
> +++ b/tests/chamelium/kms_chamelium_helper.c
> @@ -182,14 +182,14 @@ void chamelium_enable_output(chamelium_data_t *data,
>  	igt_output_override_mode(output, mode);
>=20=20
>  	/* Clear any color correction values that might be enabled */
> -	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> -		igt_pipe_obj_replace_prop_blob(primary->pipe,
> +	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> +		igt_crtc_replace_prop_blob(primary->pipe,
>  					       IGT_CRTC_DEGAMMA_LUT, NULL, 0);
> -	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT))
> -		igt_pipe_obj_replace_prop_blob(primary->pipe,
> +	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT))
> +		igt_crtc_replace_prop_blob(primary->pipe,
>  					       IGT_CRTC_GAMMA_LUT, NULL, 0);
> -	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
> -		igt_pipe_obj_replace_prop_blob(primary->pipe, IGT_CRTC_CTM,
> +	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM))
> +		igt_crtc_replace_prop_blob(primary->pipe, IGT_CRTC_CTM,
>  					       NULL, 0);
>=20=20
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/cha=
melium/kms_chamelium_sharpness_filter.c
> index fb6e95a92b5e..21d4b6fe649e 100644
> --- a/tests/chamelium/kms_chamelium_sharpness_filter.c
> +++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
> @@ -53,14 +53,14 @@ static bool pipe_output_combo_valid(data_t *data, enu=
m pipe pipe)
>=20=20
>  static void set_filter_strength_on_pipe(data_t *data)
>  {
> -	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, data->pip=
e_id),
> +	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, data->pipe_id=
),
>  				    IGT_CRTC_SHARPNESS_STRENGTH,
>  				    data->filter_strength);
>  }
>=20=20
>  static void reset_filter_strength_on_pipe(data_t *data)
>  {
> -	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, data->pip=
e_id),
> +	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, data->pipe_id=
),
>  				    IGT_CRTC_SHARPNESS_STRENGTH, 0);
>  }
>=20=20
> @@ -219,7 +219,7 @@ static void test_sharpness_filter(data_t *data,  enum=
 pipe p)
>  	int port_idx =3D test_setup(data, p);
>=20=20
>  	igt_require(port_idx >=3D 0);
> -	igt_require(igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, p),=
 IGT_CRTC_SHARPNESS_STRENGTH));
> +	igt_require(igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, p), IGT=
_CRTC_SHARPNESS_STRENGTH));
>=20=20
>  	if (!pipe_output_combo_valid(data, p))
>  		return;
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 595611c319f0..4c83398400ba 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -389,7 +389,7 @@ static void set_c8_lut(data_t *data)
>  		lut[i].blue =3D ((i & 0x03) >> 0) * 0xffff / 0x3;
>  	}
>=20=20
> -	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut,
> +	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut,
>  				       lut_size * sizeof(lut[0]));
>=20=20
>  	free(lut);
> @@ -399,7 +399,7 @@ static void unset_lut(data_t *data)
>  {
>  	igt_crtc_t *pipe =3D igt_crtc_for_pipe(&data->display, data->pipe);
>=20=20
> -	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, NULL, 0);
> +	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, NULL, 0);
>  }
>=20=20
>  static bool test_plane(data_t *data)
> @@ -518,7 +518,7 @@ static bool test_pipe(data_t *data)
>  		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
>=20=20
>  	if (data->format =3D=3D DRM_FORMAT_C8 &&
> -	    !igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, data->pipe=
),
> +	    !igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, data->pipe),
>  				   IGT_CRTC_GAMMA_LUT))
>  		return false;
>=20=20
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_sca=
led_crc.c
> index 954b46b5ff67..3f8cd0bd642a 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -709,7 +709,7 @@ static void set_lut(data_t *data, enum pipe pipe)
>  		lut[i].blue =3D v;
>  	}
>=20=20
> -	igt_pipe_obj_replace_prop_blob(pipe_obj, IGT_CRTC_GAMMA_LUT,
> +	igt_crtc_replace_prop_blob(pipe_obj, IGT_CRTC_GAMMA_LUT,
>  				       lut, sizeof(lut[0]) * lut_size);
>=20=20
>  	free(lut);
> @@ -719,7 +719,7 @@ static void clear_lut(data_t *data, enum pipe pipe)
>  {
>  	igt_crtc_t *pipe_obj =3D igt_crtc_for_pipe(&data->display, pipe);
>=20=20
> -	igt_pipe_obj_set_prop_value(pipe_obj, IGT_CRTC_GAMMA_LUT, 0);
> +	igt_crtc_set_prop_value(pipe_obj, IGT_CRTC_GAMMA_LUT, 0);
>  }
>=20=20
>  static void test_flip_to_scaled(data_t *data, uint32_t index,
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 9055e66a2ffa..4babf1341e0b 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -663,7 +663,7 @@ static void test_deep_pkgc_state(data_t *data)
>  				 * TODO: Add check for vmin =3D vmax =3D flipline if VRR enabled
>  				 * when KMD allows for such capability.
>  				 */
> -				igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(display, pipe),
> +				igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
>  							    IGT_CRTC_VRR_ENABLED,
>  							    false);
>  				igt_assert(igt_display_try_commit_atomic(display,
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpne=
ss_filter.c
> index ffc43dbaf129..94c11ed2fecb 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -173,7 +173,7 @@ typedef struct {
>=20=20
>  static void set_filter_strength_on_pipe(data_t *data)
>  {
> -	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, data->pip=
e_id),
> +	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, data->pipe_id=
),
>  				    IGT_CRTC_SHARPNESS_STRENGTH,
>  				    data->filter_strength);
>  }
> @@ -419,7 +419,7 @@ static void test_sharpness_filter(data_t *data,  enum=
 test_type type)
>=20=20
>  static bool has_sharpness_filter(igt_crtc_t *pipe)
>  {
> -	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
> +	return igt_crtc_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
>  }
>=20=20
>  static void
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 58d57cafecce..d20a500f37c7 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -232,7 +232,7 @@ static void crtc_get_current_state(igt_crtc_t *pipe, =
uint64_t *values)
>  			continue;
>  		}
>=20=20
> -		values[i] =3D igt_pipe_obj_get_prop(pipe, i);
> +		values[i] =3D igt_crtc_get_prop(pipe, i);
>  	}
>  }
>=20=20
> @@ -856,20 +856,20 @@ static void crtc_invalid_params(data_t *data, igt_o=
utput_t *output)
>  	drmModeModeInfo *mode =3D igt_output_get_mode(output);
>=20=20
>  	/* Pass a series of invalid object IDs for the mode ID. */
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->primary=
->drm_plane->plane_id);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->primary->dr=
m_plane->plane_id);
>  	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EI=
NVAL);
>=20=20
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->pipe->c=
rtc_id);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->pipe->crtc_=
id);
>  	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EI=
NVAL);
>=20=20
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->fb.fb_i=
d);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->fb.fb_id);
>  	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EI=
NVAL);
>=20=20
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, old_mode_id);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, old_mode_id);
>  	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_ATOMIC=
_TEST_ONLY, ATOMIC_RELAX_NONE, 0);
>=20=20
>  	/* Can we restore mode? */
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, old_mode_id);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, old_mode_id);
>  	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_ATOMIC=
_TEST_ONLY, ATOMIC_RELAX_NONE, 0);
>=20=20
>  	/*
> @@ -882,14 +882,14 @@ static void crtc_invalid_params(data_t *data, igt_o=
utput_t *output)
>  				     ATOMIC_RELAX_NONE, EINVAL);
>=20=20
>  	/* Create a blob which is the wrong size to be a valid mode. */
> -	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, size=
of(*mode) - 1);
> +	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, sizeof(*=
mode) - 1);
>  	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EI=
NVAL);
>=20=20
> -	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, size=
of(*mode) + 1);
> +	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, sizeof(*=
mode) + 1);
>  	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EI=
NVAL);
>=20=20
>  	/* Restore the CRTC and check the state matches the old. */
> -	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, size=
of(*mode));
> +	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, sizeof(*=
mode));
>  	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE=
);
>  }
>=20=20
> @@ -908,7 +908,7 @@ static void crtc_invalid_params_fence(data_t *data, i=
gt_output_t *output)
>  	map =3D mmap(NULL, page_size, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -=
1, 0);
>  	igt_assert(map !=3D MAP_FAILED);
>=20=20
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdif=
f_t)map);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)=
map);
>  	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EF=
AULT);
>  	munmap(map, page_size);
>=20=20
> @@ -916,7 +916,7 @@ static void crtc_invalid_params_fence(data_t *data, i=
gt_output_t *output)
>  	map =3D mmap(NULL, page_size, PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -=
1, 0);
>  	igt_assert(map !=3D MAP_FAILED);
>=20=20
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdif=
f_t)map);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)=
map);
>  	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EF=
AULT);
>  	munmap(map, page_size);
>=20=20
> @@ -924,7 +924,7 @@ static void crtc_invalid_params_fence(data_t *data, i=
gt_output_t *output)
>  	map =3D mmap(NULL, page_size, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -=
1, 0);
>  	igt_assert(map !=3D MAP_FAILED);
>=20=20
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdif=
f_t)map);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)=
map);
>  	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EF=
AULT);
>  	munmap(map, page_size);
>=20=20
> @@ -932,8 +932,8 @@ static void crtc_invalid_params_fence(data_t *data, i=
gt_output_t *output)
>  	fence_fd =3D sw_sync_timeline_create_fence(timeline, 1);
>  	igt_plane_set_fence_fd(data->primary, fence_fd);
>=20=20
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_ACTIVE, 0);
> -	igt_pipe_obj_clear_prop_changed(data->pipe, IGT_CRTC_OUT_FENCE_PTR);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_ACTIVE, 0);
> +	igt_crtc_clear_prop_changed(data->pipe, IGT_CRTC_OUT_FENCE_PTR);
>=20=20
>  	crtc_commit_atomic_flags_err(data->pipe, data->primary, 0, ATOMIC_RELAX=
_NONE, EINVAL);
>=20=20
> @@ -947,14 +947,14 @@ static void crtc_invalid_params_fence(data_t *data,=
 igt_output_t *output)
>  	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_PAGE_F=
LIP_EVENT,
>  				     ATOMIC_RELAX_NONE, EINVAL);
>=20=20
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_ACTIVE, 1);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_ACTIVE, 1);
>=20=20
>  	/* Configuration should be valid again */
>  	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_ATOMIC=
_TEST_ONLY,
>  				     ATOMIC_RELAX_NONE, 0);
>=20=20
>  	/* Set invalid prop */
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->fb.fb_i=
d);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->fb.fb_id);
>=20=20
>  	/* valid out fence but invalid prop on crtc */
>  	igt_pipe_request_out_fence(data->pipe);
> @@ -970,7 +970,7 @@ static void crtc_invalid_params_fence(data_t *data, i=
gt_output_t *output)
>  				     ATOMIC_RELAX_NONE, EINVAL);
>=20=20
>  	/* successful TEST_ONLY with fences set */
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, old_mode_id);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, old_mode_id);
>  	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_ATOMIC=
_TEST_ONLY,
>  				     ATOMIC_RELAX_NONE, 0);
>  	igt_assert(data->pipe->out_fence_fd =3D=3D -1);
> @@ -979,8 +979,8 @@ static void crtc_invalid_params_fence(data_t *data, i=
gt_output_t *output)
>=20=20
>  	/* reset fences */
>  	igt_plane_set_fence_fd(data->primary, -1);
> -	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, 0);
> -	igt_pipe_obj_clear_prop_changed(data->pipe, IGT_CRTC_OUT_FENCE_PTR);
> +	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, 0);
> +	igt_crtc_clear_prop_changed(data->pipe, IGT_CRTC_OUT_FENCE_PTR);
>  	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE=
);
>=20=20
>  	/* out fence ptr but not page flip event */
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 6aa3439eedae..4da3289073ce 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -829,7 +829,7 @@ static unsigned set_combinations(data_t *data, unsign=
ed mask, struct igt_fb *fb)
>  		drmModeModeInfo *mode =3D NULL;
>=20=20
>  		if (!(mask & (1 << pipe))) {
> -			if (igt_pipe_obj_is_prop_changed(igt_crtc_for_pipe(&data->display, pi=
pe), IGT_CRTC_ACTIVE)) {
> +			if (igt_crtc_is_prop_changed(igt_crtc_for_pipe(&data->display, pipe),=
 IGT_CRTC_ACTIVE)) {
>  				event_mask |=3D 1 << pipe;
>  				igt_plane_set_fb(plane, NULL);
>  			}
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 74ead943a798..2fc3aec75907 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -94,8 +94,8 @@ static bool test_pipe_degamma(data_t *data,
>  	int fb_id, fb_modeset_id;
>  	bool ret;
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
> -	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
>=20=20
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	degamma_full =3D generate_table_max(data->degamma_lut_size);
> @@ -183,7 +183,7 @@ static bool test_pipe_gamma(data_t *data,
>  	int fb_id, fb_modeset_id;
>  	bool ret;
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
>=20=20
>  	gamma_full =3D generate_table_max(data->gamma_lut_size);
>=20=20
> @@ -378,9 +378,9 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>  	igt_output_t *output =3D data->output;
>  	bool ret =3D true;
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
>=20=20
> -	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> +	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
>  		degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_zero =3D generate_table_zero(data->gamma_lut_size);
>=20=20
> @@ -397,14 +397,14 @@ static bool test_pipe_legacy_gamma_reset(data_t *da=
ta,
>  	 * properties and verify the content of the
>  	 * properties.
>  	 */
> -	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> +	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
>  		set_degamma(data, primary->pipe, degamma_linear);
> -	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
> +	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM))
>  		set_ctm(primary->pipe, ctm_identity);
>  	set_gamma(data, primary->pipe, gamma_zero);
>  	igt_display_commit(&data->display);
>=20=20
> -	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)) {
> +	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)) {
>  		blob =3D get_blob(data, primary->pipe, IGT_CRTC_DEGAMMA_LUT);
>  		igt_assert(blob &&
>  			   blob->length =3D=3D (sizeof(struct drm_color_lut) *
> @@ -412,7 +412,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>  		drmModeFreePropertyBlob(blob);
>  	}
>=20=20
> -	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM)) {
> +	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM)) {
>  		blob =3D get_blob(data, primary->pipe, IGT_CRTC_CTM);
>  		igt_assert(blob &&
>  			   blob->length =3D=3D sizeof(struct drm_color_ctm));
> @@ -459,11 +459,11 @@ static bool test_pipe_legacy_gamma_reset(data_t *da=
ta,
>  					  red_lut, green_lut, blue_lut), 0);
>  	igt_display_commit(&data->display);
>=20=20
> -	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> +	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
>  		igt_assert(get_blob(data, primary->pipe,
>  				    IGT_CRTC_DEGAMMA_LUT) =3D=3D NULL);
>=20=20
> -	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
> +	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM))
>  		igt_assert(get_blob(data, primary->pipe, IGT_CRTC_CTM) =3D=3D NULL);
>=20=20
>  	blob =3D get_blob(data, primary->pipe, IGT_CRTC_GAMMA_LUT);
> @@ -514,7 +514,7 @@ static bool test_pipe_ctm(data_t *data,
>  	igt_crc_t crc_software, crc_hardware;
>  	int fb_id, fb_modeset_id;
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
> +	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM));
>=20=20
>  	igt_output_set_crtc(output, primary->pipe);
>  	igt_output_override_mode(output, mode);
> @@ -546,7 +546,7 @@ static bool test_pipe_ctm(data_t *data,
>  	 * rounding issues and inaccuracies leading to crc mismatch.
>  	 */
>  	if (is_intel_device(data->drm_fd) && memcmp(before, after, sizeof(color=
_t))) {
> -		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +		igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
>=20=20
>  		gamma_linear =3D generate_table(256, 1.0);
>=20=20
> @@ -714,16 +714,16 @@ prep_pipe(data_t *data, enum pipe p)
>  {
>  	igt_require_pipe(&data->display, p);
>=20=20
> -	if (igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRT=
C_DEGAMMA_LUT_SIZE)) {
> +	if (igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRTC_DE=
GAMMA_LUT_SIZE)) {
>  		data->degamma_lut_size =3D
> -			igt_pipe_obj_get_prop(igt_crtc_for_pipe(&data->display, p),
> +			igt_crtc_get_prop(igt_crtc_for_pipe(&data->display, p),
>  					      IGT_CRTC_DEGAMMA_LUT_SIZE);
>  		igt_assert_lt(0, data->degamma_lut_size);
>  	}
>=20=20
> -	if (igt_pipe_obj_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRT=
C_GAMMA_LUT_SIZE)) {
> +	if (igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRTC_GA=
MMA_LUT_SIZE)) {
>  		data->gamma_lut_size =3D
> -			igt_pipe_obj_get_prop(igt_crtc_for_pipe(&data->display, p),
> +			igt_crtc_get_prop(igt_crtc_for_pipe(&data->display, p),
>  					      IGT_CRTC_GAMMA_LUT_SIZE);
>  		igt_assert_lt(0, data->gamma_lut_size);
>  	}
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> index 9e68ef334f91..817c5eb110d5 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -227,7 +227,7 @@ void set_degamma(data_t *data,
>  	struct drm_color_lut *lut =3D coeffs_to_lut(data, gamma,
>  						  data->color_depth, 0);
>=20=20
> -	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_DEGAMMA_LUT, lut, size);
> +	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_DEGAMMA_LUT, lut, size);
>=20=20
>  	free(lut);
>  }
> @@ -239,7 +239,7 @@ void set_gamma(data_t *data,
>  	struct drm_color_lut *lut =3D coeffs_to_lut(data, gamma,
>  						  data->color_depth, 0);
>=20=20
> -	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut, size);
> +	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut, size);
>=20=20
>  	free(lut);
>  }
> @@ -261,13 +261,13 @@ void set_ctm(igt_crtc_t *pipe, const double *coeffi=
cients)
>  				((int64_t) 1L << 32));
>  	}
>=20=20
> -	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_CTM, &ctm, sizeof(ctm));
> +	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_CTM, &ctm, sizeof(ctm));
>  }
>=20=20
>  void disable_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
>  {
> -	if (igt_pipe_obj_has_prop(pipe, prop))
> -		igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
> +	if (igt_crtc_has_prop(pipe, prop))
> +		igt_crtc_replace_prop_blob(pipe, prop, NULL, 0);
>  }
>=20=20
>  drmModePropertyBlobPtr
> @@ -275,7 +275,7 @@ get_blob(data_t *data, igt_crtc_t *pipe, enum igt_ato=
mic_crtc_properties prop)
>  {
>  	uint64_t prop_value;
>=20=20
> -	prop_value =3D igt_pipe_obj_get_prop(pipe, prop);
> +	prop_value =3D igt_crtc_get_prop(pipe, prop);
>=20=20
>  	if (prop_value =3D=3D 0)
>  		return NULL;
> @@ -290,15 +290,15 @@ pipe_set_property_blob_id(igt_crtc_t *pipe,
>  {
>  	int ret;
>=20=20
> -	igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
> +	igt_crtc_replace_prop_blob(pipe, prop, NULL, 0);
>=20=20
> -	igt_pipe_obj_set_prop_value(pipe, prop, blob_id);
> +	igt_crtc_set_prop_value(pipe, prop, blob_id);
>=20=20
>  	ret =3D igt_display_try_commit2(pipe->display,
>  				      pipe->display->is_atomic ?
>  				      COMMIT_ATOMIC : COMMIT_LEGACY);
>=20=20
> -	igt_pipe_obj_set_prop_value(pipe, prop, 0);
> +	igt_crtc_set_prop_value(pipe, prop, 0);
>=20=20
>  	return ret;
>  }
> @@ -308,7 +308,7 @@ pipe_set_property_blob(igt_crtc_t *pipe,
>  		       enum igt_atomic_crtc_properties prop,
>  		       void *ptr, size_t length)
>  {
> -	igt_pipe_obj_replace_prop_blob(pipe, prop, ptr, length);
> +	igt_crtc_replace_prop_blob(pipe, prop, ptr, length);
>=20=20
>  	return igt_display_try_commit2(pipe->display,
>  				       pipe->display->is_atomic ?
> @@ -324,7 +324,7 @@ invalid_lut_sizes(data_t *data, enum pipe p,
>  	struct drm_color_lut *lut;
>  	size_t lut_size =3D size * sizeof(lut[0]);
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(pipe, prop));
> +	igt_require(igt_crtc_has_prop(pipe, prop));
>=20=20
>  	lut =3D malloc(lut_size * 2);
>=20=20
> @@ -366,7 +366,7 @@ void invalid_ctm_matrix_sizes(data_t *data, enum pipe=
 p)
>  	igt_crtc_t *pipe =3D igt_crtc_for_pipe(display, p);
>  	void *ptr;
>=20=20
> -	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_CTM));
> +	igt_require(igt_crtc_has_prop(pipe, IGT_CRTC_CTM));
>=20=20
>  	ptr =3D malloc(sizeof(struct drm_color_ctm) * 4);
>=20=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index f7896592b3ff..f1b98424db79 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -484,11 +484,11 @@ static void test_content_protection_on_output(igt_o=
utput_t *output,
>  		test_cp_lic(output);
>=20=20
>  	if (data.cp_tests & CP_DPMS) {
> -		igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(display, pipe),
> +		igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
>  					    IGT_CRTC_ACTIVE, 0);
>  		igt_display_commit2(display, commit_style);
>=20=20
> -		igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(display, pipe),
> +		igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
>  					    IGT_CRTC_ACTIVE, 1);
>  		igt_display_commit2(display, commit_style);
>=20=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index f05b3b87ad57..eaceea0035ea 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -309,7 +309,7 @@ static bool vrr_capable(igt_output_t *output)
>  static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
>  			    bool need_modeset, bool enabled)
>  {
> -	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
> +	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
>  				    IGT_CRTC_VRR_ENABLED,
>  				    enabled);
>=20=20
> @@ -406,7 +406,7 @@ static void prepare_test(data_t *data, igt_output_t *=
output, enum pipe pipe)
>  	/* Clear vrr_enabled state before enabling it, because
>  	 * it might be left enabled if the previous test fails.
>  	 */
> -	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
> +	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
>  				    IGT_CRTC_VRR_ENABLED, 0);
>=20=20
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> @@ -970,7 +970,7 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t =
*output, uint32_t flags)
>=20=20
>  static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *out=
put)
>  {
> -	igt_pipe_obj_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
> +	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
>  				    IGT_CRTC_VRR_ENABLED, false);
>=20=20
>  	if (data->primary)

--=20
Jani Nikula, Intel
