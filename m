Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DA8D3EE75
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 15:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8233510E9D4;
	Thu, 22 Jan 2026 15:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnbSaju0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1312110E9D4
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769094306; x=1800630306;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=SDWY/FesTBIBNAhvE+QxBM93+9+HBrOplZSNNHVV204=;
 b=BnbSaju0RvmYZ/RzSUtNAjVIuO8zUVL3uJiCtFf4O9rcyGzzIP4dqDF6
 sg1HwM6IGJOL6Q6q7CysZXCS/Jf6CA55rxJQHmn5dH7SFrVdcuQ4KwSCR
 fZWJdWloYquEgGTggYSMnzwtU0AdRlhC/wCQWS2vO80z+lTJIfjl5cROP
 1lRyG9yckZpW2IAyD8mQFSFbUzzDmopGAQqUYROjWDesZs6Hjhsh0C4kj
 8Rpc82j4HYuyhCkywQYF5+OnFX3F3mMJFosNbf7oWDsHcpNsdQR24zRD7
 4+Pr1nq9+6vUMFnjTjWklmehwK5dgGcIWC1Kdr6kJbLVtrWgn6a2TfFpB Q==;
X-CSE-ConnectionGUID: 5U1zV5wkTXO9eEJBD9UKNw==
X-CSE-MsgGUID: MKi7OIH8S2W5FPx5xvb7lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70385288"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70385288"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:05:06 -0800
X-CSE-ConnectionGUID: iO6xMsmtSWmp1gRCSvNW7A==
X-CSE-MsgGUID: HSnkXuRiQKyyLBW3vEv8ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206806270"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:05:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/10] lib/kms: Use igt_crtc_name() where appropriate
In-Reply-To: <20260122125937.10807-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
 <20260122125937.10807-11-ville.syrjala@linux.intel.com>
Date: Thu, 22 Jan 2026 17:05:01 +0200
Message-ID: <f22bb61e43c18ca7db532ee55abb1f88fb1a7607@intel.com>
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

On Thu, 22 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Use igt_crtc_name() instead of kmstest_pipe_name()
> when we already have a suitable igt_crtc_t around.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> @@
> - static
> const char *igt_crtc_name(...)
> { ... }
>
> @@
> typedef igt_crtc_t;
> @@
> + const char *igt_crtc_name(igt_crtc_t *crtc);
> +
> static inline igt_crtc_t *igt_crtc_for_pipe(...)
> { ... }
>
> @@
> igt_crtc_t *CRTC;
> @@
> - kmstest_pipe_name(CRTC->pipe)
> + igt_crtc_name(CRTC)
>
> @@
> identifier CRTC;
> @@
> igt_crtc_name(igt_crtc_t *CRTC)
> {
> <...
> - igt_crtc_name(CRTC)
> + kmstest_pipe_name(CRTC->pipe)
> ...>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 48 ++++++++++++++++++++++++------------------------
>  lib/igt_kms.h |  2 ++
>  2 files changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 46751d19706b..0fdb83d8205e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3804,14 +3804,14 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plan=
e, igt_crtc_t *crtc,
>=20=20
>  	LOG(display,
>  	    "populating plane data: %s.%d, fb %u\n",
> -	    kmstest_pipe_name(crtc->pipe),
> +	    igt_crtc_name(crtc),
>  	    plane->index,
>  	    igt_plane_get_fb_id(plane));
>=20=20
>  	for (i =3D 0; i < IGT_NUM_PLANE_PROPS; i++) {
>  		if (igt_atomic_ignore_plane_prop(crtc, i)) {
>  			igt_debug("plane %s.%d: Ignoring property \"%s\" to 0x%"PRIx64"/%"PRI=
i64"\n",
> -				   kmstest_pipe_name(crtc->pipe),
> +				   igt_crtc_name(crtc),
>  				   plane->index, igt_plane_prop_names[i],
>  				   plane->values[i], plane->values[i]);
>  			continue;
> @@ -3824,7 +3824,7 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane,=
 igt_crtc_t *crtc,
>  		igt_assert(plane->props[i]);
>=20=20
>  		igt_debug("plane %s.%d: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi6=
4"\n",
> -			kmstest_pipe_name(crtc->pipe), plane->index,
> +			igt_crtc_name(crtc), plane->index,
>  			igt_plane_prop_names[i],
>  			plane->values[i], plane->values[i]);
>=20=20
> @@ -3847,7 +3847,7 @@ igt_atomic_prepare_colorop_commit(igt_colorop_t *co=
lorop, igt_crtc_t *crtc,
>  	while (colorop) {
>  		LOG(display,
>  		    "populating colorop data: %s.%d\n",
> -		    kmstest_pipe_name(crtc->pipe),
> +		    igt_crtc_name(crtc),
>  		    colorop->id);
>=20=20
>  		for (i =3D 0; i < IGT_NUM_COLOROP_PROPS; i++) {
> @@ -3858,7 +3858,7 @@ igt_atomic_prepare_colorop_commit(igt_colorop_t *co=
lorop, igt_crtc_t *crtc,
>  			igt_assert(colorop->props[i]);
>=20=20
>  			igt_debug("colorop %s.%d: Setting property \"%s\" to 0x%"PRIx64"/%"PR=
Ii64"\n",
> -				kmstest_pipe_name(crtc->pipe), colorop->id,
> +				igt_crtc_name(crtc), colorop->id,
>  				igt_colorop_prop_names[i],
>  				colorop->values[i], colorop->values[i]);
>=20=20
> @@ -3925,7 +3925,7 @@ static int igt_drm_plane_commit(igt_plane_t *plane,
>  	if (setplane && fb_id =3D=3D 0) {
>  		LOG(display,
>  		    "SetPlane pipe %s, plane %d, disabling\n",
> -		    kmstest_pipe_name(crtc->pipe),
> +		    igt_crtc_name(crtc),
>  		    plane->index);
>=20=20
>  		ret =3D drmModeSetPlane(display->drm_fd,
> @@ -3954,7 +3954,7 @@ static int igt_drm_plane_commit(igt_plane_t *plane,
>  		LOG(display,
>  		    "SetPlane %s.%d, fb %u, src =3D (%d, %d) "
>  			"%ux%u dst =3D (%u, %u) %ux%u\n",
> -		    kmstest_pipe_name(crtc->pipe),
> +		    igt_crtc_name(crtc),
>  		    plane->index,
>  		    fb_id,
>  		    src_x >> 16, src_y >> 16, src_w >> 16, src_h >> 16,
> @@ -3980,7 +3980,7 @@ static int igt_drm_plane_commit(igt_plane_t *plane,
>  			continue;
>=20=20
>  		LOG(display, "SetProp plane %s.%d \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
> -			kmstest_pipe_name(crtc->pipe), plane->index,
> +			igt_crtc_name(crtc), plane->index,
>  			igt_plane_prop_names[i],
>  			plane->values[i], plane->values[i]);
>=20=20
> @@ -4016,14 +4016,14 @@ static int igt_cursor_commit_legacy(igt_plane_t *=
cursor,
>  		if (cursor->gem_handle)
>  			LOG(display,
>  			    "SetCursor pipe %s, fb %u %dx%d\n",
> -			    kmstest_pipe_name(crtc->pipe),
> +			    igt_crtc_name(crtc),
>  			    cursor->gem_handle,
>  			    (unsigned)cursor->values[IGT_PLANE_CRTC_W],
>  			    (unsigned)cursor->values[IGT_PLANE_CRTC_H]);
>  		else
>  			LOG(display,
>  			    "SetCursor pipe %s, disabling\n",
> -			    kmstest_pipe_name(crtc->pipe));
> +			    igt_crtc_name(crtc));
>=20=20
>  		ret =3D drmModeSetCursor(display->drm_fd, crtc_id,
>  				       cursor->gem_handle,
> @@ -4039,7 +4039,7 @@ static int igt_cursor_commit_legacy(igt_plane_t *cu=
rsor,
>=20=20
>  		LOG(display,
>  		    "MoveCursor pipe %s, (%d, %d)\n",
> -		    kmstest_pipe_name(crtc->pipe),
> +		    igt_crtc_name(crtc),
>  		    x, y);
>=20=20
>  		ret =3D drmModeMoveCursor(display->drm_fd, crtc_id, x, y);
> @@ -4090,7 +4090,7 @@ static int igt_primary_plane_commit_legacy(igt_plan=
e_t *primary,
>  		    "%s: SetCrtc pipe %s, fb %u, src (%d, %d), "
>  		    "mode %dx%d\n",
>  		    igt_output_name(output),
> -		    kmstest_pipe_name(crtc->pipe),
> +		    igt_crtc_name(crtc),
>  		    fb_id,
>  		    src_x, src_y,
>  		    mode->hdisplay, mode->vdisplay);
> @@ -4105,7 +4105,7 @@ static int igt_primary_plane_commit_legacy(igt_plan=
e_t *primary,
>  	} else {
>  		LOG(display,
>  		    "SetCrtc pipe %s, disabling\n",
> -		    kmstest_pipe_name(crtc->pipe));
> +		    igt_crtc_name(crtc));
>=20=20
>  		ret =3D drmModeSetCrtc(display->drm_fd,
>  				     crtc_id,
> @@ -4130,7 +4130,7 @@ static int igt_plane_fixup_rotation(igt_plane_t *pl=
ane,
>  		return 0;
>=20=20
>  	LOG(crtc->display, "Fixing up initial rotation pipe %s, plane %d\n",
> -	    kmstest_pipe_name(crtc->pipe), plane->index);
> +	    igt_crtc_name(crtc), plane->index);
>=20=20
>  	/* First try the easy case, can we change rotation without problems? */
>  	ret =3D igt_plane_set_property(plane, plane->props[IGT_PLANE_ROTATION],
> @@ -4785,7 +4785,7 @@ static void igt_atomic_prepare_crtc_commit(igt_crtc=
_t *crtc,
>  			continue;
>=20=20
>  		igt_debug("Pipe %s: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n=
",
> -			kmstest_pipe_name(crtc->pipe), igt_crtc_prop_names[i],
> +			igt_crtc_name(crtc), igt_crtc_prop_names[i],
>  			crtc->values[i], crtc->values[i]);
>=20=20
>  		igt_assert_lt(0,
> @@ -5336,7 +5336,7 @@ igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_=
t *crtc, const char *source)
>  					 source);
>  }
>=20=20
> -static const char *igt_crtc_name(igt_crtc_t *crtc)
> +const char *igt_crtc_name(igt_crtc_t *crtc)
>  {
>  	if (crtc =3D=3D NULL)
>  		return "None";
> @@ -5626,7 +5626,7 @@ void igt_plane_set_fb(igt_plane_t *plane, struct ig=
t_fb *fb)
>  	igt_display_t *display =3D crtc->display;
>=20=20
>  	LOG(display, "%s.%d: plane_set_fb(%d)\n",
> -	    kmstest_pipe_name(crtc->pipe),
> +	    igt_crtc_name(crtc),
>  	    plane->index, fb ? fb->fb_id : 0);
>=20=20
>  	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID,
> @@ -5724,7 +5724,7 @@ void igt_plane_set_position(igt_plane_t *plane, int=
 x, int y)
>  	igt_display_t *display =3D crtc->display;
>=20=20
>  	LOG(display, "%s.%d: plane_set_position(%d,%d)\n",
> -	    kmstest_pipe_name(crtc->pipe), plane->index, x, y);
> +	    igt_crtc_name(crtc), plane->index, x, y);
>=20=20
>  	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_X, x);
>  	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_Y, y);
> @@ -5746,7 +5746,7 @@ void igt_plane_set_size(igt_plane_t *plane, int w, =
int h)
>  	igt_display_t *display =3D crtc->display;
>=20=20
>  	LOG(display, "%s.%d: plane_set_size (%dx%d)\n",
> -	    kmstest_pipe_name(crtc->pipe), plane->index, w, h);
> +	    igt_crtc_name(crtc), plane->index, w, h);
>=20=20
>  	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_W, w);
>  	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_H, h);
> @@ -5769,7 +5769,7 @@ void igt_fb_set_position(struct igt_fb *fb, igt_pla=
ne_t *plane,
>  	igt_display_t *display =3D crtc->display;
>=20=20
>  	LOG(display, "%s.%d: fb_set_position(%d,%d)\n",
> -	    kmstest_pipe_name(crtc->pipe), plane->index, x, y);
> +	    igt_crtc_name(crtc), plane->index, x, y);
>=20=20
>  	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_X, IGT_FIXED(x, 0));
>  	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_Y, IGT_FIXED(y, 0));
> @@ -5793,7 +5793,7 @@ void igt_fb_set_size(struct igt_fb *fb, igt_plane_t=
 *plane,
>  	igt_display_t *display =3D crtc->display;
>=20=20
>  	LOG(display, "%s.%d: fb_set_size(%dx%d)\n",
> -	    kmstest_pipe_name(crtc->pipe), plane->index, w, h);
> +	    igt_crtc_name(crtc), plane->index, w, h);
>=20=20
>  	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_W, IGT_FIXED(w, 0));
>  	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_H, IGT_FIXED(h, 0));
> @@ -5836,7 +5836,7 @@ void igt_plane_set_rotation(igt_plane_t *plane, igt=
_rotation_t rotation)
>  	igt_display_t *display =3D crtc->display;
>=20=20
>  	LOG(display, "%s.%d: plane_set_rotation(%s=C2=B0)\n",
> -	    kmstest_pipe_name(crtc->pipe),
> +	    igt_crtc_name(crtc),
>  	    plane->index, igt_plane_rotation_name(rotation));
>=20=20
>  	igt_plane_set_prop_value(plane, IGT_PLANE_ROTATION, rotation);
> @@ -7257,7 +7257,7 @@ bool igt_check_bigjoiner_support(igt_display_t *dis=
play)
>=20=20
>  			if (!igt_crtc_for_pipe(display, pipes[i].idx + 1)->valid) {
>  				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigj=
oiner Secondary.\n",
> -					 kmstest_pipe_name(igt_crtc_for_pipe(display, pipes[i].idx + 1)->pi=
pe));
> +					 igt_crtc_name(igt_crtc_for_pipe(display, pipes[i].idx + 1)));
>  				return false;
>  			}
>=20=20
> @@ -7279,7 +7279,7 @@ bool igt_check_bigjoiner_support(igt_display_t *dis=
play)
>=20=20
>  			if (!igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)->valid) {
>  				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigj=
oiner Secondary.\n",
> -					 kmstest_pipe_name(igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)=
->pipe));
> +					 igt_crtc_name(igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)));
>  				return false;
>  			}
>=20=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 65ebb5a917ce..b8f163fabc35 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -576,6 +576,8 @@ void igt_display_require_output(igt_display_t *displa=
y);
>  void igt_display_require_output_on_pipe(igt_display_t *display, enum pip=
e pipe);
>  int igt_display_n_crtcs(igt_display_t *display);
>=20=20
> +const char *igt_crtc_name(igt_crtc_t *crtc);
> +
>  static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum=
 pipe pipe)
>  {
>  	if (pipe =3D=3D PIPE_NONE)

--=20
Jani Nikula, Intel
