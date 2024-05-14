Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E931FC25B75
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 11:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8515010E172;
	Tue, 14 May 2024 11:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ac1SweWs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B5610E172
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715686641; x=1747222641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3d3n4+N36UKvmHm5uaNMIZO6d/k0+JbKiNoxZRxkyng=;
 b=ac1SweWsI+Wx31MRfl+ZOFvt6U7HY5Ui81mlYWs0Gaq0VueFV+L0vxvn
 iVhW43TxYfaDwtVvJZi/q6ylhiC1GgsznGZWFB6QPxgbJfEKpuU8ieh1R
 Eyu9SMuQ8POsBn3g3Wbtk7kQINOHtdz6EyMfV7Ip378kkAj91f6D7T8qW
 AmfSW6ylK3iaDsuccCHShOznW/+hnlHlXpsr1IbFWVg2XV12we9s/47ue
 2QbZItWWyUdIqYyWh+7NEGqIn00zy+aNn2KEumM2/mKOW9Hvk1wjVD+Xh
 PIUl/XxmYqrCvpCE5XEzCNrhInt78NoIds6X6AELBcueFKsluTVFEIv2v A==;
X-CSE-ConnectionGUID: SYB184iOQlyzZylsLOOusw==
X-CSE-MsgGUID: lzIp+zv7T0mTrqlu+c4VfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11514869"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11514869"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 04:37:21 -0700
X-CSE-ConnectionGUID: FRPpiaPVR8mx1SVeg4QYNw==
X-CSE-MsgGUID: yEM1j/KxTjafQzLX8w0UNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30783027"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.87])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 04:37:20 -0700
Date: Tue, 14 May 2024 13:37:18 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Subject: Re: [PATCH i-g-t v5 03/11] lib/intel_blt: Add i915 -> blt tile
 helper converter
Message-ID: <20240514113718.uvgsbhdaqrpwuian@zkempczy-mobl2>
References: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
 <20240509053359.449885-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509053359.449885-4-zbigniew.kempczynski@intel.com>
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

On Thu, May 09, 2024 at 07:33:51AM +0200, Zbigniew Kempczyński wrote:
> We have two kind of buffers in IGT - intel-buf for render and
> blt-object for blitter. intel-buf uses I915_TILING* whereas
> blt-object blt_tiling_type (T_*). To construct blt-object from
> intel-buf we need to convert I915_TILING* to T_*. Add function
> which does this conversion.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/intel_blt.c | 21 +++++++++++++++++++++
>  lib/intel_blt.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 5a281036c4..946adc538b 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -560,6 +560,27 @@ int blt_tile_to_i915_tile(enum blt_tiling_type tiling)
>  	return 0;
>  }
>  
> +/**
> + * i915_tile_to_blt_tile:
> + * @tiling: tiling id
> + *
> + * Returns:
> + * id of blt tiling like T_LINEAR, T_XMAJOR, etc
> + */
> +enum blt_tiling_type i915_tile_to_blt_tile(uint32_t tiling)
> +{
> +	switch (tiling) {
> +	case I915_TILING_NONE:	return T_LINEAR;
> +	case I915_TILING_X:	return T_XMAJOR;
> +	case I915_TILING_Y:	return T_YMAJOR;
> +	case I915_TILING_4:	return T_TILE4;
> +	case I915_TILING_64:	return T_TILE64;
> +	case I915_TILING_Yf:	return T_YFMAJOR;
> +	default:
> +		igt_assert_f(0, "Unknown tiling!\n");
> +	}
> +}
> +
>  /**
>   * blt_get_min_stride
>   * @width: width in pixels
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index fcfce69bee..6daf46aea4 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -214,6 +214,7 @@ bool blt_uses_extended_block_copy(int fd);
>  
>  const char *blt_tiling_name(enum blt_tiling_type tiling);
>  int blt_tile_to_i915_tile(enum blt_tiling_type tiling);
> +enum blt_tiling_type i915_tile_to_blt_tile(uint32_t tiling);
>  
>  uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
>  			    enum blt_tiling_type tiling);
> -- 
> 2.34.1
> 

I need those two patches to my current work and as they are r-b'd
and safe I'm going to merge them individually.

--
Zbigniew
