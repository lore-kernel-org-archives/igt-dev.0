Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E06FD3EE6C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 14:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A992C10E078;
	Thu, 22 Jan 2026 14:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Krie74Fs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8010610E078
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769093143; x=1800629143;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=zt78UiNqAgr4LPdhheMDtQCrbuvzSHIzJHbP+YTM8eo=;
 b=Krie74FsbVyUEH3nU7yfshU8VlgV/YUqjE7x0sLkZedqLqouJYc19Vz7
 mpjiLMWE6w6SmK9LlEq23U52p9CqcbxqzLeqiDkYmowxDF92e3Ninevsy
 cN+B6T6uHnI6Drnrfh+AL7s63eyxkXEJee+pLAiA+lm9cKzyyINa3Y3/i
 jGDKNoYNBubjbjPr5C6AI1ZA9KDRqfybXCoZ/BOq3BIquAYXHAx3zRehf
 FsYyabZqeIRzQsadoeRLh/tGwmZCsk2pJip7TtLf7S2s4ZganqyP8Ct55
 Sw1jNXJ27vgHs5G2zRl2SRV5Nnp2ew1PWOWRQzSyGqFKPPlD3ZntGVbsD A==;
X-CSE-ConnectionGUID: h0zYkiJPSMWi07Bswk/3Zg==
X-CSE-MsgGUID: TBYlLagPQeeZrM3udTmlVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70427909"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70427909"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:45:42 -0800
X-CSE-ConnectionGUID: JVehyxdMRxGJTzgMGOf4bw==
X-CSE-MsgGUID: tCJUqfznTY2nbatPhB2B9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="207084737"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:45:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 06/10] lib/kms: Rename plane->pipe to plane->crtc
In-Reply-To: <20260122125937.10807-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
 <20260122125937.10807-7-ville.syrjala@linux.intel.com>
Date: Thu, 22 Jan 2026 16:45:37 +0200
Message-ID: <aa5c00019552015f028c25fabdecff703cf98a9b@intel.com>
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
> plane->pipe actually points to a igt_crtc_t,
> so rename it to plane->crtc to match.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> @@
> struct igt_plane {
> 	...
> -	igt_crtc_t *pipe;
> +	igt_crtc_t *crtc;
> 	...
>  };
>
> @@
> typedef igt_plane_t;
> igt_plane_t *S;
> @@
> (
> - S->pipe
> + S->crtc
> |
> - S->ref->pipe
> + S->ref->crtc
> )
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c                          |  41 +++----
>  lib/igt_kms.h                          |   2 +-
>  tests/chamelium/kms_chamelium_color.c  |  54 +++++-----
>  tests/chamelium/kms_chamelium_helper.c |  12 +--
>  tests/kms_atomic.c                     |  14 ++-
>  tests/kms_atomic_interruptible.c       |  18 ++--
>  tests/kms_atomic_transition.c          |   2 +-
>  tests/kms_color.c                      | 141 +++++++++++++------------
>  tests/kms_color_pipeline.c             |  12 +--
>  tests/kms_concurrent.c                 |   2 +-
>  tests/kms_plane_multiple.c             |   2 +-
>  tests/kms_sequence.c                   |   2 +-
>  12 files changed, 154 insertions(+), 148 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 30b237263e91..f15aaae9ce35 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2649,7 +2649,7 @@ void igt_output_refresh(igt_output_t *output)
>  static int
>  igt_plane_set_property(igt_plane_t *plane, uint32_t prop_id, uint64_t va=
lue)
>  {
> -	igt_crtc_t *pipe =3D plane->pipe;
> +	igt_crtc_t *pipe =3D plane->crtc;
>  	igt_display_t *display =3D pipe->display;
>=20=20
>  	return drmModeObjectSetProperty(display->drm_fd, plane->drm_plane->plan=
e_id,
> @@ -2676,7 +2676,7 @@ static int get_drm_plane_type(int drm_fd, uint32_t =
plane_id)
>=20=20
>  static void igt_plane_reset(igt_plane_t *plane)
>  {
> -	igt_display_t *display =3D plane->pipe->display;
> +	igt_display_t *display =3D plane->crtc->display;
>=20=20
>  	/* Reset src coordinates. */
>  	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_X, 0);
> @@ -3097,7 +3097,7 @@ static void igt_crtc_plane_init(igt_display_t *disp=
lay,
>=20=20
>  	plane->index =3D index;
>  	plane->type =3D type;
> -	plane->pipe =3D pipe;
> +	plane->crtc =3D pipe;
>  	plane->drm_plane =3D drm_plane;
>  	plane->values[IGT_PLANE_IN_FENCE_FD] =3D ~0ULL;
>  	plane->ref =3D global_plane;
> @@ -4049,7 +4049,7 @@ static int igt_primary_plane_commit_legacy(igt_plan=
e_t *primary,
>  					   igt_crtc_t *pipe,
>  					   bool fail_on_error)
>  {
> -	struct igt_display *display =3D primary->pipe->display;
> +	struct igt_display *display =3D primary->crtc->display;
>  	igt_output_t *output =3D igt_crtc_get_output(pipe);
>  	drmModeModeInfo *mode;
>  	uint32_t fb_id, crtc_id;
> @@ -4064,7 +4064,7 @@ static int igt_primary_plane_commit_legacy(igt_plan=
e_t *primary,
>=20=20
>  	if (!igt_plane_is_prop_changed(primary, IGT_PLANE_FB_ID) &&
>  	    !(primary->changed & IGT_PLANE_COORD_CHANGED_MASK) &&
> -	    !igt_crtc_is_prop_changed(primary->pipe, IGT_CRTC_MODE_ID))
> +	    !igt_crtc_is_prop_changed(primary->crtc, IGT_CRTC_MODE_ID))
>  		return 0;
>=20=20
>  	crtc_id =3D pipe->crtc_id;
> @@ -4228,7 +4228,7 @@ static int igt_crtc_commit(igt_crtc_t *pipe,
>  		igt_plane_t *plane =3D &pipe->planes[i];
>=20=20
>  		/* skip planes that are handled by another pipe */
> -		if (plane->ref->pipe !=3D pipe)
> +		if (plane->ref->crtc !=3D pipe)
>  			continue;
>=20=20
>  		ret =3D igt_plane_commit(plane, pipe, s, fail_on_error);
> @@ -4310,7 +4310,8 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enu=
m igt_atomic_plane_properties
>  {
>  	igt_assert(igt_plane_has_prop(plane, prop));
>=20=20
> -	return igt_mode_object_get_prop(plane->pipe->display, DRM_MODE_OBJECT_P=
LANE,
> +	return igt_mode_object_get_prop(plane->crtc->display,
> +					DRM_MODE_OBJECT_PLANE,
>  					plane->drm_plane->plane_id, plane->props[prop]);
>  }
>=20=20
> @@ -4364,7 +4365,7 @@ bool igt_plane_try_prop_enum(igt_plane_t *plane,
>  			     enum igt_atomic_plane_properties prop,
>  			     const char *val)
>  {
> -	igt_display_t *display =3D plane->pipe->display;
> +	igt_display_t *display =3D plane->crtc->display;
>  	uint64_t uval;
>=20=20
>  	igt_assert(plane->props[prop]);
> @@ -4410,7 +4411,7 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *p=
lane,
>  	uint64_t value;
>  	bool has_prop;
>=20=20
> -	has_prop =3D kmstest_get_property(plane->pipe->display->drm_fd,
> +	has_prop =3D kmstest_get_property(plane->crtc->display->drm_fd,
>  					plane->drm_plane->plane_id,
>  					DRM_MODE_OBJECT_PLANE,
>  				        igt_plane_prop_names[igt_prop], NULL,
> @@ -4475,7 +4476,7 @@ void igt_plane_set_color_pipeline(igt_plane_t *plan=
e, igt_colorop_t *colorop)
>  void
>  igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_pr=
operties prop, const void *ptr, size_t length)
>  {
> -	igt_display_t *display =3D plane->pipe->display;
> +	igt_display_t *display =3D plane->crtc->display;
>  	uint64_t *blob =3D &plane->values[prop];
>  	uint32_t blob_id =3D 0;
>=20=20
> @@ -4507,7 +4508,7 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enu=
m igt_atomic_plane_properties
>  void
>  igt_colorop_replace_prop_blob(igt_colorop_t *colorop, enum igt_atomic_co=
lorop_properties prop, const void *ptr, size_t length)
>  {
> -	igt_display_t *display =3D colorop->plane->pipe->display;
> +	igt_display_t *display =3D colorop->plane->crtc->display;
>  	uint64_t *blob =3D &colorop->values[prop];
>  	uint32_t blob_id =3D 0;
>=20=20
> @@ -4536,7 +4537,7 @@ bool igt_colorop_try_prop_enum(igt_colorop_t *color=
op,
>  			       enum igt_atomic_colorop_properties prop,
>  			       const char *val)
>  {
> -	igt_display_t *display =3D colorop->plane->pipe->display;
> +	igt_display_t *display =3D colorop->plane->crtc->display;
>  	uint64_t uval;
>=20=20
>  	igt_assert(colorop->props[prop]);
> @@ -4835,7 +4836,7 @@ static int igt_atomic_commit(igt_display_t *display=
, uint32_t flags, void *user_
>=20=20
>  		for_each_plane_on_pipe(display, pipe, plane) {
>  			/* skip planes that are handled by another pipe */
> -			if (plane->ref->pipe !=3D pipe_obj)
> +			if (plane->ref->crtc !=3D pipe_obj)
>  				continue;
>=20=20
>  			if (plane->changed)
> @@ -5593,7 +5594,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_ou=
tput_t *output,
>   */
>  void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb)
>  {
> -	igt_crtc_t *pipe =3D plane->pipe;
> +	igt_crtc_t *pipe =3D plane->crtc;
>  	igt_display_t *display =3D pipe->display;
>=20=20
>  	LOG(display, "%s.%d: plane_set_fb(%d)\n", kmstest_pipe_name(pipe->pipe),
> @@ -5675,7 +5676,7 @@ void igt_plane_set_crtc(igt_plane_t *plane, igt_crt=
c_t *pipe)
>  	 * we're moving away from the single pipe per plane model.
>  	 */
>  	plane->ref->ref =3D plane;
> -	plane->ref->pipe =3D pipe;
> +	plane->ref->crtc =3D pipe;
>  }
>=20=20
>  /**
> @@ -5689,7 +5690,7 @@ void igt_plane_set_crtc(igt_plane_t *plane, igt_crt=
c_t *pipe)
>   */
>  void igt_plane_set_position(igt_plane_t *plane, int x, int y)
>  {
> -	igt_crtc_t *pipe =3D plane->pipe;
> +	igt_crtc_t *pipe =3D plane->crtc;
>  	igt_display_t *display =3D pipe->display;
>=20=20
>  	LOG(display, "%s.%d: plane_set_position(%d,%d)\n",
> @@ -5711,7 +5712,7 @@ void igt_plane_set_position(igt_plane_t *plane, int=
 x, int y)
>   */
>  void igt_plane_set_size(igt_plane_t *plane, int w, int h)
>  {
> -	igt_crtc_t *pipe =3D plane->pipe;
> +	igt_crtc_t *pipe =3D plane->crtc;
>  	igt_display_t *display =3D pipe->display;
>=20=20
>  	LOG(display, "%s.%d: plane_set_size (%dx%d)\n",
> @@ -5734,7 +5735,7 @@ void igt_plane_set_size(igt_plane_t *plane, int w, =
int h)
>  void igt_fb_set_position(struct igt_fb *fb, igt_plane_t *plane,
>  	uint32_t x, uint32_t y)
>  {
> -	igt_crtc_t *pipe =3D plane->pipe;
> +	igt_crtc_t *pipe =3D plane->crtc;
>  	igt_display_t *display =3D pipe->display;
>=20=20
>  	LOG(display, "%s.%d: fb_set_position(%d,%d)\n",
> @@ -5758,7 +5759,7 @@ void igt_fb_set_position(struct igt_fb *fb, igt_pla=
ne_t *plane,
>  void igt_fb_set_size(struct igt_fb *fb, igt_plane_t *plane,
>  	uint32_t w, uint32_t h)
>  {
> -	igt_crtc_t *pipe =3D plane->pipe;
> +	igt_crtc_t *pipe =3D plane->crtc;
>  	igt_display_t *display =3D pipe->display;
>=20=20
>  	LOG(display, "%s.%d: fb_set_size(%dx%d)\n",
> @@ -5801,7 +5802,7 @@ const char *igt_plane_rotation_name(igt_rotation_t =
rotation)
>   */
>  void igt_plane_set_rotation(igt_plane_t *plane, igt_rotation_t rotation)
>  {
> -	igt_crtc_t *pipe =3D plane->pipe;
> +	igt_crtc_t *pipe =3D plane->crtc;
>  	igt_display_t *display =3D pipe->display;
>=20=20
>  	LOG(display, "%s.%d: plane_set_rotation(%s=C2=B0)\n",
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 0fbbeca754c8..e1368cbc8d46 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -425,7 +425,7 @@ typedef struct igt_colorop {
>=20=20
>  typedef struct igt_plane {
>  	/*< private >*/
> -	igt_crtc_t *pipe;
> +	igt_crtc_t *crtc;
>  	struct igt_plane *ref;
>  	int index;
>  	/* capabilities */
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_=
chamelium_color.c
> index e00013a78665..7de10cf74098 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -80,11 +80,11 @@ static bool test_pipe_degamma(data_t *data,
>  	};
>  	bool ret;
>=20=20
> -	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->crtc, IGT_CRTC_DEGAMMA_LUT));
>=20=20
>  	degamma_full =3D generate_table_max(data->degamma_lut_size);
>=20=20
> -	igt_output_set_crtc(output, primary->pipe);
> +	igt_output_set_crtc(output, primary->crtc);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
>  	fb_id =3D igt_create_fb(data->drm_fd,
> @@ -112,8 +112,8 @@ static bool test_pipe_degamma(data_t *data,
>  	igt_assert(fbref_id);
>=20=20
>  	igt_plane_set_fb(primary, &fb_modeset);
> -	disable_ctm(primary->pipe);
> -	disable_gamma(primary->pipe);
> +	disable_ctm(primary->crtc);
> +	disable_gamma(primary->crtc);
>  	igt_display_commit(&data->display);
>=20=20
>  	/* Draw solid colors with linear degamma transformation. */
> @@ -124,7 +124,7 @@ static bool test_pipe_degamma(data_t *data,
>  	 */
>  	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
> -	set_degamma(data, primary->pipe, degamma_full);
> +	set_degamma(data, primary->crtc, degamma_full);
>  	igt_display_commit(&data->display);
>  	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
>  	frame_fullcolors =3D
> @@ -138,7 +138,7 @@ static bool test_pipe_degamma(data_t *data,
>  					    frame_fullcolors, &fbref,
>  					    CHAMELIUM_CHECK_ANALOG);
>=20=20
> -	disable_degamma(primary->pipe);
> +	disable_degamma(primary->crtc);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
> @@ -169,11 +169,11 @@ static bool test_pipe_gamma(data_t *data,
>  	};
>  	bool ret;
>=20=20
> -	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->crtc, IGT_CRTC_GAMMA_LUT));
>=20=20
>  	gamma_full =3D generate_table_max(data->gamma_lut_size);
>=20=20
> -	igt_output_set_crtc(output, primary->pipe);
> +	igt_output_set_crtc(output, primary->crtc);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
>  	fb_id =3D igt_create_fb(data->drm_fd,
> @@ -201,9 +201,9 @@ static bool test_pipe_gamma(data_t *data,
>  	igt_assert(fbref_id);
>=20=20
>  	igt_plane_set_fb(primary, &fbref);
> -	disable_ctm(primary->pipe);
> -	disable_degamma(primary->pipe);
> -	set_gamma(data, primary->pipe, gamma_full);
> +	disable_ctm(primary->crtc);
> +	disable_degamma(primary->crtc);
> +	set_gamma(data, primary->crtc, gamma_full);
>  	igt_display_commit(&data->display);
>=20=20
>  	/* Draw solid colors with no gamma transformation. */
> @@ -227,7 +227,7 @@ static bool test_pipe_gamma(data_t *data,
>  					    frame_fullcolors, &fbref,
>  					    CHAMELIUM_CHECK_ANALOG);
>=20=20
> -	disable_gamma(primary->pipe);
> +	disable_gamma(primary->crtc);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
> @@ -255,12 +255,12 @@ static bool test_pipe_ctm(data_t *data,
>  	int fb_id, fb_modeset_id, fbref_id;
>  	bool ret =3D true;
>=20=20
> -	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM));
> +	igt_require(igt_crtc_has_prop(primary->crtc, IGT_CRTC_CTM));
>=20=20
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
>=20=20
> -	igt_output_set_crtc(output, primary->pipe);
> +	igt_output_set_crtc(output, primary->crtc);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
>  	fb_id =3D igt_create_fb(data->drm_fd,
> @@ -290,15 +290,15 @@ static bool test_pipe_ctm(data_t *data,
>  	igt_plane_set_fb(primary, &fb_modeset);
>=20=20
>  	if (memcmp(before, after, sizeof(color_t))) {
> -		set_degamma(data, primary->pipe, degamma_linear);
> -		set_gamma(data, primary->pipe, gamma_linear);
> +		set_degamma(data, primary->crtc, degamma_linear);
> +		set_gamma(data, primary->crtc, gamma_linear);
>  	} else {
>  		/* Disable Degamma and Gamma for ctm max test */
> -		disable_degamma(primary->pipe);
> -		disable_gamma(primary->pipe);
> +		disable_degamma(primary->crtc);
> +		disable_gamma(primary->crtc);
>  	}
>=20=20
> -	disable_ctm(primary->pipe);
> +	disable_ctm(primary->crtc);
>  	igt_display_commit(&data->display);
>=20=20
>  	paint_rectangles(data, mode, after, &fbref);
> @@ -306,7 +306,7 @@ static bool test_pipe_ctm(data_t *data,
>  	/* With CTM transformation. */
>  	paint_rectangles(data, mode, before, &fb);
>  	igt_plane_set_fb(primary, &fb);
> -	set_ctm(primary->pipe, ctm_matrix);
> +	set_ctm(primary->crtc, ctm_matrix);
>  	igt_display_commit(&data->display);
>  	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
>  	frame_hardware =3D
> @@ -322,8 +322,8 @@ static bool test_pipe_ctm(data_t *data,
>  					     CHAMELIUM_CHECK_ANALOG);
>=20=20
>  	igt_plane_set_fb(primary, NULL);
> -	disable_degamma(primary->pipe);
> -	disable_gamma(primary->pipe);
> +	disable_degamma(primary->crtc);
> +	disable_gamma(primary->crtc);
>  	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
>  	free_lut(degamma_linear);
> @@ -358,12 +358,12 @@ static bool test_pipe_limited_range_ctm(data_t *dat=
a,
>  	int fb_id0, fb_id1;
>  	bool ret =3D false;
>=20=20
> -	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM));
> +	igt_require(igt_crtc_has_prop(primary->crtc, IGT_CRTC_CTM));
>=20=20
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
>=20=20
> -	igt_output_set_crtc(output, primary->pipe);
> +	igt_output_set_crtc(output, primary->crtc);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
>  	fb_id0 =3D igt_create_fb(data->drm_fd,
> @@ -382,9 +382,9 @@ static bool test_pipe_limited_range_ctm(data_t *data,
>  			       &fb1);
>  	igt_assert(fb_id1);
>=20=20
> -	set_degamma(data, primary->pipe, degamma_linear);
> -	set_gamma(data, primary->pipe, gamma_linear);
> -	set_ctm(primary->pipe, ctm);
> +	set_degamma(data, primary->crtc, degamma_linear);
> +	set_gamma(data, primary->crtc, gamma_linear);
> +	set_ctm(primary->crtc, ctm);
>=20=20
>  	/* Set the output into full range. */
>  	igt_output_set_prop_value(output,
> diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms=
_chamelium_helper.c
> index 12735c541de1..f3229a85c9ec 100644
> --- a/tests/chamelium/kms_chamelium_helper.c
> +++ b/tests/chamelium/kms_chamelium_helper.c
> @@ -182,14 +182,14 @@ void chamelium_enable_output(chamelium_data_t *data,
>  	igt_output_override_mode(output, mode);
>=20=20
>  	/* Clear any color correction values that might be enabled */
> -	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> -		igt_crtc_replace_prop_blob(primary->pipe,
> +	if (igt_crtc_has_prop(primary->crtc, IGT_CRTC_DEGAMMA_LUT))
> +		igt_crtc_replace_prop_blob(primary->crtc,
>  					       IGT_CRTC_DEGAMMA_LUT, NULL, 0);
> -	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT))
> -		igt_crtc_replace_prop_blob(primary->pipe,
> +	if (igt_crtc_has_prop(primary->crtc, IGT_CRTC_GAMMA_LUT))
> +		igt_crtc_replace_prop_blob(primary->crtc,
>  					       IGT_CRTC_GAMMA_LUT, NULL, 0);
> -	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM))
> -		igt_crtc_replace_prop_blob(primary->pipe, IGT_CRTC_CTM,
> +	if (igt_crtc_has_prop(primary->crtc, IGT_CRTC_CTM))
> +		igt_crtc_replace_prop_blob(primary->crtc, IGT_CRTC_CTM,
>  					       NULL, 0);
>=20=20
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index b0d920a54cba..f9e893e1a5b8 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -170,7 +170,8 @@ static void plane_check_current_state(igt_plane_t *pl=
ane, const uint64_t *values
>  	uint64_t current_values[IGT_NUM_PLANE_PROPS];
>  	int i;
>=20=20
> -	legacy =3D drmModeGetPlane(plane->pipe->display->drm_fd, plane->drm_pla=
ne->plane_id);
> +	legacy =3D drmModeGetPlane(plane->crtc->display->drm_fd,
> +				 plane->drm_plane->plane_id);
>  	igt_assert(legacy);
>=20=20
>  	igt_assert_eq_u32(legacy->crtc_id, values[IGT_PLANE_CRTC_ID]);
> @@ -197,7 +198,7 @@ static void plane_check_current_state(igt_plane_t *pl=
ane, const uint64_t *values
>  static void plane_commit(igt_plane_t *plane, enum igt_commit_style s,
>  			 enum kms_atomic_check_relax relax)
>  {
> -	igt_display_commit2(plane->pipe->display, s);
> +	igt_display_commit2(plane->crtc->display, s);
>  	plane_check_current_state(plane, plane->values, relax);
>  }
>=20=20
> @@ -209,7 +210,8 @@ static void plane_commit_atomic_err(igt_plane_t *plan=
e,
>=20=20
>  	plane_get_current_state(plane, current_values);
>=20=20
> -	igt_assert_eq(-err, igt_display_try_commit2(plane->pipe->display, COMMI=
T_ATOMIC));
> +	igt_assert_eq(-err,
> +		      igt_display_try_commit2(plane->crtc->display, COMMIT_ATOMIC));
>=20=20
>  	plane_check_current_state(plane, current_values, relax);
>  }
> @@ -1345,7 +1347,8 @@ static void atomic_setup(data_t *data, enum pipe pi=
pe, igt_output_t *output)
>=20=20
>  	igt_plane_set_fb(data->primary, &data->fb);
>=20=20
> -	crtc_commit(data->primary->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_R=
ELAX_NONE);
> +	crtc_commit(data->primary->crtc, data->primary, COMMIT_ATOMIC,
> +		    ATOMIC_RELAX_NONE);
>  }
>=20=20
>  static void atomic_clear(data_t *data, enum pipe pipe, igt_output_t *out=
put)
> @@ -1358,7 +1361,8 @@ static void atomic_clear(data_t *data, enum pipe pi=
pe, igt_output_t *output)
>  	}
>=20=20
>  	igt_output_set_crtc(output, NULL);
> -	crtc_commit(data->primary->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_R=
ELAX_NONE);
> +	crtc_commit(data->primary->crtc, data->primary, COMMIT_ATOMIC,
> +		    ATOMIC_RELAX_NONE);
>  	igt_remove_fb(data->drm_fd, &data->fb);
>  }
>=20=20
> diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interrup=
tible.c
> index d51c79efe7f0..05cf3f956e1f 100644
> --- a/tests/kms_atomic_interruptible.c
> +++ b/tests/kms_atomic_interruptible.c
> @@ -180,7 +180,7 @@ static void run_plane_test(igt_display_t *display, en=
um pipe pipe, igt_output_t
>  				struct drm_mode_crtc crtc =3D {
>  					.set_connectors_ptr =3D (uint64_t)(uintptr_t)&output->id,
>  					.count_connectors =3D 1,
> -					.crtc_id =3D primary->pipe->crtc_id,
> +					.crtc_id =3D primary->crtc->crtc_id,
>  					.fb_id =3D fb2.fb_id,
>  					.mode_valid =3D 1,
>  					.mode =3D *(struct drm_mode_modeinfo*)mode,
> @@ -191,15 +191,15 @@ static void run_plane_test(igt_display_t *display, =
enum pipe pipe, igt_output_t
>  			}
>  			case test_atomic_modeset: {
>  				uint32_t objs[3] =3D {
> -					plane->pipe->crtc_id,
> +					plane->crtc->crtc_id,
>  					output->id,
>  					plane->drm_plane->plane_id
>  				};
>  				uint32_t count_props[3] =3D { 2, 1, 6 };
>  				uint32_t props[] =3D {
>  					/* crtc: 2 props */
> -					plane->pipe->props[IGT_CRTC_MODE_ID],
> -					plane->pipe->props[IGT_CRTC_ACTIVE],
> +					plane->crtc->props[IGT_CRTC_MODE_ID],
> +					plane->crtc->props[IGT_CRTC_ACTIVE],
>  					/* connector: 1 prop */
>  					output->props[IGT_CONNECTOR_CRTC_ID],
>  					/* plane: remainder props */
> @@ -215,9 +215,9 @@ static void run_plane_test(igt_display_t *display, en=
um pipe pipe, igt_output_t
>  					0, /* mode_id, filled in below */
>  					true,
>  					/* connector */
> -					plane->pipe->crtc_id,
> +					plane->crtc->crtc_id,
>  					/* plane */
> -					plane->pipe->crtc_id,
> +					plane->crtc->crtc_id,
>  					fb2.fb_id,
>  					IGT_FIXED(fb2.width, 0),
>  					IGT_FIXED(fb2.height, 0),
> @@ -256,7 +256,7 @@ static void run_plane_test(igt_display_t *display, en=
um pipe pipe, igt_output_t
>  			case test_setcursor: {
>  				struct drm_mode_cursor cur =3D {
>  					.flags =3D DRM_MODE_CURSOR_BO,
> -					.crtc_id =3D plane->pipe->crtc_id,
> +					.crtc_id =3D plane->crtc->crtc_id,
>  					.width =3D fb2.width,
>  					.height =3D fb2.height,
>  					.handle =3D fb2.gem_handle,
> @@ -267,7 +267,7 @@ static void run_plane_test(igt_display_t *display, en=
um pipe pipe, igt_output_t
>  			case test_setplane: {
>  				struct drm_mode_set_plane setplane =3D {
>  					.plane_id =3D plane->drm_plane->plane_id,
> -					.crtc_id =3D plane->pipe->crtc_id,
> +					.crtc_id =3D plane->crtc->crtc_id,
>  					.fb_id =3D fb2.fb_id,
>  					.crtc_w =3D fb2.width,
>  					.crtc_h =3D fb2.height,
> @@ -280,7 +280,7 @@ static void run_plane_test(igt_display_t *display, en=
um pipe pipe, igt_output_t
>  			}
>  			case test_pageflip: {
>  				struct drm_mode_crtc_page_flip pageflip =3D {
> -					.crtc_id =3D plane->pipe->crtc_id,
> +					.crtc_id =3D plane->crtc->crtc_id,
>  					.fb_id =3D fb2.fb_id,
>  					.flags =3D DRM_MODE_PAGE_FLIP_EVENT,
>  				};
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 24af925332d3..a89829987edd 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -808,7 +808,7 @@ static unsigned set_combinations(data_t *data, unsign=
ed mask, struct igt_fb *fb)
>  		igt_plane_t *plane =3D igt_crtc_get_plane_type(igt_crtc_for_pipe(&data=
->display, pipe),
>  							     DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -		enum pipe old_pipe =3D plane->ref->pipe->pipe;
> +		enum pipe old_pipe =3D plane->ref->crtc->pipe;
>=20=20
>  		/*
>  		 * If a plane is being shared by multiple pipes, we must disable the p=
ipe that
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index baa629a84b42..62b1c544301e 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -94,13 +94,13 @@ static bool test_pipe_degamma(data_t *data,
>  	int fb_id, fb_modeset_id;
>  	bool ret;
>=20=20
> -	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
> -	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->crtc, IGT_CRTC_DEGAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->crtc, IGT_CRTC_GAMMA_LUT));
>=20=20
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	degamma_full =3D generate_table_max(data->degamma_lut_size);
>=20=20
> -	igt_output_set_crtc(output, primary->pipe);
> +	igt_output_set_crtc(output, primary->crtc);
>  	igt_output_override_mode(output, mode);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
> @@ -121,16 +121,16 @@ static bool test_pipe_degamma(data_t *data,
>  	igt_assert(fb_modeset_id);
>=20=20
>  	igt_plane_set_fb(primary, &fb_modeset);
> -	disable_ctm(primary->pipe);
> -	disable_gamma(primary->pipe);
> -	set_degamma(data, primary->pipe, degamma_linear);
> +	disable_ctm(primary->crtc);
> +	disable_gamma(primary->crtc);
> +	set_degamma(data, primary->crtc, degamma_linear);
>  	igt_display_commit(&data->display);
>=20=20
>  	/* Draw solid colors with linear degamma transformation. */
>  	paint_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(primary->pipe);
> +	igt_wait_for_vblank(primary->crtc);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>=20=20
>  	/*
> @@ -139,9 +139,9 @@ static bool test_pipe_degamma(data_t *data,
>  	 */
>  	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
> -	set_degamma(data, primary->pipe, degamma_full);
> +	set_degamma(data, primary->crtc, degamma_full);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(primary->pipe);
> +	igt_wait_for_vblank(primary->crtc);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>=20=20
>  	/*
> @@ -150,7 +150,7 @@ static bool test_pipe_degamma(data_t *data,
>  	 */
>  	ret =3D igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &cr=
c_fullcolors);
>=20=20
> -	disable_degamma(primary->pipe);
> +	disable_degamma(primary->crtc);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
> @@ -183,11 +183,11 @@ static bool test_pipe_gamma(data_t *data,
>  	int fb_id, fb_modeset_id;
>  	bool ret;
>=20=20
> -	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->crtc, IGT_CRTC_GAMMA_LUT));
>=20=20
>  	gamma_full =3D generate_table_max(data->gamma_lut_size);
>=20=20
> -	igt_output_set_crtc(output, primary->pipe);
> +	igt_output_set_crtc(output, primary->crtc);
>  	igt_output_override_mode(output, mode);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
> @@ -208,16 +208,16 @@ static bool test_pipe_gamma(data_t *data,
>  	igt_assert(fb_modeset_id);
>=20=20
>  	igt_plane_set_fb(primary, &fb_modeset);
> -	disable_ctm(primary->pipe);
> -	disable_degamma(primary->pipe);
> -	set_gamma(data, primary->pipe, gamma_full);
> +	disable_ctm(primary->crtc);
> +	disable_degamma(primary->crtc);
> +	set_gamma(data, primary->crtc, gamma_full);
>  	igt_display_commit(&data->display);
>=20=20
>  	/* Draw solid colors with no gamma transformation. */
>  	paint_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(primary->pipe);
> +	igt_wait_for_vblank(primary->crtc);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>=20=20
>  	/*
> @@ -227,7 +227,7 @@ static bool test_pipe_gamma(data_t *data,
>  	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(primary->pipe);
> +	igt_wait_for_vblank(primary->crtc);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>=20=20
>  	/*
> @@ -236,7 +236,7 @@ static bool test_pipe_gamma(data_t *data,
>  	 */
>  	ret =3D igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &cr=
c_fullcolors);
>=20=20
> -	disable_gamma(primary->pipe);
> +	disable_gamma(primary->crtc);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
> @@ -271,7 +271,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	int fb_id, fb_modeset_id;
>  	bool ret;
>=20=20
> -	drm_crtc =3D drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
> +	drm_crtc =3D drmModeGetCrtc(data->drm_fd, primary->crtc->crtc_id);
>  	legacy_lut_size =3D drm_crtc->gamma_size;
>  	drmModeFreeCrtc(drm_crtc);
>=20=20
> @@ -281,7 +281,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	green_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
>  	blue_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
>=20=20
> -	igt_output_set_crtc(output, primary->pipe);
> +	igt_output_set_crtc(output, primary->crtc);
>  	igt_output_override_mode(output, mode);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
> @@ -302,16 +302,16 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	igt_assert(fb_modeset_id);
>=20=20
>  	igt_plane_set_fb(primary, &fb_modeset);
> -	disable_degamma(primary->pipe);
> -	disable_gamma(primary->pipe);
> -	disable_ctm(primary->pipe);
> +	disable_degamma(primary->crtc);
> +	disable_gamma(primary->crtc);
> +	disable_ctm(primary->crtc);
>  	igt_display_commit(&data->display);
>=20=20
>  	/* Draw solid colors with no gamma transformation. */
>  	paint_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(primary->pipe);
> +	igt_wait_for_vblank(primary->crtc);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>=20=20
>  	/*
> @@ -324,10 +324,10 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	red_lut[0] =3D green_lut[0] =3D blue_lut[0] =3D 0;
>  	for (i =3D 1; i < legacy_lut_size; i++)
>  		red_lut[i] =3D green_lut[i] =3D blue_lut[i] =3D 0xffff;
> -	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
> +	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->crtc->crtc_id,
>  					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(primary->pipe);
> +	igt_wait_for_vblank(primary->crtc);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>=20=20
>  	/*
> @@ -340,7 +340,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	for (i =3D 1; i < legacy_lut_size; i++)
>  		red_lut[i] =3D green_lut[i] =3D blue_lut[i] =3D i << 8;
>=20=20
> -	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
> +	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->crtc->crtc_id,
>  					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
>  	igt_display_commit(&data->display);
>=20=20
> @@ -378,18 +378,18 @@ static bool test_pipe_legacy_gamma_reset(data_t *da=
ta,
>  	igt_output_t *output =3D data->output;
>  	bool ret =3D true;
>=20=20
> -	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +	igt_require(igt_crtc_has_prop(primary->crtc, IGT_CRTC_GAMMA_LUT));
>=20=20
> -	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> +	if (igt_crtc_has_prop(primary->crtc, IGT_CRTC_DEGAMMA_LUT))
>  		degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_zero =3D generate_table_zero(data->gamma_lut_size);
>=20=20
> -	igt_output_set_crtc(output, primary->pipe);
> +	igt_output_set_crtc(output, primary->crtc);
>=20=20
>  	/* Ensure we have a clean state to start with. */
> -	disable_degamma(primary->pipe);
> -	disable_ctm(primary->pipe);
> -	disable_gamma(primary->pipe);
> +	disable_degamma(primary->crtc);
> +	disable_ctm(primary->crtc);
> +	disable_gamma(primary->crtc);
>  	igt_display_commit(&data->display);
>=20=20
>  	/*
> @@ -397,29 +397,29 @@ static bool test_pipe_legacy_gamma_reset(data_t *da=
ta,
>  	 * properties and verify the content of the
>  	 * properties.
>  	 */
> -	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> -		set_degamma(data, primary->pipe, degamma_linear);
> -	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM))
> -		set_ctm(primary->pipe, ctm_identity);
> -	set_gamma(data, primary->pipe, gamma_zero);
> +	if (igt_crtc_has_prop(primary->crtc, IGT_CRTC_DEGAMMA_LUT))
> +		set_degamma(data, primary->crtc, degamma_linear);
> +	if (igt_crtc_has_prop(primary->crtc, IGT_CRTC_CTM))
> +		set_ctm(primary->crtc, ctm_identity);
> +	set_gamma(data, primary->crtc, gamma_zero);
>  	igt_display_commit(&data->display);
>=20=20
> -	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)) {
> -		blob =3D get_blob(data, primary->pipe, IGT_CRTC_DEGAMMA_LUT);
> +	if (igt_crtc_has_prop(primary->crtc, IGT_CRTC_DEGAMMA_LUT)) {
> +		blob =3D get_blob(data, primary->crtc, IGT_CRTC_DEGAMMA_LUT);
>  		igt_assert(blob &&
>  			   blob->length =3D=3D (sizeof(struct drm_color_lut) *
>  					    data->degamma_lut_size));
>  		drmModeFreePropertyBlob(blob);
>  	}
>=20=20
> -	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM)) {
> -		blob =3D get_blob(data, primary->pipe, IGT_CRTC_CTM);
> +	if (igt_crtc_has_prop(primary->crtc, IGT_CRTC_CTM)) {
> +		blob =3D get_blob(data, primary->crtc, IGT_CRTC_CTM);
>  		igt_assert(blob &&
>  			   blob->length =3D=3D sizeof(struct drm_color_ctm));
>  		drmModeFreePropertyBlob(blob);
>  	}
>=20=20
> -	blob =3D get_blob(data, primary->pipe, IGT_CRTC_GAMMA_LUT);
> +	blob =3D get_blob(data, primary->crtc, IGT_CRTC_GAMMA_LUT);
>  	igt_assert(blob &&
>  		   blob->length =3D=3D (sizeof(struct drm_color_lut) *
>  				    data->gamma_lut_size));
> @@ -437,7 +437,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
>  	 * the content of the GAMMA_LUT property is changed
>  	 * and that CTM and DEGAMMA_LUT are empty.
>  	 */
> -	drm_crtc =3D drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
> +	drm_crtc =3D drmModeGetCrtc(data->drm_fd, primary->crtc->crtc_id);
>  	legacy_lut_size =3D drm_crtc->gamma_size;
>  	drmModeFreeCrtc(drm_crtc);
>=20=20
> @@ -454,19 +454,19 @@ static bool test_pipe_legacy_gamma_reset(data_t *da=
ta,
>  		red_lut[i] =3D green_lut[i] =3D blue_lut[i] =3D 0xffff;
>=20=20
>  	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd,
> -					  primary->pipe->crtc_id,
> +					  primary->crtc->crtc_id,
>  					  legacy_lut_size,
>  					  red_lut, green_lut, blue_lut), 0);
>  	igt_display_commit(&data->display);
>=20=20
> -	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> -		igt_assert(get_blob(data, primary->pipe,
> +	if (igt_crtc_has_prop(primary->crtc, IGT_CRTC_DEGAMMA_LUT))
> +		igt_assert(get_blob(data, primary->crtc,
>  				    IGT_CRTC_DEGAMMA_LUT) =3D=3D NULL);
>=20=20
> -	if (igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM))
> -		igt_assert(get_blob(data, primary->pipe, IGT_CRTC_CTM) =3D=3D NULL);
> +	if (igt_crtc_has_prop(primary->crtc, IGT_CRTC_CTM))
> +		igt_assert(get_blob(data, primary->crtc, IGT_CRTC_CTM) =3D=3D NULL);
>=20=20
> -	blob =3D get_blob(data, primary->pipe, IGT_CRTC_GAMMA_LUT);
> +	blob =3D get_blob(data, primary->crtc, IGT_CRTC_GAMMA_LUT);
>  	igt_assert(blob &&
>  		   blob->length =3D=3D (sizeof(struct drm_color_lut) *
>  				    legacy_lut_size));
> @@ -514,9 +514,9 @@ static bool test_pipe_ctm(data_t *data,
>  	igt_crc_t crc_software, crc_hardware;
>  	int fb_id, fb_modeset_id;
>=20=20
> -	igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_CTM));
> +	igt_require(igt_crtc_has_prop(primary->crtc, IGT_CRTC_CTM));
>=20=20
> -	igt_output_set_crtc(output, primary->pipe);
> +	igt_output_set_crtc(output, primary->crtc);
>  	igt_output_override_mode(output, mode);
>=20=20
>  	/* Create a framebuffer at the size of the output. */
> @@ -537,8 +537,8 @@ static bool test_pipe_ctm(data_t *data,
>  	igt_assert(fb_modeset_id);
>  	igt_plane_set_fb(primary, &fb_modeset);
>=20=20
> -	disable_degamma(primary->pipe);
> -	disable_gamma(primary->pipe);
> +	disable_degamma(primary->crtc);
> +	disable_gamma(primary->crtc);
>=20=20
>  	/*
>  	 * Only program LUT's for intel, but not for max CTM as limitation of
> @@ -546,11 +546,11 @@ static bool test_pipe_ctm(data_t *data,
>  	 * rounding issues and inaccuracies leading to crc mismatch.
>  	 */
>  	if (is_intel_device(data->drm_fd) && memcmp(before, after, sizeof(color=
_t))) {
> -		igt_require(igt_crtc_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +		igt_require(igt_crtc_has_prop(primary->crtc, IGT_CRTC_GAMMA_LUT));
>=20=20
>  		gamma_linear =3D generate_table(256, 1.0);
>=20=20
> -		set_gamma(data, primary->pipe, gamma_linear);
> +		set_gamma(data, primary->crtc, gamma_linear);
>  	}
>=20=20
>  	igt_debug("color before[0] %f,%f,%f\n", before[0].r, before[0].g, befor=
e[0].b);
> @@ -561,22 +561,22 @@ static bool test_pipe_ctm(data_t *data,
>  	igt_debug("color after[1] %f,%f,%f\n", after[1].r, after[1].g, after[1]=
.b);
>  	igt_debug("color after[2] %f,%f,%f\n", after[2].r, after[2].g, after[2]=
.b);
>=20=20
> -	disable_ctm(primary->pipe);
> +	disable_ctm(primary->crtc);
>  	igt_display_commit(&data->display);
>=20=20
>  	paint_rectangles(data, mode, after, &fb);
>  	igt_plane_set_fb(primary, &fb);
> -	set_ctm(primary->pipe, ctm_identity);
> +	set_ctm(primary->crtc, ctm_identity);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(primary->pipe);
> +	igt_wait_for_vblank(primary->crtc);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
>=20=20
>  	/* With CTM transformation. */
>  	paint_rectangles(data, mode, before, &fb);
>  	igt_plane_set_fb(primary, &fb);
> -	set_ctm(primary->pipe, ctm_matrix);
> +	set_ctm(primary->crtc, ctm_matrix);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(primary->pipe);
> +	igt_wait_for_vblank(primary->crtc);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
>=20=20
>  	/*
> @@ -585,7 +585,7 @@ static bool test_pipe_ctm(data_t *data,
>  	 */
>  	ret &=3D igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &cr=
c_hardware);
>=20=20
> -	disable_ctm(primary->pipe);
> +	disable_ctm(primary->crtc);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_crtc(output, NULL);
>  	igt_display_commit(&data->display);
> @@ -637,7 +637,8 @@ static void test_pipe_limited_range_ctm(data_t *data,
>  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
>  	gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
>=20=20
> -	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, outp=
ut) {
> +	for_each_valid_output_on_pipe(&data->display, primary->crtc->pipe,
> +				      output) {
>  		drmModeModeInfo *mode;
>  		struct igt_fb fb_modeset, fb;
>  		igt_crc_t crc_full, crc_limited;
> @@ -648,7 +649,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>=20=20
>  		has_broadcast_rgb_output =3D true;
>=20=20
> -		igt_output_set_crtc(output, primary->pipe);
> +		igt_output_set_crtc(output, primary->crtc);
>  		mode =3D igt_output_get_mode(output);
>=20=20
>  		/* Create a framebuffer at the size of the output. */
> @@ -669,15 +670,15 @@ static void test_pipe_limited_range_ctm(data_t *dat=
a,
>  		igt_assert(fb_modeset_id);
>  		igt_plane_set_fb(primary, &fb_modeset);
>=20=20
> -		set_degamma(data, primary->pipe, degamma_linear);
> -		set_gamma(data, primary->pipe, gamma_linear);
> -		set_ctm(primary->pipe, ctm);
> +		set_degamma(data, primary->crtc, degamma_linear);
> +		set_gamma(data, primary->crtc, gamma_linear);
> +		set_ctm(primary->crtc, ctm);
>=20=20
>  		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCA=
ST_RGB_FULL);
>  		paint_rectangles(data, mode, red_green_blue_limited, &fb);
>  		igt_plane_set_fb(primary, &fb);
>  		igt_display_commit(&data->display);
> -		igt_wait_for_vblank(primary->pipe);
> +		igt_wait_for_vblank(primary->crtc);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
>=20=20
>  		/* Set the output into limited range. */
> @@ -685,7 +686,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>  		paint_rectangles(data, mode, red_green_blue_full, &fb);
>  		igt_plane_set_fb(primary, &fb);
>  		igt_display_commit(&data->display);
> -		igt_wait_for_vblank(primary->pipe);
> +		igt_wait_for_vblank(primary->crtc);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
>=20=20
>  		/* And reset.. */
> @@ -740,7 +741,7 @@ static void test_setup(data_t *data, enum pipe p)
>  	igt_require(pipe->n_planes >=3D 0);
>=20=20
>  	data->primary =3D igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> -	data->pipe_crc =3D igt_crtc_crc_new(data->primary->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->primary->crtc,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_display_reset(&data->display);
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index e360f77af45e..9ee7288251fa 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -62,7 +62,7 @@ static void test_setup(data_t *data, enum pipe p)
>  	data->mode =3D igt_output_get_mode(data->output);
>  	igt_require(data->mode);
>=20=20
> -	data->pipe_crc =3D igt_crtc_crc_new(data->primary->pipe,
> +	data->pipe_crc =3D igt_crtc_crc_new(data->primary->crtc,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> @@ -109,9 +109,9 @@ static bool test_plane_colorops(data_t *data,
>  	igt_plane_set_fb(plane, &fb);
>=20=20
>  	/* Disable Pipe color props. */
> -	disable_ctm(plane->pipe);
> -	disable_degamma(plane->pipe);
> -	disable_gamma(plane->pipe);
> +	disable_ctm(plane->crtc);
> +	disable_degamma(plane->crtc);
> +	disable_gamma(plane->crtc);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>=20=20
>  	/* Reference (software-equivalent) CRC */
> @@ -120,7 +120,7 @@ static bool test_plane_colorops(data_t *data,
>=20=20
>  	igt_plane_set_fb(plane, &fb);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> -	igt_wait_for_vblank(plane->pipe);
> +	igt_wait_for_vblank(plane->crtc);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
>=20=20
>  	/* Hardware pipeline CRC */
> @@ -136,7 +136,7 @@ static bool test_plane_colorops(data_t *data,
>=20=20
>  	igt_plane_set_fb(plane, &fb);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> -	igt_wait_for_vblank(plane->pipe);
> +	igt_wait_for_vblank(plane->crtc);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
>=20=20
>  	ret =3D igt_check_crc_equal(&crc_ref, &crc_pipe);
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 4431432e5cbc..545bb93f9a9d 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -169,7 +169,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_=
planes,
>  	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
>=20=20
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	p =3D primary->pipe;
> +	p =3D primary->crtc;
>=20=20
>  	x =3D malloc(p->n_planes * sizeof(*x));
>  	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n", (long =
int) (p->n_planes * sizeof(*x)));
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index f0b9e2aba668..071f457af8da 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -215,7 +215,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color=
_t *color, igt_plane_t **pl
>  	igt_output_set_crtc(output,
>  			    igt_crtc_for_pipe(output->display, pipe_id));
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	pipe =3D primary->pipe;
> +	pipe =3D primary->crtc;
>=20=20
>  	x =3D malloc(pipe->n_planes * sizeof(*x));
>  	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n", (long =
int) (pipe->n_planes * sizeof(*x)));
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index cfeec133de58..9eea70cf7a88 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -119,7 +119,7 @@ static void prepare_crtc(data_t *data, int fd, igt_ou=
tput_t *output)
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, &data->primary_fb);
>=20=20
> -	data->crtc_id =3D primary->pipe->crtc_id;
> +	data->crtc_id =3D primary->crtc->crtc_id;
>=20=20
>  	igt_display_commit(display);

--=20
Jani Nikula, Intel
