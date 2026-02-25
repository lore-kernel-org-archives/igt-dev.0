Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8CEFD374E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 14:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47AD10E780;
	Wed, 25 Feb 2026 14:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5ziTUS2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B96210E780
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772028381; x=1803564381;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=1FVj3rRxI4Zem2ArqSSvAj1AOimQM+kHGsUsy+kDyLk=;
 b=R5ziTUS2WbRW3+HDaL4qM8lLHLTRhXUS/pIyKWN8C+c81BBYUb8cXFXh
 34eK7QHHH6Ak+jjjNARFWFpbZfowIUxAJNS2n83HrYbxUlNdaL5K+UFaD
 62B2Ldb6zUxYJ3ZXvp83E/ea5HRfoZIumO/ayTHEyd8FbiSu/GR6mFR5q
 2UidiTTZc3fND1PAEIpyVsAB/+9KJWP36cQsq5XNyJuoYl5bgKD1oy50V
 6E/q5Yt5Dq7f6Z9mgVXPdNUUj3bh+ncVl+CreJV8wvwpE2D63llqfqU0l
 cWQWuR1YTBxbgPLu+2tlkJwRaIc7NMj46IZf93ARgITjFIlTr+9xOMV+N Q==;
X-CSE-ConnectionGUID: lxrb7xzFSESSYRYB3peM7Q==
X-CSE-MsgGUID: SrI2MDr1RBqUEmixp+VEoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72972335"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72972335"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:06:20 -0800
X-CSE-ConnectionGUID: WidfndyhQfmZtq0eWvosGQ==
X-CSE-MsgGUID: bApK0h/zQtOL9BTvTBPLOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220735368"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:06:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 19/19] lib/kms: Nuke for_each_valid_output_on_pipe()
In-Reply-To: <20260225125108.31119-20-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
 <20260225125108.31119-20-ville.syrjala@linux.intel.com>
Date: Wed, 25 Feb 2026 16:06:13 +0200
Message-ID: <bf862627b376668c360a5566fb324f5279474dc3@intel.com>
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

On Wed, 25 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> for_each_valid_output_on_pipe() is no unused. Get rid of it.

*now

>
> And with that we also lose the last caller of
> igt_pipe_connector_valid() so nuke that one too.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.h | 27 ---------------------------
>  1 file changed, 27 deletions(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 8a3919a55e77..fb2597193467 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -670,19 +670,6 @@ static inline bool igt_output_is_connected(igt_outpu=
t_t *output)
>  	return false;
>  }
>=20=20
> -/**
> - * igt_pipe_connector_valid:
> - * @pipe: pipe to check.
> - * @output: #igt_output_t to check.
> - *
> - * Checks whether the given pipe and output can be used together.
> - */
> -static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t=
 *output)
> -{
> -	return igt_output_is_connected(output) &&
> -		output->config.valid_crtc_index_mask & (1 << (pipe));
> -}
> -
>  /**
>   * igt_crtc_connector_valid:
>   * @crtc: CRTC to check.
> @@ -801,20 +788,6 @@ igt_output_t **__igt_pipe_populate_outputs(igt_displ=
ay_t *display,
>  		for_each_if (*__output && \
>  			     ((crtc) =3D igt_crtc_for_pipe((display), (__output - __outputs))=
, (output) =3D *__output, 1))
>=20=20
> -/**
> - * for_each_valid_output_on_pipe:
> - * @display: a pointer to an #igt_display_t structure
> - * @pipe: Pipe to enumerate valid outputs over
> - * @output: The enumerated output.
> - *
> - * This for loop is called over all connected @output that can be used
> - * on this @pipe . If there are no valid outputs for this pipe, nothing
> - * happens.
> - */
> -#define for_each_valid_output_on_pipe(display, pipe, output) \
> -	for_each_connected_output((display), (output)) \
> -		for_each_if (igt_pipe_connector_valid((pipe), (output)))
> -
>  /**
>   * for_each_valid_output_on_crtc:
>   * @display: a pointer to an #igt_display_t structure

--=20
Jani Nikula, Intel
