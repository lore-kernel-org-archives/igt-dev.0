Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E441E6E0F7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 05:18:38 +0000 (UTC)
Date: Tue, 17 Aug 2021 07:18:29 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210817051829.GA3283@zkempczy-mobl2>
References: <20210816115626.22759-1-zbigniew.kempczynski@intel.com>
 <20210816115626.22759-5-zbigniew.kempczynski@intel.com>
 <87o89wzub2.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o89wzub2.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] tests/gem_exec_schedule: Adopt to
 use allocator
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

On Mon, Aug 16, 2021 at 07:20:01PM -0700, Dixit, Ashutosh wrote:
> On Mon, 16 Aug 2021 04:56:25 -0700, Zbigniew Kempczyński wrote:
> >
> > @@ -117,12 +119,23 @@ static uint32_t __store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
> >
> > +	if (ahnd) {
> > +		obj[0].offset = cork_offset;
> > +		obj[0].flags |= EXEC_OBJECT_PINNED;
> > +		obj[1].offset = target_offset;
> > +		obj[1].flags |= EXEC_OBJECT_PINNED;
> > +		if (write_domain)
> > +			obj[1].flags |= EXEC_OBJECT_WRITE;
> > +		obj[2].offset = get_offset(ahnd, obj[2].handle, 4096, 0);
> > +		obj[2].flags |= EXEC_OBJECT_PINNED;
> > +	} else {
> > +		obj[0].offset = cork << 20;
> > +		obj[1].offset = target << 20;
> > +		obj[2].offset = 256 << 10;
> > +		obj[2].offset += (random() % 128) << 12;
> > +	}
> >
> >	memset(&reloc, 0, sizeof(reloc));
> >	reloc.target_handle = obj[1].handle;
> > @@ -132,13 +145,13 @@ static uint32_t __store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
> >	reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
> >	reloc.write_domain = write_domain;
> >	obj[2].relocs_ptr = to_user_pointer(&reloc);
> > -	obj[2].relocation_count = 1;
> > +	obj[2].relocation_count = !ahnd ? 1 : 0;
> >
> >	i = 0;
> >	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> >	if (gen >= 8) {
> >		batch[++i] = reloc.presumed_offset + reloc.delta;
> > -		batch[++i] = 0;
> > +		batch[++i] = (reloc.presumed_offset + reloc.delta) >> 32;
> >	} else if (gen >= 4) {
> >		batch[++i] = 0;
> >		batch[++i] = reloc.presumed_offset + reloc.delta;
> > @@ -155,31 +168,38 @@ static uint32_t __store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
> 
> I think we need this here (or in the callers):
> 
> 	if (ahnd)
> 		put_offset(ahnd, obj[2].offset);
>

Yes, we need this in the callers (store_dword(), store_dword_plug(), store_dword_fenced())
especially when I would like to use Simple in the future. I'm going to catch gem handle
there and free offset there.
 
> > @@ -2584,12 +2824,14 @@ static void measure_semaphore_power(int i915, const intel_ctx_t *ctx)
> >		} s_spin[2], s_sema[2];
> >		double baseline, total;
> >		int64_t jiffie = 1;
> > -		igt_spin_t *spin;
> > +		igt_spin_t *spin, *sema[GEM_MAX_ENGINES] = {};
> > +		int i;
> >
> >		if (!gem_class_can_store_dword(i915, signaler->class))
> >			continue;
> >
> >		spin = __igt_spin_new(i915,
> > +				      .ahnd = ahnd,
> >				      .ctx = ctx,
> >				      .engine = signaler->flags,
> >				      .flags = IGT_SPIN_POLL_RUN);
> > @@ -2603,19 +2845,23 @@ static void measure_semaphore_power(int i915, const intel_ctx_t *ctx)
> >		rapl_read(&pkg, &s_spin[1].pkg);
> >
> >		/* Add a waiter to each engine */
> > +		i = 0;
> >		for_each_ctx_engine(i915, ctx, e) {
> > -			igt_spin_t *sema;
> > -
> > -			if (e->flags == signaler->flags)
> > +			if (e->flags == signaler->flags) {
> > +				i++;
> >				continue;
> > +			}
> >
> > -			sema = __igt_spin_new(i915,
> > -					      .ctx = ctx,
> > -					      .engine = e->flags,
> > -					      .dependency = spin->handle);
> > -
> > -			igt_spin_free(i915, sema);
> > +			sema[i] = __igt_spin_new(i915,
> > +						 .ahnd = ahnd,
> > +						 .ctx = ctx,
> > +						 .engine = e->flags,
> > +						 .dependency = spin->handle);
> > +			i++;
> >		}
> > +		for (i = 0; i < GEM_MAX_ENGINES; i++)
> > +			if (sema[i])
> > +				igt_spin_free(i915, sema[i]);
> 
> Did we create this array etc. to avoid the stall when the spin is freed and
> the offset is reused? Or is there a different reason?
> 
> Otherwise this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Yes, we need same offset for .dependency = spin->handle in each sema, 
so I couldn't use Reloc in this case. But with Simple I got same 
batchbuffer offset for each sema what is not we want. We need 
each spin batchbuffer will occupy different offset so we have to
defer freeing spinners. 

I'm going to write that shifting offset strategy you've proposed
in Simple but I little bit afraid to doing this now. When all tests
will be ready to no-reloc then I'm going to change Simple implementation
and then we will see after reloc->simple change in each tests we
will see if this won't introduce regression.

Thanks for review and r-b.

--
Zbigniew
