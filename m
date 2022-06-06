Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D204910F64D
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 06:26:50 +0000 (UTC)
Date: Mon, 6 Jun 2022 08:26:38 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Message-ID: <Yp2eHrFJPrLHX4vR@zkempczy-mobl2>
References: <20220603075325.16381-1-zbigniew.kempczynski@intel.com>
 <20220603075325.16381-3-zbigniew.kempczynski@intel.com>
 <YpoiBpC8L9thG7DU@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YpoiBpC8L9thG7DU@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_exec_schedule:
 Execute spinner in valid context
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

On Fri, Jun 03, 2022 at 05:00:22PM +0200, Kamil Konieczny wrote:
> Hi Zbigniew,
> 
> On 2022-06-03 at 09:53:25 +0200, Zbigniew Kempczyński wrote:
> > Running spinner in default context is not correct because it can
> > contain less engines than spinner expect. Fix this by setting
> > two contexts with identical set of engines.
> > 
> > Fixes: semaphore-noskip and u-semaphore-noskip
> 
> Please add here what did you changed in v2.
> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/i915/gem_exec_schedule.c | 21 ++++++++++++---------
> >  1 file changed, 12 insertions(+), 9 deletions(-)
> > 
> > diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> > index 43d9d06c09..db3637e88a 100644
> > --- a/tests/i915/gem_exec_schedule.c
> > +++ b/tests/i915/gem_exec_schedule.c
> > @@ -1200,16 +1200,17 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
> >  {
> >  	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
> >  	const struct intel_execution_engine2 *outer, *inner;
> > -	const intel_ctx_t *ctx;
> > +	const intel_ctx_t *ctx0, *ctx1;
> >  	uint64_t ahnd;
> >  
> >  	igt_require(gen >= 6); /* MI_STORE_DWORD_IMM convenience */
> >  
> > -	ctx = intel_ctx_create(i915, cfg);
> > -	ahnd = get_reloc_ahnd(i915, ctx->id);
> > +	ctx0 = intel_ctx_create(i915, cfg);
> > +	ctx1 = intel_ctx_create(i915, cfg);
> > +	ahnd = get_reloc_ahnd(i915, ctx0->id);
> >  
> > -	for_each_ctx_engine(i915, ctx, outer) {
> > -	for_each_ctx_engine(i915, ctx, inner) {
> > +	for_each_ctx_engine(i915, ctx0, outer) {
> > +	for_each_ctx_engine(i915, ctx0, inner) {
> 
> I do not quite understand the difference here between old code,
> maybe in second for_each use ctx1, inner ?

Take a look how this test looked like at b0789992cefc3b08fb5fd891522a116b367c3963.

> 
> >  		struct drm_i915_gem_exec_object2 obj[3];
> >  		struct drm_i915_gem_execbuffer2 eb;
> >  		uint32_t handle, *cs, *map;
> > @@ -1219,10 +1220,10 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
> >  		    !gem_class_can_store_dword(i915, inner->class))
> >  			continue;
> >  
> > -		chain = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
> > +		chain = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx0,
> >  				       .engine = outer->flags, .flags = flags);
> >  
> > -		spin = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
> > +		spin = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx0,
> >  				      .engine = inner->flags, .flags = flags);
> >  		igt_spin_end(spin); /* we just want its address for later */
> >  		gem_sync(i915, spin->handle);
> > @@ -1256,7 +1257,7 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
> >  		memset(&eb, 0, sizeof(eb));
> >  		eb.buffer_count = 3;
> >  		eb.buffers_ptr = to_user_pointer(obj);
> > -		eb.rsvd1 = ctx->id;
> > +		eb.rsvd1 = ctx1->id;
> 
> Here is the only use of ctx1, and then:
> 
> >  		eb.flags = inner->flags;
> 
> You use flags from ctx0 here ? (see above comment on for_each)

In this test most important is two context have same engines. In former version of
test we got engine clone ioctl(), here we just create two contexts with same 
engine set. Doesn't matter you'll choose ctx0 or ctx1 for for_each_ctx_engine(),
you'll iterate over same set.

Before intel_ctx_t times, test created new context with engines cloned from default
context. Right now default context use is limited and for this test we need to create
two contexts which engine pattern comes from 'cfg'.

In original code 'chain' + 'spin' were executed in default context, same as last
execbuf spinner. In cloned context only spinner which is in code starting at comment

/* port0: implicit semaphore from engine */

was started in cloned context.

--
Zbigniew

> 
> Regards,
> Kamil
> 
> >  		gem_execbuf(i915, &eb);
> >  
> > @@ -1269,6 +1270,7 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
> >  		eb.buffer_count = 2;
> >  		eb.buffers_ptr = to_user_pointer(obj);
> >  		eb.flags = inner->flags;
> > +		eb.rsvd1 = ctx0->id;
> >  		gem_execbuf(i915, &eb);
> >  
> >  		igt_spin_set_timeout(chain, NSEC_PER_SEC / 100);
> > @@ -1280,7 +1282,8 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
> >  	}
> >  	}
> >  
> > -	intel_ctx_destroy(i915, ctx);
> > +	intel_ctx_destroy(i915, ctx0);
> > +	intel_ctx_destroy(i915, ctx1);
> >  	put_ahnd(ahnd);
> >  }
> >  
> > -- 
> > 2.32.0
> > 
