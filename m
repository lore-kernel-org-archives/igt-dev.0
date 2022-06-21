Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <c65b99f9-69f0-df0d-1b00-76ae5c5ffbcd@intel.com>
Date: Tue, 21 Jun 2022 14:01:22 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Petri Latvala <petri.latvala@intel.com>
References: <20220621103001.184373-1-matthew.auld@intel.com>
 <20220621103001.184373-7-matthew.auld@intel.com>
 <YrG8kUzR9a3zWWs7@platvala-desk.ger.corp.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <YrG8kUzR9a3zWWs7@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 6/9] tests/i915/query: sanity check
 the unallocated tracking
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 21/06/2022 13:41, Petri Latvala wrote:
> On Tue, Jun 21, 2022 at 11:29:58AM +0100, Matthew Auld wrote:
>> Sanity both the unallocated_size & unallocated_cpu_visible_size tracking.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   tests/i915/i915_query.c | 274 +++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 273 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
>> index ea99dc8d..7fbee545 100644
>> --- a/tests/i915/i915_query.c
>> +++ b/tests/i915/i915_query.c
>> @@ -23,6 +23,8 @@
>>   
>>   #include "igt.h"
>>   #include "intel_hwconfig_types.h"
>> +#include "i915/gem.h"
>> +#include "i915/gem_create.h"
>>   
>>   #include <limits.h>
>>   
>> @@ -519,6 +521,36 @@ static bool query_regions_supported(int fd)
>>    * Should be source compatible either way though.
>>    */
>>   #define probed_cpu_visible_size rsvd1[0]
>> +#define unallocated_cpu_visible_size rsvd1[1]
>> +static bool query_regions_unallocated_supported(int fd)
>> +{
>> +	struct drm_i915_query_memory_regions *regions;
>> +	struct drm_i915_query_item item;
>> +	int i, ret = false;
>> +
>> +	memset(&item, 0, sizeof(item));
>> +	item.query_id = DRM_I915_QUERY_MEMORY_REGIONS;
>> +	i915_query_items(fd, &item, 1);
>> +	igt_assert(item.length > 0);
>> +
>> +	regions = calloc(1, item.length);
>> +
>> +	item.data_ptr = to_user_pointer(regions);
>> +	i915_query_items(fd, &item, 1);
>> +
>> +	for (i = 0; i < regions->num_regions; i++) {
>> +		struct drm_i915_memory_region_info info = regions->regions[i];
>> +
>> +		if (info.unallocated_cpu_visible_size) {
>> +			ret = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	free(regions);
>> +	return ret;
>> +}
>> +
>>   static void test_query_regions_garbage_items(int fd)
>>   {
>>   	struct drm_i915_query_memory_regions *regions;
>> @@ -559,8 +591,9 @@ static void test_query_regions_garbage_items(int fd)
>>   
>>   		/*
>>   		 * rsvd1[0] : probed_cpu_visible_size
>> +		 * rsvd1[1] : unallocated_cpu_visible_size
>>   		 */
>> -		for (j = 1; j < ARRAY_SIZE(info.rsvd1); j++)
>> +		for (j = 2; j < ARRAY_SIZE(info.rsvd1); j++)
>>   			igt_assert_eq_u32(info.rsvd1[j], 0);
>>   	}
>>   
>> @@ -573,6 +606,46 @@ static void test_query_regions_garbage_items(int fd)
>>   	free(regions);
>>   }
>>   
>> +struct object_handle {
>> +	uint32_t handle;
>> +	struct igt_list_head link;
>> +};
>> +
>> +static uint32_t batch_create_size(int fd, uint64_t size)
>> +{
>> +	const uint32_t bbe = MI_BATCH_BUFFER_END;
>> +	uint32_t handle;
>> +
>> +	handle = gem_create(fd, size);
>> +	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
>> +
>> +	return handle;
>> +}
>> +
>> +static void upload(int fd, struct igt_list_head *handles, uint32_t num_handles)
>> +{
>> +	struct drm_i915_gem_exec_object2 *exec;
>> +	struct drm_i915_gem_execbuffer2 execbuf = {};
>> +	struct object_handle *iter;
>> +	uint32_t i;
>> +
>> +	exec = calloc(num_handles + 1,
>> +		      sizeof(struct drm_i915_gem_exec_object2));
>> +
>> +	i = 0;
>> +	igt_list_for_each_entry(iter, handles, link)
>> +		exec[i++].handle = iter->handle;
>> +
>> +	exec[i].handle = batch_create_size(fd, 4096);
>> +
>> +	execbuf.buffers_ptr = to_user_pointer(exec);
>> +	execbuf.buffer_count = num_handles + 1;
>> +
>> +	gem_execbuf(fd, &execbuf);
>> +	gem_close(fd, exec[i].handle);
>> +	free(exec);
>> +}
>> +
>>   static void test_query_regions_sanity_check(int fd)
>>   {
>>   	struct drm_i915_query_memory_regions *regions;
>> @@ -605,8 +678,20 @@ static void test_query_regions_sanity_check(int fd)
>>   
>>   			igt_assert(info.probed_cpu_visible_size == 0 ||
>>   				   info.probed_cpu_visible_size == info.probed_size);
>> +			igt_assert(info.unallocated_size == info.probed_size);
>> +			igt_assert(info.unallocated_cpu_visible_size == 0 ||
>> +				   info.unallocated_cpu_visible_size ==
>> +				   info.unallocated_size);
>>   		} else {
>>   			igt_assert(info.probed_cpu_visible_size <= info.probed_size);
>> +			igt_assert(info.unallocated_size <= info.probed_size);
>> +			if (info.probed_cpu_visible_size < info.probed_size) {
>> +				igt_assert(info.unallocated_cpu_visible_size <
>> +					   info.unallocated_size);
>> +			} else {
>> +				igt_assert(info.unallocated_cpu_visible_size ==
>> +					   info.unallocated_size);
>> +			}
>>   		}
>>   
>>   		igt_assert(r1.memory_class == I915_MEMORY_CLASS_SYSTEM ||
>> @@ -623,6 +708,58 @@ static void test_query_regions_sanity_check(int fd)
>>   			igt_assert(!(r1.memory_class == r2.memory_class &&
>>   				     r1.memory_instance == r2.memory_instance));
>>   		}
>> +
>> +		{
>> +			struct igt_list_head handles;
>> +			struct object_handle oh = {};
>> +
>> +			IGT_INIT_LIST_HEAD(&handles);
>> +
>> +			oh.handle =
>> +				gem_create_with_cpu_access_in_memory_regions
>> +				(fd, 4096,
>> +				 INTEL_MEMORY_REGION_ID(r1.memory_class,
>> +							r1.memory_instance));
>> +			igt_list_add(&oh.link, &handles);
>> +			upload(fd, &handles, 1);
>> +
>> +			/*
>> +			 * System wide metrics should be censored if we
>> +			 * lack the correct permissions.
>> +			 */
>> +			igt_fork(child, 1) {
>> +				igt_drop_root();
>> +
>> +				memset(regions, 0, item.length);
>> +				i915_query_items(fd, &item, 1);
>> +				info = regions->regions[i];
>> +
>> +				igt_assert(info.unallocated_cpu_visible_size ==
>> +					   info.probed_cpu_visible_size);
>> +				igt_assert(info.unallocated_size ==
>> +					   info.probed_size);
>> +			}
>> +
>> +			igt_waitchildren();
>> +
>> +			memset(regions, 0, item.length);
>> +			i915_query_items(fd, &item, 1);
>> +			info = regions->regions[i];
>> +
>> +			if (r1.memory_class == I915_MEMORY_CLASS_DEVICE) {
>> +				igt_assert(info.unallocated_cpu_visible_size <
>> +					   info.probed_cpu_visible_size);
>> +				igt_assert(info.unallocated_size <
>> +					   info.probed_size);
>> +			} else {
>> +				igt_assert(info.unallocated_cpu_visible_size ==
>> +					   info.probed_cpu_visible_size);
>> +				igt_assert(info.unallocated_size ==
>> +					   info.probed_size);
>> +			}
>> +
>> +			gem_close(fd, oh.handle);
>> +		}
>>   	}
>>   
>>   	/* All devices should at least have system memory */
>> @@ -631,6 +768,134 @@ static void test_query_regions_sanity_check(int fd)
>>   	free(regions);
>>   }
>>   
>> +#define rounddown(x, y) (x - (x % y))
>> +#define SZ_64K (1ULL << 16)
>> +
>> +static void fill_unallocated(int fd, struct drm_i915_query_item *item, int idx,
>> +			     bool cpu_access)
>> +{
>> +	struct drm_i915_memory_region_info new_info, old_info;
>> +	struct drm_i915_query_memory_regions *regions;
>> +	struct drm_i915_gem_memory_class_instance ci;
>> +	struct object_handle *iter, *tmp;
>> +	struct igt_list_head handles;
>> +	uint32_t num_handles;
>> +	uint64_t rem, total;
>> +	int id;
>> +
>> +	srand(time(NULL));
>> +
>> +	IGT_INIT_LIST_HEAD(&handles);
>> +
>> +	regions = (struct drm_i915_query_memory_regions *)item->data_ptr;
> 
> from_user_pointer(item->data_ptr)

Oops. Thanks.

> 
> 
