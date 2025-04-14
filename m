Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BA9C369B4
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 18:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9755610E26B;
	Mon, 14 Apr 2025 18:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdBo8oyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3FE10E26B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 18:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744653990; x=1776189990;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h7bG0tUL0SwU3Zrhu5J4+VLLrQ0DFAIpGWeCcvBzvfw=;
 b=WdBo8oyJDJjz1C1KuGIx/enamlUn7ao/DII4O91OqPNkx4tAJZZ9Ldim
 E9SsmnA5OHuI5hFfzT4NfRfIxVMrB0LEHvS/xZOGr7AgUAtQlz0XLriTt
 ZtZMALsJRUki9BAd97hlAmFwZsweJCjDje7BedQVqJl08O5SxfperLNUL
 WYM2ct7cgREF6ClPvQOw4omufGKQhOBSleq8hkBSm2tx6JNYfcl0ndNgK
 mI5rwUSKsiHOh2oXIO6WDnKMXUEE/48zuWWD9/PctEBGm12waizBhMu1l
 V/p+CjDt1I7ObNJMAbcmQ6Ll9Wd2PFHTkSmrZQbXllxXeNczmvsqGgEVY g==;
X-CSE-ConnectionGUID: DtmglDSJSjKzegZlvmF8CQ==
X-CSE-MsgGUID: jYOSoh35TqqalLwpkfBQ/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="63681139"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="63681139"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 11:06:29 -0700
X-CSE-ConnectionGUID: +F82sxAQSZ2JxVFl1YhzbA==
X-CSE-MsgGUID: a9Xaut27SZ6jr2nJi3DDrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="130771311"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 11:06:28 -0700
Date: Mon, 14 Apr 2025 20:06:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t 05/10] lib/igt_kmod: Add igt_kmod_bind()
Message-ID: <20250414180625.r2i5szhlkhynr5w2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-5-84b1ad0b8075@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410-lib-kmod-v1-5-84b1ad0b8075@intel.com>
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
On 2025-04-10 at 15:48:34 -0700, Lucas De Marchi wrote:
> Like the unbind/rebind, this can be easily implemented by the
> driver_set_device() helper.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> ---
>  lib/igt_kmod.c | 32 +++++++++++++++++++++++++++++---
>  lib/igt_kmod.h |  2 ++
>  2 files changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 3f5f93f37..14b6b957a 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -598,9 +598,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>  }
>  
>  /**
> - * igt_kmod_unbind:
> - *
> - * Unbind driver from devices. Currently supports only PCI bus
> + * igt_kmod_unbind: Unbind driver from devices. Currently supports only PCI bus
>   * @mod_name: name of the module to unbind
>   * @pci_device: if provided, unbind only this device, otherwise unbind all devices
>   */
> @@ -639,6 +637,34 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>  	return 0;
>  }
>  
> +/**
> + * igt_kmod_bind: Bind driver to device
> + * @mod_name: name of the module to rebind
> + * @pci_device: device to bind
> + *
> + * Module should already be loaded
> + */
> +int igt_kmod_bind(const char *mod_name, const char *pci_device)
> +{
> +	char path[PATH_MAX];
> +	int dirlen, dirfd;
> +	int ret;
> +
> +	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
> +			  mod_name, mod_name);
> +	igt_assert(dirlen < sizeof(path));
> +
> +	dirfd = open(path, O_RDONLY | O_CLOEXEC);
> +	if (dirfd < 0)
> +		return dirfd;
> +
> +	ret = igt_sysfs_set(dirfd, "bind", pci_device);
> +
> +	close(dirfd);
> +
> +	return ret;
> +}
> +
>  /**
>   * igt_intel_driver_unload:
>   *
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index 170a8df9d..e3a4ce671 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -37,6 +37,8 @@ int igt_kmod_load(const char *mod_name, const char *opts);
>  int igt_kmod_unload(const char *mod_name);
>  
>  int igt_kmod_unbind(const char *mod_name, const char *pci_device);
> +__attribute__((nonnull)) int igt_kmod_bind(const char *mod_name,
> +					   const char *pci_device);
>  
>  int igt_audio_driver_unload(char **whom);
>  
> 
> -- 
> 2.49.0
> 
