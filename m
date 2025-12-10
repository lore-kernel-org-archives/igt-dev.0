Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A722DD3C913
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587CE10E6E2;
	Wed, 10 Dec 2025 14:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATCFG26p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4ED10E6E2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765376509; x=1796912509;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=fmQ6JAxIbftPvGShnKncCFWVXh5Wa8StHk4PVEIG0Fw=;
 b=ATCFG26pXX3zBr4ddgx26Xfw1ZAVuvtYI/Qvy/OLjJ6DwQwM/aQkrodM
 0hOiceArUEhfJ4NP2gBm/iBaT2RpdsU4O62OnIQzpzm1REnSi/PD/6OAq
 v21dqZUKxwgefyEbFrtaEzGl245MYgyVWw/2dlONhwu99EGf5rOHDC1QK
 S3HshkZRSBHp0FTKR+5MuvQZldVpjH8OvzcC5NX0BBFtR9uD6OCBTGJjj
 k2YaMf3ZSjMoqMmKm6Udt1ikVq9wAe6LiJ22UgvD66viIqd+cSndXR48a
 zydA4mmpDBKAXP7J4CxGNs6hNdgjHtPQ6Z5KlFleRi453UIZZLTdbWQ0V g==;
X-CSE-ConnectionGUID: 0582ftaYR8KF7PqFiCn0kQ==
X-CSE-MsgGUID: cNDysRfMSDWgyvGxB552pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67235546"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67235546"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:21:48 -0800
X-CSE-ConnectionGUID: a0yrt0FeRB+eXGJgWAFGHA==
X-CSE-MsgGUID: enMXsTSjRqORMvPt1gHDSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="200694347"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:21:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 02/10] lib/kms: Introduce igt_display_n_crtcs()
In-Reply-To: <20251210093903.15934-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-3-ville.syrjala@linux.intel.com>
Date: Wed, 10 Dec 2025 16:21:43 +0200
Message-ID: <5aade365e60cac8ccb65c84c466e85f11d4fe29b@intel.com>
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

On Wed, 10 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Introduce igt_display_n_crtcs() as the new name for
> igt_display_get_n_pipes(). The old name will get eliminated
> later using cocci, but it's easier to introduce duplicate
> names first because this needs to be used in a few messy macros
> that cocci doesn't like.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 13 ++++++++++++-
>  lib/igt_kms.h |  7 ++++---
>  2 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2d7da376bc0b..5b8598305f8c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3271,6 +3271,17 @@ out:
>  	}
>  }
>=20=20
> +/**
> + * igt_display_n_crtcs:
> + * @display: A pointer to an #igt_display_t structure
> + *
> + * Returns: Total number of CRTCs for the given @display
> + */
> +int igt_display_n_crtcs(igt_display_t *display)
> +{
> +	return display->n_pipes;
> +}
> +
>  /**
>   * igt_display_get_n_pipes:
>   * @display: A pointer to an #igt_display_t structure
> @@ -3279,7 +3290,7 @@ out:
>   */
>  int igt_display_get_n_pipes(igt_display_t *display)
>  {
> -	return display->n_pipes;
> +	return igt_display_n_crtcs(display);
>  }
>=20=20
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 065cbeca09a8..4171e2baef61 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -577,6 +577,7 @@ int  igt_display_drop_events(igt_display_t *display);
>  int  igt_display_get_n_pipes(igt_display_t *display);
>  void igt_display_require_output(igt_display_t *display);
>  void igt_display_require_output_on_pipe(igt_display_t *display, enum pip=
e pipe);
> +int igt_display_n_crtcs(igt_display_t *display);
>=20=20
>  const char *igt_output_name(igt_output_t *output);
>  drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
> @@ -743,7 +744,7 @@ static inline bool igt_output_is_connected(igt_output=
_t *output)
>   */
>  #define for_each_pipe_with_valid_output(display, pipe, output) \
>  	for (int con__ =3D (pipe) =3D 0; \
> -	     assert(igt_can_fail()), (pipe) < igt_display_get_n_pipes((display)=
) && con__ < (display)->n_outputs; \
> +	     assert(igt_can_fail()), (pipe) < igt_display_n_crtcs(display) && c=
on__ < (display)->n_outputs; \
>  	     con__ =3D (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (pipe =
=3D pipe + 1, 0)) \
>  		 for_each_if((display)->pipes[pipe].valid) \
>  			for_each_if ((((output) =3D &(display)->outputs[con__]), \
> @@ -763,9 +764,9 @@ igt_output_t **__igt_pipe_populate_outputs(igt_displa=
y_t *display,
>   * be called at most once for each pipe.
>   */
>  #define for_each_pipe_with_single_output(display, pipe, output) \
> -	for (igt_output_t *__outputs[(display)->n_pipes], \
> +	for (igt_output_t *__outputs[igt_display_n_crtcs(display)], \
>  	     **__output =3D __igt_pipe_populate_outputs((display), __outputs); \
> -		 __output < &__outputs[(display)->n_pipes]; __output++) \
> +		 __output < &__outputs[igt_display_n_crtcs(display)]; __output++) \
>  		for_each_if (*__output && \
>  			     ((pipe) =3D (__output - __outputs), (output) =3D *__output, 1))

--=20
Jani Nikula, Intel
