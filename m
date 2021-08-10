Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3610C89DFE
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 03:17:07 +0000 (UTC)
Date: Tue, 10 Aug 2021 05:17:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210810031701.GC3738@zkempczy-mobl2>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
 <20210809130533.27759-56-zbigniew.kempczynski@intel.com>
 <87r1f21g6r.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r1f21g6r.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 55/65] tests/i915_pm_rps: Alter to
 use no-reloc
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

On Mon, Aug 09, 2021 at 02:06:20PM -0700, Dixit, Ashutosh wrote:
> On Mon, 09 Aug 2021 06:05:23 -0700, Zbigniew Kempczyński wrote:
> >
> > diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
> > index f51a47479..ada06aa94 100644
> > --- a/tests/i915/i915_pm_rps.c
> > +++ b/tests/i915/i915_pm_rps.c
> > @@ -250,6 +250,10 @@ static void load_helper_run(enum load load)
> >		igt_spin_t *spin[2] = {};
> >		bool prev_load;
> >		uint32_t handle;
> > +		uint64_t ahnd;
> > +
> > +		intel_allocator_init();
> 
> OK, this extra step is needed because there is no igt_constructor
> here. Also each child process is completely independent.

Yes, we want to detach from IPC and allocate offsets locally in the 
child process.

> 
> > @@ -542,11 +547,14 @@ static void boost_freq(int fd, int *boost_freqs)
> >  {
> >	int64_t timeout = 1;
> >	igt_spin_t *load;
> > +	/* We need to keep dependency spin offset for load->handle */
> > +	uint64_t ahnd = get_simple_l2h_ahnd(fd, 0);
> >
> > -	load = igt_spin_new(fd);
> > +	//get_offset(ahnd, 1000, 0x1000000, 0);
> 
> Please delete this line, with that:

Oh, that remains because on SKL (I'm testing this on my Nuc device)
there's risk to allocate offset used internally in shadow buffer.
I've incidentally left this because adding this allows test to pass
on blt0 instead of getting stuck. But this hides the problem so it 
should be removed allowing us to hang. I've enqueued test to add
to gem_softpin which will reveal the problem.

Thanks for catching this line and r-b.
--
Zbigniew

> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
