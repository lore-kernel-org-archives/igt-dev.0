Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEFAC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 09:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E7310E0D8;
	Tue, 15 Apr 2025 09:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9N0GCho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CF910E0D8
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744710815; x=1776246815;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=s408dK4DF2j3kdu+JC1Uw9qPIYSOZ89m4UPJUbfr178=;
 b=V9N0GChodNGsNhpAJqTKwrFWfwHZJekRYmJHu4M8ZszLG07dSR6KJ96u
 JCxth9JMWzww1+EIjaY9rVHlYNSLl7VZeYh61PXwdvFU91LBEn94ENccE
 aeng/WwTxorCW0z6e96RfblJbDWelSYF95VpNXgRAoIMbU6DMQWZ6qaZ3
 V6bws/kus9jHlqYjjHldccR3aL04TDqL1fE052u5FeuHz91aUfbfUZ/gS
 ajMr8sLU+YWuZ0m43AddREproS63ipCZFBFzElEAyD1PmLH6BzUnXmOX3
 69KhOp6WU7JV59/zeFPJqxflXuqbrkm5fXap45E/8pfCXgXrAqtvVyWIB g==;
X-CSE-ConnectionGUID: pPkBfOQwQqWcYoRfigqR/A==
X-CSE-MsgGUID: A5beDPwdTluK+vhRARwpTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45344967"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45344967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:53:35 -0700
X-CSE-ConnectionGUID: iNh3oWvtRammfpj3q/ydQw==
X-CSE-MsgGUID: 2ObkTSZ6Rj20iJn/tZa7zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135059079"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:53:33 -0700
Date: Tue, 15 Apr 2025 11:53:30 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t, v3 09/11] lib/intel_compute: Fix enqueued local
 size starting with xelpg
Message-ID: <20250415095330.kiogjjjvdgdn4lax@zkempczy-mobl2>
References: <20250414164007.57713-1-francois.dugast@intel.com>
 <20250414164007.57713-10-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250414164007.57713-10-francois.dugast@intel.com>
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

On Mon, Apr 14, 2025 at 06:39:04PM +0200, Francois Dugast wrote:
> The metadata of the compute kernel used for xelpg shows the arguments
> positions has changed. The enqueued_local_size comes at offset 52, right
> after the value of the "count" argument. Create a new create_indirect_data
> function matching this.
> 
> Relevant part of the kernel metadata:
> 
>       - arg_type:        arg_bypointer
>         offset:          32
>         size:            8
>         arg_index:       0
>         addrmode:        stateless
>         addrspace:       global
>         access_type:     readwrite
>       - arg_type:        arg_bypointer
>         offset:          40
>         size:            8
>         arg_index:       1
>         addrmode:        stateless
>         addrspace:       global
>         access_type:     readwrite
>       - arg_type:        arg_byvalue
>         offset:          48
>         size:            4
>         arg_index:       2
>       - arg_type:        enqueued_local_size
>         offset:          52
>         size:            12
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

I had to check this on i915/mtl, looks good and works correct.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
> ---
>  lib/intel_compute.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index b29f8d9f8..6b779c340 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1263,6 +1263,31 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_destroy(&execenv);
>  }
>  
> +static void xelpg_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				      uint64_t addr_input,
> +				      uint64_t addr_output,
> +				      unsigned int loop_count)
> +{
> +	int b = 0;
> +
> +	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_input >> 32;
> +	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_output >> 32;
> +	addr_bo_buffer_batch[b++] = loop_count;
> +	addr_bo_buffer_batch[b++] = 0x00000400; // Enqueued local size X
> +	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Y
> +	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Z
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +}
> +
>  static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  					uint64_t addr_general_state_base,
>  					uint64_t addr_surface_state_base,
> @@ -1595,7 +1620,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
> +	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
>  	input_data = (float *) bo_dict[4].data;
> @@ -1688,7 +1713,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
> +	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
>  	input_data = (float *) bo_dict[4].data;
> @@ -2022,7 +2047,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  
>  	create_dynamic_state(bo_dict_short[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict_short[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
> +	xelpg_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict_short[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
>  	input_data = (float *) bo_dict_long[4].data;
> -- 
> 2.43.0
> 
