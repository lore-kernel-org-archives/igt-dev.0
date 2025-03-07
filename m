Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AF3C19F32
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 12:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC6B10E183;
	Fri,  7 Mar 2025 12:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHLkLcm2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D566E10E183
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Mar 2025 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741351232; x=1772887232;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2TRXZIanrjcsQXKI5RGvMdYdjQf+96yq+v+kTv88q1E=;
 b=RHLkLcm2kwvQqoGR+Nt0kgGO3KBq/DTofd2Vy65tdEyLDUBk4KxCfnOj
 J5uig5O1Tzus4gQdohXvij/Essj5sktq1hEU7+PLZarfs0IEDtNYEgkxq
 ZR5HVOGNNdGE8peM3f4KrTYn4pZ6f1xno797M/Mcvr5njRe6UsBuG4yNN
 w6rB13UFwZYAi72de+eXvpJMIQITVz5VdQ9yvtGs/Xk6tkdl6wYhPCYAc
 IseyUyqE5jU+hXAvepXv0v0KPf4PkFucoEcPgUj8wZVejTbET5Mejg9kK
 QjZiBQ6LDyZi/RLvk0ZPdcAdA3Wzmnd+k2bNydxLADBquoj+Z2OsSkl2R w==;
X-CSE-ConnectionGUID: Q2gL1Q3bT5GatP8YCSPsaA==
X-CSE-MsgGUID: Gbo5RZT0SbKkxaCDdQplyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42627926"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42627926"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:40:32 -0800
X-CSE-ConnectionGUID: zSIz+ivbQA+3Kxh3SHK1QA==
X-CSE-MsgGUID: wHBloCFJQ76BILR1aIT+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="123907826"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:40:30 -0800
Date: Fri, 7 Mar 2025 13:40:27 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/intel_compute: Align objects on 64K for xelpg
Message-ID: <20250307124027.f7bmy53d7d5bolo5@zkempczy-mobl2>
References: <20250307103951.16567-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307103951.16567-1-francois.dugast@intel.com>
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

On Fri, Mar 07, 2025 at 11:39:51AM +0100, Francois Dugast wrote:
> Ensure 64K alignment to be consistent with xehp and xehpc. Especially
> the binding table offset was changed to 0x10000 but this had not been
> taken into account for xelpg, so fix it.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/intel_compute.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index dd9c83c9c..28149db53 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1339,7 +1339,7 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00001080;
> +	addr_bo_buffer_batch[b++] = 0x00010080;
>  	addr_bo_buffer_batch[b++] = 0x0c000020;
>  
>  	addr_bo_buffer_batch[b++] = 0x00000008;
> @@ -1551,10 +1551,10 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  		  .size = 0x100000,
>  		  .name = "dynamic state base"},
>  		{ .addr = ADDR_SURFACE_STATE_BASE,
> -		  .size = 0x1000,
> +		  .size = 0x10000,
>  		  .name = "surface state base"},
>  		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
> -		  .size =  0x1000,
> +		  .size =  0x10000,
>  		  .name = "indirect object base"},
>  		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
>  		  .name = "addr input"},
> @@ -1563,7 +1563,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
>  		  .name = "general state base" },
>  		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
> -		  .size = 0x1000,
> +		  .size = 0x10000,
>  		  .name = "binding table" },
>  		{ .addr = ADDR_BATCH,
>  		  .size = SIZE_BATCH,
> @@ -1576,7 +1576,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
>  	/* Sets Kernel size */
> -	bo_dict[0].size = ALIGN(size, 0x1000);
> +	bo_dict[0].size = ALIGN(size, 0x10000);
>  
>  	bo_execenv_bind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
>  
> -- 
> 2.43.0
> 
