Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAF0D3EE6B
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 14:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218C910E9C0;
	Thu, 22 Jan 2026 14:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELmuVAHv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C02A10E9C0
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769092700; x=1800628700;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=pMaPSWIA4rc9WxjOQj/K7VCk0BsjOZmY7HtaTAbm4Qk=;
 b=ELmuVAHvxX7vCURpXMIP2KSu0T3xNG+7urPlfziLPvAlVoTKn2E0UKg8
 xGNECS7XVeDOdN9VQcxZGGuysami61xFZh3J74SWp3LEzkbRYpHNWpgkn
 x6hYZ6JDzWUgruRIjwMiB9PpXJ7SROuWxI5kXwmoA+3dEEWOTS8+VifAp
 yBBxBBWVtVQNwuhmwuHPnYWuafFlwfk2VkBLdpzX9MdLRWvZjXlJfKbO5
 rJBLN+jUwWD9sJe88js5ErBLWsDgbnK+tdG47658YLtAqBae9MVGlfeHd
 jVgo3xqg4OMftjd3DeSXhogPoG/NJF8/foFJZnfRaNzVFCuLRV8qb0p83 w==;
X-CSE-ConnectionGUID: t0jA9ho+SNi8gx+BoNoN+Q==
X-CSE-MsgGUID: /scB5T8LQSWbYXeZ0s6AgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70391557"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70391557"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:38:20 -0800
X-CSE-ConnectionGUID: e6HFVQWzT4e6pvOA02IpZQ==
X-CSE-MsgGUID: aNaR2YNcR8qJgFAzWgJpOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211201741"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:38:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/10] tests/kms_content_protection: Convert
 igt_pipe_is_free() to igt_crtc_is_free()
In-Reply-To: <20260122125937.10807-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
 <20260122125937.10807-2-ville.syrjala@linux.intel.com>
Date: Thu, 22 Jan 2026 16:38:15 +0200
Message-ID: <a23f3e1d7d60238971f7e09c00d6c68b0c34fda1@intel.com>
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
> Change igt_pipe_is_free() to take the full igt_crtc_t, rename
> the function to igt_crtc_is_free() to match. One more step in
> hiding the notion of pipes from tests.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/kms_content_protection.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index f1b98424db79..f324bc6de65f 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -391,12 +391,13 @@ static void test_cp_enable_with_retry(igt_output_t =
*output,
>=20=20
>  }
>=20=20
> -static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
> +static bool igt_crtc_is_free(igt_crtc_t *crtc)
>  {
> +	igt_display_t *display =3D crtc->display;
>  	int i;
>=20=20
>  	for (i =3D 0; i < display->n_outputs; i++)
> -		if (display->outputs[i].pending_pipe =3D=3D pipe)
> +		if (display->outputs[i].pending_pipe =3D=3D crtc->pipe)
>  			return false;
>=20=20
>  	return true;
> @@ -876,7 +877,9 @@ test_content_protection_mst(int content_type)
>=20=20
>  		pipe_found =3D false;
>  		for_each_pipe(display, pipe) {
> -			if (igt_pipe_is_free(display, pipe) &&
> +			igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, pipe);
> +
> +			if (igt_crtc_is_free(crtc) &&
>  			    igt_pipe_connector_valid(pipe, output)) {
>  				pipe_found =3D true;
>  				break;

--=20
Jani Nikula, Intel
