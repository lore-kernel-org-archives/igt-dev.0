Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF76E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 20:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4828D10E092;
	Thu, 19 Dec 2024 20:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3DyJbrG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B034710E092
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 20:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734639891; x=1766175891;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7lgQsH8NX8mDnCc0P10zr6M+O+s+xUlql7l2lUJ4JoI=;
 b=b3DyJbrGL3mZHx2Mwlv8+Dbh+4AmrvatQYiSyf/JT9YSu6Zy/qqOFr8N
 NXKfrwyygkZwzuy/BD2xEOhAMCMr6Jkohx7dOiThGHIp/mqy1xHA3V3vz
 7H7CJIxdUYcXzJ2Sj4x/ffNUqAUNL9iSKnJA7wyvItjt1pjYeoTO8eDnH
 Ua/7z2FFZEewt2NB1A7aS75uN7z6PiWF7G2pbbqKPYvOnbipNMnI4wmIq
 YlVI2IyhMYpYYtXEoo0NdPDu0HX8vaMlXlGtCSOr+g0VctYT4aJLUFhCb
 XwKOdXH9/87TCQ3WIO5gbRrYlypHvpZ2f4Zd7VqjVP/eqCH09sQCgDBY/ g==;
X-CSE-ConnectionGUID: Jze1q8Y2TK6scC6MyqUf+Q==
X-CSE-MsgGUID: mDLh5uvSTYylcJUxW62HxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35393081"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35393081"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:24:51 -0800
X-CSE-ConnectionGUID: OKXSwb2MSx2w0zi8JgH16A==
X-CSE-MsgGUID: KN7MAmkoQLCyqPGXbsmpVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98784695"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.82])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:24:45 -0800
Date: Thu, 19 Dec 2024 14:20:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kmod: Do not explicitly unload intel
 mei driver
Message-ID: <pkxihhlzuxpbhkl4woyz5fkri7nmrw7unqtbqwjb2ekeziweru@qwiwezhgwi4j>
References: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
 <20241218233830.2444510-2-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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

On Wed, Dec 18, 2024 at 03:38:30PM -0800, Daniele Ceraolo Spurio wrote:
>The mei driver is a child of i915 on discrete, but not on integrated.
>This means we want to unplug it before removing i915 in the former case
>but not in the latter. Therefore, instead of manually unloading the mei
>driver, we can unbind i915 and leave it to the kernel to unplug all the
>dependencies. This also means that we don't need to explicitly disable
>the vtcon anymore.
>
>The other 2 dependencies are left untouched:
>- intel_ips uses symbol_get, so the automatic dependency detection won't
>  unload it.

and it shouldn't - that's a hack and from the linux-modules perspective
we'd like to drop symbol_get() users. Btw, symbol_get/symbol_put only
guarantees the module can't be removed (since there's code in the kernel
that can still call into them). It doesn't mean the hardware can't go
away (hotplugged or unbound from the driver). The module should be
prepared for that. At the very least, it should handle errors from the
function and release the symbols, but it's probably a candidate for a
component driver.

>- the hotunplug test mentions that the sound driver can throw errors on
>  i915 unbind, so we need to keep the explicit unload.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>

the bigger hammer is blocked on audio driver not getting the refcount
right: https://patchwork.freedesktop.org/series/141532/

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> lib/igt_kmod.c | 9 ++-------
> 1 file changed, 2 insertions(+), 7 deletions(-)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index a8b0339b9..fa9541d72 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -620,16 +620,9 @@ int __igt_intel_driver_unload(char **who, const char *driver)
> 	const char *aux[] = {
> 		/* gen5: ips uses symbol_get() so only a soft module dependency */
> 		"intel_ips",
>-		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
>-		"mei_pxp",
>-		"mei_hdcp",
>-		"mei_gsc",
> 		NULL,
> 	};
>
>-	/* unbind vt */
>-	bind_fbcon(false);
>-
> 	ret = igt_audio_driver_unload(who);
> 	if (ret)
> 		return ret;
>@@ -648,6 +641,8 @@ int __igt_intel_driver_unload(char **who, const char *driver)
> 	}
>
> 	if (igt_kmod_is_loaded(driver)) {
>+		igt_kmod_unbind(driver);
>+
> 		ret = igt_kmod_unload(driver);
> 		if (ret) {
> 			if (who)
>-- 
>2.43.0
>
