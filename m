Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C35710E4A1
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 16:33:20 +0000 (UTC)
Message-ID: <54df27bc-31f5-837c-cb9d-e2676ce7946c@linux.intel.com>
Date: Wed, 26 Jul 2023 17:32:49 +0100
MIME-Version: 1.0
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, IGT dev <igt-dev@lists.freedesktop.org>
References: <20230712083727.282741-1-andi.shyti@linux.intel.com>
 <BYAPR11MB25679950A496EA431A76C8D09A36A@BYAPR11MB2567.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <BYAPR11MB25679950A496EA431A76C8D09A36A@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] test/i915/gem_create: Skip the test if the
 PAT index is set on a non MTL device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 12/07/2023 17:20, Yang, Fei wrote:
> On 12/07/2023 09:37, Andi Shyti wrote:
>> If we try to set the PAT index on a device that is not a Meteor Lake, we expect an -ENODEV return value. But then, we forget to skip and soon after we assert on the return value being '0', forcing the error path.
>>
>> Skip, as expected, in case the return value is either EINVAL or ENODEV, the latter for meteor lake devices.
>>
>> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks for the fix.
> Reviewed-by: Fei Yang <fei.yang@intel.com>
> 
>> Cc: Fei Yang <fei.yang@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   tests/i915/gem_create.c | 23 +++++++++++++++++------
>>   1 file changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c index b7961d9ef2..4b00fe6aab 100644
>> --- a/tests/i915/gem_create.c
>> +++ b/tests/i915/gem_create.c
>> @@ -668,14 +668,25 @@ static void create_ext_set_pat(int fd)
>>   	ret = __gem_create_ext(fd, &size, 0, &handle, &setparam_pat.base);
>>   
>>   	/*
>> -	 * With a valid PAT index specified, returning -EINVAL here
>> -	 * indicates set_pat extension is not supported
>> +	 * Currently the PAT index is supported only for Meteor Lake, so that
>> +	 * we expect:
>> +	 *
>> +	 *  * -EINVAL if i915 does not support the PAT index, e.g. the kernel is
>> +	 *    too old to have the PAT index supported.
>> +	 *  * -ENODEV if we are trying to set the PAT index on a non Meteor Lake
>> +	 *    platform.
>> +	 *
>> +	 * In both cases, though, the I915_GEM_CREATE_EXT_SET_PAT flag is not
>> +	 * supported.
>>   	 */
>> -	if (ret == -EINVAL)
>> -		igt_skip("I915_GEM_CREATE_EXT_SET_PAT is not supported\n");
>> -	else if (!IS_METEORLAKE(devid))
>> -		igt_assert_eq(ret, -ENODEV);
>> +	igt_skip_on_f(ret == -EINVAL ||
>> +		      (ret == -ENODEV && IS_METEORLAKE(devid)),

Should IS_METEORLAKE actually be !IS_METEORLAKE here?

Because I notice it still seems failing:

https://intel-gfx-ci.01.org/tree/drm-intel-fixes/CI_DIF_778/shard-dg2-3/igt@gem_create@create-ext-set-pat.html

Regards,

Tvrtko

>> +		      "I915_GEM_CREATE_EXT_SET_PAT is not supported\n");
>>   
>> +	/*
>> +	 * This means that we are on a Meteor Lake and the PAT
>> +	 * index is already supported by the running i915
>> +	 */
>>   	igt_assert(ret == 0);
>>   
>>   	/*
>> --
>> 2.40.1
