Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B881DE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 09:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF6510E2A3;
	Thu, 19 Dec 2024 09:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eu7RVUXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FCE10E2A3
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 09:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734601380; x=1766137380;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VYixw8QaxS/FEVarTxQyd3KCLvCkY4CrFxMvtuKCkWw=;
 b=Eu7RVUXlow8HyD9YpJJOKiynRcMjJ6RSPoPh2lKHswZhappSQU4szhbi
 kMpg7gOnfKNO1we8tbUyjviL1s8QXPciNKoetFtY1FNWAQG4RVGeQzugE
 V8+oHjFzyrQ/xzX5YnN7H5gXfY5rg0NHE4WCnRVTdh8Cv66XYOqHKIEHW
 UC1IZdIhFqVbZlyfQFr7MtwxKJ2Rm4t4ueskzwvcnmNVN2ez+JqZQtvA3
 aFRJnj198CsgFbICKU65OwbAfJwLcNolCD+albymRkijCoCRKatXBHV2t
 jRvaLo0bgIAxADEmaw3q1rKHwW6YRLGBFOJdNAkmQ2qkro0LmvDT4OTRT g==;
X-CSE-ConnectionGUID: C5+UldtFS6+VJdb8/CdOaA==
X-CSE-MsgGUID: WsNolCtxSRyo2TUFs4tm1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35232565"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="35232565"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 01:43:00 -0800
X-CSE-ConnectionGUID: Ne8mq0x0T2+LXABY5MHe2A==
X-CSE-MsgGUID: eIxrOfKaT/ynamIbazA2Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129114972"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 01:42:58 -0800
Date: Thu, 19 Dec 2024 10:42:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmod: fix check to confirm correct
 driver unload
Message-ID: <20241219094242.7vzqvvqekt7lv56s@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
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
On 2024-12-18 at 15:38:29 -0800, Daniele Ceraolo Spurio wrote:
> The driver variable is a string, so we need to pass it in as a variable
> for the driver name instead of stringifying it.
> 
> Fixes: e5edf7ea7 ("lib/igt_kmod: add support for Xe driver")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_kmod.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index d58867d7e..a8b0339b9 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -731,7 +731,7 @@ igt_intel_driver_unload(const char *driver)
>  	igt_kmod_unload("drm_kms_helper");
>  	igt_kmod_unload("drm");
>  
> -	if (igt_kmod_is_loaded("driver")) {
> +	if (igt_kmod_is_loaded(driver)) {

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		igt_warn("%s.ko still loaded!\n", driver);
>  		return -EBUSY;
>  	}
> -- 
> 2.43.0
> 
