Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF1E10E10E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 16:55:36 +0000 (UTC)
Message-ID: <17293e9d-cb0e-d47a-5a21-9614715dfb40@intel.com>
Date: Fri, 14 Jul 2023 17:55:31 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: "Souza, Jose" <jose.souza@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230714144238.573403-1-matthew.auld@intel.com>
 <20230714144238.573403-3-matthew.auld@intel.com>
 <0497ba6321eb315e8f32abefde491bdda8fad81c.camel@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <0497ba6321eb315e8f32abefde491bdda8fad81c.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/6] lib/xe: add visible vram helpers
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

On 14/07/2023 17:30, Souza, Jose wrote:
> On Fri, 2023-07-14 at 15:42 +0100, Matthew Auld wrote:
>> Add helpers for object creation and querying the cpu_visible related bits.
>>
>> v2: Make it backwards compat with older kernels
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> ---
>>   lib/xe/xe_query.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++-
>>   lib/xe/xe_query.h |  6 ++++
>>   2 files changed, 91 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> index f535ad853..5412fbeb5 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -140,6 +140,17 @@ static uint64_t gt_vram_size(const struct drm_xe_query_mem_usage *mem_usage,
>>   	return 0;
>>   }
>>   
>> +static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_usage *mem_usage,
>> +				     const struct drm_xe_query_gts *gts, int gt)
>> +{
>> +	int region_idx = ffs(native_region_for_gt(gts, gt)) - 1;
>> +
>> +	if (XE_IS_CLASS_VRAM(&mem_usage->regions[region_idx]))
>> +		return mem_usage->regions[region_idx].cpu_visible_size;
>> +
>> +	return 0;
>> +}
>> +
>>   static bool __mem_has_vram(struct drm_xe_query_mem_usage *mem_usage)
>>   {
>>   	for (int i = 0; i < mem_usage->num_regions; i++)
>> @@ -246,9 +257,14 @@ struct xe_device *xe_device_get(int fd)
>>   	xe_dev->hw_engines = xe_query_engines_new(fd, &xe_dev->number_hw_engines);
>>   	xe_dev->mem_usage = xe_query_mem_usage_new(fd);
>>   	xe_dev->vram_size = calloc(xe_dev->number_gt, sizeof(*xe_dev->vram_size));
>> -	for (int gt = 0; gt < xe_dev->number_gt; gt++)
>> +	xe_dev->visible_vram_size = calloc(xe_dev->number_gt, sizeof(*xe_dev->visible_vram_size));
>> +	for (int gt = 0; gt < xe_dev->number_gt; gt++) {
>>   		xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_usage,
>>   						     xe_dev->gts, gt);
>> +		xe_dev->visible_vram_size[gt] =
>> +			gt_visible_vram_size(xe_dev->mem_usage,
>> +					     xe_dev->gts, gt);
>> +	}
>>   	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_usage);
>>   	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_usage);
>>   
>> @@ -383,6 +399,33 @@ uint64_t vram_memory(int fd, int gt)
>>   	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gts, gt) : 0;
>>   }
>>   
>> +static uint64_t __xe_visible_vram_size(int fd, int gt)
>> +{
>> +	struct xe_device *xe_dev;
>> +
>> +	xe_dev = find_in_cache(fd);
>> +	igt_assert(xe_dev);
>> +
>> +	return xe_dev->visible_vram_size[gt];
>> +}
>> +
>> +/**
>> + * visible_vram_memory:
>> + * @fd: xe device fd
>> + * @gt: gt id
>> + *
>> + * Returns vram memory bitmask for xe device @fd and @gt id, with
>> + * XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM also set, to ensure that CPU access is
>> + * possible.
>> + */
>> +uint64_t visible_vram_memory(int fd, int gt)
>> +{
>> +	if (__xe_visible_vram_size(fd, gt))
>> +		return vram_memory(fd, gt) | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>> +	else
>> +		return vram_memory(fd, gt); /* older kernel */
> 
> We don't need to maintain any compability with older Xe kernels for now...
> 
>> +}
>> +
>>   /**
>>    * vram_if_possible:
>>    * @fd: xe device fd
>> @@ -396,6 +439,28 @@ uint64_t vram_if_possible(int fd, int gt)
>>   	return vram_memory(fd, gt) ?: system_memory(fd);
>>   }
>>   
>> +/**
>> + * visible_vram_if_possible:
>> + * @fd: xe device fd
>> + * @gt: gt id
>> + *
>> + * Returns vram memory bitmask for xe device @fd and @gt id or system memory if
>> + * there's no vram memory available for @gt. Also attaches the
>> + * XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM to ensure that CPU access is possible
>> + * when using vram.
>> + */
>> +uint64_t visible_vram_if_possible(int fd, int gt)
>> +{
>> +	uint64_t regions = all_memory_regions(fd);
>> +	uint64_t system_memory = regions & 0x1;
>> +	uint64_t vram = regions & (0x2 << gt);
>> +
>> +	if (__xe_visible_vram_size(fd, gt))
>> +		return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : system_memory;
>> +	else
>> +		return vram ? vram : system_memory; /* older kernel */
>> +}
> 
> so this can be dropped and current callers should use visible_vram_memory().

Here I just wanted to keep it compatible so I could merge the IGT in any 
order. Ideally I want to merge the IGT first and let that soak for a 
couple of hours, and assuming there is no new breakage I can re-send the 
kernel patches with a hack patch to force small-bar on some CI machine 
to get pre-merge testing. Once that all passes I can merge the kernel 
side. The above compatibility stuff can then be removed after.

> 
>> +
>>   /**
>>    * xe_hw_engines:
>>    * @fd: xe device fd
>> @@ -536,6 +601,24 @@ uint64_t xe_vram_size(int fd, int gt)
>>   	return xe_dev->vram_size[gt];
>>   }
>>   
>> +/**
>> + * xe_visible_vram_size:
>> + * @fd: xe device fd
>> + * @gt: gt
>> + *
>> + * Returns size of visible vram of xe device @fd.
>> + */
>> +uint64_t xe_visible_vram_size(int fd, int gt)
>> +{
>> +	uint64_t visible_size;
>> +
>> +	visible_size = __xe_visible_vram_size(fd, gt);
>> +	if (!visible_size) /* older kernel */
>> +		visible_size = xe_vram_size(fd, gt);
>> +
>> +	return visible_size;
>> +}
>> +
>>   /**
>>    * xe_get_default_alignment:
>>    * @fd: xe device fd
>> @@ -552,6 +635,7 @@ xe_dev_FN(xe_get_default_alignment, default_alignment, uint32_t);
>>    */
>>   xe_dev_FN(xe_va_bits, va_bits, uint32_t);
>>   
>> +
>>   /**
>>    * xe_dev_id:
>>    * @fd: xe device fd
>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>> index 68ca5a680..1b74c58ab 100644
>> --- a/lib/xe/xe_query.h
>> +++ b/lib/xe/xe_query.h
>> @@ -47,6 +47,9 @@ struct xe_device {
>>   	/** @vram_size: array of vram sizes for all gts */
>>   	uint64_t *vram_size;
>>   
>> +	/** @visible_vram_size: array of visible vram sizes for all gts */
>> +	uint64_t *visible_vram_size;
>> +
>>   	/** @default_alignment: safe alignment regardless region location */
>>   	uint32_t default_alignment;
>>   
>> @@ -80,7 +83,9 @@ unsigned int xe_number_gt(int fd);
>>   uint64_t all_memory_regions(int fd);
>>   uint64_t system_memory(int fd);
>>   uint64_t vram_memory(int fd, int gt);
>> +uint64_t visible_vram_memory(int fd, int gt);
>>   uint64_t vram_if_possible(int fd, int gt);
>> +uint64_t visible_vram_if_possible(int fd, int gt);
>>   struct drm_xe_engine_class_instance *xe_hw_engines(int fd);
>>   struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
>>   struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
>> @@ -91,6 +96,7 @@ struct drm_xe_query_config *xe_config(int fd);
>>   unsigned int xe_number_hw_engines(int fd);
>>   bool xe_has_vram(int fd);
>>   uint64_t xe_vram_size(int fd, int gt);
>> +uint64_t xe_visible_vram_size(int fd, int gt);
>>   uint32_t xe_get_default_alignment(int fd);
>>   uint32_t xe_va_bits(int fd);
>>   uint16_t xe_dev_id(int fd);
> 
