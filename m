Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4976010E337
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 04:44:03 +0000 (UTC)
Message-ID: <e73b31fb-140d-97e4-d55c-38abf86a78bb@intel.com>
Date: Tue, 30 May 2023 10:13:40 +0530
Content-Language: en-US
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>
References: <20230525055519.10098-1-sai.gowtham.ch@intel.com>
 <20230525055519.10098-2-sai.gowtham.ch@intel.com>
 <20230529055122.eikdtj365xdqkass@zkempczy-mobl2>
 <BYAPR11MB341365193B79B48167E54959D04B9@BYAPR11MB3413.namprd11.prod.outlook.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <BYAPR11MB341365193B79B48167E54959D04B9@BYAPR11MB3413.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/xe/xe_spin: Integrate
 igt_spin_new with Xe.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On Tue-30-05-2023 10:09 am, Ch, Sai Gowtham wrote:
> 
> 
>> -----Original Message-----
>> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
>> Sent: Monday, May 29, 2023 11:21 AM
>> To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
>> Cc: igt-dev@lists.freedesktop.org
>> Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_spin: Integrate igt_spin_new with Xe.
>>
>> On Thu, May 25, 2023 at 11:25:18AM +0530, sai.gowtham.ch@intel.com wrote:
>>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>>
>>> Extending the spin_create implementation and allocator handle support
>>> in xe, where it submits dummy work loads to engine. This
>>> Implementation is wrapped around vm_bind and unbind as we are supposed to
>> do it manually for xe.
>>>
>>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>> ---
>>>   lib/igt_dummyload.c | 24 +++++++++---  lib/igt_dummyload.h | 10 +++++
>>>   lib/xe/xe_spin.c    | 89 +++++++++++++++++++++++++++++++++++++++++++++
>>>   lib/xe/xe_spin.h    |  7 ++++
>>>   4 files changed, 124 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c index
>>> 740a58f3..6e89b72d 100644
>>> --- a/lib/igt_dummyload.c
>>> +++ b/lib/igt_dummyload.c
>>> @@ -46,6 +46,7 @@
>>>   #include "intel_reg.h"
>>>   #include "ioctl_wrappers.h"
>>>   #include "sw_sync.h"
>>> +#include "xe/xe_spin.h"
>>>
>>>   /**
>>>    * SECTION:igt_dummyload
>>> @@ -447,7 +448,10 @@ spin_create(int fd, const struct igt_spin_factory
>>> *opts)  igt_spin_t *  __igt_spin_factory(int fd, const struct
>>> igt_spin_factory *opts)  {
>>> -	return spin_create(fd, opts);
>>> +	if (is_xe_device(fd))
>>> +		return xe_spin_create(fd, opts);
>>> +	else
>>> +		return spin_create(fd, opts);
>>>   }
>>>
>>>   /**
>>> @@ -467,6 +471,11 @@ igt_spin_factory(int fd, const struct
>>> igt_spin_factory *opts)  {
>>>   	igt_spin_t *spin;
>>>
>>> +	if (is_xe_device(fd)) {
>>> +		spin = xe_spin_create(fd, opts);
>>> +		return spin;
>>> +	}
>>> +
>>>   	if ((opts->flags & IGT_SPIN_POLL_RUN) && opts->engine !=
>> ALL_ENGINES) {
>>>   		unsigned int class;
>>>
>>> @@ -647,11 +656,14 @@ void igt_spin_free(int fd, igt_spin_t *spin)
>>>   	if (!spin)
>>>   		return;
>>>
>>> -	pthread_mutex_lock(&list_lock);
>>> -	igt_list_del(&spin->link);
>>> -	pthread_mutex_unlock(&list_lock);
>>> -
>>> -	__igt_spin_free(fd, spin);
>>> +	if (is_xe_device(fd)) {
>>> +		xe_spin_free(fd, spin);
>>> +	} else {
>>> +		pthread_mutex_lock(&list_lock);
>>> +		igt_list_del(&spin->link);
>>> +		pthread_mutex_unlock(&list_lock);
>>> +		__igt_spin_free(fd, spin);
>>> +	}
>>>   }
>>>
>>>   void igt_terminate_spins(void)
>>> diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h index
>>> b247ab02..7bcc7b56 100644
>>> --- a/lib/igt_dummyload.h
>>> +++ b/lib/igt_dummyload.h
>>> @@ -54,6 +54,8 @@ typedef struct igt_spin_factory {
>>>   	unsigned int flags;
>>>   	int fence;
>>>   	uint64_t ahnd;
>>> +	struct drm_xe_engine_class_instance *hwe;
>>> +	uint32_t vm;
>>>   } igt_spin_factory_t;
>>>
>>>   typedef struct igt_spin {
>>> @@ -83,6 +85,14 @@ typedef struct igt_spin {  #define SPIN_CLFLUSH (1
>>> << 0)
>>>
>>>   	struct igt_spin_factory opts;
>>> +
>>> +	struct xe_spin *xe_spin;
>>> +	size_t bo_size;
>>> +	uint64_t address;
>>> +	unsigned int engine;
>>> +	uint32_t vm;
>>> +	uint32_t syncobj;
>>> +
>>>   } igt_spin_t;
>>>
>>>
>>> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c index
>>> 856d0ba2..3a8c7bb3 100644
>>> --- a/lib/xe/xe_spin.c
>>> +++ b/lib/xe/xe_spin.c
>>> @@ -15,6 +15,7 @@
>>>   #include "intel_reg.h"
>>>   #include "xe_ioctl.h"
>>>   #include "xe_spin.h"
>>> +#include "lib/igt_dummyload.h"
>>>
>>>   /**
>>>    * xe_spin_init:
>>> @@ -82,6 +83,94 @@ void xe_spin_end(struct xe_spin *spin)
>>>   	spin->end = 0;
>>>   }
>>>
>>> +igt_spin_t *
>>> +xe_spin_create(int fd, const struct igt_spin_factory *opt) {
>>> +	size_t bo_size = xe_get_default_alignment(fd);
>>> +	uint32_t bo;
>>> +	uint64_t ahnd = opt->ahnd, addr;
>>> +	struct igt_spin *spin;
>>> +	struct xe_spin *xe_spin;
>>> +	struct drm_xe_sync sync = {
>>> +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
>>> +	};
>>> +	struct drm_xe_exec exec = {
>>> +		.num_batch_buffer = 1,
>>> +		.num_syncs = 1,
>>> +		.syncs = to_user_pointer(&sync),
>>> +	};
>>> +
>>> +	igt_assert(ahnd);
>>> +	spin = calloc(1, sizeof(struct igt_spin));
>>> +	igt_assert(spin);
>>> +
>>> +	spin->syncobj = syncobj_create(fd, 0);
>>> +	if (opt->engine) {
>>> +		spin->opts.engine = opt->engine;
>>> +		spin->opts.vm = opt->vm;
>>> +
>>> +		spin->handle = xe_bo_create(fd, 0, spin->opts.vm, bo_size);
>>> +		xe_spin = xe_bo_map(fd, spin->handle, bo_size);
>>> +		addr = intel_allocator_alloc_with_strategy(ahnd, spin->handle,
>> bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
>>> +		xe_vm_bind_sync(fd, spin->opts.vm, spin->handle, 0, addr,
>> bo_size);
>>> +
>>> +		xe_spin_init(xe_spin, addr, true);
>>> +		exec.engine_id = spin->opts.engine;
>>> +		exec.address = addr;
>>> +	} else {
>>> +		spin->vm = xe_vm_create(fd, 0, 0);
>>> +		spin->engine = xe_engine_create(fd, spin->vm, opt->hwe, 0);
>>> +
>>> +		bo = xe_bo_create(fd, 0, spin->vm, bo_size);
>>> +		spin->handle = bo;
>>> +		xe_spin = xe_bo_map(fd, spin->handle, bo_size);
>>> +		addr = intel_allocator_alloc_with_strategy(ahnd, spin->handle,
>> bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
>>> +		xe_vm_bind_sync(fd, spin->vm, spin->handle, 0, addr, bo_size);
>>> +
>>> +		xe_spin_init(xe_spin, addr, true);
>>> +		exec.engine_id = spin->engine;
>>> +		exec.address = addr;
>>> +	}
>>
>> I think you should support two variants of executing spinners:
>>
>> 1. hwe != NULL (in this case engine must be 0):
>>     if (!vm) -> create vm;
>>     create engine for vm according to hwe
>>
>> 2. engine != 0, vm must be vm on top of which engine was created
>>     hwe must be NULL in this case
>>     see Dominik answer about passing engine+vm in:
>>     https://patchwork.freedesktop.org/patch/539173/?series=118227&rev=2
>>
>> And add support ALL_ENGINES flag (then iterate over all hw engines like Bhanu
>> suggested). And track engine ownership - if caller is the engine/vm owner use it
>> but don't destroy, if spinner code is creating engine you may freely destroy it in
>> spinner free path().
>>
> Do we have Driver support for ALL_ENGINES flag ??
> 
> I think what Bhanu asking for is as kms tests  doesn’t need hwe, We have to pass hwe from the xe_spin_create it self.
> In that case we can add a support in xe_spin_create where hwe = 0 and engine = 0 ( Note  this is only for kms tests) .

Yes, KMS tests are not supposed to pass hwe or engines.

- Bhanu

> 
> I feel ALL_ENGINES support can be added later, Once kms tests are unblocked.
> 
> Regarding igt_spin_free, I've already added support not to destroy vm and engines if they are passed from the igt test. Can you have a look at igt_spin_free (Verified it's working fine for me).
> -----
> Gowtham
>> --
>> Zbigniew
>>
>>
>>> +	sync.handle = spin->syncobj;
>>> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
>>> +	xe_spin_wait_started(xe_spin);
>>> +	igt_info("Spinner started\n");
>>> +
>>> +	spin->bo_size = bo_size;
>>> +	spin->address = addr;
>>> +	spin->xe_spin = xe_spin;
>>> +
>>> +	return spin;
>>> +}
>>> +
>>> +void xe_spin_sync_wait(int fd, struct igt_spin *spin) {
>>> +	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0,
>>> +				NULL));
>>> +}
>>> +
>>> +void xe_spin_free(int fd, struct igt_spin *spin) {
>>> +	xe_spin_end(spin->xe_spin);
>>> +	xe_spin_sync_wait(fd, spin);
>>> +
>>> +	if (!spin->opts.engine) {
>>> +		xe_vm_unbind_sync(fd, spin->vm, 0, spin->address, spin-
>>> bo_size);
>>> +	} else {
>>> +		xe_vm_unbind_sync(fd, spin->opts.vm, 0, spin->address, spin-
>>> bo_size);
>>> +	}
>>> +
>>> +	syncobj_destroy(fd, spin->syncobj);
>>> +	gem_munmap(spin->xe_spin, spin->bo_size);
>>> +	gem_close(fd, spin->handle);
>>> +
>>> +	if (!spin->opts.engine) {
>>> +		xe_engine_destroy(fd, spin->engine);
>>> +		xe_vm_destroy(fd, spin->vm);
>>> +	}
>>> +	free(spin);
>>> +}
>>> +
>>>   void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
>>>   		  struct xe_cork *cork)
>>>   {
>>> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h index
>>> 73f9a026..48867eb8 100644
>>> --- a/lib/xe/xe_spin.h
>>> +++ b/lib/xe/xe_spin.h
>>> @@ -13,19 +13,26 @@
>>>   #include <stdbool.h>
>>>
>>>   #include "xe_query.h"
>>> +#include "lib/igt_dummyload.h"
>>>
>>>   /* Mapped GPU object */
>>> +
>>>   struct xe_spin {
>>>   	uint32_t batch[16];
>>>   	uint64_t pad;
>>>   	uint32_t start;
>>>   	uint32_t end;
>>> +
>>>   };
>>>
>>> +igt_spin_t *
>>> +xe_spin_create(int fd, const struct igt_spin_factory *opt);
>>>   void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt);
>>> bool xe_spin_started(struct xe_spin *spin);
>>> +void xe_spin_sync_wait(int fd, struct igt_spin *spin);
>>>   void xe_spin_wait_started(struct xe_spin *spin);  void
>>> xe_spin_end(struct xe_spin *spin);
>>> +void xe_spin_free(int fd, struct igt_spin *spin);
>>>
>>>   struct xe_cork {
>>>   	struct xe_spin *spin;
>>> --
>>> 2.39.1
>>>
