Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06F411222B
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 08:55:11 +0000 (UTC)
Date: Fri, 1 Apr 2022 14:25:07 +0530
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20220401085507.GA6675@arjun-NUC8i7BEH>
References: <20220401072826.6447-1-arjun.melkaveri@intel.com>
 <20220401082927.GA12046@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401082927.GA12046@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_lmem_swapping: Fix bug
 in test_smem_oom
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 01:59:28PM +0530, Ramalingam C wrote:
> On 2022-04-01 at 12:58:26 +0530, Arjun Melkaveri wrote:
> > ctx was not initialized with all physical engines,
> > after device reopening.
> > This change would resolve assert issue seen in __do_evict.
> > 
> > v2: Added missing intel_ctx_destroy.
> > 
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > ---
> >  tests/i915/gem_lmem_swapping.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> > index 43f0688f..432607b0 100644
> > --- a/tests/i915/gem_lmem_swapping.c
> > +++ b/tests/i915/gem_lmem_swapping.c
> > @@ -428,10 +428,14 @@ static void test_smem_oom(int i915,
> >  
> >  		fill_params(i915, &params, region, 0, 1, true);
> >  
> > +		ctx = intel_ctx_create_all_physical(fd);
> > +		__gem_context_set_persistence(fd, ctx->id, false);
> > +
> igt fixture already creates same kind of context and pass it here. Could
> we reuse it across all the child and parent processes?
> 
> Or we need independed context only?
> 
> Ram.
As we are repoening device , this has to be independed context
"int fd = gem_reopen_driver(i915);" 
> 
> >  		igt_install_exit_handler(smem_oom_exit_handler);
> >  		__do_evict(fd, ctx, &region->region, &params,
> >  			   params.seed + child + 1);
> >  
> > +		intel_ctx_destroy(fd, ctx);
> >  		close(fd);
> >  	}
> >  
> > -- 
> > 2.25.1
> > 
