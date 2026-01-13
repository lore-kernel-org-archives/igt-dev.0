Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C41BD2D10A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 14:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD1210E4EE;
	Tue, 13 Jan 2026 14:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vt0bFXkv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D34610E356
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 14:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768314760; x=1799850760;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=4lX9uhXqZUjPBPgLdzE4m5ZvAKGibeZc22I44TEBuj8=;
 b=Vt0bFXkv5saz6XVeQAtM4osZKBdfk5xfHKX/aUIkNFI+aGxF4cNYWUs9
 shdtJvHo7WBag/VVDtB5dWGO4untYTqdQmGQUMpTyqZsyF4KGwVnI6LPX
 pM8c3mo1NqrY/DzXnIYmdj4+9IknErXdbptOXjs4SrBBuevJrTGZYA1oi
 kzTwY6cZdOHPP+HdmX8h4Xl1V0XMFpdBym8rRXO2LJp/BokXgezIpYqbj
 KR3wLXCTqPuid6wd1EpcOY4gn4aP9pd1H9WkhgVzkO4w5Vwdg6f0MEdKx
 mef4q/AGq3cAsbbWqukuswH94Zdtu95lEsl1IXlEz3HkSPxqhEsSAkfgX w==;
X-CSE-ConnectionGUID: GTuU4HjYSoWIWbXK1OzTww==
X-CSE-MsgGUID: pprAbBBmQ7KKSr0SK8V0hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="57155148"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="57155148"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:32:39 -0800
X-CSE-ConnectionGUID: OhI06oY2R9OjhqxkON76AQ==
X-CSE-MsgGUID: MNnnbroGQ22VhpNOqq1muw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="203614441"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:32:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/8] lib/kms: Nuke pipe_select()
In-Reply-To: <20260113120439.12577-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
 <20260113120439.12577-5-ville.syrjala@linux.intel.com>
Date: Tue, 13 Jan 2026 16:32:36 +0200
Message-ID: <f907a55fa673f67d50fda112aa9ec811630b32e6@intel.com>
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
> pipe_select() is just a second implementation of
> kmstest_get_vbl_flag(). Get rid of the duplicated
> function.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 77b3ae2afa01..8581a218a83c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2484,16 +2484,6 @@ int kmstest_get_crtc_idx(drmModeRes *res, uint32_t=
 crtc_id)
>  	igt_assert(false);
>  }
>=20=20
> -static inline uint32_t pipe_select(int pipe)
> -{
> -	if (pipe > 1)
> -		return pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
> -	else if (pipe > 0)
> -		return DRM_VBLANK_SECONDARY;
> -	else
> -		return 0;
> -}
> -
>  /**
>   * kmstest_get_vblank:
>   * @fd: Opened drm file descriptor
> @@ -2509,7 +2499,7 @@ unsigned int kmstest_get_vblank(int fd, int pipe, u=
nsigned int flags)
>  	union drm_wait_vblank vbl;
>=20=20
>  	memset(&vbl, 0, sizeof(vbl));
> -	vbl.request.type =3D DRM_VBLANK_RELATIVE | pipe_select(pipe) | flags;
> +	vbl.request.type =3D DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(pipe) |=
 flags;
>  	if (drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl))
>  		return 0;

--=20
Jani Nikula, Intel
