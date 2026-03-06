Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34545F01828
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 11:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A784F10ECEE;
	Fri,  6 Mar 2026 11:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9g0p29n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393A010ECEE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 11:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772795879; x=1804331879;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=66/dDvAYC1qmck08sT4sJFqA4EKptfPwKCqLiXpHDes=;
 b=Z9g0p29nIZ5vnlYiwzoIj3DD5Xh10OSuxATOj9feBn1q1msnWyJ/+LeY
 ZbdLZ3JsXBj/B5xE3cqGPj4O/AFw67VgFUYFDfJvKbrkDDktRTdmfOz31
 M6oDyspwfRuVndOhK/Kd9ADs9qhn7bIfsMFEOR6C/tEkXvwIcP6eCYcbr
 BO+oE/n6ovoUblSuanr1AiAJucVJ3gKXGyxQwHlmclsSMaRfeFrDbpVWQ
 uQ7JMKD8+JVD3M+k5UOISCLPhRRMJiT8XcsTas6kubEWWi3dWkuY6TATB
 D8Yu/bO9L/DZkc+POhiSn7Tqra1v+bHXFlJBpjmIiOrIGkqXkw033scVv A==;
X-CSE-ConnectionGUID: m5vRiGjmRAa2RPVnIi5mtw==
X-CSE-MsgGUID: DxxMKxbsQK661vZYaS+Cjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91476139"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="91476139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:17:59 -0800
X-CSE-ConnectionGUID: 8CRpKdg0TB+GqWKU/ewAUw==
X-CSE-MsgGUID: /lNW4D/HQsyV9so+daFmAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="216124554"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:17:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] lib/kms: Make igt_first_crtc() skip if no
 CRTCs are around
In-Reply-To: <20260305134038.6995-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
 <20260305134038.6995-5-ville.syrjala@linux.intel.com>
Date: Fri, 06 Mar 2026 13:17:54 +0200
Message-ID: <0d1cff70993e04c94fa2e5d77aaafcb60626661b@intel.com>
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

On Thu, 05 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Everyone using igt_first_crtc() really needs a CRTC, and thus
> we should just skip if none are around.
>
> Most of the callers neglected to even require the non-NULL
> CRTC, but I think all of the do want a CRTC.

*them

Yeah, I think they'd NULL pointer dereference if this returned NULL.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Maybe igt_display_require() should even require at least one
> CRTC, but let's do this one small step at a time.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c       | 2 ++
>  tests/nouveau_crc.c | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 9ebf77b74d04..a9673a9a6565 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7996,6 +7996,8 @@ igt_crtc_t *igt_first_crtc(igt_display_t *display)
>  	for_each_crtc(display, crtc)
>  		return crtc;
>=20=20
> +	igt_skip("No CRTCs on device\n");
> +
>  	return NULL;
>  }
>=20=20
> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> index b71aac45bb79..cad7edc38f20 100644
> --- a/tests/nouveau_crc.c
> +++ b/tests/nouveau_crc.c
> @@ -402,7 +402,6 @@ int igt_main()
>  		     "is reset to its default value after a single capture.");
>  	igt_subtest("ctx-flip-threshold-reset-after-capture") {
>  		data.crtc =3D igt_first_crtc(&data.display);
> -		igt_require(data.crtc);
>=20=20
>  		run_test(&data, test_ctx_flip_threshold_reset_after_capture);
>  	}

--=20
Jani Nikula, Intel
