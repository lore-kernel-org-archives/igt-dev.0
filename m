Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455CD10E16B
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 12:39:24 +0000 (UTC)
Message-ID: <a34e134e-8427-c46e-4c39-3c749fe0867a@intel.com>
Date: Mon, 3 Apr 2023 13:39:13 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, igt-dev@lists.freedesktop.org
References: <20230329115642.244296-1-matthew.auld@intel.com>
 <20230329115642.244296-3-matthew.auld@intel.com>
 <8ffd9eaa-880a-4a5b-8463-5c3260a7d092@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <8ffd9eaa-880a-4a5b-8463-5c3260a7d092@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] lib/xe: add visible vram helpers
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

On 03/04/2023 10:18, Gwan-gyeong Mun wrote:
> 
> 
> On 3/29/23 2:56 PM, Matthew Auld wrote:
>> Add helpers for object creation and querying the cpu_visible related 
>> bits.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> ---
>>   lib/xe/xe_query.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++-
>>   lib/xe/xe_query.h |  6 +++++
>>   2 files changed, 74 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> index f281bc4a..48a413cd 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -140,6 +140,17 @@ static uint64_t gt_vram_size(const struct 
>> drm_xe_query_mem_usage *mem_usage,
>>       return 0;
>>   }
>> +static uint64_t gt_visible_vram_size(const struct 
>> drm_xe_query_mem_usage *mem_usage,
>> +                     const struct drm_xe_query_gts *gts, int gt)
>> +{
>> +    int region_idx = ffs(native_region_for_gt(gts, gt)) - 1;
>> +
>> +    if (XE_IS_CLASS_VRAM(&mem_usage->regions[region_idx]))
>> +        return mem_usage->regions[region_idx].cpu_visible_size;
>> +
>> +    return 0;
>> +}
>> +
>>   static bool __mem_has_vram(struct drm_xe_query_mem_usage *mem_usage)
>>   {
>>       for (int i = 0; i < mem_usage->num_regions; i++)
>> @@ -246,9 +257,14 @@ struct xe_device *xe_device_get(int fd)
>>       xe_dev->hw_engines = xe_query_engines_new(fd, 
>> &xe_dev->number_hw_engines);
>>       xe_dev->mem_usage = xe_query_mem_usage_new(fd);
>>       xe_dev->vram_size = calloc(xe_dev->number_gt, 
>> sizeof(*xe_dev->vram_size));
>> -    for (int gt = 0; gt < xe_dev->number_gt; gt++)
>> +    xe_dev->visible_vram_size = calloc(xe_dev->number_gt, 
>> sizeof(*xe_dev->visible_vram_size));
>> +    for (int gt = 0; gt < xe_dev->number_gt; gt++) {
>>           xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_usage,
>>                                xe_dev->gts, gt);
>> +        xe_dev->visible_vram_size[gt] =
>> +            gt_visible_vram_size(xe_dev->mem_usage,
>> +                         xe_dev->gts, gt);
>> +    }
>>       xe_dev->default_alignment = 
>> __mem_default_alignment(xe_dev->mem_usage);
>>       xe_dev->has_vram = __mem_has_vram(xe_dev->mem_usage);
>> @@ -383,6 +399,20 @@ uint64_t vram_memory(int fd, int gt)
>>       return native_region_for_gt(xe_dev->gts, gt);
>>   }
>> +/**
>> + * visible_vram_memory:
>> + * @fd: xe device fd
>> + * @gt: gt id
>> + *
>> + * Returns vram memory bitmask for xe device @fd and @gt id, with
>> + * XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM also set, to ensure that CPU 
>> access is
>> + * possible.
>> + */
>> +uint64_t visible_vram_memory(int fd, int gt)
>> +{
>> +    return vram_memory(fd, gt) | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>> +}
>> +
>>   /**
>>    * vram_if_possible:
>>    * @fd: xe device fd
>> @@ -400,6 +430,25 @@ uint64_t vram_if_possible(int fd, int gt)
>>       return vram ? vram : system_memory;
>>   }
>> +/**
>> + * visible_vram_if_possible:
>> + * @fd: xe device fd
>> + * @gt: gt id
>> + *
>> + * Returns vram memory bitmask for xe device @fd and @gt id or system 
>> memory if
>> + * there's no vram memory available for @gt. Also attaches the
>> + * XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM to ensure that CPU access is 
>> possible
>> + * when using vram.
>> + */
>> +uint64_t visible_vram_if_possible(int fd, int gt)
>> +{
>> +    uint64_t regions = all_memory_regions(fd);
>> +    uint64_t system_memory = regions & 0x1;
>> +    uint64_t vram = regions & (0x2 << gt);
>> +
> Hi Matt,
> 
> vram_if_possible() uses as the below check routine for vram
> 
> uint64_t vram = regions & (~0x1);
> 
> but, here uses
> 
> uint64_t vram = regions & (0x2 << gt);
> 
> Why do you use a different check method than the vram_if_possible()?

I assume it was just copy-pasted from an earlier version of 
vram_if_possible(). Although I don't quite get why it wants to use 
(~0x1) here, if we are passing in the GT...

> 
> Other than that, the rest looks good.
> 
> Br,
> G.G.
>> +    return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : 
>> system_memory;
>> +}
>> +
>>   /**
>>    * xe_hw_engines:
>>    * @fd: xe device fd
>> @@ -459,6 +508,23 @@ uint64_t xe_vram_size(int fd, int gt)
>>       return xe_dev->vram_size[gt];
>>   }
>> +/**
>> + * xe_visible_vram_size:
>> + * @fd: xe device fd
>> + * @gt: gt
>> + *
>> + * Returns size of visible vram of xe device @fd.
>> + */
>> +uint64_t xe_visible_vram_size(int fd, int gt)
>> +{
>> +    struct xe_device *xe_dev;
>> +
>> +    xe_dev = find_in_cache(fd);
>> +    igt_assert(xe_dev);
>> +
>> +    return xe_dev->visible_vram_size[gt];
>> +}
>> +
>>   /**
>>    * xe_get_default_alignment:
>>    * @fd: xe device fd
>> @@ -475,6 +541,7 @@ xe_dev_FN(xe_get_default_alignment, 
>> default_alignment, uint32_t);
>>    */
>>   xe_dev_FN(xe_va_bits, va_bits, uint32_t);
>> +
>>   /**
>>    * xe_dev_id:
>>    * @fd: xe device fd
>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>> index 3a00ecd1..5aa5b402 100644
>> --- a/lib/xe/xe_query.h
>> +++ b/lib/xe/xe_query.h
>> @@ -47,6 +47,9 @@ struct xe_device {
>>       /** @vram_size: array of vram sizes for all gts */
>>       uint64_t *vram_size;
>> +    /** @visible_vram_size: array of visible vram sizes for all gts */
>> +    uint64_t *visible_vram_size;
>> +
>>       /** @default_alignment: safe alignment regardless region 
>> location */
>>       uint32_t default_alignment;
>> @@ -76,13 +79,16 @@ unsigned int xe_number_gt(int fd);
>>   uint64_t all_memory_regions(int fd);
>>   uint64_t system_memory(int fd);
>>   uint64_t vram_memory(int fd, int gt);
>> +uint64_t visible_vram_memory(int fd, int gt);
>>   uint64_t vram_if_possible(int fd, int gt);
>> +uint64_t visible_vram_if_possible(int fd, int gt);
>>   struct drm_xe_engine_class_instance *xe_hw_engines(int fd);
>>   struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
>>   unsigned int xe_number_hw_engines(int fd);
>>   bool xe_has_vram(int fd);
>>   //uint64_t xe_vram_size(int fd);
>>   uint64_t xe_vram_size(int fd, int gt);
>> +uint64_t xe_visible_vram_size(int fd, int gt);
>>   uint32_t xe_get_default_alignment(int fd);
>>   uint32_t xe_va_bits(int fd);
>>   uint16_t xe_dev_id(int fd);
