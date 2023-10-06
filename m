Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 6 Oct 2023 13:38:29 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20231006113829.5s2or64g6jamddx6@zkempczy-mobl2>
References: <20231005153116.452319-1-matthew.auld@intel.com>
 <20231005153116.452319-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231005153116.452319-8-matthew.auld@intel.com>
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t 07/12] lib/allocator: add
 get_offset_pat_index() helper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 04:31:11PM +0100, Matthew Auld wrote:
> For some cases we are going to need to pass the pat_index for the
> vm_bind op. Add a helper for this, such that we can allocate an address
> and give the mapping some pat_index.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>  lib/intel_allocator.c             | 43 +++++++++++++++++++++++--------
>  lib/intel_allocator.h             |  5 +++-
>  lib/xe/xe_util.c                  |  1 +
>  lib/xe/xe_util.h                  |  1 +
>  tests/intel/api_intel_allocator.c |  4 ++-
>  5 files changed, 41 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index f0a9b7fb5..da357b833 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -16,6 +16,7 @@
>  #include "igt_map.h"
>  #include "intel_allocator.h"
>  #include "intel_allocator_msgchannel.h"
> +#include "intel_pat.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
>  
> @@ -92,6 +93,7 @@ struct allocator_object {
>  	uint32_t handle;
>  	uint64_t offset;
>  	uint64_t size;
> +	uint8_t pat_index;
>  
>  	enum allocator_bind_op bind_op;
>  };
> @@ -1122,14 +1124,14 @@ void intel_allocator_get_address_range(uint64_t allocator_handle,
>  
>  static bool is_same(struct allocator_object *obj,
>  		    uint32_t handle, uint64_t offset, uint64_t size,
> -		    enum allocator_bind_op bind_op)
> +		    uint8_t pat_index, enum allocator_bind_op bind_op)
>  {
>  	return obj->handle == handle &&	obj->offset == offset && obj->size == size &&
> -	       (obj->bind_op == bind_op || obj->bind_op == BOUND);
> +	       obj->pat_index == pat_index && (obj->bind_op == bind_op || obj->bind_op == BOUND);
>  }
>  
>  static void track_object(uint64_t allocator_handle, uint32_t handle,
> -			 uint64_t offset, uint64_t size,
> +			 uint64_t offset, uint64_t size, uint8_t pat_index,
>  			 enum allocator_bind_op bind_op)
>  {
>  	struct ahnd_info *ainfo;

Code looks good to me, only minor nitpick is to add pat index to
bind_debug() here. Be aware that pat_index don't go underneath
to the allocator itself, only to cache which tracks alloc()/free()
data returned from allocator necessary to bind/unbind. But I don't
think it will be a problem.

With above added:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew

> @@ -1156,6 +1158,9 @@ static void track_object(uint64_t allocator_handle, uint32_t handle,
>  	if (ainfo->driver == INTEL_DRIVER_I915)
>  		return; /* no-op for i915, at least for now */
>  
> +	if (pat_index == DEFAULT_PAT_INDEX)
> +		pat_index = intel_get_pat_idx_wb(ainfo->fd);
> +
>  	pthread_mutex_lock(&ainfo->bind_map_mutex);
>  	obj = igt_map_search(ainfo->bind_map, &handle);
>  	if (obj) {
> @@ -1165,7 +1170,7 @@ static void track_object(uint64_t allocator_handle, uint32_t handle,
>  		 * bind_map.
>  		 */
>  		if (bind_op == TO_BIND) {
> -			igt_assert_eq(is_same(obj, handle, offset, size, bind_op), true);
> +			igt_assert_eq(is_same(obj, handle, offset, size, pat_index, bind_op), true);
>  		} else if (bind_op == TO_UNBIND) {
>  			if (obj->bind_op == TO_BIND)
>  				igt_map_remove(ainfo->bind_map, &obj->handle, map_entry_free_func);
> @@ -1181,6 +1186,7 @@ static void track_object(uint64_t allocator_handle, uint32_t handle,
>  		obj->handle = handle;
>  		obj->offset = offset;
>  		obj->size = size;
> +		obj->pat_index = pat_index;
>  		obj->bind_op = bind_op;
>  		igt_map_insert(ainfo->bind_map, &obj->handle, obj);
>  	}
> @@ -1204,7 +1210,7 @@ out:
>   */
>  uint64_t __intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
>  				 uint64_t size, uint64_t alignment,
> -				 enum allocator_strategy strategy)
> +				 uint8_t pat_index, enum allocator_strategy strategy)
>  {
>  	struct alloc_req req = { .request_type = REQ_ALLOC,
>  				 .allocator_handle = allocator_handle,
> @@ -1219,7 +1225,8 @@ uint64_t __intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
>  	igt_assert(handle_request(&req, &resp) == 0);
>  	igt_assert(resp.response_type == RESP_ALLOC);
>  
> -	track_object(allocator_handle, handle, resp.alloc.offset, size, TO_BIND);
> +	track_object(allocator_handle, handle, resp.alloc.offset, size, pat_index,
> +		     TO_BIND);
>  
>  	return resp.alloc.offset;
>  }
> @@ -1241,7 +1248,7 @@ uint64_t intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
>  	uint64_t offset;
>  
>  	offset = __intel_allocator_alloc(allocator_handle, handle,
> -					 size, alignment,
> +					 size, alignment, DEFAULT_PAT_INDEX,
>  					 ALLOC_STRATEGY_NONE);
>  	igt_assert(offset != ALLOC_INVALID_ADDRESS);
>  
> @@ -1268,7 +1275,8 @@ uint64_t intel_allocator_alloc_with_strategy(uint64_t allocator_handle,
>  	uint64_t offset;
>  
>  	offset = __intel_allocator_alloc(allocator_handle, handle,
> -					 size, alignment, strategy);
> +					 size, alignment, DEFAULT_PAT_INDEX,
> +					 strategy);
>  	igt_assert(offset != ALLOC_INVALID_ADDRESS);
>  
>  	return offset;
> @@ -1298,7 +1306,7 @@ bool intel_allocator_free(uint64_t allocator_handle, uint32_t handle)
>  	igt_assert(handle_request(&req, &resp) == 0);
>  	igt_assert(resp.response_type == RESP_FREE);
>  
> -	track_object(allocator_handle, handle, 0, 0, TO_UNBIND);
> +	track_object(allocator_handle, handle, 0, 0, 0, TO_UNBIND);
>  
>  	return resp.free.freed;
>  }
> @@ -1500,16 +1508,17 @@ static void __xe_op_bind(struct ahnd_info *ainfo, uint32_t sync_in, uint32_t syn
>  		if (obj->bind_op == BOUND)
>  			continue;
>  
> -		bind_info("= [vm: %u] %s => %u %lx %lx\n",
> +		bind_info("= [vm: %u] %s => %u %lx %lx %u\n",
>  			  ainfo->vm,
>  			  obj->bind_op == TO_BIND ? "TO BIND" : "TO UNBIND",
>  			  obj->handle, obj->offset,
> -			  obj->size);
> +			  obj->size, obj->pat_index);
>  
>  		entry = malloc(sizeof(*entry));
>  		entry->handle = obj->handle;
>  		entry->offset = obj->offset;
>  		entry->size = obj->size;
> +		entry->pat_index = obj->pat_index;
>  		entry->bind_op = obj->bind_op == TO_BIND ? XE_OBJECT_BIND :
>  							   XE_OBJECT_UNBIND;
>  		igt_list_add(&entry->link, &obj_list);
> @@ -1534,6 +1543,18 @@ static void __xe_op_bind(struct ahnd_info *ainfo, uint32_t sync_in, uint32_t syn
>  	}
>  }
>  
> +uint64_t get_offset_pat_index(uint64_t ahnd, uint32_t handle, uint64_t size,
> +			      uint64_t alignment, uint8_t pat_index)
> +{
> +	uint64_t offset;
> +
> +	offset = __intel_allocator_alloc(ahnd, handle, size, alignment,
> +					 pat_index, ALLOC_STRATEGY_NONE);
> +	igt_assert(offset != ALLOC_INVALID_ADDRESS);
> +
> +	return offset;
> +}
> +
>  /**
>   * intel_allocator_bind:
>   * @allocator_handle: handle to an allocator
> diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
> index f9ff7f1cc..5da8af7f9 100644
> --- a/lib/intel_allocator.h
> +++ b/lib/intel_allocator.h
> @@ -186,7 +186,7 @@ bool intel_allocator_close(uint64_t allocator_handle);
>  void intel_allocator_get_address_range(uint64_t allocator_handle,
>  				       uint64_t *startp, uint64_t *endp);
>  uint64_t __intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
> -				 uint64_t size, uint64_t alignment,
> +				 uint64_t size, uint64_t alignment, uint8_t pat_index,
>  				 enum allocator_strategy strategy);
>  uint64_t intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
>  			       uint64_t size, uint64_t alignment);
> @@ -266,6 +266,9 @@ static inline bool put_ahnd(uint64_t ahnd)
>  	return !ahnd || intel_allocator_close(ahnd);
>  }
>  
> +uint64_t get_offset_pat_index(uint64_t ahnd, uint32_t handle, uint64_t size,
> +			      uint64_t alignment, uint8_t pat_index);
> +
>  static inline uint64_t get_offset(uint64_t ahnd, uint32_t handle,
>  				  uint64_t size, uint64_t alignment)
>  {
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 2f9ffe2f1..8583326a9 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -145,6 +145,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct igt_list_head *obj_lis
>  		ops->addr = obj->offset;
>  		ops->range = obj->size;
>  		ops->region = 0;
> +		ops->pat_index = obj->pat_index;
>  
>  		bind_info("  [%d]: [%6s] handle: %u, offset: %llx, size: %llx\n",
>  			  i, obj->bind_op == XE_OBJECT_BIND ? "BIND" : "UNBIND",
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index e97d236b8..e3bdf3d11 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -36,6 +36,7 @@ struct xe_object {
>  	uint32_t handle;
>  	uint64_t offset;
>  	uint64_t size;
> +	uint8_t pat_index;
>  	enum xe_bind_op bind_op;
>  	struct igt_list_head link;
>  };
> diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
> index f3fcf8a34..d19be3ce9 100644
> --- a/tests/intel/api_intel_allocator.c
> +++ b/tests/intel/api_intel_allocator.c
> @@ -9,6 +9,7 @@
>  #include "igt.h"
>  #include "igt_aux.h"
>  #include "intel_allocator.h"
> +#include "intel_pat.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> @@ -131,7 +132,8 @@ static void alloc_simple(int fd)
>  
>  	intel_allocator_get_address_range(ahnd, &start, &end);
>  	offset0 = intel_allocator_alloc(ahnd, 1, end - start, 0);
> -	offset1 = __intel_allocator_alloc(ahnd, 2, 4096, 0, ALLOC_STRATEGY_NONE);
> +	offset1 = __intel_allocator_alloc(ahnd, 2, 4096, 0, DEFAULT_PAT_INDEX,
> +					  ALLOC_STRATEGY_NONE);
>  	igt_assert(offset1 == ALLOC_INVALID_ADDRESS);
>  	intel_allocator_free(ahnd, 1);
>  
> -- 
> 2.41.0
> 
