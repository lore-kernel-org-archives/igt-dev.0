Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71D0CFD2E4
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 08:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4743910EA88;
	Fri, 11 Oct 2024 08:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="diQSyxdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C6110EA88
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728636521; x=1760172521;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9pRbe2TP4xmURMjxcphN/cYP+4iQKUm4oJaCxh/zbBs=;
 b=diQSyxdhDBS+iHzzKL3NPWts6eQhX5HPU0HYR0X7rdRqB+ZQbb52Y/bH
 nF+gFk7eKr21JOdMTMEMDeNiiGooyc1l16BOkQewXuHZ4RsQOl5QYYNQb
 oyLKp1Ugvr2bwgY5IXZRbX+D9fwdQVEo9Sl0WVF1EdoUPGwrRdNA09Eja
 o3tsZiP3Vuut247Cxrh3Hp56zAghDXRsNsYVSmiYWe31xx1w7BakGOqwX
 geNxjScokt217Rl2mXBV8ZYhAoWAtjW3BGsyn5Rmp3J5gJarfS7bUP2XR
 wIsnrgijIm+M5PjMaLcFeljYbVWIwFPmhr/yFb+kNUHrGXPvDBuwPG1JA A==;
X-CSE-ConnectionGUID: 9TRCKrGWTDOJea19fczftA==
X-CSE-MsgGUID: Fg7enKVISHWD9NOuoPTVPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31729152"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="31729152"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:48:40 -0700
X-CSE-ConnectionGUID: BLEagrfwRbukf0uHkTQo5Q==
X-CSE-MsgGUID: iFofCdwzTD6mb3nCktk8tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76471147"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 01:48:37 -0700
Date: Fri, 11 Oct 2024 10:48:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 4/4] lib/intel: Documnent gem_can_store_dword()
Message-ID: <20241011084835.bzjcs35f3zqin4bb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20241002104515.32164-1-ville.syrjala@linux.intel.com>
 <20241002104515.32164-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002104515.32164-4-ville.syrjala@linux.intel.com>
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
On 2024-10-02 at 13:45:15 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Add basic docs for gem_class_can_store_dword() and
> gem_can_store_dword().
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_gt.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index b8faf2b7bd09..a8f7f4431d1c 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -667,6 +667,13 @@ static bool gem_store_dword_needs_physical(const struct intel_device_info *info)
>  	}
>  }
>  
> +/**
> + * gem_class_can_store_dword:
> + * @fd: open i915 drm file descriptor
> + * @class: engine class
> + *
> + * Is the MI_STORE_DWORD instruction actually usable?

Same here, instead of a question just write: True if ...
or
Returns true if ...

> + */
>  bool gem_class_can_store_dword(int fd, int class)
>  {
>  	uint16_t devid = intel_get_drm_devid(fd);
> @@ -685,6 +692,13 @@ bool gem_class_can_store_dword(int fd, int class)
>  	return true;
>  }
>  
> +/**
> + * gem_can_store_dword:
> + * @fd: open i915 drm file descriptor
> + * @engine: engine
> + *
> + * Is the MI_STORE_DWORD instruction actually usable?

Same here. With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> + */
>  bool gem_can_store_dword(int fd, unsigned int engine)
>  {
>  	return gem_class_can_store_dword(fd,
> -- 
> 2.45.2
> 
