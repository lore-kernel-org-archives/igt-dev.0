Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6190EB28FA
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 09:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E0510E664;
	Fri,  6 Feb 2026 09:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ns3e/f5k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38FD10E65D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770370567; x=1801906567;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=36kOdw9LjgdWGLr98CTgWkVr9FJKr1Q/7zawA8xiR48=;
 b=ns3e/f5kahCxIkrgciQ/8RXtkjD3KosPWbkyggI/sywo4Ltb+glovg15
 UrAXk4JLwgigE6V6IF7Bu1P4+ak3NOUYedd7VP/ZPRgoTkkHFfBqIqb5g
 H4QTrqe9V1xXznTqKUFrZBinQzUGzjuE3EEVGIjTbkcV2DVXqLQIi4XmZ
 Pyvge4nqqn6d5ihkJyOS9nVimSngII01gxDKCLh7M0BYoYzo91bcxEih/
 1QJrBDXRFw2SX3LLzAdxbSUHyeIjhd7fk6LcdEbu8K/3VMqZ4cAXEzWiv
 fO6apN8QfD3SYUMlUKZh7oCx+m+VBn79xbthzB4vxG61A7ghh72YMiu+2 A==;
X-CSE-ConnectionGUID: RTIUqhj/T5eHieU84SoTaA==
X-CSE-MsgGUID: yHWUX+9lRNCMskrsZ+MpDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71677098"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71677098"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:36:06 -0800
X-CSE-ConnectionGUID: sZQjGdwpRzKZWn7f731WGQ==
X-CSE-MsgGUID: hY4Y+B3aQfuEihNqXBGEfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210184379"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:36:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 06/12] tests/kms: Convert to for_each_crtc(), part 1
In-Reply-To: <20260205133019.9161-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
 <20260205133019.9161-7-ville.syrjala@linux.intel.com>
Date: Fri, 06 Feb 2026 11:36:02 +0200
Message-ID: <5770ba56e8f8929b2139c84260a7e4a9e7d742ee@intel.com>
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

On Thu, 05 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert more for_each_pipe()s into for_each_crtc(). In
> these cases the iterator is stored in some kind of data
> structure (data.pipe) which we still want to keep up to
> date to avoid functional changes.
>
> Done with cocci, with a slight manual fix up the data.pipe
> assignment vs. variable declaration order within the loop
> (couldn't come up with a good way to get coccinelle to do
> that for me).

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
>  #include "scripts/iterators.cocci"
>
> @change@
> iterator name for_each_pipe;
> iterator name for_each_crtc;
> expression DISPLAY, X;
> identifier PIPE;
> @@
> - for_each_pipe(DISPLAY, X.PIPE)
> + for_each_crtc(DISPLAY, crtc)
> {
> + X.PIPE =3D crtc->pipe;
> <...
> (
> - igt_crtc_for_pipe(..., X.PIPE)
> + crtc
> |
> - kmstest_pipe_name(X.PIPE)
> + igt_crtc_name(crtc)
> |
> - X.PIPE
> + crtc->pipe
> )
> ...>
> }
>
> @depends on change@
> identifier FUNC, CRTC;
> @@
> FUNC(...)
> {
> + igt_crtc_t *CRTC;
> <+...
> for_each_crtc(..., CRTC) { ... }
> ...+>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_dirtyfb.c        | 11 +++++++----
>  tests/intel/kms_fbc_dirty_rect.c | 25 ++++++++++++++++---------
>  2 files changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 407338affd6b..2611884ea8c4 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -353,6 +353,7 @@ static void run_test(data_t *data)
>=20=20
>  int igt_main()
>  {
> +	igt_crtc_t *crtc;
>  	data_t data =3D {};
>=20=20
>  	igt_fixture() {
> @@ -373,11 +374,13 @@ int igt_main()
>  	     data.feature =3D data.feature >> 1) {
>  		igt_describe_f("Test dirtyFB ioctl with %s", feature_str(data.feature)=
);
>  		igt_subtest_with_dynamic_f("%s-dirtyfb-ioctl", feature_str(data.featur=
e)) {
> -			for_each_pipe(&data.display, data.pipe) {
> +			for_each_crtc(&data.display, crtc) {
>  				int valid_tests =3D 0;
>=20=20
> +				data.pipe =3D crtc->pipe;
> +
>  				for_each_valid_output_on_pipe(&data.display,
> -							      data.pipe,
> +							      crtc->pipe,
>  							      data.output) {
>  					data.mode =3D igt_output_get_mode(data.output);
>=20=20
> @@ -396,13 +399,13 @@ int igt_main()
>=20=20
>  					igt_display_reset(&data.display);
>  					igt_output_set_crtc(data.output,
> -							    igt_crtc_for_pipe(data.output->display, data.pipe));
> +							    crtc);
>  					if (!intel_pipe_output_combo_valid(&data.display))
>  						continue;
>=20=20
>  					valid_tests++;
>  					igt_dynamic_f("%s-%s",
> -						      kmstest_pipe_name(data.pipe),
> +						      igt_crtc_name(crtc),
>  						      igt_output_name(data.output)) {
>  						prepare(&data);
>  						run_test(&data);
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty=
_rect.c
> index c43acb7e9cb5..6c59a32bda16 100644
> --- a/tests/intel/kms_fbc_dirty_rect.c
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -439,6 +439,7 @@ static void fbc_dirty_rectangle_test(data_t *data, vo=
id (*test_func)(data_t *))
>=20=20
>  int igt_main()
>  {
> +	igt_crtc_t *crtc;
>  	data_t data =3D {0};
>=20=20
>  	igt_fixture() {
> @@ -458,14 +459,16 @@ int igt_main()
>  		bool single_pipe =3D false;
>  		data.feature =3D FEATURE_FBC;
>=20=20
> -		for_each_pipe(&data.display, data.pipe) {
> +		for_each_crtc(&data.display, crtc) {
> +			data.pipe =3D crtc->pipe;
>  			if (single_pipe)
>  				break;
> -			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
> +			for_each_valid_output_on_pipe(&data.display,
> +						      crtc->pipe, data.output) {
>  				data.format =3D DRM_FORMAT_XRGB8888;
>=20=20
>  				igt_dynamic_f("pipe-%s-%s",
> -					       kmstest_pipe_name(data.pipe),
> +					       igt_crtc_name(crtc),
>  					       igt_output_name(data.output)) {
>  					fbc_dirty_rectangle_test(&data,
>  						fbc_dirty_rectangle_outside_visible_region);
> @@ -481,14 +484,16 @@ int igt_main()
>  		bool single_pipe =3D false;
>  		data.feature =3D FEATURE_FBC;
>=20=20
> -		for_each_pipe(&data.display, data.pipe) {
> +		for_each_crtc(&data.display, crtc) {
> +			data.pipe =3D crtc->pipe;
>  			if (single_pipe)
>  				break;
> -			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
> +			for_each_valid_output_on_pipe(&data.display,
> +						      crtc->pipe, data.output) {
>  				data.format =3D DRM_FORMAT_XRGB8888;
>=20=20
>  				igt_dynamic_f("pipe-%s-%s",
> -					       kmstest_pipe_name(data.pipe),
> +					       igt_crtc_name(crtc),
>  					       igt_output_name(data.output)) {
>  					fbc_dirty_rectangle_test(&data,
>  							fbc_dirty_rectangle_dirtyfb);
> @@ -506,17 +511,19 @@ int igt_main()
>  		bool single_pipe =3D false;
>  		data.feature =3D FEATURE_FBC;
>=20=20
> -		for_each_pipe(&data.display, data.pipe) {
> +		for_each_crtc(&data.display, crtc) {
> +			data.pipe =3D crtc->pipe;
>  			if (single_pipe)
>  				break;
> -			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
> +			for_each_valid_output_on_pipe(&data.display,
> +						      crtc->pipe, data.output) {
>  				for (int i =3D 0; i < num_formats; i++) {
>  					/* on simulation platforms , limit to single format */
>  					if (data.is_simulation && i > 0)
>  						break;
>=20=20
>  					igt_dynamic_f("pipe-%s-%s-format-%s",
> -						       kmstest_pipe_name(data.pipe),
> +						       igt_crtc_name(crtc),
>  						       igt_output_name(data.output),
>  						       igt_format_str(formats[i])) {
>  						data.format =3D formats[i];

--=20
Jani Nikula, Intel
