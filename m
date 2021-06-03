Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3253C6F473
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:50:56 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o5so6984342edc.5
 for <igt-dev@lists.freedesktop.org>; Thu, 03 Jun 2021 05:50:56 -0700 (PDT)
Date: Thu, 3 Jun 2021 14:50:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YLjQLKB2vjiFjfq/@phenom.ffwll.local>
References: <20210428202143.1388452-1-jason@jlekstrand.net>
 <20210428202143.1388452-5-jason@jlekstrand.net>
 <YLjBAdcwngkAuF3e@phenom.ffwll.local>
 <YLjBN0P146kxsKQZ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLjBN0P146kxsKQZ@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/i915/gem_exec_balancer: Add a
 test for combind balancing and bonding
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 01:47:03PM +0200, Daniel Vetter wrote:
> On Thu, Jun 03, 2021 at 01:46:09PM +0200, Daniel Vetter wrote:
> > On Wed, Apr 28, 2021 at 03:21:43PM -0500, Jason Ekstrand wrote:
> > 
> > In the subject of this one: s/combind/combined/
> > 
> > I think that's fairly complete sanity check. On the series:
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > I think best if you include this in your overall igt set (can't be CI'ed
> > otherwise) and the Test-With: check this together with your kernel set.
> 
> Oh and sobs missing.

One more: For the new tests please add igt_describe(). Also since you
looked at these quite a bit, would be really great to do a follow-up patch
and roll out igt_describe for the ctx tests you're touching. At least
where it's obvious what's getting tested.
-Daniel

> -Daniel
> 
> > 
> > Cheers, Daniel
> > 
> > > ---
> > >  tests/i915/gem_exec_balancer.c | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > > 
> > > diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> > > index 4f1fa390..b594e2e1 100644
> > > --- a/tests/i915/gem_exec_balancer.c
> > > +++ b/tests/i915/gem_exec_balancer.c
> > > @@ -167,6 +167,7 @@ static uint32_t batch_create(int i915)
> > >  static void invalid_balancer(int i915)
> > >  {
> > >  	I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(balancer, 64);
> > > +	I915_DEFINE_CONTEXT_ENGINES_BOND(bond, 1);
> > >  	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 64);
> > >  	struct drm_i915_gem_context_param p = {
> > >  		.param = I915_CONTEXT_PARAM_ENGINES,
> > > @@ -283,6 +284,31 @@ static void invalid_balancer(int i915)
> > >  
> > >  		munmap(ptr + 4096, 4096);
> > >  
> > > +		if (count >= 2) {
> > > +			/* You can't bond to a balanced engine */
> > > +			memset(&bond, 0, sizeof(bond));
> > > +			bond.base.name = I915_CONTEXT_ENGINES_EXT_BOND;
> > > +			bond.master = ci[0];
> > > +			bond.virtual_index = 0;
> > > +			bond.num_bonds = 1;
> > > +			bond.engines[0] = ci[1];
> > > +
> > > +			balancer.base.next_extension = to_user_pointer(&bond);
> > > +			balancer.engine_index = 0;
> > > +			balancer.num_siblings = count;
> > > +			memcpy(balancer.engines, ci, count * sizeof(*ci));
> > > +
> > > +			memset(&engines, 0, sizeof(engines));
> > > +			engines.engines[0].engine_class = I915_ENGINE_CLASS_INVALID;
> > > +			engines.engines[0].engine_instance = I915_ENGINE_CLASS_INVALID_NONE;
> > > +			engines.extensions = to_user_pointer(&balancer);
> > > +
> > > +			p.size = (sizeof(struct i915_context_param_engines) +
> > > +				  sizeof(*engines.engines));
> > > +
> > > +			igt_assert_eq(__gem_context_set_param(i915, &p), -EINVAL);
> > > +		}
> > > +
> > >  		gem_context_destroy(i915, p.ctx_id);
> > >  		free(ci);
> > >  	}
> > > -- 
> > > 2.31.1
> > > 
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
