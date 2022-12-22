Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB9110E533
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Dec 2022 09:51:41 +0000 (UTC)
Message-ID: <4bfcdfad-04d0-f940-85ef-44ebcb5e0b98@intel.com>
Date: Thu, 22 Dec 2022 10:51:31 +0100
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <cover.1671446367.git.karolina.stolarek@intel.com>
 <689d5ef4fb924655467fcd2e82ee2b7816cbfd94.1671446367.git.karolina.stolarek@intel.com>
 <20221220114910.sclj6h4aci4te4jk@zkempczy-mobl2>
 <Y6NJW4pbtnZtlrv6@kamilkon-desk1>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <Y6NJW4pbtnZtlrv6@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib: Describe supported blitter
 commands and tiling formats
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

On 21.12.2022 18:58, Kamil Konieczny wrote:
> Hi,
> 
> On 2022-12-20 at 12:49:10 +0100, Zbigniew Kempczyński wrote:
>> On Mon, Dec 19, 2022 at 12:49:08PM +0100, Karolina Stolarek wrote:
>>> Add structs to describe what blitter commands and tiling formats are
>>> supported per platform. Introduce functions that check which blitter
>>> commands are supported, update the tests to reflect that change.
>>> Use new enum tiling_format in i915_blt lib and block copy tests.
>>>
>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>> ---
>>>   lib/i915/blt_tiling.c          | 371 +++++++++++++++++++++++++++++++++
>>>   lib/i915/blt_tiling.h          |  64 ++++++
>>>   lib/i915/i915_blt.c            |  60 +-----
>>>   lib/i915/i915_blt.h            |  14 +-
>>>   lib/meson.build                |   1 +
>>>   tests/i915/gem_ccs.c           |  19 +-
>>>   tests/i915/gem_lmem_swapping.c |   2 +-
>>>   7 files changed, 456 insertions(+), 75 deletions(-)
>>>   create mode 100644 lib/i915/blt_tiling.c
>>>   create mode 100644 lib/i915/blt_tiling.h
>>>
>>> diff --git a/lib/i915/blt_tiling.c b/lib/i915/blt_tiling.c
>>> new file mode 100644
>>> index 00000000..41a3fe25
>>> --- /dev/null
>>> +++ b/lib/i915/blt_tiling.c
>>> @@ -0,0 +1,371 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2022 Intel Corporation
>>> + */
>>> +
>>> +#include "blt_tiling.h"
>>> +
>>> +#define BLT_STR_MAX 200
>>> +#define TILE_STR_MAX 60
>>> +
>>> +static bool matches_gen12_atsm(uint16_t devid)
>>> +{
>>> +	return IS_DG2(devid) && intel_display_ver(devid) == 0;
>>> +}
>>> +
>>> +static bool matches_gen12_dg2(uint16_t devid)
>>> +{
>>> +	return IS_DG2(devid);
>>> +}
>>> +
>>> +static bool matches_gen12_generic(uint16_t devid)
>>> +{
>>> +	return !(matches_gen12_dg2(devid) || matches_gen12_atsm(devid));
>>> +}
>>> +
>>> +static const struct blt_cmd_info generic_info = {
>>> +	.gen_max = -1
>>> +};
>>> +
>>> +/* No blitter-specific commands available */
>>> +static const struct blt_cmd_info pre_gen6_info = {
>>> +	.gen_max = 5,
>>> +};
>>> +
>>> +static const struct blt_cmd_info pre_gen8_info = {
>>> +	.gen_min = 6,
>>> +	.gen_max = 7,
>>> +	.cmd_num = 2,
>>> +	.supported_blt_cmds = SRC_COPY | XY_SRC_COPY,
>>> +	.supported_tiling = {
>>
>> If supported_tiling would point to array of pointers you can add
>> terminating NULL element. The .cmd_num can be removed and you
>> decrease of risk of mistake here.
>>
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = SRC_COPY,
>>> +			.supported_tiling = T_LINEAR
>>> +		},
>>
>> You may use array initialization:
>>
>> [SRC_COPY] = &src_copy,
>> [XY_SRC_COPY] = &xy_src_copy
>> ...
>>
>> but SRC_COPY, XY_SRC_COPY, ... better should be contigues, not bitflags.
>>
>> Apart of that some initialization macro would make this code more readable,
>> like:
>>
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_SRC_COPY,
>>> +			.supported_tiling = T_LINEAR | T_XMAJOR
>>> +		}
>>
>> BLT_INFO(XY_SRC_COPY, T_LINEAR | T_XMAJOR)
>>
>> and instead of gen_min/gen_max I would just inject this directly to
>> intel_device_info.c, like:
> 
> This will put more work in creating device info and would
> require using bitfields so maybe do not do this ?

I'd like to keep the bitfields, you can see at the first glance what 
tiling is here. Still, I'm facing issues with adding this information to 
intel_device_info, so maybe I'll keep the definitions in the library itself.

Thanks,
Karolina

> 
> Regards,
> Kamil
> 
>>
>> .blt_tiling = pre_gen8_info
>>
>> For render we might reuse same info definition, like:
>>
>> .render_tiling = pre_gen8_info
>>
>> or point to separate if there're tiling differences.
>>
>> --
>> Zbigniew
>>
>>> +	}
>>> +};
>>> +
>>> +static const struct blt_cmd_info gen8_info = {
>>> +	.gen_min = 8,
>>> +	.gen_max = 8,
>>> +	.cmd_num = 1,
>>> +	.supported_blt_cmds = XY_SRC_COPY,
>>> +	.supported_tiling = {
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_SRC_COPY,
>>> +			.supported_tiling = T_LINEAR | T_XMAJOR | T_YMAJOR
>>> +		}
>>> +	}
>>> +};
>>> +
>>> +static const struct blt_cmd_info gen11_info = {
>>> +	.gen_min = 9,
>>> +	.gen_max = 11,
>>> +	.cmd_num = 2,
>>> +	.supported_blt_cmds = XY_SRC_COPY | XY_FAST_COPY,
>>> +	.supported_tiling = {
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_SRC_COPY,
>>> +			.supported_tiling = T_LINEAR | T_XMAJOR | T_YMAJOR
>>> +		},
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_FAST_COPY,
>>> +			.supported_tiling = T_LINEAR | T_YMAJOR | T_YFMAJOR | T_TILE64
>>> +		}
>>> +	}
>>> +};
>>> +
>>> +#define GEN12_FIELDS \
>>> +	.gen_min = 12, \
>>> +	.gen_max = 12, \
>>> +	.cmd_num = 3, \
>>> +	.supported_blt_cmds = XY_SRC_COPY | XY_FAST_COPY | XY_BLOCK_COPY
>>> +
>>> +static const struct blt_cmd_info gen12_info = {
>>> +	GEN12_FIELDS,
>>> +	.matches_platform = matches_gen12_generic,
>>> +	.supported_tiling = {
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_SRC_COPY,
>>> +			.supported_tiling = T_LINEAR | T_XMAJOR | T_YMAJOR
>>> +		},
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_FAST_COPY,
>>> +			.supported_tiling = T_LINEAR | T_YMAJOR | T_TILE4 | T_TILE64
>>> +		},
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_BLOCK_COPY,
>>> +			.supported_tiling = T_LINEAR | T_YMAJOR
>>> +		}
>>> +	}
>>> +};
>>> +
>>> +static const struct blt_cmd_info gen12_dg2_info = {
>>> +	GEN12_FIELDS,
>>> +	.matches_platform = matches_gen12_dg2,
>>> +	.supported_tiling = {
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_SRC_COPY,
>>> +			.supported_tiling = T_LINEAR | T_XMAJOR | T_YMAJOR
>>> +		},
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_FAST_COPY,
>>> +			.supported_tiling = T_LINEAR | T_XMAJOR | T_TILE4 | T_TILE64
>>> +		},
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_BLOCK_COPY,
>>> +			.supported_tiling = T_LINEAR | T_XMAJOR | T_TILE4 | T_TILE64
>>> +		}
>>> +	}
>>> +};
>>> +
>>> +static const struct blt_cmd_info gen12_atsm_info = {
>>> +	GEN12_FIELDS,
>>> +	.matches_platform = matches_gen12_atsm,
>>> +	.supported_tiling = {
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_SRC_COPY,
>>> +			.supported_tiling = T_LINEAR | T_XMAJOR | T_YMAJOR
>>> +		},
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_FAST_COPY,
>>> +			.supported_tiling = T_LINEAR | T_TILE4 | T_TILE64
>>> +		},
>>> +		(struct blt_tiling_info){
>>> +			.blt_cmd_type = XY_BLOCK_COPY,
>>> +			.supported_tiling = T_LINEAR | T_XMAJOR | T_TILE4 | T_TILE64
>>> +		}
>>> +	}
>>> +};
>>> +
>>> +static const struct blt_cmd_info blt_gen_configs[] = {
>>> +	pre_gen6_info,
>>> +	pre_gen8_info,
>>> +	gen8_info,
>>> +	gen11_info,
>>> +	generic_info
>>> +};
>>> +
>>> +static const struct blt_cmd_info blt_devid_configs[] = {
>>> +	gen12_info,
>>> +	gen12_dg2_info,
>>> +	gen12_atsm_info,
>>> +	generic_info
>>> +};
>>> +
>>> +static const struct blt_cmd_info *get_devid_config(uint16_t devid)
>>> +{
>>> +	for (int i = 0; blt_devid_configs[i].gen_max != -1; i++)
>>> +		if (blt_devid_configs[i].matches_platform(devid))
>>> +			return &blt_devid_configs[i];
>>> +	return NULL;
>>> +}
>>> +
>>> +static const struct blt_cmd_info *get_gen_config(uint16_t devid)
>>> +{
>>> +	unsigned int gen = intel_gen(devid);
>>> +
>>> +	for (int i = 0; blt_gen_configs[i].gen_max != -1; i++)
>>> +		if (gen >= blt_gen_configs[i].gen_min &&
>>> +		    gen <= blt_gen_configs[i].gen_max)
>>> +			return &blt_gen_configs[i];
>>> +	return NULL;
>>> +}
>>> +
>>> +static const struct blt_cmd_info *get_blt_cmd_config(uint16_t devid)
>>> +{
>>> +	if (IS_GEN12(devid))
>>> +		return get_devid_config(devid);
>>> +	else
>>> +		return get_gen_config(devid);
>>> +}
>>> +
>>> +static const struct blt_tiling_info
>>> +		*get_tiling_config(const struct blt_cmd_info *info, enum blt_cmd_type type)
>>> +{
>>> +	igt_require_f(info, "No config found for the platform\n");
>>> +
>>> +	for (int i = 0; i < BLT_CMD_MAX; i++)
>>> +		if (info->supported_tiling[i].blt_cmd_type == type)
>>> +			return &info->supported_tiling[i];
>>> +
>>> +	return NULL;
>>> +}
>>> +
>>> +static const char *blt_cmd_name(enum blt_cmd_type cmd)
>>> +{
>>> +	switch (cmd) {
>>> +	case SRC_COPY: return "SRC_COPY_BLT";
>>> +	case XY_SRC_COPY: return "XY_SRC_COPY_BLT";
>>> +	case XY_FAST_COPY: return "XY_FAST_COPY_BLT";
>>> +	case XY_BLOCK_COPY: return "XY_BLOCK_COPY_BLT";
>>> +	}
>>> +
>>> +	return NULL;
>>> +}
>>> +
>>> +const char *blt_tiling_name(enum tiling_type tiling)
>>> +{
>>> +	switch (tiling) {
>>> +	case T_LINEAR: return "linear";
>>> +	case T_XMAJOR: return "xmajor";
>>> +	case T_YMAJOR: return "ymajor";
>>> +	case T_TILE4:  return "tile4";
>>> +	case T_TILE64: return "tile64";
>>> +	case T_YFMAJOR: return "yfmajor";
>>> +	}
>>> +
>>> +	return NULL;
>>> +}
>>> +
>>> +static bool blt_cmd_supports_tiling(int i915, enum blt_cmd_type type, enum tiling_type tiling)
>>> +{
>>> +	uint16_t devid = intel_get_drm_devid(i915);
>>> +	struct blt_cmd_info const *info = get_blt_cmd_config(devid);
>>> +	struct blt_tiling_info const *tile_config = get_tiling_config(info, type);
>>> +
>>> +	/* no config means no support for that tiling */
>>> +	if (!tile_config)
>>> +		return false;
>>> +
>>> +	return tile_config->supported_tiling & tiling;
>>> +}
>>> +
>>> +bool block_copy_supports_tiling(int i915, enum tiling_type tiling)
>>> +{
>>> +	return blt_cmd_supports_tiling(i915, XY_BLOCK_COPY, tiling);
>>> +}
>>> +
>>> +bool fast_copy_supports_tiling(int i915, enum tiling_type tiling)
>>> +{
>>> +	return blt_cmd_supports_tiling(i915, XY_FAST_COPY, tiling);
>>> +}
>>> +
>>> +bool xy_src_copy_supports_tiling(int i915, enum tiling_type tiling)
>>> +{
>>> +	return blt_cmd_supports_tiling(i915, XY_SRC_COPY, tiling);
>>> +}
>>> +
>>> +bool src_copy_supports_tiling(int i915, enum tiling_type tiling)
>>> +{
>>> +	return blt_cmd_supports_tiling(i915, SRC_COPY, tiling);
>>> +}
>>> +
>>> +static bool blt_supports_command(int i915, enum blt_cmd_type type)
>>> +{
>>> +	uint16_t devid = intel_get_drm_devid(i915);
>>> +	struct blt_cmd_info const *info = get_blt_cmd_config(devid);
>>> +
>>> +	igt_require_f(info, "No config found for the platform\n");
>>> +
>>> +	return info->supported_blt_cmds & type;
>>> +}
>>> +
>>> +/*
>>> + * A general check per platform. As the block copy support is defined per engine,
>>> + * the more detailed check should use gem_engine_can_block_copy()
>>> + */
>>> +bool can_block_copy(int i915)
>>> +{
>>> +	return blt_supports_command(i915, XY_BLOCK_COPY);
>>> +}
>>> +
>>> +bool can_fast_copy(int i915)
>>> +{
>>> +	return blt_supports_command(i915, XY_FAST_COPY);
>>> +}
>>> +
>>> +bool can_xy_src_copy(int i915)
>>> +{
>>> +	return blt_supports_command(i915, XY_SRC_COPY);
>>> +}
>>> +
>>> +bool can_src_copy(int i915)
>>> +{
>>> +	/* quickly rule out higher gens */
>>> +	if (intel_gen(intel_get_drm_devid(i915)) > 8)
>>> +		return false;
>>> +
>>> +	return blt_supports_command(i915, SRC_COPY);
>>> +}
>>> +
>>> +/* Info dump functions */
>>> +static void append_tile(uint32_t tile, char *tile_str)
>>> +{
>>> +	char const *tile_name;
>>> +
>>> +	if (tile) {
>>> +		tile_name = blt_tiling_name(tile);
>>> +		snprintf(tile_str + strlen(tile_str), strlen(tile_name) + 2, "%s ", tile_name);
>>> +	}
>>> +}
>>> +
>>> +static void get_tiling_info(struct blt_cmd_info const *info, enum blt_cmd_type type, char *tile_str)
>>> +{
>>> +	uint32_t mask;
>>> +	struct blt_tiling_info const *tiling = get_tiling_config(info, type);
>>> +
>>> +	if (tiling) {
>>> +		for (int i = 0; i < T_MAX_SHIFT; i++) {
>>> +			mask = 1 << i;
>>> +			append_tile(tiling->supported_tiling & mask, tile_str);
>>> +		}
>>> +	}
>>> +
>>> +	tile_str[strlen(tile_str) - 1] = '\0';
>>> +}
>>> +
>>> +static const char *extract_cmd(const struct blt_cmd_info *info, uint32_t mask)
>>> +{
>>> +	return blt_cmd_name(info->supported_blt_cmds & mask);
>>> +}
>>> +
>>> +void dump_devid_blt_info(uint16_t devid)
>>> +{
>>> +	uint32_t cmd_mask;
>>> +	char tiling_str[TILE_STR_MAX];
>>> +	char ln_str[BLT_STR_MAX];
>>> +	char const *blt_type_str;
>>> +	const char *ln_intro = "  * ";
>>> +	struct blt_cmd_info const *info;
>>> +
>>> +	info = get_blt_cmd_config(devid);
>>> +
>>> +	if (!info) {
>>> +		igt_warn("No config available\n");
>>> +		return;
>>> +	}
>>> +
>>> +	igt_info("Supported blitter commands:\n");
>>> +
>>> +	for (int i = 0; i < BLT_CMD_MAX; i++) {
>>> +		cmd_mask = 1 << i;
>>> +		blt_type_str = extract_cmd(info, cmd_mask);
>>> +
>>> +		if (blt_type_str) {
>>> +			memset(ln_str, '\0', sizeof(char) * BLT_STR_MAX);
>>> +			memset(tiling_str, '\0', sizeof(char) * TILE_STR_MAX);
>>> +
>>> +			snprintf(ln_str,
>>> +				 strlen(ln_intro) + strlen(blt_type_str) + 1,
>>> +				 "%s%s", ln_intro, blt_type_str);
>>> +
>>> +			get_tiling_info(info, cmd_mask, tiling_str);
>>> +
>>> +			snprintf(ln_str + strlen(ln_str),
>>> +				 strlen(tiling_str) + 5,
>>> +				 " [%s]", tiling_str);
>>> +
>>> +			igt_info("%s\n", ln_str);
>>> +		}
>>> +	}
>>> +}
>>> +
>>> +void dump_current_blt_info(int i915)
>>> +{
>>> +	dump_devid_blt_info(intel_get_drm_devid(i915));
>>> +}
>>> diff --git a/lib/i915/blt_tiling.h b/lib/i915/blt_tiling.h
>>> new file mode 100644
>>> index 00000000..44ef45ca
>>> --- /dev/null
>>> +++ b/lib/i915/blt_tiling.h
>>> @@ -0,0 +1,64 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2022 Intel Corporation
>>> + */
>>> +
>>> +#ifndef BLT_TILING_H
>>> +#define BLT_TILING_H
>>> +
>>> +#include "igt.h"
>>> +
>>> +#define BLT_CMD_MAX 3
>>> +#define T_MAX_SHIFT 6
>>> +#define PLATFORMS_MAX 5
>>> +
>>> +enum tiling_type {
>>> +	T_LINEAR  = (1),
>>> +	T_XMAJOR  = (1 << 1),
>>> +	T_YMAJOR  = (1 << 2),
>>> +	T_TILE4   = (1 << 3),
>>> +	T_TILE64  = (1 << 4),
>>> +	T_YFMAJOR = (1 << 5),
>>> +};
>>> +
>>> +#define for_each_tiling(__tiling) \
>>> +	for (__tiling = T_LINEAR; __tiling <= T_YFMAJOR; __tiling = __tiling << 1)
>>> +
>>> +enum blt_cmd_type {
>>> +	SRC_COPY	= (1),
>>> +	XY_SRC_COPY	= (1 << 1),
>>> +	XY_FAST_COPY	= (1 << 2),
>>> +	XY_BLOCK_COPY	= (1 << 3),
>>> +};
>>> +
>>> +struct blt_tiling_info {
>>> +	enum blt_cmd_type blt_cmd_type;
>>> +	uint32_t supported_tiling;
>>> +};
>>> +
>>> +struct blt_cmd_info {
>>> +	uint32_t supported_blt_cmds;
>>> +	struct blt_tiling_info supported_tiling[BLT_CMD_MAX];
>>> +	uint32_t cmd_num;
>>> +
>>> +	uint32_t gen_min;
>>> +	uint32_t gen_max;
>>> +
>>> +	bool (*matches_platform)(uint16_t devid);
>>> +};
>>> +
>>> +void dump_current_blt_info(int i915);
>>> +void dump_devid_blt_info(uint16_t devid);
>>> +
>>> +bool can_block_copy(int i915);
>>> +bool can_fast_copy(int i915);
>>> +bool can_xy_src_copy(int i915);
>>> +bool can_src_copy(int i915);
>>> +
>>> +bool block_copy_supports_tiling(int i915, enum tiling_type tiling);
>>> +bool fast_copy_supports_tiling(int i915, enum tiling_type tiling);
>>> +bool xy_src_copy_supports_tiling(int i915, enum tiling_type tiling);
>>> +bool src_copy_supports_tiling(int i915, enum tiling_type tiling);
>>> +
>>> +const char *blt_tiling_name(enum tiling_type tiling);
>>> +#endif // BLT_TILING_H
>>> diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
>>> index 54193565..9b291862 100644
>>> --- a/lib/i915/i915_blt.c
>>> +++ b/lib/i915/i915_blt.c
>>> @@ -207,59 +207,7 @@ bool blt_supports_compression(int i915)
>>>   	return HAS_FLATCCS(devid);
>>>   }
>>>   
>>> -/**
>>> - * blt_supports_tiling:
>>> - * @i915: drm fd
>>> - * @tiling: tiling id
>>> - *
>>> - * Function checks if blitter supports @tiling on @i915 device.
>>> - *
>>> - * Returns:
>>> - * true if it does, false otherwise.
>>> - */
>>> -bool blt_supports_tiling(int i915, enum blt_tiling tiling)
>>> -{
>>> -	uint32_t devid = intel_get_drm_devid(i915);
>>> -
>>> -	if (tiling == T_XMAJOR) {
>>> -		if (IS_TIGERLAKE(devid) || IS_DG1(devid))
>>> -			return false;
>>> -		else
>>> -			return true;
>>> -	}
>>> -
>>> -	if (tiling == T_YMAJOR) {
>>> -		if (IS_TIGERLAKE(devid) || IS_DG1(devid))
>>> -			return true;
>>> -		else
>>> -			return false;
>>> -	}
>>> -
>>> -	return true;
>>> -}
>>> -
>>> -/**
>>> - * blt_tiling_name:
>>> - * @tiling: tiling id
>>> - *
>>> - * Returns:
>>> - * name of @tiling passed. Useful to build test names.
>>> - */
>>> -const char *blt_tiling_name(enum blt_tiling tiling)
>>> -{
>>> -	switch (tiling) {
>>> -	case T_LINEAR: return "linear";
>>> -	case T_XMAJOR: return "xmajor";
>>> -	case T_YMAJOR: return "ymajor";
>>> -	case T_TILE4:  return "tile4";
>>> -	case T_TILE64: return "tile64";
>>> -	}
>>> -
>>> -	igt_warn("invalid tiling passed: %d\n", tiling);
>>> -	return NULL;
>>> -}
>>> -
>>> -static int __block_tiling(enum blt_tiling tiling)
>>> +static int __block_tiling(enum tiling_type tiling)
>>>   {
>>>   	switch (tiling) {
>>>   	case T_LINEAR: return 0;
>>> @@ -267,6 +215,9 @@ static int __block_tiling(enum blt_tiling tiling)
>>>   	case T_YMAJOR: return 1;
>>>   	case T_TILE4:  return 2;
>>>   	case T_TILE64: return 3;
>>> +	/* type only supported in gen9 fast copy */
>>> +	case T_YFMAJOR:
>>> +		break;
>>>   	}
>>>   
>>>   	igt_warn("invalid tiling passed: %d\n", tiling);
>>> @@ -891,13 +842,14 @@ struct gen12_fast_copy_data {
>>>   	} dw09;
>>>   };
>>>   
>>> -static int __fast_tiling(enum blt_tiling tiling)
>>> +static int __fast_tiling(enum tiling_type tiling)
>>>   {
>>>   	switch (tiling) {
>>>   	case T_LINEAR: return 0;
>>>   	case T_XMAJOR: return 1;
>>>   	case T_YMAJOR: return 2;
>>>   	case T_TILE4:  return 2;
>>> +	case T_YFMAJOR: return 2;
>>>   	case T_TILE64: return 3;
>>>   	}
>>>   	return 0;
>>> diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
>>> index 34db9bb9..f1cf5408 100644
>>> --- a/lib/i915/i915_blt.h
>>> +++ b/lib/i915/i915_blt.h
>>> @@ -47,6 +47,7 @@
>>>   #include <malloc.h>
>>>   #include "drm.h"
>>>   #include "igt.h"
>>> +#include "blt_tiling.h"
>>>   
>>>   #define CCS_RATIO 256
>>>   
>>> @@ -59,14 +60,6 @@ enum blt_color_depth {
>>>   	CD_128bit,
>>>   };
>>>   
>>> -enum blt_tiling {
>>> -	T_LINEAR,
>>> -	T_XMAJOR,
>>> -	T_YMAJOR,
>>> -	T_TILE4,
>>> -	T_TILE64,
>>> -};
>>> -
>>>   enum blt_compression {
>>>   	COMPRESSION_DISABLED,
>>>   	COMPRESSION_ENABLED,
>>> @@ -83,7 +76,7 @@ struct blt_copy_object {
>>>   	uint32_t region;
>>>   	uint64_t size;
>>>   	uint8_t mocs;
>>> -	enum blt_tiling tiling;
>>> +	enum tiling_type tiling;
>>>   	enum blt_compression compression;  /* BC only */
>>>   	enum blt_compression_type compression_type; /* BC only */
>>>   	uint32_t pitch;
>>> @@ -165,8 +158,7 @@ struct blt_ctrl_surf_copy_data {
>>>   };
>>>   
>>>   bool blt_supports_compression(int i915);
>>> -bool blt_supports_tiling(int i915, enum blt_tiling tiling);
>>> -const char *blt_tiling_name(enum blt_tiling tiling);
>>> +bool blt_supports_tiling(int i915, enum tiling_type tiling);
>>>   
>>>   uint64_t emit_blt_block_copy(int i915,
>>>   			     uint64_t ahnd,
>>> diff --git a/lib/meson.build b/lib/meson.build
>>> index c79e3e95..33c8daad 100644
>>> --- a/lib/meson.build
>>> +++ b/lib/meson.build
>>> @@ -3,6 +3,7 @@ lib_sources = [
>>>   	'dmabuf_sync_file.c',
>>>   	'huc_copy.c',
>>>   	'i915/gem.c',
>>> +	'i915/blt_tiling.c',
>>>   	'i915/gem_context.c',
>>>   	'i915/gem_create.c',
>>>   	'i915/gem_engine_topology.c',
>>> diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
>>> index 751f65e6..4c137c94 100644
>>> --- a/tests/i915/gem_ccs.c
>>> +++ b/tests/i915/gem_ccs.c
>>> @@ -46,7 +46,7 @@ struct test_config {
>>>   
>>>   static void set_object(struct blt_copy_object *obj,
>>>   		       uint32_t handle, uint64_t size, uint32_t region,
>>> -		       uint8_t mocs, enum blt_tiling tiling,
>>> +		       uint8_t mocs, enum tiling_type tiling,
>>>   		       enum blt_compression compression,
>>>   		       enum blt_compression_type compression_type)
>>>   {
>>> @@ -108,7 +108,7 @@ static void set_surf_object(struct blt_ctrl_surf_copy_object *obj,
>>>   static struct blt_copy_object *
>>>   create_object(int i915, uint32_t region,
>>>   	      uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
>>> -	      enum blt_tiling tiling,
>>> +	      enum tiling_type tiling,
>>>   	      enum blt_compression compression,
>>>   	      enum blt_compression_type compression_type,
>>>   	      bool create_mapping)
>>> @@ -374,7 +374,7 @@ static void block_copy(int i915,
>>>   		       const intel_ctx_t *ctx,
>>>   		       const struct intel_execution_engine2 *e,
>>>   		       uint32_t region1, uint32_t region2,
>>> -		       enum blt_tiling mid_tiling,
>>> +		       enum tiling_type mid_tiling,
>>>   		       const struct test_config *config)
>>>   {
>>>   	struct blt_copy_data blt = {};
>>> @@ -492,7 +492,7 @@ static void block_multicopy(int i915,
>>>   			    const intel_ctx_t *ctx,
>>>   			    const struct intel_execution_engine2 *e,
>>>   			    uint32_t region1, uint32_t region2,
>>> -			    enum blt_tiling mid_tiling,
>>> +			    enum tiling_type mid_tiling,
>>>   			    const struct test_config *config)
>>>   {
>>>   	struct blt_copy3_data blt3 = {};
>>> @@ -581,7 +581,7 @@ static const struct {
>>>   	const char *suffix;
>>>   	void (*copyfn)(int, const intel_ctx_t *,
>>>   		       const struct intel_execution_engine2 *,
>>> -		       uint32_t, uint32_t, enum blt_tiling,
>>> +		       uint32_t, uint32_t, enum tiling_type,
>>>   		       const struct test_config *);
>>>   } copyfns[] = {
>>>   	[BLOCK_COPY] = { "", block_copy },
>>> @@ -596,6 +596,7 @@ static void block_copy_test(int i915,
>>>   {
>>>   	struct igt_collection *regions;
>>>   	const struct intel_execution_engine2 *e;
>>> +	int tiling;
>>>   
>>>   	if (config->compression && !blt_supports_compression(i915))
>>>   		return;
>>> @@ -603,8 +604,8 @@ static void block_copy_test(int i915,
>>>   	if (config->inplace && !config->compression)
>>>   		return;
>>>   
>>> -	for (int tiling = T_LINEAR; tiling <= T_TILE64; tiling++) {
>>> -		if (!blt_supports_tiling(i915, tiling) ||
>>> +	for_each_tiling(tiling) {
>>> +		if (!block_copy_supports_tiling(i915, tiling) ||
>>>   		    (param.tiling >= 0 && param.tiling != tiling))
>>>   			continue;
>>>   
>>> @@ -663,7 +664,7 @@ static int opt_handler(int opt, int opt_index, void *data)
>>>   		igt_debug("Print surface info: %d\n", param.print_surface_info);
>>>   		break;
>>>   	case 't':
>>> -		param.tiling = atoi(optarg);
>>> +		param.tiling = 1 << atoi(optarg);
>>>   		igt_debug("Tiling: %d\n", param.tiling);
>>>   		break;
>>>   	case 'W':
>>> @@ -702,7 +703,7 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>>   	igt_fixture {
>>>   		i915 = drm_open_driver(DRIVER_INTEL);
>>>   		igt_require_gem(i915);
>>> -		igt_require(AT_LEAST_GEN(intel_get_drm_devid(i915), 12) > 0);
>>> +		igt_require(can_block_copy(i915));
>>>   
>>>   		query_info = gem_get_query_memory_regions(i915);
>>>   		igt_require(query_info);
>>> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
>>> index 75121d41..8cff35d5 100644
>>> --- a/tests/i915/gem_lmem_swapping.c
>>> +++ b/tests/i915/gem_lmem_swapping.c
>>> @@ -78,7 +78,7 @@ struct object {
>>>   
>>>   static void set_object(struct blt_copy_object *obj,
>>>   		       uint32_t handle, uint64_t size, uint32_t region,
>>> -		       uint8_t mocs, enum blt_tiling tiling,
>>> +		       uint8_t mocs, enum tiling_type tiling,
>>>   		       enum blt_compression compression,
>>>   		       enum blt_compression_type compression_type)
>>>   {
>>> -- 
>>> 2.25.1
>>>
