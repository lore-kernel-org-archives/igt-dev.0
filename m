Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC03AEB28FA
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 09:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761B210E65A;
	Fri,  6 Feb 2026 09:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RN9mh2zH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9199010E65A
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770370472; x=1801906472;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=uQ0ueRQjvPO0fuFrn+KKhyMlyBbEk241Uoy8hK5iKo0=;
 b=RN9mh2zHNeKSr9yYqrMdZ9iKQcLDyfNZtVL3CKHYfugkm+qKYdME9PAW
 HkS5Y7Q3k7L1jVkugDvF2mLiAF2kfAgBQBDHskQ/oWMxOI/TgH+xp0/kI
 cHs/Ykkm23Rzkpf5Js/7+7kJQ69X32DUIy6/dhoOgE3WSHplweRhF8f62
 HlNGHhdAF0iGSlIXWW3dQpvS8BT6aQlcAOQJEColS14X/l6/F1SoB8rJJ
 alyKNqEZjzXfQR2WfD/jbJvq9srrfFnSnjaGXEFWGBvbsFzIrTi23uY51
 9N2vEbEC8xWu1zaYTdu/hsErh9DBCD0gv6ay6UBcrm6sOM894vnv3GvXc w==;
X-CSE-ConnectionGUID: nN+ydGcvQP+svmt0GuEjcg==
X-CSE-MsgGUID: YVI1pJR+TQm5ha4ZTK06bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70592982"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="70592982"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:34:32 -0800
X-CSE-ConnectionGUID: B0Cj/ckOTsu3CMVUyk4skQ==
X-CSE-MsgGUID: 9beJ1+JUSOqOzOkMnyB/BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="241490908"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:34:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 05/12] tests/kms: Clean up some for_each_pipe()
 local 'crtc' variables
In-Reply-To: <20260205133019.9161-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
 <20260205133019.9161-6-ville.syrjala@linux.intel.com>
Date: Fri, 06 Feb 2026 11:34:27 +0200
Message-ID: <4a325c67900bd8ea3180ab19d06203f0b388aea3@intel.com>
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

On Thu, 05 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Move the 'crtc =3D igt_crtc_for_pipe()' to the start of the
> for_each_pipe() loop in order to simplify following
> for_each_pipe()->for_each_crtc() conversions.

The subject implies multiple, but there's just one.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> iterator name for_each_pipe;
> typedef igt_crtc_t;
> identifier PIPE, CRTC;
> expression DISPLAY;
> @@
> for_each_pipe(DISPLAY, PIPE)
> {
> + igt_crtc_t *CRTC =3D igt_crtc_for_pipe(DISPLAY, PIPE);
> ...
> - igt_crtc_t *CRTC;
> ...
> - CRTC =3D igt_crtc_for_pipe(DISPLAY, PIPE);
> ...
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/amdgpu/amd_multidisplay_modeset.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_m=
ultidisplay_modeset.c
> index 6ece43f95adc..000053933e8c 100644
> --- a/tests/amdgpu/amd_multidisplay_modeset.c
> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
> @@ -152,15 +152,14 @@ static void test_init(struct data_t *data)
>  		data->pipe_crc_dprx[i] =3D NULL;
>=20=20
>  	for_each_pipe(display, i) {
> +		igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, i);
>  		igt_output_t *output;
> -		igt_crtc_t *crtc;
>=20=20
>  		/* For each valid pipe, get one connected display.
>  		 * This will let displays connected to MST hub be
>  		 * tested
>  		 */
>  		output =3D igt_get_single_output_for_pipe(display, i);
> -		crtc =3D igt_crtc_for_pipe(display, i);
>  		data->primary[i] =3D igt_crtc_get_plane_type(crtc,
>  							   DRM_PLANE_TYPE_PRIMARY);
>  		data->output[i] =3D output;

--=20
Jani Nikula, Intel
