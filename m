Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA97D2D10F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 14:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1702910E2B9;
	Tue, 13 Jan 2026 14:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnRQQ0N6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A866510E2B9
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768315171; x=1799851171;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=AgiIcGqjjshzS2Ha94od4ILerne6RdChzfnJ1lItSLw=;
 b=OnRQQ0N60CUpzNlkbBFjxqBbkwMHd81/YZLJUKIhd2RoY038uMNNFtag
 Pih5XBrqRBnVEbj9Ei+4NLz0SJBD7VwsoD7LN+TvzERHqfgK3o5xmOSom
 4pDWr6RkLoTSeKvKr57az6NHtLS3zYN9ahEuEJN9RjVSVn3fVc86WpTBa
 tG9SmVeWX3XqnozaKEmcvTf4vj0Y0O6qN/tKt6PteRCXOg595LmCirADy
 d8UtBrzMogGAzX3dMUyMyoUb83FELIb9+MO222HUV1OF8mMcNGn5PhFAL
 ICp8FyNGGFtnTGUf//Mhk3vVrPh655d7WJg33AYHw0y3/3KEglAqolcAF Q==;
X-CSE-ConnectionGUID: gJlIIfq2Rg+hoJUNQhQ0wg==
X-CSE-MsgGUID: A9f3/hheRwG/gysFjAujaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69498910"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69498910"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:39:30 -0800
X-CSE-ConnectionGUID: /o7EfscxT86vw5/va9HYHg==
X-CSE-MsgGUID: 2xyJK/+xQUuMzLw5LPxUgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204673463"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:39:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 7/8] tests/intel/kms_pipe_stress: Eliminate double
 display.drm_fd initialization
In-Reply-To: <20260113120439.12577-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
 <20260113120439.12577-8-ville.syrjala@linux.intel.com>
Date: Tue, 13 Jan 2026 16:39:26 +0200
Message-ID: <9f4927fe7229385e1ccbf244ea4f3c0290fedd43@intel.com>
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

On Tue, 13 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Stop initializing display.drm_fd twice. The first one
> is done explicitly and the second time is done by
> igt_display_require(). Just rely on igt_display_require().
>
> Note that a bunch of other tests do still do something similar

-do

> by completely omitting the local fd varaible/member and just

*variable

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> using display.drm_fd everywhere. It's a somewhat strange way
> to do things, but I decided to leave those alone at least for
> now.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> expression DISPLAY;
> expression FD, E;
> @@
> - FD =3D DISPLAY.drm_fd =3D E;
> + FD =3D E;
> ...
> (
> igt_display_require(&DISPLAY, FD)
> |
> igt_display_require(&DISPLAY,
> -	DISPLAY.drm_fd
> +	FD
> 	)
> )
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_pipe_stress.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index e8e01556ba25..33ccac9fcee3 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -862,11 +862,11 @@ int igt_main() {
>  	uint8_t format_idx =3D 0, tiling_idx =3D 0;
>=20=20
>  	igt_fixture() {
> -		data.drm_fd =3D data.display.drm_fd =3D drm_open_driver_master(DRIVER_=
INTEL | DRIVER_XE);
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>=20=20
>  		kmstest_set_vt_graphics_mode();
>=20=20
> -		igt_display_require(&data.display, data.display.drm_fd);
> +		igt_display_require(&data.display, data.drm_fd);
>  		igt_require(data.display.is_atomic);
>  		igt_display_require_output(&data.display);
>  		data.devid =3D intel_get_drm_devid(data.drm_fd);

--=20
Jani Nikula, Intel
