Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C446BD33990
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 15:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABCE10E4EC;
	Mon, 28 Oct 2024 15:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9VGuO2l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D0110E4EC
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730128632; x=1761664632;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=H557R0VvxB2I04ha6/Nu6/yMVLbDd4ldOYukJQGJgJo=;
 b=k9VGuO2lXBVzNS0glbqH0qS0hUxrCgzHowORxvfL2aJQ05IssSuCJUsL
 mO7k2Hc5Q4SbBccoKSEM+FrHdzLgywy9NGrXbbWk++eH6P9SNV1mhdMU4
 2jzbShoo4Ztnx3WrxnE35Xq3zeegKJyErn1Ldbmdtik7/LQ7na4atG3w+
 i0qPXa70MD8j9G6+iyuq6/3J+Adt9yS6ZJ4FulAFktNaFsLzoBrVllS59
 EjVswxl/Y4I7/Pkx1eywnOjU6BDZ8/AmznGbcPu6PbLVn4ciqrjsKAjJd
 sCKXMi5QQIYaLbedm7aiKBTRmpu5hRNkl3cY4hN+1FpZobzt9ZuYNNV+/ g==;
X-CSE-ConnectionGUID: OXr8VvNgS4mQF2B7LR4FRA==
X-CSE-MsgGUID: DA1H9EYGToy6RgoAxwYDMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40267694"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40267694"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 08:17:11 -0700
X-CSE-ConnectionGUID: GbJZO4qpSUayvRYFLbWpfg==
X-CSE-MsgGUID: a7SlTeo+QHiRZmWd6I4wBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81222015"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 08:17:10 -0700
Date: Mon, 28 Oct 2024 16:16:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/2] drm-uapi/xe: Sync with OA syncs uapi update
Message-ID: <20241028151655.ysgah2k2rn7qxck4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20241025185205.1327235-1-ashutosh.dixit@intel.com>
 <20241025185205.1327235-2-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241025185205.1327235-2-ashutosh.dixit@intel.com>
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

Hi Ashutosh,
On 2024-10-25 at 11:52:04 -0700, Ashutosh Dixit wrote:
> Align with kernel commit c8507a25cebd ("drm/xe/oa/uapi: Define and parse OA
> sync properties") which adds OA syncs uapi.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index f0a450db95..4a8a4a63e9 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _XE_DRM_H_
> -#define _XE_DRM_H_
> +#ifndef _UAPI_XE_DRM_H_
> +#define _UAPI_XE_DRM_H_

imho this shouldn't be here, did you use
make INSTALL_HDR_PATH=<dest-dir> headers_install

documented in README.md?

Regards,
Kamil

>  
>  #include "drm.h"
>  
> @@ -134,7 +134,7 @@ extern "C" {
>   * redefine the interface more easily than an ever growing struct of
>   * increasing complexity, and for large parts of that interface to be
>   * entirely optional. The downside is more pointer chasing; chasing across
> - * the boundary with pointers encapsulated inside u64.
> + * the __user boundary with pointers encapsulated inside u64.
>   *
>   * Example chaining:
>   *
> @@ -512,7 +512,9 @@ struct drm_xe_query_gt_list {
>   *    containing the following in mask:
>   *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
>   *    means 32 DSS are available for compute.
> - *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks
> + *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks.  This type
> + *    may be omitted if the driver is unable to query the mask from the
> + *    hardware.
>   *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
>   *    available per Dual Sub Slices (DSS). For example a query response
>   *    containing the following in mask:
> @@ -1483,6 +1485,7 @@ struct drm_xe_oa_unit {
>  	/** @capabilities: OA capabilities bit-mask */
>  	__u64 capabilities;
>  #define DRM_XE_OA_CAPS_BASE		(1 << 0)
> +#define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
>  
>  	/** @oa_timestamp_freq: OA timestamp freq */
>  	__u64 oa_timestamp_freq;
> @@ -1632,6 +1635,22 @@ enum drm_xe_oa_property_id {
>  	 * to be disabled for the stream exec queue.
>  	 */
>  	DRM_XE_OA_PROPERTY_NO_PREEMPT,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
> +	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
> +	 */
> +	DRM_XE_OA_PROPERTY_NUM_SYNCS,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
> +	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
> +	 * configuration will wait till input fences signal. Output fences
> +	 * will signal after the new OA configuration takes effect. For
> +	 * @DRM_XE_SYNC_TYPE_USER_FENCE, @addr is a user pointer, similar
> +	 * to the VM bind case.
> +	 */
> +	DRM_XE_OA_PROPERTY_SYNCS,
>  };
>  
>  /**
> @@ -1698,4 +1717,4 @@ struct drm_xe_oa_stream_info {
>  }
>  #endif
>  
> -#endif /* _XE_DRM_H_ */
> +#endif /* _UAPI_XE_DRM_H_ */
> -- 
> 2.41.0
> 
