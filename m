Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3C910E03A
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Dec 2022 11:28:24 +0000 (UTC)
Date: Wed, 7 Dec 2022 12:28:21 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20221207112821.zk4iukip23dadsum@zkempczy-mobl2>
References: <20221205202708.76217-1-zbigniew.kempczynski@intel.com>
 <20221205202708.76217-6-zbigniew.kempczynski@intel.com>
 <Y492jbOnminTPW+Q@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y492jbOnminTPW+Q@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/5] tests/gem_exec_parallel: Avoid
 acquiring offset for overlapping handle
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 06, 2022 at 06:06:21PM +0100, Kamil Konieczny wrote:
> Hi Zbigniew,
> 
> On 2022-12-05 at 21:27:08 +0100, Zbigniew Kempczyński wrote:
> > Subtest @fds incorporates objects created in some context in new context
> -------------- ^ -------------------------------------------- ^
> Looks a little unclear, maybe:
> takes objects and reuse them in new context

Ok, this sounds better.

> 
> Also try to keep in 65 chars per line in commit description.

65 or 72?

> 
> > created on new (reopened) drm fd. This might lead to clash handles
> > (same handle created over different fd,ctx) so acquiring offsets from
> > stateful allocator (reloc is from now on stateful for alloc()/free()
> > ops) might lead to bind same offset for two different objects. Lets
> 
> Maybe these shows some value in having incremental allocator
> like old reloc ? Or using here random allocator ? Just curious.

Previously reloc ahnd returned distinguish offset each call (until wrap
around). @fds test creates handles (lets say 1 - 16), then fd = reopen()
gives you new fd, so handle creation starts from 1. As we need bb handle
will equal to 1, so it will overlap handle (not directly used here, but
via flink open) to which we acquired offsets in main thread. Previously
reloc returned not overlapped offsets, but now when reloc started tracking
alloc()/free() we need to address offset overlapping.

Thanks for the review.

--
Zbigniew

> 
> > use some artificial (last max handle + 1) handle for bb to avoid offset
> > overlapping.
> > 
> 
> With that fixed
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Regards,
> Kamil
> 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  tests/i915/gem_exec_parallel.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
> > index 730fc4a672..429620884b 100644
> > --- a/tests/i915/gem_exec_parallel.c
> > +++ b/tests/i915/gem_exec_parallel.c
> > @@ -75,7 +75,7 @@ static void *thread(void *data)
> >  	struct drm_i915_gem_relocation_entry reloc;
> >  	struct drm_i915_gem_execbuffer2 execbuf;
> >  	const intel_ctx_t *tmp_ctx = NULL;
> > -	uint64_t offset;
> > +	uint64_t offset, bb_offset;
> >  	uint32_t batch[16];
> >  	uint16_t used;
> >  	int fd, i;
> > @@ -136,6 +136,18 @@ static void *thread(void *data)
> >  		execbuf.rsvd1 = t->ctx->id;
> >  	}
> >  
> > +	/*
> > +	 * For FDS we have new drm fd, what means gem_create() for bb returns
> > +	 * handle == 1. As we're using objects from other fd it would overlap,
> > +	 * thus we need to acquire offset for bb from last handle + 1.
> > +	 * Other cases are within same fd, so obj[1].handle will be distinguish
> > +	 * anyway.
> > +	 */
> > +	if (t->flags & FDS)
> > +		bb_offset = get_offset(t->ahnd, t->scratch[NUMOBJ - 1] + 1, 4096, 0);
> > +	else
> > +		bb_offset = get_offset(t->ahnd, obj[1].handle, 4096, 0);
> > +
> >  	used = 0;
> >  	igt_until_timeout(1) {
> >  		unsigned int x = rand() % NUMOBJ;
> > @@ -154,7 +166,7 @@ static void *thread(void *data)
> >  			obj[0].offset = offset;
> >  			obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
> >  					EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> > -			obj[1].offset = get_offset(t->ahnd, obj[1].handle, 4096, 0);
> > +			obj[1].offset = bb_offset;
> >  			obj[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> >  			gem_write(fd, obj[1].handle, 0, batch, sizeof(batch));
> >  		}
> > -- 
> > 2.34.1
> > 
