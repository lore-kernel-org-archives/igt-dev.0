Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1B0D3EE66
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 14:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F45110E078;
	Thu, 22 Jan 2026 14:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ml7YB8NI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C1910E078
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769093185; x=1800629185;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=jO8GviMJgIWovvdjpcsEKUBBakHJwwgggtBn/jf3dpU=;
 b=Ml7YB8NI5gpdvUDOqsyMm/L0zaTSnixVcjyTf6kjz2TTDKxPDySlJi6z
 ScxrX8HyZEh36BQ7Xo75Xu+CkNRhKBGc4aRb8H9EkpzAeIX0GOzZdPnZI
 cyI00otNSKh43vnw/esRJiUy+v8Tcb3ZVzSacf6zH27/BVV6zHVFh+F2u
 vaB4U4Gm2EOpdGv+6BhJKcsXNHviQZgk0cR3DEOajYYimwEFBN4e5jlnR
 4iXoKD3X0tCbp/wVlT2yKL/wQz3DNvdYNLd9CS1wprDchw4igYVUpzceD
 58rflS7HHeKbJRkbxapHHC/WWFeHBjGw838+ZPRQrLUs5j1kJCmdPdAIt g==;
X-CSE-ConnectionGUID: +H8HJs4DQ+mazG4yGCaNEQ==
X-CSE-MsgGUID: gARj2xHaSBWyyDD9DtWk6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="69530136"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="69530136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:46:25 -0800
X-CSE-ConnectionGUID: b1UuXMcmTqajM/wKXmqFYQ==
X-CSE-MsgGUID: /wt1synXRSybUbD7SUK2LA==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:46:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 07/10] lib/kms: Rename old_pipe to old_crtc
In-Reply-To: <20260122125937.10807-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
 <20260122125937.10807-8-ville.syrjala@linux.intel.com>
Date: Thu, 22 Jan 2026 16:46:20 +0200
Message-ID: <8e7794ce1142e13e11527d8b0922e9d343e14775@intel.com>
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
> Start renaming variables from 'pipe' to 'crtc'
> where appropriate. igt_output_set_crtc() needs
> a bit of extra care due to the old vs. new
> stuff, so we start by just renaming 'old_pipe'
> to 'old_crtc' which can then be excluded from
> a later mass conversion.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> typedef igt_crtc_t;
> identifier OLD_CRTC =3D~ "old";
> expression E;
> @@
> (
>  igt_crtc_t *
> -	OLD_CRTC
> +	old_crtc
> 	;
> |
>  igt_crtc_t *
> -	OLD_CRTC
> +	old_crtc
> 	=3D E;
> )
> <...
> - OLD_CRTC
> + old_crtc
> ...>
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f15aaae9ce35..46acda0dfe8e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5334,28 +5334,31 @@ static const char *igt_crtc_name(igt_crtc_t *crtc)
>  void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *pipe_obj)
>  {
>  	igt_display_t *display =3D output->display;
> -	igt_crtc_t *old_pipe =3D NULL;
> +	igt_crtc_t *old_crtc =3D NULL;
>=20=20
>  	igt_assert(output->name);
>=20=20
>  	if (output->pending_pipe !=3D PIPE_NONE)
> -		old_pipe =3D igt_output_get_driving_crtc(output);
> +		old_crtc =3D igt_output_get_driving_crtc(output);
>=20=20
>  	LOG(display, "%s: set_crtc(%s)\n", igt_output_name(output),
>  	    igt_crtc_name(pipe_obj));
>  	output->pending_pipe =3D pipe_obj ? pipe_obj->pipe : PIPE_NONE;
>=20=20
> -	if (old_pipe) {
> +	if (old_crtc) {
>  		igt_output_t *old_output;
>=20=20
> -		old_output =3D igt_crtc_get_output(old_pipe);
> +		old_output =3D igt_crtc_get_output(old_crtc);
>  		if (!old_output) {
>  			if (display->is_atomic)
> -				igt_crtc_replace_prop_blob(old_pipe, IGT_CRTC_MODE_ID, NULL, 0);
> +				igt_crtc_replace_prop_blob(old_crtc,
> +							   IGT_CRTC_MODE_ID,
> +							   NULL, 0);
>  			else
> -				igt_crtc_set_prop_changed(old_pipe, IGT_CRTC_MODE_ID);
> +				igt_crtc_set_prop_changed(old_crtc,
> +							  IGT_CRTC_MODE_ID);
>=20=20
> -			igt_crtc_set_prop_value(old_pipe, IGT_CRTC_ACTIVE, 0);
> +			igt_crtc_set_prop_value(old_crtc, IGT_CRTC_ACTIVE, 0);
>  		}
>  	}

--=20
Jani Nikula, Intel
