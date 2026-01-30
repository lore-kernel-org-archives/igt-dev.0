Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72818E6BF16
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B83910E11C;
	Fri, 30 Jan 2026 14:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMkQ5fSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4362310E11C
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769782039; x=1801318039;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=6bNPpiOqD5SB9FWsn4O+0KUk4dt8iu3/KKyTJs1fX9Q=;
 b=iMkQ5fSgQv/eSuhnI3Tc+En5aCsTyUgDAQUbtbSavsg+DLjzoLpYEA6I
 2Cour/SX19g/809Tk149Vh4HMrHi6BzoMdJ1biqmonyavnwjMcbxgPKzI
 lNy9bXtQKq/UD77yFv8ZLRbJ1wunSRxOkecAaKzyMIqPpFaOOzacYUdbU
 +dEbvp7QtcVGZaQbjBWgp8phY4Mp8/wZRbtflepScXuJzVOcuDQv/M6Rf
 AmG0o1CiDxgaauI2EGayufVVRyCt/WgufFzWizotFgqVcp/o2K7y42AAI
 Wzmxraxtwi375HMpz+9QS0EINL6sZYSAdlcV6ZfIU3S4BnA3lgC6ddqKU A==;
X-CSE-ConnectionGUID: ZusP9QiHRES8siPWqKf/WA==
X-CSE-MsgGUID: 47tglx/CTIeqdqvEuQiwKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88605652"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="88605652"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:07:19 -0800
X-CSE-ConnectionGUID: orcT+KLZS6OzWOi5org9JA==
X-CSE-MsgGUID: X/4/pRU6Ss6Cam0tqq+mXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="213807203"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:07:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/15] tests/kms_plane_scaling: Use for_each_crtc*()
In-Reply-To: <20260130105237.14481-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-4-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:07:14 +0200
Message-ID: <c0673e84805e8208717df50efda3e2fb570e023f@intel.com>
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

On Fri, 30 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert tests/kms_plane_scaling to use the new crtc based
> iteratros (over the old pipe based ones).

*iterators

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Coccinelle has a lot of trouble with this one so in the end
> I gave up and did the conversion manually.
>
> find_connected_pipe() is the slightly dodgy thing here since
> it uses the iterator after the loop. But I think the igt_require()
> stuff should trip up before if we didn't manage to find a suitable
> crtc at all. So should be safe.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_plane_scaling.c | 119 +++++++++++++++++++-------------------
>  1 file changed, 59 insertions(+), 60 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 70cf704c05fa..63fbc8c603bb 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -843,19 +843,18 @@ test_scaler_with_pixel_format_pipe(data_t *d, doubl=
e sf_plane,
>  static enum pipe
>  find_connected_pipe(igt_display_t *display, bool second, igt_output_t **=
output)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	bool first_output =3D false;
>  	bool found =3D false;
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	for_each_pipe(display, pipe) {
> -		for_each_valid_output_on_pipe(display, pipe, *output) {
> +	for_each_crtc(display, crtc) {
> +		for_each_valid_output_on_pipe(display, crtc->pipe, *output) {
>  			if (igt_output_get_driving_crtc(*output) !=3D NULL)
>  				continue;
>=20=20
> -			igt_output_set_crtc(*output,
> -					    igt_crtc_for_pipe((*output)->display, pipe));
> +			igt_output_set_crtc(*output, crtc);
>  			if (intel_pipe_output_combo_valid(display)) {
>  				found =3D true;
>=20=20
> @@ -879,7 +878,7 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>  	else
>  		igt_require_f(found, "No valid outputs found\n");
>=20=20
> -	return pipe;
> +	return crtc->pipe;
>  }
>=20=20
>  static int
> @@ -1363,7 +1362,7 @@ static data_t data;
>=20=20
>  int igt_main_args("", long_opts, help_str, opt_handler, &data)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	uint32_t ret =3D -EINVAL;
>=20=20
>  	igt_fixture() {
> @@ -1380,20 +1379,20 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  		for (int index =3D 0; index < ARRAY_SIZE(scaler_with_pixel_format_test=
s); index++) {
>  			igt_describe(scaler_with_pixel_format_tests[index].describe);
>  			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
> -				for_each_pipe(&data.display, pipe) {
> -					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +				for_each_crtc(&data.display, crtc) {
> +					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> +						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  							igt_info("Trying on %s\n", igt_output_name(output));
> -							if (!pipe_output_combo_valid(&data.display, pipe, output))
> +							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  								continue;
> -							if (get_num_scalers(&data.display, pipe) < 1)
> +							if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  								continue;
>=20=20
>  							ret =3D test_scaler_with_pixel_format_pipe(&data,
>  									scaler_with_pixel_format_tests[index].sf,
>  									false,
>  									scaler_with_pixel_format_tests[index].is_upscale,
> -									pipe, output);
> +									crtc->pipe, output);
>  							if (ret =3D=3D 0)
>  								break;
>  							igt_info("Required scaling operation not supported on %s trying o=
n next output\n",
> @@ -1408,20 +1407,20 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  		for (int index =3D 0; index < ARRAY_SIZE(scaler_with_rotation_tests); =
index++) {
>  			igt_describe(scaler_with_rotation_tests[index].describe);
>  			igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
> -				for_each_pipe(&data.display, pipe) {
> -					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +				for_each_crtc(&data.display, crtc) {
> +					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> +						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  							igt_info("Trying on %s\n", igt_output_name(output));
> -							if (!pipe_output_combo_valid(&data.display, pipe, output))
> +							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  								continue;
> -							if (get_num_scalers(&data.display, pipe) < 1)
> +							if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  								continue;
>=20=20
>  							ret =3D test_scaler_with_rotation_pipe(&data,
>  									scaler_with_rotation_tests[index].sf,
>  									false,
>  									scaler_with_rotation_tests[index].is_upscale,
> -									pipe, output);
> +									crtc->pipe, output);
>  							if (ret =3D=3D 0)
>  								break;
>  							igt_info("Required scaling operation not supported on %s trying o=
n next output\n",
> @@ -1436,20 +1435,20 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  		for (int index =3D 0; index < ARRAY_SIZE(scaler_with_modifiers_tests);=
 index++) {
>  			igt_describe(scaler_with_modifiers_tests[index].describe);
>  			igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
> -				for_each_pipe(&data.display, pipe) {
> -					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +				for_each_crtc(&data.display, crtc) {
> +					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> +						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  							igt_info("Trying on %s\n", igt_output_name(output));
> -							if (!pipe_output_combo_valid(&data.display, pipe, output))
> +							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  								continue;
> -							if (get_num_scalers(&data.display, pipe) < 1)
> +							if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  								continue;
>=20=20
>  							ret =3D test_scaler_with_modifier_pipe(&data,
>  									scaler_with_modifiers_tests[index].sf,
>  									false,
>  									scaler_with_modifiers_tests[index].is_upscale,
> -									pipe, output);
> +									crtc->pipe, output);
>  							if (ret =3D=3D 0)
>  								break;
>  							igt_info("Required scaling operation not supported on %s trying o=
n next output\n",
> @@ -1463,17 +1462,17 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>=20=20
>  		igt_describe("Tests scaling with clipping and clamping, pixel formats.=
");
>  		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-pixel-fo=
rmats") {
> -			for_each_pipe(&data.display, pipe) {
> -				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +			for_each_crtc(&data.display, crtc) {
> +				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> +					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  						igt_info("Trying on %s\n", igt_output_name(output));
> -						if (!pipe_output_combo_valid(&data.display, pipe, output))
> +						if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  							continue;
> -						if (get_num_scalers(&data.display, pipe) < 1)
> +						if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  							continue;
>=20=20
>  						ret =3D test_scaler_with_pixel_format_pipe(&data, 0.0, true,
> -											 false, pipe,
> +											 false, crtc->pipe,
>  											 output);
>  						if (ret =3D=3D 0)
>  							break;
> @@ -1488,17 +1487,17 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>=20=20
>  		igt_describe("Tests scaling with clipping and clamping, rotation.");
>  		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-rotation=
") {
> -			for_each_pipe(&data.display, pipe) {
> -				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +			for_each_crtc(&data.display, crtc) {
> +				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> +					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  						igt_info("Trying on %s\n", igt_output_name(output));
> -						if (!pipe_output_combo_valid(&data.display, pipe, output))
> +						if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  							continue;
> -						if (get_num_scalers(&data.display, pipe) < 1)
> +						if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  							continue;
>=20=20
>  						ret =3D test_scaler_with_rotation_pipe(&data, 0.0, true,
> -										     false, pipe,
> +										     false, crtc->pipe,
>  										     output);
>  						if (ret =3D=3D 0)
>  							break;
> @@ -1512,17 +1511,17 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>=20=20
>  		igt_describe("Tests scaling with clipping and clamping, modifiers.");
>  		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-modifier=
s") {
> -			for_each_pipe(&data.display, pipe) {
> -				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +			for_each_crtc(&data.display, crtc) {
> +				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> +					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  						igt_info("Trying on %s\n", igt_output_name(output));
> -						if (!pipe_output_combo_valid(&data.display, pipe, output))
> +						if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  							continue;
> -						if (get_num_scalers(&data.display, pipe) < 1)
> +						if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  							continue;
>=20=20
>  						ret =3D test_scaler_with_modifier_pipe(&data, 0.0, true,
> -										     false, pipe,
> +										     false, crtc->pipe,
>  										     output);
>  						if (ret =3D=3D 0)
>  							break;
> @@ -1537,19 +1536,19 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  		for (int index =3D 0; index < ARRAY_SIZE(scaler_with_2_planes_tests); =
index++) {
>  			igt_describe(scaler_with_2_planes_tests[index].describe);
>  			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
> -				for_each_pipe(&data.display, pipe) {
> -					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +				for_each_crtc(&data.display, crtc) {
> +					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> +						for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
>  							igt_info("Trying on %s\n",
>  								 igt_output_name(output));
> -							if (!pipe_output_combo_valid(&data.display, pipe, output))
> +							if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  								continue;
> -							if (get_num_scalers(&data.display, pipe) < 2)
> +							if (get_num_scalers(&data.display, crtc->pipe) < 2)
>  								continue;
>  							ret =3D test_planes_scaling_combo(&data,
>  								scaler_with_2_planes_tests[index].sf_plane1,
>  								scaler_with_2_planes_tests[index].sf_plane2,
> -								pipe, output,
> +								crtc->pipe, output,
>  								scaler_with_2_planes_tests[index].test_type);
>  							if (ret =3D=3D 0)
>  								break;
> @@ -1566,9 +1565,9 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  			igt_describe("Test for validating max source size.");
>  			igt_subtest_with_dynamic(intel_paramtests[index].testname) {
>  				igt_require_intel(data.drm_fd);
> -				for_each_pipe(&data.display, pipe) {
> -					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -						if (get_num_scalers(&data.display, pipe) < 1)
> +				for_each_crtc(&data.display, crtc) {
> +					for_each_valid_output_on_pipe(&data.display, crtc->pipe, output) {
> +						if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  							continue;
>  						/*
>  						 * Need to find mode with lowest vrefresh else
> @@ -1576,15 +1575,15 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  						 */
>  						if (find_mode(&data, output, &intel_paramtests[index]))
>  							igt_dynamic_f("pipe-%s-%s",
> -								      kmstest_pipe_name(pipe), igt_output_name(output))
> -								intel_max_source_size_test(&data, pipe, output,
> +								      igt_crtc_name(crtc), igt_output_name(output))
> +								intel_max_source_size_test(&data, crtc->pipe, output,
>  											   &intel_paramtests[index]);
>  						else
>  							igt_info("Unable to find the lowest " \
>  								 "refresh rate mode on output " \
>  								 "%s pipe %s\n",
>  								 igt_output_name(output),
> -								 kmstest_pipe_name(pipe));
> +								 igt_crtc_name(crtc));
>  						continue;
>  					}
>  					break;
> @@ -1594,15 +1593,15 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>=20=20
>  		igt_describe("Negative test for number of scalers per pipe.");
>  		igt_subtest_with_dynamic("invalid-num-scalers") {
> -			for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -				if (!pipe_output_combo_valid(&data.display, pipe, output))
> +			for_each_crtc_with_valid_output(&data.display, crtc, output) {
> +				if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  					continue;
> -				if (get_num_scalers(&data.display, pipe) < 1)
> +				if (get_num_scalers(&data.display, crtc->pipe) < 1)
>  						continue;
>=20=20
>  				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
> -					       kmstest_pipe_name(pipe), igt_output_name(output))
> -					test_invalid_num_scalers(&data, pipe, output);
> +					      igt_crtc_name(crtc), igt_output_name(output))
> +					test_invalid_num_scalers(&data, crtc->pipe, output);
>  			}
>  		}
>  	}

--=20
Jani Nikula, Intel
