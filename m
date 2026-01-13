Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61DFD2D10F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 14:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F5410E1F0;
	Tue, 13 Jan 2026 14:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNbNBSwz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3FA89ECB
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768314730; x=1799850730;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=r8VmRjYNlvP81aW6g8/y14I/uQlvbV74cCJAkZO7tjA=;
 b=bNbNBSwza2uJgfvgZgniDFIOPVnNduorBiBq4meqpw3FfIDr4fjAW37f
 BjnIkNCDcBMZUdxPo+N5G89GzgmzQ35T+21BqOLFne6DD1XdhBQJ2XdRi
 9XjHL9kIHDA1kg12oe380wbXeuOMhOZSpG1XbpNk3dZ1V9+yOlhZcFZRR
 1n4GAQmur398cSZVFTKNDmxGGkBj3NLrPaJa8+LurHoWnHHqLRpQcXiRL
 kz67TUvooGLED4cm+MJ9JsbjUej45zG+9JiJ6en70Fl/YZ7eUlFs2d/IO
 HZOpQAD/ynmCMEF+bMPBOxzRLiBXKe8vjPtHZNi+D3Pr1z0ngNjApQX1W A==;
X-CSE-ConnectionGUID: QQklLQ1ITE+kSNWyBp0UiQ==
X-CSE-MsgGUID: nia+C/akRAi2RyeQsw1DRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="57155119"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="57155119"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:32:10 -0800
X-CSE-ConnectionGUID: vVDTPpBARkCVO4Img46Kpg==
X-CSE-MsgGUID: R21yEDsrRxeuq+DJDrl9dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="203614358"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:32:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/8] tests/kms_rotation_crc: s/0/PIPE_A/
In-Reply-To: <20260113120439.12577-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
 <20260113120439.12577-4-ville.syrjala@linux.intel.com>
Date: Tue, 13 Jan 2026 16:32:06 +0200
Message-ID: <e09b753734b0a3325b8b6cc8ea2b00674d45d368@intel.com>
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

On Tue, 13 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Pass 'PIPE_A' instead of '0' to test_multi_plane_rotation()
> since it takes an 'enum pipe'.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/kms_rotation_crc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index c0642a389121..b1765b4c75e5 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -1312,7 +1312,7 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  		data.planepos[1].origo =3D p_top | p_right;
>  		data.planepos[1].x =3D -.4f;
>  		data.planepos[1].y =3D .1f;
> -		test_multi_plane_rotation(&data, 0);
> +		test_multi_plane_rotation(&data, PIPE_A);
>  	}
>=20=20
>  	igt_describe("Rotation test on both planes by cropping left/top corner =
of primary plane and"
> @@ -1326,7 +1326,7 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  		data.planepos[1].origo =3D p_top | p_right;
>  		data.planepos[1].x =3D -.15f;
>  		data.planepos[1].y =3D -.15f;
> -		test_multi_plane_rotation(&data, 0);
> +		test_multi_plane_rotation(&data, PIPE_A);
>  	}
>=20=20
>  	igt_describe("Rotation test on both planes by cropping left/bottom corn=
er of primary plane"
> @@ -1340,7 +1340,7 @@ int igt_main_args("", long_opts, help_str, opt_hand=
ler, &data)
>  		data.planepos[1].origo =3D p_bottom | p_right;
>  		data.planepos[1].x =3D -.15f;
>  		data.planepos[1].y =3D -.20f;
> -		test_multi_plane_rotation(&data, 0);
> +		test_multi_plane_rotation(&data, PIPE_A);
>  	}
>=20=20
>  	/*

--=20
Jani Nikula, Intel
