Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2294EF8FFC
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 16:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310E410EA4E;
	Wed,  4 Mar 2026 16:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enscPAcg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BBD10EA51
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772641018; x=1804177018;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vbhUIFqf8rT0YGmEuJHSBUdt4ih0kUpjLpc7WnhLBtY=;
 b=enscPAcganxSS4akcRtkv/avxy7ZdmH4EDyL/JW1tiUh8j2eM+mQX+dY
 XtWqAj1NONfqLOB/HHA2m2/ZcRQ1/0048DvCOMcgw+CDCmwb9Hwh5Xn9p
 ufTcozkUdE0msXlJmJbf/I6GDLXK+jl31Hlv4pGOAittyMnLGXcegHcmc
 UyKQz0LgdBQH+lwFhWak0K+UXoPRCU0/9MleWbbWYz5/bO9DqqSmbEJas
 pL7MuYqCSNxsr4CKAiSfcSvd3NltJgyJpxCkUX0WCjo3HW2DcIfUzbier
 1I3jsWgmq4Q5h+ChoKsc//IRtNeqU2g51sXiUED3dmn2Euqp/AEFs18gT Q==;
X-CSE-ConnectionGUID: TYpuHDqGRw62qCn2uKCsgw==
X-CSE-MsgGUID: bk9gBH9qTJyhKlGjWSORCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="99177749"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="99177749"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:16:56 -0800
X-CSE-ConnectionGUID: KozdH93QTyajaRctU+AdOQ==
X-CSE-MsgGUID: OejOcls4Siu/HR93p6DdZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218346487"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:16:55 -0800
Date: Wed, 4 Mar 2026 17:16:52 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com, 
 thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH i-g-t 2/5] tests/intel/xe_exec_system_allocator: Allow
 looping in compute
Message-ID: <5ms7xdrpvj4vvcoyn5vl4uzwmggd6djvbe6eemxqcvnkyygjso@wxplbrztpzzo>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
 <20260128173412.1319610-3-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128173412.1319610-3-francois.dugast@intel.com>
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

On Wed, Jan 28, 2026 at 06:29:07PM +0100, Francois Dugast wrote:
> The default behavior remains unchanged but the user can decide to
> stress the system by setting this environment variable:
> IGT_SVM_COMPUTE_LOOPS. For example:
> 
>     IGT_SVM_COMPUTE_LOOPS=10 xe_exec_system_allocator --r eu-fault-2m-once-device

Wouldn't better choice be to use getopt argument? You always have better
control during parsing input to do sth with this.

--
Zbigniew

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 36 ++++++++++++++++----------
>  1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 23a429f24..c5193f81e 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2202,7 +2202,7 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>   * @range-device-host:				touch the whole buffer, from the device then from the host
>   */
>  static void
> -test_compute(int fd, size_t size, unsigned int flags)
> +test_compute(int fd, size_t size, unsigned int flags, int loops)
>  {
>  	struct drm_xe_sync sync = {
>  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> @@ -2227,19 +2227,22 @@ test_compute(int fd, size_t size, unsigned int flags)
>  	bind_system_allocator(&sync, 1);
>  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  
> -	compute_input = aligned_alloc(size, size);
> -	igt_assert(compute_input);
> -
>  	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
>  	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
> -	env.input_addr = to_user_pointer(compute_input);
>  	env.vm = vm;
>  
> -	memset(compute_input, (rand() & 0xff), size);
> +	for (int i = 0; i < loops; i++) {
> +		compute_input = aligned_alloc(size, size);
> +		igt_assert(compute_input);
> +		env.input_addr = to_user_pointer(compute_input);
> +
> +		memset(compute_input, (rand() & 0xff), size);
>  
> -	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> +		run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> +
> +		free(compute_input);
> +	}
>  
> -	free(compute_input);
>  	unbind_system_allocator();
>  	xe_vm_destroy(fd, vm);
>  }
> @@ -2250,6 +2253,13 @@ struct section {
>  	uint8_t (*fn)(int pat);
>  };
>  
> +static int getenv_int(const char *var, int def_val)
> +{
> +	char *env = getenv(var);
> +
> +	return env ? atoi(env) : def_val;
> +}
> +
>  int igt_main()
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -2420,7 +2430,7 @@ int igt_main()
>  		{ NULL },
>  	};
>  
> -	int fd;
> +	int fd, svm_compute_loops = getenv_int("IGT_SVM_COMPUTE_LOOPS", 1);
>  
>  	igt_fixture() {
>  		struct xe_device *xe;
> @@ -2637,15 +2647,15 @@ int igt_main()
>  	}
>  
>  	igt_subtest("compute")
> -		test_compute(fd, SZ_2M, 0);
> +		test_compute(fd, SZ_2M, 0, svm_compute_loops);
>  
>  	for (const struct section *s = csections; s->name; s++) {
>  		igt_subtest_f("eu-fault-4k-%s", s->name)
> -			test_compute(fd, SZ_4K, s->flags);
> +			test_compute(fd, SZ_4K, s->flags, svm_compute_loops);
>  		igt_subtest_f("eu-fault-64k-%s", s->name)
> -			test_compute(fd, SZ_64K, s->flags);
> +			test_compute(fd, SZ_64K, s->flags, svm_compute_loops);
>  		igt_subtest_f("eu-fault-2m-%s", s->name)
> -			test_compute(fd, SZ_2M, s->flags);
> +			test_compute(fd, SZ_2M, s->flags, svm_compute_loops);
>  	}
>  
>  	igt_fixture() {
> -- 
> 2.43.0
> 
