Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6CBEB28F8
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 09:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECC710E5FC;
	Fri,  6 Feb 2026 09:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rg8ZErOz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFFE10E5FC
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 09:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770369518; x=1801905518;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=WJAklnVdojf51T1LaRMjQ9C12px2EJVhNj7D+RKCk3Q=;
 b=Rg8ZErOzt5Uj9QGd1u4dfqdr1qXW8G3TmEYGBPU7A9vzZhV22uL9GstV
 if0jaufP524sAAsYX30cQZvl4PSQx+BLsTIbBRzzyBrUFYk5mmrlAdEoi
 0QyBuuOy9CzpLgOSJ4HkXjwcC8/71KsLcanp5eQlREl/+1Bks5w81DhxM
 aI21wjPi+thMlIaNVrhje9kL4NJBQbbiXYU9FkUBERPOCMyZE5Y3UGAgh
 VhmCu+MK1WrMuGr4OLEyzPToqwOYMfAwC4tcSvcFT8db4bj1WTigPYB+8
 DB/lp7NC+1p89pAszRU1txwrfKXO99XlRWAUFuKwN0UY77/BiZz/KmNLN g==;
X-CSE-ConnectionGUID: PmNCR6aST+CjQRs/9wskVw==
X-CSE-MsgGUID: sK3aexNFRLeQ1rcmmGpBBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70591978"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="70591978"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:18:38 -0800
X-CSE-ConnectionGUID: rKDSBb/4SgajXvDKRxn2Vw==
X-CSE-MsgGUID: 5AQyGwo0SVKfLr+tLWt65g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="241487965"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:18:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/12] tests/intel/kms_frontbuffer_tracking:
 Convert to for_each_crtc()
In-Reply-To: <20260205133019.9161-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
 <20260205133019.9161-2-ville.syrjala@linux.intel.com>
Date: Fri, 06 Feb 2026 11:18:32 +0200
Message-ID: <fb19ef3111016c40f46c59c2181966875abeeb4f@intel.com>
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
> Convert kms_frontbuffer_trackin to use for_each_crtc() instead

Should be kms_frontbuffer_trackin' or kms_frontbuffer_tracking. ;)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> of for_each_pipe(). Coccinelle hates kms_frontbuffer_tracking
> so do this by hand.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_fro=
ntbuffer_tracking.c
> index b60874db000a..58bc92a39422 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -4149,8 +4149,8 @@ struct option long_options[] =3D {
>  int igt_main_args("", long_options, help_str, opt_handler, NULL)
>  {
>  	struct test_mode t;
> -	enum pipe pipe;
>  	igt_output_t *output;
> +	igt_crtc_t *crtc;
>=20=20
>  	igt_fixture() {
>  		setup_drm();
> @@ -4225,25 +4225,25 @@ int igt_main_args("", long_options, help_str, opt=
_handler, NULL)
>  			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature =3D=3D FEATURE_F=
BC),
>  				      "FBC isn't supported on BMG\n");
>=20=20
> -			for_each_pipe(&drm.display, pipe) {
> -				if (pipe =3D=3D default_pipe) {
> -					igt_info("pipe-%s: FBC validated in other subtest\n", kmstest_pipe_=
name(pipe));
> +			for_each_crtc(&drm.display, crtc) {
> +				if (crtc->pipe =3D=3D default_pipe) {
> +					igt_info("pipe-%s: FBC validated in other subtest\n", igt_crtc_name=
(crtc));
>  					continue;
>  				}
>=20=20
> -				if (!intel_fbc_supported_on_chipset(drm.fd, pipe)) {
> -					igt_info("Can't test FBC: not supported on pipe-%s\n", kmstest_pipe=
_name(pipe));
> +				if (!intel_fbc_supported_on_chipset(drm.fd, crtc->pipe)) {
> +					igt_info("Can't test FBC: not supported on pipe-%s\n", igt_crtc_nam=
e(crtc));
>  					continue;
>  				}
>=20=20
>  				pipe_crc =3D NULL;
>  				setup_crcs();
>=20=20
> -				for_each_valid_output_on_pipe(&drm.display, pipe, output) {
> -					init_mode_params(&prim_mode_params, output, pipe);
> +				for_each_valid_output_on_pipe(&drm.display, crtc->pipe, output) {
> +					init_mode_params(&prim_mode_params, output, crtc->pipe);
>  					setup_fbc();
>=20=20
> -					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
>  						      igt_output_name(output))
>  						rte_subtest(&t);

--=20
Jani Nikula, Intel
