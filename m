Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C082A6FDC0
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Nov 2021 08:23:59 +0000 (UTC)
Date: Tue, 2 Nov 2021 09:23:55 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211102082355.GA8431@zkempczy-mobl2>
References: <20211028182322.34133-1-zbigniew.kempczynski@intel.com>
 <20211028182322.34133-3-zbigniew.kempczynski@intel.com>
 <87h7czb1z7.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h7czb1z7.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/gem_sync: Use softpin path
 for no-reloc gens
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

On Fri, Oct 29, 2021 at 08:55:40PM -0700, Dixit, Ashutosh wrote:
> On Thu, 28 Oct 2021 11:23:22 -0700, Zbigniew Kempczyński wrote:
> >
> > @@ -384,6 +401,8 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >		   int timeout, int wlen)
> >  {
> >	struct intel_engine_data ied;
> > +	uint64_t ahnd0 = get_reloc_ahnd(fd, 0);
> > +	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
> >
> >	ied = list_store_engines(fd, ctx, ring);
> >	igt_require(ied.nengines);
> > @@ -397,8 +416,14 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >		unsigned long cycles;
> >		igt_spin_t *spin[2];
> >
> > +		ahnd0 = get_reloc_ahnd(fd, 0);
> > +		ahnd = get_reloc_ahnd(fd, ctx->id);
> > +
> >		memset(&object, 0, sizeof(object));
> >		object.handle = gem_create(fd, 4096);
> > +		object.offset = get_offset(ahnd, object.handle, 4096, 0);
> > +		if (ahnd)
> > +			object.offset = EXEC_OBJECT_PINNED;
> >		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
> >
> >		memset(&execbuf, 0, sizeof(execbuf));
> > @@ -408,12 +433,14 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >		execbuf.rsvd1 = ctx->id;
> >
> >		spin[0] = __igt_spin_new(fd,
> > +					 .ahnd = ahnd,
> >					 .engine = execbuf.flags,
> >					 .flags = (IGT_SPIN_POLL_RUN |
> >						   IGT_SPIN_FAST));
> >		igt_assert(igt_spin_has_poll(spin[0]));
> >
> >		spin[1] = __igt_spin_new(fd,
> > +					 .ahnd = ahnd,
> >					 .engine = execbuf.flags,
> >					 .flags = (IGT_SPIN_POLL_RUN |
> >						   IGT_SPIN_FAST));
> > @@ -490,8 +517,13 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >		igt_spin_free(fd, spin[1]);
> >		igt_spin_free(fd, spin[0]);
> >		gem_close(fd, object.handle);
> > +		put_offset(ahnd, object.handle);
> > +		put_ahnd(ahnd);
> > +		put_ahnd(ahnd0);
> >	}
> >	igt_waitchildren_timeout(2*timeout, NULL);
> > +	put_ahnd(ahnd);
> > +	put_ahnd(ahnd0);
> >	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
> >  }
> 
> Sorry don't see ahnd0 being used in active_wakeup_ring() above? Rest looks
> fine but please let me know about this one issue. Thanks.

Good spot - you're right - it should be used in spinner. I'm going send
in new series.

Thanks for the review.
--
Zbigniew
