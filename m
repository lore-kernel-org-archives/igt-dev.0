Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AAAD2D10F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 14:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85B910E193;
	Tue, 13 Jan 2026 14:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fe0J6gd5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA9F89ECB
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768314840; x=1799850840;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=XR5Ac3gUq8szkf1xuH0iFqPfB6qSXQWVrCVNL0rociE=;
 b=fe0J6gd5ogsF9mlwM8qhOXejo2I+UxE0osrxV3RIsMHkOyY2lX2Cqs2C
 fIbhBjBpZ0u7oN1Ww4Z8ych3Hv20MvRCw7jOc2jmPe3kfUODoG5fQIN0y
 DJeg1g9glHK0QfV4NxUt/WqDY6eGCdkzNhDyc0lugJn4BSIBsz0lmIpdT
 FqJjGgHoyxNON07w2iCUEuM5MpXybXNZV3VMaXMPgVQvGYYrObM4hBLYE
 AsmHEOzF+OCcGX4c+BnF1DnJMrpZt+4A6wgtWpdq62sZYgilufAeMdlFw
 Hh5YTUs8ZNWqHw57N31FmmLSLRM/d/2obuPCGLBe1U91HqCyaVvhILCPP Q==;
X-CSE-ConnectionGUID: ra274S/jQdascjhn3UnHCg==
X-CSE-MsgGUID: IGfJ1ZbBTy+vhyl9/PjF+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69654011"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69654011"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:33:59 -0800
X-CSE-ConnectionGUID: Hud4SSrpT+yqNFRfM87sIA==
X-CSE-MsgGUID: 3lXshaGeQzKqV3c03Bgd7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="209235172"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:33:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/8] lib/kms: Simplify kmstest_get_vbl_flag()
In-Reply-To: <20260113120439.12577-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
 <20260113120439.12577-6-ville.syrjala@linux.intel.com>
Date: Tue, 13 Jan 2026 16:33:55 +0200
Message-ID: <6a913e4bb702ede2bc990f36f0b4667e030a2dbd@intel.com>
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
> Simplify kmstest_get_vbl_flag() by observing that:
> - '0 << DRM_VBLANK_HIGH_CRTC_SHIFT =3D=3D 0' so we don't
>   have to have special treatment for crtc_offset=3D=3D0
> - the kernel will treat '1 << DRM_VBLANK_HIGH_CRTC_SHIFT'
>   and 'DRM_VBLANK_SECONDARY' identically, so the
>   crtc_offset=3D=3D1 special case can also go away.
>
> DRM_VBLANK_HIGH_CRTC_* was added in 2011, so there is no real
> point in keeping support for old kernels that don't have it.
> And in case someone is crazy enoguh to run igt on a kernel older
> than that we can toss in a DRM_CAP_VBLANK_HIGH_CRTC check into
> igt_display_require().
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 8581a218a83c..3cb1273f3041 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3186,6 +3186,8 @@ void igt_display_require(igt_display_t *display, in=
t drm_fd)
>  	display->drm_fd =3D drm_fd;
>  	is_intel_dev =3D is_intel_device(drm_fd);
>=20=20
> +	igt_require(igt_has_drm_cap(drm_fd, DRM_CAP_VBLANK_HIGH_CRTC));
> +
>  	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
>  		display->is_atomic =3D 1;
>=20=20
> @@ -6125,19 +6127,13 @@ void igt_cleanup_uevents(struct udev_monitor *mon)
>   */
>  uint32_t kmstest_get_vbl_flag(int crtc_offset)
>  {
> -	uint32_t pipe_id;
> +	uint32_t flag;
>=20=20
> -	if (crtc_offset =3D=3D 0)
> -		pipe_id =3D 0;
> -	else if (crtc_offset =3D=3D 1)
> -		pipe_id =3D _DRM_VBLANK_SECONDARY;
> -	else {
> -		uint32_t pipe_flag =3D crtc_offset << 1;
> -		igt_assert(!(pipe_flag & ~DRM_VBLANK_HIGH_CRTC_MASK));
> -		pipe_id =3D pipe_flag;
> -	}
> +	flag =3D crtc_offset << DRM_VBLANK_HIGH_CRTC_SHIFT;
> +
> +	igt_assert_eq(flag & ~DRM_VBLANK_HIGH_CRTC_MASK, 0);
>=20=20
> -	return pipe_id;
> +	return flag;
>  }
>=20=20
>  static inline const uint32_t *

--=20
Jani Nikula, Intel
