Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB1C6E15E
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 17:37:02 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Thu, 10 Jun 2021 17:36:57 +0000
Message-ID: <32458786c3f94959e45731bcd1d4f0277ece63e8.camel@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-9-alan.previn.teres.alexis@intel.com>
 <YLonm/ledRfwelqV@intel.com>
In-Reply-To: <YLonm/ledRfwelqV@intel.com>
Content-Language: en-US
Content-ID: <A2DC45DD0449FE4E9C99B6B8E96A4B2A@namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 08/17] Enable protected session cmd in
 gen12_render_copyfunc
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
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2021-06-04 at 09:16 -0400, Rodrigo Vivi wrote:
> On Tue, May 18, 2021 at 03:33:35AM -0700, Alan Previn wrote:
> > 1. In _gen9_render_op, check if the incoming batchbuffer
> >    is marked with pxp enabled. If so, insert MI_SET_APPID
> >    along with PIPE_CONTROL instructions at the start and
> >    end of the rendering operation in the command buffer.
> > 
> > 2. The two PIPE_CONTROLs will enable protected memory
> >    at the start of the batch and disabling protected
> >    memory at the end of it. These PIPE_CONTROLs require a
> >    Post-Sync operation with a write to memory for hardware
> >    to accept.
> > 
> > 3. In order to satisfy #2, _gen9_render_op uses unused
> >    regions of the ibb buffer for the PIPE_CONTROL PostSync
> >    write to memory (no different from how other 3d states
> >    are being referenced).
> > 
> > 4. _gen9_render_op shall check the incoming surface
> >    buffers for "is_protected" flag and if its set, it
> >    will mark the SURFACE_STATE's MOCS field accordingly.
> > 
> > NOTE: _gen9_render_op needs to program the HW to enable
> > the PXP session as part of the rendering batch buffer
> > because the HW requires that enabling/disabling protected
> > memory access must be programmed in pairs within the same
> > "dispatch of rendering commands" to HW.
> > 
> > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > ---
> >  lib/rendercopy_gen9.c | 72 ++++++++++++++++++++++++++++++++++++++-
> > ----
> >  1 file changed, 65 insertions(+), 7 deletions(-)
> > 
> > diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> > index eecf73d3..bfcf311b 100644
> > --- a/lib/rendercopy_gen9.c
> > +++ b/lib/rendercopy_gen9.c
> > @@ -19,7 +19,8 @@
> >  #include "intel_bufops.h"
> >  #include "intel_batchbuffer.h"
> >  #include "intel_io.h"
> > -#include "rendercopy.h"
> > +#include "igt.h"
> > +#include "i915/gem.h"
> >  #include "gen9_render.h"
> >  #include "intel_reg.h"
> >  #include "igt_aux.h"
> > @@ -152,6 +153,8 @@ gen8_bind_buf(struct intel_bb *ibb, const
> > struct intel_buf *buf, int is_dst) {
> >  		ss->ss0.tiled_mode = 3;
> >  
> >  	ss->ss1.memory_object_control = I915_MOCS_PTE << 1;
> > +	if (intel_buf_pxp(buf))
> > +		ss->ss1.memory_object_control |= 1;
> >  
> >  	if (buf->tiling == I915_TILING_Yf)
> >  		ss->ss5.trmode = 1;
> > @@ -873,6 +876,53 @@ static void gen8_emit_primitive(struct
> > intel_bb *ibb, uint32_t offset)
> >  	intel_bb_out(ibb, 0);	/* index buffer offset, ignored */
> >  }
> >  
> +#define GFX_OP_PIPE_CONTROL    ((3 << 29) | (3 << 27) | (2 << 24))
> 
> there's no len defined here...

The calling function (gen12_emit_pxp_state) uses this CMD in 2 ways
where each of them have different lengths. 

Method A : When setting the APP_ID (done before enabling PXP), we call
PIPE_CONTROL with just a FLUSH_ENABLE which has a len == 0 (2 DWORDS). 

Method B : Subsequently, when enabling or disabling PXP, we need to
ensure PIPE_CONTROL op a memory write invalidation + flush which
requires additional post sync up to dest buffer offset.

I didn't want to create two macro's for each usage which is why I didnt
include the length into the macro - which i have seen in other IGT
tests (so i assumed there wasnt a hard rule).

> 
> > +#define PIPE_CONTROL_CS_STALL	            (1 << 20)
> > +#define PIPE_CONTROL_RENDER_TARGET_FLUSH    (1 << 12)
> > +#define PIPE_CONTROL_FLUSH_ENABLE           (1 << 7)
> > +#define PIPE_CONTROL_DATA_CACHE_INVALIDATE  (1 << 5)
> > +#define PIPE_CONTROL_PROTECTEDPATH_DISABLE  (1 << 27)
> > +#define PIPE_CONTROL_PROTECTEDPATH_ENABLE   (1 << 22)
> > +#define PIPE_CONTROL_POST_SYNC_OP           (1 << 14)
> > +#define PIPE_CONTROL_POST_SYNC_OP_STORE_DW_IDX (1 << 21)
> > +#define PS_OP_TAG_START                     0x1234fed0
> > +#define PS_OP_TAG_END                       0x5678cbaf
> > +static void gen12_emit_pxp_state(struct intel_bb *ibb, bool
> > enable,
> > +		 uint32_t pxp_write_op_offset)
> > +{
> > +	uint32_t pipe_ctl_flags;
> > +	uint32_t set_app_id, ps_op_id;
> > +
> > +	if (enable) {
> > +		pipe_ctl_flags = PIPE_CONTROL_FLUSH_ENABLE;
> > +		intel_bb_out(ibb, GFX_OP_PIPE_CONTROL);
> 
> ... so, I believe this one should be GFX_OP_PIPE_CONTROL | 1
> 
> (len - 2) = (3 - 2) = 1
No, this is Method A - see intel_bb_out is being called only twice:
	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL);
	intel_bb_out(ibb, pipe_ctl_flags);
So "len - 2" = "2 - 2" = 0;

> 
> > +		intel_bb_out(ibb, pipe_ctl_flags);
> > +
> > +		set_app_id =  MI_SET_APPID |
> > +			      APPTYPE(intel_bb_pxp_apptype(ibb)) |
> > +			      APPID(intel_bb_pxp_appid(ibb));
> > +		intel_bb_out(ibb, set_app_id);
> > +
> > +		pipe_ctl_flags = PIPE_CONTROL_PROTECTEDPATH_ENABLE;
> > +		ps_op_id = PS_OP_TAG_START;
> > +	} else {
> > +		pipe_ctl_flags = PIPE_CONTROL_PROTECTEDPATH_DISABLE;
> > +		ps_op_id = PS_OP_TAG_END;
> > +	}
> > +
> > +	pipe_ctl_flags |= (PIPE_CONTROL_CS_STALL |
> > +			   PIPE_CONTROL_RENDER_TARGET_FLUSH |
> > +			   PIPE_CONTROL_DATA_CACHE_INVALIDATE |
> > +			   PIPE_CONTROL_POST_SYNC_OP);
> > +	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL | 4);
> 
> and this one should be GFX_OP_PIPE_CONTROL | 2
> 
> (len - 2) = (4 - 2) = 2
> 
> but to be honest, I always get lost and confused with these
> pipe_control len...
> specially looking IGT tests, many of them don't make sense to me.
> 
> However I see, at least, some inconsistency here between these 2
> pipe_control
> emissions. What am I missing?
> 

This case uses Method B (where we require a PIPE_CONTROL with write
invalidation + flush), I am using a Post-Sync-Op as to a inline gfx
offset but the Post-Sync-Op also needs the inline "Immediate Data" to
be written. Both the gfx-offset and the immediate data are 64-bits
totaling 4 DWORDS.

The first 2-DWs (gfx offset) are populated as part of the
"intel_bb_emit_reloc" call (this function automatically uses 64 bit for
Gen12). The second 2-DWs (immediate data) are populated via the
intel_bb_out(ibb, ps_op_id) calls - i am repeating the same signature
twice (but different signatures for enabling vs disabling - see #define
with suffix '_TAG' above).

Therefore a total of 6 dwords are being populated (2=cmds, 2=gfx-
offsets, 2=immediate-data). So "len - 2" = "6 - 2" = 4;

That said, i dont see anything wrong with this patch - unless you
prefer me to replace the GFX_OP_PIPE_CONTROL macro with 2 distinct
ones:
GFX_OP_PIPE_CONTROL_SIMPLEFLUSH //where len==0
GFX_OP_PIPE_CONTROL_PSO_WRITE2OFFSET //where len==4 

NOTE: I have seen at least one other test define the macro without the
size and populate the size based on usage like like what is currently
done here.

> > +	intel_bb_out(ibb, pipe_ctl_flags);
> > +	intel_bb_emit_reloc(ibb, ibb->handle, 0,
> > I915_GEM_DOMAIN_COMMAND,
> > +			    (enable ? pxp_write_op_offset :
> > (pxp_write_op_offset+8)),
> > +			    ibb->batch_offset);
> > +	intel_bb_out(ibb, ps_op_id);
> > +	intel_bb_out(ibb, ps_op_id);
> > +}
> > +
> >  /* The general rule is if it's named gen6 it is directly copied
> > from
> >   * gen6_render_copyfunc.
> >   *
> > @@ -922,6 +972,7 @@ void _gen9_render_op(struct intel_bb *ibb,
> >  	uint32_t vertex_buffer;
> >  	uint32_t aux_pgtable_state;
> >  	bool fast_clear = !src;
> > +	uint32_t pxp_scratch_offset;
> >  
> >  	if (!fast_clear)
> >  		igt_assert(src->bpp == dst->bpp);
> > @@ -950,8 +1001,12 @@ void _gen9_render_op(struct intel_bb *ibb,
> >  	aux_pgtable_state = gen12_create_aux_pgtable_state(ibb,
> > aux_pgtable_buf);
> >  
> >  	/* TODO: there is other state which isn't setup */
> > +	pxp_scratch_offset = intel_bb_offset(ibb);
> >  	intel_bb_ptr_set(ibb, 0);
> >  
> > +	if (intel_bb_pxp_enabled(ibb))
> > +		gen12_emit_pxp_state(ibb, true, pxp_scratch_offset);
> > +
> >  	/* Start emitting the commands. The order roughly follows the
> > mesa blorp
> >  	 * order */
> >  	intel_bb_out(ibb, G4X_PIPELINE_SELECT | PIPELINE_SELECT_3D |
> > @@ -963,13 +1018,12 @@ void _gen9_render_op(struct intel_bb *ibb,
> >  		for (int i = 0; i < 4; i++) {
> >  			intel_bb_out(ibb, MI_STORE_DWORD_IMM);
> >  			intel_bb_emit_reloc(ibb, dst->handle,
> > -					    I915_GEM_DOMAIN_RENDER,
> > I915_GEM_DOMAIN_RENDER,
> > -                                            dst->cc.offset +
> > i*sizeof(float),
> > -					    dst->addr.offset);
> > +					I915_GEM_DOMAIN_RENDER,
> > I915_GEM_DOMAIN_RENDER,
> > +					dst->cc.offset +
> > i*sizeof(float),
> > +					dst->addr.offset);
> >  			intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
> > -               }
> > -       }
> > -
> > +		}
> > +	}
> >  
> >  	gen8_emit_sip(ibb);
> >  
> > @@ -1023,10 +1077,14 @@ void _gen9_render_op(struct intel_bb *ibb,
> >  	gen8_emit_vf_topology(ibb);
> >  	gen8_emit_primitive(ibb, vertex_buffer);
> >  
> > +	if (intel_bb_pxp_enabled(ibb))
> > +		gen12_emit_pxp_state(ibb, false, pxp_scratch_offset);
> > +
> >  	intel_bb_emit_bbe(ibb);
> >  	intel_bb_exec(ibb, intel_bb_offset(ibb),
> >  		      I915_EXEC_RENDER | I915_EXEC_NO_RELOC, false);
> >  	dump_batch(ibb);
> > +
> >  	intel_bb_reset(ibb, false);
> >  }
> >  
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
