Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FA8C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 17:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D2010E084;
	Tue, 18 Jun 2024 17:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObzWoyFE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01B010E084
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 17:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718732922; x=1750268922;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ex22H+zwntWnKbwjo094p59gL5sH+M29+BC+x0EVrdE=;
 b=ObzWoyFEPiJul61MWz2rLrktj1FSoXdnad8t0gmdGIr3kK3lsjDWqHHx
 4ZIxYIEBhWYy5VHZcNogtWGxbYOfwuo+INNhsTp4Lt0qyo78hBsrYWiMm
 CnA293w2MY6Uv7fuL/KbG9TbDRXz607zamSYS3FVN5b/wIp+TPeIRXA7F
 jTsVnnYkRC27lATReIakUFzIKExjQPNv+RgjEMds801uwKKBPoG4VJdp5
 qZ59cWsbReIJnNinWEWmWfmKux93KF1AR5IX2iE/HCb2OdlK17+ZwNIR9
 NE9AA6gAFueIYwavdYt2Kt8sn52LiF0mlWxpZtsaps2AStsU+PDGHlW78 Q==;
X-CSE-ConnectionGUID: BwvGm4NZQQW364grpMtRgA==
X-CSE-MsgGUID: IeDserO5T4uWgn3IKIAViA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="18549945"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="18549945"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:48:41 -0700
X-CSE-ConnectionGUID: 3ccH9TkvSVGPrbC1S1qEUg==
X-CSE-MsgGUID: l31bAQVLRcaxkBHn9wW2vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46078450"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.51.10])
 ([10.246.51.10])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 10:48:40 -0700
Message-ID: <3dc05943-115d-4d89-abbe-000f627b5e13@linux.intel.com>
Date: Tue, 18 Jun 2024 19:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_store: Add basic_inst_benchmark
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20240618172021.13007-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240618172021.13007-1-nirmoy.das@intel.com>
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

Please ignore this one, I didn't push local changes

On 6/18/2024 7:20 PM, Nirmoy Das wrote:
> Add basic_inst_benchmark to benchmark this basic operation
> for BO sizes to get basic understanding how long it takes
> bind a BO and run simple GPU command on it.
>
> This not a CI test but rather for developer to identify various
> bottleneck/regression in  BO binding.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/intel/xe_exec_store.c | 102 ++++++++++++++++++++++++++++++------
>   1 file changed, 85 insertions(+), 17 deletions(-)
>
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index c872c22d5..5890faf14 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -93,15 +93,10 @@ static void persistance_batch(struct data *data, uint64_t addr)
>   	data->addr = batch_addr;
>   
>   }
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
>   {
>   	struct drm_xe_sync sync[2] = {
>   		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> @@ -117,7 +112,6 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>   	uint32_t exec_queue;
>   	uint32_t bind_engine;
>   	uint32_t syncobj;
> -	size_t bo_size;
>   	int value = 0x123456;
>   	uint64_t addr = 0x100000;
>   	uint32_t bo = 0;
> @@ -127,12 +121,10 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>   	sync[1].handle = syncobj;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> -	bo_size = sizeof(*data);
> -	bo_size = xe_bb_size(fd, bo_size);
>   
> -	bo = xe_bo_create(fd, vm, bo_size,
> +	bo = xe_bo_create_caching(fd, vm, bo_size,
>   			  vram_if_possible(fd, eci->gt_id),
> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, cpu_caching);
>   
>   	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>   	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
> @@ -167,6 +159,66 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>   	xe_vm_destroy(fd, vm);
>   }
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
>   #define PAGES 1
>   #define NCACHELINES (4096/64)
>   /**
> @@ -342,12 +394,28 @@ igt_main
>   
>   	igt_subtest("basic-store") {
>   		engine = xe_engine(fd, 1);
> -		basic_inst(fd, STORE, &engine->instance);
> +		basic_inst(fd, COND_BATCH, &engine->instance, DRM_XE_GEM_CPU_CACHING_WB);
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
>   	}
>   
>   	igt_subtest("basic-cond-batch") {
>   		engine = xe_engine(fd, 1);
> -		basic_inst(fd, COND_BATCH, &engine->instance);
> +		basic_inst(fd, COND_BATCH, &engine->instance, DRM_XE_GEM_CPU_CACHING_WB);
>   	}
>   
>   	igt_subtest_with_dynamic("basic-all") {
> @@ -356,7 +424,7 @@ igt_main
>   				      xe_engine_class_string(hwe->engine_class),
>   				      hwe->engine_instance,
>   				      hwe->gt_id);
> -			basic_inst(fd, STORE, hwe);
> +			basic_inst(fd, STORE, hwe, DRM_XE_GEM_CPU_CACHING_WB);
>   		}
>   	}
>   
