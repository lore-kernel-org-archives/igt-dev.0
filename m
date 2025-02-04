Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4CBC0218F
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 05:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB0810E13B;
	Tue,  4 Feb 2025 05:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnYfDRWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C50E10E13B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 05:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738648535; x=1770184535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sB5OQRQVq5y3TjWMHI9rnss3P2/o26igH8imKN30QxE=;
 b=TnYfDRWBYLYhqZUOYTW5eAzHo1TQLYO3g3qcueP/KA3CD21ypm5xKPkr
 RumzA2w1qb7USSO/rQ8BPpJs3zpuN+jcSEu10Pzc2af5KmzFLOJ7T5ZIe
 faCZlx7LFfDSysfHnv65+5MqAnl1A45OrwH1MpTtNiPsfpIqNeCvAlP6/
 WBnRPthhrVPi3ntxzHBUAwinAljGw6InFDwdGlVxbsHPtYDogINFqmfhL
 v18lVeXXBosJmLmUNfHUMOTr9Tlae78TxBoPrJoPXa7QwN+zBmmq2LWmT
 uBlG8qXEqjoEtoQPgMR45/Vsy2+LfBgZ3rbe2x89OywaizXEpLHrILLDU A==;
X-CSE-ConnectionGUID: ygm7jsapQ3Own/Q++FuzTA==
X-CSE-MsgGUID: TcAdmnVSR8OOS1Hr6gfPiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38391581"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="38391581"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 21:55:35 -0800
X-CSE-ConnectionGUID: hULX5dMKQzmyGHyMMAmzaQ==
X-CSE-MsgGUID: qlQzvRvMTAi9We6lTd5riA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110384367"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.111])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 21:55:34 -0800
Date: Tue, 4 Feb 2025 06:55:31 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] lib/intel_compute: Align objects on 64K for xehp
Message-ID: <20250204055531.njw5xxuaybfiobqx@zkempczy-mobl2>
References: <20250203133916.843931-1-francois.dugast@intel.com>
 <20250203133916.843931-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203133916.843931-2-francois.dugast@intel.com>
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

On Mon, Feb 03, 2025 at 02:38:46PM +0100, Francois Dugast wrote:
> Some of the buffers are aligned on 4K. Ensure 64K alignment
> in preparation for a switch to using xe_bo_create() during
> buffers creation.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index f1520aad4..983b2e2c3 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -24,9 +24,9 @@
>  #define MEDIA_STATE_FLUSH		0x0
>  #define MAX(X, Y)			(((X) > (Y)) ? (X) : (Y))
>  #define SIZE_DATA			64
> -#define SIZE_BATCH			0x1000
> -#define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
> -#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
> +#define SIZE_BATCH			0x10000
> +#define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
> +#define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
>  #define ADDR_BATCH			0x100000ULL
>  #define ADDR_INPUT			0x200000ULL
>  #define ADDR_OUTPUT			0x300000ULL
> @@ -38,7 +38,7 @@
>  
>  #define ADDR_GENERAL_STATE_BASE		0x80000000ULL
>  #define ADDR_INSTRUCTION_STATE_BASE	0x90000000ULL
> -#define OFFSET_BINDING_TABLE		0x1000
> +#define OFFSET_BINDING_TABLE		0x10000
>  
>  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
>  #define OFFSET_STATE_SIP			0xFFFF0000
> @@ -746,8 +746,8 @@ static void xehp_create_surface_state(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> -	addr_bo_buffer_batch[b++] = 0x00001000;
> -	addr_bo_buffer_batch[b++] = 0x00001040;
> +	addr_bo_buffer_batch[b++] = 0x00010000;
> +	addr_bo_buffer_batch[b++] = 0x00010040;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -825,7 +825,7 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = GEN8_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2;
>  	addr_bo_buffer_batch[b++] = (addr_surface_state_base & 0xffffffff) | 0x6;
>  	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
> -	addr_bo_buffer_batch[b++] = 0x00002000;
> +	addr_bo_buffer_batch[b++] = 0x00012000;

I've checked this and it seems this line should be removed
(0x001ff000 is enough and pool alloc has 4 and not 5 dwords).
I mean this dword stays here by accident during reversing.
Rest looks good to me. With this nit:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	addr_bo_buffer_batch[b++] = 0x001ff000;
>  
>  	addr_bo_buffer_batch[b++] = XEHP_COMPUTE_WALKER | 0x25;
> @@ -852,7 +852,7 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00180000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00001080;
> +	addr_bo_buffer_batch[b++] = 0x00010080;
>  	addr_bo_buffer_batch[b++] = 0x0c000002;
>  
>  	addr_bo_buffer_batch[b++] = 0x00000008;
> @@ -895,10 +895,10 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
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
> @@ -907,7 +907,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
>  		  .name = "general state base" },
>  		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
> -		  .size = 0x1000,
> +		  .size = 0x10000,
>  		  .name = "binding table" },
>  		{ .addr = ADDR_BATCH, .size = SIZE_BATCH,
>  		  .name = "batch" },
> @@ -918,7 +918,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_create(fd, &execenv, eci);
>  
>  	/* Sets Kernel size */
> -	bo_dict[0].size = ALIGN(size, 0x1000);
> +	bo_dict[0].size = ALIGN(size, 0x10000);
>  
>  	bo_execenv_bind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
>  
> -- 
> 2.43.0
> 
