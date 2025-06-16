Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F79AC71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 09:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B43D10E305;
	Mon, 16 Jun 2025 09:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q39/61jY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719B710E305
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750066297; x=1781602297;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B9ns3ITVV+1DypD26gU7v1LWCYr0HfJGgdmxVrxiZm0=;
 b=Q39/61jYhFZKvVD64I3rWBjfrxWWvk1Wto1youReKC+dGmhrZfeZ/eTt
 oVIGJsVgbtKvqE7bfeCxUczNxWN6NYnQw+d1WT2u4GMy1n0mDs1cZEo/K
 2Ed8tQwLrGnudic3iDUh/q/o529Yja+CKl7CfX2GNp2ZF6ecBWCpdxmNf
 3TQv4T+2lEktYVzMV8WdJgXFic0hqaD8OIgsJnrnhkglU6iOWAeuMtnT0
 ouHxBwMk6PvqWX+R7c8vYr5BehnvfFxhHTN2lqX9v+++XbPe6c1/rEAH8
 gNbMfsZ7s+KElYNR35rmwe2owQmJod3//VQ31PfXKW2lJ6Tij+z5wXu1f A==;
X-CSE-ConnectionGUID: ccNy6GTpTGa9pfb+Exbs/w==
X-CSE-MsgGUID: +0NE1lIVSn6J5yD+YMrT4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62811655"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="62811655"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:31:30 -0700
X-CSE-ConnectionGUID: LFgsKFMaTNWA1z5estkLpQ==
X-CSE-MsgGUID: PTqBT0nFQGu4jaGOgV2xew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="152252937"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.159])
 ([10.245.244.159])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 02:31:29 -0700
Message-ID: <2bb2b078-f903-4a4d-8e29-8ff31f59c05b@intel.com>
Date: Mon, 16 Jun 2025 10:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM
 flag where it's missing
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com
References: <20250616085417.20178-1-lukasz.laguna@intel.com>
 <20250616085417.20178-2-lukasz.laguna@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250616085417.20178-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 16/06/2025 09:54, Lukasz Laguna wrote:
> Set DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM flag when creating BOs
> that will be CPU-mapped, to ensure that the corresponding VRAM
> allocation will use the CPU accessible part of VRAM.
> 
> This is essential for small-bar systems, where omitting the flag may
> cause failures or SIGBUS crashes due to the CPU accessing non-visible
> VRAM.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_pat.c        | 3 ++-
>   tests/intel/xe_spin_batch.c | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 88d8de9dd..8bb0ac167 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -582,7 +582,8 @@ static void prime_self_import_coh(void)
>   	fd1 = drm_open_driver(DRIVER_XE);
>   	fd2 = drm_open_driver(DRIVER_XE);
>   
> -	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1), 0,
> +	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>   					  DRM_XE_GEM_CPU_CACHING_WC);
>   
>   	dma_buf_fd = prime_handle_to_fd(fd1, dst_handle);
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 21b08ba06..48a888e35 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -442,7 +442,8 @@ static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
>   	vm = xe_vm_create(fd, 0, 0);
>   	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>   	bb_size = xe_bb_size(fd, sizeof(*data));
> -	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id), 0);
> +	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   	bb_addr = intel_allocator_alloc_with_strategy(ahnd, bb, bb_size, 0,
>   						      ALLOC_STRATEGY_LOW_TO_HIGH);
>   	data = xe_bo_map(fd, bb, bb_size);

