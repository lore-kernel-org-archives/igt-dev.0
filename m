Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABC2C87FCF
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 08:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F7B10E4D4;
	Wed, 13 Aug 2025 08:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e11xIEnb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC6510E4D4
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755074288; x=1786610288;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vhqF2Em74OlssWhObBDr40efRmWMKOzgLd80UHMnh/0=;
 b=e11xIEnb+XFmmskDi3BRH9O09297IaY/pMO04KnlvsNO5Xn8c+ngFjoK
 isvpB3NNok2yiZyh0NesB8mav62+FzBtTYHo4YGdT63ej9jpqld2Smhfo
 2Rw+jBv1Inz7f1t/cbmSWVD1ge2eK4+ozfyrJXvggIHzKn5jQxU4tneYw
 LqDmo4CwVMUABDX6AIqksPYQ9mpa+7mWYoi8kK1ag4Q1z/ZDQksgzdMaG
 TeIS4ACciYePK2L7LOl+A7k/uyHPXGErQE5MAbW42bNE+cfyD4fXWAYDF
 2wsVxRAaP4GsrxE2SuEHR0y2oh7tOoI2Z/Br83mgrYP5HDUjmIUJvgNTR A==;
X-CSE-ConnectionGUID: XL7V2P96Rh6RC+nIP2XzTg==
X-CSE-MsgGUID: /HoRfgnDQOmYr7e5Lcph/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57320175"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57320175"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 01:38:08 -0700
X-CSE-ConnectionGUID: 0SYiNbquS7O2EmFODnv4ZA==
X-CSE-MsgGUID: t+ip4E1fS/ig9sIRY9Ldzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166296068"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.67])
 ([10.245.246.67])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 01:38:06 -0700
Message-ID: <993eed9c-c84d-47c2-9bca-8d30839750ea@intel.com>
Date: Wed, 13 Aug 2025 10:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_vm: Add bind-array-flag-invalid
 subtest
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
References: <20250812130142.37988-1-christoph.manszewski@intel.com>
 <20250812130142.37988-2-christoph.manszewski@intel.com>
 <CH3PR11MB8434AAE76F6D92CDA09C1E528D2AA@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CH3PR11MB8434AAE76F6D92CDA09C1E528D2AA@CH3PR11MB8434.namprd11.prod.outlook.com>
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

Hi Priyanka,

On 13.08.2025 05:57, Dandamudi, Priyanka wrote:
> 
> 
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Christoph Manszewski
>> Sent: 12 August 2025 06:32 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Dugast, Francois <francois.dugast@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; Manszewski, Christoph
>> <christoph.manszewski@intel.com>
>> Subject: [PATCH i-g-t 1/2] tests/intel/xe_vm: Add bind-array-flag-invalid
>> subtest
>>
>> Add a complementary subtest to 'bind-flag-invalid' which checks vm_bind
>> ioctl behavior when provided a invalid flag value when submitting an array of
>> bind operations.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>> ---
>>   tests/intel/xe_vm.c | 90
>> +++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 90 insertions(+)
>>
>> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c index
>> 3ce54053c..236494407 100644
>> --- a/tests/intel/xe_vm.c
>> +++ b/tests/intel/xe_vm.c
>> @@ -2271,6 +2271,93 @@ static void bind_flag_invalid(int fd)
>>   	xe_vm_destroy(fd, vm);
>>   }
>>
>> +static void __bind_flag_valid(int fd, uint32_t bo, struct drm_xe_vm_bind
>> bind,
>> +			      struct drm_xe_vm_bind_op *bind_ops, int
>> num_binds) {
>> +	struct drm_xe_sync *sync = from_user_pointer(bind.syncs);
>> +	unsigned int valid_flags[] = {
>> +		0,
>> +		DRM_XE_VM_BIND_FLAG_READONLY,
>> +		DRM_XE_VM_BIND_FLAG_IMMEDIATE,
>> +		DRM_XE_VM_BIND_FLAG_NULL,
>> +		DRM_XE_VM_BIND_FLAG_DUMPABLE,
>> +		DRM_XE_VM_BIND_FLAG_CHECK_PXP,
>> +	};
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(valid_flags); i++) {
>> +		if (!pxp_interface_supported(fd) && valid_flags[i] ==
>> DRM_XE_VM_BIND_FLAG_CHECK_PXP)
>> +			continue;
>> +
>> +		for (int j = 0; j < num_binds; j++) {
>> +			bind_ops[j].flags = valid_flags[i];
>> +			bind_ops[j].obj = valid_flags[i] ==
>> DRM_XE_VM_BIND_FLAG_NULL ? 0 : bo;
>> +		}
>> +
>> +		igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
>> +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
>> NULL));
>> +		syncobj_reset(fd, &sync[0].handle, 1);
>> +	}
>> +}
>> +
>> +/**
>> + * SUBTEST: bind-array-flag-invalid
>> + * Functionality: bind
>> + * Description: Ensure invalid bind flags are rejected when submitting an
>> array of binds.
>> + * Test category: negative test
>> + */
>> +static void test_bind_flag_invalid(int fd, int num_binds) {
>> +	struct drm_xe_vm_bind_op *bind_ops;
>> +	struct drm_xe_vm_bind bind;
>> +	uint32_t vm;
>> +
>> +	uint32_t bo, bo_size = xe_get_default_alignment(fd);
>> +	uint64_t addr = 0x1a0000;
>> +	struct drm_xe_sync sync[1] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =
>> DRM_XE_SYNC_FLAG_SIGNAL, },
>> +	};
>> +
>> +	igt_assert(num_binds > 1);
>> +
>> +	vm = xe_vm_create(fd, 0, 0);
>> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
>> +	sync[0].handle = syncobj_create(fd, 0);
>> +
>> +	bind_ops = calloc(num_binds, sizeof(*bind_ops));
>> +	for (int i = 0; i < num_binds; i++) {
>> +		bind_ops[i].addr = addr + i * bo_size;
>> +		bind_ops[i].range = bo_size;
>> +		bind_ops[i].obj = bo;
>> +		bind_ops[i].op = DRM_XE_VM_BIND_OP_MAP;
>> +		bind_ops[i].pat_index = intel_get_pat_idx_wb(fd);
>> +	}
>> +
>> +	memset(&bind, 0, sizeof(bind));
>> +	bind.vector_of_binds = to_user_pointer(bind_ops);
>> +	bind.num_binds = num_binds;
>> +	bind.syncs = to_user_pointer(sync);
>> +	bind.num_syncs = 1;
>> +	bind.vm_id = vm;
>> +
>> +	/* Using valid flags should work */
>> +	__bind_flag_valid(fd, bo, bind, bind_ops, num_binds);
>> +
>> +	/* Using invalid flags should not work */
>> +	for (int i = 0; i < num_binds; i++) {
>> +		bind_ops[i].flags = BIT(30);
>> +		bind_ops[i].obj = bo;
>> +	}
>> +
>> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
>> +
>> +	/* Using valid flags should still work */
>> +	__bind_flag_valid(fd, bo, bind, bind_ops, num_binds);
>> +
>> +	syncobj_destroy(fd, sync[0].handle);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>>   /**
>>    * SUBTEST: invalid-flag-%s
>>    * Functionality: ioctl_input_validation @@ -2658,6 +2745,9 @@ igt_main
>>   		xe_for_each_engine(fd, hwe)
>>   			test_bind_array_conflict(fd, hwe, false, true);
>>
>> +	igt_subtest("bind-array-flag-invalid")
>> +		test_bind_flag_invalid(fd, 16);
> Remaining code looks fine for me, and one more you mentioned that you noticed a double free when the vm bind ioctl failed, do you mean its for negative flag ?

The double free path executes when the argument check for an array bind 
fails, so yes, an invalid flag triggers it. You can checkout the fix for 
more details: https://patchwork.freedesktop.org/series/152835/

> What is the reason behind fixing the number of binds to 16. Could you explain?

No good reason, I just saw some other sub test that passes 16 for the 
number of bind ops. It can be anything greater or equal 2.

Thanks,
Christoph


> Thanks,
> Priyanka
>> +
>>   	for (bind_size = 0x1ull << 21; bind_size <= 0x1ull << 31;
>>   	     bind_size = bind_size << 1) {
>>   		igt_subtest_f("large-binds-%lld",
>> --
>> 2.47.1
> 

