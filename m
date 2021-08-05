Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D41A6E3F7
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Aug 2021 08:46:49 +0000 (UTC)
Date: Thu, 5 Aug 2021 10:46:41 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210805084641.GG3295@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-14-zbigniew.kempczynski@intel.com>
 <875ywktwt8.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875ywktwt8.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 13/52] tests/gem_ctx_exec: Adopt to
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

On Wed, Aug 04, 2021 at 08:06:11PM -0700, Dixit, Ashutosh wrote:
> On Mon, 26 Jul 2021 12:59:47 -0700, Zbigniew Kempczyński wrote:
> 
> With the couple of nits below addressed, this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> > @@ -345,10 +354,14 @@ static void close_race(int i915)
> >	const intel_ctx_t **ctx;
> >	uint32_t *ctx_id;
> >	igt_spin_t *spin;
> > +	uint64_t ahnd;
> >
> >	/* Check we can execute a polling spinner */
> >	base_ctx = intel_ctx_create(i915, NULL);
> > -	igt_spin_free(i915, igt_spin_new(i915, .ctx = base_ctx,
> > +	ahnd = get_reloc_ahnd(i915, base_ctx->id);
> > +	igt_spin_free(i915, igt_spin_new(i915,
> > +					 .ahnd = ahnd,
> > +					 .ctx = base_ctx,
> >					 .flags = IGT_SPIN_POLL_RUN));
> 
> Missing put_ahnd here I think.

We may free ahnd here (internally allocator structure will be free
due to refcnt == 0), then first child which will call get_reloc_ahnd()
will recreate this. Or we may keep this allocator structure till the
end of the test - I will put put_ahnd() there. 
 
> 
> > @@ -403,6 +419,7 @@ static void close_race(int i915)
> >		}
> >
> >		igt_spin_free(i915, spin);
> > +		put_ahnd(ahnd);
> 
> nit: prefer to move it next to intel_ctx_destroy.

I need to add this there, not move. put_ahnd() in children will
decrement refcount of allocator structure then last put_ahnd()
in main process will lead to freeing it. 

> 
> > @@ -474,11 +491,22 @@ igt_main
> >	igt_subtest("basic-nohangcheck")
> >		nohangcheck_hostile(fd);
> >
> > -	igt_subtest("basic-close-race")
> > -		close_race(fd);
> > +	igt_subtest_group {
> > +		igt_fixture {
> > +			intel_allocator_multiprocess_start();
> > +		}
> > +
> > +		igt_subtest("basic-close-race")
> > +				close_race(fd);
> 
> indent

Ack.

Thanks for review!

--
Zbigniew
