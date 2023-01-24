Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9E810E61F
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jan 2023 08:01:27 +0000 (UTC)
Message-ID: <c14c7afa-5a42-9472-216b-5f98a266074f@linux.intel.com>
Date: Tue, 24 Jan 2023 09:01:14 +0100
MIME-Version: 1.0
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 "Das, Nirmoy" <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20230120100750.24122-1-nirmoy.das@intel.com>
 <629d1ce2-a644-1b26-9264-b048b90e68b1@intel.com>
 <257cb532-adef-26f1-72f4-2c836ce1eea6@intel.com>
 <ee1a994a-9b72-05d7-fd49-0109b22593df@intel.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <ee1a994a-9b72-05d7-fd49-0109b22593df@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915/intel_memory_region: Add
 gem_has_smallbar
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 1/23/2023 8:53 PM, Andrzej Hajda wrote:
>
>
> On 23.01.2023 16:45, Das, Nirmoy wrote:
>>
>> On 1/23/2023 4:16 PM, Andrzej Hajda wrote:
>>>
>>>
>>> On 20.01.2023 11:07, Nirmoy Das wrote:
>>>> Add gem_has_smallbar() to detect a device with smallbar.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>   lib/i915/intel_memory_region.c | 32 ++++++++++++++++++++++++++++++++
>>>>   lib/i915/intel_memory_region.h |  1 +
>>>>   2 files changed, 33 insertions(+)
>>>>
>>>> diff --git a/lib/i915/intel_memory_region.c 
>>>> b/lib/i915/intel_memory_region.c
>>>> index 84e1bceb3..655720819 100644
>>>> --- a/lib/i915/intel_memory_region.c
>>>> +++ b/lib/i915/intel_memory_region.c
>>>> @@ -183,6 +183,38 @@ bool gem_has_lmem(int fd)
>>>>       return gem_get_lmem_region_count(fd) > 0;
>>>>   }
>>>>   +/**
>>>> + * gem_has_smallbar:
>>>> + * @fd: open i915 drm file descriptor
>>>> + *
>>>> + * Helper function to check if the device comes with small-bar.
>>>> + *
>>>> + * Returns: True if at least one lmem region was found.
>>>> + */
>>>> +bool gem_has_smallbar(int fd)
>>>> +{
>>>> +    struct drm_i915_query_memory_regions *info;
>>>> +    struct drm_i915_memory_region_info *rf;
>>>> +    bool ret = false;
>>>> +
>>>> +    info = gem_get_query_memory_regions(fd);
>>>> +    igt_assert(info);
>>>> +
>>>> +    for (int i = 0; i < info->num_regions; i++) {
>>>> +        rf = &info->regions[i];
>>>> +        if (rf->region.memory_class == I915_MEMORY_CLASS_DEVICE) {
>>>> +            if (rf->probed_size > rf->probed_cpu_visible_size) {
>>>> +                ret = true;
>>>> +                break;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +    free(info);
>>>
>>> Why not for_each_memory_region ?
>>
>>
>> No particular reason, it is inspired by existing code from the same 
>> file.  for_each_memory_region() though calls into 
>> gem_get_query_memory_regions() eventually.
>
> I though it could be shorter, sth like:
> bool gem_has_smallbar(int fd)
> {
>     bool ret;
>
>     for_each_memory_region(r, fd)
>         if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE && r->size 
> > r->cpu_size)
>             ret = true;
>     return ret;
> }
>
> Apparently 'break' leaks memory, so it is not so perfect :)
> Up to you.
>

Looks good but because you r-b this version, lazy me will take it 
without re-spinning it :)

> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>


Thanks, Andrzej.


Nirmoy

>
>
> Regards
> Andrzej
>
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>
>>> Regards
>>> Andrzej
>>>
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +
>>>>   /* A version of gem_create_in_memory_region_list which can be 
>>>> allowed to
>>>>      fail so that the object creation can be retried */
>>>>   int __gem_create_in_memory_region_list(int fd, uint32_t *handle, 
>>>> uint64_t *size, uint32_t flags,
>>>> diff --git a/lib/i915/intel_memory_region.h 
>>>> b/lib/i915/intel_memory_region.h
>>>> index 425bda0ec..9e24bd8fb 100644
>>>> --- a/lib/i915/intel_memory_region.h
>>>> +++ b/lib/i915/intel_memory_region.h
>>>> @@ -62,6 +62,7 @@ struct drm_i915_query_memory_regions 
>>>> *gem_get_query_memory_regions(int fd);
>>>>   unsigned int gem_get_lmem_region_count(int fd);
>>>>     bool gem_has_lmem(int fd);
>>>> +bool gem_has_smallbar(int fd);
>>>>     int __gem_create_in_memory_region_list(int fd, uint32_t 
>>>> *handle, uint64_t *size, uint32_t flags,
>>>>                          const struct 
>>>> drm_i915_gem_memory_class_instance *mem_regions,
>>>
>
