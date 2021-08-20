Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBF16E832
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Aug 2021 04:46:20 +0000 (UTC)
Date: Fri, 20 Aug 2021 06:46:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210820044614.GA3286@zkempczy-mobl2>
References: <20210819044941.7699-1-zbigniew.kempczynski@intel.com>
 <20210819044941.7699-2-zbigniew.kempczynski@intel.com>
 <87v941b0f6.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v941b0f6.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/gem_ctx_shared: Adopt to use
 allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 02:16:13PM -0700, Dixit, Ashutosh wrote:
> On Wed, 18 Aug 2021 21:49:39 -0700, Zbigniew Kempczyński wrote:
> >
> > @@ -518,12 +533,24 @@ static void store_dword(int i915, const intel_ctx_t *ctx, unsigned ring,
> >
> >	memset(obj, 0, sizeof(obj));
> >	obj[0].handle = cork;
> > -	obj[0].offset = cork << 20;
> >	obj[1].handle = target;
> > -	obj[1].offset = target << 20;
> >	obj[2].handle = gem_create(i915, 4096);
> > -	obj[2].offset = 256 << 10;
> > -	obj[2].offset += (random() % 128) << 12;
> > +	if (ahnd) {
> > +		obj[0].offset = cork_offset;
> > +		obj[0].flags |= EXEC_OBJECT_PINNED;
> > +		obj[1].offset = target_offset;
> > +		obj[1].flags |= EXEC_OBJECT_PINNED;
> > +		if (write_domain)
> > +			obj[1].flags |= EXEC_OBJECT_WRITE;
> > +		obj[2].offset = get_offset(ahnd, obj[2].handle, 4096, 0x0);
> > +		obj[2].flags |= EXEC_OBJECT_PINNED;
> > +		execbuf.flags |= I915_EXEC_NO_RELOC;
> 
> I915_EXEC_NO_RELOC needed (since I think we weren't doing this earlier)?

That's minor optimization for softpinning. We got relocation_count == 0 for 
each gem object, so eb->relocs is empty list. We also don't expect offset
change on execbuf return.

> 
> > -static void unplug_show_queue(int i915, struct igt_cork *c,
> > +static void unplug_show_queue(int i915, struct igt_cork *c, uint64_t ahnd,
> >			      const intel_ctx_cfg_t *cfg, unsigned int engine)
> >  {
> >	igt_spin_t *spin[MAX_ELSP_QLEN];
> >
> >	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
> >		const intel_ctx_t *ctx = create_highest_priority(i915, cfg);
> > -		spin[n] = __igt_spin_new(i915, .ctx = ctx, .engine = engine);
> > +
> > +		/*
> > +		 * When we're using same vm we should use allocator handle
> > +		 * passed by the caller. This is the case where cfg->vm
> > +		 * is not NULL.
> > +		 *
> > +		 * For cases where context use its own vm we need separate
> > +		 * ahnd for it.
> > +		 */
> > +		if (!cfg->vm)
> > +			ahnd = get_reloc_ahnd(i915, ctx->id);
> 
> Ok, good, even though in this code we always used shared vm this is good in
> case something changes later.
> 
> > @@ -599,8 +643,10 @@ static uint32_t store_timestamp(int i915,
> >	uint32_t handle = gem_create(i915, 4096);
> >	struct drm_i915_gem_exec_object2 obj = {
> >		.handle = handle,
> > -		.relocation_count = 1,
> > -		.offset = (32 << 20) + (handle << 16),
> > +		.relocation_count = !ahnd ? 1 : 0,
> > +		.offset = !ahnd ? (32 << 20) + (handle << 16) :
> > +				  get_offset(ahnd, handle, 4096, 0),
> > +		.flags = !ahnd ? 0 : EXEC_OBJECT_PINNED,
> 
> | EXEC_OBJECT_WRITE ?

No, see there's no write_domain in reloc struct. We're waiting for objects
explicitely - see gem_set_domain() /* no write hazard lies */.

> 
> > @@ -612,7 +658,7 @@ static uint32_t store_timestamp(int i915,
> >	struct drm_i915_gem_execbuffer2 execbuf = {
> >		.buffers_ptr = to_user_pointer(&obj),
> >		.buffer_count = 1,
> > -		.flags = ring | I915_EXEC_FENCE_IN,
> > +		.flags = ring | I915_EXEC_FENCE_IN | (!!ahnd * I915_EXEC_NO_RELOC),
> 
> I915_EXEC_NO_RELOC needed? Also !! has gone out of fashion :)

I wanted to put minimal code changes here. If you really don't like !!ahnd 
I will remove it, putting dedicated if () to add this flag later.

> 
> > @@ -831,6 +903,8 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
> >	unsigned engine;
> >	uint32_t scratch;
> >	uint32_t *ptr;
> > +	uint64_t ahnd = get_reloc_ahnd(i915, 0); /* same vm */
> > +	uint64_t scratch_offset;
> >
> >	q_cfg = *cfg;
> >	q_cfg.vm = gem_vm_create(i915);
> > @@ -848,9 +922,11 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
> >	igt_require(nengine);
> >
> >	scratch = gem_create(i915, 4096);
> > +	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
> >	igt_fork(child, ncpus) {
> >		unsigned long count = 0;
> >		const intel_ctx_t *ctx;
> > +		ahnd = get_reloc_ahnd(i915, 0); /* ahnd to same vm */
> 
> Can't we use the parent's ahnd here, since we are using
> intel_allocator_multiprocess_start/stop?

No, you cannot use ahnd created within parent process in the child.
IPC communication rely on child_tid value which is properly assigned on
intel_allocator_open(). Idea of this is to send requests to the allocator
by the children with their own child_tid to distinguish them. Please track

- intel_allocator.c: send_req_recv_resp()
  - intel_allocator.c: send_req()
    - intel_allocator_msgchannel.c: msgqueue_send_req() 

calls. Using child_tid in this communication will become clear then
(especially it's initialization necessity on intel_allocator_open()).

That's why calling intel_allocator_open() in each child is necessary,
it just assigns that magic number for IPC which distinguishes requests.

--
Zbigniew

> 
> Please take a look at the nits above and if anything needs to be
> done. Otherwise this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
