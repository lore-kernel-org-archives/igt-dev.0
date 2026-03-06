Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F4FF01828
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 11:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FDE10ECF0;
	Fri,  6 Mar 2026 11:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nycbl1dX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0AC10ECEE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772795969; x=1804331969;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=93IQ/+laTFV//c7RZpsKSh4mTwlB4Atl2kyV1xT1ZJw=;
 b=Nycbl1dXeOwseVam0cwgntgFXRtw+vf6h5StjH5g7kYe5tjpTXmPdhoU
 4A/2lwyJb5vbBuTq1GFxIR95PpxQbgPU+IJbkOzRXBiI3DKEeEjzi7Rxx
 tPHdHSi738bWkh7UOliF8PBjEN+UHIdM3G5aOxKLnnUchtm39oyY4J4f/
 bxETHL2HQTIU4S3kjb0vZrEF2ZgiUCHYBaHNUnFBSs3aGiXbAzoiGkDWq
 xoTsHDCbrgESGlBHRPmE1S5rIjtkrF9MqvCMPoZJ46K/Yz+sXa2xLoaxI
 EiLU6yPtgyOnlgNIWPtgeUNkVvdSYX8myY1d2I0dmekP7sc7w6bWK5YVs Q==;
X-CSE-ConnectionGUID: w70J5cAaRKaMfrlpL1ASeg==
X-CSE-MsgGUID: +2+xwEZMRtawA7k/miInuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91476242"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="91476242"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:19:29 -0800
X-CSE-ConnectionGUID: OeXMvRBlTsuQeUiQTBGgnA==
X-CSE-MsgGUID: nqgTpmD+RtmVnp6FfibGlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="216124730"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:19:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/5] lib/kms: Make
 igt_first_crtc_with_single_output() skip if no CRTC/output can be found
In-Reply-To: <20260305134038.6995-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
 <20260305134038.6995-6-ville.syrjala@linux.intel.com>
Date: Fri, 06 Mar 2026 13:19:24 +0200
Message-ID: <fe5e58dbc31560e26cad31d29e0d311ab09cb23d@intel.com>
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
> Have igt_first_crtc_with_single_output() skip if a suitable CRTC/output
> combination can't be found. All callers currently skip based on the
> return value.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c                | 2 ++
>  tests/intel/gem_exec_reloc.c | 1 -
>  tests/kms_plane.c            | 1 -
>  tests/kms_plane_scaling.c    | 1 -
>  4 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a9673a9a6565..c302021be9b1 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8019,6 +8019,8 @@ igt_crtc_t *igt_first_crtc_with_single_output(igt_d=
isplay_t *display, igt_output
>  		return crtc;
>  	}
>=20=20
> +	igt_skip("No valid CRTC/output combinations\n");
> +
>  	*ret_output =3D NULL;
>=20=20
>  	return NULL;
> diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
> index ed4e77ec93d3..e480337a0bd8 100644
> --- a/tests/intel/gem_exec_reloc.c
> +++ b/tests/intel/gem_exec_reloc.c
> @@ -1517,7 +1517,6 @@ static void scanout(int i915,
>  	igt_display_reset(dpy);
>=20=20
>  	crtc =3D igt_first_crtc_with_single_output(dpy, &output);
> -	igt_require(crtc);
>=20=20
>  	igt_output_set_crtc(output, crtc);
>=20=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 6a78c9ff0941..98705a897205 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1364,7 +1364,6 @@ static void test_planar_settings(data_t *data)
>  	}
>=20=20
>  	crtc =3D igt_first_crtc_with_single_output(display, &output);
> -	igt_require(crtc);
>=20=20
>  	igt_output_set_crtc(output, crtc);
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index ab619fb2b532..8d34619b328f 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1181,7 +1181,6 @@ static void invalid_parameter_tests(data_t *d)
>=20=20
>  	igt_fixture() {
>  		crtc =3D igt_first_crtc_with_single_output(display, &output);
> -		igt_require(crtc);
>=20=20
>  		igt_output_set_crtc(output, crtc);
>  		plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);

--=20
Jani Nikula, Intel
