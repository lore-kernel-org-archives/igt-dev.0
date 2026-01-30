Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19DBE6BF17
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 14:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A237210EA04;
	Fri, 30 Jan 2026 14:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YihTsUYB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE80E10EA04
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769783712; x=1801319712;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=/cTjelInfSdB3JyfI7gD72fQ4iMutlroWo3bWXRDU3g=;
 b=YihTsUYBRbUmUyw6lpj2fulyqsLHr6zjbx4fVecUGLK3+cRFOjDFWXPF
 JXqOHx4hDrRmzNTwjmfX6oBG8mXtitX66NDssoNbiMaqnzO7b3v8WJN4Q
 eGAxK3RsNi+9FkNYHCKi6yxQBlPQCcwPWYdodJjf2ktBBpt5E+hnTBF7L
 H+nCtwN5M1tYs8tQIoafkI6xlpoBke7C6aKP3XQ4rKs2YUiD94OHRkVrY
 SQy5cdyQvSM9ROokL9RZc3P5zLnDnErneSJlFYJvQzqQXSDWYEI/V0ugu
 s/KgB9Hp4sj6x0GZG3W/1Grd1bTOSy9btw4QC9cSm7l1NT9rfxnXGxi5n g==;
X-CSE-ConnectionGUID: bu5Z/0XLT+u8dHxB1hBGWQ==
X-CSE-MsgGUID: uRDn9o8YRwmPhbg2u3NmCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70052824"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70052824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:35:11 -0800
X-CSE-ConnectionGUID: elnqG26ARtq+ogvABWL/4w==
X-CSE-MsgGUID: dwwS+uuITs2DKUaVVduvYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208775514"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 06:35:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 15/15] lib/kms: Nuke for_each_pipe_with_*_output()
In-Reply-To: <20260130105237.14481-16-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-16-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 16:35:07 +0200
Message-ID: <23c442608044aaa74882702334aa4c2c42765d6e@intel.com>
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
> The pipe based for_each_pipe_with_{single,valid}_output()
> iterators are no longer used anywhere. Get rid of them
> so that everyone is forced to use the new crtc based
> counterparts instead.

Unfortunately, one more user just got merged: 47ecc6345492
("tools/intel_hdcp: Basic init and cleanup for hdcp, constants, enums").

With that fixed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.h | 38 --------------------------------------
>  1 file changed, 38 deletions(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a4857ea0e574..057a0f5e90e0 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -774,27 +774,6 @@ static inline bool igt_crtc_connector_valid(igt_crtc=
_t *crtc, igt_output_t *outp
>  	     (crtc)++) \
>  		for_each_if ((crtc)->valid)
>=20=20
> -/**
> - * for_each_pipe_with_valid_output:
> - * @display: a pointer to an #igt_display_t structure
> - * @pipe: The pipe for which this @pipe / @output combination is valid.
> - * @output: The output for which this @pipe / @output combination is val=
id.
> - *
> - * This for loop is called over all connected outputs. This function
> - * will try every combination of @pipe and @output.
> - *
> - * If you only need to test a single output for each pipe, use
> - * for_each_pipe_with_single_output(), if you only need an
> - * output for a single pipe, use igt_get_single_output_for_pipe().
> - */
> -#define for_each_pipe_with_valid_output(display, pipe, output) \
> -	for (int con__ =3D (pipe) =3D 0; \
> -	     assert(igt_can_fail()), (pipe) < igt_display_n_crtcs(display) && c=
on__ < (display)->n_outputs; \
> -	     con__ =3D (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (pipe =
=3D pipe + 1, 0)) \
> -		for_each_if(igt_crtc_for_pipe((display), (pipe))->valid) \
> -			for_each_if ((((output) =3D &(display)->outputs[con__]), \
> -						igt_pipe_connector_valid((pipe), (output))))
> -
>  /**
>   * for_each_crtc_with_valid_output:
>   * @display: a pointer to an #igt_display_t structure
> @@ -819,23 +798,6 @@ static inline bool igt_crtc_connector_valid(igt_crtc=
_t *crtc, igt_output_t *outp
>  igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
>  					   igt_output_t **chosen_outputs);
>=20=20
> -/**
> - * for_each_pipe_with_single_output:
> - * @display: a pointer to an #igt_display_t structure
> - * @pipe: The pipe for which this @pipe / @output combination is valid.
> - * @output: The output for which this @pipe / @output combination is val=
id.
> - *
> - * This loop is called over all pipes, and will try to find a compatible=
 output
> - * for each pipe. Unlike for_each_pipe_with_valid_output(), this functio=
n will
> - * be called at most once for each pipe.
> - */
> -#define for_each_pipe_with_single_output(display, pipe, output) \
> -	for (igt_output_t *__outputs[igt_display_n_crtcs(display)], \
> -	     **__output =3D __igt_pipe_populate_outputs((display), __outputs); \
> -		 __output < &__outputs[igt_display_n_crtcs(display)]; __output++) \
> -		for_each_if (*__output && \
> -			     ((pipe) =3D (__output - __outputs), (output) =3D *__output, 1))
> -
>  /**
>   * for_each_crtc_with_single_output:
>   * @display: a pointer to an #igt_display_t structure

--=20
Jani Nikula, Intel
