Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F174DD3EE66
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 14:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBDE10E9CC;
	Thu, 22 Jan 2026 14:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJPUJZRH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B50A10E9C8
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769092951; x=1800628951;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=SYMD84STrOHBi3h2PvXzfIRHp6gB6tT8b9uuv4AUsBc=;
 b=JJPUJZRHhNaYYbEX3blXEuJuBkUa/lL+R5CDwM0BHvSUAGRCxdLYupVx
 ToLdZJrGpxDYy7fMtaul5jrX1DyLTvB+Q92OyMPwsL/G4rs+LEX5gCh2e
 +xbtpptTKJ1XLYL4H1/Wm+dKcLQrRVzPyrlzVnNCmEBuyDGn0WlPNq4L7
 t3aBEJlC51lWNjiYQLuM0CCL+Lju/p2SIPiUuyUVuZNScv5iUeRDYs4LC
 fS3t2KeBgsC9thcizq+uwG1WT2mDDkoWpbPyWAI4GYPjFuiBvVGdibZ6e
 pAUUu2+q0uKe5//e1sX+GJV65Se70IAo3kimWA/Ovl58X8kRhj5Cn6Jto w==;
X-CSE-ConnectionGUID: 61vk6L2hQRmLrFheCJw0kA==
X-CSE-MsgGUID: KueTPt2oTZO0yQu5QttYiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81777734"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81777734"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:42:31 -0800
X-CSE-ConnectionGUID: KWtqkNe2SUyWy6V+7Kq+QQ==
X-CSE-MsgGUID: RlOaqEmMRtWd5kTgRor+LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="210887628"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:42:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 04/10] lib/kms: s/n_pipes/n_crtcs/
In-Reply-To: <20260122125937.10807-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
 <20260122125937.10807-5-ville.syrjala@linux.intel.com>
Date: Thu, 22 Jan 2026 16:42:26 +0200
Message-ID: <f5e916025ac9fa3006b7952646eada4b6400784e@intel.com>
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
> Rename 'n_pipes' to 'n_crtcs' to better match the the crtc
> based future we're aiming for. The actual pipes[] array
> will be renamed separately.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> @@
> struct igt_display {
> 	...
> -	int n_pipes;
> +	int n_crtcs;
> 	...
>  };
>
> @@
> typedef igt_display_t;
> identifier D;
> expression E ;
> @@
> igt_display_t D =3D {
> 	...,
> -	.n_pipes =3D E
> +	.n_crtcs =3D E
> ,...
>  };
>
> @@
> igt_display_t S;
> @@
> - S.n_pipes
> + S.n_crtcs
>
> @@
> igt_display_t *S;
> @@
> - S->n_pipes
> + S->n_crtcs
>
> @@
> expression S;
> @@
> (
> - S.display.n_pipes
> + S.dsiplay.n_crtcs
> |
> - S->display.n_pipes
> + S->display.n_crtcs
> |
> - S.display->n_pipes
> + S.dsiplay->n_crtcs
> |
> - S->display->n_pipes
> + S->display->n_crtcs
> )
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c                | 4 ++--
>  lib/igt_kms.h                | 2 +-
>  tests/intel/gem_eio.c        | 2 +-
>  tests/intel/gem_exec_reloc.c | 2 +-
>  tests/intel/kms_busy.c       | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 31013f36f705..6f29a419b42d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3218,7 +3218,7 @@ void igt_display_require(igt_display_t *display, in=
t drm_fd)
>  		     "count_crtcs exceeds IGT_MAX_PIPES, resources->count_crtcs=3D%d, =
IGT_MAX_PIPES=3D%d\n",
>  		     resources->count_crtcs, IGT_MAX_PIPES);
>=20=20
> -	display->n_pipes =3D IGT_MAX_PIPES;
> +	display->n_crtcs =3D IGT_MAX_PIPES;
>  	display->pipes =3D calloc(igt_display_n_crtcs(display),
>  				sizeof(igt_crtc_t));
>  	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n",
> @@ -3298,7 +3298,7 @@ out:
>   */
>  int igt_display_n_crtcs(igt_display_t *display)
>  {
> -	return display->n_pipes;
> +	return display->n_crtcs;
>  }
>=20=20
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a20cc9fd4021..73a907a2e474 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -526,7 +526,7 @@ typedef struct {
>  struct igt_display {
>  	int drm_fd;
>  	int log_shift;
> -	int n_pipes;
> +	int n_crtcs;
>  	int n_planes;
>  	int n_colorops;
>  	int n_outputs;
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index 2191274ae8d3..92420d0920e5 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -1196,7 +1196,7 @@ int igt_main()
>=20=20
>  	igt_subtest_group() {
>  		igt_display_t display =3D {
> -			.drm_fd =3D -1, .n_pipes =3D IGT_MAX_PIPES
> +			.drm_fd =3D -1, .n_crtcs =3D IGT_MAX_PIPES
>  		};
>=20=20
>  		igt_fixture() {
> diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
> index eecc201308c2..9cf6d8201888 100644
> --- a/tests/intel/gem_exec_reloc.c
> +++ b/tests/intel/gem_exec_reloc.c
> @@ -1756,7 +1756,7 @@ int igt_main()
>  	igt_subtest_group() {
>  		igt_display_t display =3D {
>  			.drm_fd =3D fd,
> -			.n_pipes =3D IGT_MAX_PIPES
> +			.n_crtcs =3D IGT_MAX_PIPES
>  		};
>=20=20
>  		igt_fixture() {
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index 35a52a2994d9..f78a40891539 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -412,7 +412,7 @@ const char *help_str =3D
>=20=20
>  int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  {
> -	igt_display_t display =3D { .drm_fd =3D -1, .n_pipes =3D IGT_MAX_PIPES =
};
> +	igt_display_t display =3D { .drm_fd =3D -1, .n_crtcs =3D IGT_MAX_PIPES =
};
>=20=20
>  	enum pipe pipe, active_pipes[IGT_MAX_PIPES];
>  	igt_output_t *output;

--=20
Jani Nikula, Intel
