Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81932C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 06:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C37010E209;
	Thu,  3 Apr 2025 06:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rf/LolTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694B210E209
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743662681; x=1775198681;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y6MjEbdmHx6EeKytzlaCRGIHI2+xI7r53609XGco39M=;
 b=Rf/LolTjWPfQgq2YK7D0uE/NvMRCcCxZ45XDNKw7HmgvK+FSTNWyk8dA
 atsoAOgUBVZtbbkBhpzGatEvVHmWofnE3CG1oMJBDk3DICsClmR8VeX5F
 gZJmB0eODBswGhCo70i3RLYh/4kqNMljB1LBYp30TnU/XlsIt2w/SaC6U
 PV2xRiD3kkfjex2/U73ULVDDEVB5rGCJKs+ydAV4OHsf+O+uzfhj2ntJf
 jfN3lt+C9WCpa+dgUyFPsNICv/3XGEa8/3CAJx+6Ee93XF/6HVnO/sQdh
 7FCKW9z8/bw08ijme8WwPuGHxI+Bn2tkdwLXp80I9/EJk4wc3aSc1KoS9 Q==;
X-CSE-ConnectionGUID: zxPf8GLcSTSzDCQIILzsxQ==
X-CSE-MsgGUID: VpiE4VJQTn2cm4zW2jueaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56419107"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="56419107"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 23:44:41 -0700
X-CSE-ConnectionGUID: N4i22ownRROU9U4kotq7Sg==
X-CSE-MsgGUID: NYNa7XQfSlOVJRY3YBUQgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="157873589"
Received: from opintica-mobl1 (HELO localhost) ([10.245.244.96])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 23:44:39 -0700
Date: Thu, 3 Apr 2025 08:44:35 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t,v5 1/5] lib/intel_blt: Promote MEM_COPY_MOCS_SHIFT
Message-ID: <20250403064435.6wudnr3365ifvf5r@zkempczy-mobl2>
References: <20250402115055.156765-1-francois.dugast@intel.com>
 <20250402115055.156765-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402115055.156765-2-francois.dugast@intel.com>
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

On Wed, Apr 02, 2025 at 01:49:59PM +0200, Francois Dugast wrote:
> Move MEM_COPY_MOCS_SHIFT to the header to use it elsewhere without code
> duplication. Add XE2_ prefix to make purpose clearer.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/intel_blt.c | 3 +--
>  lib/intel_blt.h | 1 +
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index b2fb3151e..7010d3ff7 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -21,7 +21,6 @@
>  
>  #define BITRANGE(start, end) (end - start + 1)
>  #define GET_CMDS_INFO(__fd) intel_get_cmds_info(intel_get_drm_devid(__fd))
> -#define MEM_COPY_MOCS_SHIFT                     25
>  
>  /* Blitter tiling definitions sanity checks */
>  static_assert(T_LINEAR == I915_TILING_NONE, "Linear definitions have to match");
> @@ -1840,7 +1839,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
>  	batch[i++] = src_offset << 32;
>  	batch[i++] = dst_offset;
>  	batch[i++] = dst_offset << 32;
> -	batch[i++] = mem->src.mocs_index << MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
> +	batch[i++] = mem->src.mocs_index << XE2_MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
>  	batch[i++] = MI_BATCH_BUFFER_END;
>  
>  	munmap(batch, mem->bb.size);
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 5d6191ac9..4bae0b47b 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -53,6 +53,7 @@
>  #include "intel_cmds_info.h"
>  
>  #define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >= 20 ? 512 : 256)
> +#define XE2_MEM_COPY_MOCS_SHIFT                     25
>  
>  enum blt_color_depth {
>  	CD_8bit,
> -- 
> 2.43.0
> 
