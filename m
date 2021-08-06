Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC5C6EA86
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 06:17:42 +0000 (UTC)
Date: Fri, 6 Aug 2021 08:17:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210806061737.GC3285@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-7-zbigniew.kempczynski@intel.com>
 <87im0ku6zb.wl-ashutosh.dixit@intel.com>
 <20210805072830.GA3295@zkempczy-mobl2>
 <87eeb7u10t.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87eeb7u10t.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 06/52] lib/intel_batchbuffer: Add
 allocator support in blitter src copy
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 05, 2021 at 12:47:30PM -0700, Dixit, Ashutosh wrote:
> On Thu, 05 Aug 2021 00:28:30 -0700, Zbigniew Kempczyński wrote:
> >
> 
> Thanks for the responding. I have replied below, please see if anything
> needs to be addressed but otherwise this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> > On Wed, Aug 04, 2021 at 04:26:32PM -0700, Dixit, Ashutosh wrote:
> > > On Mon, 26 Jul 2021 12:59:40 -0700, Zbigniew Kempczyński wrote:
> > > >
> > > > @@ -808,9 +816,21 @@ void igt_blitter_src_copy(int fd,
> > > >	uint32_t src_pitch, dst_pitch;
> > > >	uint32_t dst_reloc_offset, src_reloc_offset;
> > > >	uint32_t gen = intel_gen(intel_get_drm_devid(fd));
> > > > +	uint64_t batch_offset, src_offset, dst_offset;
> > > >	const bool has_64b_reloc = gen >= 8;
> > > >	int i = 0;
> > > >
> > > > +	batch_handle = gem_create(fd, 4096);
> > > > +	if (ahnd) {
> > > > +		src_offset = get_offset(ahnd, src_handle, src_size, 0);
> > > > +		dst_offset = get_offset(ahnd, dst_handle, dst_size, 0);
> > > > +		batch_offset = get_offset(ahnd, batch_handle, 4096, 0);
> > > > +	} else {
> > > > +		src_offset = 16 << 20;
> > > > +		dst_offset = ALIGN(src_offset + src_size, 1 << 20);
> > > > +		batch_offset = ALIGN(dst_offset + dst_size, 1 << 20);
> > >
> > > For the !ahnd case, we are providing relocations right? We still need to
> > > provide these offsets or they can all be 0?
> >
> > Yes, we're providing relocations but we try to guess offsets to avoid them.
> > If we guess valid offsets they will be used, if we missed and kernel decides
> > to migrate vma(s) kernel will relocate and fill offsets within bb regardless
> > NO_RELOC (it's just a hint - if vmas are not moved and you filled bb with
> > them just skip relocations).
> 
> Yes this is as I thought as I said in the later mail.
> 
> > > > @@ -882,22 +902,29 @@ void igt_blitter_src_copy(int fd,
> > > >
> > > >	igt_assert(i <= ARRAY_SIZE(batch));
> > > >
> > > > -	batch_handle = gem_create(fd, 4096);
> > > >	gem_write(fd, batch_handle, 0, batch, sizeof(batch));
> > > >
> > > > -	fill_relocation(&relocs[0], dst_handle, -1, dst_delta, dst_reloc_offset,
> > > > +	fill_relocation(&relocs[0], dst_handle, dst_offset,
> > > > +			dst_delta, dst_reloc_offset,
> > > >			I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER);
> > > > -	fill_relocation(&relocs[1], src_handle, -1, src_delta, src_reloc_offset,
> > > > +	fill_relocation(&relocs[1], src_handle, src_offset,
> > > > +			src_delta, src_reloc_offset,
> > > >			I915_GEM_DOMAIN_RENDER, 0);
> > > >
> > > > -	fill_object(&objs[0], dst_handle, 0, NULL, 0);
> > > > -	fill_object(&objs[1], src_handle, 0, NULL, 0);
> > > > -	fill_object(&objs[2], batch_handle, 0, relocs, 2);
> > > > +	fill_object(&objs[0], dst_handle, dst_offset, NULL, 0);
> > > > +	fill_object(&objs[1], src_handle, src_offset, NULL, 0);
> > > > +	fill_object(&objs[2], batch_handle, batch_offset, relocs, 2);
> > > >
> > > > -	objs[0].flags |= EXEC_OBJECT_NEEDS_FENCE;
> > > > +	objs[0].flags |= EXEC_OBJECT_NEEDS_FENCE | EXEC_OBJECT_WRITE;
> > > >	objs[1].flags |= EXEC_OBJECT_NEEDS_FENCE;
> > > >
> > > > -	exec_blit(fd, objs, 3, gen, 0);
> > > > +	if (ahnd) {
> > > > +		objs[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> > > > +		objs[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> > > > +		objs[2].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> > > > +	}
> > >
> > > Should be add an "else" here and pull the fill_relocation() and set the
> > > relocation_count to 2 only if we have !ahnd? Maybe ok to leave as is too if
> > > the kernel will ignore the reloc stuff when EXEC_OBJECT_PINNED is set.
> >
> > We may pass relocs data to the kernel but check in no-reloc gens uses .relocation_count
> > field. That's why we need to provide it zeroed.
> >
> > If you're asking why I haven't do else - I'm just a little bit lazy and I wanted
> > avoid to additional else {} block. But if you think code would be more readable
> > I will change it.
> 
> No it's ok, no need to change. But looks like the relocation_count above is
> unconditionally set to 2 in both reloc and no-reloc case. If this works
> then maybe relocation_count is ignored if EXEC_OBJECT_PINNED is set?
> Otherwise we may to set it to 0 in the non-reloc case.

Oh, series (v3) got 2 what is wrong - I got it fixed right after this version was
sent and I'd seen results so I forgot about it. You've noticed that well, currently
it is:

+       fill_object(&objs[2], batch_handle, batch_offset, relocs, !ahnd ? 2 : 0);

V4 will be send soon.

Thanks for review.
--
Zbigniew

> 
> > > > @@ -584,10 +601,17 @@ static void work(int i915, int dmabuf, const intel_ctx_t *ctx, unsigned ring)
> > > >	obj[SCRATCH].handle = prime_fd_to_handle(i915, dmabuf);
> > > >
> > > >	obj[BATCH].handle = gem_create(i915, size);
> > > > +	obj[BATCH].offset = get_offset(ahnd, obj[BATCH].handle, size, 0);
> > > >	obj[BATCH].relocs_ptr = (uintptr_t)store;
> > > > -	obj[BATCH].relocation_count = ARRAY_SIZE(store);
> > > > +	obj[BATCH].relocation_count = !ahnd ? ARRAY_SIZE(store) : 0;
> > > >	memset(store, 0, sizeof(store));
> > > >
> > > > +	if (ahnd) {
> > > > +		obj[SCRATCH].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
> > > > +		obj[SCRATCH].offset = scratch_offset;
> > > > +		obj[BATCH].flags = EXEC_OBJECT_PINNED;
> > > > +	}
> > >
> > > Why don't we compute scratch_offset in work() itself (and rather pass it in
> > > from the callers)?
> >
> > In work() we're not aware what scratch object size is. So there's hard to
> > call get_offset() with size. So I need to pass size or offset, probably
> > experience with other tests points me to pass offset instead size.
> > Generally if we have some scratch and we want to use it within pipelined
> > executions in same context we need to provide same offset for scratch,
> > but offsets which are not busy for bb. Second is problematic with Simple allocator
> > (see one of my previous email when I describe this problem) because scratch
> > will have same offset - we want this, but bb will also have same offset.
> > Using Reloc allocator at least gives us next offsets for bb, but we have
> > to avoid using it twice or more for scratch).
> 
> Sorry, I did not realize scratch is not available in work. I would rather
> pass scratch into the function but maybe it's ok as is too.
> 
> >
> > >
> > > > @@ -602,8 +626,8 @@ static void work(int i915, int dmabuf, const intel_ctx_t *ctx, unsigned ring)
> > > >		store[count].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
> > > >		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> > > >		if (gen >= 8) {
> > > > -			batch[++i] = 0;
> > > > -			batch[++i] = 0;
> > > > +			batch[++i] = scratch_offset + store[count].delta;
> > > > +			batch[++i] = (scratch_offset + store[count].delta) >> 32;
> > > >		} else if (gen >= 4) {
> > > >			batch[++i] = 0;
> > > >			batch[++i] = 0;
> > >
> > > Should we add the offset's even for previous gen's (gen < 8)? Because I am
> > > thinking at present kernel is supporting reloc's for gen < 12 but maybe
> > > later kernels will discontinue them completely so we'll need to fix the
> > > previous gen's all over again? Maybe too much?
> >
> > On older gens you'll definitely catch relocation here (presumed_offset == -1
> > and lack of NO_RELOC flag).
> >
> > Newer kernels cannot remove relocations because on gens where you have no
> > ppgtt you're not able to predict which offsets are busy or not. So passing
> > offset here does nothing and relocation will overwrite it.
> 
> Ah ok, because multiple processes are sharing the global gtt. Thanks.
