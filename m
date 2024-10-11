Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A76CFD2E0
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 08:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F220210EA87;
	Fri, 11 Oct 2024 08:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwHcCMzy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCE910EA88
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728636319; x=1760172319;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UkKDhTL7e271KkzFMUYiFfq43E+ivjFeurAJ6JjF4ws=;
 b=OwHcCMzykQeEuPLvfcePF+VeLVTpl0LO/SuxmX4WcZAW6fvjvnVFBvuY
 eJtn07HxJWHX2lNcGI0lq5RLD1gzQivYPnyTQg1zB/1V5USNpMSEGEp/n
 m9XNUrvYa1vua2ihYfo/p1qUmXuLdG9Qcol2Fwc2EPy40WCWl1ZR4zX5q
 WOmIdJ/UzD9oi909Hp8UmTcuo65PzqV3uCzPALehDmqLoVhdYMO1H8dVb
 cRmbX2atUO4gTCGLaUIaMxnUGUGjfAp+e/TXKTmI/mMWI9UAfDq7/C4Di
 XxvvHkabtjti6MXDorBJ8si4P9mn/xNlK0Q/NVeabdoSKlKQXuJiaK460 Q==;
X-CSE-ConnectionGUID: 59koFOweQzOLk0Vf6npJdg==
X-CSE-MsgGUID: AHqDCqdLT5e2guvTP6UqpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="15649992"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="15649992"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:45:19 -0700
X-CSE-ConnectionGUID: 5t0ZNKiqStmyiEEm2h+j2g==
X-CSE-MsgGUID: ClZrXybnRgW/qK1Gs/oEJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76850679"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 01:45:18 -0700
Date: Fri, 11 Oct 2024 10:45:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/4] lib/intel: Extract
 gem_store_dword_needs_physical()
Message-ID: <20241011084516.tlnk25rb73yssqec@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20241002104515.32164-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002104515.32164-1-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-10-02 at 13:45:12 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Extract a small helper that can determine if MI_STORE_DWORD
> operates with physical addresses or not.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_gt.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index 9641a6610bf2..331783e49acf 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -655,21 +655,27 @@ unsigned intel_detect_and_clear_missed_interrupts(int fd)
>  	return missed;
>  }
>  
> +static bool gem_store_dword_needs_physical(const struct intel_device_info *info)
> +{
> +	switch (info->graphics_ver) {
> +	case 2:
> +		return true;
> +	case 3:
> +		return info->is_grantsdale || info->is_alviso;
> +	default:
> +		return false;
> +	}
> +}
> +
>  bool gem_class_can_store_dword(int fd, int class)
>  {
>  	uint16_t devid = intel_get_drm_devid(fd);
>  	const struct intel_device_info *info = intel_get_device_info(devid);
>  	const int ver = info->graphics_ver;
>  
> -	if (ver == 0) /* unknown, assume it just works */
> -		return true;
> -
> -	if (ver <= 2) /* requires physical addresses */
> +	if (gem_store_dword_needs_physical(info))
>  		return false;
>  
> -	if (ver == 3 && (info->is_grantsdale || info->is_alviso))
> -		return false; /* only supports physical addresses */
> -
>  	if (ver == 6 && class == I915_ENGINE_CLASS_VIDEO)
>  		return false; /* broken, unbelievably broken */
>  
> -- 
> 2.45.2
> 
