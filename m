Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90CFE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 23:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDBC10E2C1;
	Thu, 19 Dec 2024 23:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HClQkxu6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B770910E2C1
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 23:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734651000; x=1766187000;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UpFyT+Ts6qxMvGqvCwgfw1GDvgnVH7JpcOSWB0dRVXI=;
 b=HClQkxu6y8IHIBiHJ+13z2k3MC9VfBkjKVG1+kygOaAieHsk5xxRIRJS
 67ppRAglpZJju/wwrSXEoMD3295/maLxuGiRnXl8mauAxgFzraBfilkXy
 r0/utJqnIUDiIiOmNftGe/c007h8fUPPq23tIu9j0rnCC1FR0c8xtrX7J
 lWaFkS+qRpyefplBFmyPPxan/9blyi/HDlvTT4/Mad40kqzWbumFphwgF
 uRfLh1XkYj4gLdG+Rjr+qzVVHGd6xN2KmSmj1OuhMM/eZfgw9j5VHHhOs
 Hp/kWv+/MdJij/FVFdF7HVLk/HMBNsxxOYZGlERfgT6GgTY8Hc82VeHH2 A==;
X-CSE-ConnectionGUID: BTvdMJeoRL+X2kLY+L3ZoQ==
X-CSE-MsgGUID: ttNG4tL2QtKUqI6ZNXeJIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="57665244"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="57665244"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:30:00 -0800
X-CSE-ConnectionGUID: /KKyG62uTfuWcdf1IgWC3w==
X-CSE-MsgGUID: YnScre/2QYubLhZoNdCVjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102475376"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.87])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:29:59 -0800
Date: Thu, 19 Dec 2024 17:29:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 2/3] lib/igt_kmod: Make sure errno is not
 already set before unbinding
Message-ID: <44eqlwtjr5vvyjaystcoqk7zpz7bi72oezfo3glsdwiu7wlff3@5zc63q2oamu4>
References: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
 <20241219230517.2492196-2-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241219230517.2492196-2-daniele.ceraolospurio@intel.com>
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

On Thu, Dec 19, 2024 at 03:05:16PM -0800, Daniele Ceraolo Spurio wrote:
>We assert that errno is zero after unbinding, so we need to make sure it
>wasn't already non-zero beforehand or we might incorrectly fail.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>The non-zero starting errno hitting the assert is reproed when using
>unbind in the 1915 reload-with-fault-injection test:
>https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12349/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html

yeah, but I think I made a mistake checking for errno. Checking it
outside of a call to libc is odd.


I'd rather remove both the assert and the setting to 0:

if we have an empty dir we won't ever reach the `errno = 0`, making it
the same as the `if (!dir)` in which we are already returning 0.


This would be a

Fixes: cb008246b0c7 ("lib/igt_kmod: Rewrite xe unload logic")

thanks
Lucas De Marchi

>
> lib/igt_kmod.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index d73cb4101..a008b3c29 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -662,6 +662,8 @@ int igt_kmod_unbind(const char *mod_name)
> 	int dirlen;
> 	DIR *dir;
>
>+	errno = 0;
>+
> 	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
> 			  mod_name, mod_name);
> 	igt_assert(dirlen < sizeof(path));
>-- 
>2.43.0
>
