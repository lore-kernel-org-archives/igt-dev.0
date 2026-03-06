Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF48F513F7
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 05:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA4910E243;
	Fri,  6 Mar 2026 05:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwyoHsBl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937FE10E243
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 05:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772774983; x=1804310983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7LjUPNWiqlhY3QQlLqyQwF1NVAziZvNM+ijT2NG6Q7o=;
 b=QwyoHsBlYBOEFJ9CEUZO6w4dCoEtSbWDmRLWLtU28zluCLB3HpaxneJ+
 vl+puh5fyyoj2HpCgE6Ajje6rARIr0iIEMwiF8GRO+zfWEI1ay3xfjp1I
 Ces+rISNvXfLWNVkJrPDuaLAIUqmXj0qkqUwJGuXdUntw79D7QF6YDjTK
 j94p9WZoiiaNHAGOAcW6JMav26pdY5u9Zc8V3V7/ha28Nt+ICHcE7MVys
 aCIiwGFxDAorp/VepYlbnm378eKcEN7t2h9MIko8bYsYMSQc89DeP7bTx
 pSB/q8CTUb4EG8Dusd4DUQy/02BDmiO/gUmiYjPV8gQSV+vEVZn9k0OMc w==;
X-CSE-ConnectionGUID: WHQYI9TQSR2NjpKBwyU41A==
X-CSE-MsgGUID: +3CHV9tRRXqosK5lGaRcEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73070417"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73070417"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 21:29:43 -0800
X-CSE-ConnectionGUID: PxLDTpmeRXKrG6HtdRvw3A==
X-CSE-MsgGUID: 5TviiFf1RnCmDI75U8W4Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218861665"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 21:29:41 -0800
Date: Fri, 6 Mar 2026 06:29:38 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com, 
 thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH i-g-t 2/5] tests/intel/xe_exec_system_allocator: Allow
 looping in compute
Message-ID: <i5idvrdsdwesgw354uh7oquasqtmcah5mkzdjb7zefpd7t5sxq@p4ljqukw3j7i>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
 <20260128173412.1319610-3-francois.dugast@intel.com>
 <5ms7xdrpvj4vvcoyn5vl4uzwmggd6djvbe6eemxqcvnkyygjso@wxplbrztpzzo>
 <aalQu6yX-vP3XWeH@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aalQu6yX-vP3XWeH@fdugast-desk>
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

On Thu, Mar 05, 2026 at 10:45:31AM +0100, Francois Dugast wrote:
> On Wed, Mar 04, 2026 at 05:16:52PM +0100, Zbigniew Kempczyński wrote:
> > On Wed, Jan 28, 2026 at 06:29:07PM +0100, Francois Dugast wrote:
> > > The default behavior remains unchanged but the user can decide to
> > > stress the system by setting this environment variable:
> > > IGT_SVM_COMPUTE_LOOPS. For example:
> > > 
> > >     IGT_SVM_COMPUTE_LOOPS=10 xe_exec_system_allocator --r eu-fault-2m-once-device
> > 
> > Wouldn't better choice be to use getopt argument? You always have better
> > control during parsing input to do sth with this.
> 
> Not sure if we need more control, or if we should expect more arguments to
> xe_exec_system_allocator in the future. This particular knob is not really
> a runtime option expected to be set manually by users to influence behavior, 
> it is meant as help to get reproducible performance numbers when optimizing
> KMD.

If your preference is to pass env instead of getopt I'm fine. I would
pick getopt because I tend to run binary with -h/--help to see what are
args I can pass. Env requires to read the code so if you want to hide
this it is better choice.

For the code:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Francois
> 
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  tests/intel/xe_exec_system_allocator.c | 36 ++++++++++++++++----------
> > >  1 file changed, 23 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > > index 23a429f24..c5193f81e 100644
> > > --- a/tests/intel/xe_exec_system_allocator.c
> > > +++ b/tests/intel/xe_exec_system_allocator.c
> > > @@ -2202,7 +2202,7 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> > >   * @range-device-host:				touch the whole buffer, from the device then from the host
> > >   */
> > >  static void
> > > -test_compute(int fd, size_t size, unsigned int flags)
> > > +test_compute(int fd, size_t size, unsigned int flags, int loops)
> > >  {
> > >  	struct drm_xe_sync sync = {
> > >  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > > @@ -2227,19 +2227,22 @@ test_compute(int fd, size_t size, unsigned int flags)
> > >  	bind_system_allocator(&sync, 1);
> > >  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> > >  
> > > -	compute_input = aligned_alloc(size, size);
> > > -	igt_assert(compute_input);
> > > -
> > >  	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> > >  	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
> > > -	env.input_addr = to_user_pointer(compute_input);
> > >  	env.vm = vm;
> > >  
> > > -	memset(compute_input, (rand() & 0xff), size);
> > > +	for (int i = 0; i < loops; i++) {
> > > +		compute_input = aligned_alloc(size, size);
> > > +		igt_assert(compute_input);
> > > +		env.input_addr = to_user_pointer(compute_input);
> > > +
> > > +		memset(compute_input, (rand() & 0xff), size);
> > >  
> > > -	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> > > +		run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> > > +
> > > +		free(compute_input);
> > > +	}
> > >  
> > > -	free(compute_input);
> > >  	unbind_system_allocator();
> > >  	xe_vm_destroy(fd, vm);
> > >  }
> > > @@ -2250,6 +2253,13 @@ struct section {
> > >  	uint8_t (*fn)(int pat);
> > >  };
> > >  
> > > +static int getenv_int(const char *var, int def_val)
> > > +{
> > > +	char *env = getenv(var);
> > > +
> > > +	return env ? atoi(env) : def_val;
> > > +}
> > > +
> > >  int igt_main()
> > >  {
> > >  	struct drm_xe_engine_class_instance *hwe;
> > > @@ -2420,7 +2430,7 @@ int igt_main()
> > >  		{ NULL },
> > >  	};
> > >  
> > > -	int fd;
> > > +	int fd, svm_compute_loops = getenv_int("IGT_SVM_COMPUTE_LOOPS", 1);
> > >  
> > >  	igt_fixture() {
> > >  		struct xe_device *xe;
> > > @@ -2637,15 +2647,15 @@ int igt_main()
> > >  	}
> > >  
> > >  	igt_subtest("compute")
> > > -		test_compute(fd, SZ_2M, 0);
> > > +		test_compute(fd, SZ_2M, 0, svm_compute_loops);
> > >  
> > >  	for (const struct section *s = csections; s->name; s++) {
> > >  		igt_subtest_f("eu-fault-4k-%s", s->name)
> > > -			test_compute(fd, SZ_4K, s->flags);
> > > +			test_compute(fd, SZ_4K, s->flags, svm_compute_loops);
> > >  		igt_subtest_f("eu-fault-64k-%s", s->name)
> > > -			test_compute(fd, SZ_64K, s->flags);
> > > +			test_compute(fd, SZ_64K, s->flags, svm_compute_loops);
> > >  		igt_subtest_f("eu-fault-2m-%s", s->name)
> > > -			test_compute(fd, SZ_2M, s->flags);
> > > +			test_compute(fd, SZ_2M, s->flags, svm_compute_loops);
> > >  	}
> > >  
> > >  	igt_fixture() {
> > > -- 
> > > 2.43.0
> > > 
