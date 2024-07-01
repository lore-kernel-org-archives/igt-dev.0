Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAA0C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 18:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E7E10E4CF;
	Mon,  1 Jul 2024 18:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWJz6FMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370FA10E4D2
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 18:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719857553; x=1751393553;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OWJAikYx4cl9+P4SJV7zRMqXbLx1x73FVDQOYAVZVMk=;
 b=DWJz6FMUEANRhWcMdn4DeYpKj5o31LtV+YPTFE8VrhVAvnJ63lCkh3D6
 2vHniuzU/xFSd69E1LkaCz0bjcUBPsP/Aq3lUU/0+DC4KSE56mHBkJo72
 seAIiB6j8q6hdnhMEWNrUPtUKGUpacwe7Dx0ZES6oRREeeietwLQ3iHja
 CIyDMrsXa9NJLFzKe/MSaKQoKQL6VZdvh90G/b9CZGsCrwVeMa+xlxHE3
 2PmDSEPVJmfJYfQVSxsgvQzmj64ScF24z5ulMjpIeS7y8dYR8469VdyeJ
 u6pr/i2WtxVg14aywf2v70vO8DRt8cMC9ebhu7sSzFtNsuumwb/jburYy Q==;
X-CSE-ConnectionGUID: v9w+h9idTH+8QokXiUyojw==
X-CSE-MsgGUID: PiDmzjR4RB+rzlfpbvecOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="16828093"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="16828093"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 11:12:33 -0700
X-CSE-ConnectionGUID: +9ysjxwCSzC0yWv8+oJ0cA==
X-CSE-MsgGUID: 9d2oFEuyR2KUY4hST8fdTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="76334680"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 11:12:31 -0700
Date: Mon, 1 Jul 2024 20:12:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_exec_store: Add
 basic_inst_benchmark
Message-ID: <20240701181213.jkdyenmwirpmyzkb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240625130816.4338-1-nirmoy.das@intel.com>
 <20240628170230.6wqbesoeoz7ezpsl@kamilkon-DESK.igk.intel.com>
 <c38392bd-8a07-43fc-9fbc-ecec20373f7c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c38392bd-8a07-43fc-9fbc-ecec20373f7c@linux.intel.com>
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
On 2024-07-01 at 09:59:28 +0200, Nirmoy Das wrote:
> Hi Kamil,
> 
> On 6/28/2024 7:02 PM, Kamil Konieczny wrote:
> > Hi Nirmoy,
> > On 2024-06-25 at 15:08:16 +0200, Nirmoy Das wrote:
> > 
> > test names should use '-' as separator, you also used other
> > name so:
> > [PATCH i-g-t v3] tests/intel/xe_exec_store: Add basic_inst_benchmark
> > 
> > should be:
> > [PATCH i-g-t v3] tests/intel/xe_exec_store: Add basic-store-benchmark
> Looks like I misunderstood your last comment. Will fix it.
> > 
> > > Add basic_inst_benchmark to benchmark this basic operation
> > ---------- ^----^
> > Same here, use '-' as separator, s/_inst_/-store-/
> > 
> > > for BO sizes to get basic understanding how long it takes
> > > bind a BO and run simple GPU command on it.
> > > 
> > > This not a CI test but rather for developer to identify various
> > > bottleneck/regression in  BO binding.
> > > 
> > > Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> > > ---
> > >   tests/intel/xe_exec_store.c | 112 ++++++++++++++++++++++++++++++------
> > >   1 file changed, 94 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> > > index c872c22d5..aaabdbec3 100644
> > > --- a/tests/intel/xe_exec_store.c
> > > +++ b/tests/intel/xe_exec_store.c
> > > @@ -93,15 +93,10 @@ static void persistance_batch(struct data *data, uint64_t addr)
> > >   	data->addr = batch_addr;
> > >   }
> > > -/**
> > > - * SUBTEST: basic-store
> > > - * Description: Basic test to verify store dword.
> > > - * SUBTEST: basic-cond-batch
> > > - * Description: Basic test to verify cond batch end instruction.
> > > - * SUBTEST: basic-all
> > > - * Description: Test to verify store dword on all available engines.
> > > - */
> > > -static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
> > > +
> > > +static void basic_inst_size(int fd, int inst_type,
> > > +			    struct drm_xe_engine_class_instance *eci,
> > > +			    uint16_t cpu_caching, size_t bo_size)
> > >   {
> > >   	struct drm_xe_sync sync[2] = {
> > >   		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > > @@ -117,7 +112,6 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
> > >   	uint32_t exec_queue;
> > >   	uint32_t bind_engine;
> > >   	uint32_t syncobj;
> > > -	size_t bo_size;
> > >   	int value = 0x123456;
> > >   	uint64_t addr = 0x100000;
> > >   	uint32_t bo = 0;
> > > @@ -127,12 +121,16 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
> > >   	sync[1].handle = syncobj;
> > >   	vm = xe_vm_create(fd, 0, 0);
> > > -	bo_size = sizeof(*data);
> > > -	bo_size = xe_bb_size(fd, bo_size);
> > > -	bo = xe_bo_create(fd, vm, bo_size,
> > > -			  vram_if_possible(fd, eci->gt_id),
> > > -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +	if (cpu_caching)
> > > +		bo = xe_bo_create_caching(fd, vm, bo_size,
> > > +					  vram_if_possible(fd, eci->gt_id),
> > > +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> > > +					  cpu_caching);
> > > +	else
> > > +		bo = xe_bo_create(fd, vm, bo_size,
> > > +				  vram_if_possible(fd, eci->gt_id),
> > > +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > >   	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> > >   	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
> > > @@ -167,6 +165,66 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
> > >   	xe_vm_destroy(fd, vm);
> > >   }
> > > +
> > > +/**
> > > + * SUBTEST: basic-store
> > > + * Description: Basic test to verify store dword.
> > > + * SUBTEST: basic-cond-batch
> > > + * Description: Basic test to verify cond batch end instruction.
> > > + * SUBTEST: basic-all
> > > + * Description: Test to verify store dword on all available engines.
> > > + */
> > > +static void basic_inst(int fd, int inst_type,
> > > +		       struct drm_xe_engine_class_instance *eci,
> > > +		       uint16_t cpu_caching)
> > > +{
> > > +	size_t bo_size;
> > > +
> > > +	bo_size = sizeof(struct data);
> > > +	bo_size = xe_bb_size(fd, bo_size);
> > > +
> > > +	basic_inst_size(fd, inst_type, eci, cpu_caching, bo_size);
> > > +}
> > > +
> > > +/**
> > > + * SUBTEST: basic-store-benchmark
> > > + * Description: Basic test to verify time taken for doing store dword with various size.
> > > + */
> > > +static void basic_inst_benchmark(int fd, int inst_type,
> > > +				 struct drm_xe_engine_class_instance *eci,
> > > +				 uint16_t cpu_caching)
> > > +{
> > > +	struct {
> > > +		size_t size;
> > > +		const char *name;
> > > +	} sizes[] = {
> > > +		{SZ_4K, "SZ_4K"},
> > > +		{SZ_2M, "SZ_2M"},
> > > +		{SZ_64M, "SZ_64M"},
> > > +		{SZ_128M, "SZ_128M"},
> > > +		{SZ_256M, "SZ_256M"},
> > > +		{SZ_1G, "SZ_1G"}
> > Could you use more human-friendly strings here? 4KB, 2MB, ...1GB
> Sure, will do that.
> > 
> > > +	};
> > > +
> > > +	struct timeval start, end;
> > > +	long seconds, useconds, utime;
> > > +
> > > +	for (size_t i = 0; i < ARRAY_SIZE(sizes); ++i) {
> > > +		size_t bo_size = sizes[i].size;
> > > +		const char *size_name = sizes[i].name;
> > > +
> > > +		gettimeofday(&start, NULL);
> > > +		basic_inst_size(fd, inst_type, eci, cpu_caching, bo_size);
> > > +		gettimeofday(&end, NULL);
> > > +
> > > +		seconds = end.tv_sec - start.tv_sec;
> > > +		useconds = end.tv_usec - start.tv_usec;
> > > +		utime = (seconds * 1000000) + useconds;
> > imho there is igt function for such time measure.
> Do you mean igt_nsec_elapsed()

There are:

igt_core.h:double igt_time_elapsed(struct timespec *then,

igt_core.h:uint64_t igt_nsec_elapsed(struct timespec *start);

igt_core.h:static inline uint32_t igt_seconds_elapsed(struct timespec *start)

Choose what you need.

> > 
> > > +
> > > +		igt_info("Time taken for size %s: %ld us\n", size_name, utime);
> > > +	}
> > > +}
> > > +
> > >   #define PAGES 1
> > >   #define NCACHELINES (4096/64)
> > >   /**
> > > @@ -342,12 +400,30 @@ igt_main
> > >   	igt_subtest("basic-store") {
> > >   		engine = xe_engine(fd, 1);
> > > -		basic_inst(fd, STORE, &engine->instance);
> > > +		basic_inst(fd, COND_BATCH, &engine->instance, 0);
> > > +	}
> > > +
> > > +	igt_subtest_with_dynamic("basic-store-benchmark") {
> > > +		struct dyn {
> > > +			const char *name;
> > > +			int cache;
> > > +		} tests[] = {
> > > +			{"WC", DRM_XE_GEM_CPU_CACHING_WC},
> > > +			{"WB", DRM_XE_GEM_CPU_CACHING_WB}
> > > +		};
> > > +		/* Enable for iGFX only for now */
> > > +		igt_require(! xe_has_vram(fd));
> > -------------------- ^
> > Please use checkpatch.pl for similar hints.
> Took me a while find the issue :D. I tend to do that but I guess I have to
> add a alias that will do a check patch before sending.
> > 
> > Could you test with 0 for dGFX?
> 
> with fd == 0 ?
> 
> I think DRM_XE_GEM_CPU_CACHING_WB doesn't work for dGPU. I have to check
> that on live machine.
> 
> > 
> > > +
> > > +		for (int i = 0; i < ARRAY_SIZE(tests); i++) {
> > > +			igt_dynamic_f("%s", tests[i].name);
> > ----------------------------------------------^
> > This is the reason you didn't see dynamic tests running with
> > --dyn WC, it should be:
> it should be what ? You are keep a secret :)

I see, I should explicitly point semicolon there ';'
This will run empty dynamic subtest:

	igt_dynamic_f("%s", tests[i].name);

While what you wanted was written below, let me copy-paste:

    igt_dynamic_f("%s", tests[i].name) {
        engine = xe_engine(fd, 1);
        basic_inst_benchmark(fd, STORE, &engine->instance, tests[i].cache);
    }

What I was asking was does it make sense to benchmark with
cache value 0 on dGPU?

Regards,
Kamil

> > 
> > > +			engine = xe_engine(fd, 1);
> > > +			basic_inst_benchmark(fd, STORE, &engine->instance, tests[i].cache);
> > > +		}
> > 			igt_dynamic_f("%s", tests[i].name) {
> >      			engine = xe_engine(fd, 1);
> > 	    		basic_inst_benchmark(fd, STORE, &engine->instance, tests[i].cache);
> >              }
> > 
> > Btw should you add a skip if engine == NULL?
> 
> Yes, that should be safer.
> 
> 
> Thanks,
> 
> Nirmoy
> 
> > 
> > > +		}
> > >   	}
> > >   	igt_subtest("basic-cond-batch") {
> > >   		engine = xe_engine(fd, 1);
> > > -		basic_inst(fd, COND_BATCH, &engine->instance);
> > > +		basic_inst(fd, COND_BATCH, &engine->instance, 0);
> > >   	}
> > >   	igt_subtest_with_dynamic("basic-all") {
> > > @@ -356,7 +432,7 @@ igt_main
> > >   				      xe_engine_class_string(hwe->engine_class),
> > >   				      hwe->engine_instance,
> > >   				      hwe->gt_id);
> > > -			basic_inst(fd, STORE, hwe);
> > > +			basic_inst(fd, STORE, hwe, 0);
> > >   		}
> > >   	}
> > > -- 
> > > 2.42.0
> > > 
