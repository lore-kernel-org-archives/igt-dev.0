Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8947810FB91
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Mar 2022 06:54:07 +0000 (UTC)
Date: Thu, 31 Mar 2022 08:54:03 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <YkVQC27+2tliyXqf@zkempczy-mobl2>
References: <20210810191425.8391-1-andrzej.turko@linux.intel.com>
 <20210810191425.8391-2-andrzej.turko@linux.intel.com>
 <87h77g6khg.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h77g6khg.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/gem_exec_store: Support gens
 without relocations
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Andrzej Turko <andrzej.turko@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 11:08:11PM -0700, Dixit, Ashutosh wrote:
> On Tue, 10 Aug 2021 12:14:24 -0700, Andrzej Turko wrote:
> >
> > @@ -213,24 +257,41 @@ static void store_all(int fd, const intel_ctx_t *ctx)
> >		execbuf.flags |= I915_EXEC_SECURE;
> >	execbuf.rsvd1 = ctx->id;
> >
> > +	ahnd = intel_allocator_open(fd, ctx->id, INTEL_ALLOCATOR_SIMPLE);
> > +
> >	memset(obj, 0, sizeof(obj));
> >	obj[0].handle = gem_create(fd, nengine*sizeof(uint32_t));
> > +	obj[0].offset = intel_allocator_alloc(ahnd, obj[0].handle,
> > +					      nengine*sizeof(uint32_t), ALIGNMENT);
> > +	obj[0].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS | EXEC_OBJECT_WRITE;
> > +	obj[0].offset = CANONICAL(obj[0].offset);
> >	obj[1].handle = gem_create(fd, 2*nengine*sizeof(batch));
> > -	obj[1].relocation_count = 1;
> > +	obj[1].offset = intel_allocator_alloc(ahnd, obj[1].handle,
> > +					      nengine*sizeof(uint32_t), ALIGNMENT);
> 
> Is this correct, or should the size argument be 2*nengine*sizeof(batch)
> (instead of nengine*sizeof(uint32_t))?

Definitely yes. Further allocations still can fit into hole between objects.
I would remove ALIGNMENT at all. It should work because we now use safe
alignment as you proposed couple of weeks ago (that was very good idea).

--
Zbigniew

> 
> > +	obj[1].offset = CANONICAL(obj[1].offset);
> > +	obj[1].flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
