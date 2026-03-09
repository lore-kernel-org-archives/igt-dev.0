Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C40BEFCD9A
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 11:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DE510E4DB;
	Mon,  9 Mar 2026 11:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6t9pfyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16D210E4DB
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773054846; x=1804590846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4Mg5AviL8MqhRqLnkxSx3cFRjpQuWh+hV/s5xdqH+mE=;
 b=D6t9pfyjF0tEPueRipNJrqmPyYXBm7ZFlv7MyuAHxxAO8pgNv+uv+yCi
 cnRgey+ExK0aVS0HqOju8tgBsfoK4SbA+0KQCyYL2KMHPwPxXarm9lMFJ
 2PUE/siMwvQnzGzKpYL+NUqCqfxnRGEyFyfDzid8MdzRF43jzmYmGYgz5
 iz8StS7VSBIJs73XOJTLOg4eOulGTPq4cJwAj5DNZ5sWOQJilY0Nl42Lp
 efat1TE/wAV+xJA2A3Eb3kF8dt6wphdIOgN6zScgJDtzGpYhoFWlJg4rb
 PFW5Jw1byM/OODzn5fdpOHmyWqVGlPT0zX4CHkuzpCaF4KZ14npPQHXy2 g==;
X-CSE-ConnectionGUID: qeUnZD0NRGaVBhL7paae8A==
X-CSE-MsgGUID: 5acgwOlQTP2TPYzZcoPc6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99544119"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="99544119"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:14:05 -0700
X-CSE-ConnectionGUID: uKhCUE7UTlyKsNw/tOnwxA==
X-CSE-MsgGUID: rfV5K8pGRAWjGxhHUC5Tyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224167558"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.144])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:14:03 -0700
Date: Mon, 9 Mar 2026 12:14:01 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, Nishit Sharma <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 4/6] tests/xe_compute: Extend compute test to
 cover user passed buffers
Message-ID: <o7lhuimythzhzjqdadjylmgh3pw7e36tsbr5qwiue37hiutr6l@se3agvt6zgam>
References: <20260306091430.1234990-8-zbigniew.kempczynski@intel.com>
 <20260306091430.1234990-12-zbigniew.kempczynski@intel.com>
 <aa6mkV3qNtFsgXjB@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa6mkV3qNtFsgXjB@fdugast-desk>
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

On Mon, Mar 09, 2026 at 11:53:05AM +0100, Francois Dugast wrote:
> Hi,
> 
> On Fri, Mar 06, 2026 at 10:14:35AM +0100, Zbigniew Kempczyński wrote:
> > Compute library allows user to pass its own buffers. They may be
> > normal buffer objects or system allocated buffers (SVM).
> > 
> > Verify input and output buffers added to user_execenv are properly
> > handled and data within are fully on user control. Execute compute
> > square on these buffers and check data are correct regardless
> > allocation strategy.
> > 
> > Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Acked-by: Nishit Sharma <nishit.sharma@intel.com>
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  tests/intel/xe_compute.c | 150 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> > 
> > diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> > index 310093fc56..e5367b4c10 100644
> > --- a/tests/intel/xe_compute.c
> > +++ b/tests/intel/xe_compute.c
> > @@ -510,6 +510,144 @@ test_compute_square(int fd)
> >  		      "GPU not supported\n");
> >  }
> >  
> > +/**
> > + * SUBTEST: compute-square-userenv
> > + * Mega feature: Compute
> > + * Sub-category: compute tests
> > + * Functionality: OpenCL kernel
> > + * Description:
> > + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> > + *	taking buffers from userenv.
> > + *
> > + * SUBTEST: compute-square-userenv-isvm
> > + * Mega feature: Compute
> > + * Sub-category: compute tests
> > + * Functionality: OpenCL kernel
> > + * Description:
> > + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> > + *	taking buffers from userenv where input is svm buffer.
> > + *
> > + * SUBTEST: compute-square-userenv-osvm
> > + * Mega feature: Compute
> > + * Sub-category: compute tests
> > + * Functionality: OpenCL kernel
> > + * Description:
> > + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> > + *	taking buffers from userenv where output buffer is svm buffer.
> > + *
> > + * SUBTEST: compute-square-userenv-iosvm
> > + * Mega feature: Compute
> > + * Sub-category: compute tests
> > + * Functionality: OpenCL kernel
> > + * Description:
> > + *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
> > + *	taking buffers from userenv where input and output buffers are svm buffer.
> > + */
> > +
> > +#define INPUT_IN_SVM		(1 << 0)
> > +#define OUTPUT_IN_SVM		(1 << 1)
> > +#define INPUT_BO_ADDR		0x30000000
> > +#define OUTPUT_BO_ADDR		0x31000000
> > +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > +#define FIVE_SEC		(5LL * NSEC_PER_SEC)
> > +
> > +#define bind_system_allocator(__sync, __num_sync)			\
> > +	__xe_vm_bind_assert(fd, vm, 0,					\
> > +			    0, 0, 0, 0x1ull << va_bits,			\
> > +			    DRM_XE_VM_BIND_OP_MAP,			\
> > +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
> > +			    (__sync), (__num_sync), 0, 0)
> 
> Not sure about the reason for moving system allocator tests outside of
> xe_exec_system_allocator.c but if we go this way then this ^ should be
> moved to libs as helper instead of being duplicated.

Because it on one leg is in xe_compute and second one on
xe_exec_system_allocator. Tests here exercises both kind of buffers
(bo/svm) and their input/output variations passed in userenv.
I picked xe_compute as imo it matches better.

Regarding macro - yes, this is copy/paste and depends implicitly
on fd, vm, va_bits. May this be follow up series or you want to
refactor it now?

> 
> > +
> > +static void
> > +test_compute_square_userenv(int fd, uint32_t flags)
> > +{
> > +	struct user_execenv env = {};
> > +	uint32_t input_bo, output_bo, vm, size = SZ_4K;
> > +	int va_bits = xe_va_bits(fd);
> > +	float *input, *output;
> > +	int i;
> > +
> > +	size = ALIGN(size, xe_get_default_alignment(fd));
> > +	env.array_size = size / sizeof(float);
> > +
> > +	vm = env.vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > +				   DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> > +
> > +	if ((flags & INPUT_IN_SVM) || (flags & OUTPUT_IN_SVM)) {
> > +		struct drm_xe_sync sync = {
> > +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > +			.timeline_value = USER_FENCE_VALUE,
> > +		};
> > +		struct bo_sync {
> > +			uint64_t sync;
> > +		} *bo_sync;
> > +
> > +		bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
> > +		igt_assert(bo_sync);
> > +		sync.addr = to_user_pointer(&bo_sync->sync);
> > +		bind_system_allocator(&sync, 1);
> > +		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> > +		free(bo_sync);
> > +	}
> > +
> > +	if (flags & INPUT_IN_SVM) {
> > +		input = aligned_alloc(xe_get_default_alignment(fd), size);
> > +		env.input_addr = to_user_pointer(input);
> > +
> > +	} else {
> > +		input_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
> > +					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		input = xe_bo_map(fd, input_bo, size);
> > +		env.input_bo = input_bo;
> > +		env.input_addr = INPUT_BO_ADDR;
> > +	}
> > +
> > +	if (flags & OUTPUT_IN_SVM) {
> > +		output = aligned_alloc(xe_get_default_alignment(fd), size);
> > +		env.output_addr = to_user_pointer(output);
> > +	} else {
> > +		output_bo = xe_bo_create(fd, env.vm, size, vram_if_possible(fd, 0),
> > +					 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		output = xe_bo_map(fd, output_bo, size);
> > +		env.output_bo = output_bo;
> > +		env.output_addr = OUTPUT_BO_ADDR;
> > +	}
> > +
> > +	env.loop_count = env.array_size / 2;
> > +	env.skip_results_check = true;
> > +
> > +	for (i = 0; i < env.array_size; i++)
> > +		input[i] = (float)i + 2.0f;
> > +
> > +	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> > +
> > +	for (i = 0; i < env.loop_count; i++) {
> > +		float expected_output = input[i] * input[i];
> > +
> > +		if (output[i] != expected_output || output[i] == 0.0f)
> > +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> > +				  i, input[i], output[i], expected_output);
> > +		igt_assert_eq_double(output[i], expected_output);
> > +	}
> 
> This seems like a copy/paste from bo_check_square(). Besides, a few lines
> above we set:
> 
>     env.skip_results_check = true
> 
> to skip the result check, which seems contradictory. Is there a reason for
> this duplication?

Results check assumes square what if we provide own kernel might not
be true. And in the test I show how to control input/output set/check
from userenv side.

--
Zbigniew

> 
> Thanks,
> Francois
> 
> > +
> > +	if (flags & INPUT_IN_SVM) {
> > +		free(input);
> > +	} else {
> > +		munmap(input, size);
> > +		gem_close(fd, input_bo);
> > +	}
> > +
> > +	if (flags & OUTPUT_IN_SVM) {
> > +		free(output);
> > +	} else {
> > +		munmap(output, size);
> > +		gem_close(fd, output_bo);
> > +	}
> > +
> > +	xe_vm_destroy(fd, env.vm);
> > +}
> > +
> >  int igt_main()
> >  {
> >  	int xe, ccs_mode[4];
> > @@ -525,6 +663,18 @@ int igt_main()
> >  	igt_subtest("compute-square")
> >  		test_compute_square(xe);
> >  
> > +	igt_subtest("compute-square-userenv")
> > +		test_compute_square_userenv(xe, 0);
> > +
> > +	igt_subtest("compute-square-userenv-isvm")
> > +		test_compute_square_userenv(xe, INPUT_IN_SVM);
> > +
> > +	igt_subtest("compute-square-userenv-osvm")
> > +		test_compute_square_userenv(xe, OUTPUT_IN_SVM);
> > +
> > +	igt_subtest("compute-square-userenv-iosvm")
> > +		test_compute_square_userenv(xe, INPUT_IN_SVM | OUTPUT_IN_SVM);
> > +
> >  	igt_fixture()
> >  		drm_close_driver(xe);
> >  
> > -- 
> > 2.43.0
> > 
