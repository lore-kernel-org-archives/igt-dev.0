Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473DFEB28FE
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 09:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E079F10E65D;
	Fri,  6 Feb 2026 09:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTPD0Lui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB1910E65D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770370615; x=1801906615;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=1Fzo28sBlVGj4uy/U5GWYxjLmJG9qz2OB/uFVJSZ8jA=;
 b=fTPD0LuiZsTYCGVljo1Y6xMtIZTKzYG1bAFDYBs4E+e7Ydkkx7L2cqjz
 h3N+ohuRf6iFJZdg436/U5jnLi+NyK3ZGXYWpWCJfOmQ26Hf+vzlaHphg
 Z0OaOf+0v1ul6knGz6a62eoNxCUJOcO1+dm/Z6VPJcF0lR/hi7sN2joR0
 dBNuj6xAy91f+wuAVg1+GBRIzwoU938Ja2JHMMjm6cyoTNT+iJOdwgANZ
 gEvg3Lj3612UFKE2NOzR7JCt3Kyi8pv8CdmQbqOs9TdZMZ92Ow6bKqFSd
 Q55Dip7Gdd9QGzVExSLY6P7bX+CaQDvr1mkHYTaG/uNbG+Cqjj6cM6Xo2 A==;
X-CSE-ConnectionGUID: wQQ+fWJsQZyZf6wUUcCuFg==
X-CSE-MsgGUID: fAUO/6AlTouiBQLIcF8spQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75195044"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="75195044"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:36:54 -0800
X-CSE-ConnectionGUID: SobPCGKjS4CtxshOzrirsw==
X-CSE-MsgGUID: ukHzZdNFTf2CowiBbPkAhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210653199"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:36:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 07/12] tests/kms: Convert to for_each_crtc(), part 2
In-Reply-To: <20260205133019.9161-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
 <20260205133019.9161-8-ville.syrjala@linux.intel.com>
Date: Fri, 06 Feb 2026 11:36:49 +0200
Message-ID: <390574b513920eb178142246e428916dc5f6e3a2@intel.com>
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
> These specific cases weren't caught by the previous attempt
> due to some cocci weirness with curly braces vs. not for the
> iterator loop. To catch these stragglers we apparently need
> to add more braces ahead of time.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
>  #include "scripts/iterators.cocci"
>
> @@
> iterator name for_each_pipe;
> iterator name for_each_crtc;
> expression DISPLAY, X;
> identifier PIPE;
> statement S;
> @@
> for_each_pipe(DISPLAY, X.PIPE)
> +{
> S
> +}
>
> @change@
> identifier PIPE;
> expression DISPLAY, X;
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
> @depends on change@
> identifier CRTC;
> @@
>  igt_crtc_t *CRTC;
> ...
> - igt_crtc_t *CRTC;
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_dp_linktrain_fallback.c | 5 ++++-
>  tests/kms_vblank.c                      | 6 ++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp=
_linktrain_fallback.c
> index 5e6ba922420c..d74575f91d83 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -602,6 +602,7 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
>=20=20
>  int igt_main()
>  {
> +	igt_crtc_t *crtc;
>  	data_t data =3D {};
>=20=20
>  	igt_fixture() {
> @@ -611,8 +612,10 @@ int igt_main()
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_display_require_output(&data.display);
> -		for_each_pipe(&data.display, data.pipe)
> +		for_each_crtc(&data.display, crtc) {
> +			data.pipe =3D crtc->pipe;
>  			data.n_pipes++;
> +		}
>  		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
>  		update_debug_mask_if_ci(debug_mask_if_ci);
>=20=20
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index ecbd85d031a6..730a0f052a35 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -649,8 +649,10 @@ int igt_main_args("e", NULL, help_str, opt_handler, =
NULL)
>  		igt_display_require_output(&data.display);
>=20=20
>  		/* Get active pipes. */
> -		for_each_pipe(&data.display, data.pipe)
> -			active_pipes[last_pipe++] =3D data.pipe;
> +		for_each_crtc(&data.display, crtc) {
> +			data.pipe =3D crtc->pipe;
> +			active_pipes[last_pipe++] =3D crtc->pipe;
> +		}
>  		last_pipe--;
>  	}

--=20
Jani Nikula, Intel
