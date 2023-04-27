Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC5910EAB3
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 07:09:05 +0000 (UTC)
Date: Thu, 27 Apr 2023 09:09:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Message-ID: <20230427070900.j2zg4np5zfugjjut@zkempczy-mobl2>
References: <20230426201626.5361-1-sai.gowtham.ch@intel.com>
 <418709a6-ed1b-03c2-9b61-1e39a03a3fec@intel.com>
 <BYAPR11MB34130BD19AB26A4CCB82F9FAD06A9@BYAPR11MB3413.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR11MB34130BD19AB26A4CCB82F9FAD06A9@BYAPR11MB3413.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe/xe_spin: Integrate igt_spin_new
 with Xe.
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

On Thu, Apr 27, 2023 at 07:49:42AM +0200, Ch, Sai Gowtham wrote:
> 
> 
> > -----Original Message-----
> > From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > Sent: Thursday, April 27, 2023 11:10 AM
> > To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; igt-
> > dev@lists.freedesktop.org; Kempczynski, Zbigniew
> > <zbigniew.kempczynski@intel.com>
> > Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe/xe_spin: Integrate igt_spin_new with
> > Xe.
> > 
> > 
> > On Thu-27-04-2023 01:46 am, sai.gowtham.ch@intel.com wrote:
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
> > >   lib/xe/xe_spin.c | 67
> > ++++++++++++++++++++++++++++++++++++++++++++++++
> > >   lib/xe/xe_spin.h | 21 +++++++++++++--
> > >   2 files changed, 86 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c index
> > > 856d0ba2..503d440e 100644
> > > --- a/lib/xe/xe_spin.c
> > > +++ b/lib/xe/xe_spin.c
> > > @@ -82,6 +82,73 @@ void xe_spin_end(struct xe_spin *spin)
> > >   	spin->end = 0;
> > >   }
> > >
> > > +static xe_spin_t *
> > > +xe_spin_create(int fd, struct xe_spin_factory *opt) {
> > > +	struct drm_xe_engine_class_instance *eci;
> > > +	size_t bo_size = xe_get_default_alignment(fd);
> > > +	uint32_t vm, bo, engine, syncobj;
> > > +	uint64_t ahnd = opt->ahnd, addr;
> > > +	struct xe_spin *spin;
> > > +	struct drm_xe_sync sync = {
> > > +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> > > +	};
> > > +	struct drm_xe_exec exec = {
> > > +		.num_batch_buffer = 1,
> > > +		.num_syncs = 1,
> > > +		.syncs = to_user_pointer(&sync),
> > > +	};
> > > +

Check ahnd here.

> > > +	spin = calloc(1, sizeof(struct xe_spin));
> > > +	igt_assert(spin);
> > > +
> > > +	vm = xe_vm_create(fd, 0, 0);
> > > +	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> > > +	spin = xe_bo_map(fd, bo, 0x1000);
> > > +	engine = xe_engine_create(fd, vm, eci, 0);
> > > +	syncobj = syncobj_create(fd, 0);
> > > +
> > > +	if (ahnd)
> > 
> > In i915, ahnd is used for relocations which 0 for XE. Is this ahnd is different than
> > i915's?
> ahnd here returns allocator handle from GGT.

For xe ahnd must be != 0. So assert on the beginning and this will be fine.

> > 
> > > +		addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
> > > +ALLOC_STRATEGY_LOW_TO_HIGH);
> > > +
> > > +	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
> > > +
> > > +	xe_spin_init(spin, addr, true);
> > > +	exec.engine_id = engine;
> > > +	exec.address = addr;
> > > +	sync.handle = syncobj;
> > > +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> > > +
> > > +	opt->bo = bo;
> > > +	opt->vm = vm;
> > > +	opt->engine = engine;
> > > +	opt->spin = spin;
> > > +	opt->syncobj = syncobj;
> > > +
> > > +	return opt->spin;
> > > +
> > > +}
> > > +
> > > +xe_spin_t *
> > > +__xe_spin_factory(int fd, struct xe_spin_factory *opt) {
> > > +	return xe_spin_create(fd, opt);
> > > +}
> > > +
> > > +void xe_spin_sync_wait(int fd, struct xe_spin_factory *opt) {
> > > +	igt_assert(syncobj_wait(fd, &opt->syncobj, 1, INT64_MAX, 0,
> > > +				NULL));
> > > +}
> > > +
> > > +void xe_spin_free(int fd, struct xe_spin_factory *opt) {
> > > +	xe_spin_end(opt->spin);
> > > +	xe_engine_destroy(fd, opt->engine);
> > > +	xe_vm_destroy(fd, opt->vm);
> > > +	gem_close(fd, opt->bo);
> > > +}
> > > +
> > >   void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
> > >   		  struct xe_cork *cork)
> > >   {
> > > diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h index
> > > 73f9a026..124fdebe 100644
> > > --- a/lib/xe/xe_spin.h
> > > +++ b/lib/xe/xe_spin.h
> > > @@ -15,17 +15,34 @@
> > >   #include "xe_query.h"
> > >
> > >   /* Mapped GPU object */
> > > -struct xe_spin {
> > > +struct  xe_spin_factory {
> > > +	uint64_t ahnd;
> > > +	uint32_t vm;
> > > +	uint32_t bo;
> > > +	uint32_t engine;
> > > +	uint32_t syncobj;
> > > +	struct xe_spin *spin;
> > > +};
> > > +
> > > +typedef struct xe_spin {
> > >   	uint32_t batch[16];
> > >   	uint64_t pad;
> > >   	uint32_t start;
> > >   	uint32_t end;
> > > -};
> > > +} xe_spin_t;
> > > +
> > > +xe_spin_t *
> > > +__xe_spin_factory(int fd, struct xe_spin_factory *opt);
> > > +
> > > +#define xe_spin_new(fd, ...) \
> > > +	__xe_spin_factory(fd, &((xe_spin_factory *opt){__VA__ARGS}))
> > 
> > So from kms tests, we need to call this helper as below:
> > 
> > if (is_xe_device(fd))
> > 	xe_spin_new();
> > else
> > 	igt_spin_new();
> > 
> > 
> > I am expecting some helper as below, so that we can avoid code churn in test
> > level:
> > igt_spin_new() {
> > 	if (is_xe_device(fd))
> > 		xe_spin_new();
> > 	else
> > 		i915_spin_new();
> > }
> 
> Initial Plan was that same, however it is difficult to do that as spin_create()
> uses igt_spin_t to collect all necessary information about spinner, Instead adding this check from test
> would make sense to me.

Don't hesitate and also return igt_spin_t from xe spinner. Just add fields
you need for xe spinner and it should work.

--
Zbigniew


> > - Bhanu
> > 
> > >
> > >   void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt);
> > >   bool xe_spin_started(struct xe_spin *spin);
> > > +void xe_spin_sync_wait(int fd, struct xe_spin_factory *opt);
> > >   void xe_spin_wait_started(struct xe_spin *spin);
> > >   void xe_spin_end(struct xe_spin *spin);
> > > +void xe_spin_free(int fd, struct xe_spin_factory *opt);
> > >
> > >   struct xe_cork {
> > >   	struct xe_spin *spin;
