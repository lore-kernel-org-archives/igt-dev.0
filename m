Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C66BC2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 14:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A5910EA23;
	Thu, 20 Jun 2024 14:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9vsJYk7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3179910EA23
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718893240; x=1750429240;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L7si0VTquPMjHKioxucjMPhAqMvmK6DgTAKBns4DZLc=;
 b=n9vsJYk7dENZNFjg9ZwXU9Vpe7KbBMkI1nEOvqe98RwSDzD2+jPNbnxs
 LJX6+mEeJuA4DpQMJrbour4RNHR+ZB4vU8MzriQjVWoY67od9BGzFlrfL
 gUd85oNxBvb5DEYISXdey8GVrHNcmhnCT5DSmutLIeEHAvMWYxZx3Tjab
 FcyUMUl1LQWk8vYA9DxFhmoieUYdZ+0MZ+u4mIoU37V3nEKCp2ziwivUz
 TdwDyKVzsdghQdrzTb1l9MZUC9/nVHH8PCGHYsuGdW3uxfQWpEg+NwUtx
 PPGObWAU/hJtAJeUZtwiNG9HZwdAJv+buUWNn4+uHf21aLFVtqfO7pSfd w==;
X-CSE-ConnectionGUID: YeS2YY9hRzqqn3Zlqpkw/Q==
X-CSE-MsgGUID: idAysuhzQri4dozctP7L/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15702685"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15702685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:20:26 -0700
X-CSE-ConnectionGUID: u1yQB01vQs+7vTF/sLwVyw==
X-CSE-MsgGUID: Q8FYslaBRxC931MmCYGRKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="47178612"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 07:20:25 -0700
Date: Thu, 20 Jun 2024 16:20:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_exec_store: Add
 basic_inst_benchmark
Message-ID: <20240620142007.ywhmpjokrnnpbhnv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
References: <20240618173247.8233-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240618173247.8233-1-nirmoy.das@intel.com>
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

Hi Nirmoy,
On 2024-06-18 at 19:32:47 +0200, Nirmoy Das wrote:

[PATCH i-g-t v2] tests/intel/xe_exec_store: Add basic_inst_benchmark
-----------------------------------------------------^

You should use '-', also your subtest has 'store', so:

[PATCH i-g-t v2] tests/intel/xe_exec_store: Add basic-store-benchmark

> Add basic_inst_benchmark to benchmark this basic operation
> for BO sizes to get basic understanding how long it takes
> bind a BO and run simple GPU command on it.
> 
> This not a CI test but rather for developer to identify various
> bottleneck/regression in  BO binding.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 110 ++++++++++++++++++++++++++++++------
>  1 file changed, 92 insertions(+), 18 deletions(-)
> 

This didn't work on my ATS-M machine:

sudo build/tests/xe_exec_store --r basic-store-benchmark
IGT-Version: 1.28-g64414e4da (x86_64) (Linux: 6.9.0-rc6-xe-public-513ea833c201+ x86_64)
Using IGT_SRANDOM=1718890917 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic-store-benchmark
Starting dynamic subtest: WC
Dynamic subtest WC: SUCCESS (0.000s)
(xe_exec_store:15881) xe/xe_ioctl-CRITICAL: Test assertion failure function xe_bo_create_caching, file ../lib/xe/xe_ioctl.c:311:
(xe_exec_store:15881) xe/xe_ioctl-CRITICAL: Failed assertion: __xe_bo_create_caching(fd, vm, size, placement, flags, cpu_caching, &handle) == 0
(xe_exec_store:15881) xe/xe_ioctl-CRITICAL: Last errno: 22, Invalid argument
(xe_exec_store:15881) xe/xe_ioctl-CRITICAL: error: -1 != 0

Also, where are benchmarks? Do you print them only after
WC and WB runs? See also one nit below.

> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index c872c22d5..4b1c619e0 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -93,15 +93,10 @@ static void persistance_batch(struct data *data, uint64_t addr)
>  	data->addr = batch_addr;
>  
>  }
> -/**
> - * SUBTEST: basic-store
> - * Description: Basic test to verify store dword.
> - * SUBTEST: basic-cond-batch
> - * Description: Basic test to verify cond batch end instruction.
> - * SUBTEST: basic-all
> - * Description: Test to verify store dword on all available engines.
> - */
> -static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
> +
> +static void basic_inst_size(int fd, int inst_type,
> +			    struct drm_xe_engine_class_instance *eci,
> +			    uint16_t cpu_caching, size_t bo_size)
>  {
>  	struct drm_xe_sync sync[2] = {
>  		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> @@ -117,7 +112,6 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>  	uint32_t exec_queue;
>  	uint32_t bind_engine;
>  	uint32_t syncobj;
> -	size_t bo_size;
>  	int value = 0x123456;
>  	uint64_t addr = 0x100000;
>  	uint32_t bo = 0;
> @@ -127,12 +121,16 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>  	sync[1].handle = syncobj;
>  
>  	vm = xe_vm_create(fd, 0, 0);
> -	bo_size = sizeof(*data);
> -	bo_size = xe_bb_size(fd, bo_size);
>  
> -	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, eci->gt_id),
> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	if (cpu_caching)
> +		bo = xe_bo_create_caching(fd, vm, bo_size,
> +					  vram_if_possible(fd, eci->gt_id),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +					  cpu_caching);
> +	else
> +		bo = xe_bo_create(fd, vm, bo_size,
> +				  vram_if_possible(fd, eci->gt_id),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
>  	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>  	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
> @@ -167,6 +165,66 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +

Remove extra line.

Regards,
Kamil

> +/**
> + * SUBTEST: basic-store
> + * Description: Basic test to verify store dword.
> + * SUBTEST: basic-cond-batch
> + * Description: Basic test to verify cond batch end instruction.
> + * SUBTEST: basic-all
> + * Description: Test to verify store dword on all available engines.
> + */
> +static void basic_inst(int fd, int inst_type,
> +		       struct drm_xe_engine_class_instance *eci,
> +		       uint16_t cpu_caching)
> +{
> +	size_t bo_size;
> +
> +	bo_size = sizeof(struct data);
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	basic_inst_size(fd, inst_type, eci, cpu_caching, bo_size);
> +}
> +
> +/**
> + * SUBTEST: basic-store-benchmark
> + * Description: Basic test to verify time taken for doing store dword with various size.
> + */
> +static void basic_inst_benchmark(int fd, int inst_type,
> +				 struct drm_xe_engine_class_instance *eci,
> +				 uint16_t cpu_caching)
> +{
> +	struct {
> +		size_t size;
> +		const char *name;
> +	} sizes[] = {
> +		{SZ_4K, "SZ_4K"},
> +		{SZ_2M, "SZ_2M"},
> +		{SZ_64M, "SZ_64M"},
> +		{SZ_128M, "SZ_128M"},
> +		{SZ_256M, "SZ_256M"},
> +		{SZ_1G, "SZ_1G"}
> +	};
> +
> +	struct timeval start, end;
> +	long seconds, useconds, mtime;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(sizes); ++i) {
> +		size_t bo_size = sizes[i].size;
> +		const char *size_name = sizes[i].name;
> +
> +		gettimeofday(&start, NULL);
> +		basic_inst_size(fd, inst_type, eci, cpu_caching, bo_size);
> +		gettimeofday(&end, NULL);
> +
> +		seconds = end.tv_sec - start.tv_sec;
> +		useconds = end.tv_usec - start.tv_usec;
> +		mtime = ((seconds) * 1000 + useconds / 1000.0) + 0.5;
> +
> +		igt_info("Time taken for size %s: %ld ms\n", size_name, mtime);
> +	}
> +}
> +
>  #define PAGES 1
>  #define NCACHELINES (4096/64)
>  /**
> @@ -342,12 +400,28 @@ igt_main
>  
>  	igt_subtest("basic-store") {
>  		engine = xe_engine(fd, 1);
> -		basic_inst(fd, STORE, &engine->instance);
> +		basic_inst(fd, COND_BATCH, &engine->instance, 0);
> +	}
> +
> +	igt_subtest_with_dynamic("basic-store-benchmark") {
> +		struct dyn {
> +			const char *name;
> +			int cache;
> +		} tests[] = {
> +			{"WC", DRM_XE_GEM_CPU_CACHING_WC},
> +			{"WB", DRM_XE_GEM_CPU_CACHING_WB}
> +		};
> +
> +		for (int i = 0; i < ARRAY_SIZE(tests); i++) {
> +			igt_dynamic_f("%s", tests[i].name);
> +			engine = xe_engine(fd, 1);
> +			basic_inst_benchmark(fd, STORE, &engine->instance, tests[i].cache);
> +		}
>  	}
>  
>  	igt_subtest("basic-cond-batch") {
>  		engine = xe_engine(fd, 1);
> -		basic_inst(fd, COND_BATCH, &engine->instance);
> +		basic_inst(fd, COND_BATCH, &engine->instance, 0);
>  	}
>  
>  	igt_subtest_with_dynamic("basic-all") {
> @@ -356,7 +430,7 @@ igt_main
>  				      xe_engine_class_string(hwe->engine_class),
>  				      hwe->engine_instance,
>  				      hwe->gt_id);
> -			basic_inst(fd, STORE, hwe);
> +			basic_inst(fd, STORE, hwe, 0);
>  		}
>  	}
>  
> -- 
> 2.42.0
> 
