Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85D4FD375F
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 13:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B72310E17F;
	Wed, 25 Feb 2026 13:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DO+QU3VK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9E710E17F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772027981; x=1803563981;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=Q1NRV0CCXpxA1vSQbwrSAhl80S88tXFFViDRcvlJZuM=;
 b=DO+QU3VKw2rEjjSM8DUXjPeABxh8cLwR0hfAka6xl245X+EZPXUiGP+r
 XcniHxg6giNBI7p2vGGCuQ6UfDkZaRsTrLXGnMVz8sy7Ojc/QZ100Mrtf
 MXnGtW7wQpjo95C9Eh3CJJ7zAT9dI7C9Lwh4NCrl3cMaDrEWqNdIPl6FA
 tzVa/nHqawvL9zZQJvL0LA6cGPUUQu/Z4zrfmYoe7zcqu4MoYmEB7hAZs
 PgklMz5r9iolT8xPVgj/p8jZsLIRMMaF2SjSwt4x6R3EyL7jNY+Ydf1Wa
 IqfX4vFcLFDFwrOnVN6Oa1PlUqNtCLMLH02oCxWJE0ygIKF/MvAiYz8WP A==;
X-CSE-ConnectionGUID: EQUPw1jDR9ehuxMJ6QODHg==
X-CSE-MsgGUID: ODCRnsURTpuD0t3XvFlrfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73171522"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="73171522"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 05:59:41 -0800
X-CSE-ConnectionGUID: BLQHFpO2QJi/LjPWpJrSYw==
X-CSE-MsgGUID: Pg1sU75FR1i8GEj4g57eHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="214352997"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 05:59:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 05/19] lib/kms: Introduce
 igt_first_crtc_with_single_output()
In-Reply-To: <20260225125108.31119-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
 <20260225125108.31119-6-ville.syrjala@linux.intel.com>
Date: Wed, 25 Feb 2026 15:59:36 +0200
Message-ID: <8f3f17747ff4f592f1a6470b1c38d062229e412e@intel.com>
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
> Several tests just want to find a single CRTC with an output.
> Add a new helper (igt_first_crtc_with_single_output() for it.

Superfluous "(" or missing ")".

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c | 15 +++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 17 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index bec96f2677ad..ee95afc49aa7 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7964,3 +7964,18 @@ igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *di=
splay, uint32_t crtc_id)
>=20=20
>  	return NULL;
>  }
> +
> +igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, ig=
t_output_t **ret_output)
> +{
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +
> +	for_each_crtc_with_single_output(display, crtc, output) {
> +		*ret_output =3D output;
> +		return crtc;
> +	}
> +
> +	*ret_output =3D NULL;
> +
> +	return NULL;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 5a2dd87b509f..ae488bbf4806 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -575,6 +575,8 @@ int igt_display_n_crtcs(igt_display_t *display);
>=20=20
>  const char *igt_crtc_name(igt_crtc_t *crtc);
>=20=20
> +igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, ig=
t_output_t **ret_output);
> +
>  static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum=
 pipe pipe)
>  {
>  	if (pipe =3D=3D PIPE_NONE)

--=20
Jani Nikula, Intel
