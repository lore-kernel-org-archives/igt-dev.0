Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE81EE77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 18:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B8310F00A;
	Fri, 20 Dec 2024 18:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjQbkoOr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332F810F00A
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 18:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734718244; x=1766254244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/Ysct+YEfuy5Na6wPeJK0Cv2DS8KES45G8KLlZKPkks=;
 b=UjQbkoOr+hJE0FZiXWuRMwm0Mfe0VYr4PGpWyZxNdFMLhETnh8rK0iiQ
 MQqfCrLFFg5OGkFzBeyaX+7+2r4x9pa9VxxtuC1OjwNILi7qjjuoaiNnQ
 PCPeWbl3IeXY8gU823SIct7S9YJ89vrM45L6EuiyN2P/52QPCUOc2OeXX
 TWe4qQrBe1UmgnsyOWW+93+GnS+8RCOoC+iHYWpdAwqu/wHh0dtQZuSNb
 ZKRfD/SEBwkfI3inLv6vR01hBVcH833YWNGM+iyyMNQCbb75Z9pbrp4zp
 x2xZbfqJd8/kWXQ725F9fR+k8gCibZ89nmH/+LWjnN18VWV4yLyDPIB4y g==;
X-CSE-ConnectionGUID: uapR9lnNSEyorLl9bzB/nA==
X-CSE-MsgGUID: zS9/EkCbS8WOWBjRNJXTsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="52798398"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="52798398"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:10:44 -0800
X-CSE-ConnectionGUID: hoOOKkjORsuDHQyVhi7Ggg==
X-CSE-MsgGUID: wOXm13VDTkGPMp+guyMxpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103184742"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 10:10:43 -0800
Date: Fri, 20 Dec 2024 19:10:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kmod: Do not explicitly unload intel
 mei driver
Message-ID: <20241220181026.lq6msnxgrcgemy4h@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
 <20241218233830.2444510-2-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218233830.2444510-2-daniele.ceraolospurio@intel.com>
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

Hi Daniele,
On 2024-12-18 at 15:38:30 -0800, Daniele Ceraolo Spurio wrote:
> The mei driver is a child of i915 on discrete, but not on integrated.
> This means we want to unplug it before removing i915 in the former case
> but not in the latter. Therefore, instead of manually unloading the mei
> driver, we can unbind i915 and leave it to the kernel to unplug all the
> dependencies. This also means that we don't need to explicitly disable
> the vtcon anymore.

Will it work also in case of both iGPU + dGPU present?
Should we provide a tool to unload an i915 driver?

Regards,
Kamil

> 
> The other 2 dependencies are left untouched:
> - intel_ips uses symbol_get, so the automatic dependency detection won't
>   unload it.
> - the hotunplug test mentions that the sound driver can throw errors on
>   i915 unbind, so we need to keep the explicit unload.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_kmod.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index a8b0339b9..fa9541d72 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -620,16 +620,9 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>  	const char *aux[] = {
>  		/* gen5: ips uses symbol_get() so only a soft module dependency */
>  		"intel_ips",
> -		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
> -		"mei_pxp",
> -		"mei_hdcp",
> -		"mei_gsc",
>  		NULL,
>  	};
>  
> -	/* unbind vt */
> -	bind_fbcon(false);
> -
>  	ret = igt_audio_driver_unload(who);
>  	if (ret)
>  		return ret;
> @@ -648,6 +641,8 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>  	}
>  
>  	if (igt_kmod_is_loaded(driver)) {
> +		igt_kmod_unbind(driver);
> +
>  		ret = igt_kmod_unload(driver);
>  		if (ret) {
>  			if (who)
> -- 
> 2.43.0
> 
