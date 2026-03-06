Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12547F01827
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 11:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81CA889BE;
	Fri,  6 Mar 2026 11:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIXl0ajb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CF8889BE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 11:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772795678; x=1804331678;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=MiuXjCgLmzvu5z3TjFrECtgpR3Bqwm1OWlyIAAAQwME=;
 b=lIXl0ajbW3h0G2wDfvLiHoJgbvwBolEtUkhWCAp8QZ8HFg32TLTewMZT
 j8PjGGT3da/2YjJcRC0gEslJWLxYFhPEwyT6eLywadANXgEseB07VZqwo
 3wfxuSTPgNBFFnZ1FgT59bcT13k7Zt2mRJ+SANMEUEu3rs6rYKVlClRlP
 BR/CHCQUpxsNk49639xGkTmM5s1jn3B5D3c5HTlyu/TlHHAVPXpEjRjtJ
 vau30g2tykHpTghLF14eXkyvUKGeq8/o/kqDCLyoUc04g1XglRUQEW7kJ
 Oc7DI7mAgnCwpnLCZiXtS3nD+7ahxjB4C0aB/B7XDUl/wHINOnGP4KyKY g==;
X-CSE-ConnectionGUID: J4AXj70qQu+CrsQ+7n7nGQ==
X-CSE-MsgGUID: +xnb7C3+R/Wk2fkeZbRviw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84538022"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="84538022"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:14:38 -0800
X-CSE-ConnectionGUID: BGNx4a2xSOioVyXs85h+yQ==
X-CSE-MsgGUID: aSZWl0NeTOm7lRuVR5ntTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="249454407"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:14:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH i-g-t 3/5] tests/nouveau_crc: Use igt_first_crtc()
 instead of igt_crtc_for_pipe()
In-Reply-To: <20260305134038.6995-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
 <20260305134038.6995-4-ville.syrjala@linux.intel.com>
Date: Fri, 06 Mar 2026 13:14:32 +0200
Message-ID: <6f6c72be92fe93bdc7e531eecbfd8c16a0ff094e@intel.com>
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
> The specific CRTC used for the ctx-flip-threshold-reset-after-capture
> subtest supposedly doesn't matter, so find one using the more hardware
> agnostic igt_first_crtc() rather than igt_crtc_for_pipe().

In all likelyhood they're the same thing anyway.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/nouveau_crc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> index 59fa8a2daeb8..b71aac45bb79 100644
> --- a/tests/nouveau_crc.c
> +++ b/tests/nouveau_crc.c
> @@ -401,8 +401,8 @@ int igt_main()
>  	igt_describe("Make sure that the CRC notifier context flip threshold "
>  		     "is reset to its default value after a single capture.");
>  	igt_subtest("ctx-flip-threshold-reset-after-capture") {
> -		data.crtc =3D igt_crtc_for_pipe(&data.display, PIPE_A);
> -		igt_require(data.crtc->valid);
> +		data.crtc =3D igt_first_crtc(&data.display);
> +		igt_require(data.crtc);
>=20=20
>  		run_test(&data, test_ctx_flip_threshold_reset_after_capture);
>  	}

--=20
Jani Nikula, Intel
