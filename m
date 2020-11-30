Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C047389D66
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Nov 2020 12:09:18 +0000 (UTC)
References: <20201130020302.24843-1-arjun.melkaveri@intel.com>
 <b9ce71e8-ef37-1b8d-094a-3f43a813089f@linux.intel.com>
 <160673117719.5723.1339994628703260139@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <4cb91c29-13d0-3e6c-0270-aee74a2189bb@linux.intel.com>
Date: Mon, 30 Nov 2020 12:09:10 +0000
MIME-Version: 1.0
In-Reply-To: <160673117719.5723.1339994628703260139@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] gem_exec_reloc & gem_shrink: Added
 gem_require_mappable_ggtt to check mappable aperture
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Arjun Melkaveri <arjun.melkaveri@intel.com>, igt-dev@lists.freedesktop.org, tvrtko.ursulin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>


On 30/11/2020 10:12, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-11-30 10:04:17)
>> On 30/11/2020 02:03, Arjun Melkaveri wrote:
>>> Added gem_require_mappable_ggtt to check mappable aperture.
>>> This is to avoid any test crash that might happen
>>> if mappable aperture is not avilable.
>>>
>>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
>>> ---
>>>    tests/i915/gem_exec_reloc.c | 3 +++
>>>    tests/i915/gem_shrink.c     | 2 ++
>>>    2 files changed, 5 insertions(+)
>>>
>>> diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
>>> index 8dcb24a6..596b1157 100644
>>> --- a/tests/i915/gem_exec_reloc.c
>>> +++ b/tests/i915/gem_exec_reloc.c
>>> @@ -1217,6 +1217,7 @@ igt_main
>>>                        if (!(f->flags & NORELOC)) {
>>>                                igt_subtest_f("%srange%s",
>>>                                              f->basic ? "basic-" : "", f->name) {
>>> +                                     gem_require_mappable_ggtt(fd);
>>
>>   From the code and commit message it is not immediately obvious to me
>> why basic_range needs the aperture, Chris? Answer to that will drive the
>> solution.
> 
> It does not.

Okay, so the plan for this one should be to stop probing aperture size 
and instead probe the size of the address space in use. This will be 
ggtt on old gens and ppgtt on new ones. And to keep object count in 
check with regards to available backing store, if required (not sure 
right now).

>>
>>>                                        igt_while_interruptible(f->flags & INTERRUPTIBLE)
>>>                                                basic_range(fd, f->flags);
>>>                                }
>>> @@ -1264,6 +1265,7 @@ igt_main
>>>        }
>>>    
>>>        igt_subtest_with_dynamic("basic-spin") {
>>> +
>>
>> !
>>
>>>                __for_each_physical_engine(fd, e) {
>>>                        igt_dynamic_f("%s", e->name)
>>>                                active_spin(fd, e->flags);
>>> @@ -1278,6 +1280,7 @@ igt_main
>>>        }
>>>    
>>>        igt_subtest_with_dynamic("basic-many-active") {
>>> +             gem_require_mappable_ggtt(fd);
>>>                __for_each_physical_engine(fd, e) {
>>>                        igt_dynamic_f("%s", e->name)
>>>                                many_active(fd, e->flags);
>>
>> Same for many_active - maybe tests should use ggtt size and not
>> aperture, with some tweaks to make size/runtime sane?
> 
> It does not. This is somebody hacking over a major kernel bug.

Okay so same as above, don't probe aperture but address space size.

> 
>>> diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
>>> index dba62c8f..094975af 100644
>>> --- a/tests/i915/gem_shrink.c
>>> +++ b/tests/i915/gem_shrink.c
>>> @@ -432,6 +432,8 @@ igt_main
>>>                fd = drm_open_driver(DRIVER_INTEL);
>>>                igt_require_gem(fd);
>>>    
>>> +             gem_require_mappable_ggtt(fd);
>>> +
>>>                /*
>>>                 * Spawn enough processes to use all memory, but each only
>>>                 * uses half the available mappable aperture ~128MiB.
>>>
>>
>> And for this one the same I think. Apart from the subtests using
>> mmap-gtt other ones could probably be made work by calculating the
>> working set in a different way. Possibly just use the ggtt size and skip
>> tests which need aperture if no aperture. Chris would that be acceptable
>> or there is a special reason to have N clients with each using an
>> aperture sized amount of memory, to total RAM size?
> 
> shrink is system memory limits.

Yes, I was ignoring that aspect for now and focusing on the aperture 
size misuse. But yes, making gem_shrink falsely pass on dg1 is not what 
we really want. Probably make it explicitly use system memory objects 
once that API is available.

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
