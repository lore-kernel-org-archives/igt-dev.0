Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B3110E645
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 01:11:31 +0000 (UTC)
Message-ID: <72482193-465f-f64e-d629-689d4c3dc753@intel.com>
Date: Wed, 30 Aug 2023 18:11:26 -0700
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230829230518.4142-1-yu.bruce.chang@intel.com>
 <41d7f1d8-d7ba-596b-1fbe-5f604d524f1f@intel.com>
 <CY8PR11MB6940CD509FC3777E87B245A2C3E5A@CY8PR11MB6940.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <CY8PR11MB6940CD509FC3777E87B245A2C3E5A@CY8PR11MB6940.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe add invalid va access tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Zeng, Oak" <oak.zeng@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 8/30/2023 5:26 PM, Chang, Yu bruce wrote:
> 
> 
...
>>
>> Do we need some verification here that driver did proper thing when
>> encountering invalid va.  Meaning there was some different behavior with
>> scratch page we can observe?
>> Without DRM_XE_VM_CREATE_SCRATCH_PAGE, program is terminated?  Are
>> we
>> banning the context like i915 was doing?
>>
> 
> Good point, now is a manual check for the log for a reset message, I can look into
> To automate it.
> 

Isn't the xe_wait_ufence() supposed to somehow inform that something 
actually failed with the xe_exec?
I notice you are using _xe_wait_ufence instead of xe_wait_ufence().
It gives an error?

You mentioned that the engine was reset....  was is the effect of that?
Maybe a subsequent xe_exec() will fail?   Just grasping at some 
user-space visible things you can try easily.  I don't know myself, new 
code...

-Brian


> Thanks,
> Bruce
> 
>>> +
>>> +	if ((flags & DRM_XE_VM_CREATE_FAULT_MODE) &&
>>> +	    (flags & DRM_XE_VM_CREATE_SCRATCH_PAGE)) {
>>> +		/* bind inv_addr after scratch page was created */
>>> +		sync.addr = to_user_pointer(&data->vm_sync);
>>> +		xe_vm_bind_async_flags(fd, vm, 0, bo, 0,
>>> +				inv_addr, bo_size, &sync, 1,
>>> +				XE_VM_BIND_FLAG_IMMEDIATE);
>>> +		xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE,
>> NULL, ONE_SEC);
>>> +		data->vm_sync = 0;
>>> +		data->data = 0;
>>> +		sync.addr = addr + offsetof(struct _data, sync);
>>> +		xe_exec(fd, &exec);
>>> +		xe_wait_ufence(fd, &data->sync, USER_FENCE_VALUE, NULL,
>> ONE_SEC);
>>> +		igt_assert_eq(data->data, STORE_DATA);
>>> +	}
>>> +
>>> +	sync.addr = to_user_pointer(&data->vm_sync);
>>> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
>>> +	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, NULL,
>> ONE_SEC);
>>> +	data->vm_sync = 0;
>>> +	xe_vm_unbind_async(fd, vm, 0, 0, inv_addr, bo_size, &sync, 1);
>>> +	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, NULL,
>> ONE_SEC);
>>> +	xe_exec_queue_destroy(fd, exec.exec_queue_id);
>>> +	munmap(data, bo_size);
>>> +	gem_close(fd, bo);
>>> +	xe_vm_destroy(fd, vm);
>>> +}
>>> +
>>> +igt_main
>>> +{
>>> +	const struct section {
>>> +		const char *name;
>>> +		unsigned int flags;
>>> +	} sections[] = {
>>> +		{ "invalid-va", 0 },
>>> +		{ "invalid-va-scratch", DRM_XE_VM_CREATE_SCRATCH_PAGE
>> },
>>> +		{ "invalid-va-fault", DRM_XE_VM_CREATE_FAULT_MODE },
>>> +		{ "invalid-va-fault-scratch",
>> DRM_XE_VM_CREATE_FAULT_MODE |
>>> +
>> DRM_XE_VM_CREATE_SCRATCH_PAGE },
>>> +		{ NULL },
>>> +	};
>>> +	int fd;
>>> +
>>> +	igt_fixture {
>>> +		fd = drm_open_driver(DRIVER_XE);
>>> +		igt_require(xe_supports_faults(fd));
>>> +	}
>>> +
>>> +	for (const struct section *s = sections; s->name; s++) {
>>> +		igt_subtest_f("%s", s->name)
>>> +			test_exec(fd, s->flags);
>>> +	}
>>> +
>>> +	igt_fixture
>>> +		drm_close_driver(fd);
>>> +}
>>> +
