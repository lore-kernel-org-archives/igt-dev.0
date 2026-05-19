Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60065CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 11:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CA310EC8B;
	Tue, 19 May 2026 11:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kC4fx9RS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6570910EC5F
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779190125; x=1810726125;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G3YrzJz16MCEZ6d9Aq9N/ukEWgfIbrfJcigrgBIC1bM=;
 b=kC4fx9RS4Nkigqulqi1NMnPXeQYOfEKuGc3NtzgpIVQfgpMxw6n+VNo1
 z+x5mow+CUTmR6s7bi+bEWUQN+V5mEkWNVqE8HhMb0AGizSDg/WNvcrHc
 Np1nrIbtjH+/9gaIJ8d4FwtbqSVdz4S3e0SgvSLJPE7W5V2LztiFngFVh
 ypfrBPLnvQsZMxk/xAyr0YsNyNeVF3YkZEpK0bCDeJYBElncFuHR9uUEH
 fEpoiElIZUikv6G3/OZA++s0SVgMwGRfU/kUgu+uA7KZxUWy1ip+iU+oX
 UjLzon3a1cAgEWTdNW1KB6VwjUD8/i4nxU0nC8dZA+jYRKICEGN+npJ0s g==;
X-CSE-ConnectionGUID: QFeDB9aTSsC39BGFOJxWxA==
X-CSE-MsgGUID: wDLBDkU6TaqJr6AMWt5hAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80184974"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="80184974"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:28:44 -0700
X-CSE-ConnectionGUID: IKp8rE54RrCG+GmOes2N7Q==
X-CSE-MsgGUID: qVO+JURkQRicukSO2TWmrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239998496"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 04:28:39 -0700
Date: Tue, 19 May 2026 13:28:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] tools/igt_power: Fix crash on Xe devices by initializing
 xe_device cache
Message-ID: <20260519112825.7c7gpzdpevydhkjt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20260518123224.7398-1-sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518123224.7398-1-sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-05-18 at 14:32:24 +0200, Sebastian Brzezinka wrote:
> Opening a DRM device with plain open() does not initialize the Xe device
> cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(), it
> uses find_in_cache() which asserts the cache entry exists, causing a crash
> on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev
> 
> Fix this by opening the device with O_RDWR (required for DRM ioctls),
> calling xe_device_get() for Xe devices to populate the cache before
> calling igt_power_open(), and calling xe_device_put() on cleanup for
> proper cache management.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/igt_power.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/igt_power.c b/tools/igt_power.c
> index 6dd180d34..11da0430b 100644
> --- a/tools/igt_power.c
> +++ b/tools/igt_power.c
> @@ -11,6 +11,7 @@
>  
>  #include "drmtest.h"
>  #include "igt_power.h"
> +#include "xe/xe_query.h"
>  

While you fix it now, your change make it even more difficult
to remove 'testing' dependancy in tools, see work item
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/16
IGT command line tools load redundant GUI libraries

+cc Krzysztof and Zbigniew

We can merge it for now but it is not ideal.

Regards,
Kamil

>  struct measurement {
>  	int battery_index;
> @@ -38,12 +39,15 @@ static bool prepare(struct measurement *m)
>  		int ret, fd = -1;
>  
>  		if (m->drm_device) {
> -			fd = open(m->drm_device, O_RDONLY);
> +			fd = open(m->drm_device, O_RDWR);
>  			if (fd < 0) {
>  				fprintf(stderr, "Unable to open drm device %s (%d)\n",
>  					m->drm_device, -errno);
>  				return false;
>  			}
> +
> +			if (is_xe_device(fd))
> +				xe_device_get(fd);
>  		}
>  
>  		ret = igt_power_open(fd, &m->power, m->rapl_domain);
> @@ -54,12 +58,20 @@ static bool prepare(struct measurement *m)
>  			else
>  				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
>  					m->rapl_domain, ret);
> -			close(fd);
> +			if (fd >= 0) {
> +				if (is_xe_device(fd))
> +					xe_device_put(fd);
> +				close(fd);
> +			}
>  
>  			return false;
>  		}
>  
> -		close(fd);
> +		if (fd >= 0) {
> +			if (is_xe_device(fd))
> +				xe_device_put(fd);
> +			close(fd);
> +		}
>  	}
>  
>  	return true;
> -- 
> 2.53.0
> 
