Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD150EA4FBA
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D71110E450;
	Mon, 23 Feb 2026 14:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwJCXdid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67E110E455
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855623; x=1803391623;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=jlGEt+UKCMeD79nfGfPk04+1DVpN6rjt8O7RktbslPs=;
 b=JwJCXdiduuY+Lw1kqFSEcoyqGg+c9+onBX2WB1lLrWLLbYSZCrM0K75K
 68zFdVBpTLURa8Nrsp9lOYHNWPDOIpZjMj58wcYaqRsaQYp6QAvi3vjVD
 bQw+ypdSZ5S21V6ZXwD+aVe5giL4IPZoNYTLVjjOnqtJPt7QPIzpeIGag
 Dj4B4pSnlARGB/cOx09bptSgckydNYigPNM5WSWU3WoyjcrtpH7Zudf+z
 eFKDZJxJFj/KpOZl6Y7Vf9fNy/BfJaEx5b7htUy6n9A7m911HFH1gIdEj
 IUbpHnh9SpvGscBtt5KZAkahYkrY6JtcPNYmQnuz86N5eQU0C7xmoEeCF A==;
X-CSE-ConnectionGUID: AywhOxnrT1CfsnJj1mKt4A==
X-CSE-MsgGUID: sXyto8DOQoa83NUihjyEGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="83475663"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="83475663"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:07:02 -0800
X-CSE-ConnectionGUID: vDzbYF2hQt6FpWquBGFEZQ==
X-CSE-MsgGUID: 8qGrqK6iSWSZzGv2bF+FAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215417755"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:07:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 11/23] tests/kms_plane_scaling: Use igt_crtc_t
 instead of enum pipe
In-Reply-To: <20260221032003.30936-12-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-12-ville.syrjala@linux.intel.com>
Date: Mon, 23 Feb 2026 16:06:58 +0200
Message-ID: <4502d0c1a0c0e4338c08a089ca1d7e5046d042ac@intel.com>
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
>
> There are three noteworthy complications in this one:
> - two pipe/crtc usage in test_invalid_num_scalers()

ITYM test_scaler_with_multi_pipe_plane.

> - find_connnected_pipe() return value

*connected

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> - fixed PIPE_A usage in invalid_parameter_tests()
>
>  #include "scripts/iterators.cocci"
>
> @multi_pipe@
> typedef igt_crtc_t;
> typedef igt_display_t;
> identifier DISPLAY;
> enum pipe PIPE1, PIPE2;
> expression GET_PIPE1, GET_PIPE2;
> @@
>   igt_display_t *DISPLAY =3D ...;
> + igt_crtc_t *crtc1;
> + igt_crtc_t *crtc2;
> ...
> - PIPE1 =3D GET_PIPE1;
> + crtc1 =3D igt_crtc_for_pipe(DISPLAY, GET_PIPE1);
> ...
> - PIPE2 =3D GET_PIPE2;
> + crtc2 =3D igt_crtc_for_pipe(DISPLAY, GET_PIPE2);
> <...
> (
> - igt_crtc_for_pipe(..., PIPE1)
> + crtc1
> |
> - kmstest_pipe_name(PIPE1)
> + igt_crtc_name(crtc1)
> |
> - PIPE1
> + crtc1->pipe
> |
> - igt_crtc_for_pipe(..., PIPE2)
> + crtc2
> |
> - kmstest_pipe_name(PIPE2)
> + igt_crtc_name(crtc2)
> |
> - PIPE2
> + crtc2->pipe
> )
> ...>
>
> @@
> identifier PIPE;
> @@
> - enum pipe PIPE;
> ... when !=3D PIPE
>
> @ret_pipe@
> typedef igt_output_t;
> typedef igt_crtc_t;
> identifier FUNC;
> igt_crtc_t *CRTC;
> parameter list[N] P;
> @@
> - enum pipe
> + igt_crtc_t *
> FUNC(P)
> {
> <...
> - return CRTC->pipe;
> + return CRTC;
> ...>
> }
>
> @depends on ret_pipe@
> identifier ret_pipe.FUNC;
> @@
> FUNC(...)
> + ->pipe
>
> @func1@
> typedef igt_output_t;
> typedef igt_crtc_t;
> identifier FUNC, PIPE, CRTC;
> parameter list[N] P;
> @@
> FUNC(P
> -	,enum pipe PIPE
> +	,igt_crtc_t *CRTC
> 	,...)
> {
> ...
> (
> - igt_crtc_t *CRTC =3D igt_crtc_for_pipe(..., PIPE);
> |
> - igt_crtc_t *CRTC;
> ... when !=3D PIPE =3D ...
> - CRTC =3D igt_crtc_for_pipe(..., PIPE);
> )
> <... when !=3D PIPE =3D ...
> (
> - igt_crtc_for_pipe(..., PIPE)
> + CRTC
> |
> - kmstest_pipe_name(PIPE)
> + igt_crtc_name(CRTC)
> |
> - PIPE
> + CRTC->pipe
> )
> ...>
> }
>
> @depends on func1@
> identifier func1.FUNC;
> expression list[func1.N] EP;
> expression PIPE;
> @@
> FUNC(EP
> -	,PIPE
> +	,igt_crtc_for_pipe(display, PIPE)
> 	,...)
>
> @func2@
> typedef igt_crtc_t;
> identifier FUNC, PIPE;
> parameter list[N] P;
> @@
> FUNC(P
> -	,enum pipe PIPE
> +	,igt_crtc_t *crtc
> 	,...)
> {
> <+... when !=3D PIPE =3D ...
> (
> - igt_crtc_for_pipe(..., PIPE)
> + crtc
> |
> - kmstest_pipe_name(PIPE)
> + igt_crtc_name(crtc)
> |
> - PIPE
> + crtc->pipe
> )
> ...+>
> }
>
> @depends on func2@
> identifier func2.FUNC;
> expression list[func2.N] EP;
> expression PIPE;
> @@
> FUNC(EP
> -	,PIPE
> +	,igt_crtc_for_pipe(display, PIPE)
> 	,...)
>
> @depends on ret_pipe@
> identifier ret_pipe.FUNC;
> expression list[ret_pipe.N] EP;
> @@
> - igt_crtc_for_pipe(..., FUNC(EP)->pipe)
> + FUNC(EP)
>
> @@
> igt_crtc_t *CRTC;
> @@
> - igt_crtc_for_pipe(..., CRTC->pipe)
> + CRTC
>
> @@
> typedef igt_display_t;
> identifier DISPLAY;
> @@
> - igt_display_t *DISPLAY =3D ...;
> ... when !=3D DISPLAY
>
> @fixed_pipe_a@
> identifier PIPE, DISPLAY;
> @@
> igt_display_t *DISPLAY =3D ...;
> ...
> - enum pipe PIPE =3D PIPE_A;
> + igt_crtc_t *crtc;
> ...
> igt_fixture() {
> + crtc =3D igt_crtc_for_pipe(DISPLAY, PIPE_A);
> <+... when !=3D PIPE =3D ...
> (
> - igt_crtc_for_pipe(..., PIPE)
> + crtc
> |
> - kmstest_pipe_name(PIPE)
> + igt_crtc_name(crtc)
> |
> - PIPE
> + crtc->pipe
> )
> ...+>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_plane_scaling.c | 114 ++++++++++++++++++++------------------
>  1 file changed, 59 insertions(+), 55 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 887914ec8b79..893f2830b446 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -690,13 +690,13 @@ static bool test_format(data_t *data,
>  	return true;
>  }
>=20=20
> -static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iterat=
ion)
> +static bool test_pipe_iteration(data_t *data, igt_crtc_t *crtc, int iter=
ation)
>  {
>  	if (!is_intel_device(data->drm_fd) ||
>  	    data->extended)
>  		return true;
>=20=20
> -	if ((pipe > PIPE_B) && (iteration >=3D 2))
> +	if ((crtc->pipe > PIPE_B) && (iteration >=3D 2))
>  		return false;
>=20=20
>  	return true;
> @@ -714,12 +714,10 @@ static uint32_t
>  test_scaler_with_modifier_pipe(data_t *d,
>  			       double sf_plane,
>  			       bool is_clip_clamp,
> -			       bool is_upscale,
> -			       enum pipe pipe,
> +			       bool is_upscale, igt_crtc_t *crtc,
>  			       igt_output_t *output)
>  {
>  	igt_display_t *display =3D &d->display;
> -	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, pipe);
>  	unsigned format =3D DRM_FORMAT_XRGB8888;
>  	igt_plane_t *plane;
>  	uint32_t ret;
> @@ -754,12 +752,10 @@ static uint32_t
>  test_scaler_with_rotation_pipe(data_t *d,
>  			       double sf_plane,
>  			       bool is_clip_clamp,
> -			       bool is_upscale,
> -			       enum pipe pipe,
> +			       bool is_upscale, igt_crtc_t *crtc,
>  			       igt_output_t *output)
>  {
>  	igt_display_t *display =3D &d->display;
> -	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, pipe);
>  	unsigned format =3D DRM_FORMAT_XRGB8888;
>  	uint64_t modifier =3D DRM_FORMAT_MOD_LINEAR;
>  	igt_plane_t *plane;
> @@ -794,12 +790,10 @@ test_scaler_with_rotation_pipe(data_t *d,
>  static uint32_t
>  test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
>  				   bool is_clip_clamp,
> -				   bool is_upscale,
> -				   enum pipe pipe,
> +				   bool is_upscale, igt_crtc_t *crtc,
>  				   igt_output_t *output)
>  {
>  	igt_display_t *display =3D &d->display;
> -	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, pipe);
>  	uint64_t modifier =3D DRM_FORMAT_MOD_LINEAR;
>  	igt_plane_t *plane;
>  	uint32_t ret;
> @@ -819,7 +813,7 @@ test_scaler_with_pixel_format_pipe(data_t *d, double =
sf_plane,
>  		for (int j =3D 0; j < plane->drm_plane->count_formats; j++) {
>  			uint32_t format =3D plane->drm_plane->formats[j];
>=20=20
> -			if (!test_pipe_iteration(d, crtc->pipe, j))
> +			if (!test_pipe_iteration(d, crtc, j))
>  				continue;
>=20=20
>  			if (test_format(d, &tested_formats, format) &&
> @@ -842,7 +836,7 @@ test_scaler_with_pixel_format_pipe(data_t *d, double =
sf_plane,
>  	return ret;
>  }
>=20=20
> -static enum pipe
> +static igt_crtc_t *
>  find_connected_pipe(igt_display_t *display, bool second, igt_output_t **=
output)
>  {
>  	igt_crtc_t *crtc;
> @@ -880,7 +874,7 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>  	else
>  		igt_require_f(found, "No valid outputs found\n");
>=20=20
> -	return crtc->pipe;
> +	return crtc;
>  }
>=20=20
>  static int
> @@ -940,13 +934,11 @@ static void setup_fb(int fd, int width, int height,=
 struct igt_fb *fb)
>=20=20
>  static uint32_t
>  test_planes_scaling_combo(data_t *d, double sf_plane1,
> -			  double sf_plane2,
> -			  enum pipe pipe,
> +			  double sf_plane2, igt_crtc_t *crtc,
>  			  igt_output_t *output,
>  			  enum scaler_combo_test_type test_type)
>  {
>  	igt_display_t *display =3D &d->display;
> -	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, pipe);
>  	drmModeModeInfo *mode;
>  	int n_planes;
>  	int w1, h1, w2, h2;
> @@ -1014,10 +1006,9 @@ test_planes_scaling_combo(data_t *d, double sf_pla=
ne1,
>  }
>=20=20
>  static void
> -test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
> +test_invalid_num_scalers(data_t *d, igt_crtc_t *crtc, igt_output_t *outp=
ut)
>  {
>  	igt_display_t *display =3D &d->display;
> -	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, pipe);
>  	int width, height;
>  	igt_plane_t *plane[3];
>  	drmModeModeInfo *mode;
> @@ -1084,29 +1075,30 @@ test_invalid_num_scalers(data_t *d, enum pipe pip=
e, igt_output_t *output)
>  static void test_scaler_with_multi_pipe_plane(data_t *d)
>  {
>  	igt_display_t *display =3D &d->display;
> +	igt_crtc_t *crtc1;
> +	igt_crtc_t *crtc2;
>  	igt_output_t *output1, *output2;
>  	drmModeModeInfo *mode1, *mode2;
>  	igt_plane_t *plane[4];
> -	enum pipe pipe1, pipe2;
>  	int ret1, ret2;
>=20=20
>  	cleanup_fbs(d);
>=20=20
> -	pipe1 =3D find_connected_pipe(display, false, &output1);
> -	pipe2 =3D find_connected_pipe(display, true, &output2);
> +	crtc1 =3D find_connected_pipe(display, false, &output1);
> +	crtc2 =3D find_connected_pipe(display, true, &output2);
>  	igt_skip_on(!output1 || !output2);
>=20=20
>  	igt_info("Using (pipe %s + %s) and (pipe %s + %s) to run the subtest.\n=
",
> -		 kmstest_pipe_name(pipe1), igt_output_name(output1),
> -		 kmstest_pipe_name(pipe2), igt_output_name(output2));
> +		 igt_crtc_name(crtc1), igt_output_name(output1),
> +		 igt_crtc_name(crtc2), igt_output_name(output2));
>=20=20
>  	igt_output_set_crtc(output1,
> -			    igt_crtc_for_pipe(display, pipe1));
> +			    crtc1);
>  	igt_output_set_crtc(output2,
> -			    igt_crtc_for_pipe(display, pipe2));
> +			    crtc2);
>=20=20
> -	igt_require(get_num_scalers(display, pipe1) >=3D 2);
> -	igt_require(get_num_scalers(display, pipe2) >=3D 2);
> +	igt_require(get_num_scalers(display, crtc1->pipe) >=3D 2);
> +	igt_require(get_num_scalers(display, crtc2->pipe) >=3D 2);
>=20=20
>  	plane[0] =3D igt_output_get_plane(output1, 0);
>  	igt_require(plane[0]);
> @@ -1169,7 +1161,7 @@ static void test_scaler_with_multi_pipe_plane(data_=
t *d)
>  static void invalid_parameter_tests(data_t *d)
>  {
>  	igt_display_t *display =3D &d->display;
> -	enum pipe pipe =3D PIPE_A;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  	igt_fb_t fb;
>  	igt_plane_t *plane;
> @@ -1189,14 +1181,16 @@ static void invalid_parameter_tests(data_t *d)
>  	};
>=20=20
>  	igt_fixture() {
> -		output =3D igt_get_single_output_for_pipe(&d->display, pipe);
> +		crtc =3D igt_crtc_for_pipe(display, PIPE_A);
> +		output =3D igt_get_single_output_for_pipe(&d->display,
> +							crtc->pipe);
>  		igt_require(output);
>=20=20
>  		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(display, pipe));
> +				    crtc);
>  		plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>=20=20
> -		igt_require(get_num_scalers(&d->display, pipe) >=3D 1);
> +		igt_require(get_num_scalers(&d->display, crtc->pipe) >=3D 1);
>=20=20
>  		igt_create_fb(d->drm_fd, 256, 256,
>  			      DRM_FORMAT_XRGB8888,
> @@ -1280,11 +1274,10 @@ static drmModeModeInfo *find_mode(data_t *data, i=
gt_output_t *output, const stru
>   *		max_dst_w =3D 8192
>   *		max_dst_h =3D 8192
>   */
> -static void intel_max_source_size_test(data_t *d, enum pipe pipe, igt_ou=
tput_t *output,
> +static void intel_max_source_size_test(data_t *d, igt_crtc_t *crtc,
> +				       igt_output_t *output,
>  				       const struct invalid_paramtests *param)
>  {
> -	igt_display_t *display =3D &d->display;
> -	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, pipe);
>  	igt_fb_t fb;
>  	igt_plane_t *plane;
>  	int rval;
> @@ -1327,14 +1320,14 @@ static void intel_max_source_size_test(data_t *d,=
 enum pipe pipe, igt_output_t *
>  }
>=20=20
>  static bool
> -pipe_output_combo_valid(igt_display_t *display,
> -			enum pipe pipe, igt_output_t *output)
> +pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
> +			igt_output_t *output)
>  {
>  	bool ret =3D true;
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
> +	igt_output_set_crtc(output, crtc);
>  	if (!intel_pipe_output_combo_valid(display))
>  		ret =3D false;
>  	igt_output_set_crtc(output, NULL);
> @@ -1388,7 +1381,7 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>  						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  							igt_info("Trying on %s\n", igt_output_name(output));
> -							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
> +							if (!pipe_output_combo_valid(&data.display, crtc, output))
>  								continue;
>  							if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  								continue;
> @@ -1397,7 +1390,8 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  									scaler_with_pixel_format_tests[index].sf,
>  									false,
>  									scaler_with_pixel_format_tests[index].is_upscale,
> -									crtc->pipe, output);
> +									crtc,
> +									output);
>  							if (ret =3D=3D 0)
>  								break;
>  							igt_info("Required scaling operation not supported on %s trying o=
n next output\n",
> @@ -1416,7 +1410,7 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>  						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  							igt_info("Trying on %s\n", igt_output_name(output));
> -							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
> +							if (!pipe_output_combo_valid(&data.display, crtc, output))
>  								continue;
>  							if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  								continue;
> @@ -1425,7 +1419,8 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  									scaler_with_rotation_tests[index].sf,
>  									false,
>  									scaler_with_rotation_tests[index].is_upscale,
> -									crtc->pipe, output);
> +									crtc,
> +									output);
>  							if (ret =3D=3D 0)
>  								break;
>  							igt_info("Required scaling operation not supported on %s trying o=
n next output\n",
> @@ -1444,7 +1439,7 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>  						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  							igt_info("Trying on %s\n", igt_output_name(output));
> -							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
> +							if (!pipe_output_combo_valid(&data.display, crtc, output))
>  								continue;
>  							if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  								continue;
> @@ -1453,7 +1448,8 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  									scaler_with_modifiers_tests[index].sf,
>  									false,
>  									scaler_with_modifiers_tests[index].is_upscale,
> -									crtc->pipe, output);
> +									crtc,
> +									output);
>  							if (ret =3D=3D 0)
>  								break;
>  							igt_info("Required scaling operation not supported on %s trying o=
n next output\n",
> @@ -1471,13 +1467,14 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>  					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  						igt_info("Trying on %s\n", igt_output_name(output));
> -						if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
> +						if (!pipe_output_combo_valid(&data.display, crtc, output))
>  							continue;
>  						if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  							continue;
>=20=20
>  						ret =3D test_scaler_with_pixel_format_pipe(&data, 0.0, true,
> -											 false, crtc->pipe,
> +											 false,
> +											 crtc,
>  											 output);
>  						if (ret =3D=3D 0)
>  							break;
> @@ -1496,13 +1493,14 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>  					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  						igt_info("Trying on %s\n", igt_output_name(output));
> -						if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
> +						if (!pipe_output_combo_valid(&data.display, crtc, output))
>  							continue;
>  						if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  							continue;
>=20=20
>  						ret =3D test_scaler_with_rotation_pipe(&data, 0.0, true,
> -										     false, crtc->pipe,
> +										     false,
> +										     crtc,
>  										     output);
>  						if (ret =3D=3D 0)
>  							break;
> @@ -1520,13 +1518,14 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>  					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  						igt_info("Trying on %s\n", igt_output_name(output));
> -						if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
> +						if (!pipe_output_combo_valid(&data.display, crtc, output))
>  							continue;
>  						if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  							continue;
>=20=20
>  						ret =3D test_scaler_with_modifier_pipe(&data, 0.0, true,
> -										     false, crtc->pipe,
> +										     false,
> +										     crtc,
>  										     output);
>  						if (ret =3D=3D 0)
>  							break;
> @@ -1546,14 +1545,15 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  							igt_info("Trying on %s\n",
>  								 igt_output_name(output));
> -							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
> +							if (!pipe_output_combo_valid(&data.display, crtc, output))
>  								continue;
>  							if (get_num_scalers(&data.display, crtc->pipe) < 2)
>  								continue;
>  							ret =3D test_planes_scaling_combo(&data,
>  								scaler_with_2_planes_tests[index].sf_plane1,
>  								scaler_with_2_planes_tests[index].sf_plane2,
> -								crtc->pipe, output,
> +								crtc,
> +								output,
>  								scaler_with_2_planes_tests[index].test_type);
>  							if (ret =3D=3D 0)
>  								break;
> @@ -1581,7 +1581,9 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  						if (find_mode(&data, output, &intel_paramtests[index]))
>  							igt_dynamic_f("pipe-%s-%s",
>  								      igt_crtc_name(crtc), igt_output_name(output))
> -								intel_max_source_size_test(&data, crtc->pipe, output,
> +								intel_max_source_size_test(&data,
> +											   crtc,
> +											   output,
>  											   &intel_paramtests[index]);
>  						else
>  							igt_info("Unable to find the lowest " \
> @@ -1599,14 +1601,16 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  		igt_describe("Negative test for number of scalers per pipe.");
>  		igt_subtest_with_dynamic("invalid-num-scalers") {
>  			for_each_crtc_with_valid_output(&data.display, crtc, output) {
> -				if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
> +				if (!pipe_output_combo_valid(&data.display, crtc, output))
>  					continue;
>  				if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  						continue;
>=20=20
>  				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
>  					      igt_crtc_name(crtc), igt_output_name(output))
> -					test_invalid_num_scalers(&data, crtc->pipe, output);
> +					test_invalid_num_scalers(&data,
> +								 crtc,
> +								 output);
>  			}
>  		}
>  	}

--=20
Jani Nikula, Intel
