Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDC0C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 13:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B555910EC1D;
	Wed, 13 Mar 2024 13:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBcR+TnL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FB910EC1D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 13:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710338227; x=1741874227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WOT7PpoQxcZhlgZZxKk91oVydrbT+grREkT/C6KdFgY=;
 b=aBcR+TnL6TtIm0rDAA8ekkVWi2hyk+b4vjECILueMRjSNr2h9V4A1GTk
 NyJmYu9kTfm7WFC9izEr0MZ60L6OUXC6eebjyZ97zhLt5g/TMgnqFAK3R
 pa4rttyBs0gnUge1HSzP+Ff4A1AGppOQWYTqCjKJxlc7kksn44BmhkzdS
 mBcdGxxnGkq6IuAfziZC4vlWB8AcaMtj6EFhuNF9jP07Ume0SONipSiBd
 kqfoJ+gfp0eAULV3DBapcgCvWjUud5YUdrxSA6o1A6tF/AW+MtiOHl6p8
 8yM9LLEeR4hgBWCxe06ji+cHa8OejuUs4np/bza/TWL0vV3aGY5g5R+bF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5272910"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5272910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 06:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="11836571"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 06:57:05 -0700
Date: Wed, 13 Mar 2024 14:56:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, lukasz.laguna@intel.com
Subject: Re: [PATCH i-g-t] SRIOV: lib/igt_sriov_device: Cache xe device at open
Message-ID: <20240313135644.hlsexcbvuotvzext@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org, lukasz.laguna@intel.com
References: <20240313115911.22870-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313115911.22870-1-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2024-03-13 at 12:59:11 +0100, Marcin Bernatowicz wrote:
> Be consistent with other drm_open_xxx functions.
s/xxx/*/

In subject, drop SRIOV:, s/SRIOV: lib/lib/

With that fixed,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  lib/igt_sriov_device.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index f20761669..f425a5ecf 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -12,6 +12,7 @@
>  #include "igt_device.h"
>  #include "igt_sriov_device.h"
>  #include "igt_sysfs.h"
> +#include "xe/xe_query.h"
>  
>  /**
>   * igt_sriov_is_pf - Check if device is PF
> @@ -232,6 +233,7 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
>  	DIR *dir;
>  	struct dirent *de;
>  	bool found = false;
> +	int fd;
>  
>  	if (!vf_num)
>  		return -1;
> @@ -258,7 +260,11 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
>  	if (!found)
>  		return -1;
>  
> -	return __drm_open_device(dev_name, DRIVER_ANY);
> +	fd = __drm_open_device(dev_name, DRIVER_ANY);
> +	if (fd >= 0 && is_xe_device(fd))
> +		xe_device_get(fd);
> +
> +	return fd;
>  }
>  
>  /**
> -- 
> 2.31.1
> 
