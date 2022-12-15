Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4BF10E4F8
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 08:43:07 +0000 (UTC)
Message-ID: <9f486f1d-e942-9d20-75fa-253998717b30@intel.com>
Date: Thu, 15 Dec 2022 09:42:56 +0100
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20221212125035.51326-1-zbigniew.kempczynski@intel.com>
 <20221212125035.51326-4-zbigniew.kempczynski@intel.com>
 <b8b25523-08d1-974d-0c87-281dce06f26e@intel.com>
 <20221214195737.ai2vfag64zeloaek@zkempczy-mobl2>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20221214195737.ai2vfag64zeloaek@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/gem_ccs: Add block-multicopy
 subtest
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

On 14.12.2022 20:57, Zbigniew Kempczyński wrote:
> On Tue, Dec 13, 2022 at 04:40:38PM +0100, Karolina Stolarek wrote:
>> On 12.12.2022 13:50, Zbigniew Kempczyński wrote:
>>> Exercise sequence of blits packed in single batch. It may reveal
>>> flushing/decompressing/detiling problems during execution.
>>> multicopy-inplace version differs from copy-inplace version with
>>> additional blit to same tiling format during decompression to separate
>>> problems visible in decompressing/detiling in one step.
>>>
>>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>> ---
>>>    tests/i915/gem_ccs.c | 262 ++++++++++++++++++++++++++++++++++++++++---
>>>    1 file changed, 246 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
>>> index 4ecb3e36ac..6b5f199ec7 100644
>>> --- a/tests/i915/gem_ccs.c
>>> +++ b/tests/i915/gem_ccs.c
>>> @@ -262,6 +262,119 @@ static void surf_copy(int i915,
>>>    	gem_close(i915, ccs);
>>>    }
>>> +struct blt_copy3_data {
>>> +	int i915;
>>> +	struct blt_copy_object src;
>>> +	struct blt_copy_object mid;
>>> +	struct blt_copy_object dst;
>>> +	struct blt_copy_object final;
>>> +	struct blt_copy_batch bb;
>>> +	enum blt_color_depth color_depth;
>>> +
>>> +	/* debug stuff */
>>> +	bool print_bb;
>>> +};
>>> +
>>> +struct blt_block_copy3_data_ext {
>>> +	struct blt_block_copy_object_ext src;
>>> +	struct blt_block_copy_object_ext mid;
>>> +	struct blt_block_copy_object_ext dst;
>>> +	struct blt_block_copy_object_ext final;
>>> +};
>>> +
>>> +#define FILL_OBJ(_idx, _handle, _offset, _flags) do { \
>>> +	obj[(_idx)].handle = (_handle); \
>>> +	obj[(_idx)].offset = (_offset); \
>>> +	obj[(_idx)++].flags = EXEC_OBJECT_PINNED | \
>>> +			      EXEC_OBJECT_SUPPORTS_48B_ADDRESS | (_flags) ; \
>>> +} while (0)
>>> +
>>
>> I'm not sure if we want to have a macro with a hidden side effect. "i++"
>> after each statement isn't pretty either, so I'm on the fence with this one.
> 
> I'm aware this has side effect, but this makes main code more clear as it
> is not interlaced with var++ between the lines. I think reader who knows
> how execbuf objs works will notice there's some implicit increment in the
> macro.

When I first read the code, I thought "why do we keep using the same i 
for different objects?", and then looked at this definition. Or we could 
call FILL_OBJ(++i, ...), but it's not pretty either.

> 
>>
>>> +static int blt_block_copy3(int i915,
>>> +			   const intel_ctx_t *ctx,
>>> +			   const struct intel_execution_engine2 *e,
>>> +			   uint64_t ahnd,
>>> +			   const struct blt_copy3_data *blt3,
>>> +			   const struct blt_block_copy3_data_ext *ext3)
>>> +{
>>> +	struct drm_i915_gem_execbuffer2 execbuf = {};
>>> +	struct drm_i915_gem_exec_object2 obj[5] = {};
>>> +	struct blt_copy_data blt0;
>>> +	struct blt_block_copy_data_ext ext0;
>>> +	uint64_t src_offset, mid_offset, dst_offset, final_offset, bb_offset, alignment;
>>> +	uint64_t bb_pos = 0;
>>> +	uint32_t *bb;
>>> +	int i, ret;
>>> +
>>> +	igt_assert_f(ahnd, "block-copy3 supports softpin only\n");
>>> +	igt_assert_f(blt3, "block-copy3 requires data to do blit\n");
>>> +
>>> +	alignment = gem_detect_safe_alignment(i915);
>>> +	src_offset = get_offset(ahnd, blt3->src.handle, blt3->src.size, alignment);
>>> +	mid_offset = get_offset(ahnd, blt3->mid.handle, blt3->mid.size, alignment);
>>> +	dst_offset = get_offset(ahnd, blt3->dst.handle, blt3->dst.size, alignment);
>>> +	final_offset = get_offset(ahnd, blt3->final.handle, blt3->final.size, alignment);
>>> +	bb_offset = get_offset(ahnd, blt3->bb.handle, blt3->bb.size, alignment);
>>> +
>>> +	igt_debug("src: %lx, mid: %lx, dst: %lx, final: %lx, bb: %lx, align: %lx\n",
>>> +		  src_offset, mid_offset, dst_offset, final_offset, bb_offset, alignment);
>>> +
>>> +	/* First blit src -> mid */
>>> +	memset(&blt0, 0, sizeof(blt0));
>>> +	blt0.src = blt3->src;
>>> +	blt0.dst = blt3->mid;
>>> +	blt0.bb = blt3->bb;
>>> +	blt0.color_depth = blt3->color_depth;
>>> +	blt0.print_bb = blt3->print_bb;
>>> +	ext0.src = ext3->src;
>>> +	ext0.dst = ext3->mid;
>>> +	bb_pos = emit_blt_block_copy(i915, ahnd, &blt0, &ext0, bb_pos, false);
>>> +
>>> +	/* Second blit mid -> dst */
>>> +	memset(&blt0, 0, sizeof(blt0));
>>> +	blt0.src = blt3->mid;
>>> +	blt0.dst = blt3->dst;
>>> +	blt0.bb = blt3->bb;
>>> +	blt0.color_depth = blt3->color_depth;
>>> +	blt0.print_bb = blt3->print_bb;
>>> +	ext0.src = ext3->mid;
>>> +	ext0.dst = ext3->dst;
>>> +	bb_pos = emit_blt_block_copy(i915, ahnd, &blt0, &ext0, bb_pos, false);
>>> +
>>> +	/* Third blit dst -> final */
>>> +	memset(&blt0, 0, sizeof(blt0));
>>> +	blt0.src = blt3->dst;
>>> +	blt0.dst = blt3->final;
>>> +	blt0.bb = blt3->bb;
>>> +	blt0.color_depth = blt3->color_depth;
>>> +	blt0.print_bb = blt3->print_bb;
>>> +	ext0.src = ext3->dst;
>>> +	ext0.dst = ext3->final;
>>> +	bb_pos = emit_blt_block_copy(i915, ahnd, &blt0, &ext0, bb_pos, true);
>>> +
>>> +	i = 0;
>>> +	FILL_OBJ(i, blt3->src.handle, CANONICAL(src_offset), 0);
>>> +	FILL_OBJ(i, blt3->mid.handle, CANONICAL(mid_offset), EXEC_OBJECT_WRITE);
>>> +	if (mid_offset != dst_offset)
>>> +		FILL_OBJ(i, blt3->dst.handle, CANONICAL(dst_offset), EXEC_OBJECT_WRITE);
>>> +	FILL_OBJ(i, blt3->final.handle, CANONICAL(final_offset), 0);
>>> +	FILL_OBJ(i, blt3->bb.handle, CANONICAL(bb_offset), 0);
>>> +
>>> +	execbuf.buffer_count = i;
>>> +
>>> +	for (int __i = 0; __i < i; __i++)
>>> +		igt_debug("obj[%d].offset: %llx, handle: %u\n",
>>> +			  __i, (long long) obj[__i].offset, obj[__i].handle);
>>> +	execbuf.buffers_ptr = to_user_pointer(obj);
>>> +	execbuf.rsvd1 = ctx ? ctx->id : 0;
>>> +	execbuf.flags = e ? e->flags : I915_EXEC_BLT;
>>> +	ret = __gem_execbuf(i915, &execbuf);
>>> +
>>> +	gem_sync(i915, blt3->bb.handle);
>>> +	munmap(bb, blt3->bb.size);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>    static void block_copy(int i915,
>>>    		       const intel_ctx_t *ctx,
>>>    		       const struct intel_execution_engine2 *e,
>>> @@ -380,10 +493,100 @@ static void block_copy(int i915,
>>>    	igt_assert_f(!result, "source and destination surfaces differs!\n");
>>>    }
>>> +static void block_multicopy(int i915,
>>> +			    const intel_ctx_t *ctx,
>>> +			    const struct intel_execution_engine2 *e,
>>> +			    uint32_t region1, uint32_t region2,
>>> +			    enum blt_tiling mid_tiling,
>>> +			    const struct test_config *config)
>>> +{
>>> +	struct blt_copy3_data blt3 = {};
>>> +	struct blt_block_copy3_data_ext ext3 = {}, *pext3 = &ext3;
>>> +	struct blt_copy_object *src, *mid, *dst, *final;
>>> +	const uint32_t bpp = 32;
>>> +	uint64_t bb_size = 4096;
>>> +	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
>>> +	uint32_t run_id = mid_tiling;
>>> +	uint32_t mid_region = region2, bb;
>>> +	uint32_t width = param.width, height = param.height;
>>> +	enum blt_compression mid_compression = config->compression;
>>> +	int mid_compression_format = param.compression_format;
>>> +	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
>>> +	uint8_t uc_mocs = intel_get_uc_mocs(i915);
>>> +	int result;
>>> +
>>> +	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
>>> +
>>> +	if (!blt_supports_compression(i915))
>>> +		pext3 = NULL;
>>> +
>>> +	src = create_object(i915, region1, width, height, bpp, uc_mocs,
>>> +			    T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
>>> +	mid = create_object(i915, mid_region, width, height, bpp, uc_mocs,
>>> +			    mid_tiling, mid_compression, comp_type, true);
>>> +	dst = create_object(i915, region1, width, height, bpp, uc_mocs,
>>> +			    mid_tiling, COMPRESSION_DISABLED, comp_type, true);
>>> +	final = create_object(i915, region1, width, height, bpp, uc_mocs,
>>> +			    T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
>>> +	igt_assert(src->size == dst->size);
>>> +	PRINT_SURFACE_INFO("src", src);
>>> +	PRINT_SURFACE_INFO("mid", mid);
>>> +	PRINT_SURFACE_INFO("dst", dst);
>>> +	PRINT_SURFACE_INFO("final", final);
>>> +
>>> +	blt_surface_fill_rect(i915, src, width, height);
>>> +
>>> +	memset(&blt3, 0, sizeof(blt3));
>>> +	blt3.color_depth = CD_32bit;
>>> +	blt3.print_bb = param.print_bb;
>>> +	set_blt_object(&blt3.src, src);
>>> +	set_blt_object(&blt3.mid, mid);
>>> +	set_blt_object(&blt3.dst, dst);
>>> +	set_blt_object(&blt3.final, final);
>>> +
>>> +	if (config->inplace) {
>>> +		set_object(&blt3.dst, mid->handle, dst->size, mid->region, mid->mocs,
>>> +			   mid_tiling, COMPRESSION_DISABLED, comp_type);
>>> +		blt3.dst.ptr = mid->ptr;
>>> +	}
>>> +
>>> +	set_object_ext(&ext3.src, 0, width, height, SURFACE_TYPE_2D);
>>> +	set_object_ext(&ext3.mid, mid_compression_format, width, height, SURFACE_TYPE_2D);
>>> +	set_object_ext(&ext3.dst, 0, width, height, SURFACE_TYPE_2D);
>>> +	set_object_ext(&ext3.final, 0, width, height, SURFACE_TYPE_2D);
>>> +	set_batch(&blt3.bb, bb, bb_size, region1);
>>> +
>>> +	blt_block_copy3(i915, ctx, e, ahnd, &blt3, pext3);
>>> +	gem_sync(i915, blt3.final.handle);
>>> +
>>> +	WRITE_PNG(i915, run_id, "src", &blt3.src, width, height);
>>> +	if (!config->inplace)
>>> +		WRITE_PNG(i915, run_id, "mid", &blt3.mid, width, height);
>>> +	WRITE_PNG(i915, run_id, "dst", &blt3.dst, width, height);
>>> +	WRITE_PNG(i915, run_id, "final", &blt3.final, width, height);
>>> +
>>> +	result = memcmp(src->ptr, blt3.final.ptr, src->size);
>>> +
>>> +	destroy_object(i915, src);
>>> +	destroy_object(i915, mid);
>>> +	destroy_object(i915, dst);
>>> +	destroy_object(i915, final);
>>> +	gem_close(i915, bb);
>>> +	put_ahnd(ahnd);
>>> +
>>> +	igt_assert_f(!result, "source and destination surfaces differs!\n");
>>> +}
>>> +
>>> +enum copy_func {
>>> +	BLOCK_COPY,
>>> +	BLOCK_MULTICOPY,
>>> +};
>>> +
>>
>> I was thinking if we need a simple case here (i.e. one emit, src->dst)
> 
> What tiling you want to blit? linear -> linear? linear -> tileN? How to
> verify it works? fmt1 -> fmt2 -> fmt1 is equal to fmt1 -> fmt2 (detile
> fmt2 -> linear on cpu).
> 
> At the moment we don't verify middle surface, only assume src == dst
> is fine with middle blit.

I thought about linear->linear in the beginning, but maybe it would make 
more sense to wait for predicates that can check the middle layer and 
work with different tilings. It can stay like this for now.

Many thanks,
Karolina

> 
> --
> Zbigniew
> 
>>
>>>    static void block_copy_test(int i915,
>>>    			    const struct test_config *config,
>>>    			    const intel_ctx_t *ctx,
>>> -			    struct igt_collection *set)
>>> +			    struct igt_collection *set,
>>> +			    enum copy_func copy_function)
>>>    {
>>>    	struct igt_collection *regions;
>>>    	const struct intel_execution_engine2 *e;
>>> @@ -415,15 +618,27 @@ static void block_copy_test(int i915,
>>>    					continue;
>>>    				regtxt = memregion_dynamic_subtest_name(regions);
>>> -				igt_dynamic_f("%s-%s-compfmt%d-%s",
>>> -					      blt_tiling_name(tiling),
>>> -					      config->compression ?
>>> -						      "compressed" : "uncompressed",
>>> -					      param.compression_format, regtxt) {
>>> -					block_copy(i915, ctx, e,
>>> -						   region1, region2,
>>> -						   tiling, config);
>>> -				}
>>> +
>>> +				if (copy_function == BLOCK_COPY)
>>> +					igt_dynamic_f("%s-%s-compfmt%d-%s",
>>> +						      blt_tiling_name(tiling),
>>> +						      config->compression ?
>>> +							      "compressed" : "uncompressed",
>>> +						      param.compression_format, regtxt) {
>>> +						block_copy(i915, ctx, e,
>>> +							   region1, region2,
>>> +							   tiling, config);
>>> +					}
>>> +				else if (copy_function == BLOCK_MULTICOPY)
>>> +					igt_dynamic_f("%s-%s-compfmt%d-%s-multicopy",
>>> +						      blt_tiling_name(tiling),
>>> +						      config->compression ?
>>> +							      "compressed" : "uncompressed",
>>> +						      param.compression_format, regtxt) {
>>> +						block_multicopy(i915, ctx, e,
>>> +								region1, region2,
>>> +								tiling, config);
>>> +					}
>>
>> We could avoid repetition to some extent if we had introduced a macro that
>> accepts a function pointer and/or some config data. But I don't feel
>> strongly about it, just putting it out there.
>>
>> Many thanks,
>> Karolina
>>
>>>    				free(regtxt);
>>>    			}
>>>    		}
>>> @@ -506,14 +721,21 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>>    	igt_subtest_with_dynamic("block-copy-uncompressed") {
>>>    		struct test_config config = {};
>>> -		block_copy_test(i915, &config, ctx, set);
>>> +		block_copy_test(i915, &config, ctx, set, BLOCK_COPY);
>>>    	}
>>>    	igt_describe("Check block-copy flatccs compressed blit");
>>>    	igt_subtest_with_dynamic("block-copy-compressed") {
>>>    		struct test_config config = { .compression = true };
>>> -		block_copy_test(i915, &config, ctx, set);
>>> +		block_copy_test(i915, &config, ctx, set, BLOCK_COPY);
>>> +	}
>>> +
>>> +	igt_describe("Check block-multicopy flatccs compressed blit");
>>> +	igt_subtest_with_dynamic("block-multicopy-compressed") {
>>> +		struct test_config config = { .compression = true };
>>> +
>>> +		block_copy_test(i915, &config, ctx, set, BLOCK_MULTICOPY);
>>>    	}
>>>    	igt_describe("Check block-copy flatccs inplace decompression blit");
>>> @@ -521,7 +743,15 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>>    		struct test_config config = { .compression = true,
>>>    					      .inplace = true };
>>> -		block_copy_test(i915, &config, ctx, set);
>>> +		block_copy_test(i915, &config, ctx, set, BLOCK_COPY);
>>> +	}
>>> +
>>> +	igt_describe("Check block-multicopy flatccs inplace decompression blit");
>>> +	igt_subtest_with_dynamic("block-multicopy-inplace") {
>>> +		struct test_config config = { .compression = true,
>>> +					      .inplace = true };
>>> +
>>> +		block_copy_test(i915, &config, ctx, set, BLOCK_MULTICOPY);
>>>    	}
>>>    	igt_describe("Check flatccs data can be copied from/to surface");
>>> @@ -529,7 +759,7 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>>    		struct test_config config = { .compression = true,
>>>    					      .surfcopy = true };
>>> -		block_copy_test(i915, &config, ctx, set);
>>> +		block_copy_test(i915, &config, ctx, set, BLOCK_COPY);
>>>    	}
>>>    	igt_describe("Check flatccs data are physically tagged and visible"
>>> @@ -539,7 +769,7 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>>    					      .surfcopy = true,
>>>    					      .new_ctx = true };
>>> -		block_copy_test(i915, &config, ctx, set);
>>> +		block_copy_test(i915, &config, ctx, set, BLOCK_COPY);
>>>    	}
>>>    	igt_describe("Check flatccs data persists after suspend / resume (S0)");
>>> @@ -548,7 +778,7 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>>    					      .surfcopy = true,
>>>    					      .suspend_resume = true };
>>> -		block_copy_test(i915, &config, ctx, set);
>>> +		block_copy_test(i915, &config, ctx, set, BLOCK_COPY);
>>>    	}
>>>    	igt_fixture {
