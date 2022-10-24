Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446F610E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Oct 2022 19:26:58 +0000 (UTC)
Date: Mon, 24 Oct 2022 21:26:53 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Drobnik <karolina.drobnik@intel.com>
Message-ID: <Y1bm/cWa8qMEfy0H@zkempczy-mobl2>
References: <cover.1666337964.git.karolina.drobnik@intel.com>
 <7d94f91418690a9415fca2f68c5add75a488daa7.1666337964.git.karolina.drobnik@intel.com>
 <Y1YzZVpzuX18AsKX@zkempczy-mobl2>
 <39c8f8f0-a420-5e26-1633-143e4d57eb9d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39c8f8f0-a420-5e26-1633-143e4d57eb9d@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/intel_batchbuffer: Add support
 for custom engine layouts
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

On Mon, Oct 24, 2022 at 03:16:16PM +0200, Karolina Drobnik wrote:
> On 24.10.2022 08:40, Zbigniew Kempczyński wrote:
> > On Fri, Oct 21, 2022 at 10:54:42AM +0200, Karolina Drobnik wrote:
> > > Don't assume fixed engine ids and use context configuration in
> > > intel_bb to find the appropriate engine when executing the batchbuffer.
> > > 
> > > Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
> > > ---
> > >   lib/intel_batchbuffer.c | 45 +++++++++++++++++++++++++++++++++--------
> > >   1 file changed, 37 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > > index 70d819aa..20b7e255 100644
> > > --- a/lib/intel_batchbuffer.c
> > > +++ b/lib/intel_batchbuffer.c
> > > @@ -1490,6 +1490,31 @@ static bool aux_needs_softpin(int i915)
> > >   	return intel_gen(intel_get_drm_devid(i915)) >= 12;
> > >   }
> > > +static bool has_ctx_cfg(struct intel_bb *ibb)
> > > +{
> > > +	return ibb->cfg && (ibb->cfg->num_engines > 0);
> > > +}
> > > +
> > > +static bool find_engine(struct intel_bb *ibb, unsigned int class, uint32_t *ring)
> > 
> > Why not:
> > 
> > static uint32_t find_engine(struct intel_bb *ibb, unsigned int class)
> > 
> > then all logic with selecting legacy/user engine hide here in the
> > implementation? Especially you're not using return value in any form.
> 
> I wanted to avoid checking for cfg in two functions, and return early if
> there is no config. But there is another problem with my approach -- we
> silently allow legacy engine id if no suitable engine was found in the
> config. Should we return -1 is such case, and check for it in
> intel_bb_flush_render() and intel_bb_flush_blit()?

If there's no cfg we have legacy context, and if user will call

ring = find_engine(ibb, I915_ENGINE_CLASS_RENDER);

find_engine() should simply return I915_EXEC_RENDER whereas for
I915_ENGINE_CLASS_COPY return I915_EXEC_BLT/DEFAULT according to
current conditional code (and so on for other engines).

When cfg doesn't contain dedicated class configured I think we
should assert because there's no option to satisfy the caller 
according to requested engine.

--
Zbigniew

> 
> All the best,
> Karolina
> 
> > 
> > --
> > Zbigniew
> > 
> > > +{
> > > +	intel_ctx_cfg_t *cfg;
> > > +	int i;
> > > +
> > > +	/* Use legacy engines when there is no context config */
> > > +	if (!has_ctx_cfg(ibb))
> > > +		return false;
> > > +
> > > +	cfg = ibb->cfg;
> > > +	for (i = 0; i < cfg->num_engines; i++) {
> > > +		if (cfg->engines[i].engine_class == class) {
> > > +			*ring = i;
> > > +			return true;
> > > +		}
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > +
> > >   /**
> > >    * intel_bb_create:
> > >    * @i915: drm fd
> > > @@ -2790,34 +2815,38 @@ void intel_bb_flush(struct intel_bb *ibb, uint32_t ring)
> > >    * intel_bb_flush_render:
> > >    * @ibb: batchbuffer
> > >    *
> > > - * If batch is not empty emit batch buffer end, execute on render ring
> > > - * and reset the batch. Context used to execute is batch context.
> > > + * If batch is not empty emit batch buffer end, find the render engine id,
> > > + * execute on the ring and reset the batch. Context used to execute
> > > + * is batch context.
> > >    */
> > >   void intel_bb_flush_render(struct intel_bb *ibb)
> > >   {
> > > +	uint32_t ring = I915_EXEC_RENDER;
> > > +
> > >   	if (intel_bb_emit_flush_common(ibb) == 0)
> > >   		return;
> > > -	intel_bb_exec_with_ring(ibb, I915_EXEC_RENDER);
> > > +	find_engine(ibb, I915_ENGINE_CLASS_RENDER, &ring);
> > > +	intel_bb_exec_with_ring(ibb, ring);
> > >   }
> > >   /*
> > >    * intel_bb_flush_blit:
> > >    * @ibb: batchbuffer
> > >    *
> > > - * If batch is not empty emit batch buffer end, execute on default/blit ring
> > > - * (depends on gen) and reset the batch.
> > > + * If batch is not empty emit batch buffer end, find a suitable ring
> > > + * (depending on gen and context configuration) and reset the batch.
> > >    * Context used to execute is batch context.
> > >    */
> > >   void intel_bb_flush_blit(struct intel_bb *ibb)
> > >   {
> > > -	uint32_t ring = I915_EXEC_DEFAULT;
> > > +	uint32_t ring;
> > >   	if (intel_bb_emit_flush_common(ibb) == 0)
> > >   		return;
> > > -	if (HAS_BLT_RING(ibb->devid))
> > > -		ring = I915_EXEC_BLT;
> > > +	ring = HAS_BLT_RING(ibb->devid) ? I915_EXEC_BLT : I915_EXEC_DEFAULT;
> > > +	find_engine(ibb, I915_ENGINE_CLASS_COPY, &ring);
> > >   	intel_bb_exec_with_ring(ibb, ring);
> > >   }
> > > -- 
> > > 2.25.1
> > > 
