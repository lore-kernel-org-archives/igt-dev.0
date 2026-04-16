Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A344F8D753
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 15:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1188510E139;
	Thu, 16 Apr 2026 15:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHaf4Vdm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43EB10E139
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776354252; x=1807890252;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=0qDWcLb1/p/+2F/1BDGasB23Y6q674PCn2VTTb9gVnY=;
 b=EHaf4VdmmduZli5GzMb8NMg/4RZvEw5rmmOCubOLz94SlGhhMedQ8ZLc
 TIKf8TA6kWH8d3pPq4Epd5vCv/O9xcpYrzabZhSiK0Vic/hH/WXk1EPrT
 2YBcRvGq6t3h0FmAjX/x62WpN7aMlo7SbkXNykU2qJCahrLXNjidkNZM3
 hgxBgKpfE5it2Fj0IDp6Q0hobkOh7Ro5/SSj1EjeytoirpnON92fi0MKa
 nN9ceOAMTHAf1qBaVruDIK3lKnCA5G7iDq2wVCPyPHSJ7ENzOcMIr0y7Z
 VzgvKaun5/CtlPwCc6bVrW23I11oUC6ccExcm1fSDUvOM9NLykuTx9qNn w==;
X-CSE-ConnectionGUID: h5pjmKyuTnST+vEk6sNMrA==
X-CSE-MsgGUID: 6inC4gEGQBy31UXSMuDFUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77265034"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77265034"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:44:11 -0700
X-CSE-ConnectionGUID: TNwmtNxFT5mlD7ZR0155HQ==
X-CSE-MsgGUID: Oya92PqPRjauEOWUGG42Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="230694464"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:44:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] lib/kms: Introduce for_each_plane_format()
In-Reply-To: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
Date: Thu, 16 Apr 2026 18:44:05 +0300
Message-ID: <0883b9b3996df973ab8856363c77281ea51a079c@intel.com>
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

On Thu, 16 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> A few places want to iterate just the formats supported by a plane,
> ignoring the modifier aspect entirely. Add a new iterator for this
> (for_each_plane_format()) to avoid everyone just open coding it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index fcbb6a5ade3a..a58cb5cd3430 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -816,6 +816,18 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt_di=
splay_t *display,
>  	     (mode) < &(output)->config.connector->modes[(output)->config.conne=
ctor->count_modes]; \
>  	     (mode)++)
>=20=20
> +/**
> + * for_each_plane_format:
> + * @plane: a pointer to an #igt_plane_t structure
> + * @format: format iterator
> + *
> + * This for loop iterates over all formats supported by @plane.
> + */
> +#define for_each_plane_format(plane, format) \
> +	for (int __i =3D 0; __i < (plane)->drm_plane->count_formats; __i++) \
> +		for_each_if (((format) =3D (plane)->drm_plane->formats[__i], \
> +			      1))

Using kernel-style __UNIQUE_ID() for __i would be nice to have, but I
guess we don't have that facility in IGT.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> +
>  #define IGT_FIXED(i,f)	((i) << 16 | (f))
>=20=20
>  /**

--=20
Jani Nikula, Intel
