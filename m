Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD3DC52D7C
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 14:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A0410E920;
	Fri,  9 Aug 2024 14:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIAz0z2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0B610E914
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723213303; x=1754749303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=plY53Devk8jo/J8E3uon5EEEBwvwxsBL9XPzx/qmF8w=;
 b=GIAz0z2S5tidbMbfyW3fvJBKa1qTYDHC+fiZvIZgXVdoCPVPCuRf8XrH
 N81s/Ndvm/iUWGOPasmPsC2ARPsccfFXcxeOyrN354cIqbF0QLl31dH1M
 /7UeA7xo97k6mY6x7WH27ShS/IH+Eqx2z2FabaUJkrZW/ZEQ31IyaRwco
 grSGf37x3I5Q9OvPU7X3z2T2pNp6LAswm7TEQC1ITFs01KdJ4wVWN53Ui
 N9zgcZ4Awk3Eh6RwGq0YjdG32P7ML8M2vUwxFTxascVlXIPOr5D1CiZ8x
 QNAl27k2VVk8r7Ny40/p45ffWiRR3pP9U7NFIRtKhVS3mlp5l/DR0o4MD A==;
X-CSE-ConnectionGUID: b6VA3x4HQCGYUYYIpsy5Mw==
X-CSE-MsgGUID: QctsJY3GSV+Thbzv0NpcIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32012963"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="32012963"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 07:21:42 -0700
X-CSE-ConnectionGUID: KDfTW6jNRG2AHOJPubX9wQ==
X-CSE-MsgGUID: fIKJ1sppQumsEZEYekjIQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57470772"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 07:21:38 -0700
Date: Fri, 9 Aug 2024 16:21:21 +0200
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
Subject: Re: [PATCH i-g-t v3 01/14] drm-uapi/xe: Sync with oa uapi fix
Message-ID: <20240809142121.jtb4u53qtopwlro2@kamilkon-DESK.igk.intel.com>
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
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
 <20240809123813.109365-2-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809123813.109365-2-christoph.manszewski@intel.com>
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
On 2024-08-09 at 14:38:00 +0200, Christoph Manszewski wrote:
> Align with kernel commit f2881dfdaaa9 ("drm/xe/oa/uapi: Make bit masks
> unsigned"). Use built header instead of raw uapi header.
> 
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

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
