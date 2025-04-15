Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A17AC369B4
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 09:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E1510E6D3;
	Tue, 15 Apr 2025 09:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQDq1XIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5F010E6C2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744711063; x=1776247063;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DcLIEGAYBS1ulOaw4lU5/TvpVz9HBdA01MrdS+CTM7o=;
 b=DQDq1XIb60+VWvgtKhU61aBe/kaBjRX83xJjGp4fNPq1aBECW2980IjZ
 zsUFC4aGjX8aF1GBBoGElJQttYU4UEyQ30/69UqmPngTLpEh5S07k4ooI
 8bi6tr+MDmm0CSfMeSB0/5JmA24LfiqkEEtFkSCkp61RA4I8AHUnG9f2o
 OUMMGpFolLAtfwHlgiZjTQTa270Kjs+nRYeCqVgWX+6PV9jy0rnRZNj3O
 cdzKZgdACLhDEI33fJeJKTQOD2P/B9cOg7GEMcLnOXDW3KCAs8xlYPLDA
 3FKFlhgWoM+LlVMrQf7AjtJLni5A5+EB67UbX01Y4VT9d69m/OKYWv5KQ g==;
X-CSE-ConnectionGUID: 0bQrhD98TJq94yBakDuSDQ==
X-CSE-MsgGUID: Dzjhs02bRu6yAr6p6OwaYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="68702859"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="68702859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:57:42 -0700
X-CSE-ConnectionGUID: QR7s/oOHT82SrTgowdmLUw==
X-CSE-MsgGUID: wAxjG8yVTlSMGKM+LAuOPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="153275348"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:57:40 -0700
Date: Tue, 15 Apr 2025 11:57:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t, v3 10/11] lib/intel_compute: Use constants for
 thread groups and local work size
Message-ID: <20250415095737.2ud6w3nho2igrrtf@zkempczy-mobl2>
References: <20250414164007.57713-1-francois.dugast@intel.com>
 <20250414164007.57713-11-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414164007.57713-11-francois.dugast@intel.com>
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

On Mon, Apr 14, 2025 at 06:39:05PM +0200, Francois Dugast wrote:
> Define new constants and use them to build the pipeline instead of
> magic values. This also helps homogenize the code to enforce a
> similar execution across GPUs. Having them grouped together in the
> file makes it easier to experiment with different values, as they
> depend on each other but where previously distributed.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c | 71 ++++++++++++++++++++++++++-------------------
>  1 file changed, 41 insertions(+), 30 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 6b779c340..d4609da15 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -55,6 +55,17 @@
>  
>  #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
>  #define MAGIC_LOOP_STOP			0x12341234
> +
> +#define THREADS_PER_GROUP		32
> +#define THREAD_GROUP_X			MAX(1, SIZE_DATA / (ENQUEUED_LOCAL_SIZE_X * \
> +							    ENQUEUED_LOCAL_SIZE_Y * \
> +							    ENQUEUED_LOCAL_SIZE_Z))
> +#define THREAD_GROUP_Y			1
> +#define THREAD_GROUP_Z			1
> +#define ENQUEUED_LOCAL_SIZE_X		1024
> +#define ENQUEUED_LOCAL_SIZE_Y		1
> +#define ENQUEUED_LOCAL_SIZE_Z		1
> +

Functionally equal and more descriptive:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
>  /*
>   * TGP  - ThreadGroup Preemption
>   * WMTP - Walker Mid Thread Preemption
> @@ -784,9 +795,9 @@ static void xehp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000400;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1061,9 +1072,9 @@ static void xehpc_create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000400;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> @@ -1071,9 +1082,9 @@ static void xehpc_create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
>  	addr_bo_buffer_batch[b++] = addr_output >> 32;
>  	addr_bo_buffer_batch[b++] = loop_count;
> -	addr_bo_buffer_batch[b++] = 0x00000400;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
>  }
>  
>  static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> @@ -1164,7 +1175,7 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00180000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x0c000020;
> +	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
>  
>  	addr_bo_buffer_batch[b++] = 0x00000008;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1275,9 +1286,9 @@ static void xelpg_create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
>  	addr_bo_buffer_batch[b++] = addr_output >> 32;
>  	addr_bo_buffer_batch[b++] = loop_count;
> -	addr_bo_buffer_batch[b++] = 0x00000400; // Enqueued local size X
> -	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Y
> -	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Z
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1357,10 +1368,10 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0xbe040000;
>  	addr_bo_buffer_batch[b++] = 0xffffffff;
>  	addr_bo_buffer_batch[b++] = 0x000003ff;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = THREAD_GROUP_X;
>  
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = THREAD_GROUP_Y;
> +	addr_bo_buffer_batch[b++] = THREAD_GROUP_Z;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1375,7 +1386,7 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00010080;
> -	addr_bo_buffer_batch[b++] = 0x0c000020;
> +	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
>  
>  	addr_bo_buffer_batch[b++] = 0x00000008;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1388,9 +1399,9 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000400;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> @@ -1495,10 +1506,10 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  		 */
>  		addr_bo_buffer_batch[b++] = 0x00200000; // Thread Group ID X Dimension
>  	else
> -		addr_bo_buffer_batch[b++] = 0x00000002;
> +		addr_bo_buffer_batch[b++] = THREAD_GROUP_X;
>  
> -	addr_bo_buffer_batch[b++] = 0x00000001; // Thread Group ID Y Dimension
> -	addr_bo_buffer_batch[b++] = 0x00000001; // Thread Group ID Z Dimension
> +	addr_bo_buffer_batch[b++] = THREAD_GROUP_Y;
> +	addr_bo_buffer_batch[b++] = THREAD_GROUP_Z;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -1519,7 +1530,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x0c000020;
> +	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00001047;
> @@ -1530,9 +1541,9 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000400;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> @@ -1554,9 +1565,9 @@ static void xe2_create_indirect_data_inc_kernel(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000400;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -- 
> 2.43.0
> 
