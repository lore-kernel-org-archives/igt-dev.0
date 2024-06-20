Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60BBC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 10:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F9910E8A6;
	Thu, 20 Jun 2024 10:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXa+KVo2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D952610E8A6
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718879702; x=1750415702;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iaaXPtxsFMKZiFGG3qc/6DsBdIFnLet30zM+Otth8MM=;
 b=UXa+KVo2QoUGzpVa4V9VfrfbIgkCAwjtbGgA1MG9ZjJ76A+ueJayhVjD
 7EhxtoaGW95Z/oDJ2vZxMSOLX6otBoY4rDIBrpQyr+wtZkHofH1rGHB4l
 bV2fsRWBLy7LAPstBidHmOweGl+o20qv6y9j4lJ8XZxzZyBZlVw9aCeBj
 wS3dx/U0nENR7tzvgdInaY2E8AUjTsobgllR7XhDGW+T/OPkzTAb4vR5Q
 6P6DWoCWFMj61tyYs05zEmId49ziyIaO1eQdxgirdsphKV6t3qE2fM5Sm
 YAwNTHP0FwHCOm/U4a1v6oN61M7LY6oUDLXKPtAl0ZkD2MNR7+J+7ZCGb Q==;
X-CSE-ConnectionGUID: o1eI+pFVTbCUtRcbXQAAMw==
X-CSE-MsgGUID: YL26UIpMTZ6HgrRZ3wYYvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27268215"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="27268215"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:35:02 -0700
X-CSE-ConnectionGUID: sGWYeGeoQfSC0knIpUk0CA==
X-CSE-MsgGUID: CIqXZvW0RTOgplsb5s871A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="73408490"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:35:00 -0700
Date: Thu, 20 Jun 2024 12:34:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/intel_cmds_info: Remove duplicate
 block-copy tiling definition
Message-ID: <20240620103458.a5qamrzyxm2sqmbz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240620094822.524239-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620094822.524239-1-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2024-06-20 at 11:48:21 +0200, Zbigniew Kempczyński wrote:
> Block-copy definition for Xe2 duplicates DG2+ so remove it.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_cmds_info.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index 1416e02cd4..d581edb6eb 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -64,11 +64,6 @@ static const struct blt_cmd_info
>  						 BLT_CMD_EXTENDED |
>  						 BLT_CMD_SUPPORTS_COMPRESSION);
>  
> -static const struct blt_cmd_info
> -		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
> -						 BLT_CMD_EXTENDED |
> -						 BLT_CMD_SUPPORTS_COMPRESSION);
> -
>  static const struct blt_cmd_info
>  		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
>  						 BLT_CMD_EXTENDED);
> @@ -183,7 +178,7 @@ const struct intel_cmds_info gen12_pvc_cmds_info = {
>  const struct intel_cmds_info xe2_cmds_info  = {
>  	.blt_cmds = {
>  		[XY_FAST_COPY] = &dg2_xy_fast_copy,
> -		[XY_BLOCK_COPY] = &xe2_xy_block_copy,
> +		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
>  		[MEM_COPY] = &pvc_mem_copy,
>  		[MEM_SET] = &pvc_mem_set,
>  	},
> -- 
> 2.34.1
> 
