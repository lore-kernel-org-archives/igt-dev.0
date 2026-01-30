Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDF3E6BF16
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4152310E11C;
	Fri, 30 Jan 2026 14:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMmOEFu4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EA710E11C
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769782237; x=1801318237;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=EP6bU8BFK3WpGUN2TnS3LSVK4578zgZRCK1Oc2K02eA=;
 b=XMmOEFu4i8VBYfS1YWvTg/MlLGHlvVuUMCgG8f4FufPNqis5YdsYqSJm
 YSmE0E0+qiqzQMngWULha8WXK6vh8SHgO7DSd5RJffXfrINmKPwt7sIca
 QC1lot9XDMGXVnhzFK7K4b9KUyfDw4c7sujRAypyiBdc51akrJ9YpU47H
 4Rfn9dIkUbWkW9oVNRKedLoYEuR0poymNQ2JP8jK6jmkpSBaDQkEwq2TI
 p7g4aK273jbANHm7tmDH2Dn16+UdJcRhhhBSnWx+kqrHGBKyULOaRDs8C
 GSIHLalNgciSkX79024SgWuNjZtokaMejBGFp1q85he/s9tnRjfjH8D4m A==;
X-CSE-ConnectionGUID: UqjJHX8XRlunfdJt/nLgXA==
X-CSE-MsgGUID: 8tqSwsv/RNaJdwdOdoFoZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82456688"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="82456688"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:10:36 -0800
X-CSE-ConnectionGUID: o+nCgqy7RDa2URvro6qHaw==
X-CSE-MsgGUID: Fn1bRVrNQEqwRmwQvmz8uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="239586004"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:10:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 05/15] tests/intel/kms_pm_dc: Use for_each_crtc*()
In-Reply-To: <20260130105237.14481-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-6-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:10:31 +0200
Message-ID: <54d20227b83718ef87b56c06cc0d0e2953de49d7@intel.com>
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
> Convert tests/intel/kms_pm_dc to use the new crtc based iterators
> (over the old pipe based ones).
>
> Another case that proved too complex for coccinelle, so the conversion
> was done manually.
>
> test_deep_pkgc_state() is sligtly tricky since it uses the last

*slightly

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> iterator value after the loop. But the 'edp_found' check should
> make sure the crtc is valid there as well.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 36 ++++++++++++++++--------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 4babf1341e0b..83dbac296335 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -123,20 +123,19 @@ static void set_output_on_pipe_b(data_t *data)
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		drmModeConnectorPtr c =3D output->config.connector;
>=20=20
>  		/* DC5 with PIPE_B transaction */
> -		if (pipe !=3D PIPE_B)
> +		if (crtc->pipe !=3D PIPE_B)
>  			continue;
>=20=20
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>  			continue;
>=20=20
> -		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +		igt_output_set_crtc(output, crtc);
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> @@ -151,18 +150,18 @@ static void setup_output(data_t *data)
>  	igt_display_t *display =3D &data->display;
>  	igt_output_t *output;
>  	bool is_low_power;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		drmModeConnectorPtr c =3D output->config.connector;
>=20=20
>  		if (disp_ver >=3D 13) {
>  			if (disp_ver =3D=3D 20 || IS_BATTLEMAGE(data->devid) || IS_DG2(data->=
devid))
> -				is_low_power =3D (pipe =3D=3D PIPE_A);
> +				is_low_power =3D (crtc->pipe =3D=3D PIPE_A);
>  			else
> -				is_low_power =3D (pipe =3D=3D PIPE_A || pipe =3D=3D PIPE_B);
> +				is_low_power =3D (crtc->pipe =3D=3D PIPE_A || crtc->pipe =3D=3D PIPE=
_B);
>  		} else {
> -			is_low_power =3D (pipe =3D=3D PIPE_A);
> +			is_low_power =3D (crtc->pipe =3D=3D PIPE_A);
>  		}
>=20=20
>  		igt_skip_on_f(!is_low_power, "Low power pipe was not selected for the =
DC5 transaction.\n");
> @@ -170,8 +169,7 @@ static void setup_output(data_t *data)
>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
>  			continue;
>=20=20
> -		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +		igt_output_set_crtc(output, crtc);
>  		data->output =3D output;
>  		data->mode =3D igt_output_get_mode(output);
>=20=20
> @@ -644,7 +642,7 @@ static void test_deep_pkgc_state(data_t *data)
>  	time_t start =3D time(NULL);
>  	time_t duration =3D (4 * SEC);
>  	time_t delay;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	bool pkgc_flag =3D false;
>  	bool flip =3D true, edp_found =3D false;
>=20=20
> @@ -652,7 +650,7 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_plane_t *primary;
>  	igt_output_t *output =3D NULL;
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		if (output->config.connector->connector_type =3D=3D DRM_MODE_CONNECTOR=
_eDP) {
>=20=20
>  			edp_found =3D true;
> @@ -663,14 +661,12 @@ static void test_deep_pkgc_state(data_t *data)
>  				 * TODO: Add check for vmin =3D vmax =3D flipline if VRR enabled
>  				 * when KMD allows for such capability.
>  				 */
> -				igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
> -							    IGT_CRTC_VRR_ENABLED,
> -							    false);
> +				igt_crtc_set_prop_value(crtc, IGT_CRTC_VRR_ENABLED, false);
>  				igt_assert(igt_display_try_commit_atomic(display,
>  									 DRM_MODE_ATOMIC_ALLOW_MODESET,
>  									 NULL) =3D=3D 0);
>  			}
> -		break;
> +			break;
>  		}
>  	}
>=20=20
> @@ -681,7 +677,7 @@ static void test_deep_pkgc_state(data_t *data)
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
> +	igt_output_set_crtc(output, crtc);
>  	for_each_connector_mode(output) {
>  		data->mode =3D &output->config.connector->modes[j__];
>  		delay =3D (MSEC / (data->mode->vrefresh));
> @@ -700,7 +696,7 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
>  	/* Wait for the vblank to sync the frame time */
> -	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe), 1);
> +	igt_wait_for_vblank_count(crtc, 1);
>  	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
>  	/* Add a half-frame delay to ensure the flip occurs when the frame is a=
ctive. */
>  	usleep(delay * 0.5);

--=20
Jani Nikula, Intel
