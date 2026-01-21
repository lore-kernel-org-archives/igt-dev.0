Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E78C44501
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 08:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A6710E71B;
	Wed, 21 Jan 2026 08:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJn5/9Gy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D75210E2BD
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768985893; x=1800521893;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=BSTmQ+1vqYFYFFjArKhvk84Fn/cE5smeA0cL3+zB5DI=;
 b=cJn5/9Gyz0NGTuM/02P/tOFeArx2kqqtqwWVeoVi8MB/tJhn+t/CU3eA
 tYmuJ8SNlKVSV5HfOQIJSC+6BJ319aHXK0vNneemX26kIQn669UgOoJIh
 A1kUxaeZXcZpq/YV/NW2NWcaW6OoSQoBZrwVDFiRI2M5NlQeeDdPuKDdF
 CaARbaHI67mBjsZrCKFNpemh8B7VNLfiOCyzycQG40pRUNM6CHFLDjQIP
 utFL04LJs2abVQQTXENSXOzb/t81RTATG8GqkIMi48GGgeD1413jLQHzP
 n3vF0WPYHeLHSpoxOJmbYQrU8Kpc9rL9830kom7xFFvsd5gqqiEicktjl g==;
X-CSE-ConnectionGUID: QmRjlpgjSBu5QZhKp7DIAg==
X-CSE-MsgGUID: tacbbVCARGyl51iYbegD6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80836908"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="80836908"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:58:13 -0800
X-CSE-ConnectionGUID: GScBAytHTCaijANGIAEJFg==
X-CSE-MsgGUID: EG773z7MTVOUE0o1Kv1Ovw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="237062486"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:58:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 04/12] lib/kms: Don't pass 'display' to
 igt_fill_pipe_props)_
In-Reply-To: <20260120171656.15840-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-5-ville.syrjala@linux.intel.com>
Date: Wed, 21 Jan 2026 10:58:07 +0200
Message-ID: <f64b825b0c3bb4c454281d5274ac5ab1906c22fa@intel.com>
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

On Tue, 20 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> igt_fill_pipe_props() can dig the display out from
> the crtc. No need to pass it in explicitly.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> identifier DISPLAY, CRTC;
> @@
> igt_fill_pipe_props(
> -	igt_display_t *DISPLAY,
> 	igt_crtc_t *CRTC, ...)
> {
> + igt_display_t *DISPLAY =3D CRTC->display;
> ...
> }
>
> @@
> expression DISPLAY;
> @@
> igt_fill_pipe_props(
> -	DISPLAY,
> 	...)
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a7d259923932..33e510acc514 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -964,9 +964,10 @@ igt_atomic_fill_connector_props(igt_display_t *displ=
ay, igt_output_t *output,
>  }
>=20=20
>  static void
> -igt_fill_pipe_props(igt_display_t *display, igt_crtc_t *pipe,
> +igt_fill_pipe_props(igt_crtc_t *pipe,
>  		    int num_crtc_props, const char * const crtc_prop_names[])
>  {
> +	igt_display_t *display =3D pipe->display;
>  	drmModeObjectPropertiesPtr props;
>  	int i, j, fd;
>=20=20
> @@ -3123,7 +3124,7 @@ static void igt_crtc_init(igt_display_t *display,
>  	pipe->planes =3D NULL;
>  	pipe->num_primary_planes =3D 0;
>=20=20
> -	igt_fill_pipe_props(display, pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_na=
mes);
> +	igt_fill_pipe_props(pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
>=20=20
>  	/* Get valid crtc index from crtcs for a pipe */
>  	crtc_mask =3D __get_crtc_mask_for_pipe(resources, pipe);

--=20
Jani Nikula, Intel
