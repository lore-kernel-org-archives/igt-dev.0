Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A27E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 18:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A2C10E09D;
	Fri, 20 Dec 2024 18:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwhLxzTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56F810E09D
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 18:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734717757; x=1766253757;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QYm4TcuyT0qJZuz2CUmKfr78phP6x2mddbtQ9nRF8TU=;
 b=nwhLxzTIrCBTS659m7gL+32D1rtGPT78oFcbBIXIBoMI/Q85vdmwYUiA
 pxod2F9intQVNow1ZO52nLA8b/86bFticP0QmP1qZLwU8nFVyMP0DuCn1
 J10KYLsgIHIgx566CL2qsepFdC3wqXzF5pF5APV0o20IllTfGLePGu7Hc
 33LRZiSyXzH/BCzGleXN8uK2xoRQIZJpfqmUmT4rUyum22KrwhnJBt1KA
 mNbhKzEaaY2tPVqO/a8+r5kik8QRIYlnMyw4wzfQqOGmO8cT2lyPYjwH8
 h8losSyLXtRayNZhJRcm7gg31dwpKcrnjoAngW0CPPDgreBv4DzteEoER g==;
X-CSE-ConnectionGUID: IxbsfIItRxeWafDilfo/lg==
X-CSE-MsgGUID: vfa3DzwMRfSKvXT6z1+Jyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="22864742"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="22864742"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:02:36 -0800
X-CSE-ConnectionGUID: lBK0EYDTQ/mXeeBLnWdOEg==
X-CSE-MsgGUID: CNFFBqLpRaawm2CCn+zBZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98624583"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.159])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:02:35 -0800
Date: Fri, 20 Dec 2024 19:02:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [i-g-t, v2, 1/3] lib/igt_kmod: fix check to confirm correct driver
 unload
Message-ID: <Z2WxOK7DtA4ALf9K@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
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

On 2024-12-19 at 15:05:15 -0800, Daniele Ceraolo Spurio wrote:
> The driver variable is a string, so we need to pass it in as a variable
> for the driver name instead of stringifying it.
> 
> Fixes: e5edf7ea7 ("lib/igt_kmod: add support for Xe driver")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Could it be merged first as an abvious fix?

Regards,
Kamil

> ---
>  lib/igt_kmod.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index ed283c14b..d73cb4101 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -723,7 +723,7 @@ igt_intel_driver_unload(const char *driver)
>  	igt_kmod_unload("drm_kms_helper");
>  	igt_kmod_unload("drm");
>  
> -	if (igt_kmod_is_loaded("driver")) {
> +	if (igt_kmod_is_loaded(driver)) {
>  		igt_warn("%s.ko still loaded!\n", driver);
>  		return -EBUSY;
>  	}
