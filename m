Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB7610E427
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 11:30:03 +0000 (UTC)
Date: Tue, 23 May 2023 13:29:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Message-ID: <20230523112958.pg7ljagxz3wlcf2p@zkempczy-mobl2>
References: <20230522123605.17416-1-sai.gowtham.ch@intel.com>
 <20230522123605.17416-2-sai.gowtham.ch@intel.com>
 <20230522161954.i2xmqalvgb6xdbs7@zkempczy-mobl2>
 <BYAPR11MB3413B96CF75752B33A2C26CDD0409@BYAPR11MB3413.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR11MB3413B96CF75752B33A2C26CDD0409@BYAPR11MB3413.namprd11.prod.outlook.com>
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

On Tue, May 23, 2023 at 10:41:08AM +0200, Ch, Sai Gowtham wrote:
> 
> 
> > -----Original Message-----
> > From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> > Sent: Monday, May 22, 2023 9:50 PM
> > To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_spin: Integrate igt_spin_new with Xe.
> > 
> > On Mon, May 22, 2023 at 06:06:04PM +0530, sai.gowtham.ch@intel.com
> > wrote:
> > > From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > >
> > > Extending the spin_create implementation and allocator handle support
> > > in xe, where it submits dummy work loads to engine. This
> > > Implementation is wrapped around vm_bind and unbind as we are supposed to
> > do it manually for xe.
> > >
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > > ---
> > >  lib/igt_dummyload.c | 24 ++++++++++++----  lib/igt_dummyload.h | 11
> > > ++++++++
> > >  lib/xe/xe_spin.c    | 68 +++++++++++++++++++++++++++++++++++++++++++++
> > >  lib/xe/xe_spin.h    |  7 +++++
> > >  4 files changed, 104 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c index
> > > 740a58f3..6e89b72d 100644
> > > --- a/lib/igt_dummyload.c
> > > +++ b/lib/igt_dummyload.c
> > > @@ -46,6 +46,7 @@
> > >  #include "intel_reg.h"
> > >  #include "ioctl_wrappers.h"
> > >  #include "sw_sync.h"
> > > +#include "xe/xe_spin.h"
> > >
> > >  /**
> > >   * SECTION:igt_dummyload
> > > @@ -447,7 +448,10 @@ spin_create(int fd, const struct igt_spin_factory
> > > *opts)  igt_spin_t *  __igt_spin_factory(int fd, const struct
> > > igt_spin_factory *opts)  {
> > > -	return spin_create(fd, opts);
> > > +	if (is_xe_device(fd))
> > > +		return xe_spin_create(fd, opts);
> > > +	else
> > > +		return spin_create(fd, opts);
> > >  }
> > >
> > >  /**
> > > @@ -467,6 +471,11 @@ igt_spin_factory(int fd, const struct
> > > igt_spin_factory *opts)  {
> > >  	igt_spin_t *spin;
> > >
> > > +	if (is_xe_device(fd)) {
> > > +		spin = xe_spin_create(fd, opts);
> > > +		return spin;
> > > +	}
> > > +
> > >  	if ((opts->flags & IGT_SPIN_POLL_RUN) && opts->engine !=
> > ALL_ENGINES) {
> > >  		unsigned int class;
> > >
> > > @@ -647,11 +656,14 @@ void igt_spin_free(int fd, igt_spin_t *spin)
> > >  	if (!spin)
> > >  		return;
> > >
> > > -	pthread_mutex_lock(&list_lock);
> > > -	igt_list_del(&spin->link);
> > > -	pthread_mutex_unlock(&list_lock);
> > > -
> > > -	__igt_spin_free(fd, spin);
> > > +	if (is_xe_device(fd)) {
> > > +		xe_spin_free(fd, spin);
> > > +	} else {
> > > +		pthread_mutex_lock(&list_lock);
> > > +		igt_list_del(&spin->link);
> > > +		pthread_mutex_unlock(&list_lock);
> > > +		__igt_spin_free(fd, spin);
> > > +	}
> > >  }
> > >
> > >  void igt_terminate_spins(void)
> > > diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h index
> > > b247ab02..4da4e5a5 100644
> > > --- a/lib/igt_dummyload.h
> > > +++ b/lib/igt_dummyload.h
> > > @@ -51,8 +51,10 @@ typedef struct igt_spin_factory {
> > >  	uint32_t dependency;
> > >  	uint64_t dependency_size;
> > >  	unsigned int engine;
> > > +	struct drm_xe_engine_class_instance *hwe;
> > >  	unsigned int flags;
> > >  	int fence;
> > > +	uint32_t vm;
> > >  	uint64_t ahnd;
> > >  } igt_spin_factory_t;
> > >
> > > @@ -83,6 +85,15 @@ typedef struct igt_spin {  #define SPIN_CLFLUSH (1
> > > << 0)
> > >
> > >  	struct igt_spin_factory opts;
> > > +
> > > +	uint32_t start;
> > > +	uint32_t end;
> > > +	size_t bo_size;
> > > +	uint64_t address;
> > > +	unsigned int engine;
> > > +	uint32_t vm;
> > > +	uint32_t syncobj;
> > > +
> > >  } igt_spin_t;
> > >
> > >
> > > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c index
> > > 856d0ba2..9a4fbeb8 100644
> > > --- a/lib/xe/xe_spin.c
> > > +++ b/lib/xe/xe_spin.c
> > > @@ -15,6 +15,7 @@
> > >  #include "intel_reg.h"
> > >  #include "xe_ioctl.h"
> > >  #include "xe_spin.h"
> > > +#include "lib/igt_dummyload.h"
> > >
> > >  /**
> > >   * xe_spin_init:
> > > @@ -82,6 +83,73 @@ void xe_spin_end(struct xe_spin *spin)
> > >  	spin->end = 0;
> > >  }
> > >
> > > +igt_spin_t *
> > > +xe_spin_create(int fd, const struct igt_spin_factory *opt) {
> > > +	size_t bo_size = xe_get_default_alignment(fd);
> > > +	uint32_t bo;
> > > +	uint64_t ahnd = opt->ahnd, addr;
> > > +	struct igt_spin *spin;
> > > +	struct xe_spin *xe_spin;
> > > +	struct drm_xe_sync sync = {
> > > +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> > > +	};
> > > +	struct drm_xe_exec exec = {
> > > +		.num_batch_buffer = 1,
> > > +		.num_syncs = 1,
> > > +		.syncs = to_user_pointer(&sync),
> > > +	};
> > > +
> > > +	igt_assert(ahnd);
> > > +	xe_spin = calloc(1, sizeof(struct xe_spin));
> > > +	igt_assert(xe_spin);
> > 
> > What is happening with xe_spin later? I mean it is allocated and?
> > 
> > > +	spin = calloc(1, sizeof(struct igt_spin));
> > > +	igt_assert(spin);
> > > +
> > > +	if (opt->engine) {
> > > +		spin->engine = opt->engine;
> > > +		spin->vm = opt->vm;
> > > +	} else {
> > > +		spin->vm = xe_vm_create(fd, 0, 0);
> > > +		spin->engine = xe_engine_create(fd, spin->vm, opt->hwe, 0);
> > > +	}
> > > +
> > > +	bo = xe_bo_create(fd, opt->hwe->gt_id, spin->vm, bo_size);
> > > +	spin->handle = bo;
> > > +	spin->syncobj = syncobj_create(fd, 0);
> > > +	addr = intel_allocator_alloc_with_strategy(ahnd, spin->handle, bo_size,
> > 0, ALLOC_STRATEGY_LOW_TO_HIGH);
> > > +	xe_vm_bind_sync(fd, spin->vm, spin->handle, 0, addr, bo_size);
> > > +
> > > +	xe_spin_init(xe_spin, addr, true);
> > > +	exec.engine_id = spin->engine;
> > > +	exec.address = addr;
> > > +	sync.handle = spin->syncobj;
> > > +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> > 
> > This code submits the job, but there're no instructions in bo dmesg complains
> > with errors. Check your spin is not starting by adding here:
> > 
> I'm trying to understand more here, what do you mean by no instructions in bo ? 

Map your 'bo' (batch), dump 16 instructions and see what's there.


> > xe_spin_wait_started(xe_spin);
> > 
> Do you mean we have to wait spin for uncompleted store-dword after submitting exec ?

Yes, this will reveal you're stucking here with current code.

--
Zbigniew

> > cpu will stuck waiting for uncompleted store-dword.
> > 
> > Hint: check your bo.
> > 
> > --
> > Zbigniew
> > 
> > > +
> > > +	spin->batch = xe_spin->batch;
> > > +	spin->start = xe_spin->start;
> > > +	spin->end = xe_spin->end;
> > > +	spin->bo_size = bo_size;
> > > +	spin->address = addr;
> > > +	return spin;
> > > +
> > > +}
> > > +
> > > +void xe_spin_sync_wait(int fd, struct igt_spin *spin) {
> > > +	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0,
> > > +				NULL));
> > > +}
> > > +
> > > +void xe_spin_free(int fd, struct igt_spin *spin) {
> > > +	xe_vm_unbind_sync(fd, spin->vm, 0, spin->address, spin->bo_size);
> > > +	spin->end = 0;
> > > +	syncobj_destroy(fd, spin->syncobj);
> > > +	xe_engine_destroy(fd, spin->engine);
> > > +	gem_close(fd, spin->handle);
> > > +}
> > > +
> > >  void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
> > >  		  struct xe_cork *cork)
> > >  {
> > > diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h index
> > > 73f9a026..48867eb8 100644
> > > --- a/lib/xe/xe_spin.h
> > > +++ b/lib/xe/xe_spin.h
> > > @@ -13,19 +13,26 @@
> > >  #include <stdbool.h>
> > >
> > >  #include "xe_query.h"
> > > +#include "lib/igt_dummyload.h"
> > >
> > >  /* Mapped GPU object */
> > > +
> > >  struct xe_spin {
> > >  	uint32_t batch[16];
> > >  	uint64_t pad;
> > >  	uint32_t start;
> > >  	uint32_t end;
> > > +
> > >  };
> > >
> > > +igt_spin_t *
> > > +xe_spin_create(int fd, const struct igt_spin_factory *opt);
> > >  void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt);
> > > bool xe_spin_started(struct xe_spin *spin);
> > > +void xe_spin_sync_wait(int fd, struct igt_spin *spin);
> > >  void xe_spin_wait_started(struct xe_spin *spin);  void
> > > xe_spin_end(struct xe_spin *spin);
> > > +void xe_spin_free(int fd, struct igt_spin *spin);
> > >
> > >  struct xe_cork {
> > >  	struct xe_spin *spin;
> > > --
> > > 2.39.1
> > >
