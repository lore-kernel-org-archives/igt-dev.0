Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F6A6E7F5
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 11:37:07 +0000 (UTC)
References: <20200129181002.9405-1-krishnaiah.bommu@intel.com>
 <20200129181002.9405-2-krishnaiah.bommu@intel.com>
 <158033216228.13511.16715726772665260638@skylake-alporthouse-com>
 <8454bc4b-d07a-07bd-a8e8-bd15795de282@linux.intel.com>
 <72a7ea9a-e3f9-1164-1b93-432f71cb9398@linux.intel.com>
 <158038170520.16598.9441619406410034128@skylake-alporthouse-com>
 <4042402c-58f3-8ff9-2165-149f06d19074@linux.intel.com>
 <158038280911.16598.3910529948495289620@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <852adc41-b5a9-7fd8-598c-8db7b7f5b59f@linux.intel.com>
Date: Thu, 30 Jan 2020 11:37:03 +0000
MIME-Version: 1.0
In-Reply-To: <158038280911.16598.3910529948495289620@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/1] tests/i915/gem_ctx_persistence:
 Set context with supported engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, Bommu Krishnaiah <krishnaiah.bommu@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 30/01/2020 11:13, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-01-30 11:08:47)
>>
>> On 30/01/2020 10:55, Chris Wilson wrote:
>>> Quoting Tvrtko Ursulin (2020-01-30 10:52:26)
>>>> On 30/01/2020 10:31, Tvrtko Ursulin wrote:
>>>>> On 29/01/2020 21:09, Chris Wilson wrote:
>>>>>> Quoting Bommu Krishnaiah (2020-01-29 18:10:02)
>>>>>>> Update the context with supported engines on the platform with set_property
>>>>>>> I915_CONTEXT_PARAM_ENGINES to make sure the work load is submitted to
>>>>>>> the available engines only.
>>>>>>>
>>>>>>> v2: addressed the review comments.
>>>>>>> v3: addressed v2 review comments.
>>>>>>> V4: Re-introduced the gem_context_set_all_engines() API,test_process_mixed()
>>>>>>> test creating new forked process, to set engine map to new forked process
>>>>>>> I added gem_context_set_all_engines() API.
>>>>>>> v5: addressed v4 review comments.
>>>>>>> v6: addressed chris comments.
>>>>>>
>>>>>> This is totally useless as a recording of the history. Explain why you
>>>>>> had to make the changes, for posterity.
>>>>>>
>>>>>>> -       __for_each_static_engine(e) {
>>>>>>> +       for_each_engine(e, i915) {
>>>>>>
>>>>>> Incorrect change that leads to compiler warnings and prevents the legacy
>>>>>> tests being listed by CI.
>>>>>>
>>>>>> I've given up and fixed it.
>>>>
>>>> Where's your version Chris?
>>>
>>> 21f4d0f72c0a3519270712565b2fe688157fc18b
>>
>> I suggest the below delta to a) not add more dependencies on the static e2 list and b) also cover I915_EXEC_BSD. I'll send a patch if you agree.
>>
>> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
>> index 8b9633b214ff..4d4b735d4936 100644
>> --- a/tests/i915/gem_ctx_persistence.c
>> +++ b/tests/i915/gem_ctx_persistence.c
>> @@ -759,7 +759,8 @@ static void smoketest(int i915)
>>   
>>   igt_main
>>   {
>> -       const struct intel_execution_engine2 *e;
>> +       const struct intel_execution_engine *e;
>> +       const struct intel_execution_engine2 *e2;
>>          int i915;
>>   
>>          igt_fixture {
>> @@ -792,66 +793,68 @@ igt_main
>>          igt_subtest("hang")
>>                  test_nohangcheck_hang(i915);
>>   
>> -       __for_each_static_engine(e) {
>> +       for (e = intel_execution_engines; e->name; e++) {
> 
> I don't mind too much, I just expected the __for_each_static_engine() to
> save on typing. But yeah, eb_ring().

__for_each_static_engine is the one which we are >.< this close 
eliminating after dynamic subtests and "i915/gem_engine_topology: 
Generate engine names based on class" but more importantly my vision of 
splitting legacy eb.flags and physical engine testing was that they are 
completely separate.

Sequence of steps along the lines of:

delete __for_each_static_engine

for_each_physical_engine -> __for_each_physical_engine and required test 
adaptations

delete for_each_physical_engine

rename __for_each_pyhsical_engine into for_each_physical_engine

(optional) rename for_each_engine into for_each_engine_flag (give or take)

(optional) add convenience macro to iterate legacy eb flags statically
(alternative) convert those into dynamic subtests and use 
for_each_engine_flags


> But much yuck on e and e2. Can we move them to separate functions to
> hide the eyesore?

Move to functions, how?

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
