Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D63A6E2C0
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Aug 2021 08:15:02 +0000 (UTC)
Date: Thu, 5 Aug 2021 10:14:49 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210805081449.GF3295@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-11-zbigniew.kempczynski@intel.com>
 <87a6lwtziq.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a6lwtziq.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 10/52] tests/gem_busy: Adopt to use
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

On Wed, Aug 04, 2021 at 07:07:41PM -0700, Dixit, Ashutosh wrote:
> On Mon, 26 Jul 2021 12:59:44 -0700, Zbigniew Kempczyński wrote:
> >
> > For newer gens we're not able to rely on relocations. Adopt to use
> > offsets acquired from the allocator.
> >
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  tests/i915/gem_busy.c | 35 +++++++++++++++++++++++++++++++----
> >  1 file changed, 31 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
> > index f0fca0e8a..51ec5ad04 100644
> > --- a/tests/i915/gem_busy.c
> > +++ b/tests/i915/gem_busy.c
> > @@ -108,6 +108,7 @@ static void semaphore(int fd, const intel_ctx_t *ctx,
> >	uint32_t handle[3];
> >	uint32_t read, write;
> >	uint32_t active;
> > +	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
> >	unsigned i;
> >
> >	handle[TEST] = gem_create(fd, 4096);
> > @@ -117,6 +118,7 @@ static void semaphore(int fd, const intel_ctx_t *ctx,
> >	/* Create a long running batch which we can use to hog the GPU */
> >	handle[BUSY] = gem_create(fd, 4096);
> >	spin = igt_spin_new(fd,
> > +			    .ahnd = ahnd,
> >			    .ctx = ctx,
> >			    .engine = e->flags,
> >			    .dependency = handle[BUSY]);
> 
> Missing put_ahnd.
> 
> > @@ -428,6 +442,7 @@ igt_main
> >
> >	igt_subtest_group {
> >		igt_fixture {
> > +			intel_allocator_multiprocess_start();
> >			igt_fork_hang_detector(fd);
> >		}
> >
> > @@ -445,6 +460,21 @@ igt_main
> >			}
> >		}
> >
> 
> Just above here is basic() which doesn't have a fork. Is it ok to do
> intel_allocator_multiprocess_start/stop when we don't have a fork? If yes,
> then can we _always_ do intel_allocator_multiprocess_start/stop rather than
> only when we have fork? Thanks.

It seems that basic() is called within same dynamic subtest "busy", so migrating
it outside of this (there's all() with igt_fork inside "busy") would split
that subtest. I'm not sure we want to do this.

--
Zbigniew
