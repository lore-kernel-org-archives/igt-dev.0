Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86327C369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 18:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3591C10E26B;
	Mon, 14 Apr 2025 18:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxyO1nzK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E4B10E26B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744654047; x=1776190047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e7ijL2qhreRJ7bwKl/u8X3l3ikc16US5VC5Ze03+oRo=;
 b=MxyO1nzKPIYd93SVJc5ScbIMUAB+fu8u0Eznqmh3s6j5Qd4qQh7ajxSW
 UFG3uYzDM0GVQWkdX7XBa5XXJTiv18s0WG7jjyS2rIdfG8cBZJw588CAO
 F4WVjMQjYUvKDLhB+VmrGWc4G+DleYfkopS+v0Eoxj/VKwXoi26cJkhDP
 2c5fEqeMv+anSAWLZriyQT/WZsP5O/zlTKl+XlL2IGfcW9kvDZmLd/FT1
 KwN7XCtUu2RK4ISXPwdCmfuJfQP809yFz7Bcelzo2b9JEezn0AAJebIZO
 vqfzHrLfVO1YshtNKZ6NgLVwG/i/KNXfefRlfItyo6Cq2QU0uQXmv53+n Q==;
X-CSE-ConnectionGUID: tyYDccr+T6+3l4fH+cwe9Q==
X-CSE-MsgGUID: OZx7PpQbSkKEXhKC4GFzqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46048175"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="46048175"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 11:07:26 -0700
X-CSE-ConnectionGUID: 4K7na2tPStCDw6fpkMQ9JQ==
X-CSE-MsgGUID: Ykcpk0U1SYCEsr4GmnLLmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="129729306"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 11:07:25 -0700
Date: Mon, 14 Apr 2025 20:07:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t 07/10] lib/igt_kmod: Add rebind abstraction
Message-ID: <20250414180722.bnfbjuezcnyxu5gz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-7-84b1ad0b8075@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410-lib-kmod-v1-7-84b1ad0b8075@intel.com>
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

Hi Lucas,
On 2025-04-10 at 15:48:36 -0700, Lucas De Marchi wrote:
> Abstract the "set one file in the drivers dir" and share the
> implementation with unbind/rebind.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_kmod.c | 11 +++++++++++
>  lib/igt_kmod.h |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 14b6b957a..6d7f5705c 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -665,6 +665,17 @@ int igt_kmod_bind(const char *mod_name, const char *pci_device)
>  	return ret;
>  }
>  
> +/**
> + * igt_kmod_rebind: Unbind driver from devices and bind it again
> + * @mod_name: name of the module to rebind
> + * @pci_device: device to rebind to
> + */
> +int igt_kmod_rebind(const char *mod_name, const char *pci_device)
> +{
> +	return igt_kmod_unbind(mod_name, pci_device) ||
> +		igt_kmod_bind(mod_name, pci_device);

What if after unbind the bind is still there?

Regards,
Kamil

> +}
> +
>  /**
>   * igt_intel_driver_unload:
>   *
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index e3a4ce671..905070897 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -39,6 +39,8 @@ int igt_kmod_unload(const char *mod_name);
>  int igt_kmod_unbind(const char *mod_name, const char *pci_device);
>  __attribute__((nonnull)) int igt_kmod_bind(const char *mod_name,
>  					   const char *pci_device);
> +__attribute__((nonnull)) int igt_kmod_rebind(const char *mod_name,
> +					     const char *pci_device);
>  
>  int igt_audio_driver_unload(char **whom);
>  
> 
> -- 
> 2.49.0
> 
