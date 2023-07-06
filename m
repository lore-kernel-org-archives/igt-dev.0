Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FF210E443
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 16:11:00 +0000 (UTC)
Date: Thu, 6 Jul 2023 18:09:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230706160909.ox2nwwywp66iaick@zkempczy-mobl2>
References: <20230706060555.282757-1-zbigniew.kempczynski@intel.com>
 <20230706060555.282757-11-zbigniew.kempczynski@intel.com>
 <c0c5ddec-bf72-a424-100f-5c091c9fd62a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0c5ddec-bf72-a424-100f-5c091c9fd62a@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 10/16] lib/intel_allocator: Add
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

On Thu, Jul 06, 2023 at 03:02:29PM +0200, Karolina Stolarek wrote:
> On 6.07.2023 08:05, Zbigniew Kempczyński wrote:
> > Synchronize allocator state to vm.
> > 
> > This change allows xe user to execute vm-bind/unbind for allocator
> > alloc()/free() operations which occurred since last binding/unbinding.
> > Before doing exec user should call intel_allocator_bind() to ensure
> > all vma's are in place.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> > v2: Rewrite tracking mechanism: previous code uses bind map embedded
> >      in allocator structure. Unfortunately this wasn't good idea
> >      - for xe binding everything was fine, but it regress multiprocess/
> >      multithreaded allocations. Main reason of this was children
> >      processes couldn't get its reference as this memory was allocated
> >      on allocator thread (separate process). Currently each child
> >      contains its own separate tracking maps for ahnd and for each
> >      ahnd bind map.
> > ---
> >   lib/igt_core.c        |   5 +
> >   lib/intel_allocator.c | 259 +++++++++++++++++++++++++++++++++++++++++-
> >   lib/intel_allocator.h |   6 +-
> >   3 files changed, 265 insertions(+), 5 deletions(-)
> > 
> > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > index 3ee3a01c36..6286e97b1b 100644
> > --- a/lib/igt_core.c
> > +++ b/lib/igt_core.c
> > @@ -74,6 +74,7 @@
> >   #include "igt_sysrq.h"
> >   #include "igt_rc.h"
> >   #include "igt_list.h"
> > +#include "igt_map.h"
> >   #include "igt_device_scan.h"
> >   #include "igt_thread.h"
> >   #include "runnercomms.h"
> > @@ -319,6 +320,8 @@ bool test_multi_fork_child;
> >   /* For allocator purposes */
> >   pid_t child_pid  = -1;
> >   __thread pid_t child_tid  = -1;
> > +struct igt_map *ahnd_map;
> > +pthread_mutex_t ahnd_map_mutex;
> >   enum {
> >   	/*
> > @@ -2509,6 +2512,8 @@ bool __igt_fork(void)
> >   	case 0:
> >   		test_child = true;
> >   		pthread_mutex_init(&print_mutex, NULL);
> > +		pthread_mutex_init(&ahnd_map_mutex, NULL);
> > +		ahnd_map = igt_map_create(igt_map_hash_64, igt_map_equal_64);
> >   		child_pid = getpid();
> >   		child_tid = -1;
> >   		exit_handler_count = 0;
> > diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> > index 228b33b92f..02d3404abc 100644
> > --- a/lib/intel_allocator.c
> > +++ b/lib/intel_allocator.c
> > @@ -17,6 +17,7 @@
> >   #include "intel_allocator.h"
> >   #include "intel_allocator_msgchannel.h"
> >   #include "xe/xe_query.h"
> > +#include "xe/xe_util.h"
> >   //#define ALLOCDBG
> 
> I know it has been here before, but do we want to keep that symbol as a
> comment?
> 

Ok, I'm touching line above so I'll get rid of this one.

> >   #ifdef ALLOCDBG
> > @@ -46,6 +47,14 @@ static inline const char *reqstr(enum reqtype request_type)
> >   #define alloc_debug(...) {}
> >   #endif
> > +#ifdef ALLOCBINDDBG
> > +#define bind_info igt_info
> > +#define bind_debug igt_debug
> > +#else
> > +#define bind_info(...) {}
> > +#define bind_debug(...) {}
> > +#endif
> > +
> >   /*
> >    * We limit allocator space to avoid hang when batch would be
> >    * pinned in the last page.
> > @@ -65,6 +74,31 @@ struct handle_entry {
> >   	struct allocator *al;
> >   };
> > +/* For tracking alloc()/free() for Xe */
> 
> Hmm, but it looks like we track it for both drivers, so that comment is
> slightly confusing. I understand that we build the struct, but don't
> actually use it with i915. The question is if we want to have it around with
> i915.
> 

At the moment we enter track_object() function but immediately we find
ahnd info from the ahnd_map and driver is i915 we return. So alloc() /
free() are not tracked. I decided to track ahnd because access to map
and checking out driver field is faster than is_(xe|i915)_device().
So comment above is correct imo.

> > +struct ahnd_info {
> > +	int fd;
> > +	uint64_t ahnd;
> > +	uint32_t ctx;
> 
> I'm just thinking, given your 11/16 patch where you update intel_ctx_t
> struct, could we store it here instead of just an id? Would it be useful to
> have access to intel_ctx_cfg_t, if one was defined?

I don't want to depend on intel_ctx in intel_allocator. But you're right,
ctx and vm here are confusing. I'm going to leave only 'vm' field, this
will enforce distinction between those two drivers. Expect change in v3.

> 
> > +	uint32_t vm;
> > +	enum intel_driver driver;
> > +	struct igt_map *bind_map;
> > +	pthread_mutex_t bind_map_mutex;
> > +};
> > +
> > +enum allocator_bind_op {
> > +	BOUND,
> > +	TO_BIND,
> > +	TO_UNBIND,
> > +};
> > +
> > +struct allocator_object {
> > +	uint32_t handle;
> > +	uint64_t offset;
> > +	uint64_t size;
> > +
> > +	enum allocator_bind_op bind_op;
> > +};
> > +
> >   struct intel_allocator *
> >   intel_allocator_reloc_create(int fd, uint64_t start, uint64_t end);
> >   struct intel_allocator *
> > @@ -123,6 +157,13 @@ static pid_t allocator_pid = -1;
> >   extern pid_t child_pid;
> >   extern __thread pid_t child_tid;
> > +/*
> > + * Track alloc()/free() requires storing in local process which has
> > + * an access to real drm fd it can work on.
> > + */
> > +extern struct igt_map *ahnd_map;
> > +extern pthread_mutex_t ahnd_map_mutex;
> > +
> >   /*
> >    * - for parent process we have child_pid == -1
> >    * - for child which calls intel_allocator_init() allocator_pid == child_pid
> > @@ -318,7 +359,6 @@ static struct intel_allocator *intel_allocator_create(int fd,
> >   	igt_assert(ial);
> > -	ial->driver = get_intel_driver(fd);
> 
> Please remember to drop that patch so we don't have such diff in v3.

Yes, I've dropped it already.

> 
> >   	ial->type = allocator_type;
> >   	ial->strategy = allocator_strategy;
> >   	ial->default_alignment = default_alignment;
> > @@ -893,6 +933,46 @@ void intel_allocator_multiprocess_stop(void)
> >   	}
> >   }
> > +static void track_ahnd(int fd, uint64_t ahnd, uint32_t ctx, uint32_t vm)
> > +{
> > +	struct ahnd_info *ainfo;
> > +
> > +	pthread_mutex_lock(&ahnd_map_mutex);
> > +	ainfo = igt_map_search(ahnd_map, &ahnd);
> > +	if (!ainfo) {
> > +		ainfo = malloc(sizeof(*ainfo));
> > +		ainfo->fd = fd;
> > +		ainfo->ahnd = ahnd;
> > +		ainfo->ctx = ctx;
> > +		ainfo->vm = vm;
> > +		ainfo->driver = get_intel_driver(fd);
> > +		ainfo->bind_map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> > +		pthread_mutex_init(&ainfo->bind_map_mutex, NULL);
> > +		bind_debug("[TRACK AHND] pid: %d, tid: %d, create <fd: %d, "
> > +			   "ahnd: %llx, ctx: %u, vm: %u, driver: %d, ahnd_map: %p, bind_map: %p>\n",
> > +			   getpid(), gettid(), ainfo->fd,
> > +			   (long long)ainfo->ahnd, ainfo->ctx, ainfo->vm,
> > +			   ainfo->driver, ahnd_map, ainfo->bind_map);
> > +		igt_map_insert(ahnd_map, &ainfo->ahnd, ainfo);
> > +	}
> > +
> > +	pthread_mutex_unlock(&ahnd_map_mutex);
> > +}
> > +
> > +static void untrack_ahnd(uint64_t ahnd)
> > +{
> > +	struct ahnd_info *ainfo;
> > +
> > +	pthread_mutex_lock(&ahnd_map_mutex);
> > +	ainfo = igt_map_search(ahnd_map, &ahnd);
> > +	if (ainfo) {
> > +		bind_debug("[UNTRACK AHND]: pid: %d, tid: %d, removing ahnd: %llx\n",
> > +			   getpid(), gettid(), (long long)ahnd);
> > +		igt_map_remove(ahnd_map, &ahnd, map_entry_free_func);
> > +	}
> 
> Suggestion: I'd warn on !ainfo, we tried to untrack/free something that
> wasn't tracked before.
> 

I don't want to warn. In this moment I don't treat closing already closed
ahnd as reason to warn. See REQ_CLOSE path where it doesn't find allocator.
It just skips and intel_allocator_close() returns false.  I missed adding
test for this but for example on api_intel_allocator@simple-alloc I may
add last line:

igt_assert_eq(intel_allocator_close(ahnd), true);
+igt_assert_eq(intel_allocator_close(ahnd), false);

This will check if allocator was already closed and generate warning
so cibuglog won't be happy. But maybe I should rethink this and don't
let invalid ahnd's to be closed? Anyway this requires strict programming
from the users at all.

> > +	pthread_mutex_unlock(&ahnd_map_mutex);
> > +}
> > +
> >   static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
> >   					    uint32_t vm,
> >   					    uint64_t start, uint64_t end,
> > @@ -951,6 +1031,8 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
> >   	igt_assert(resp.open.allocator_handle);
> >   	igt_assert(resp.response_type == RESP_OPEN);
> > +	track_ahnd(fd, resp.open.allocator_handle, ctx, vm);
> > +
> >   	return resp.open.allocator_handle;
> >   }
> > @@ -1057,6 +1139,8 @@ bool intel_allocator_close(uint64_t allocator_handle)
> >   	igt_assert(handle_request(&req, &resp) == 0);
> >   	igt_assert(resp.response_type == RESP_CLOSE);
> > +	untrack_ahnd(allocator_handle);
> > +
> >   	return resp.close.is_empty;
> >   }
> > @@ -1090,6 +1174,76 @@ void intel_allocator_get_address_range(uint64_t allocator_handle,
> >   		*endp = resp.address_range.end;
> >   }
> > +static bool is_same(struct allocator_object *obj,
> > +		    uint32_t handle, uint64_t offset, uint64_t size,
> > +		    enum allocator_bind_op bind_op)
> > +{
> > +	return obj->handle == handle &&	obj->offset == offset && obj->size == size &&
> > +	       (obj->bind_op == bind_op || obj->bind_op == BOUND);
> > +}
> > +
> > +static void track_object(uint64_t allocator_handle, uint32_t handle,
> > +			 uint64_t offset, uint64_t size,
> > +			 enum allocator_bind_op bind_op)
> > +{
> > +	struct ahnd_info *ainfo;
> > +	struct allocator_object *obj;
> > +
> > +	bind_debug("[TRACK OBJECT]: [%s] pid: %d, tid: %d, ahnd: %llx, handle: %u, offset: %llx, size: %llx\n",
> > +		   bind_op == TO_BIND ? "BIND" : "UNBIND",
> > +		   getpid(), gettid(),
> > +		   (long long)allocator_handle,
> > +		   handle, (long long)offset, (long long)size);
> > +
> > +	if (offset == ALLOC_INVALID_ADDRESS) {
> > +		bind_debug("[TRACK OBJECT] => invalid address %llx, skipping tracking\n",
> > +			   (long long)offset);
> 
> OK, we don't track ALLOC_INVALID_ADDRESS as it means that the allocation in
> simple_vma_heap_alloc() failed, correct?
> 

Yes, if we cannot fit - first allocation tooks whole space so another one
will return invalid address.

> > +		return;
> > +	}
> > +
> > +	pthread_mutex_lock(&ahnd_map_mutex);
> > +	ainfo = igt_map_search(ahnd_map, &allocator_handle);
> > +	pthread_mutex_unlock(&ahnd_map_mutex);
> > +	if (!ainfo) {
> > +		igt_warn("[TRACK OBJECT] => MISSING ahnd %llx <=\n", (long long)allocator_handle);
> > +		igt_assert(ainfo);
> > +	}
> 
> Could we do igt_assert_f() instead?
> 

Yes, definitely. Left from previous debugging shape.

> > +
> > +	if (ainfo->driver == INTEL_DRIVER_I915)
> > +		return; /* no-op for i915, at least now */
> 
> I wonder if we could move that tracking to the xe path for now. I mean,
> maybe there will be some benefit of doing it for i915, but I can't see it,
> at least for now.
> 

If I don't track ahnd_info (with ahnd as the key) I cannot retrieve driver
field and I need to run is_i915_device() or is_xe_device() which in my
opinion consts more than simple access to the map with O(1) complexity.

> > +
> > +	pthread_mutex_lock(&ainfo->bind_map_mutex);
> > +	obj = igt_map_search(ainfo->bind_map, &handle);
> > +	if (obj) {
> > +		/*
> > +		 * User may call alloc() couple of times, check object is the
> > +		 * same. For free() there's simple case, just remove from
> > +		 * bind_map.
> > +		 */
> > +		if (bind_op == TO_BIND)
> > +			igt_assert_eq(is_same(obj, handle, offset, size, bind_op), true);
> 
> Checkpatch.pl doesn't like the fact that you're not using braces both for if
> and else if (I have no strong pereference)
> 

Sure, I'll add missing ones to make it happy.

> > +		else if (bind_op == TO_UNBIND) {
> > +			if (obj->bind_op == TO_BIND)
> > +				igt_map_remove(ainfo->bind_map, &obj->handle, map_entry_free_func);
> > +			else if (obj->bind_op == BOUND)
> > +				obj->bind_op = bind_op; > +		}
> > +	} else {
> > +		/* Ignore to unbind bo which wasn't previously inserted */
> > +		if (bind_op == TO_UNBIND)
> > +			goto out;
> > +
> > +		obj = calloc(1, sizeof(*obj));
> > +		obj->handle = handle;
> > +		obj->offset = offset;
> > +		obj->size = size;
> > +		obj->bind_op = bind_op;
> 
> We don't have to check here for bind_op == BOUND, because the only way to
> get from to this state is to call __xe_op_bind(), and not alloc/free,
> correct?
> 

Yes. bind_map which collects active objects allocations/frees works
on ahnd. I keep those allocations on the map to make this fast.
Alloc() adds object to map with TO_BIND state, free() with TO_UNBIND
unless user didn't inject offsets to vm (__xe_op_bind()).
Collecting objects in xe_object form allows xe_bind_unbind_async()
to be allocator agostic. The drawback of this is code shape is
I need to do cleanups in the map (assign BOUND to objects which
were bound and get rid of unbinded). So I keep allocator_object
reference in xe_object priv field. Walk over list and finding
in the map is much quicker. I think I may introduce temporary
map which will keep xe_object -> allocator_object mapping and
then I can get rid of 'priv' field.

> > +		igt_map_insert(ainfo->bind_map, &obj->handle, obj);
> > +	}
> > +out:
> > +	pthread_mutex_unlock(&ainfo->bind_map_mutex);
> > +}
> > +
> >   /**
> >    * __intel_allocator_alloc:
> >    * @allocator_handle: handle to an allocator
> > @@ -1121,6 +1275,8 @@ uint64_t __intel_allocator_alloc(uint64_t allocator_handle, uint32_t handle,
> >   	igt_assert(handle_request(&req, &resp) == 0);
> >   	igt_assert(resp.response_type == RESP_ALLOC);
> > +	track_object(allocator_handle, handle, resp.alloc.offset, size, TO_BIND);
> > +
> >   	return resp.alloc.offset;
> >   }
> > @@ -1198,6 +1354,8 @@ bool intel_allocator_free(uint64_t allocator_handle, uint32_t handle)
> >   	igt_assert(handle_request(&req, &resp) == 0);
> >   	igt_assert(resp.response_type == RESP_FREE);
> > +	track_object(allocator_handle, handle, 0, 0, TO_UNBIND);
> > +
> >   	return resp.free.freed;
> >   }
> > @@ -1382,6 +1540,83 @@ void intel_allocator_print(uint64_t allocator_handle)
> >   	}
> >   }
> > +static void __xe_op_bind(struct ahnd_info *ainfo, uint32_t sync_in, uint32_t sync_out)
> > +{
> > +	struct allocator_object *obj;
> > +	struct igt_map_entry *pos;
> > +	struct igt_list_head obj_list;
> > +	struct xe_object *entry, *tmp;
> > +
> > +	IGT_INIT_LIST_HEAD(&obj_list);
> > +
> > +	pthread_mutex_lock(&ainfo->bind_map_mutex);
> > +	igt_map_foreach(ainfo->bind_map, pos) {
> > +		obj = pos->data;
> > +
> > +		if (obj->bind_op == BOUND)
> > +			continue;
> > +
> > +		bind_info("= [vm: %u] %s => %u %lx %lx\n",
> > +			  ainfo->ctx,
> > +			  obj->bind_op == TO_BIND ? "TO BIND" : "TO UNBIND",
> > +			  obj->handle, obj->offset,
> > +			  obj->size);
> > +
> > +		entry = malloc(sizeof(*entry));
> > +		entry->handle = obj->handle;
> > +		entry->offset = obj->offset;
> > +		entry->size = obj->size;
> > +		entry->bind_op = obj->bind_op == TO_BIND ? XE_OBJECT_BIND :
> > +							   XE_OBJECT_UNBIND;
> > +		entry->priv = obj;
> > +		igt_list_add(&entry->link, &obj_list);
> > +	}
> > +	pthread_mutex_unlock(&ainfo->bind_map_mutex);
> > +
> > +	xe_bind_unbind_async(ainfo->fd, ainfo->ctx, 0, &obj_list, sync_in, sync_out);
> 
> Shouldn't the second param be ainfo->vm, not ainfo->ctx?
> 

Yes, mixing i915 ctx as vm reference is confusing. I'm going to remove
that unlucky ctx field there.

> > +
> > +	pthread_mutex_lock(&ainfo->bind_map_mutex);
> > +	igt_list_for_each_entry_safe(entry, tmp, &obj_list, link) {
> > +		obj = entry->priv;
> > +		if (obj->bind_op == TO_BIND)
> > +			obj->bind_op = BOUND;
> > +		else
> > +			igt_map_remove(ainfo->bind_map, &obj->handle, map_entry_free_func);
> > +
> > +		igt_list_del(&entry->link);
> > +		free(entry);
> > +	}
> > +	pthread_mutex_unlock(&ainfo->bind_map_mutex);
> > +}
> > +
> > +/**
> > + * intel_allocator_bind:
> > + * @allocator_handle: handle to an allocator
> > + * @sync_in: syncobj (fence-in)
> > + * @sync_out: syncobj (fence-out)
> > + *
> > + * Function binds and unbinds all objects added to the allocator which weren't
> > + * previously binded/unbinded.
> > + *
> > + **/
> > +void intel_allocator_bind(uint64_t allocator_handle,
> > +			  uint32_t sync_in, uint32_t sync_out)
> > +{
> > +	struct ahnd_info *ainfo;
> > +
> > +	pthread_mutex_lock(&ahnd_map_mutex);
> > +	ainfo = igt_map_search(ahnd_map, &allocator_handle);
> > +	pthread_mutex_unlock(&ahnd_map_mutex);
> > +	igt_assert(ainfo);
> > +
> > +	/*
> > +	 * We collect bind/unbind operations on alloc()/free() to do group
> > +	 * operation getting @sync_in as syncobj handle (fence-in). If user
> > +	 * passes 0 as @sync_out we bind/unbind synchronously.
> > +	 */
> > +	__xe_op_bind(ainfo, sync_in, sync_out);
> > +}
> > +
> >   static int equal_handles(const void *key1, const void *key2)
> >   {
> >   	const struct handle_entry *h1 = key1, *h2 = key2;
> > @@ -1439,6 +1674,23 @@ static void __free_maps(struct igt_map *map, bool close_allocators)
> >   	igt_map_destroy(map, map_entry_free_func);
> >   }
> > +static void __free_ahnd_map(void)
> > +{
> > +	struct igt_map_entry *pos;
> > +	struct ahnd_info *ainfo;
> > +
> > +	if (!ahnd_map)
> > +		return;
> > +
> > +	igt_map_foreach(ahnd_map, pos) {
> > +		ainfo = pos->data;
> > +		igt_map_destroy(ainfo->bind_map, map_entry_free_func);
> > +	}
> > +
> > +	igt_map_destroy(ahnd_map, map_entry_free_func);
> > +}
> > +
> > +
> 
> ^- Whoops, an extra blank line
> 

Deleted in v3.

> >   /**
> >    * intel_allocator_init:
> >    *
> > @@ -1456,12 +1708,15 @@ void intel_allocator_init(void)
> >   	__free_maps(handles, true);
> >   	__free_maps(ctx_map, false);
> >   	__free_maps(vm_map, false);
> > +	__free_ahnd_map();
> >   	atomic_init(&next_handle, 1);
> >   	handles = igt_map_create(hash_handles, equal_handles);
> >   	ctx_map = igt_map_create(hash_instance, equal_ctx);
> >   	vm_map = igt_map_create(hash_instance, equal_vm);
> > -	igt_assert(handles && ctx_map && vm_map);
> > +	pthread_mutex_init(&ahnd_map_mutex, NULL);
> > +	ahnd_map = igt_map_create(igt_map_hash_64, igt_map_equal_64);
> > +	igt_assert(handles && ctx_map && vm_map && ahnd_map); >
> >   	channel = intel_allocator_get_msgchannel(CHANNEL_SYSVIPC_MSGQUEUE);
> >   }
> > diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
> > index 1001b21b98..f9ff7f1cc9 100644
> > --- a/lib/intel_allocator.h
> > +++ b/lib/intel_allocator.h
> > @@ -141,9 +141,6 @@ struct intel_allocator {
> >   	/* allocator's private structure */
> >   	void *priv;
> > -	/* driver - i915 or Xe */
> > -	enum intel_driver driver;
> > -
> 
> OK, I see it now. Please drop 9/16 and use per-thread driver info then.
> 
> Many thanks,
> Karolina

Thank you for the time and review comments.

--
Zbigniew

> 
> >   	void (*get_address_range)(struct intel_allocator *ial,
> >   				  uint64_t *startp, uint64_t *endp);
> >   	uint64_t (*alloc)(struct intel_allocator *ial, uint32_t handle,
> > @@ -213,6 +210,9 @@ bool intel_allocator_reserve_if_not_allocated(uint64_t allocator_handle,
> >   void intel_allocator_print(uint64_t allocator_handle);
> > +void intel_allocator_bind(uint64_t allocator_handle,
> > +			  uint32_t sync_in, uint32_t sync_out);
> > +
> >   #define ALLOC_INVALID_ADDRESS (-1ull)
> >   #define INTEL_ALLOCATOR_NONE   0
> >   #define INTEL_ALLOCATOR_RELOC  1
