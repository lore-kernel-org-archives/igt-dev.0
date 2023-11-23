Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D44810E713
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 10:24:37 +0000 (UTC)
Message-ID: <46c781e7-f3e1-4ba8-84aa-fcdee01e0576@linux.intel.com>
Date: Thu, 23 Nov 2023 11:24:32 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>, matthew.auld@intel.com,
 zbigniew.kempczynski@intel.com, lukasz.laguna@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
References: <20231122101951.6568-1-marcin.bernatowicz@intel.com>
 <20231122161618.ydn2k4fhyceigxin@kamilkon-desk.igk.intel.com>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231122161618.ydn2k4fhyceigxin@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] xe_create: create-big-vram subtest
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



On 11/22/2023 5:16 PM, Kamil Konieczny wrote:
> Hi Marcin,
> On 2023-11-22 at 11:19:51 +0100, Marcin Bernatowicz wrote:
> 
> please add version info to your patches and also add tests/intel/
> or lib/xe as prefix, for example instead of:
> 
> [PATCH i-g-t] xe_create: create-big-vram subtest
> 
> write:
> 
> [PATCH v3 i-g-t] tests/intel/xe_create: create-big-vram subtest
> 
> For lib change:
> 
> [PATCH v3 i-g-t] lib/xe/xe_query: describe here your change
> 
>> Validates the creation of significant Buffer Object (BO) within VRAM,
>> considering the entire available CPU-visible VRAM size.
>> The size of the created BO can be adjusted using
>> '-S' command line parameter, representing BO size in MB.
>>
>> v2: rebased, updated to uAPI changes (DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT),
>>      after review corrections: 1024UL -> 1024ULL,
>>      int -> unsigned int (Kamil)
>> v3: provided a flag to allocate the memory within the CPU-visible
>>        portion of VRAM (Matt)
>>      __create_bo replaced with xe_bo_create_flags (Lukasz)
>>      removed the percent command line parameter (Lukasz)
>>      renamed size_MB to size_mb (Lukasz)
>>      added helper function to query available CPU-visible VRAM size,
>>      renamed 'xe_vram_available' to 'xe_available_vram_size' for
>>        consistency with other function names
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
>> ---
>>   lib/xe/xe_query.c          | 57 ++++++++++++++++++++++-------
>>   lib/xe/xe_query.h          |  3 +-
> 
> Please split this into separate patch and send Cc to Francois Dugas,
> he is currently changing xe uapi.

Just realized I touched more files and forgot to split patches :/

> 
>>   tests/intel/xe_create.c    | 75 +++++++++++++++++++++++++++++++++++++-
>>   tests/intel/xe_evict_ccs.c |  2 +-
>>   4 files changed, 120 insertions(+), 17 deletions(-)
>>
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> index afd443be3..de3296062 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -629,20 +629,20 @@ uint64_t xe_visible_vram_size(int fd, int gt)
>>   
>>   	return visible_size;
>>   }
>> -/**
>> - * xe_vram_available:
>> - * @fd: xe device fd
>> - * @gt: gt
>> - *
>> - * Returns available vram of xe device @fd and @gt.
>> - */
>> -uint64_t xe_vram_available(int fd, int gt)
>> +
>> +struct __available_vram {
>> +	uint64_t total_available;
>> +	uint64_t cpu_visible_available;
>> +};
>> +
>> +static void __xe_available_vram_size_snapshot(int fd, int gt, struct __available_vram *avail_vram)
>>   {
>>   	struct xe_device *xe_dev;
>>   	int region_idx;
>>   	struct drm_xe_query_mem_region *mem_region;
>>   	struct drm_xe_query_mem_regions *mem_regions;
>>   
>> +	igt_assert(avail_vram);
>>   	xe_dev = find_in_cache(fd);
>>   	igt_assert(xe_dev);
>>   
>> @@ -650,19 +650,48 @@ uint64_t xe_vram_available(int fd, int gt)
>>   	mem_region = &xe_dev->mem_regions->regions[region_idx];
>>   
>>   	if (XE_IS_CLASS_VRAM(mem_region)) {
>> -		uint64_t available_vram;
>> -
>>   		mem_regions = xe_query_mem_regions_new(fd);
>>   		pthread_mutex_lock(&cache.cache_mutex);
>>   		mem_region->used = mem_regions->regions[region_idx].used;
>> -		available_vram = mem_region->total_size - mem_region->used;
>> +		mem_region->cpu_visible_used = mem_regions->regions[region_idx].cpu_visible_used;
>> +		avail_vram->total_available = mem_region->total_size - mem_region->used;
>> +		avail_vram->cpu_visible_available =
>> +			mem_region->cpu_visible_size - mem_region->cpu_visible_used;
>>   		pthread_mutex_unlock(&cache.cache_mutex);
>>   		free(mem_regions);
>> -
>> -		return available_vram;
>>   	}
>> +}
>>   
>> -	return 0;
>> +/**
>> + * xe_available_vram_size:
>> + * @fd: xe device fd
>> + * @gt: gt
>> + *
>> + * Returns size of available vram of xe device @fd and @gt.
>> + */
>> +uint64_t xe_available_vram_size(int fd, int gt)
>> +{
>> +	struct __available_vram available_vram = {};
>> +
>> +	__xe_available_vram_size_snapshot(fd, gt, &available_vram);
>> +
>> +	return available_vram.total_available;
>> +}
>> +
>> +/**
>> + * xe_visible_available_vram_size:
>> + * @fd: xe device fd
>> + * @gt: gt
>> + *
>> + * Returns size of visible available vram of xe device @fd and @gt.
>> + */
>> +uint64_t xe_visible_available_vram_size(int fd, int gt)
>> +{
>> +	struct __available_vram available_vram = {};
>> +
>> +	__xe_available_vram_size_snapshot(fd, gt, &available_vram);
>> +
>> +	return available_vram.cpu_visible_available;
>>   }
>>   
>>   /**
>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>> index 38e9aa440..503d60b44 100644
>> --- a/lib/xe/xe_query.h
>> +++ b/lib/xe/xe_query.h
>> @@ -92,7 +92,8 @@ unsigned int xe_number_hw_engines(int fd);
>>   bool xe_has_vram(int fd);
>>   uint64_t xe_vram_size(int fd, int gt);
>>   uint64_t xe_visible_vram_size(int fd, int gt);
>> -uint64_t xe_vram_available(int fd, int gt);
>> +uint64_t xe_available_vram_size(int fd, int gt);
>> +uint64_t xe_visible_available_vram_size(int fd, int gt);
>>   uint32_t xe_get_default_alignment(int fd);
>>   uint32_t xe_va_bits(int fd);
>>   uint16_t xe_dev_id(int fd);
>> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
>> index f4633cfb3..082e9b440 100644
>> --- a/tests/intel/xe_create.c
>> +++ b/tests/intel/xe_create.c
>> @@ -18,6 +18,12 @@
>>   
>>   #define PAGE_SIZE 0x1000
>>   
>> +static struct param {
>> +	unsigned int size_mb;
>> +} params = {
>> +	.size_mb = 0,
>> +};
>> +
>>   static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
>>   		       uint32_t *handlep)
>>   {
>> @@ -214,7 +220,70 @@ static void create_massive_size(int fd)
>>   	}
>>   }
>>   
>> -igt_main
>> +/**
>> + * SUBTEST: create-big-vram
>> + * Functionality: BO creation
>> + * Test category: functionality test
>> + * Description: Verifies the creation of substantial BO within VRAM,
>> + *		constituting all available CPU-visible VRAM.
>> + */
>> +static void create_big_vram(int fd)
>> +{
>> +	uint64_t bo_size, size, visible_avail_size, alignment;
>> +	uint32_t bo_handle;
>> +	char *bo_ptr = NULL;
>> +	uint64_t vm = 0;
>> +	int gt;
>> +
>> +	igt_require(xe_has_vram(fd));
>> +	alignment = xe_get_default_alignment(fd);
>> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
>> +
>> +	xe_for_each_gt(fd, gt) {
>> +		visible_avail_size = xe_visible_available_vram_size(fd, gt);
>> +		bo_size = params.size_mb ? params.size_mb * 1024ULL * 1024ULL
>> +					 : ALIGN_DOWN(visible_avail_size, alignment);
>> +		igt_debug("gt%u bo_size=%lu visible_available_vram_size=%lu\n",
>> +			gt, bo_size, visible_avail_size);
>> +
>> +		bo_handle = xe_bo_create_flags(fd, vm, bo_size, visible_vram_memory(fd, gt));
>> +		bo_ptr = xe_bo_map(fd, bo_handle, bo_size);
>> +
>> +		size = bo_size - 1;
>> +		while (size > SZ_64K) {
>> +			igt_assert_eq(0, READ_ONCE(bo_ptr[size]));
>> +			WRITE_ONCE(bo_ptr[size], 'A');
>> +			igt_assert_eq('A', READ_ONCE(bo_ptr[size]));
>> +			size >>= 1;
>> +		}
>> +		igt_assert_eq(0, bo_ptr[0]);
>> +
>> +		munmap(bo_ptr, bo_size);
>> +		gem_close(fd, bo_handle);
>> +	}
>> +
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +static int opt_handler(int opt, int opt_index, void *data)
>> +{
>> +	switch (opt) {
>> +	case 'S':
>> +		params.size_mb = atoi(optarg);
>> +		igt_debug("Size MB: %d\n", params.size_mb);
>> +		break;
>> +	default:
>> +		return IGT_OPT_HANDLER_ERROR;
>> +	}
>> +
>> +	return IGT_OPT_HANDLER_SUCCESS;
>> +}
>> +
>> +const char *help_str =
>> +	"  -S\tBO size in MB\n"
> 
> Why not percentage? imho percentage is easier to use.

I can revert to the first version and keep both options. In some 
scenarios, size is more beneficial, for example, when we want to verify 
the provisioned LMEM value in SR-IOV.

> 
>> +	;
>> +
>> +igt_main_args("S:", NULL, help_str, opt_handler, NULL)
>>   {
>>   	int xe;
>>   
>> @@ -254,6 +323,10 @@ igt_main
>>   	}
>>   
>>   
> 
> Remove one empty line.
ok
> 
>> +	igt_subtest("create-big-vram") {
>> +		create_big_vram(xe);
>> +	}
>> +
>>   	igt_fixture
>>   		drm_close_driver(xe);
>>   }
>> diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
>> index d7244f620..b04c20935 100644
>> --- a/tests/intel/xe_evict_ccs.c
>> +++ b/tests/intel/xe_evict_ccs.c
>> @@ -325,7 +325,7 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
>>   	config->param = param;
>>   	config->flags = flags;
>>   	config->free_mb = xe_visible_vram_size(fd, 0) / SZ_1M;
>> -	config->total_mb = xe_vram_available(fd, 0) / SZ_1M;
>> +	config->total_mb = xe_available_vram_size(fd, 0) / SZ_1M;
> 
> This should go with lib change.
ok
> 
> Regards,
> Kamil

Thanks for review,
marcin
> 
>>   	config->test_mb = min_t(int, config->free_mb * config->param->vram_percent / 100,
>>   				config->total_mb * config->param->vram_percent / 100);
>>   
>> -- 
>> 2.31.1
>>
