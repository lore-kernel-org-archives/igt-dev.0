Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCC4FD7F90
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 10:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F49610EAF9;
	Fri, 27 Feb 2026 10:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IL1EkoyC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4A310EAF9
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 10:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772189455; x=1803725455;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=5BBvmxju69S3EaGP8TOw95ZoHYI8ixKvaksNuMNCH30=;
 b=IL1EkoyCZWyc2lnyn3mcEyg2Kxoc3uCFHUNk07/5KciS2oRCTYj47hgC
 Mote76FcTDHSBtf7QNI033nXzrnfLH9BL2dqgPfUE2DzhNUX1IUhr5zlD
 0eQT2B0S+bNuFQ10KJaoVVQanI8iCo+2lQWhz5z05my/f69qYuJ1Tpdau
 DE+a38Jq5oQruJ1L7/E34QXg8oOeCluf1FbplO2d+f6SGmCnkDL5xU88B
 8hcQ3CmsEx706BxHh4K+EgiSTDGDOYKyXdnB9rm65Ca4SftrZbPtwCzQ0
 PzxcEdymzcpvoYAYV0R+bf10Ng+xjiDKV73y4KqnR5S+YZx6BGb/Mi/Wk A==;
X-CSE-ConnectionGUID: /FfvCqdoRHqwFeLpW33U5A==
X-CSE-MsgGUID: J5EOd80nTm697MWJV+BVDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="95890078"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="95890078"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:50:54 -0800
X-CSE-ConnectionGUID: aRoocQttQJuAbZg5ltWFUw==
X-CSE-MsgGUID: 0mf4F0fGSmGmNzOnekAK4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="213743234"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:50:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 02/17] lib/kms: Replace
 igt_display_require_output_on_pipe() with
 igt_display_require_output_on_crtc()
In-Reply-To: <20260227080653.30389-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
 <20260227080653.30389-3-ville.syrjala@linux.intel.com>
Date: Fri, 27 Feb 2026 12:50:50 +0200
Message-ID: <9c6bbc7a8e7072ebfdd27137ef220c83c55ba9a3@intel.com>
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

On Fri, 27 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace the pipe based igt_display_require_output_on_pipe()
> with igt_display_require_output_on_crtc().
>
>  #include "scripts/iterators.cocci"
>
> @@
> expression DISPLAY, PIPE;
> @@
> - igt_display_require_output_on_pipe(DISPLAY, PIPE)
> + igt_display_require_output_on_crtc(igt_crtc_for_pipe(DISPLAY, PIPE))
>
> @@
> igt_crtc_t *CRTC;
> @@
> - igt_crtc_for_pipe(..., CRTC->pipe)
> + CRTC
>
> @@
> type T;
> @@
> T igt_display_require_output_on_pipe(...);
> +void igt_display_require_output_on_crtc(igt_crtc_t *crtc);
>
> @@
> @@
> igt_display_require_output_on_pipe(...) { ... }
> +/**
> + * igt_display_require_output_on_crtc:
> + * @crtc: CRTC
> + *
> + * Checks whether there's a valid @crtc/@output combination for the give=
n @crtc
> + */
> +void igt_display_require_output_on_crtc(igt_crtc_t *crtc)
> +{
> +       if (!igt_crtc_has_valid_output(crtc))
> +               igt_skip("No valid connector found on CRTC %s\n", igt_crt=
c_name(crtc));
> +}
>
> @@
> @@
> - igt_display_require_output_on_pipe(...) { ... }
>
> @@
> @@
> - igt_pipe_has_valid_output(...) { ... }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c                 | 17 +++++++----------
>  lib/igt_kms.h                 |  2 +-
>  tests/intel/kms_ccs.c         |  3 +--
>  tests/kms_plane_alpha_blend.c |  2 +-
>  tests/nouveau_crc.c           |  3 +--
>  5 files changed, 11 insertions(+), 16 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 7454d16780f9..11ed109d74fb 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3254,19 +3254,16 @@ void igt_display_require_output(igt_display_t *di=
splay)
>  }
>=20=20
>  /**
> - * igt_display_require_output_on_pipe:
> - * @display: A pointer to an #igt_display_t structure
> - * @pipe: Display pipe
> + * igt_display_require_output_on_crtc:
> + * @crtc: CRTC
>   *
> - * Checks whether there's a valid @pipe/@output combination for the give=
n @display and @pipe
> - * Skips test if a valid @pipe is not found
> + * Checks whether there's a valid @crtc/@output combination for the give=
n @crtc
>   */
> -void igt_display_require_output_on_pipe(igt_display_t *display, enum pip=
e pipe)
> +void igt_display_require_output_on_crtc(igt_crtc_t *crtc)
>  {
> -	igt_require_pipe(display, pipe);
> -
> -	if (!igt_crtc_has_valid_output(igt_crtc_for_pipe(display, pipe)))
> -		igt_skip("No valid connector found on pipe %s\n", kmstest_pipe_name(pi=
pe));
> +	if (!igt_crtc_has_valid_output(crtc))
> +		igt_skip("No valid connector found on CRTC %s\n",
> +			 igt_crtc_name(crtc));
>  }
>=20=20
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 1e1f3ead5c99..c79c8664e9a9 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -570,7 +570,7 @@ void igt_display_commit_atomic(igt_display_t *display=
, uint32_t flags, void *use
>  int  igt_display_try_commit2(igt_display_t *display, enum igt_commit_sty=
le s);
>  int  igt_display_drop_events(igt_display_t *display);
>  void igt_display_require_output(igt_display_t *display);
> -void igt_display_require_output_on_pipe(igt_display_t *display, enum pip=
e pipe);
> +void igt_display_require_output_on_crtc(igt_crtc_t *crtc);
>  int igt_display_n_crtcs(igt_display_t *display);
>=20=20
>  const char *igt_crtc_name(igt_crtc_t *crtc);
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 2b570af355fc..4d0bda6a78f7 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -1171,8 +1171,7 @@ static void test_output(data_t *data, const int tes=
tnum)
>  						igt_info("Testing with seed %d\n", data->seed);
>=20=20
>  					if (data->flags & TEST_ALL_PLANES) {
> -						igt_display_require_output_on_pipe(&data->display,
> -										   crtc->pipe);
> +						igt_display_require_output_on_crtc(crtc);
>=20=20
>  						for_each_plane_on_crtc(crtc,
>  								       data->plane) {
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 41a3b71c3861..8b16a35ea70c 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -659,7 +659,7 @@ static bool pipe_check(data_t *data, igt_crtc_t *crtc,
>  	igt_plane_t *plane;
>  	bool plane_alpha =3D false, plane_blend =3D false, multiply =3D false;
>=20=20
> -	igt_display_require_output_on_pipe(display, crtc->pipe);
> +	igt_display_require_output_on_crtc(crtc);
>  	for_each_plane_on_crtc(crtc, plane) {
>  		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
>  			continue;
> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> index 3137884dcfc6..98394674e463 100644
> --- a/tests/nouveau_crc.c
> +++ b/tests/nouveau_crc.c
> @@ -340,8 +340,7 @@ int igt_main()
>  			int dir;
>=20=20
>  			data.crtc =3D igt_crtc_for_pipe(&data.display, pipe);
> -			igt_display_require_output_on_pipe(&data.display,
> -							   data.crtc->pipe);
> +			igt_display_require_output_on_crtc(data.crtc);

Because of what I explained in the previous patch, I believe this is now
broken. This one still uses for_each_pipe_static() iterating up to
IGT_MAX_PIPES, but the CRTCs are only valid up to the actual CRTC
count. crtc->display isn't initialized for invalid CRTCs.

I think the simple temporary fix is to add a manual data.crtc->valid
check here, similar to gem_eio.c which uses random pipes.

Long term, we just need to get rid of having invalid igt_crtc_t around.

BR,
Jani.


>=20=20
>  			/* Disable the output from the previous iteration of pipe tests, if t=
here is
>  			 * one

--=20
Jani Nikula, Intel
