Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8E2C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 13:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B85B10E10F;
	Mon, 13 May 2024 13:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7SYXurz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179C910E10F
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715605963; x=1747141963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zc5XEkIvmmS+CjJCVr4W7ty7egYWGCVMAVMYrDtlkUY=;
 b=j7SYXurz+/sSDgzgkK6N0oqYxH/vxnS82/NiEis+n6IxsCzD7+XefYvM
 3DcKDLuvnZCOu90jzoB3A9pkIVamHXTzw0DVZpOgqziFEcF0+GJWDIRLs
 FSB53LsdrK5HJhLeX49pdtj2B+IvMbeORYmgBbuh/VOIcIm4vT/VUwrFg
 VBgnHwEfKAQgKa2fBv7Km7UOO/na1thtg5M592oY1fl92CEE2jOgdft0u
 M0i38J+M27LHxxXoqfZFN4pr/yIXyBMkhj+EmS1iDsTguNs8CULQOBtzG
 U/JoerfDWSjdpvL5HohYToJWBBTBx6OvEqoxt1NgVxN4gzHG91H+Vyg/r g==;
X-CSE-ConnectionGUID: O8StE2z5Sm+sM+JtWnxvdA==
X-CSE-MsgGUID: gA/FLtbPSDuuuKofEqJxzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22938376"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22938376"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 06:12:42 -0700
X-CSE-ConnectionGUID: Hi4DAR96R0yCawR4mf0IAg==
X-CSE-MsgGUID: fCi1qSjmQmG7YFG3EdwTEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30315608"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 06:12:41 -0700
Date: Mon, 13 May 2024 15:12:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 brian.welty@intel.com, tomasz.mistat@intel.com, himanshu.girotra@intel.com
Subject: Re: [PATCH i-g-t v2 1/2] lib/xe/xe_query: return errno from
 xe_supports_faults check
Message-ID: <20240513131238.wutryx5zgqggn7ax@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com
References: <20240510182438.3178575-1-jonathan.cavitt@intel.com>
 <20240510182438.3178575-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240510182438.3178575-2-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2024-05-10 at 11:24:37 -0700, Jonathan Cavitt wrote:
> Return the exact error value from the ioctl used in xe_supports_faults.
> This is done because it is possible that faults are supported on the
> system but are temporarily unavailable due to VM usage.  This change
> allows the user to determine if they are willing to wait for fault
> support to become active again.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/xe/xe_query.c | 15 ++++++++-------
>  lib/xe/xe_query.h |  2 +-
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 6df8f42649..145dee8142 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -300,27 +300,28 @@ void xe_device_put(int fd)
>   * xe_supports_faults:
>   * @fd: xe device fd
>   *
> - * Returns true if xe device @fd allows creating vm in fault mode otherwise
> - * false.
> + * Returns the return value of the ioctl.  This can either be 0 if the
> + * xe device @fd allows creating a vm in fault mode, or an error value
> + * if it does not.
>   *
>   * NOTE: This function temporarily creates a VM in fault mode. Hence, while
>   * this function is executing, no non-fault mode VMs can be created.
>   */
> -bool xe_supports_faults(int fd)
> +int xe_supports_faults(int fd)
>  {
> -	bool supports_faults;
> +	int ret;
>  
>  	struct drm_xe_vm_create create = {
>  		.flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
>  			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>  	};
>  
> -	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> +	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
>  
> -	if (supports_faults)
> +	if (!ret)
>  		xe_vm_destroy(fd, create.vm_id);
>  
> -	return supports_faults;
> +	return ret;
>  }
>  
>  static void xe_device_destroy_cache(void)
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index f91d16bdf5..54115f8f7c 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -94,7 +94,7 @@ uint64_t xe_visible_available_vram_size(int fd, int gt);
>  uint32_t xe_get_default_alignment(int fd);
>  uint32_t xe_va_bits(int fd);
>  uint16_t xe_dev_id(int fd);
> -bool xe_supports_faults(int fd);
> +int xe_supports_faults(int fd);
>  const char *xe_engine_class_string(uint32_t engine_class);
>  bool xe_has_engine_class(int fd, uint16_t engine_class);
>  bool xe_has_media_gt(int fd);
> -- 
> 2.25.1
> 
