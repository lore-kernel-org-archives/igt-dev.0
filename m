Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A567FCD4F57
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 10:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD5810EB2E;
	Tue, 19 May 2026 10:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDnQ4kDo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E5010EB2E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 10:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779187958; x=1810723958;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=F2LdF+c7GXAgheXwC7WZYOeXNj2rErNp4q1DzLKY/HU=;
 b=VDnQ4kDo7l7qmZWA4GQOweMyXxVy2vcOyebbHlEjp4AKwn/TZpuUc0lj
 YNM+XXkjkW2nU5XbqmsB2EFjhQoRqYQq9DJMCCxo5/BkKXhn/3+Aj9eLr
 RKBwmqPFCbVULEEv+DQYl09mxX8wpz/NXR0zRwnaiXmrtGohYAuqaRz9x
 qSE/sp2tPExg/tTZ/JxmYqtfnztTweoyz8aUZbvZ1FgAOY+BbGCqZ80TJ
 6eQEj0eN934ydQ/lbHGYx1cNld/3iHEc1JdOzuLiMjPeYjby9qeROSJWQ
 RYaBi0h+bG/sZMZjOHjEq2KBSNcozT6J0cR5CHCX+dk6IuHh7MIt+0+x5 g==;
X-CSE-ConnectionGUID: lE0ftYxXQzujVhZjptTKLw==
X-CSE-MsgGUID: LIFrQ3kyR3OPsH5T5MqB8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="83919196"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="83919196"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 03:52:37 -0700
X-CSE-ConnectionGUID: 96Q0HRVGTCafM78roMzAng==
X-CSE-MsgGUID: 2fccpsMaSSaGaeGYtQts5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="277839131"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.184])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 03:52:35 -0700
Date: Tue, 19 May 2026 12:52:33 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com, 
 ashutosh.dixit@intel.com
Subject: Re: [PATCH] tools/igt_power: Fix crash on Xe devices by initializing
 xe_device cache
Message-ID: <zepkg4oupdoebhpkpiwxm4if2ctv26om3vrluaxuors2g3i4ps@yyvdbbtfbszs>
References: <20260518123224.7398-1-sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Mon, May 18, 2026 at 02:32:24PM +0200, Sebastian Brzezinka wrote:
> Opening a DRM device with plain open() does not initialize the Xe device
> cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(), it
> uses find_in_cache() which asserts the cache entry exists, causing a crash
> on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev
> 
> Fix this by opening the device with O_RDWR (required for DRM ioctls),
> calling xe_device_get() for Xe devices to populate the cache before
> calling igt_power_open(), and calling xe_device_put() on cleanup for
> proper cache management.

LGTM.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


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
