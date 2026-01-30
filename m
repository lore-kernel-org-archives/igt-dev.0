Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165DFE6BF11
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3BA10E9EB;
	Fri, 30 Jan 2026 14:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCcBb72e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5941E10E9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769782279; x=1801318279;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=Jt/CTCVxJNUVCBjMf3T5txdOOnrZmwLD4T0ls+6ZFXQ=;
 b=GCcBb72eYgsqOl9WPRi1Lxakc4/iFzSRM0SoU5GV9CcxoNhgR1cAJpSY
 IAa6oFf0zqESs1JtuRf/G5RsOVfa6mHkiE1IbX1gmzLpQvKBP1q3s6k0c
 QKAEeliMCG4yJLfuFSKMXDuidvwEwbWYhKashB07KX51NTALGao5361/l
 BZuueoMYKY7dXX2d9QCEtVYBKAbl3YeENwKGgniKGIwXEK+sHKwuvTJUY
 hMys5zyElDewso24FNUsiTMkjeuSQOQ4Oqxv2z+CbZx5BmwSt/KMJ3jxO
 5jdhORFqdHd4lFLNw3C7j0ZHq2HfRVrFtje9PhxRkvEw7lEeIJL4sojA5 A==;
X-CSE-ConnectionGUID: myQ1AyuRQYyjtukhQaHYuA==
X-CSE-MsgGUID: g23LBFM9SSu6jR8uvUW02g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70050570"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70050570"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:11:19 -0800
X-CSE-ConnectionGUID: b/7ZtbAZR2qg5waNnWJZ4w==
X-CSE-MsgGUID: ToDDzFjeTImx3nyUPSfTdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="213807910"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:11:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 06/15] tests/kms_rotation_crc: Use for_each_crtc*()
In-Reply-To: <20260130105237.14481-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-7-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:11:14 +0200
Message-ID: <88da86635bad54d7710f83cd87fb513cbcf70c2d@intel.com>
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
> Convert tests/kms_rotation_crc to use the new crtc based
> iteratros (over the old pipe based stuff).

*iterators

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> The conversion was done manually due to coccinelle not
> wanting to cooperate with me for whatever random reason.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_rotation_crc.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index abd87508045e..4ba6a19b5862 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -587,7 +587,7 @@ static void test_plane_rotation(data_t *data, int pla=
ne_type, bool test_bad_form
>  	igt_display_t *display =3D &data->display;
>  	drmModeModeInfo *mode;
>  	igt_output_t *output;
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	int pipe_count =3D 0, connected_outputs =3D 0;
>  	bool found =3D false;
>=20=20
> @@ -603,14 +603,13 @@ static void test_plane_rotation(data_t *data, int p=
lane_type, bool test_bad_form
>  	for_each_connected_output(&data->display, output)
>  		connected_outputs++;
>=20=20
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for_each_crtc_with_valid_output(display, crtc, output) {
>  		igt_plane_t *plane;
>  		int i, j, c;
>=20=20
>  		igt_display_reset(display);
>=20=20
> -		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +		igt_output_set_crtc(output, crtc);
>  		if (!intel_pipe_output_combo_valid(display))
>  			continue;
>=20=20
> @@ -648,13 +647,12 @@ static void test_plane_rotation(data_t *data, int p=
lane_type, bool test_bad_form
>  			break;
>  		pipe_count++;
>=20=20
> -		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +		igt_output_set_crtc(output, crtc);
>=20=20
>  		plane =3D igt_output_get_plane_type(output, plane_type);
>  		igt_require(plane_rotation_requirements(data, plane));
>=20=20
> -		prepare_crtc(data, output, pipe, plane, true);
> +		prepare_crtc(data, output, crtc->pipe, plane, true);
>=20=20
>  		for (i =3D 0; i < num_rectangle_types; i++) {
>  			/* Unsupported on intel */
> @@ -686,13 +684,13 @@ static void test_plane_rotation(data_t *data, int p=
lane_type, bool test_bad_form
>  					if (!test_format(data, &tested_formats, format))
>  						continue;
>=20=20
> -					test_single_case(data, pipe, output, plane, i,
> +					test_single_case(data, crtc->pipe, output, plane, i,
>  							 format, test_bad_format);
>  				}
>=20=20
>  				igt_vec_fini(&tested_formats);
>  			} else {
> -				test_single_case(data, pipe, output, plane, i,
> +				test_single_case(data, crtc->pipe, output, plane, i,
>  						 data->override_fmt, test_bad_format);
>  			}
>  		}
> @@ -1349,17 +1347,16 @@ int igt_main_args("", long_opts, help_str, opt_ha=
ndler, &data)
>  	 */
>  	igt_describe("This test intends to check for fence leaks exhaustively");
>  	igt_subtest_f("exhaust-fences") {
> -		enum pipe pipe;
> +		igt_crtc_t *crtc;
>  		igt_output_t *output;
>=20=20
>  		igt_require_intel(data.gfx_fd);
>  		igt_display_require_output(&data.display);
>=20=20
> -		for_each_pipe_with_valid_output(&data.display, pipe, output) {
> -			igt_plane_t *primary =3D &igt_crtc_for_pipe(&data.display,
> -								  pipe)->planes[0];
> +		for_each_crtc_with_valid_output(&data.display, crtc, output) {
> +			igt_plane_t *primary =3D &crtc->planes[0];
>=20=20
> -			test_plane_rotation_exhaust_fences(&data, pipe, output, primary);
> +			test_plane_rotation_exhaust_fences(&data, crtc->pipe, output, primary=
);
>  			break;
>  		}
>  	}

--=20
Jani Nikula, Intel
