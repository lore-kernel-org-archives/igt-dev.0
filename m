Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C715CC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 16:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48806112301;
	Mon,  4 Mar 2024 16:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfW+00Uj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34C3112300
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709569354; x=1741105354;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UxZAG2/ZEGR7wwTtVSp8+rCUrBZxhfEIllcyK+B4+fs=;
 b=KfW+00UjDecGGXEt40zDoo2HKWeXJQMI8p1us9o2lRG3n6618/nxZzg0
 pxVHBYfmttYlM9q4OYoYjj91RHEwzXFk0E6+NGoAy0zIAg6kJVfeeCMNe
 uCJwpa8ucKuAVJhALqzbyxcCMruh4mXJ9GxfbHl+/pmfECafj5Vxx7esK
 prPuomJAvCTu8rfHHhyu08tPbEP4U/UIVYv9XlsTKbBzjCw1f5U4r+MMX
 jutZRowFlGg1zdbd8Sz9ZXtzgj6nyPvRhAukHpZrOp03wejiqGdbQvlQd
 3iD0ZSc5/hQ1FxQuYyGigqqlkRghw2MJQH65gEHQSv8GHc6slmyNBKNZr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15217672"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15217672"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:22:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9182244"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 08:22:29 -0800
Date: Mon, 4 Mar 2024 17:22:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Enable DRM_CLIENT_CAP_ATOMIC
 before enabling DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
Message-ID: <20240304162225.lnagoe4biwvddmdo@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>
References: <20240215-duplicate-calls-v1-0-512afbe1bda7@riseup.net>
 <20240215-duplicate-calls-v1-1-512afbe1bda7@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240215-duplicate-calls-v1-1-512afbe1bda7@riseup.net>
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

Hi Arthur,
On 2024-02-15 at 16:21:04 -0300, Arthur Grillo wrote:
> As stated at [1], we first need to set DRM_CLIENT_CAP_ATOMIC before
> setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS. Fix that.
> 
> [1]: https://docs.kernel.org/gpu/drm-uapi.html?highlight=writeback#c.DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
> 
> Fixes: 3642acbb74f5 ("lib/igt_kms: Add writeback support")
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kms.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 1b4d0d7612a2..e18f6fe59882 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2747,6 +2747,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	display->drm_fd = drm_fd;
>  	is_intel_dev = is_intel_device(drm_fd);
>  
> +	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
> +		display->is_atomic = 1;
> +
>  	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
>  
>  	resources = drmModeGetResources(display->drm_fd);
> @@ -2795,8 +2798,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	}
>  
>  	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> -	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
> -		display->is_atomic = 1;
>  
>  	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>  		display->has_virt_cursor_plane = 1;
> 
> -- 
> 2.43.0
> 
