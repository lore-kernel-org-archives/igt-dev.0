Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DFAC54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 19:49:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65D710FF25;
	Wed, 20 Mar 2024 19:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNPNx2m7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5D210FC3F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710964148; x=1742500148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FuY0RymJUwn35h+LtnZerFmypxFZAWxN9VaaAVsZA20=;
 b=YNPNx2m7qTwEGoz8J446qDk+NwEzT83QAaiXfHcB5Pcru5hQ1AKO4b1c
 Zov4RGmvrr8PV6+m3xgqLROTL+QM9U73c4JFEEDAazSqhFW0w1HOeQyar
 qgJ0EraCQcIOKiTCTVpvcusDaSvtDH3PWOfc/UQzHrq/Lau2VP5exZpb2
 ztL6GYVJ7T66kv4Wk9IDPCQpFWWekjZIAZ9dpC+EE/Ev+4Rw5tVhDX6yC
 d7cc/+XAylChuRX8gg6JEEj5xN+8TrtV6tGxVkMJHXiuSr91C4aV7QDYO
 b/hd2sejvyGhL9sUbyLykUA9rlm40PvWk5oAtqtYO82GzD0k4A9/6vWMN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5800939"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5800939"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="18740925"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.7.80])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:49:04 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dominik Karol =?utf-8?B?UGnEhXRrb3dza2k=?=
 <dominik.karol.piatkowski@intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v14 2/5] lib/drmtest: Introduced
 drm_open_driver_another
Date: Wed, 20 Mar 2024 20:49:02 +0100
Message-ID: <8157623.tOnEmuZJvr@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240320155659.33518-3-kamil.konieczny@linux.intel.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
 <20240320155659.33518-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Hi Kamil,

On Wednesday, 20 March 2024 16:56:56 CET Kamil Konieczny wrote:
> From: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com>
>=20
> For user convenience, introduce drm_open_driver_another as
> a wrapper for __drm_open_driver_another with skip on fail.
> Also add counterpart to open: __drm_close_driver() with
> no warning for non-opened fd.
>=20
> v2: rebased (Kamil)
> v6: reword description (Janusz)
> v10: change assert into skip, add TODO note about atomic reset
>   before tests starts for i915 and on exit path (Janusz)
>   add __drm_close_driver() (Kamil)
>=20
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Signed-off-by: "Dominik Karol Pi=C4=85tkowski" <dominik.karol.piatkowski@=
intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 109 ++++++++++++++++++++++++++++++++++----------------
>  lib/drmtest.h |   2 +
>  2 files changed, 76 insertions(+), 35 deletions(-)
>=20
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 52b5a2020..f8810da43 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -241,6 +241,35 @@ static void modulename_to_chipset(const char *name, =
unsigned int *chip)
>  	}
>  }
> =20
> +static const char *chipset_to_str(int chipset)
> +{
> +	switch (chipset) {
> +	case DRIVER_INTEL:
> +		return "intel";
> +	case DRIVER_V3D:
> +		return "v3d";
> +	case DRIVER_VC4:
> +		return "vc4";
> +	case DRIVER_VGEM:
> +		return "vgem";
> +	case DRIVER_AMDGPU:
> +		return "amdgpu";
> +	case DRIVER_PANFROST:
> +		return "panfrost";
> +	case DRIVER_MSM:
> +		return "msm";
> +	case DRIVER_XE:
> +		return "xe";
> +	case DRIVER_VMWGFX:
> +		return "vmwgfx";
> +	case DRIVER_ANY:
> +		return "any";
> +	default:
> +		return "other";
> +	}
> +}
> +
> +
>  /*
>   * Logs path of opened device. Device path opened for the first time is =
logged at info level,
>   * subsequent opens (if any) are logged at debug level.
> @@ -563,6 +592,27 @@ int __drm_open_driver_another(int idx, int chipset)
>  	return fd;
>  }
> =20
> +/**
> + * drm_open_driver_another:
> + * @idx: index of the device you are opening
> + * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> + *
> + * A wrapper for __drm_open_driver with skip on fail.
> + *
> + * Returns:
> + * An open DRM fd or skips
> + */
> +int drm_open_driver_another(int idx, int chipset)
> +{
> +	int fd =3D __drm_open_driver_another(idx, chipset);
> +
> +	igt_skip_on_f(fd < 0, "No known gpu found for chipset flags %d (%s)\n",
> +		      chipset, chipset_to_str(chipset));
> +
> +	/* TODO: for i915 and idx > 0 add atomic reset before test */

NIT: ... and after test via exit handler, like drm_open does.
BTW, why idx > 0?

Anyway,
Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> +	return fd;
> +}
> +
>  /**
>   * __drm_open_driver:
>   * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> @@ -643,34 +693,6 @@ static void cancel_work_at_exit_render(int sig)
>  	at_exit_drm_render_fd =3D -1;
>  }
> =20
> -static const char *chipset_to_str(int chipset)
> -{
> -	switch (chipset) {
> -	case DRIVER_INTEL:
> -		return "intel";
> -	case DRIVER_V3D:
> -		return "v3d";
> -	case DRIVER_VC4:
> -		return "vc4";
> -	case DRIVER_VGEM:
> -		return "vgem";
> -	case DRIVER_AMDGPU:
> -		return "amdgpu";
> -	case DRIVER_PANFROST:
> -		return "panfrost";
> -	case DRIVER_MSM:
> -		return "msm";
> -	case DRIVER_XE:
> -		return "xe";
> -	case DRIVER_VMWGFX:
> -		return "vmwgfx";
> -	case DRIVER_ANY:
> -		return "any";
> -	default:
> -		return "other";
> -	}
> -}
> -
>  static const char *chipset_to_vendor_str(int chipset)
>  {
>  	return chipset =3D=3D DRIVER_XE ? chipset_to_str(DRIVER_INTEL) : chipse=
t_to_str(chipset);
> @@ -733,12 +755,33 @@ static bool is_valid_fd(int fd)
>  	return false;
>  }
> =20
> +/**
> + * __drm_close_driver:
> + * @fd: a drm file descriptor
> + *
> + * Check the given drm file descriptor @fd is valid and if not,
> + * return -1. For valid fd close it and make cleanups.
> + *
> + * Returns: 0 on success or -1 on error.
> + */
> +int __drm_close_driver(int fd)
> +{
> +	if (!is_valid_fd(fd))
> +		return -1;
> +
> +	/* Remove xe_device from cache. */
> +	if (is_xe_device(fd))
> +		xe_device_put(fd);
> +
> +	return close(fd);
> +}
> +
>  /**
>   * drm_close_driver:
>   * @fd: a drm file descriptor
>   *
> - * Check the given drm file descriptor @fd is valid & Close if it is
> - * an valid drm fd.
> + * Check the given drm file descriptor @fd is valid and if not issue war=
ning.
> + * For valid fd close it and make cleanups.
>   *
>   * Returns: 0 on success or -1 on error.
>   */
> @@ -750,11 +793,7 @@ int drm_close_driver(int fd)
>  		return -1;
>  	}
> =20
> -	/* Remove xe_device from cache. */
> -	if (is_xe_device(fd))
> -		xe_device_put(fd);
> -
> -	return close(fd);
> +	return __drm_close_driver(fd);
>  }
> =20
>  /**
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 588d7da17..bbe5f252f 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -110,12 +110,14 @@ void __set_forced_driver(const char *name);
> =20
>  int __drm_open_device(const char *name, unsigned int chipset);
>  void drm_load_module(unsigned int chipset);
> +int drm_open_driver_another(int idx, int chipset);
>  int drm_open_driver(int chipset);
>  int drm_open_driver_master(int chipset);
>  int drm_open_driver_render(int chipset);
>  int __drm_open_driver_another(int idx, int chipset);
>  int __drm_open_driver(int chipset);
>  int __drm_open_driver_render(int chipset);
> +int __drm_close_driver(int fd);
>  int drm_close_driver(int fd);
> =20
>  int drm_reopen_driver(int fd);
>=20




