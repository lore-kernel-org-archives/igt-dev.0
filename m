Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D8BEA4FAD
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 11:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6849010E2E5;
	Mon, 23 Feb 2026 11:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLm+25cd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AAE10E2E5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771847216; x=1803383216;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=04N/Dr/0hhLKaDnAhvMFFybaWxvqdEmOwaCbzG6udzc=;
 b=kLm+25cd5WDjD/2/wsgqBL5tUXJpTIz971Tzn6QVWUYG7f9wRtLwjpwC
 vN9G4AmXh4RjFhUExhCJe+TKWqB+Gfw3FJAHnb8vRalujuWc3W/hYb8IV
 dKBD+w/mLNUnZzBoNE/i4C8GQR/sx2IHQceYZ6XphCPbR4qpkWHhjs5Fr
 wujJH8pHFDpdw2e5S1HhxPKahAPXoIsVMmJaxPn6M2zG+FJJz/5i/AG3Y
 yBwXy1rDIz/RDo7lnJfUi0txHXSyvxknMZLMDAQdG1KVXEZfqkFKW5WIP
 DSCMajJlka2fEYHTEQzlazA85CRcBvAhVbLP8l1zFW1UcdOOBo6fv2xFO A==;
X-CSE-ConnectionGUID: Fca1yDZOQi+FdD1oAdT9zw==
X-CSE-MsgGUID: du53EPjiRlWvCv97+kbx5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="73015672"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="73015672"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:46:51 -0800
X-CSE-ConnectionGUID: LP9zY2vjR9er22t3z14aaA==
X-CSE-MsgGUID: PhaPzuqeT6qV56lRk3uFhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="246142552"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:46:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 07/23] lib/kms: Add igt_crtc_for_crtc_id()
In-Reply-To: <20260221032003.30936-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-8-ville.syrjala@linux.intel.com>
Date: Mon, 23 Feb 2026 13:46:44 +0200
Message-ID: <2d9fd7ed1b319584cad9d19de3fecb52966acb5f@intel.com>
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

On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Introduce igt_crtc_for_crtc_id() as a helper to return the
> appropriate igt_crtc_t* for a given KMS CRTC ID. This will
> be useful for kms_lease which will need to match the CRTCs
> between the lessor and lessee (each has a different view of
> the same KMS objects, and thus also different igt_display_t).
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 12 ++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 13 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5c48796040a2..bec96f2677ad 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7952,3 +7952,15 @@ bool igt_has_lobf_debugfs(int drmfd, igt_output_t =
*output)
>                                                buf, sizeof(buf));
>          return res =3D=3D 0;
>  }
> +
> +igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_i=
d)
> +{
> +	igt_crtc_t *crtc;
> +
> +	for_each_crtc(display, crtc) {
> +		if (crtc->crtc_id =3D=3D crtc_id)
> +			return crtc;
> +	}
> +
> +	return NULL;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index dedc3f88055b..5a2dd87b509f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -582,6 +582,7 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_displ=
ay_t *display, enum pipe pi
>=20=20
>  	return &display->crtcs[pipe];
>  }
> +igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_i=
d);
>=20=20
>  typedef struct _igt_pipe_crc igt_pipe_crc_t;
>  igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);

--=20
Jani Nikula, Intel
