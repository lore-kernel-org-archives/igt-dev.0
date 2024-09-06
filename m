Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58A8CE7B1D
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 14:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7E510EA75;
	Fri,  6 Sep 2024 14:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsUAIfEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDD510EA75
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725633695; x=1757169695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9vp8hSx91LW4GQ8F3gmBVHKxqcSkJ6BMR1yUXcwy214=;
 b=KsUAIfEuXVzFLI8YBu4VvsyxkceVlUjPRkFv/ONbIObltJDm0LkLuB5w
 AnXZUpCDj3frW6KxDYCiLgQfDuK1b8gx+Yo9iz6HVH7m7mTu8DP4Ei2EN
 xwyTHJUr533g4hN6KZtKsAg4GZVxe2/LfTQGUWrYUmoWENenfOrzpKmLk
 nciMQ3Sg4fbY+o7REwDwl2KLEfRW3cs1/Kq+IAuwjdGNuxv6aFKg/AmBb
 od1ZCVZT7fHo+GnJT+jqz+r36YitlbclN3ZtKE5zAnJ+5XDraqCFPjcNh
 d7mV8tgPIz6eCTdLJ2ruIGIPwIDrRJIykaN54qedzeurhJCUGJFgTdc6c w==;
X-CSE-ConnectionGUID: YIGO5iCASDeFSvgH/v467A==
X-CSE-MsgGUID: xOyevouZTwK7Sr3ygi6UEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24588798"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="24588798"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 07:41:34 -0700
X-CSE-ConnectionGUID: YGm45HyeQNmvUtKkJglTzg==
X-CSE-MsgGUID: eRWxC6ooRISlBkRNmyKS0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="89245497"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 07:41:31 -0700
Date: Fri, 6 Sep 2024 16:41:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v6 01/17] drm-uapi/xe: Sync with oa uapi fix
Message-ID: <20240906144103.vlga3aeojup3wlwy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-2-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240905092812.94553-2-christoph.manszewski@intel.com>
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

Hi Christoph,
On 2024-09-05 at 11:27:56 +0200, Christoph Manszewski wrote:
> Align with kernel commit f2881dfdaaa9 ("drm/xe/oa/uapi: Make bit masks
> unsigned"). Use built header instead of raw uapi header.

Thank you Christoph for this fix,
I merged it.

Regards,
Kamil

> 
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 29425d7fd..f0a450db9 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _UAPI_XE_DRM_H_
> -#define _UAPI_XE_DRM_H_
> +#ifndef _XE_DRM_H_
> +#define _XE_DRM_H_
>  
>  #include "drm.h"
>  
> @@ -134,7 +134,7 @@ extern "C" {
>   * redefine the interface more easily than an ever growing struct of
>   * increasing complexity, and for large parts of that interface to be
>   * entirely optional. The downside is more pointer chasing; chasing across
> - * the __user boundary with pointers encapsulated inside u64.
> + * the boundary with pointers encapsulated inside u64.
>   *
>   * Example chaining:
>   *
> @@ -1598,10 +1598,10 @@ enum drm_xe_oa_property_id {
>  	 * b. Counter select c. Counter size and d. BC report. Also refer to the
>  	 * oa_formats array in drivers/gpu/drm/xe/xe_oa.c.
>  	 */
> -#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
> -#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
> -#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
> -#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)
> +#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xffu << 0)
> +#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xffu << 8)
> +#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xffu << 16)
> +#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xffu << 24)
>  
>  	/**
>  	 * @DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT: Requests periodic OA unit
> @@ -1698,4 +1698,4 @@ struct drm_xe_oa_stream_info {
>  }
>  #endif
>  
> -#endif /* _UAPI_XE_DRM_H_ */
> +#endif /* _XE_DRM_H_ */
> -- 
> 2.34.1
> 
