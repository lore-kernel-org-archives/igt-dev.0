Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E07A89AA2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Aug 2021 05:44:31 +0000 (UTC)
Date: Mon, 16 Aug 2021 07:44:25 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210816054425.GC6051@zkempczy-mobl2>
References: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
 <20210813074703.18778-6-zbigniew.kempczynski@intel.com>
 <87tujshkzr.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tujshkzr.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/9] tests/gem_exec_capture: Support
 gens without relocations
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
Cc: igt-dev@lists.freedesktop.org, Andrzej Turko <andrzej.turko@linux.intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 13, 2021 at 06:29:28PM -0700, Dixit, Ashutosh wrote:
> On Fri, 13 Aug 2021 00:46:59 -0700, Zbigniew Kempczyński wrote:
> >
> > @@ -512,10 +545,13 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
> >		.rsvd1 = ctx->id,
> >	};
> >	int64_t timeout = NSEC_PER_SEC; /* 1s, feeling generous, blame debug */
> > -	uint64_t ram, gtt, size = 4 << 20;
> > +	uint64_t ram, gtt, ahnd, size = 4 << 20;
> >	unsigned long count;
> >	int link[2], dummy;
> >
> > +	ahnd = get_reloc_ahnd(fd, ctx->id);
> > +	obj.offset = get_offset(ahnd, obj.handle, 4096, 0);
> > +
> >	igt_require(gem_scheduler_enabled(fd));
> >	igt_require(igt_params_set(fd, "reset", "%u", -1)); /* engine resets! */
> >	igt_require(gem_gpu_reset_type(fd) > 1);
> > @@ -544,7 +580,14 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
> >		fd = gem_reopen_driver(fd);
> >		igt_debug("Submitting large capture [%ld x %dMiB objects]\n",
> >			  count, (int)(size >> 20));
> > -		free(__captureN(fd, dir, ring, size, count, ASYNC));
> > +
> > +		intel_allocator_init();
> > +		/* Reopen the allocator in the new process. */
> > +		ahnd = get_reloc_ahnd(fd, 0);
> > +
> > +		free(__captureN(fd, dir, ahnd, ring, size, count, ASYNC));
> > +		put_ahnd(ahnd);
> > +
> >		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
> >		igt_force_gpu_reset(fd);
> >		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
> > @@ -567,19 +610,26 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
> >	close(link[1]);
> >
> >	gem_quiescent_gpu(fd);
> > +	put_offset(ahnd, obj.handle);
> > +	put_ahnd(ahnd);
> > +	intel_allocator_multiprocess_stop();
> 
> Is this asymmetric intel_allocator_multiprocess_stop without a start
> needed? Otherwise this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

That's remnant from previous patch version, I've incidentally missed it.

--
Zbigniew
