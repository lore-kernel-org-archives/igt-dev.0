Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80135C30658
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 17:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2334810E059;
	Fri, 28 Jun 2024 17:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7W3vbSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B7810E232
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 17:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719594154; x=1751130154;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wzy0kHAf6tL6tkvNtp2T3+R0cd7u6ZJBgUxMOl+rfNw=;
 b=Z7W3vbSJ8Fpj94wOqlyIhC3opKsvF156h3lMczSXzg9H3rEccklHUXRh
 7+gAFKmzphysM4NcgbCGFIGR2ehMc4Ian91cGMRoVKCI1mU1oea92ZT90
 HdjWrhLYKX0EC3mW2UyTnNv4vBzrvryXQlmUP14Mc83MH/I8GlWfT0rYM
 f3jhbXbUleaFFiZ1eST0LBM9DrzFvvYv1m+kXbrvmP4V74pLjZgqnVaqk
 EMA/rHfq27TQhLHAV4ig61m8mmz2RqvM+dNOo164sIEZ8olOOQI+gaFZ5
 iYtFd2oRxHu2CgbQGUxnt1E99eUGrtuiyVFGHiI8eTgAs1OjH4UX+6yvF Q==;
X-CSE-ConnectionGUID: Pi24zqa0Rvevg+Hd8YmYcg==
X-CSE-MsgGUID: ZYU4KIzuQMmGjLLpiKz2hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27474203"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="27474203"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 10:02:34 -0700
X-CSE-ConnectionGUID: ImV8xTa9SR6kV6RKM74HnQ==
X-CSE-MsgGUID: SmcaDY2+Q2y6Y7FZNdpWhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="67990920"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 10:02:33 -0700
Date: Fri, 28 Jun 2024 19:02:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_exec_store: Add
 basic_inst_benchmark
Message-ID: <20240628170230.6wqbesoeoz7ezpsl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
References: <20240625130816.4338-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240625130816.4338-1-nirmoy.das@intel.com>
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
On 2024-06-25 at 15:08:16 +0200, Nirmoy Das wrote:

test names should use '-' as separator, you also used other
name so:
[PATCH i-g-t v3] tests/intel/xe_exec_store: Add basic_inst_benchmark

should be:
[PATCH i-g-t v3] tests/intel/xe_exec_store: Add basic-store-benchmark

> Add basic_inst_benchmark to benchmark this basic operation
---------- ^----^
Same here, use '-' as separator, s/_inst_/-store-/

> for BO sizes to get basic understanding how long it takes
> bind a BO and run simple GPU command on it.
> 
> This not a CI test but rather for developer to identify various
> bottleneck/regression in  BO binding.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 112 ++++++++++++++++++++++++++++++------
>  1 file changed, 94 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index c872c22d5..aaabdbec3 100644
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

Could you use more human-friendly strings here? 4KB, 2MB, ...1GB

> +	};
> +
> +	struct timeval start, end;
> +	long seconds, useconds, utime;
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
> +		utime = (seconds * 1000000) + useconds;

imho there is igt function for such time measure.

> +
> +		igt_info("Time taken for size %s: %ld us\n", size_name, utime);
> +	}
> +}
> +
>  #define PAGES 1
>  #define NCACHELINES (4096/64)
>  /**
> @@ -342,12 +400,30 @@ igt_main
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
> +		/* Enable for iGFX only for now */
> +		igt_require(! xe_has_vram(fd));
-------------------- ^
Please use checkpatch.pl for similar hints.

Could you test with 0 for dGFX?

> +
> +		for (int i = 0; i < ARRAY_SIZE(tests); i++) {
> +			igt_dynamic_f("%s", tests[i].name);
----------------------------------------------^
This is the reason you didn't see dynamic tests running with
--dyn WC, it should be:

> +			engine = xe_engine(fd, 1);
> +			basic_inst_benchmark(fd, STORE, &engine->instance, tests[i].cache);
> +		}
			igt_dynamic_f("%s", tests[i].name) {
    			engine = xe_engine(fd, 1);
	    		basic_inst_benchmark(fd, STORE, &engine->instance, tests[i].cache);
            }

Btw should you add a skip if engine == NULL?

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
> @@ -356,7 +432,7 @@ igt_main
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
