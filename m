Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43947E6BF13
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA89010E256;
	Fri, 30 Jan 2026 14:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbPprCMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31E210E256
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769782952; x=1801318952;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=6SUv9JsyMhRFET7bZ5gKSjDRZ5y7xtV6otbJfXgLPUw=;
 b=bbPprCMU2h9OLpJf9CSMzAujUgKcYmYcfaqCoTRqVGtnsWb7068zRuqH
 uqM5iSWMJb8BcEuENZyr7PQ5uzc9RAqajfswUiWjuwEI4KwrlWyndSlXq
 ucYlNTrig0Tw1PQ5CY1o2HNrRKQfN5wydAmDvwmKQpX9K2rRiUa0zLOfy
 Lfy9eXzdv9mrCyYVhkiN4Q8Zxdj4V//okfLdWQwl4xCZSog25XyvkeaEa
 Uc1S9CL7mMBJm+C5htjYPARD8D0SS8GJXc7cBB60+Qw//ZKhuas4O6MWC
 6J2u4jv6IcVNt7zEfw1uw3SVrcc9TNNGEVEKCSakKZ+iY+OUerhUbAQd5 A==;
X-CSE-ConnectionGUID: 9Gox9zbPRoC9OQNagQi63g==
X-CSE-MsgGUID: sREAE2ZeS7OyjMT33A31YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81666385"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="81666385"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:22:32 -0800
X-CSE-ConnectionGUID: rvcA7NigRvmF+WvacuJk5Q==
X-CSE-MsgGUID: psD+dVIxR2O8qs6uh++suA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208863772"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:22:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/15] lib/kms: Use
 for_each_crtc_with_single_output(), part 3
In-Reply-To: <20260130105237.14481-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-11-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:22:26 +0200
Message-ID: <df7638bae4dd227eb5b16a524bb3e478071dca2a@intel.com>
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
> Convert more of the for_each_pipe_with_single_output() uses
> over to for_each_crtc_with_single_output(). This covers the
> simple use cases that weren't converted by the previous
> attempt (due to coccinelle performance falling off a cliff
> with the more straightforward semantic patch).

*tests/kms in the subject.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @change@
> iterator name for_each_pipe_with_single_output;
> iterator name for_each_crtc_with_single_output;
> typedef igt_crtc_t;
> enum pipe PIPE;
> expression DISPLAY, OUTPUT;
> @@
> - for_each_pipe_with_single_output(DISPLAY, PIPE, OUTPUT)
> + for_each_crtc_with_single_output(DISPLAY, crtc, OUTPUT)
> {
> <+...
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
> @depends on change@
> identifier FUNC;
> @@
> FUNC(...)
> {
> + igt_crtc_t *crtc;
> <+...
> for_each_crtc_with_single_output(...) { ... }
> ...+>
> }
>
> @depends on change@
> identifier FUNC, PIPE;
> expression E;
> @@
> FUNC(...)
> {
> ...
> (
> - enum pipe PIPE;
> |
> - enum pipe PIPE =3D E;
> )
> ... when !=3D PIPE
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_atomic.c     | 147 ++++++++++++++++++++++-------------------
>  tests/kms_cursor_crc.c |  86 +++++++++++++-----------
>  2 files changed, 128 insertions(+), 105 deletions(-)
>
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index c78b6b7d7e8b..fa321cc3c7a1 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -1455,7 +1455,7 @@ static const char *help_str =3D
>=20=20
>  int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  {
> -	enum pipe pipe =3D PIPE_NONE;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output =3D NULL;
>  	data_t data =3D { 0 };
>=20=20
> @@ -1470,20 +1470,21 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>  	igt_describe("Test for KMS atomic modesetting on overlay plane and ensu=
re coherency between "
>  		     "the legacy and atomic interfaces.");
>  	igt_subtest_with_dynamic("plane-overlay-legacy") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
>  			igt_plane_t *overlay =3D
> -				igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
> +				igt_crtc_get_plane_type(crtc,
>  							DRM_PLANE_TYPE_OVERLAY);
>  			uint32_t format =3D plane_get_igt_format(overlay);
>=20=20
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
>  			if (!overlay || !format)
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> -				atomic_setup(&data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
> +				atomic_setup(&data, crtc->pipe, output);
>  				plane_overlay(&data, output, overlay, format);
> -				atomic_clear(&data, pipe, output);
> +				atomic_clear(&data, crtc->pipe, output);
>  			}
>  			if (!all_pipes)
>  				break;
> @@ -1493,13 +1494,14 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>  	igt_describe("Test for KMS atomic modesetting on primary plane and ensu=
re coherency between "
>  		     "the legacy and atomic interfaces.");
>  	igt_subtest_with_dynamic("plane-primary-legacy") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> -				atomic_setup(&data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
> +				atomic_setup(&data, crtc->pipe, output);
>  				plane_primary(&data);
> -				atomic_clear(&data, pipe, output);
> +				atomic_clear(&data, crtc->pipe, output);
>  			}
>  			if (!all_pipes)
>  				break;
> @@ -1509,15 +1511,15 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>  	igt_describe("Verify that the overlay plane can cover the primary one (=
and "\
>  		     "vice versa) by changing their zpos property.");
>  	igt_subtest_with_dynamic("plane-primary-overlay-mutable-zpos") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
>  			igt_plane_t *overlay =3D
> -				igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
> +				igt_crtc_get_plane_type(crtc,
>  							DRM_PLANE_TYPE_OVERLAY);
>=20=20
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
>=20=20
> -			atomic_setup(&data, pipe, output);
> +			atomic_setup(&data, crtc->pipe, output);
>  			if (!overlay)
>  				continue;
>  			if (!has_mutable_zpos(data.primary) || !has_mutable_zpos(overlay))
> @@ -1525,10 +1527,11 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>  			if (!igt_plane_has_format_mod(data.primary, DRM_FORMAT_ARGB8888, 0x0)=
 ||
>  			    !igt_plane_has_format_mod(overlay, DRM_FORMAT_ARGB1555, 0x0))
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
>  				plane_primary_overlay_mutable_zpos(&data, output, overlay,
>  								   DRM_FORMAT_ARGB8888, DRM_FORMAT_ARGB1555);
> -				atomic_clear(&data, pipe, output);
> +				atomic_clear(&data, crtc->pipe, output);
>  			}
>  			if (!all_pipes)
>  				break;
> @@ -1538,17 +1541,19 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>  	igt_describe("Verify the reported zpos property of planes by making sur=
e "\
>  		     "only higher zpos planes cover the lower zpos ones.");
>  	igt_subtest_with_dynamic("plane-immutable-zpos") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			int n_planes =3D igt_crtc_for_pipe(&data.display, pipe)->n_planes;
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
> +			int n_planes =3D crtc->n_planes;
>=20=20
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
>  			if (n_planes < 2)
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> -				atomic_setup(&data, pipe, output);
> -				plane_immutable_zpos(&data, output, pipe, n_planes);
> -				atomic_clear(&data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
> +				atomic_setup(&data, crtc->pipe, output);
> +				plane_immutable_zpos(&data, output,
> +						     crtc->pipe, n_planes);
> +				atomic_clear(&data, crtc->pipe, output);
>  			}
>  			if (!all_pipes)
>  				break;
> @@ -1558,20 +1563,21 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>  	igt_describe("Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only=
 touches "
>  		     "the free-standing state objects and nothing else.");
>  	igt_subtest_with_dynamic("test-only") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
>  			uint32_t format;
>=20=20
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
>=20=20
> -			atomic_setup(&data, pipe, output);
> +			atomic_setup(&data, crtc->pipe, output);
>  			format =3D plane_get_igt_format(data.primary);
>=20=20
>  			if (!format)
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> -				atomic_clear(&data, pipe, output);
> -				test_only(&data, output, pipe, format);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
> +				atomic_clear(&data, crtc->pipe, output);
> +				test_only(&data, output, crtc->pipe, format);
>  			}
>  			if (!all_pipes)
>  				break;
> @@ -1581,19 +1587,20 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>  	igt_describe("Test for KMS atomic modesetting on cursor plane and ensur=
e coherency between "
>  		     "legacy and atomic interfaces.");
>  	igt_subtest_with_dynamic("plane-cursor-legacy") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
>  			igt_plane_t *cursor =3D
> -				igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
> +				igt_crtc_get_plane_type(crtc,
>  							DRM_PLANE_TYPE_CURSOR);
>=20=20
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
>  			if (!cursor)
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> -				atomic_setup(&data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
> +				atomic_setup(&data, crtc->pipe, output);
>  				plane_cursor(&data, output, cursor);
> -				atomic_clear(&data, pipe, output);
> +				atomic_clear(&data, crtc->pipe, output);
>  			}
>  			if (!all_pipes)
>  				break;
> @@ -1602,13 +1609,14 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>=20=20
>  	igt_describe("Test error handling when invalid plane parameters are pas=
sed");
>  	igt_subtest_with_dynamic("plane-invalid-params") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> -				atomic_setup(&data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
> +				atomic_setup(&data, crtc->pipe, output);
>  				plane_invalid_params(&data, output);
> -				atomic_clear(&data, pipe, output);
> +				atomic_clear(&data, crtc->pipe, output);
>  			}
>  			if (!all_pipes)
>  				break;
> @@ -1617,13 +1625,14 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>=20=20
>  	igt_describe("Test error handling when invalid plane fence parameters a=
re passed");
>  	igt_subtest_with_dynamic("plane-invalid-params-fence") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> -				atomic_setup(&data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
> +				atomic_setup(&data, crtc->pipe, output);
>  				plane_invalid_params_fence(&data, output);
> -				atomic_clear(&data, pipe, output);
> +				atomic_clear(&data, crtc->pipe, output);
>  			}
>  			if (!all_pipes)
>  				break;
> @@ -1632,13 +1641,14 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>=20=20
>  	igt_describe("Test error handling when invalid crtc parameters are pass=
ed");
>  	igt_subtest_with_dynamic("crtc-invalid-params") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> -				atomic_setup(&data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
> +				atomic_setup(&data, crtc->pipe, output);
>  				crtc_invalid_params(&data, output);
> -				atomic_clear(&data, pipe, output);
> +				atomic_clear(&data, crtc->pipe, output);
>  			}
>  			if (!all_pipes)
>  				break;
> @@ -1647,13 +1657,14 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>=20=20
>  	igt_describe("Test error handling when invalid crtc fence parameters ar=
e passed");
>  	igt_subtest_with_dynamic("crtc-invalid-params-fence") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> -				atomic_setup(&data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
> +				atomic_setup(&data, crtc->pipe, output);
>  				crtc_invalid_params_fence(&data, output);
> -				atomic_clear(&data, pipe, output);
> +				atomic_clear(&data, crtc->pipe, output);
>  			}
>  			if (!all_pipes)
>  				break;
> @@ -1664,13 +1675,14 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>  		     "various invalid conditions which the libdrm wrapper won't "
>  		     "allow us to create.");
>  	igt_subtest_with_dynamic("atomic-invalid-params") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> -				atomic_setup(&data, pipe, output);
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
> +				atomic_setup(&data, crtc->pipe, output);
>  				atomic_invalid_params(&data, output);
> -				atomic_clear(&data, pipe, output);
> +				atomic_clear(&data, crtc->pipe, output);
>  			}
>  			if (!all_pipes)
>  				break;
> @@ -1679,17 +1691,18 @@ int igt_main_args("e", NULL, help_str, opt_handle=
r, NULL)
>=20=20
>  	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
>  	igt_subtest_with_dynamic("atomic-plane-damage") {
> -		for_each_pipe_with_single_output(&data.display, pipe, output) {
> -			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +		for_each_crtc_with_single_output(&data.display, crtc, output) {
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
>  				continue;
>=20=20
> -			atomic_setup(&data, pipe, output);
> +			atomic_setup(&data, crtc->pipe, output);
>=20=20
>  			if (!igt_plane_has_prop(data.primary, IGT_PLANE_FB_DAMAGE_CLIPS))
>  				continue;
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      igt_output_name(output)) {
>  				atomic_plane_damage(&data);
> -				atomic_clear(&data, pipe, output);
> +				atomic_clear(&data, crtc->pipe, output);
>  			}
>  			if (!all_pipes)
>  				break;
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 4dcf63025687..10e51b457a15 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -959,7 +959,7 @@ static void test_size_hints(data_t *data)
>=20=20
>  static void run_size_tests(data_t *data, int w, int h)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	struct {
>  		const char *name;
>  		void (*testfunc)(data_t *);
> @@ -1006,11 +1006,12 @@ static void run_size_tests(data_t *data, int w, i=
nt h)
>  				}
>  			}
>=20=20
> -			for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> -				if (execution_constraint(pipe))
> +			for_each_crtc_with_single_output(&data->display, crtc,
> +							 data->output) {
> +				if (execution_constraint(crtc->pipe))
>  					continue;
>=20=20
> -				data->pipe =3D pipe;
> +				data->pipe =3D crtc->pipe;
>=20=20
>  				if (!valid_pipe_output_combo(data))
>  					continue;
> @@ -1021,7 +1022,8 @@ static void run_size_tests(data_t *data, int w, int=
 h)
>  				}
>=20=20
>  				igt_dynamic_f("pipe-%s-%s",
> -					      kmstest_pipe_name(pipe), igt_output_name(data->output))
> +					      igt_crtc_name(crtc),
> +					      igt_output_name(data->output))
>  					run_test(data, size_tests[i].testfunc, w, h);
>  			}
>  		}
> @@ -1033,7 +1035,7 @@ static void run_size_tests(data_t *data, int w, int=
 h)
>=20=20
>  static void run_tests_on_pipe(data_t *data)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	int cursor_size;
>=20=20
>  	igt_fixture() {
> @@ -1045,17 +1047,18 @@ static void run_tests_on_pipe(data_t *data)
>  		     "flight to smaller ones to see that the size is applied "
>  		     "correctly.");
>  	igt_subtest_with_dynamic("cursor-size-change") {
> -		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> -			if (execution_constraint(pipe))
> +		for_each_crtc_with_single_output(&data->display, crtc,
> +						 data->output) {
> +			if (execution_constraint(crtc->pipe))
>  				continue;
>=20=20
> -			data->pipe =3D pipe;
> +			data->pipe =3D crtc->pipe;
>=20=20
>  			if (!valid_pipe_output_combo(data))
>  				continue;
>=20=20
>  			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(pipe),
> +				      igt_crtc_name(crtc),
>  				      data->output->name)
>  				run_test(data, test_cursor_size,
>  					 data->cursor_max_w, data->cursor_max_h);
> @@ -1065,17 +1068,18 @@ static void run_tests_on_pipe(data_t *data)
>  	igt_describe("Validates the composition of a fully opaque cursor "
>  		     "plane, i.e., alpha channel equal to 1.0.");
>  	igt_subtest_with_dynamic("cursor-alpha-opaque") {
> -		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> -			if (execution_constraint(pipe))
> +		for_each_crtc_with_single_output(&data->display, crtc,
> +						 data->output) {
> +			if (execution_constraint(crtc->pipe))
>  				continue;
>=20=20
> -			data->pipe =3D pipe;
> +			data->pipe =3D crtc->pipe;
>=20=20
>  			if (!valid_pipe_output_combo(data))
>  				continue;
>=20=20
>  			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(pipe),
> +				      igt_crtc_name(crtc),
>  				      data->output->name)
>  				run_test(data, test_cursor_opaque,
>  					 data->cursor_max_w, data->cursor_max_h);
> @@ -1085,17 +1089,18 @@ static void run_tests_on_pipe(data_t *data)
>  	igt_describe("Validates the composition of a fully transparent cursor "
>  		     "plane, i.e., alpha channel equal to 0.0.");
>  	igt_subtest_with_dynamic("cursor-alpha-transparent") {
> -		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> -			if (execution_constraint(pipe))
> +		for_each_crtc_with_single_output(&data->display, crtc,
> +						 data->output) {
> +			if (execution_constraint(crtc->pipe))
>  				continue;
>=20=20
> -			data->pipe =3D pipe;
> +			data->pipe =3D crtc->pipe;
>=20=20
>  			if (!valid_pipe_output_combo(data))
>  				continue;
>=20=20
>  			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(pipe),
> +				      igt_crtc_name(crtc),
>  				      data->output->name)
>  				run_test(data, test_cursor_transparent,
>  					 data->cursor_max_w, data->cursor_max_h);
> @@ -1114,17 +1119,18 @@ static void run_tests_on_pipe(data_t *data)
>=20=20
>  	igt_describe("Validate cursor updates don't cause tearing with framebuf=
fer changes");
>  	igt_subtest_with_dynamic("cursor-tearing-framebuffer-change") {
> -		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> -			if (execution_constraint(pipe))
> +		for_each_crtc_with_single_output(&data->display, crtc,
> +						 data->output) {
> +			if (execution_constraint(crtc->pipe))
>  				continue;
>=20=20
> -			data->pipe =3D pipe;
> +			data->pipe =3D crtc->pipe;
>=20=20
>  			if (!valid_pipe_output_combo(data))
>  				continue;
>=20=20
>  			igt_dynamic_f("pipe-%s-%s",
> -					  kmstest_pipe_name(pipe),
> +					  igt_crtc_name(crtc),
>  					  data->output->name)
>  				run_test(data, test_crc_cursors,
>  					  data->cursor_max_w, data->cursor_max_h);
> @@ -1133,17 +1139,18 @@ static void run_tests_on_pipe(data_t *data)
>=20=20
>  	igt_describe("Validate cursor updates don't cause tearing with position=
 changes");
>  	igt_subtest_with_dynamic("cursor-tearing-position-change") {
> -		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> -			if (execution_constraint(pipe))
> +		for_each_crtc_with_single_output(&data->display, crtc,
> +						 data->output) {
> +			if (execution_constraint(crtc->pipe))
>  				continue;
>=20=20
> -			data->pipe =3D pipe;
> +			data->pipe =3D crtc->pipe;
>=20=20
>  			if (!valid_pipe_output_combo(data))
>  				continue;
>=20=20
>  			igt_dynamic_f("pipe-%s-%s",
> -					  kmstest_pipe_name(pipe),
> +					  igt_crtc_name(crtc),
>  					  data->output->name)
>  				run_test(data, test_crc_pos_cursors,
>  					  data->cursor_max_w, data->cursor_max_h);
> @@ -1159,18 +1166,19 @@ static void run_tests_on_pipe(data_t *data)
>=20=20
>  	igt_describe("Check random placement of a cursor with DPMS.");
>  	igt_subtest_with_dynamic("cursor-dpms") {
> -		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> -			if (execution_constraint(pipe))
> +		for_each_crtc_with_single_output(&data->display, crtc,
> +						 data->output) {
> +			if (execution_constraint(crtc->pipe))
>  				continue;
>=20=20
> -			data->pipe =3D pipe;
> +			data->pipe =3D crtc->pipe;
>  			data->flags =3D TEST_DPMS;
>=20=20
>  			if (!valid_pipe_output_combo(data))
>  				continue;
>=20=20
>  			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(pipe),
> +				      igt_crtc_name(crtc),
>  				      data->output->name)
>  				run_test(data, test_crc_random,
>  					 data->cursor_max_w, data->cursor_max_h);
> @@ -1180,18 +1188,19 @@ static void run_tests_on_pipe(data_t *data)
>=20=20
>  	igt_describe("Check random placement of a cursor with suspend.");
>  	igt_subtest_with_dynamic("cursor-suspend") {
> -		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> -			if (execution_constraint(pipe))
> +		for_each_crtc_with_single_output(&data->display, crtc,
> +						 data->output) {
> +			if (execution_constraint(crtc->pipe))
>  				continue;
>=20=20
> -			data->pipe =3D pipe;
> +			data->pipe =3D crtc->pipe;
>  			data->flags =3D TEST_SUSPEND;
>=20=20
>  			if (!valid_pipe_output_combo(data))
>  				continue;
>=20=20
>  			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(pipe),
> +				      igt_crtc_name(crtc),
>  				      data->output->name)
>  				run_test(data, test_crc_random,
>  					 data->cursor_max_w, data->cursor_max_h);
> @@ -1204,17 +1213,18 @@ static void run_tests_on_pipe(data_t *data)
>=20=20
>  	igt_describe("Check that sizes declared in SIZE_HINTS are accepted.");
>  	igt_subtest_with_dynamic("cursor-size-hints") {
> -		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> -			if (execution_constraint(pipe))
> +		for_each_crtc_with_single_output(&data->display, crtc,
> +						 data->output) {
> +			if (execution_constraint(crtc->pipe))
>  				continue;
>=20=20
> -			data->pipe =3D pipe;
> +			data->pipe =3D crtc->pipe;
>=20=20
>  			if (!valid_pipe_output_combo(data))
>  				continue;
>=20=20
>  			igt_dynamic_f("pipe-%s-%s",
> -				      kmstest_pipe_name(pipe),
> +				      igt_crtc_name(crtc),
>  				      data->output->name)
>  				run_test(data, test_size_hints,
>  					 data->cursor_max_w, data->cursor_max_h);

--=20
Jani Nikula, Intel
