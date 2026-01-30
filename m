Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E3BE6BF17
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310E110EA03;
	Fri, 30 Jan 2026 14:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwifkKkQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFE210EA03
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769783089; x=1801319089;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=IAmcE+ebdS18ivfhZuhHqsrGa0qgASRI7gs+TeI6N0w=;
 b=fwifkKkQ89ugDhLSvrSwh4H01wwWdqOz/DUddyuN7x56zpTm2vzE9ZLS
 mqIBQ0eWQHbbHRGH8IxeN8JwvRxTqM/SKIT/NRkmIuzvcMhiOeoB79xiz
 KLPWqhMk9KWSkRkFDbccJ83e+4Tlkdsv07U1C7TMrX5EEpQWGhB4xJ40J
 A7pt3CnepT1wmWSRo5v+e+HdjQsIRllwWF35l2mB9KjGAfNZLMHHUmmfj
 Ip+joPODXEpjXfQg0YDnuHEj2WIBySf1EQL4at8QX0/XDAMqxxp3JubzR
 sUclPBFU+nOXzvxdow1SDnknBgLJ+xf12jqXbBuiVT4Kyv6mVjKzcKSce Q==;
X-CSE-ConnectionGUID: mA+leTjWQXOQR0ReW6VVBg==
X-CSE-MsgGUID: PY1kIFaNS9ODTmBS1LoFwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81767152"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="81767152"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:24:48 -0800
X-CSE-ConnectionGUID: bPrscR8/SIepu9ucnCeSRw==
X-CSE-MsgGUID: bMHFJbmAQamky/w3xcTPtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208456691"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:24:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 11/15] lib/kms: Use
 for_each_crtc_with_valid_output(), part 1
In-Reply-To: <20260130105237.14481-12-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-12-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:24:45 +0200
Message-ID: <61ba149fec1fb6883beb6f9ad347e0056a976850@intel.com>
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
> Convert some uses of for_each_pipe_with_valid_output()
> to for_each_crtc_with_valid_output(). Take care of the
> cases where we (presumably) still have to keep some
> kind of 'data.pipe' thingy still up to date.

*tests/kms

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Eventually we should probably replace 'data.pipe' with
> 'data.crtc' but I didn't want to go that far here.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @change@
> iterator name for_each_pipe_with_valid_output;
> iterator name for_each_crtc_with_valid_output;
> typedef igt_crtc_t;
> identifier PIPE;
> expression DISPLAY, OUTPUT, X;
> @@
> - for_each_pipe_with_valid_output(DISPLAY, X.PIPE, OUTPUT)
> + for_each_crtc_with_valid_output(DISPLAY, crtc, OUTPUT)
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
> identifier FUNC;
> @@
> FUNC(...)
> {
> + igt_crtc_t *crtc;
> <+...
> for_each_crtc_with_valid_output(...) { ... }
> ...+>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_psr2_sf.c |  7 +++++--
>  tests/kms_lease.c         | 15 +++++++++------
>  tests/kms_vblank.c        | 26 +++++++++++++++++---------
>  3 files changed, 31 insertions(+), 17 deletions(-)
>
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index f42863874e5e..e23999544370 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -1175,6 +1175,7 @@ static void run_plane_update_continuous(data_t data=
, int i, int coexist_features
>=20=20
>  int igt_main()
>  {
> +	igt_crtc_t *crtc;
>  	bool output_supports_pr_psr2_sel_fetch =3D false;
>  	bool pr_psr2_sel_fetch_supported =3D false;
>  	data_t data =3D {};
> @@ -1219,11 +1220,13 @@ int igt_main()
>  		igt_info("Big framebuffer size %dx%d\n",
>  			 data.big_fb_width, data.big_fb_height);
>=20=20
> -		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output)=
 {
> +		for_each_crtc_with_valid_output(&data.display, crtc,
> +						data.output) {
> +			data.pipe =3D crtc->pipe;
>  			coexist_features[n_pipes] =3D 0;
>  			output_supports_pr_psr2_sel_fetch =3D check_pr_psr2_sel_fetch_support=
(&data);
>  			if (output_supports_pr_psr2_sel_fetch) {
> -				pipes[n_pipes] =3D data.pipe;
> +				pipes[n_pipes] =3D crtc->pipe;
>  				outputs[n_pipes] =3D data.output;
>=20=20
>  				if (is_dsc_supported_by_sink(data.drm_fd, data.output))
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 6d45d041b5b4..951159e97779 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -1240,6 +1240,7 @@ static void lease_uevent(data_t *data)
>=20=20
>  int igt_main()
>  {
> +	igt_crtc_t *crtc;
>  	data_t data;
>  	igt_output_t *output;
>  	igt_display_t *display =3D &data.master.display;
> @@ -1288,21 +1289,23 @@ int igt_main()
>=20=20
>  			igt_describe(f->desc);
>  			igt_subtest_with_dynamic_f("%s", f->name) {
> -				for_each_pipe_with_valid_output(display, data.pipe, output) {
> +				for_each_crtc_with_valid_output(display, crtc,
> +								output) {
> +					data.pipe =3D crtc->pipe;
>  					igt_display_reset(display);
>=20=20
>  					igt_output_set_crtc(output,
> -							    igt_crtc_for_pipe(output->display, data.pipe));
> +							    crtc);
>  					if (!intel_pipe_output_combo_valid(display))
>  						continue;
>=20=20
> -					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe),
> +					igt_dynamic_f("pipe-%s-%s",
> +						      igt_crtc_name(crtc),
>  						      igt_output_name(output)) {
> -						data.crtc_id =3D igt_crtc_for_pipe(display,
> -										 data.pipe)->crtc_id;
> +						data.crtc_id =3D crtc->crtc_id;
>  						data.connector_id =3D output->id;
>  						data.plane_id =3D
> -							igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.master.display, d=
ata.pipe),
> +							igt_crtc_get_plane_type(crtc,
>  										DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
>  						f->func(&data);
>  					}
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index ed72c3576784..1e4ccd83b554 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -625,6 +625,7 @@ const char *help_str =3D
>=20=20
>  int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  {
> +	igt_crtc_t *crtc;
>  	int fd;
>  	data_t data;
>=20=20
> @@ -642,11 +643,14 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>=20=20
>  	igt_describe("Negative test for vblank request.");
>  	igt_subtest_with_dynamic("invalid") {
> -		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output)=
 {
> -			if (!pipe_output_combo_valid(&data.display, data.pipe, data.output))
> +		for_each_crtc_with_valid_output(&data.display, crtc,
> +						data.output) {
> +			data.pipe =3D crtc->pipe;
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, data.output))
>  				continue;
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe), data.output=
->name)
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      data.output->name)
>  				invalid_subtest(&data, fd);
>  			/* one pipe/output combination is enough */
>  				break;
> @@ -655,17 +659,21 @@ int igt_main_args("e", NULL, help_str, opt_handler,=
 NULL)
>=20=20
>  	igt_describe("Check the vblank and flip events works with given crtc id=
.");
>  	igt_subtest_with_dynamic("crtc-id") {
> -		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output)=
 {
> -			if (!pipe_output_combo_valid(&data.display, data.pipe, data.output))
> +		for_each_crtc_with_valid_output(&data.display, crtc,
> +						data.output) {
> +			data.pipe =3D crtc->pipe;
> +			if (!pipe_output_combo_valid(&data.display, crtc->pipe, data.output))
>  				continue;
>=20=20
> -			if (!all_pipes && data.pipe !=3D active_pipes[0] &&
> -					  data.pipe !=3D active_pipes[last_pipe]) {
> -				igt_info("Skipping pipe %s\n", kmstest_pipe_name(data.pipe));
> +			if (!all_pipes && crtc->pipe !=3D active_pipes[0] &&
> +					  crtc->pipe !=3D active_pipes[last_pipe]) {
> +				igt_info("Skipping pipe %s\n",
> +					 igt_crtc_name(crtc));
>  				continue;
>  			}
>=20=20
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe), data.output=
->name)
> +			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> +				      data.output->name)
>  				crtc_id_subtest(&data, fd);
>  		}
>  	}

--=20
Jani Nikula, Intel
