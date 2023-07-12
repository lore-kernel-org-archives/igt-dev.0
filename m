Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A8710E4D0
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 10:40:12 +0000 (UTC)
Message-ID: <437559c5-8676-2430-220a-bfa8b2575959@intel.com>
Date: Wed, 12 Jul 2023 12:39:42 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
 <20230711112009.122482-11-zbigniew.kempczynski@intel.com>
 <01576293-301d-c3c7-29f1-2f23a04fe2ae@intel.com>
 <20230712093357.atvsv7m4chl6iebn@zkempczy-mobl2>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230712093357.atvsv7m4chl6iebn@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 10/17] lib/intel_allocator: Add
 intel_allocator_bind()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 12.07.2023 11:33, Zbigniew Kempczyński wrote:
> On Wed, Jul 12, 2023 at 11:13:24AM +0200, Karolina Stolarek wrote:
>> On 11.07.2023 13:20, Zbigniew Kempczyński wrote:
>>> Synchronize allocator state to vm.
>>>
>>> This change allows xe user to execute vm-bind/unbind for allocator
>>> alloc()/free() operations which occurred since last binding/unbinding.
>>> Before doing exec user should call intel_allocator_bind() to ensure
>>> all vma's are in place.
>>>
>>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> ---
>>> v2: Rewrite tracking mechanism: previous code uses bind map embedded
>>>       in allocator structure. Unfortunately this wasn't good idea
>>>       - for xe binding everything was fine, but it regress multiprocess/
>>>       multithreaded allocations. Main reason of this was children
>>>       processes couldn't get its reference as this memory was allocated
>>>       on allocator thread (separate process). Currently each child
>>>       contains its own separate tracking maps for ahnd and for each
>>>       ahnd bind map.
>>> v3: - Don't use priv field (we may clean bind_map apriori as failing
>>>         asserts and outdated bind_map is not a problem anymore).
>>>       - Use only vm on tracking ahnd (Karolina)
>>>       - Add braces to avoid checkpatch complaining (Karolina)
>>>       - Use igt_assert_f() instead conditional block (Karolina)
>>> ---
>>>    lib/igt_core.c        |   5 +
>>>    lib/intel_allocator.c | 259 +++++++++++++++++++++++++++++++++++++++++-
>>>    lib/intel_allocator.h |   3 +
>>>    3 files changed, 265 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/lib/igt_core.c b/lib/igt_core.c
>>> index 2ae2cb6883..041e4b3288 100644
>>> --- a/lib/igt_core.c
>>> +++ b/lib/igt_core.c
>>> @@ -74,6 +74,7 @@
>>>    #include "igt_sysrq.h"
>>>    #include "igt_rc.h"
>>>    #include "igt_list.h"
>>> +#include "igt_map.h"
>>>    #include "igt_device_scan.h"
>>>    #include "igt_thread.h"
>>>    #include "runnercomms.h"
>>> @@ -320,6 +321,8 @@ bool test_multi_fork_child;
>>>    /* For allocator purposes */
>>>    pid_t child_pid  = -1;
>>>    __thread pid_t child_tid  = -1;
>>> +struct igt_map *ahnd_map;
>>> +pthread_mutex_t ahnd_map_mutex;
>>>    enum {
>>>    	/*
>>> @@ -2523,6 +2526,8 @@ bool __igt_fork(void)
>>>    	case 0:
>>>    		test_child = true;
>>>    		pthread_mutex_init(&print_mutex, NULL);
>>> +		pthread_mutex_init(&ahnd_map_mutex, NULL);
>>> +		ahnd_map = igt_map_create(igt_map_hash_64, igt_map_equal_64);
>>>    		child_pid = getpid();
>>>    		child_tid = -1;
>>>    		exit_handler_count = 0;
>>> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
>>> index cf964ccc41..f0a9b7fb53 100644
>>> --- a/lib/intel_allocator.c
>>> +++ b/lib/intel_allocator.c
>>> @@ -17,8 +17,8 @@
>>>    #include "intel_allocator.h"
>>>    #include "intel_allocator_msgchannel.h"
>>>    #include "xe/xe_query.h"
>>> +#include "xe/xe_util.h"
>>> -//#define ALLOCDBG
>>>    #ifdef ALLOCDBG
>>>    #define alloc_info igt_info
>>>    #define alloc_debug igt_debug
>>> @@ -45,6 +45,14 @@ static inline const char *reqstr(enum reqtype request_type)
>>>    #define alloc_debug(...) {}
>>>    #endif
>>> +#ifdef ALLOCBINDDBG
>>> +#define bind_info igt_info
>>> +#define bind_debug igt_debug
>>> +#else
>>> +#define bind_info(...) {}
>>> +#define bind_debug(...) {}
>>> +#endif
>>> +
>>>    /*
>>>     * We limit allocator space to avoid hang when batch would be
>>>     * pinned in the last page.
>>> @@ -64,6 +72,30 @@ struct handle_entry {
>>>    	struct allocator *al;
>>>    };
>>> +/* For tracking alloc()/free() for Xe */
>>> +struct ahnd_info {
>>> +	int fd;
>>> +	uint64_t ahnd;
>>> +	uint32_t vm;
>>> +	enum intel_driver driver;
>>> +	struct igt_map *bind_map;
>>> +	pthread_mutex_t bind_map_mutex;
>>> +};
>>> +
>>> +enum allocator_bind_op {
>>> +	BOUND,
>>> +	TO_BIND,
>>> +	TO_UNBIND,
>>> +};
>>> +
>>> +struct allocator_object {
>>> +	uint32_t handle;
>>> +	uint64_t offset;
>>> +	uint64_t size;
>>> +
>>> +	enum allocator_bind_op bind_op;
>>> +};
>>> +
>>>    struct intel_allocator *
>>>    intel_allocator_reloc_create(int fd, uint64_t start, uint64_t end);
>>>    struct intel_allocator *
>>> @@ -122,6 +154,13 @@ static pid_t allocator_pid = -1;
>>>    extern pid_t child_pid;
>>>    extern __thread pid_t child_tid;
>>> +/*
>>> + * Track alloc()/free() requires storing in local process which has
>>> + * an access to real drm fd it can work on.
>>> + */
>>> +extern struct igt_map *ahnd_map;
>>> +extern pthread_mutex_t ahnd_map_mutex;
>>> +
>>>    /*
>>>     * - for parent process we have child_pid == -1
>>>     * - for child which calls intel_allocator_init() allocator_pid == child_pid
>>> @@ -837,6 +876,45 @@ void intel_allocator_multiprocess_stop(void)
>>>    	}
>>>    }
>>> +static void track_ahnd(int fd, uint64_t ahnd, uint32_t vm)
>>> +{
>>> +	struct ahnd_info *ainfo;
>>> +
>>> +	pthread_mutex_lock(&ahnd_map_mutex);
>>> +	ainfo = igt_map_search(ahnd_map, &ahnd);
>>> +	if (!ainfo) {
>>> +		ainfo = malloc(sizeof(*ainfo));
>>> +		ainfo->fd = fd;
>>> +		ainfo->ahnd = ahnd;
>>> +		ainfo->vm = vm;
>>> +		ainfo->driver = get_intel_driver(fd);
>>> +		ainfo->bind_map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
>>> +		pthread_mutex_init(&ainfo->bind_map_mutex, NULL);
>>> +		bind_debug("[TRACK AHND] pid: %d, tid: %d, create <fd: %d, "
>>> +			   "ahnd: %llx, vm: %u, driver: %d, ahnd_map: %p, bind_map: %p>\n",
>>> +			   getpid(), gettid(), ainfo->fd,
>>> +			   (long long)ainfo->ahnd, ainfo->vm,
>>> +			   ainfo->driver, ahnd_map, ainfo->bind_map);
>>> +		igt_map_insert(ahnd_map, &ainfo->ahnd, ainfo);
>>> +	}
>>> +
>>> +	pthread_mutex_unlock(&ahnd_map_mutex);
>>> +}
>>> +
>>> +static void untrack_ahnd(uint64_t ahnd)
>>> +{
>>> +	struct ahnd_info *ainfo;
>>> +
>>> +	pthread_mutex_lock(&ahnd_map_mutex);
>>> +	ainfo = igt_map_search(ahnd_map, &ahnd);
>>> +	if (ainfo) {
>>> +		bind_debug("[UNTRACK AHND]: pid: %d, tid: %d, removing ahnd: %llx\n",
>>> +			   getpid(), gettid(), (long long)ahnd);
>>> +		igt_map_remove(ahnd_map, &ahnd, map_entry_free_func);
>>> +	}
>>> +	pthread_mutex_unlock(&ahnd_map_mutex);
>>> +}
>>> +
>>>    static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
>>>    					    uint32_t vm,
>>>    					    uint64_t start, uint64_t end,
>>> @@ -895,6 +973,12 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
>>>    	igt_assert(resp.open.allocator_handle);
>>>    	igt_assert(resp.response_type == RESP_OPEN);
>>> +	/*
>>> +	 * Igts mostly uses ctx as id when opening the allocator (i915 legacy).
>>> +	 * If ctx is passed let's use it as an vm id, otherwise use vm.
>>> +	 */
>>> +	track_ahnd(fd, resp.open.allocator_handle, ctx ?: vm);
>>> +
>>>    	return resp.open.allocator_handle;
>>>    }
>>> @@ -1001,6 +1085,8 @@ bool intel_allocator_close(uint64_t allocator_handle)
>>>    	igt_assert(handle_request(&req, &resp) == 0);
>>>    	igt_assert(resp.response_type == RESP_CLOSE);
>>> +	untrack_ahnd(allocator_handle);
>>> +
>>>    	return resp.close.is_empty;
>>>    }
>>> @@ -1034,6 +1120,74 @@ void intel_allocator_get_address_range(uint64_t allocator_handle,
>>>    		*endp = resp.address_range.end;
>>>    }
>>> +static bool is_same(struct allocator_object *obj,
>>> +		    uint32_t handle, uint64_t offset, uint64_t size,
>>> +		    enum allocator_bind_op bind_op)
>>> +{
>>> +	return obj->handle == handle &&	obj->offset == offset && obj->size == size &&
>>> +	       (obj->bind_op == bind_op || obj->bind_op == BOUND);
>>> +}
>>> +
>>> +static void track_object(uint64_t allocator_handle, uint32_t handle,
>>> +			 uint64_t offset, uint64_t size,
>>> +			 enum allocator_bind_op bind_op)
>>> +{
>>> +	struct ahnd_info *ainfo;
>>> +	struct allocator_object *obj;
>>> +
>>> +	bind_debug("[TRACK OBJECT]: [%s] pid: %d, tid: %d, ahnd: %llx, handle: %u, offset: %llx, size: %llx\n",
>>> +		   bind_op == TO_BIND ? "BIND" : "UNBIND",
>>> +		   getpid(), gettid(),
>>> +		   (long long)allocator_handle,
>>> +		   handle, (long long)offset, (long long)size);
>>> +
>>> +	if (offset == ALLOC_INVALID_ADDRESS) {
>>> +		bind_debug("[TRACK OBJECT] => invalid address %llx, skipping tracking\n",
>>> +			   (long long)offset);
>>> +		return;
>>> +	}
>>> +
>>> +	pthread_mutex_lock(&ahnd_map_mutex);
>>> +	ainfo = igt_map_search(ahnd_map, &allocator_handle);
>>> +	pthread_mutex_unlock(&ahnd_map_mutex);
>>> +	igt_assert_f(ainfo, "[TRACK OBJECT] => MISSING ahnd %llx <=\n",
>>> +		     (long long)allocator_handle);
>>> +
>>> +	if (ainfo->driver == INTEL_DRIVER_I915)
>>> +		return; /* no-op for i915, at least for now */
>>> +
>>> +	pthread_mutex_lock(&ainfo->bind_map_mutex);
>>> +	obj = igt_map_search(ainfo->bind_map, &handle);
>>> +	if (obj) {
>>> +		/*
>>> +		 * User may call alloc() couple of times, check object is the
>>> +		 * same. For free() there's simple case, just remove from
>>> +		 * bind_map.
>>> +		 */
>>> +		if (bind_op == TO_BIND) {
>>> +			igt_assert_eq(is_same(obj, handle, offset, size, bind_op), true);
>>> +		} else if (bind_op == TO_UNBIND) {
>>> +			if (obj->bind_op == TO_BIND)
>>> +				igt_map_remove(ainfo->bind_map, &obj->handle, map_entry_free_func);
>>> +			else if (obj->bind_op == BOUND)
>>> +				obj->bind_op = bind_op;
>>> +		}
>>> +	} else {
>>> +		/* Ignore to unbind bo which wasn't previously inserted */
>>> +		if (bind_op == TO_UNBIND)
>>> +			goto out;
>>> +
>>> +		obj = calloc(1, sizeof(*obj));
>>> +		obj->handle = handle;
>>> +		obj->offset = offset;
>>> +		obj->size = size;
>>> +		obj->bind_op = bind_op;
>>> +		igt_map_insert(ainfo->bind_map, &obj->handle, obj);
>>> +	}
>>> +out:
>>> +	pthread_mutex_unlock(&ainfo->bind_map_mutex);
>>> +}
>>> +
>>>    /**
>>>     * __intel_allocator_alloc:
>>>     * @allocator_handle: handle to an allocator
>>> @@ -1065,6 +1219,8 @@ uint64_t __intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
>>>    	igt_assert(handle_request(&req, &resp) == 0);
>>>    	igt_assert(resp.response_type == RESP_ALLOC);
>>> +	track_object(allocator_handle, handle, resp.alloc.offset, size, TO_BIND);
>>> +
>>>    	return resp.alloc.offset;
>>>    }
>>> @@ -1142,6 +1298,8 @@ bool intel_allocator_free(uint64_t allocator_handle, uint32_t handle)
>>>    	igt_assert(handle_request(&req, &resp) == 0);
>>>    	igt_assert(resp.response_type == RESP_FREE);
>>> +	track_object(allocator_handle, handle, 0, 0, TO_UNBIND);
>>> +
>>>    	return resp.free.freed;
>>>    }
>>> @@ -1326,6 +1484,84 @@ void intel_allocator_print(uint64_t allocator_handle)
>>>    	}
>>>    }
>>> +static void __xe_op_bind(struct ahnd_info *ainfo, uint32_t sync_in, uint32_t sync_out)
>>> +{
>>> +	struct allocator_object *obj;
>>> +	struct igt_map_entry *pos;
>>> +	struct igt_list_head obj_list;
>>> +	struct xe_object *entry, *tmp;
>>> +
>>> +	IGT_INIT_LIST_HEAD(&obj_list);
>>> +
>>> +	pthread_mutex_lock(&ainfo->bind_map_mutex);
>>> +	igt_map_foreach(ainfo->bind_map, pos) {
>>> +		obj = pos->data;
>>> +
>>> +		if (obj->bind_op == BOUND)
>>> +			continue;
>>> +
>>> +		bind_info("= [vm: %u] %s => %u %lx %lx\n",
>>> +			  ainfo->vm,
>>> +			  obj->bind_op == TO_BIND ? "TO BIND" : "TO UNBIND",
>>> +			  obj->handle, obj->offset,
>>> +			  obj->size);
>>> +
>>> +		entry = malloc(sizeof(*entry));
>>> +		entry->handle = obj->handle;
>>> +		entry->offset = obj->offset;
>>> +		entry->size = obj->size;
>>> +		entry->bind_op = obj->bind_op == TO_BIND ? XE_OBJECT_BIND :
>>> +							   XE_OBJECT_UNBIND;
>>> +		igt_list_add(&entry->link, &obj_list);
>>> +
>>> +		/*
>>> +		 * We clean bind_map even before calling bind/unbind
>>> +		 * as all binding operations asserts in case of error.
>>> +		 */
>>> +		if (obj->bind_op == TO_BIND)
>>> +			obj->bind_op = BOUND;
>>> +		else
>>> +			igt_map_remove(ainfo->bind_map, &obj->handle,
>>> +				       map_entry_free_func);
>>
>> I don't quite understand why we can clean up the map even before the actual
>> bind/unbind happens. If an assert fails, it means that vm_(un)bind failed,
>> so the actual operation didn't succeed, and that state change is incorrect.
>> I believe that there's a reason we can do it this way, I just don't
>> understand it.
> 
> I allocate separate list of xe_objects which is an argument to
> xe_bind_unbind_async(). As list is detached (separate) from the bind_map
> I may apriori do cleanup in the map. If bind/unbind is unsuccessful
> outdated bind_map is the smallest problem here.

I'm aware they are separate entities, I just wonder what is the benefit 
of doing it here. Are there any dangers of removing that binding before 
it's actually unbound?

All the best,
Karolina

> On assert path igt_fail()
> calls intel_allocator_init() which just frees contents on ahnd_map[]->bind_map.
> In children there's simpler because they just dies. Real problem is we
> still have dangling vm (no xe_vm_destroy()).
> So I decided to update the bind_map before calling bind/unbind as on failure
> doesn't matter what it will contain.
> 
> --
> Zbigniew
> 
>>
>> Apart from that one thing, the patch looks good to me.
>>
>> All the best,
>> Karolina
>>
>>> +	}
>>> +	pthread_mutex_unlock(&ainfo->bind_map_mutex);
>>> +
>>> +	xe_bind_unbind_async(ainfo->fd, ainfo->vm, 0, &obj_list, sync_in, sync_out);
>>> +
>>> +	igt_list_for_each_entry_safe(entry, tmp, &obj_list, link) {
>>> +		igt_list_del(&entry->link);
>>> +		free(entry);
>>> +	}
>>> +}
>>> +
>>> +/**
>>> + * intel_allocator_bind:
>>> + * @allocator_handle: handle to an allocator
>>> + * @sync_in: syncobj (fence-in)
>>> + * @sync_out: syncobj (fence-out)
>>> + *
>>> + * Function binds and unbinds all objects added to the allocator which weren't
>>> + * previously binded/unbinded.
>>> + *
>>> + **/
>>> +void intel_allocator_bind(uint64_t allocator_handle,
>>> +			  uint32_t sync_in, uint32_t sync_out)
>>> +{
>>> +	struct ahnd_info *ainfo;
>>> +
>>> +	pthread_mutex_lock(&ahnd_map_mutex);
>>> +	ainfo = igt_map_search(ahnd_map, &allocator_handle);
>>> +	pthread_mutex_unlock(&ahnd_map_mutex);
>>> +	igt_assert(ainfo);
>>> +
>>> +	/*
>>> +	 * We collect bind/unbind operations on alloc()/free() to do group
>>> +	 * operation getting @sync_in as syncobj handle (fence-in). If user
>>> +	 * passes 0 as @sync_out we bind/unbind synchronously.
>>> +	 */
>>> +	__xe_op_bind(ainfo, sync_in, sync_out);
>>> +}
>>> +
>>>    static int equal_handles(const void *key1, const void *key2)
>>>    {
>>>    	const struct handle_entry *h1 = key1, *h2 = key2;
>>> @@ -1383,6 +1619,22 @@ static void __free_maps(struct igt_map *map, bool close_allocators)
>>>    	igt_map_destroy(map, map_entry_free_func);
>>>    }
>>> +static void __free_ahnd_map(void)
>>> +{
>>> +	struct igt_map_entry *pos;
>>> +	struct ahnd_info *ainfo;
>>> +
>>> +	if (!ahnd_map)
>>> +		return;
>>> +
>>> +	igt_map_foreach(ahnd_map, pos) {
>>> +		ainfo = pos->data;
>>> +		igt_map_destroy(ainfo->bind_map, map_entry_free_func);
>>> +	}
>>> +
>>> +	igt_map_destroy(ahnd_map, map_entry_free_func);
>>> +}
>>> +
>>>    /**
>>>     * intel_allocator_init:
>>>     *
>>> @@ -1400,12 +1652,15 @@ void intel_allocator_init(void)
>>>    	__free_maps(handles, true);
>>>    	__free_maps(ctx_map, false);
>>>    	__free_maps(vm_map, false);
>>> +	__free_ahnd_map();
>>>    	atomic_init(&next_handle, 1);
>>>    	handles = igt_map_create(hash_handles, equal_handles);
>>>    	ctx_map = igt_map_create(hash_instance, equal_ctx);
>>>    	vm_map = igt_map_create(hash_instance, equal_vm);
>>> -	igt_assert(handles && ctx_map && vm_map);
>>> +	pthread_mutex_init(&ahnd_map_mutex, NULL);
>>> +	ahnd_map = igt_map_create(igt_map_hash_64, igt_map_equal_64);
>>> +	igt_assert(handles && ctx_map && vm_map && ahnd_map);
>>>    	channel = intel_allocator_get_msgchannel(CHANNEL_SYSVIPC_MSGQUEUE);
>>>    }
>>> diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
>>> index 3ec74f6191..f9ff7f1cc9 100644
>>> --- a/lib/intel_allocator.h
>>> +++ b/lib/intel_allocator.h
>>> @@ -210,6 +210,9 @@ bool intel_allocator_reserve_if_not_allocated(uint64_t allocator_handle,
>>>    void intel_allocator_print(uint64_t allocator_handle);
>>> +void intel_allocator_bind(uint64_t allocator_handle,
>>> +			  uint32_t sync_in, uint32_t sync_out);
>>> +
>>>    #define ALLOC_INVALID_ADDRESS (-1ull)
>>>    #define INTEL_ALLOCATOR_NONE   0
>>>    #define INTEL_ALLOCATOR_RELOC  1
