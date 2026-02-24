Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA081E9B262
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7EC10E034;
	Tue, 24 Feb 2026 13:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEs1z6ec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D89110E034
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771940898; x=1803476898;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=EqGoNexuqTH0uaVjTAYn3dyDrKtw676DNirPKHJFtKo=;
 b=nEs1z6ec14keAQTi3Ivo/xy2qhSOgEnEs9jQRX4b6UphZKiR9GyGvdJC
 brmH/AvJSbOgB9WXswfPLPXSnScVrkvuQLcfsj8lBzsKKjFOExkCgXY/7
 id/TsvyjSAc6Vm/sujRmW4B6GXuBaS/Yd9Z7exdcelLkBLZIlb1c8qgwB
 Uh3sWod/tHNk8EFJcEGyGeNEGOBaXuI5WyugtR/06GMMi2JtJZDmrY1ml
 iVzHjUWBjQv/2qOaNL7oaVGvPB/Gt3aRshXKzQU8eqOQa7XhFbTpgMo1Y
 e80CYKiG9295oIoz2ldEDSJOvOzA/NJTCrbwg+bXwJtIcCao82S5eqBml A==;
X-CSE-ConnectionGUID: fx/SRE09SIiFCwL/jvs/6Q==
X-CSE-MsgGUID: iZspusYkTv6k2lK9Shnjyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76563187"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76563187"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:48:18 -0800
X-CSE-ConnectionGUID: Cg2WZnCLRuqle6GROq6dgw==
X-CSE-MsgGUID: qV4ngApBS6+F/lJIKUwXQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="253639299"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:48:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 15/23] tests/kms_plane_multiple: Use igt_crtc_t
 instead of enum pipe
In-Reply-To: <20260221032003.30936-16-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-16-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 15:48:13 +0200
Message-ID: <76b6d4764d2864f5de61d91412b46ec0343cc13b@intel.com>
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
> Convert kms_plane_multiple from 'enum pipe' to 'igt_crtc_t'.
>
> The use of multiple crtcs in some places causes some extra
> complications here.
>
>  #include "scripts/iterators.cocci"

...

> @@ -554,8 +567,9 @@ static void run_2_display_test(data_t *data, uint64_t=
 modifier, const char *name
>  						       igt_crtc_name(crtc2),
>  						       output2->name)
>  						test_plane_position_2_display(data,
> -									      crtc->pipe,
> -									      crtc2->pipe,
> +									      crtc
> +									      ,

I wonder what happened here with the newlines. Can be fixed while
applying.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +									      crtc2,
>  									      output1, output2,
>  									      modifier);
>=20=20
> @@ -584,7 +598,9 @@ static void run_test(data_t *data, uint64_t modifier,=
 const char *name)
>  			continue;
>=20=20
>  		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name)
> -			test_plane_position(data, crtc->pipe, output,
> +			test_plane_position(data,
> +					    crtc,
> +					    output,
>  					    modifier);
>  	}
>  }

--=20
Jani Nikula, Intel
