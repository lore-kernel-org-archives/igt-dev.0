Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC4BE7718B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 19:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F0110F046;
	Fri, 20 Dec 2024 19:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BImKctTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401F510F046
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 19:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734722264; x=1766258264;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/RX5AE8n50mUP2t9lmnX3xffRZVYCmCG4dsCb8Kknps=;
 b=BImKctTh0ZnUPV4d6+oxWW71zbcDUNZtmd0stiXVglghDtzM+HnrWdzr
 R70j6hMJn/Jxyi+HuykoT7XTCzdcfW9CQDNdgEl6I2IJZ85gpLezj8yOD
 YgGyNyaay432jpB0PuyiyGrdRWrVf2v/DqRL/dcf4h0Dz0WdTGgkswo7m
 iQs/4sFMkrd5r0Y9paXPu5FUONukrnx2Rcohyxi04G0sAP/YdrTZPphq1
 vKmdQmNGpTMLQrZTTvukGn+W0QW1L+LKSAeE87LpxNrZq5be3bCINy3uG
 xxySDbUnJcYL/U7B5QWdfV5ZmPQXg2qqGFAfGhgzts6uoPu1s2rnravno A==;
X-CSE-ConnectionGUID: bIE1Yt3jQXCXIwYT+fA1Kw==
X-CSE-MsgGUID: y0otwHN1TOSsqMn1W5Weaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46659397"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="46659397"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:17:44 -0800
X-CSE-ConnectionGUID: G5EdG6G6Tk2iSgH6Tmv8aw==
X-CSE-MsgGUID: v8Bk3QBXSaqotfMkruPzMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99431457"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.128])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:17:44 -0800
Date: Fri, 20 Dec 2024 13:17:38 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kmod: Do not explicitly unload intel
 mei driver
Message-ID: <i5ykz5kbxykmx63quplww7ixetbjhixwxashtxm7p3hxzz42xg@f3t74nmhilam>
References: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
 <20241218233830.2444510-2-daniele.ceraolospurio@intel.com>
 <20241220181026.lq6msnxgrcgemy4h@kamilkon-desk.igk.intel.com>
 <f48f64de-0c08-492f-bcfa-8fdcd674bffd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f48f64de-0c08-492f-bcfa-8fdcd674bffd@intel.com>
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

On Fri, Dec 20, 2024 at 11:09:39AM -0800, Daniele Ceraolo Spurio wrote:
>
>
>
>On 12/20/2024 10:10 AM, Kamil Konieczny wrote:
>>Hi Daniele,
>>On 2024-12-18 at 15:38:30 -0800, Daniele Ceraolo Spurio wrote:
>>>The mei driver is a child of i915 on discrete, but not on integrated.
>>>This means we want to unplug it before removing i915 in the former case
>>>but not in the latter. Therefore, instead of manually unloading the mei
>>>driver, we can unbind i915 and leave it to the kernel to unplug all the
>>>dependencies. This also means that we don't need to explicitly disable
>>>the vtcon anymore.
>>Will it work also in case of both iGPU + dGPU present?
>
>It should work, yes. The i915/xe unbind will not unload the mei 
>drivers, it will just unbind them if they're bound to a gfx child 
>device. So in the case of having both igpu and dgpu the mei driver 
>will keep being bound to the CPU mei device, which is what we want.
>
>>Should we provide a tool to unload an i915 driver?
>
>A subtest of i915_module_load that just unloads could be useful. We 
>have that for Xe.


unloading the driver should not be more than unbind + unload. For a CI
testing perspective there are some issues due to bugs in other drivers.
For a developer this shouldn't really matter. I've beeing unbinding i915
via sysfs since forever - and often I don't even unload it if I don't
need to.

In future (probably not the next release though) the kmod project will
have a `kmod unbind` command to unbind modules. Unloading a module
is accomplished with `modprobe -r`.


Lucas De Marchi

>
>Daniele
>
>>
>>Regards,
>>Kamil
>>
>>>The other 2 dependencies are left untouched:
>>>- intel_ips uses symbol_get, so the automatic dependency detection won't
>>>   unload it.
>>>- the hotunplug test mentions that the sound driver can throw errors on
>>>   i915 unbind, so we need to keep the explicit unload.
>>>
>>>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>>  lib/igt_kmod.c | 9 ++-------
>>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>>
>>>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>>>index a8b0339b9..fa9541d72 100644
>>>--- a/lib/igt_kmod.c
>>>+++ b/lib/igt_kmod.c
>>>@@ -620,16 +620,9 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>>>  	const char *aux[] = {
>>>  		/* gen5: ips uses symbol_get() so only a soft module dependency */
>>>  		"intel_ips",
>>>-		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
>>>-		"mei_pxp",
>>>-		"mei_hdcp",
>>>-		"mei_gsc",
>>>  		NULL,
>>>  	};
>>>-	/* unbind vt */
>>>-	bind_fbcon(false);
>>>-
>>>  	ret = igt_audio_driver_unload(who);
>>>  	if (ret)
>>>  		return ret;
>>>@@ -648,6 +641,8 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>>>  	}
>>>  	if (igt_kmod_is_loaded(driver)) {
>>>+		igt_kmod_unbind(driver);
>>>+
>>>  		ret = igt_kmod_unload(driver);
>>>  		if (ret) {
>>>  			if (who)
>>>-- 
>>>2.43.0
>>>
>
