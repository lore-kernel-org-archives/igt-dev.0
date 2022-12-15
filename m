Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B7310E51F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 10:41:24 +0000 (UTC)
Date: Thu, 15 Dec 2022 11:41:20 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20221215104120.y4pgbvxkftdpmtz4@zkempczy-mobl2>
References: <20221212125035.51326-1-zbigniew.kempczynski@intel.com>
 <20221212125035.51326-3-zbigniew.kempczynski@intel.com>
 <d748443c-e770-10d6-42a5-9eb5545dc62d@intel.com>
 <20221214194036.vos2tmk6zse6kqhd@zkempczy-mobl2>
 <e146a7c8-5ff4-f4df-9763-57b86fda4767@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e146a7c8-5ff4-f4df-9763-57b86fda4767@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/i915_blt: Extract blit emit
 functions
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

On Thu, Dec 15, 2022 at 09:42:17AM +0100, Karolina Stolarek wrote:
> On 14.12.2022 20:40, Zbigniew Kempczyński wrote:
> > On Tue, Dec 13, 2022 at 04:39:14PM +0100, Karolina Stolarek wrote:
> > > On 12.12.2022 13:50, Zbigniew Kempczyński wrote:
> > > > Add some flexibility in building user pipelines extracting blitter
> > > > emission code to dedicated functions. Previous blitter functions which
> > > > do one blit-and-execute are rewritten to use those functions.
> > > > Requires usage with stateful allocator (offset might be acquired more
> > > > than one, so it must not change).
> > > > 
> > > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > ---
> > > >    lib/i915/i915_blt.c | 263 ++++++++++++++++++++++++++++++++------------
> > > >    lib/i915/i915_blt.h |  19 ++++
> > > >    2 files changed, 213 insertions(+), 69 deletions(-)
> > > > 
> > > > diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> > > > index 42c28623f9..32ad608775 100644
> > > > --- a/lib/i915/i915_blt.c
> > > > +++ b/lib/i915/i915_blt.c
> > > > @@ -503,58 +503,61 @@ static void dump_bb_ext(struct gen12_block_copy_data_ext *data)
> > > >    }
> > > >    /**
> > > > - * blt_block_copy:
> > > > + * emit_blt_block_copy:
> > > >     * @i915: drm fd
> > > > - * @ctx: intel_ctx_t context
> > > > - * @e: blitter engine for @ctx
> > > >     * @ahnd: allocator handle
> > > >     * @blt: basic blitter data (for TGL/DG1 which doesn't support ext version)
> > > >     * @ext: extended blitter data (for DG2+, supports flatccs compression)
> > > > + * @bb_pos: position at which insert block copy commands
> > > > + * @emit_bbe: emit MI_BATCH_BUFFER_END after block-copy or not
> > > >     *
> > > > - * Function does blit between @src and @dst described in @blt object.
> > > > + * Function inserts block-copy blit into batch at @bb_pos. Allows concatenating
> > > > + * with other commands to achieve pipelining.
> > > >     *
> > > >     * Returns:
> > > > - * execbuffer status.
> > > > + * Next write position in batch.
> > > >     */
> > > > -int blt_block_copy(int i915,
> > > > -		   const intel_ctx_t *ctx,
> > > > -		   const struct intel_execution_engine2 *e,
> > > > -		   uint64_t ahnd,
> > > > -		   const struct blt_copy_data *blt,
> > > > -		   const struct blt_block_copy_data_ext *ext)
> > > > +uint64_t emit_blt_block_copy(int i915,
> > > > +			     uint64_t ahnd,
> > > > +			     const struct blt_copy_data *blt,
> > > > +			     const struct blt_block_copy_data_ext *ext,
> > > > +			     uint64_t bb_pos,
> > > > +			     bool emit_bbe)
> > > >    {
> > > > -	struct drm_i915_gem_execbuffer2 execbuf = {};
> > > > -	struct drm_i915_gem_exec_object2 obj[3] = {};
> > > >    	struct gen12_block_copy_data data = {};
> > > >    	struct gen12_block_copy_data_ext dext = {};
> > > > -	uint64_t dst_offset, src_offset, bb_offset, alignment;
> > > > -	uint32_t *bb;
> > > > -	int i, ret;
> > > > +	uint64_t dst_offset, src_offset, bb_offset;
> > > > +	uint32_t bbe = MI_BATCH_BUFFER_END;
> > > > +	uint8_t *bb;
> > > >    	igt_assert_f(ahnd, "block-copy supports softpin only\n");
> > > >    	igt_assert_f(blt, "block-copy requires data to do blit\n");
> > > > -	alignment = gem_detect_safe_alignment(i915);
> > > > -	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
> > > > -	if (__special_mode(blt) == SM_FULL_RESOLVE)
> > > > -		dst_offset = src_offset;
> > > > -	else
> > > > -		dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
> > > > -	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
> > > > +	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, 0);
> > > > +	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, 0);
> > > > +	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, 0);
> > > 
> > > Why do we pass 0 as object alignment here? In surf-copy and fast-copy we
> > > pass "alignment" in.
> > 
> > After rethinking you're right, caller may instantiate allocator open
> > with unacceptable alignment (like 4K where we use smem and lmem regions)
> > so enforcing safe alignment will protect us from ENOSPC.
> > 
> > Will be sent in v2 after you'll comment reply to previous patch.
> > Anyway thanks for pointing this.
> 
> Right, thanks for taking care of it!
> 
> > 
> > > 
> > > >    	fill_data(&data, blt, src_offset, dst_offset, ext);
> > > > -	i = sizeof(data) / sizeof(uint32_t);
> > > >    	bb = gem_mmap__device_coherent(i915, blt->bb.handle, 0, blt->bb.size,
> > > >    				       PROT_READ | PROT_WRITE);
> > > > -	memcpy(bb, &data, sizeof(data));
> > > > +
> > > > +	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
> > > 
> > > I'd say we need extra space for potential MI_BATCH_BUFFER_END here
> > 
> > I don't assume how many steps (memcpy's to bb) will be in this blit
> > so I incrementally check if there's enough space in bb. See all
> > igt_asserts() below - one for dext and second for bbe (notice that
> > bbe might be not emitted - but this is caller responsibility to handle
> > if emitted instructions consumed all bb dwords).
> 
> I meant the scenario where we pass emit_bbe=false and the caller wants to
> add more data. Now, when I'm thinking about it, it seems like a quite
> abstract scenario from this function perspective, so I think we're good
> here.

Caller receives current position in batch and responsibility to check if
there's enough place in the buffer to add sth there is on its side.

--
Zbigniew

> 
> > 
> > > 
> > > > +	memcpy(bb + bb_pos, &data, sizeof(data));
> > > > +	bb_pos += sizeof(data);
> > > >    	if (ext) {
> > > >    		fill_data_ext(&dext, ext);
> > > > -		memcpy(bb + i, &dext, sizeof(dext));
> > > > -		i += sizeof(dext) / sizeof(uint32_t);
> > > > +		igt_assert(bb_pos + sizeof(dext) < blt->bb.size);
> > > > +		memcpy(bb + bb_pos, &dext, sizeof(dext));
> > > > +		bb_pos += sizeof(dext);
> > > > +	}
> > > > +
> > > > +	if (emit_bbe) {
> > > > +		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
> > > > +		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
> > > > +		bb_pos += sizeof(uint32_t);
> > > >    	}
> > > > -	bb[i++] = MI_BATCH_BUFFER_END;
> > > >    	if (blt->print_bb) {
> > > >    		igt_info("[BLOCK COPY]\n");
> > > > @@ -569,6 +572,44 @@ int blt_block_copy(int i915,
> > > >    	munmap(bb, blt->bb.size);
> > > > +	return bb_pos;
> > > > +}
> > > > +
> > > > +/**
> > > > + * blt_block_copy:
> > > > + * @i915: drm fd
> > > > + * @ctx: intel_ctx_t context
> > > > + * @e: blitter engine for @ctx
> > > > + * @ahnd: allocator handle
> > > > + * @blt: basic blitter data (for TGL/DG1 which doesn't support ext version)
> > > > + * @ext: extended blitter data (for DG2+, supports flatccs compression)
> > > > + *
> > > > + * Function does blit between @src and @dst described in @blt object.
> > > > + *
> > > > + * Returns:
> > > > + * execbuffer status.
> > > > + */
> > > > +int blt_block_copy(int i915,
> > > > +		   const intel_ctx_t *ctx,
> > > > +		   const struct intel_execution_engine2 *e,
> > > > +		   uint64_t ahnd,
> > > > +		   const struct blt_copy_data *blt,
> > > > +		   const struct blt_block_copy_data_ext *ext)
> > > > +{
> > > > +	struct drm_i915_gem_execbuffer2 execbuf = {};
> > > > +	struct drm_i915_gem_exec_object2 obj[3] = {};
> > > > +	uint64_t dst_offset, src_offset, bb_offset;
> > > > +	int ret;
> > > > +
> > > > +	igt_assert_f(ahnd, "block-copy supports softpin only\n");
> > > > +	igt_assert_f(blt, "block-copy requires data to do blit\n");
> > > > +
> > > > +	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, 0);
> > > > +	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, 0);
> > > > +	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, 0);
> > > > +
> > > > +	emit_blt_block_copy(i915, ahnd, blt, ext, 0, true);
> > > > +
> > > >    	obj[0].offset = CANONICAL(dst_offset);
> > > >    	obj[1].offset = CANONICAL(src_offset);
> > > >    	obj[2].offset = CANONICAL(bb_offset > @@ -655,31 +696,30 @@ static
> > > > void dump_bb_surf_ctrl_cmd(const struct
> > > gen12_ctrl_surf_copy_data *data)
> > > >    }
> > > >    /**
> > > > - * blt_ctrl_surf_copy:
> > > > + * emit_blt_ctrl_surf_copy:
> > > >     * @i915: drm fd
> > > > - * @ctx: intel_ctx_t context
> > > > - * @e: blitter engine for @ctx
> > > >     * @ahnd: allocator handle
> > > >     * @surf: blitter data for ctrl-surf-copy
> > > > + * @bb_pos: position at which insert block copy commands
> > > > + * @emit_bbe: emit MI_BATCH_BUFFER_END after ctrl-surf-copy or not
> > > >     *
> > > > - * Function does ctrl-surf-copy blit between @src and @dst described in
> > > > - * @blt object.
> > > > + * Function emits ctrl-surf-copy blit between @src and @dst described in
> > > > + * @blt object at @bb_pos. Allows concatenating with other commands to
> > > > + * achieve pipelining.
> > > >     *
> > > >     * Returns:
> > > > - * execbuffer status.
> > > > + * Next write position in batch.
> > > >     */
> > > > -int blt_ctrl_surf_copy(int i915,
> > > > -		       const intel_ctx_t *ctx,
> > > > -		       const struct intel_execution_engine2 *e,
> > > > -		       uint64_t ahnd,
> > > > -		       const struct blt_ctrl_surf_copy_data *surf)
> > > > +uint64_t emit_blt_ctrl_surf_copy(int i915,
> > > > +				 uint64_t ahnd,
> > > > +				 const struct blt_ctrl_surf_copy_data *surf,
> > > > +				 uint64_t bb_pos,
> > > > +				 bool emit_bbe)
> > > >    {
> > > > -	struct drm_i915_gem_execbuffer2 execbuf = {};
> > > > -	struct drm_i915_gem_exec_object2 obj[3] = {};
> > > >    	struct gen12_ctrl_surf_copy_data data = {};
> > > >    	uint64_t dst_offset, src_offset, bb_offset, alignment;
> > > > +	uint32_t bbe = MI_BATCH_BUFFER_END;
> > > >    	uint32_t *bb;
> > > > -	int i;
> > > >    	igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
> > > >    	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
> > > > @@ -695,12 +735,9 @@ int blt_ctrl_surf_copy(int i915,
> > > >    	data.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
> > > >    	data.dw00.length = 0x3;
> > > > -	src_offset = get_offset(ahnd, surf->src.handle, surf->src.size,
> > > > -				alignment);
> > > > -	dst_offset = get_offset(ahnd, surf->dst.handle, surf->dst.size,
> > > > -				alignment);
> > > > -	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size,
> > > > -			       alignment);
> > > > +	src_offset = get_offset(ahnd, surf->src.handle, surf->src.size, alignment);
> > > > +	dst_offset = get_offset(ahnd, surf->dst.handle, surf->dst.size, alignment);
> > > > +	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size, alignment);
> > > >    	data.dw01.src_address_lo = src_offset;
> > > >    	data.dw02.src_address_hi = src_offset >> 32;
> > > > @@ -710,11 +747,18 @@ int blt_ctrl_surf_copy(int i915,
> > > >    	data.dw04.dst_address_hi = dst_offset >> 32;
> > > >    	data.dw04.dst_mocs = surf->dst.mocs;
> > > > -	i = sizeof(data) / sizeof(uint32_t);
> > > >    	bb = gem_mmap__device_coherent(i915, surf->bb.handle, 0, surf->bb.size,
> > > >    				       PROT_READ | PROT_WRITE);
> > > > -	memcpy(bb, &data, sizeof(data));
> > > > -	bb[i++] = MI_BATCH_BUFFER_END;
> > > > +
> > > > +	igt_assert(bb_pos + sizeof(data) < surf->bb.size);
> > > > +	memcpy(bb + bb_pos, &data, sizeof(data));
> > > > +	bb_pos += sizeof(data);
> > > > +
> > > > +	if (emit_bbe) {
> > > > +		igt_assert(bb_pos + sizeof(uint32_t) < surf->bb.size);
> > > > +		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
> > > > +		bb_pos += sizeof(uint32_t);
> > > > +	}
> > > >    	if (surf->print_bb) {
> > > >    		igt_info("BB [CTRL SURF]:\n");
> > > > @@ -724,8 +768,46 @@ int blt_ctrl_surf_copy(int i915,
> > > >    		dump_bb_surf_ctrl_cmd(&data);
> > > >    	}
> > > > +
> > > >    	munmap(bb, surf->bb.size);
> > > > +	return bb_pos;
> > > > +}
> > > > +
> > > > +/**
> > > > + * blt_ctrl_surf_copy:
> > > > + * @i915: drm fd
> > > > + * @ctx: intel_ctx_t context
> > > > + * @e: blitter engine for @ctx
> > > > + * @ahnd: allocator handle
> > > > + * @surf: blitter data for ctrl-surf-copy
> > > > + *
> > > > + * Function does ctrl-surf-copy blit between @src and @dst described in
> > > > + * @blt object.
> > > > + *
> > > > + * Returns:
> > > > + * execbuffer status.
> > > > + */
> > > > +int blt_ctrl_surf_copy(int i915,
> > > > +		       const intel_ctx_t *ctx,
> > > > +		       const struct intel_execution_engine2 *e,
> > > > +		       uint64_t ahnd,
> > > > +		       const struct blt_ctrl_surf_copy_data *surf)
> > > > +{
> > > > +	struct drm_i915_gem_execbuffer2 execbuf = {};
> > > > +	struct drm_i915_gem_exec_object2 obj[3] = {};
> > > > +	uint64_t dst_offset, src_offset, bb_offset, alignment;
> > > > +
> > > > +	igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
> > > > +	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
> > > > +
> > > > +	alignment = max_t(uint64_t, gem_detect_safe_alignment(i915), 1ull << 16);
> > > > +	src_offset = get_offset(ahnd, surf->src.handle, surf->src.size, alignment);
> > > > +	dst_offset = get_offset(ahnd, surf->dst.handle, surf->dst.size, alignment);
> > > > +	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size, alignment);
> > > > +
> > > > +	emit_blt_ctrl_surf_copy(i915, ahnd, surf, 0, true);
> > > > +
> > > >    	obj[0].offset = CANONICAL(dst_offset);
> > > >    	obj[1].offset = CANONICAL(src_offset);
> > > >    	obj[2].offset = CANONICAL(bb_offset);
> > > > @@ -869,31 +951,31 @@ static void dump_bb_fast_cmd(struct gen12_fast_copy_data *data)
> > > >    }
> > > >    /**
> > > > - * blt_fast_copy:
> > > > + * emit_blt_fast_copy:
> > > >     * @i915: drm fd
> > > > - * @ctx: intel_ctx_t context
> > > > - * @e: blitter engine for @ctx
> > > >     * @ahnd: allocator handle
> > > >     * @blt: blitter data for fast-copy (same as for block-copy but doesn't use
> > > >     * compression fields).
> > > > + * @bb_pos: position at which insert block copy commands
> > > > + * @emit_bbe: emit MI_BATCH_BUFFER_END after fast-copy or not
> > > >     *
> > > > - * Function does fast blit between @src and @dst described in @blt object.
> > > > + * Function emits fast-copy blit between @src and @dst described in @blt object
> > > > + * at @bb_pos. Allows concatenating with other commands to
> > > > + * achieve pipelining.
> > > >     *
> > > >     * Returns:
> > > > - * execbuffer status.
> > > > + * Next write position in batch.
> > > >     */
> > > > -int blt_fast_copy(int i915,
> > > > -		  const intel_ctx_t *ctx,
> > > > -		  const struct intel_execution_engine2 *e,
> > > > -		  uint64_t ahnd,
> > > > -		  const struct blt_copy_data *blt)
> > > > +uint64_t emit_blt_fast_copy(int i915,
> > > > +			    uint64_t ahnd,
> > > > +			    const struct blt_copy_data *blt,
> > > > +			    uint64_t bb_pos,
> > > > +			    bool emit_bbe)
> > > >    {
> > > > -	struct drm_i915_gem_execbuffer2 execbuf = {};
> > > > -	struct drm_i915_gem_exec_object2 obj[3] = {};
> > > >    	struct gen12_fast_copy_data data = {};
> > > >    	uint64_t dst_offset, src_offset, bb_offset, alignment;
> > > > +	uint32_t bbe = MI_BATCH_BUFFER_END;
> > > >    	uint32_t *bb;
> > > > -	int i, ret;
> > > >    	alignment = gem_detect_safe_alignment(i915);
> > > > @@ -931,22 +1013,65 @@ int blt_fast_copy(int i915,
> > > >    	data.dw08.src_address_lo = src_offset;
> > > >    	data.dw09.src_address_hi = src_offset >> 32;
> > > > -	i = sizeof(data) / sizeof(uint32_t);
> > > >    	bb = gem_mmap__device_coherent(i915, blt->bb.handle, 0, blt->bb.size,
> > > >    				       PROT_READ | PROT_WRITE);
> > > > -	memcpy(bb, &data, sizeof(data));
> > > > -	bb[i++] = MI_BATCH_BUFFER_END;
> > > > +	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
> > > > +	memcpy(bb + bb_pos, &data, sizeof(data));
> > > > +	bb_pos += sizeof(data);
> > > > +
> > > > +	if (emit_bbe) {
> > > > +		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
> > > > +		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
> > > > +		bb_pos += sizeof(uint32_t);
> > > > +	}
> > > >    	if (blt->print_bb) {
> > > >    		igt_info("BB [FAST COPY]\n");
> > > > -		igt_info("blit [src offset: %llx, dst offset: %llx\n",
> > > > -			 (long long) src_offset, (long long) dst_offset);
> > > > +		igt_info("src offset: %llx, dst offset: %llx, bb offset: %llx\n",
> > > > +			 (long long) src_offset, (long long) dst_offset,
> > > > +			 (long long) bb_offset);
> > > 
> > > Nitpick: as you're touching these lines anyway, could you delete space after
> > > cast? They're not needed.
> > 
> > I see preferred code style is to join (type)var, strange, imo (type)
> > var looks more readable as var is immediately visible (joined value
> > disturbes my perpception). Anyway ok, I will change this.
> 
> I run checkpatch.pl and it complained a bit:
> > CHECK: No space is necessary after a cast
> 
> Feel free to add my r-b to v2 of this patch:
> Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
> 
> Thanks,
> Karolina
> 
> > 
> > --
> > Zbigniew
> > 
> > 
> > > 
> > > In general, I'm fine with the changes, but would like to clarify a couple of
> > > things above before giving r-b.
> > > 
> > > All the best,
> > > Karolina
> > > 
> > > >    		dump_bb_fast_cmd(&data);
> > > >    	}
> > > >    	munmap(bb, blt->bb.size);
> > > > +	return bb_pos;
> > > > +}
> > > > +
> > > > +/**
> > > > + * blt_fast_copy:
> > > > + * @i915: drm fd
> > > > + * @ctx: intel_ctx_t context
> > > > + * @e: blitter engine for @ctx
> > > > + * @ahnd: allocator handle
> > > > + * @blt: blitter data for fast-copy (same as for block-copy but doesn't use
> > > > + * compression fields).
> > > > + *
> > > > + * Function does fast blit between @src and @dst described in @blt object.
> > > > + *
> > > > + * Returns:
> > > > + * execbuffer status.
> > > > + */
> > > > +int blt_fast_copy(int i915,
> > > > +		  const intel_ctx_t *ctx,
> > > > +		  const struct intel_execution_engine2 *e,
> > > > +		  uint64_t ahnd,
> > > > +		  const struct blt_copy_data *blt)
> > > > +{
> > > > +	struct drm_i915_gem_execbuffer2 execbuf = {};
> > > > +	struct drm_i915_gem_exec_object2 obj[3] = {};
> > > > +	uint64_t dst_offset, src_offset, bb_offset, alignment;
> > > > +	int ret;
> > > > +
> > > > +	alignment = gem_detect_safe_alignment(i915);
> > > > +
> > > > +	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
> > > > +	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
> > > > +	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
> > > > +
> > > > +	emit_blt_fast_copy(i915, ahnd, blt, 0, true);
> > > > +
> > > >    	obj[0].offset = CANONICAL(dst_offset);
> > > >    	obj[1].offset = CANONICAL(src_offset);
> > > >    	obj[2].offset = CANONICAL(bb_offset);
> > > > diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
> > > > index e0e8b52bc2..34db9bb962 100644
> > > > --- a/lib/i915/i915_blt.h
> > > > +++ b/lib/i915/i915_blt.h
> > > > @@ -168,6 +168,13 @@ bool blt_supports_compression(int i915);
> > > >    bool blt_supports_tiling(int i915, enum blt_tiling tiling);
> > > >    const char *blt_tiling_name(enum blt_tiling tiling);
> > > > +uint64_t emit_blt_block_copy(int i915,
> > > > +			     uint64_t ahnd,
> > > > +			     const struct blt_copy_data *blt,
> > > > +			     const struct blt_block_copy_data_ext *ext,
> > > > +			     uint64_t bb_pos,
> > > > +			     bool emit_bbe);
> > > > +
> > > >    int blt_block_copy(int i915,
> > > >    		   const intel_ctx_t *ctx,
> > > >    		   const struct intel_execution_engine2 *e,
> > > > @@ -175,12 +182,24 @@ int blt_block_copy(int i915,
> > > >    		   const struct blt_copy_data *blt,
> > > >    		   const struct blt_block_copy_data_ext *ext);
> > > > +uint64_t emit_blt_ctrl_surf_copy(int i915,
> > > > +				 uint64_t ahnd,
> > > > +				 const struct blt_ctrl_surf_copy_data *surf,
> > > > +				 uint64_t bb_pos,
> > > > +				 bool emit_bbe);
> > > > +
> > > >    int blt_ctrl_surf_copy(int i915,
> > > >    		       const intel_ctx_t *ctx,
> > > >    		       const struct intel_execution_engine2 *e,
> > > >    		       uint64_t ahnd,
> > > >    		       const struct blt_ctrl_surf_copy_data *surf);
> > > > +uint64_t emit_blt_fast_copy(int i915,
> > > > +			    uint64_t ahnd,
> > > > +			    const struct blt_copy_data *blt,
> > > > +			    uint64_t bb_pos,
> > > > +			    bool emit_bbe);
> > > > +
> > > >    int blt_fast_copy(int i915,
> > > >    		  const intel_ctx_t *ctx,
> > > >    		  const struct intel_execution_engine2 *e,
