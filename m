Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD74810E1A0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 11:28:52 +0000 (UTC)
Date: Thu, 12 Jan 2023 12:28:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230112112847.weiy35jpe7hri32n@kamilkon-desk1>
References: <cover.1673426099.git.karolina.stolarek@intel.com>
 <e0a74fa3eb3c6982ca231b557a9cd42363caf47c.1673426099.git.karolina.stolarek@intel.com>
 <20230111164255.womdjqvveb2sbg5o@kamilkon-desk1>
 <6445da8a-aab0-ef89-2c72-68bcfe4b4bd8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6445da8a-aab0-ef89-2c72-68bcfe4b4bd8@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/6] i915/lib: Add new library for
 blitter and tiling formats
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

Hi Karolina,

On 2023-01-12 at 10:35:58 +0100, Karolina Stolarek wrote:
> Hi Kamil,
> 
> On 11.01.2023 17:42, Kamil Konieczny wrote:
> > Hi Karolina,

<added from before>
> > +++ b/lib/i915/intel_blt_info.h

> 
> <snip>
> 
> > > +#include "igt_core.h"
> > 
> > imho we should have smaller include here as we need only uint32_t,
> > not all igt_core.
> 
> I've just realised that I want to use igt_core.h. I'm using quite useful
> wrappers like igt_require_f and igt_info, and I'd like to keep them.
> 
> Thanks,
> Karolina

You can have it in .c file but it will be better to not have it
inside .h, as it will be included into another header. We do not
want to have one big header with all functions/macros inside.

Regards,
Kamil

> > 
> > > +
> > > +/**
> > > + * SECTION:intel_blt_info
> > > + * @short_description: blitter library to query for available commands and tiling formats
> > > + * @title: Intel blitter info
> > > + * @include: intel_blt_info.h
> > > + *
> > > + * # Introduction
> > > + *
> > > + * When we do a blitter copy, a number of different tiling formats can be used.
> > > + * The list of available formats and commands varies between generations, in
> > > + * some cases even within the generation (e.g. block copy tiling formats offered
> > > + * by TGL vs DG2). Such information is required by different tests, so it's
> > > + * beneficial to store it in one place. `intel_blt_info` is a blitter library
> > > + * that describes available commands with a list of supported tiling formats.
> > > + * They are encapsulated in static `blt_cmd_info` instances, each of them
> > > + * defined per generation or platform.
> > > + *
> > > + * Tiling formats here are described by blt_tiling_type enum, which represents
> > > + * shifts used to create bit flags of supported tiling formats:
> > > + * `.supported_tiling = BLT_BIT(T_LINEAR) | BLT_BIT(T_XMAJOR) | BLT_BIT(T_YMAJOR)`
> > > + *
> > > + * # Usage
> > > + *
> > > + * - blt_supports_command(info, cmd) - checks if a blt_cmd_type instance has an
> > > + *				       entry for the command
> > > + * - blt_cmd_supports_tiling(info, cmd, tiling) - checks if a tiling format is
> > > + *						  supported by the command. Can
> > > + *						  also handle the case when the
> > > + *						  command is not available on
> > > + *						  the platform.
> > > + *
> > > + * These general checks can be wrapped in a command or tiling specific check,
> > > + * provided by other libraries.
> > > + *
> > > + */
> > > +
> > > +enum blt_tiling_type {
> > > +	T_LINEAR,
> > > +	T_XMAJOR,
> > > +	T_YMAJOR,
> > > +	T_TILE4,
> > > +	T_TILE64,
> > > +	T_YFMAJOR,
> > > +	__MAX_TILING
> > --------- ^
> > imho __BLT_MAX_TILING would be better.
> > 
> > > +};
> > > +
> > > +enum blt_cmd_type {
> > > +	SRC_COPY,
> > > +	XY_SRC_COPY,
> > > +	XY_FAST_COPY,
> > > +	XY_BLOCK_COPY,
> > > +	__MAX_CMD
> > --------- ^
> > Here this is too general, __BLT_MAX_CMD would be better.
> > 
> > Regards,
> > Kamil
> > 
> > > +};
> > > +
> > > +struct blt_tiling_info {
> > > +	enum blt_cmd_type blt_cmd_type;
> > > +	uint32_t supported_tiling;
> > > +};
> > > +
> > > +struct blt_cmd_info {
> > > +	struct blt_tiling_info const *supported_tiling[__MAX_CMD];
> > > +};
> > > +
> > > +const struct blt_cmd_info pre_gen8_blt_info;
> > > +const struct blt_cmd_info gen8_blt_info;
> > > +const struct blt_cmd_info gen11_blt_info;
> > > +const struct blt_cmd_info gen12_blt_info;
> > > +const struct blt_cmd_info gen12_dg2_blt_info;
> > > +const struct blt_cmd_info gen12_atsm_blt_info;
> > > +
> > > +#define for_each_tiling(__tiling) \
> > > +	for (__tiling = T_LINEAR; __tiling < __MAX_TILING; __tiling++)
> > > +
> > > +bool blt_supports_command(const struct blt_cmd_info *info,
> > > +			  enum blt_cmd_type cmd);
> > > +bool blt_cmd_supports_tiling(const struct blt_cmd_info *info,
> > > +			     enum blt_cmd_type cmd,
> > > +			     enum blt_tiling_type tiling);
> > > +
> > > +void blt_dump_blt_cmd_info(struct blt_cmd_info const *info);
> > > +const char *blt_tiling_name(enum blt_tiling_type tiling);
> > > +
> > > +#endif // BLT_TILING_H
> > > diff --git a/lib/meson.build b/lib/meson.build
> > > index cc784686..765f5687 100644
> > > --- a/lib/meson.build
> > > +++ b/lib/meson.build
> > > @@ -11,6 +11,7 @@ lib_sources = [
> > >   	'i915/gem_ring.c',
> > >   	'i915/gem_mman.c',
> > >   	'i915/gem_vm.c',
> > > +	'i915/intel_blt_info.c',
> > >   	'i915/intel_decode.c',
> > >   	'i915/intel_memory_region.c',
> > >   	'i915/intel_mocs.c',
> > > diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> > > index 751f65e6..9e304774 100644
> > > --- a/tests/i915/gem_ccs.c
> > > +++ b/tests/i915/gem_ccs.c
> > > @@ -46,7 +46,7 @@ struct test_config {
> > >   static void set_object(struct blt_copy_object *obj,
> > >   		       uint32_t handle, uint64_t size, uint32_t region,
> > > -		       uint8_t mocs, enum blt_tiling tiling,
> > > +		       uint8_t mocs, enum blt_tiling_type tiling,
> > >   		       enum blt_compression compression,
> > >   		       enum blt_compression_type compression_type)
> > >   {
> > > @@ -108,7 +108,7 @@ static void set_surf_object(struct blt_ctrl_surf_copy_object *obj,
> > >   static struct blt_copy_object *
> > >   create_object(int i915, uint32_t region,
> > >   	      uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> > > -	      enum blt_tiling tiling,
> > > +	      enum blt_tiling_type tiling,
> > >   	      enum blt_compression compression,
> > >   	      enum blt_compression_type compression_type,
> > >   	      bool create_mapping)
> > > @@ -374,7 +374,7 @@ static void block_copy(int i915,
> > >   		       const intel_ctx_t *ctx,
> > >   		       const struct intel_execution_engine2 *e,
> > >   		       uint32_t region1, uint32_t region2,
> > > -		       enum blt_tiling mid_tiling,
> > > +		       enum blt_tiling_type mid_tiling,
> > >   		       const struct test_config *config)
> > >   {
> > >   	struct blt_copy_data blt = {};
> > > @@ -492,7 +492,7 @@ static void block_multicopy(int i915,
> > >   			    const intel_ctx_t *ctx,
> > >   			    const struct intel_execution_engine2 *e,
> > >   			    uint32_t region1, uint32_t region2,
> > > -			    enum blt_tiling mid_tiling,
> > > +			    enum blt_tiling_type mid_tiling,
> > >   			    const struct test_config *config)
> > >   {
> > >   	struct blt_copy3_data blt3 = {};
> > > @@ -581,7 +581,7 @@ static const struct {
> > >   	const char *suffix;
> > >   	void (*copyfn)(int, const intel_ctx_t *,
> > >   		       const struct intel_execution_engine2 *,
> > > -		       uint32_t, uint32_t, enum blt_tiling,
> > > +		       uint32_t, uint32_t, enum blt_tiling_type,
> > >   		       const struct test_config *);
> > >   } copyfns[] = {
> > >   	[BLOCK_COPY] = { "", block_copy },
> > > @@ -596,6 +596,7 @@ static void block_copy_test(int i915,
> > >   {
> > >   	struct igt_collection *regions;
> > >   	const struct intel_execution_engine2 *e;
> > > +	int tiling;
> > >   	if (config->compression && !blt_supports_compression(i915))
> > >   		return;
> > > @@ -603,7 +604,7 @@ static void block_copy_test(int i915,
> > >   	if (config->inplace && !config->compression)
> > >   		return;
> > > -	for (int tiling = T_LINEAR; tiling <= T_TILE64; tiling++) {
> > > +	for_each_tiling(tiling) {
> > >   		if (!blt_supports_tiling(i915, tiling) ||
> > >   		    (param.tiling >= 0 && param.tiling != tiling))
> > >   			continue;
> > > diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> > > index 75121d41..9388d4de 100644
> > > --- a/tests/i915/gem_lmem_swapping.c
> > > +++ b/tests/i915/gem_lmem_swapping.c
> > > @@ -78,7 +78,7 @@ struct object {
> > >   static void set_object(struct blt_copy_object *obj,
> > >   		       uint32_t handle, uint64_t size, uint32_t region,
> > > -		       uint8_t mocs, enum blt_tiling tiling,
> > > +		       uint8_t mocs, enum blt_tiling_type tiling,
> > >   		       enum blt_compression compression,
> > >   		       enum blt_compression_type compression_type)
> > >   {
> > > -- 
> > > 2.25.1
> > > 
