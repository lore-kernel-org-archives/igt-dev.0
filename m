Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D51610E0D7
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 19:14:19 +0000 (UTC)
Message-ID: <d316ffbd-a4dd-66f6-5455-254d9404e51f@linux.intel.com>
Date: Thu, 14 Sep 2023 21:13:03 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 andi.shyti@intel.com
References: <20230913094252.6246-1-nirmoy.das@intel.com>
 <20230913094252.6246-3-nirmoy.das@intel.com>
 <20230914135017.el7yfodk4di4zqer@kamilkon-desk.igk.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230914135017.el7yfodk4di4zqer@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/intel/gem_ctx_shared: Skip
 some test on MTL
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

Hi Kamil,

On 9/14/2023 3:50 PM, Kamil Konieczny wrote:
> Hi Nirmoy,
>
> On 2023-09-13 at 11:42:51 +0200, Nirmoy Das wrote:
>> We do GGTT update on MTL using bcs engine, blocking that would
>> will fail the test so skip such subtests on bcs engine for MTL.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   tests/intel/gem_ctx_shared.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
>> index d24ae5483..bad032417 100644
>> --- a/tests/intel/gem_ctx_shared.c
>> +++ b/tests/intel/gem_ctx_shared.c
>> @@ -1105,22 +1105,26 @@ igt_main
>>   
>>   			igt_subtest_with_dynamic("Q-independent") {
>>   				for_each_queue(e, i915, &cfg)
>> -					independent(i915, &cfg, e, 0);
>> +					if (!(gem_has_ggtt_bind(i915) && e->class == I915_ENGINE_CLASS_COPY))
> ------------------------- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> imho it is better to make it a bool function (preferable) or macro
> and use it like:
> 					if (can_use_engine(i915, e))
>
> bool can_use_engine(int fd, engine *e)
> {
>      return !(e->class == I915_ENGINE_CLASS_COPY && gem_has_ggtt_bind(i915));
> }
>
> Same goes for your last patch, name of this function could be
> better.


Will do that in next rev.


Thanks,

Nirmoy

> Regards,
> Kamil
>
>> +						independent(i915, &cfg, e, 0);
>>   			}
>>   
>>   			igt_subtest_with_dynamic("Q-in-order") {
>>   				for_each_queue(e, i915, &cfg)
>> -					reorder(i915, &cfg, e->flags, EQUAL);
>> +					if (!(gem_has_ggtt_bind(i915) && e->class == I915_ENGINE_CLASS_COPY))
>> +						reorder(i915, &cfg, e->flags, EQUAL);
>>   			}
>>   
>>   			igt_subtest_with_dynamic("Q-out-order") {
>>   				for_each_queue(e, i915, &cfg)
>> -					reorder(i915, &cfg, e->flags, 0);
>> +					if (!(gem_has_ggtt_bind(i915) && e->class == I915_ENGINE_CLASS_COPY))
>> +						reorder(i915, &cfg, e->flags, 0);
>>   			}
>>   
>>   			igt_subtest_with_dynamic("Q-promotion") {
>>   				for_each_queue(e, i915, &cfg)
>> -					promotion(i915, &cfg, e->flags);
>> +					if (!(gem_has_ggtt_bind(i915) && e->class == I915_ENGINE_CLASS_COPY))
>> +						promotion(i915, &cfg, e->flags);
>>   			}
>>   		}
>>   
>> -- 
>> 2.41.0
>>
