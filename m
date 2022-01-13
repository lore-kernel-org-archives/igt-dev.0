Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 13 Jan 2022 12:38:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20220113203840.GA30203@jons-linux-dev-box>
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
 <20220113195947.1536897-10-John.C.Harrison@Intel.com>
 <20220113203032.GA13249@jons-linux-dev-box>
 <2c9aca34-34ff-9bbc-f205-42850eef0256@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c9aca34-34ff-9bbc-f205-42850eef0256@intel.com>
Subject: Re: [igt-dev] [PATCH v3 i-g-t 09/15] tests/i915/i915_hangman:
 Remove reliance on context persistance
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John Harrison <john.c.harrison@intel.com>
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 12:42:28PM -0800, John Harrison wrote:
> On 1/13/2022 12:30, Matthew Brost wrote:
> > On Thu, Jan 13, 2022 at 11:59:41AM -0800, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > The hang test was relying on context persitence for no particular
> > > reason. That is, it would set a bunch of background spinners running
> > > then immediately destroy the active contexts but expect the spinners
> > > to keep spinning. With the current implementation of context
> > > persistence in i915, that means that super high priority pings are
> > > sent to each engine at the start of the test. Depending upon the
> > > timing and platform, one of those unexpected pings could cause test
> > > failures.
> > > 
> > > There is no need to require context persitence in this test. So change
> > > to managing the contexts cleanly and only destroying them when they
> > > are no longer in use.
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   tests/i915/i915_hangman.c | 15 ++++++++++-----
> > >   1 file changed, 10 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> > > index 918418760..6601db5f6 100644
> > > --- a/tests/i915/i915_hangman.c
> > > +++ b/tests/i915/i915_hangman.c
> > > @@ -289,27 +289,29 @@ test_engine_hang(const intel_ctx_t *ctx,
> > >   		 const struct intel_execution_engine2 *e, unsigned int flags)
> > >   {
> > >   	const struct intel_execution_engine2 *other;
> > > -	const intel_ctx_t *tmp_ctx;
> > > +	const intel_ctx_t *local_ctx[GEM_MAX_ENGINES];
> > This is fine for now as GEM_MAX_ENGINES is relatively small but what if
> > we change this to large value, let's say 4k? I think the stack could
> > overflow then. Maybe not a concern, maybe it is? I'll leave this up to
> > if this should be kmalloc'd or not in the next rev.
> Seems unlikely we are going that big any time soon. And such stack reduction
> can always be done as part of any huge engine count update. Although, this
> is userland not kernel - you can slap gigabytes on the stack and it won't
> blow up ;).
> 

Right, I realized after I sent this the stack in user land matter far
less. Should be fine.

Matt

> John.
> 
> > Everything else looks good.
> > 
> > With that:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > >   	igt_spin_t *spin, *next;
> > >   	IGT_LIST_HEAD(list);
> > >   	uint64_t ahnd = get_reloc_ahnd(device, ctx->id), ahndN;
> > > +	int num_ctx;
> > >   	igt_skip_on(flags & IGT_SPIN_INVALID_CS &&
> > >   		    gem_engine_has_cmdparser(device, &ctx->cfg, e->flags));
> > >   	/* Fill all the other engines with background load */
> > > +	num_ctx = 0;
> > >   	for_each_ctx_engine(device, ctx, other) {
> > >   		if (other->flags == e->flags)
> > >   			continue;
> > > -		tmp_ctx = intel_ctx_create(device, &ctx->cfg);
> > > -		ahndN = get_reloc_ahnd(device, tmp_ctx->id);
> > > +		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
> > > +		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
> > >   		spin = __igt_spin_new(device,
> > >   				      .ahnd = ahndN,
> > > -				      .ctx = tmp_ctx,
> > > +				      .ctx = local_ctx[num_ctx],
> > >   				      .engine = other->flags,
> > >   				      .flags = IGT_SPIN_FENCE_OUT);
> > > -		intel_ctx_destroy(device, tmp_ctx);
> > > +		num_ctx++;
> > >   		igt_list_move(&spin->link, &list);
> > >   	}
> > > @@ -339,7 +341,10 @@ test_engine_hang(const intel_ctx_t *ctx,
> > >   		igt_spin_free(device, spin);
> > >   		put_ahnd(ahndN);
> > >   	}
> > > +
> > >   	put_ahnd(ahnd);
> > > +	while (num_ctx)
> > > +		intel_ctx_destroy(device, local_ctx[--num_ctx]);
> > >   	check_alive();
> > >   }
> > > -- 
> > > 2.25.1
> > > 
> 
