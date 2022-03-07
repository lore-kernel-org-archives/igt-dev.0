Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AED10F0C9
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Mar 2022 10:10:35 +0000 (UTC)
Message-ID: <441f2463-fc74-fb67-2512-f23ab942c162@linux.intel.com>
Date: Mon, 7 Mar 2022 10:10:28 +0000
MIME-Version: 1.0
Content-Language: en-US
To: "Liu, Chuansheng" <chuansheng.liu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20220304051509.44816-1-chuansheng.liu@intel.com>
 <9bebc5ee-55eb-91bc-65dd-1e0692e42a6a@linux.intel.com>
 <BL1PR11MB544548D4A7A8247D1DEECE1297089@BL1PR11MB5445.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <BL1PR11MB544548D4A7A8247D1DEECE1297089@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_mmap_gtt: add test
 mmap_closed_bo
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 07/03/2022 01:02, Liu, Chuansheng wrote:
> Hi Tvrtko,
> 
> Thanks for review, please see my comments below.
> 
>> -----Original Message-----
>> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Sent: Saturday, March 5, 2022 12:35 AM
>> To: Liu, Chuansheng <chuansheng.liu@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: Ursulin, Tvrtko <tvrtko.ursulin@intel.com>
>> Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_mmap_gtt: add test
>> mmap_closed_bo
>>
>>
>> Hi,
>>
>> Some nits, some questions below.
>>
>> On 04/03/2022 05:15, Chuansheng Liu wrote:
>>> Recently we figured out one memory leak in i915 driver when running
>>> below alike test:
>>>
>>> create_bo
>>> gem_mmap_gtt bo
>>> gem_mmap_gtt bo twice
>>> close_bo
>>>
>>> then the memory leak is detected. More details can be referred in
>>> https://patchwork.freedesktop.org/patch/475802/?series=100532&rev=2
>>>
>>> For detecting such issue, this test case mmap_closed_bo is created,
>>> it will close the bo with keeping one mmap, then second mmap the bo,
>>> in normal situation, we expect second mmap failure with EACCESS. But
>>> it will succeed if driver has the vm_node allowance leak.
>>>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
>>> ---
>>>    tests/i915/gem_mmap_gtt.c | 42
>> +++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 42 insertions(+)
>>>
>>> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
>>> index 92bbb5d2..0f4d5385 100644
>>> --- a/tests/i915/gem_mmap_gtt.c
>>> +++ b/tests/i915/gem_mmap_gtt.c
>>> @@ -318,6 +318,46 @@ test_wc(int fd)
>>>    		     5*gtt_writes/256., 5*cpu_writes/256.);
>>>    }
>>>
>>> +static void mmap_closed_bo(int fd)
>>> +{
>>> +	struct drm_i915_gem_mmap_gtt mmap_arg;
>>> +	void *p1, *p2;
>>> +	int loop = 0, i = 0;
>>
>> Nits - don't need to init i, mmap_arg, p1 and p2 could be declared in
>> the loop.
> OK, will update it in V2.
> 
>>
>>> +
>>> +	while (loop++ < 2) {
>>> +		memset(&mmap_arg, 0, sizeof(mmap_arg));
>>> +
>>> +		mmap_arg.handle = gem_create(fd, OBJECT_SIZE);
>>> +		igt_assert(mmap_arg.handle);
>>> +
>>> +		i = loop;
>>> +		while (i--) {
>>> +			/* get offset, here we tries a loop to call
>> GEM_MMAP_GTT many times,
>>
>> If I may suggest:
>>
>> /*
>>    * Get mmap offset by calling GEM_MMAP_GTT one or multiple times in
>>    * order to try to provoke a memory leak in the driver.
>>    */
> OK, will update it in V2.
> 
>>
>>> +			 * it could trigger driver memory leak issue easily.
>>> +			 */
>>> +			do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT,
>> &mmap_arg);
>>> +		}
>>> +
>>> +		p1 = mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
>>> +			MAP_SHARED, fd, mmap_arg.offset);
>>> +		igt_assert(p1 != MAP_FAILED);
>>> +
>>> +		gem_close(fd, mmap_arg.handle);
>>> +		gem_quiescent_gpu(fd);
>>
>> What is quiescent for? I usually expect to see it when test created some
>> GPU activity, which isn't the case here. If there is a subtle reason
>> please put a comment here.
>>
> Normally when we call gem_close(), the object is being freed by kworker on the way,
> if we call mmap in the middle, we may get different errno(invalid or eaccess) inconsistently,
> here quiescent is for flush object-free kworker done to get consistent errno. Even though,
> in this case, return error -1 of mmap is enough for checking at last.
> I could put one comment for it in V2.

I see. You could call igt_drop_caches_set(DROP_FREED) and it will be 
close to self-documenting? I think that's the flag to use at least, 
please check if you decide to try it.

Rest of v2 looks good to me.

Regards,

Tvrtko

>   
>>> +
>>> +		p2 = mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
>>> +			MAP_SHARED, fd, mmap_arg.offset);
>>> +
>>> +		munmap(p1, OBJECT_SIZE);
>>> +
>>> +		/* we expect mmapping p2 would fail, otherwise the driver
>>> +		 * may not clean up the allowance of vm_node, it would
>>> +		 * cause memory leak.
>>> +		 */
>>> +		igt_assert(p2 == MAP_FAILED);
>>
>> I get this - mmap(p2) should fail after object close regardless of how
>> many time DRM_IOCTL_I915_GEM_MMAP_GTT was called.
>>
>> Excellent that you found a way to test for the leak without the need for
>> kmemleak! At least that's how I read the posting of this test. :)
> Exactly : )
> This test also reflects the inconsistency between calling one-time MMAP_GTT
> and calling multi-time MMAP_GTT.
> 
> Best Regards
> Chuansheng
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +	}
>>> +}
>>> +
>>>    static int mmap_gtt_version(int i915)
>>>    {
>>>    	int val = 0;
>>> @@ -1305,6 +1345,8 @@ igt_main
>>>    		test_write(fd);
>>>    	igt_subtest("basic-write-gtt")
>>>    		test_write_gtt(fd);
>>> +	igt_subtest("mmap_closed_bo")
>>> +		mmap_closed_bo(fd);
>>>    	igt_subtest("ptrace")
>>>    		test_ptrace(fd);
>>>    	igt_subtest("coherency")
