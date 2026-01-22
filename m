Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1320D3EE66
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 14:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E79310E9C8;
	Thu, 22 Jan 2026 14:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiwVhUSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FCC10E9D1
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769092898; x=1800628898;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=K0+RvXtIQD65D5KKNggVc0VI90BptBUu7pIv2NJwszo=;
 b=GiwVhUSJPV4vGQ9AHUvYnOvoUHO9aXbQMeikAxYxsvsoks8FOSexioEe
 g3EFjLoIiKzp2IAZPXcLdLn6v2NSbolbWA6lzoxnnNYbV8Y52e3u7iE9E
 SHuD4qZRivfDadMjvmifgO/CQeQxkniK4ZFTbQBzw4viLhFM5/kpUhQYB
 g0hkAIxCh8ut1GOXmFVorxVbCYb3QiTyStr8kWtNeMpdjXRS5RPHXf6s1
 p8n/xVJIhMuT8rZ3nC5cebsp2RkVuJSKpAVjG3Sv1NhjwYql8lIcjCoWl
 GbphHnjnestnbGpYvlfjv7gEY/SxALSD5SqHfq1WCIIS8GP7JzQOJHXS3 g==;
X-CSE-ConnectionGUID: YRgk+m7dQOuvgca16zt+vg==
X-CSE-MsgGUID: D9nmYt8oQcyiYzEUZpP1Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87750123"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87750123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:41:38 -0800
X-CSE-ConnectionGUID: mfqeGyPmRO65iUk3nm42+g==
X-CSE-MsgGUID: 6oON8EhdQ12967sNEQS1wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="205999480"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:41:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/10] lib/kms:
 s/igt_output_get_driving_pipe()/igt_output_get_driving_crtc()/
In-Reply-To: <20260122125937.10807-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
 <20260122125937.10807-4-ville.syrjala@linux.intel.com>
Date: Thu, 22 Jan 2026 16:41:34 +0200
Message-ID: <a02becd578708e11c9fcd2e2edd5e9b667d26dad@intel.com>
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
> Rename igt_output_get_driving_pipe() to igt_output_get_driving_crtc()
> to reflect the fact that it returns the igt_crtc_t.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> @@
> - igt_output_get_driving_pipe
> + igt_output_get_driving_crtc
>   (...)
> { ... }
>
> @@
> @@
> - igt_output_get_driving_pipe
> + igt_output_get_driving_crtc
>   (...)
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c                  | 14 +++++++-------
>  lib/igt_kms.h                  |  2 +-
>  tests/intel/gem_pxp.c          |  2 +-
>  tests/intel/kms_pm_lpsp.c      |  2 +-
>  tests/intel/xe_pxp.c           |  2 +-
>  tests/kms_atomic_transition.c  |  4 ++--
>  tests/kms_content_protection.c |  2 +-
>  tests/kms_cursor_legacy.c      |  2 +-
>  tests/kms_debugfs.c            |  2 +-
>  tests/kms_feature_discovery.c  |  2 +-
>  tests/kms_plane_scaling.c      |  2 +-
>  11 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index ec6a71f9da2a..31013f36f705 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3529,7 +3529,7 @@ report_dup:
>  	}
>  }
>=20=20
> -igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output)
> +igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output)
>  {
>  	igt_display_t *display =3D output->display;
>  	enum pipe pipe;
> @@ -5267,7 +5267,7 @@ drmModeModeInfo *igt_output_get_lowres_mode(igt_out=
put_t *output)
>   */
>  void igt_output_override_mode(igt_output_t *output, const drmModeModeInf=
o *mode)
>  {
> -	igt_crtc_t *pipe =3D igt_output_get_driving_pipe(output);
> +	igt_crtc_t *pipe =3D igt_output_get_driving_crtc(output);
>=20=20
>  	if (mode)
>  		output->override_mode =3D *mode;
> @@ -5337,7 +5337,7 @@ void igt_output_set_crtc(igt_output_t *output, igt_=
crtc_t *pipe_obj)
>  	igt_assert(output->name);
>=20=20
>  	if (output->pending_pipe !=3D PIPE_NONE)
> -		old_pipe =3D igt_output_get_driving_pipe(output);
> +		old_pipe =3D igt_output_get_driving_crtc(output);
>=20=20
>  	LOG(display, "%s: set_crtc(%s)\n", igt_output_name(output),
>  	    igt_crtc_name(pipe_obj));
> @@ -5518,7 +5518,7 @@ igt_plane_t *igt_output_get_plane(igt_output_t *out=
put, int plane_idx)
>  {
>  	igt_crtc_t *pipe;
>=20=20
> -	pipe =3D igt_output_get_driving_pipe(output);
> +	pipe =3D igt_output_get_driving_crtc(output);
>  	igt_assert(pipe);
>=20=20
>  	return igt_crtc_get_plane(pipe, plane_idx);
> @@ -5538,7 +5538,7 @@ igt_plane_t *igt_output_get_plane_type(igt_output_t=
 *output, int plane_type)
>  {
>  	igt_crtc_t *pipe;
>=20=20
> -	pipe =3D igt_output_get_driving_pipe(output);
> +	pipe =3D igt_output_get_driving_crtc(output);
>  	igt_assert(pipe);
>=20=20
>  	return igt_crtc_get_plane_type(pipe, plane_type);
> @@ -5555,7 +5555,7 @@ igt_plane_t *igt_output_get_plane_type(igt_output_t=
 *output, int plane_type)
>   */
>  int igt_output_count_plane_type(igt_output_t *output, int plane_type)
>  {
> -	igt_crtc_t *pipe =3D igt_output_get_driving_pipe(output);
> +	igt_crtc_t *pipe =3D igt_output_get_driving_crtc(output);
>  	igt_assert(pipe);
>=20=20
>  	return igt_crtc_count_plane_type(pipe, plane_type);
> @@ -5574,7 +5574,7 @@ int igt_output_count_plane_type(igt_output_t *outpu=
t, int plane_type)
>  igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
>  					     int plane_type, int index)
>  {
> -	igt_crtc_t *pipe =3D igt_output_get_driving_pipe(output);
> +	igt_crtc_t *pipe =3D igt_output_get_driving_crtc(output);
>  	igt_assert(pipe);
>=20=20
>  	return igt_crtc_get_plane_type_index(pipe, plane_type, index);
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index ef2654dd3948..a20cc9fd4021 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -588,7 +588,7 @@ typedef struct _igt_pipe_crc igt_pipe_crc_t;
>  igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
>  igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *=
source);
>=20=20
> -igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output);
> +igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output);
>  const char *igt_output_name(igt_output_t *output);
>  bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
>  drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index b1bd094798b7..a3b4bc4d0b41 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -1244,7 +1244,7 @@ static void test_display_protected_crc(int i915, ig=
t_display_t *display)
>=20=20
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
> -		pipe =3D igt_output_get_driving_pipe(output);
> +		pipe =3D igt_output_get_driving_crtc(output);
>  		pipe_crc =3D igt_crtc_crc_new(pipe,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		plane =3D igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index e65597b9fded..eef10e54ab3d 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -139,7 +139,7 @@ static void test_cleanup(data_t *data)
>  {
>  	igt_plane_t *primary;
>=20=20
> -	if (!data->output || igt_output_get_driving_pipe(data->output) =3D=3D N=
ULL)
> +	if (!data->output || igt_output_get_driving_crtc(data->output) =3D=3D N=
ULL)
>  		return;
>=20=20
>  	primary =3D igt_output_get_plane_type(data->output,
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 3aee74b849a0..6e3ef9275eb9 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -845,7 +845,7 @@ static void compare_crcs(int fd, igt_display_t *displ=
ay, igt_fb_t *ref_fb, igt_f
>=20=20
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
> -		pipe =3D igt_output_get_driving_pipe(output);
> +		pipe =3D igt_output_get_driving_crtc(output);
>  		pipe_crc =3D igt_crtc_crc_new(pipe,
>  					    IGT_PIPE_CRC_SOURCE_AUTO);
>  		plane =3D igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 07889fe87caa..24af925332d3 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -840,7 +840,7 @@ static unsigned set_combinations(data_t *data, unsign=
ed mask, struct igt_fb *fb)
>  		event_mask |=3D 1 << pipe;
>=20=20
>  		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> -			if (igt_output_get_driving_pipe(output) !=3D NULL)
> +			if (igt_output_get_driving_crtc(output) !=3D NULL)
>  				continue;
>=20=20
>  			igt_output_set_crtc(output,
> @@ -933,7 +933,7 @@ retry:
>  							      IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  		for_each_valid_output_on_pipe(&data->display, i, output) {
> -			if (igt_output_get_driving_pipe(output) !=3D NULL)
> +			if (igt_output_get_driving_crtc(output) !=3D NULL)
>  				continue;
>=20=20
>  			igt_output_set_crtc(output,
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 16b174266a33..5928266f2fe4 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -397,7 +397,7 @@ static bool igt_crtc_is_free(igt_crtc_t *crtc)
>  	int i;
>=20=20
>  	for (i =3D 0; i < display->n_outputs; i++)
> -		if (igt_output_get_driving_pipe(&display->outputs[i]) =3D=3D crtc)
> +		if (igt_output_get_driving_crtc(&display->outputs[i]) =3D=3D crtc)
>  			return false;
>=20=20
>  	return true;
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index dbcb4bbf243c..a3499b246c90 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -439,7 +439,7 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>=20=20
>  	for_each_pipe(display, pipe) {
>  		for_each_valid_output_on_pipe(display, pipe, *output) {
> -			if (igt_output_get_driving_pipe(*output) !=3D NULL)
> +			if (igt_output_get_driving_crtc(*output) !=3D NULL)
>  				continue;
>=20=20
>  			igt_output_set_crtc(*output,
> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
> index e2e7daf44e24..228a54cd1a35 100644
> --- a/tests/kms_debugfs.c
> +++ b/tests/kms_debugfs.c
> @@ -45,7 +45,7 @@ static void igt_display_all_on(igt_display_t *display)
>  			igt_plane_t *primary;
>  			drmModeModeInfo *mode;
>=20=20
> -			if (igt_output_get_driving_pipe(output) !=3D NULL)
> +			if (igt_output_get_driving_crtc(output) !=3D NULL)
>  				continue;
>=20=20
>  			igt_output_set_crtc(output,
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index b63af75cdac3..a2af0e2dfc2a 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -99,7 +99,7 @@ int igt_main() {
>  				/* this is what most of the 2x tests are doing */
>  				for_each_pipe(&display, pipe) {
>  					for_each_valid_output_on_pipe(&display, pipe, output) {
> -						if (igt_output_get_driving_pipe(output) =3D=3D NULL) {
> +						if (igt_output_get_driving_crtc(output) =3D=3D NULL) {
>  							igt_output_set_crtc(output,
>  									    igt_crtc_for_pipe(output->display, pipe));
>  							output_count++;
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index eea557e7a0c2..bed8ec1581bc 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -851,7 +851,7 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>=20=20
>  	for_each_pipe(display, pipe) {
>  		for_each_valid_output_on_pipe(display, pipe, *output) {
> -			if (igt_output_get_driving_pipe(*output) !=3D NULL)
> +			if (igt_output_get_driving_crtc(*output) !=3D NULL)
>  				continue;
>=20=20
>  			igt_output_set_crtc(*output,

--=20
Jani Nikula, Intel
