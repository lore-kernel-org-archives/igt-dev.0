Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A084EA4FB2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 11:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ED710E2E5;
	Mon, 23 Feb 2026 11:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fX3K6oPy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAF310E2E5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 11:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771847560; x=1803383560;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=MhukDkADLpYWHZ2nx2hrY+Vs70enCY/0035W+yy9wI4=;
 b=fX3K6oPys4KqtdVIv1AeB1yx/lT5UYSIIK73yOo+7LCfak2haTYgw4dY
 QNd639zqU4KkP8TuL3RjwGJqjmkqEYfBLa78MgUwberPgW9ngQ+akRuxz
 vZYcd4JxrsscXXtMwB1fn/Lx70ipwTJVYwOb6m7uYM996hqKAxclh0hkG
 wPUw/w19BRtbDHswfxwXA3wAuTKeL2+sXTdBkg3R/Idqj8DkW13Jiug1D
 TnxnS83UeUWRWZ2vwSjmrSlbLTvSTg8yojaYE9v7t8RZC/1rpSf6HcaOb
 3vNBgtZV70xMycjqPmmx5QfVCeuZoM/oOO4NRZjqj6VsehlfS4y4hmDgE A==;
X-CSE-ConnectionGUID: zaiovcdhT6uBKggn+Mg5Lg==
X-CSE-MsgGUID: XhZJnj5nRgqLhlamikA1BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76702940"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76702940"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:52:40 -0800
X-CSE-ConnectionGUID: /LQq59mFSl6BEC6nM9vTxA==
X-CSE-MsgGUID: rlBjs2pHSlaa2L1R4CRlyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="253261799"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:52:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 10/23] tests/intel/kms_frontbuffer_tracking:
 Use igt_crtc_t instead of enum pipe
In-Reply-To: <20260221032003.30936-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-11-ville.syrjala@linux.intel.com>
Date: Mon, 23 Feb 2026 13:52:35 +0200
Message-ID: <f0467cf49ae34ae5e0ec2505c5f3fca3797e85c6@intel.com>
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

On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert kms_frontbuffer_tracking from 'enum pipe' to 'igt_crtc_t'.
> This is written in its own peculiar style, and getting cocci to
> grog it seems very hard, so the conversion was done manually.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/intel/kms_frontbuffer_tracking.c | 99 ++++++++++++--------------
>  1 file changed, 46 insertions(+), 53 deletions(-)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_fro=
ntbuffer_tracking.c
> index 58bc92a39422..ce0a646d4e80 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1020,7 +1020,7 @@ struct {
>  };
>=20=20
>  struct modeset_params {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  	drmModeModeInfo mode;
>=20=20
> @@ -1104,7 +1104,7 @@ static drmModeModeInfo *connector_get_mode(igt_outp=
ut_t *output)
>  }
>=20=20
>  static void init_mode_params(struct modeset_params *params,
> -			     igt_output_t *output, enum pipe pipe)
> +			     igt_output_t *output, igt_crtc_t *crtc)
>  {
>  	int i;
>  	drmModeModeInfo *mode;
> @@ -1112,11 +1112,11 @@ static void init_mode_params(struct modeset_param=
s *params,
>  	igt_output_override_mode(output, NULL);
>  	mode =3D connector_get_mode(output);
>=20=20
> -	params->pipe =3D pipe;
> +	params->crtc =3D crtc;
>  	params->output =3D output;
>  	params->mode =3D *mode;
>=20=20
> -	params->primary.plane =3D igt_crtc_get_plane_type(igt_crtc_for_pipe(&dr=
m.display, pipe),
> +	params->primary.plane =3D igt_crtc_get_plane_type(crtc,
>  							DRM_PLANE_TYPE_PRIMARY);
>  	params->primary.fb =3D NULL;
>  	params->primary.x =3D 0;
> @@ -1124,7 +1124,7 @@ static void init_mode_params(struct modeset_params =
*params,
>  	params->primary.w =3D mode->hdisplay;
>  	params->primary.h =3D mode->vdisplay;
>=20=20
> -	params->cursor.plane =3D igt_crtc_get_plane_type(igt_crtc_for_pipe(&drm=
.display, pipe),
> +	params->cursor.plane =3D igt_crtc_get_plane_type(crtc,
>  						       DRM_PLANE_TYPE_CURSOR);
>  	params->cursor.fb =3D NULL;
>  	params->cursor.x =3D 0;
> @@ -1132,7 +1132,7 @@ static void init_mode_params(struct modeset_params =
*params,
>  	params->cursor.w =3D 64;
>  	params->cursor.h =3D 64;
>=20=20
> -	params->sprite.plane =3D igt_crtc_get_plane_type(igt_crtc_for_pipe(&drm=
.display, pipe),
> +	params->sprite.plane =3D igt_crtc_get_plane_type(crtc,
>  						       DRM_PLANE_TYPE_OVERLAY);
>  	igt_require(params->sprite.plane);
>  	params->sprite.fb =3D NULL;
> @@ -1158,9 +1158,9 @@ static void init_mode_params(struct modeset_params =
*params,
>=20=20
>  static bool find_connector(bool edp_only, bool pipe_a,
>  			   igt_output_t *forbidden_output,
> -			   enum pipe forbidden_pipe,
> +			   igt_crtc_t *forbidden_crtc,
>  			   igt_output_t **ret_output,
> -			   enum pipe *ret_pipe)
> +			   igt_crtc_t **ret_crtc)
>  {
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
> @@ -1174,7 +1174,7 @@ static bool find_connector(bool edp_only, bool pipe=
_a,
>  		if (pipe_a && crtc->pipe !=3D PIPE_A)
>  			continue;
>=20=20
> -		if (output =3D=3D forbidden_output || crtc->pipe =3D=3D forbidden_pipe=
) {
> +		if (output =3D=3D forbidden_output || crtc =3D=3D forbidden_crtc) {
>  			igt_output_set_crtc(output,
>  					    crtc);
>  			igt_output_override_mode(output, connector_get_mode(output));
> @@ -1190,7 +1190,7 @@ static bool find_connector(bool edp_only, bool pipe=
_a,
>  		igt_output_override_mode(output, connector_get_mode(output));
>  		if (intel_pipe_output_combo_valid(&drm.display)) {
>  			*ret_output =3D output;
> -			*ret_pipe =3D crtc->pipe;
> +			*ret_crtc =3D crtc;
>  			return true;
>  		}
>  	}
> @@ -1201,7 +1201,7 @@ static bool find_connector(bool edp_only, bool pipe=
_a,
>  static bool init_modeset_cached_params(void)
>  {
>  	igt_output_t *prim_output =3D NULL, *scnd_output =3D NULL;
> -	enum pipe prim_pipe, scnd_pipe;
> +	igt_crtc_t *prim_crtc, *scnd_crtc;
>=20=20
>  	/*
>  	 * We have this problem where PSR is only present on eDP monitors and
> @@ -1211,29 +1211,29 @@ static bool init_modeset_cached_params(void)
>  	 * TODO: refactor the code in a way that allows us to have different
>  	 * sets of prim/scnd structs for different features.
>  	 */
> -	find_connector(true, true, NULL, PIPE_NONE, &prim_output, &prim_pipe);
> +	find_connector(true, true, NULL, NULL, &prim_output, &prim_crtc);
>  	if (!prim_output)
> -		find_connector(true, false, NULL, PIPE_NONE, &prim_output, &prim_pipe);
> +		find_connector(true, false, NULL, NULL, &prim_output, &prim_crtc);
>  	if (!prim_output)
> -		find_connector(false, true, NULL, PIPE_NONE, &prim_output, &prim_pipe);
> +		find_connector(false, true, NULL, NULL, &prim_output, &prim_crtc);
>  	if (!prim_output)
> -		find_connector(false, false, NULL, PIPE_NONE, &prim_output, &prim_pipe=
);
> +		find_connector(false, false, NULL, NULL, &prim_output, &prim_crtc);
>=20=20
>  	if (!prim_output)
>  		return false;
>=20=20
> -	find_connector(false, false, prim_output, prim_pipe,
> -		       &scnd_output, &scnd_pipe);
> +	find_connector(false, false, prim_output, prim_crtc,
> +		       &scnd_output, &scnd_crtc);
>=20=20
> -	init_mode_params(&prim_mode_params, prim_output, prim_pipe);
> +	init_mode_params(&prim_mode_params, prim_output, prim_crtc);
>=20=20
>  	if (!scnd_output) {
> -		scnd_mode_params.pipe =3D PIPE_NONE;
> +		scnd_mode_params.crtc =3D NULL;
>  		scnd_mode_params.output =3D NULL;
>  		return true;
>  	}
>=20=20
> -	init_mode_params(&scnd_mode_params, scnd_output, scnd_pipe);
> +	init_mode_params(&scnd_mode_params, scnd_output, scnd_crtc);
>  	return true;
>  }
>=20=20
> @@ -1520,8 +1520,7 @@ static void __set_prim_plane_for_params(struct mode=
set_params *params)
>  static void __set_mode_for_params(struct modeset_params *params)
>  {
>  	igt_output_override_mode(params->output, &params->mode);
> -	igt_output_set_crtc(params->output,
> -			    igt_crtc_for_pipe(params->output->display, params->pipe));
> +	igt_output_set_crtc(params->output, params->crtc);
>=20=20
>  	__set_prim_plane_for_params(params);
>  }
> @@ -1537,7 +1536,7 @@ static void __debugfs_read_crtc(const char *param, =
char *buf, int len)
>  	int dir;
>  	enum pipe pipe;
>=20=20
> -	pipe =3D prim_mode_params.pipe;
> +	pipe =3D prim_mode_params.crtc->pipe;
>  	dir =3D igt_debugfs_crtc_dir(drm.fd, pipe, O_DIRECTORY);
>  	igt_require_fd(dir);
>  	igt_debugfs_simple_read(dir, param, buf, len);
> @@ -1686,12 +1685,12 @@ static bool fbc_psr_not_possible(void)
>  	return strstr(buf, "FBC disabled: PSR1 enabled (Wa_14016291713)");
>  }
>=20=20
> -static bool fbc_enable_per_plane(int plane_index, enum pipe pipe)
> +static bool fbc_enable_per_plane(int plane_index, igt_crtc_t *crtc)
>  {
>  	char buf[PATH_MAX];
>  	char buf_plane[128];
>=20=20
> -	sprintf(buf_plane, "%d%s", plane_index, kmstest_pipe_name(pipe));
> +	sprintf(buf_plane, "%d%s", plane_index, igt_crtc_name(crtc));
>=20=20
>  	debugfs_read_crtc("i915_fbc_status", buf);
>  	return strstr(strstr(buf, "*"), buf_plane);
> @@ -1906,7 +1905,7 @@ static bool disable_features(const struct test_mode=
 *t)
>  		return false;
>=20=20
>  	intel_fbc_disable(drm.fd);
> -	intel_drrs_disable(drm.fd, prim_mode_params.pipe);
> +	intel_drrs_disable(drm.fd, prim_mode_params.crtc->pipe);
>=20=20
>  	return psr.can_test ? psr_disable(drm.fd, drm.debugfs, NULL) : false;
>  }
> @@ -1980,14 +1979,13 @@ static void init_blue_crc(enum pixel_format forma=
t, enum tiling_type tiling)
>=20=20
>  	fill_fb(&blue, COLOR_PRIM_BG);
>=20=20
> -	igt_output_set_crtc(prim_mode_params.output,
> -			    igt_crtc_for_pipe(prim_mode_params.output->display, prim_mode_par=
ams.pipe));
> +	igt_output_set_crtc(prim_mode_params.output, prim_mode_params.crtc);
>  	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mod=
e);
>  	igt_plane_set_fb(prim_mode_params.primary.plane, &blue);
>  	igt_display_commit(&drm.display);
>=20=20
>  	if (!pipe_crc) {
> -		pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(&drm.display, prim_mod=
e_params.pipe),
> +		pipe_crc =3D igt_crtc_crc_new(prim_mode_params.crtc,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		igt_assert(pipe_crc);
>  	}
> @@ -2036,8 +2034,7 @@ static void init_crcs(enum pixel_format format, enu=
m tiling_type tiling,
>  					 IGT_DRAW_PWRITE : IGT_DRAW_BLT, r);
>  	}
>=20=20
> -	igt_output_set_crtc(prim_mode_params.output,
> -			    igt_crtc_for_pipe(prim_mode_params.output->display, prim_mode_par=
ams.pipe));
> +	igt_output_set_crtc(prim_mode_params.output, prim_mode_params.crtc);
>  	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mod=
e);
>  	for (r =3D 0; r < pattern->n_rects; r++) {
>  		igt_plane_set_fb(prim_mode_params.primary.plane, &tmp_fbs[r]);
> @@ -2155,7 +2152,7 @@ static void teardown_crcs(void)
>=20=20
>  static void setup_fbc(void)
>  {
> -	if (!intel_fbc_supported_on_chipset(drm.fd, prim_mode_params.pipe)) {
> +	if (!intel_fbc_supported_on_chipset(drm.fd, prim_mode_params.crtc->pipe=
)) {
>  		igt_info("Can't test FBC: not supported on this chipset\n");
>  		return;
>  	}
> @@ -2195,7 +2192,7 @@ static void setup_drrs(void)
>  		return;
>  	}
>=20=20
> -	if (!intel_is_drrs_supported(drm.fd, prim_mode_params.pipe)) {
> +	if (!intel_is_drrs_supported(drm.fd, prim_mode_params.crtc->pipe)) {
>  		igt_info("Can't test DRRS: Not supported.\n");
>  		return;
>  	}
> @@ -2352,7 +2349,7 @@ static void do_status_assertions(int flags)
>  			igt_assert_f(false, "DRRS LOW\n");
>  		}
>  	} else if (flags & ASSERT_DRRS_INACTIVE) {
> -		if (!intel_is_drrs_inactive(drm.fd, prim_mode_params.pipe)) {
> +		if (!intel_is_drrs_inactive(drm.fd, prim_mode_params.crtc->pipe)) {
>  			drrs_print_status();
>  			igt_assert_f(false, "DRRS INACTIVE\n");
>  		}
> @@ -2363,9 +2360,9 @@ static void do_status_assertions(int flags)
>  		igt_require(!fbc_stride_not_supported());
>  		igt_require(!fbc_mode_too_large());
>  		igt_require(!fbc_psr_not_possible());
> -		if (!intel_fbc_wait_until_enabled(drm.fd, prim_mode_params.pipe)) {
> +		if (!intel_fbc_wait_until_enabled(drm.fd, prim_mode_params.crtc->pipe)=
) {
>  			igt_assert_f(intel_fbc_is_enabled(drm.fd,
> -						    prim_mode_params.pipe,
> +						    prim_mode_params.crtc->pipe,
>  						    IGT_LOG_WARN),
>  				     "FBC disabled\n");
>  		}
> @@ -2374,7 +2371,7 @@ static void do_status_assertions(int flags)
>  			igt_assert(fbc_wait_for_compression());
>  	} else if (flags & ASSERT_FBC_DISABLED) {
>  		igt_assert(!intel_fbc_wait_until_enabled(drm.fd,
> -						   prim_mode_params.pipe));
> +						   prim_mode_params.crtc->pipe));
>  	}
>=20=20
>  	if (flags & ASSERT_PSR_ENABLED) {
> @@ -2443,10 +2440,8 @@ static void update_modeset_cached_params(enum igt_=
draw_method method)
>  {
>  	bool found =3D false;
>=20=20
> -	igt_output_set_crtc(prim_mode_params.output,
> -			    igt_crtc_for_pipe(prim_mode_params.output->display, prim_mode_par=
ams.pipe));
> -	igt_output_set_crtc(scnd_mode_params.output,
> -			    igt_crtc_for_pipe(scnd_mode_params.output->display, scnd_mode_par=
ams.pipe));
> +	igt_output_set_crtc(prim_mode_params.output, prim_mode_params.crtc);
> +	igt_output_set_crtc(scnd_mode_params.output, scnd_mode_params.crtc);
>=20=20
>  	found =3D igt_override_all_active_output_modes_to_fit_bw(&drm.display);
>  	igt_require_f(found, "No valid mode combo found.\n");
> @@ -2514,7 +2509,7 @@ static void set_plane_for_test_fbc(const struct tes=
t_mode *t, igt_plane_t *plane
>  	struct igt_fb fb;
>  	uint64_t color;
>=20=20
> -	igt_info("Testing fbc on plane %i%s\n", plane->index + 1, kmstest_pipe_=
name(prim_mode_params.pipe));
> +	igt_info("Testing fbc on plane %i%s\n", plane->index + 1, igt_crtc_name=
(prim_mode_params.crtc));
>=20=20
>  	create_fb(t->format, prim_mode_params.mode.hdisplay, prim_mode_params.m=
ode.vdisplay, t->tiling, t->plane, &fb);
>  	color =3D pick_color(&fb, COLOR_PRIM_BG);
> @@ -2530,7 +2525,7 @@ static void set_plane_for_test_fbc(const struct tes=
t_mode *t, igt_plane_t *plane
>=20=20
>  	fbc_update_last_action();
>  	do_assertions(ASSERT_FBC_ENABLED | ASSERT_NO_ACTION_CHANGE);
> -	igt_assert_f(fbc_enable_per_plane(plane->index + 1, prim_mode_params.pi=
pe), "FBC disabled\n");
> +	igt_assert_f(fbc_enable_per_plane(plane->index + 1, prim_mode_params.cr=
tc), "FBC disabled\n");
>=20=20
>  	igt_remove_fb(drm.fd, &fb);
>  	igt_plane_set_fb(plane, NULL);
> @@ -2549,7 +2544,7 @@ static bool enable_features_for_test(const struct t=
est_mode *t)
>  	if (t->feature & FEATURE_PSR)
>  		ret =3D psr_enable(drm.fd, drm.debugfs, PSR_MODE_1, NULL);
>  	if (t->feature & FEATURE_DRRS)
> -		intel_drrs_enable(drm.fd, prim_mode_params.pipe);
> +		intel_drrs_enable(drm.fd, prim_mode_params.crtc->pipe);
>=20=20
>  	return ret;
>  }
> @@ -2769,12 +2764,11 @@ static void plane_fbc_rte_subtest(const struct te=
st_mode *t)
>  	do_assertions(ASSERT_FBC_DISABLED | DONT_ASSERT_CRC);
>=20=20
>  	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mod=
e);
> -	igt_output_set_crtc(prim_mode_params.output,
> -			    igt_crtc_for_pipe(prim_mode_params.output->display, prim_mode_par=
ams.pipe));
> +	igt_output_set_crtc(prim_mode_params.output, prim_mode_params.crtc);
>=20=20
>  	wanted_crc =3D &blue_crcs[t->format].crc;
>=20=20
> -	for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane) {
> +	for_each_plane_on_pipe(&drm.display, prim_mode_params.crtc->pipe, plane=
) {
>  		if (!is_valid_plane(plane))
>  			continue;
>=20=20
> @@ -3164,8 +3158,7 @@ static void page_flip_for_params(struct modeset_par=
ams *params,
>=20=20
>  	switch (type) {
>  	case FLIP_PAGEFLIP:
> -		rc =3D drmModePageFlip(drm.fd,
> -				     igt_crtc_for_pipe(&drm.display, params->pipe)->crtc_id,
> +		rc =3D drmModePageFlip(drm.fd, params->crtc->crtc_id,
>  				     params->primary.fb->fb_id,
>  				     DRM_MODE_PAGE_FLIP_EVENT, NULL);
>  		igt_assert_eq(rc, 0);
> @@ -3778,7 +3771,7 @@ static void stridechange_subtest(const struct test_=
mode *t)
>  	 * with the atomic page flip helper, but not with the legacy page flip.
>  	 */
>  	rc =3D drmModePageFlip(drm.fd,
> -			     igt_crtc_for_pipe(&drm.display, params->pipe)->crtc_id,
> +			     params->crtc->crtc_id,
>  			     new_fb->fb_id, 0, NULL);
>  	igt_assert(rc =3D=3D -EINVAL || rc =3D=3D 0);
>  	do_assertions(rc ? 0 : DONT_ASSERT_FBC_STATUS);
> @@ -4210,7 +4203,7 @@ int igt_main_args("", long_options, help_str, opt_h=
andler, NULL)
>  	igt_subtest_group() {
>  		igt_subtest_with_dynamic("pipe-fbc-rte") {
>=20=20
> -			enum pipe default_pipe =3D prim_mode_params.pipe;
> +			igt_crtc_t *default_crtc =3D prim_mode_params.crtc;
>=20=20
>  			t.pipes =3D PIPE_SINGLE;
>  			t.feature =3D FEATURE_FBC;
> @@ -4226,7 +4219,7 @@ int igt_main_args("", long_options, help_str, opt_h=
andler, NULL)
>  				      "FBC isn't supported on BMG\n");
>=20=20
>  			for_each_crtc(&drm.display, crtc) {
> -				if (crtc->pipe =3D=3D default_pipe) {
> +				if (crtc =3D=3D default_crtc) {
>  					igt_info("pipe-%s: FBC validated in other subtest\n", igt_crtc_name=
(crtc));
>  					continue;
>  				}
> @@ -4240,7 +4233,7 @@ int igt_main_args("", long_options, help_str, opt_h=
andler, NULL)
>  				setup_crcs();
>=20=20
>  				for_each_valid_output_on_pipe(&drm.display, crtc->pipe, output) {
> -					init_mode_params(&prim_mode_params, output, crtc->pipe);
> +					init_mode_params(&prim_mode_params, output, crtc);
>  					setup_fbc();
>=20=20
>  					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),

--=20
Jani Nikula, Intel
