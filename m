Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22A410E06E
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 08:10:00 +0000 (UTC)
Message-ID: <500f3993-dc82-bc64-31b1-df7390164251@linux.intel.com>
Date: Wed, 12 Jul 2023 09:09:55 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 IGT dev <igt-dev@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, Fei Yang <fei.yang@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20230606175226.502703-1-andi.shyti@linux.intel.com>
 <20230606175226.502703-2-andi.shyti@linux.intel.com>
 <20230607085737.tgauj4s2pvbjx7rg@kamilkon-desk1>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230607085737.tgauj4s2pvbjx7rg@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH v3 1/1] test/gem_create: limit set_pat only to
 Meteor Lake
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


On 07/06/2023 09:57, Kamil Konieczny wrote:
> On 2023-06-06 at 19:52:26 +0200, Andi Shyti wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> For platforms other than Meteor Lake the set_pat extension should
>> return -ENODEV.
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>   tests/i915/gem_create.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
>> index e9e8216d2b..b7961d9ef2 100644
>> --- a/tests/i915/gem_create.c
>> +++ b/tests/i915/gem_create.c
>> @@ -657,6 +657,7 @@ static void create_ext_set_pat(int fd)
>>   		.base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
>>   		.pat_index = 65,
>>   	};
>> +	uint32_t devid = intel_get_drm_devid(fd);
>>   	struct drm_i915_gem_caching arg;
>>   	uint64_t size;
>>   	uint32_t handle;
>> @@ -672,6 +673,9 @@ static void create_ext_set_pat(int fd)
>>   	 */
>>   	if (ret == -EINVAL)
>>   		igt_skip("I915_GEM_CREATE_EXT_SET_PAT is not supported\n");
>> +	else if (!IS_METEORLAKE(devid))
>> +		igt_assert_eq(ret, -ENODEV);

Hmm a sea of red..

https://intel-gfx-ci.01.org/tree/drm-tip/index.html?testfilter=set-pat

https://intel-gfx-ci.01.org/tree/drm-intel-fixes/CI_DIF_773/shard-snb7/igt@gem_create@create-ext-set-pat.html

Starting subtest: create-ext-set-pat
(gem_create:1095) CRITICAL: Test assertion failure function create_ext_set_pat, file ../../../usr/src/igt-gpu-tools/tests/i915/gem_create.c:679:
(gem_create:1095) CRITICAL: Failed assertion: ret == 0
Subtest create-ext-set-pat failed.

Not sure why shards run did not flag this (?!), but AFAICT the logic does not work.

It should be igt_skip on MTL, otherwise..

>> +
> 
> lgtm,
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
>>   	igt_assert(ret == 0);

.. test just fails here. So something like:

igt_skip_on_f(ret == -EINVAL || (ret == -ENODEV && IS_METEORLAKE(devid)), "...")

?

Regards,

Tvrtko

>>   
>>   	/*
>> -- 
>> 2.40.1
>>
