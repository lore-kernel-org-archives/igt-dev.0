Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B629C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 09:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE12510E5DB;
	Tue, 25 Feb 2025 09:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dr9Zx24D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BF210E5DB
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740475379; x=1772011379;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1Q/F+Hyz6nK8mV5RoYy8M3O5v8SmQbGN9XjcYrh8NmI=;
 b=dr9Zx24D+nBk6Po5uulVNwJumL4fFvTb81xNVh8RGSQg1jidNoU3TaTE
 hPx/waNvOXFXOdO8GbWxaIpajgWpOhcLlRZ5m7NNf/EhecyLoHIv0+8Lr
 YEkNRnzWEM+mZxNrfrwaqIK7UFSjRXbd6xKLPBC5cGno3w6RMjTkL1Qv5
 k8mYgNa4lvXBjX5B/gwa2VH7c47J4Z7SSzlI/uhwwiTD7tbyoqpJ7thm6
 OTpSaWL9gxzd5u6DiT+ZZMWaSFBSM+iY83VL2qNBVZJqwheLSeM183wxO
 26n9k1uUUu/jne0OaMr60tIRD7fLCrh/7p3N4cYzM1A7FnAX6IEkmBjcB w==;
X-CSE-ConnectionGUID: R3ydy8tQSmmyDZpWB/mQaA==
X-CSE-MsgGUID: hIrTF1T0QDqnLHcssaOE9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45180551"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="45180551"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:22:59 -0800
X-CSE-ConnectionGUID: QhuthknCRqKlz8RUI90y5Q==
X-CSE-MsgGUID: 5nwN8RoWTZ+8BIJG+GRPaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="121312719"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.229])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:22:57 -0800
Date: Tue, 25 Feb 2025 10:22:54 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t,v2 1/6] lib/intel_compute: Make loop count a
 parameter
Message-ID: <20250225092254.ptziw5x57qof2xxs@zkempczy-mobl2>
References: <20250224144705.1019940-1-francois.dugast@intel.com>
 <20250224144705.1019940-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224144705.1019940-2-francois.dugast@intel.com>
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

On Mon, Feb 24, 2025 at 03:46:09PM +0100, Francois Dugast wrote:
> The loop count was previously hardcoded as 0x400 in *create_indirect_data()
> functions. Turn it into a parameterized value that gets used during the
> batch buffer generation so that the function user can specify the count.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/intel_compute.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index f46de1074..b698bf77d 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -293,7 +293,8 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
>  static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  				 uint64_t addr_input,
>  				 uint64_t addr_output,
> -				 uint32_t end_value)
> +				 uint32_t end_value,
> +				 unsigned int loop_count)
>  {
>  	uint32_t val = 0;
>  	int b = 0, curr = 0;
> @@ -313,7 +314,7 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
>  	addr_bo_buffer_batch[b++] = addr_output >> 32;
>  
> -	addr_bo_buffer_batch[b++] = 0x00000400;
> +	addr_bo_buffer_batch[b++] = loop_count;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -708,7 +709,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
>  	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT,
> -			     IS_DG1(devid) ? 0x200 : 0x40);
> +			     IS_DG1(devid) ? 0x200 : 0x40, SIZE_DATA);
>  
>  	dinput = (float *)bo_dict[4].data;
>  	srand(time(NULL));
> @@ -746,7 +747,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  
>  static void xehp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  				      uint64_t addr_input,
> -				      uint64_t addr_output)
> +				      uint64_t addr_output,
> +				      unsigned int loop_count)
>  {
>  	int b = 0;
>  
> @@ -754,7 +756,7 @@ static void xehp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = addr_input >> 32;
>  	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
>  	addr_bo_buffer_batch[b++] = addr_output >> 32;
> -	addr_bo_buffer_batch[b++] = 0x00000400;
> +	addr_bo_buffer_batch[b++] = loop_count;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -986,7 +988,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
>  	dinput = (float *)bo_dict[4].data;
> @@ -1020,7 +1022,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  
>  static void xehpc_create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  				       uint64_t addr_input,
> -				       uint64_t addr_output)
> +				       uint64_t addr_output,
> +				       unsigned int loop_count)
>  {
>  	int b = 0;
>  
> @@ -1036,7 +1039,7 @@ static void xehpc_create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = addr_input >> 32;
>  	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
>  	addr_bo_buffer_batch[b++] = addr_output >> 32;
> -	addr_bo_buffer_batch[b++] = 0x00000400;
> +	addr_bo_buffer_batch[b++] = loop_count;
>  	addr_bo_buffer_batch[b++] = 0x00000400;
>  	addr_bo_buffer_batch[b++] = 0x00000001;
>  	addr_bo_buffer_batch[b++] = 0x00000001;
> @@ -1191,7 +1194,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
> -	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  
>  	dinput = (float *)bo_dict[2].data;
>  	srand(time(NULL));
> @@ -1551,7 +1554,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
>  	dinput = (float *)bo_dict[4].data;
> @@ -1640,7 +1643,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
>  	dinput = (float *)bo_dict[4].data;
> @@ -1946,7 +1949,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  
>  	create_dynamic_state(bo_dict_short[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict_short[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict_short[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
>  	dinput = (float *)bo_dict_long[4].data;
> -- 
> 2.43.0
> 
