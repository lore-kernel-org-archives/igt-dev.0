Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFFBFB44BB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 06:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22EF10E111;
	Fri, 24 Apr 2026 06:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmrsD1uA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D16110E111
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 06:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777013645; x=1808549645;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pKJ7ZopWBJG397z+tI8vmblQmLdQXtDRCKdISQNvZ0I=;
 b=fmrsD1uAd1z8fmNu7j/6v5lTk+4ifIQXXBNU+HGK6CDmKYkZWG5EtRkh
 XxD1Mm2wvqhxOF1UuK64hePjQHNE+CnC6Q0d2rgwkNZethqrFojHN4hXm
 JEBb0rSWtq5DtKcGKE9AI/2W300VPxk4el9Y3riUiREGt71hR/kV+zTkr
 HtOU0+nEiFU0MiuGzX8r3P74ijfmYyIJNCpOtXtLYHwhvDEOCZmhx4m1c
 uPInkjDFG1k2E8Hr18ERC7SoAB6MjrR00q0Pz1D4I6TBN0Qn/cc0pCKUn
 8ekShZ1fS2fiWM0ssRonKFgDTZcCiXFWjig9llSaKDssu0UgOrI2udDLm Q==;
X-CSE-ConnectionGUID: Nc8B33EqQByqIQBsl2KE5w==
X-CSE-MsgGUID: c+OZ+MjBTpajpJRYeB+eEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="103454872"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="103454872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 23:54:05 -0700
X-CSE-ConnectionGUID: HtErOt3GQDKr6JOs63GDSQ==
X-CSE-MsgGUID: ghQB+7zvQG6zmifDRXGGqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="256394854"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.28])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 23:54:04 -0700
Date: Fri, 24 Apr 2026 08:54:02 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 01/10] lib/intel/genxml: Add genxml generators, headers,
 and build integration
Message-ID: <yrsvsxxc5zy77sfdktznp5bazkmfp3wjqk6ionid5bi7ibnces@vkfd2et24nym>
References: <20260415220720.1594414-1-jan.maslak@intel.com>
 <20260415220720.1594414-2-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260415220720.1594414-2-jan.maslak@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2026 at 12:07:11AM +0200, Jan Maslak wrote:

<cut>

I'm sorry but I'm reviewing your code partially.

> diff --git a/lib/intel/genxml/igt_genxml_defs.h b/lib/intel/genxml/igt_genxml_defs.h
> new file mode 100644
> index 000000000..3acedf0b1
> --- /dev/null
> +++ b/lib/intel/genxml/igt_genxml_defs.h
> @@ -0,0 +1,335 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2016 Intel Corporation
> + * Copyright © 2025 Intel Corporation
> + *
> + * Self-contained header providing all definitions that genxml-generated
> + * pack headers need.  Replaces Mesa's util/bitpack_helpers.h and
> + * genX_helpers.h so that IGT can use genxml without pulling in Mesa's
> + * build system.
> + */
> +
> +#ifndef IGT_GENXML_DEFS_H
> +#define IGT_GENXML_DEFS_H
> +
> +#include <assert.h>
> +#include <math.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <string.h>
> +
> +/* -- compiler helpers ----------------------------------------------- */
> +
> +#ifndef ALWAYS_INLINE
> +#define ALWAYS_INLINE inline __attribute__((always_inline))
> +#endif
> +
> +#ifndef ASSERTED
> +#ifdef NDEBUG
> +#define ASSERTED __attribute__((unused))
> +#else
> +#define ASSERTED
> +#endif
> +#endif
> +
> +#ifndef UNUSED
> +#define UNUSED __attribute__((unused))
> +#endif
> +
> +#ifndef CLAMP
> +#define CLAMP(x, lo, hi) ((x) < (lo) ? (lo) : ((x) > (hi) ? (hi) : (x)))
> +#endif
> +
> +/* -- bit-field helpers ---------------------------------------------- */
> +
> +#ifndef BITFIELD64_BIT
> +#define BITFIELD64_BIT(b)  (1ull << (b))
> +#endif
> +
> +#ifndef BITFIELD64_MASK
> +#define BITFIELD64_MASK(b) \
> +	((b) == 64 ? (~0ull) : BITFIELD64_BIT(b) - 1)
> +#endif
> +
> +/* -- int-range helpers (Mesa u_math.h equivalents) ------------------ */
> +
> +static inline ALWAYS_INLINE int64_t
> +u_intN_min(unsigned bits)
> +{
> +	return -(INT64_C(1) << (bits - 1));
> +}
> +
> +static inline ALWAYS_INLINE int64_t
> +u_intN_max(unsigned bits)
> +{
> +	return (INT64_C(1) << (bits - 1)) - 1;
> +}
> +
> +static inline ALWAYS_INLINE uint64_t
> +u_uintN_max(unsigned bits)
> +{
> +	return (bits == 64) ? UINT64_MAX : (UINT64_C(1) << bits) - 1;
> +}
> +
> +/* -- validation hook (no-op outside Valgrind) ----------------------- */
> +
> +#ifndef util_bitpack_validate_value
> +#define util_bitpack_validate_value(x)
> +#endif
> +
> +/* -- bitpack functions ---------------------------------------------- */
> +
> +ALWAYS_INLINE static uint64_t
> +util_bitpack_ones(uint32_t start, uint32_t end)
> +{
> +	return (UINT64_MAX >> (64 - (end - start + 1))) << start;
> +}
> +
> +ALWAYS_INLINE static uint64_t
> +util_bitpack_uint(uint64_t v, uint32_t start, UNUSED uint32_t end)
> +{
> +#ifndef NDEBUG
> +	const int bits = end - start + 1;
> +	if (bits < 64) {
> +		const uint64_t max = u_uintN_max(bits);
> +		assert(v <= max);
> +	}
> +#endif

In IGT case NDEBUG cannot be defined - see meson.build lines 22-25.
So I think you can drop ifndef/endif here.

> +	util_bitpack_validate_value(v);
> +	return v << start;
> +}
> +
> +ALWAYS_INLINE static uint64_t
> +util_bitpack_uint_nonzero(uint64_t v, uint32_t start, uint32_t end)
> +{
> +	assert(v != 0ull);
> +	return util_bitpack_uint(v, start, end);
> +}
> +
> +ALWAYS_INLINE static uint64_t
> +util_bitpack_sint(int64_t v, uint32_t start, uint32_t end)
> +{
> +	const int bits = end - start + 1;
> +	const uint64_t mask = BITFIELD64_MASK(bits);
> +	util_bitpack_validate_value(v);
> +#ifndef NDEBUG
> +	if (bits < 64) {
> +		const int64_t min = u_intN_min(bits);
> +		const int64_t max = u_intN_max(bits);
> +		assert(min <= v && v <= max);
> +	}
> +#endif

Ditto

> +	return (v & mask) << start;
> +}
> +
> +ALWAYS_INLINE static uint64_t
> +util_bitpack_sint_nonzero(int64_t v, uint32_t start, uint32_t end)
> +{
> +	assert(v != 0ll);
> +	return util_bitpack_sint(v, start, end);
> +}
> +
> +ALWAYS_INLINE static uint32_t
> +util_bitpack_float(float v)
> +{
> +	union { float f; uint32_t dw; } x;
> +	util_bitpack_validate_value(v);
> +	x.f = v;
> +	return x.dw;
> +}
> +
> +ALWAYS_INLINE static uint32_t
> +util_bitpack_float_nonzero(float v)
> +{
> +	assert(v != 0.0f);
> +	return util_bitpack_float(v);
> +}
> +
> +ALWAYS_INLINE static uint64_t
> +util_bitpack_sfixed(float v, uint32_t start, uint32_t end,
> +		    uint32_t fract_bits)
> +{
> +	const float factor = (1 << fract_bits);
> +	const int64_t int_val = llroundf(v * factor);
> +	const uint64_t mask = UINT64_MAX >> (64 - (end - start + 1));
> +	util_bitpack_validate_value(v);
> +#ifndef NDEBUG
> +	{
> +		const int total_bits = end - start + 1;
> +		const float min = u_intN_min(total_bits) / factor;
> +		const float max = u_intN_max(total_bits) / factor;
> +		assert(min <= v && v <= max);
> +	}
> +#endif

Ditto.

> +	return (int_val & mask) << start;
> +}
> +
> +ALWAYS_INLINE static uint64_t
> +util_bitpack_sfixed_clamp(float v, uint32_t start, uint32_t end,
> +			  uint32_t fract_bits)
> +{
> +	const float factor = (1 << fract_bits);
> +	const int total_bits = end - start + 1;
> +	const float min = u_intN_min(total_bits) / factor;
> +	const float max = u_intN_max(total_bits) / factor;
> +	const int64_t int_val = llroundf(CLAMP(v, min, max) * factor);
> +	const uint64_t mask = UINT64_MAX >> (64 - (end - start + 1));
> +	util_bitpack_validate_value(v);
> +	return (int_val & mask) << start;
> +}
> +
> +ALWAYS_INLINE static uint64_t
> +util_bitpack_sfixed_nonzero(float v, uint32_t start, uint32_t end,
> +			    uint32_t fract_bits)
> +{
> +	assert(v != 0.0f);
> +	return util_bitpack_sfixed(v, start, end, fract_bits);
> +}
> +
> +ALWAYS_INLINE static uint64_t
> +util_bitpack_ufixed(float v, uint32_t start, ASSERTED uint32_t end,
> +		    uint32_t fract_bits)
> +{
> +	const float factor = (1 << fract_bits);
> +	const uint64_t uint_val = llroundf(v * factor);
> +	util_bitpack_validate_value(v);
> +#ifndef NDEBUG
> +	{
> +		const int total_bits = end - start + 1;
> +		const float min = 0.0f;
> +		const float max = u_uintN_max(total_bits) / factor;
> +		assert(min <= v && v <= max);
> +	}
> +#endif

Ditto.

> +	return uint_val << start;
> +}
> +
> +ALWAYS_INLINE static uint64_t
> +util_bitpack_ufixed_clamp(float v, uint32_t start, ASSERTED uint32_t end,
> +			  uint32_t fract_bits)
> +{
> +	const float factor = (1 << fract_bits);
> +	const int total_bits = end - start + 1;
> +	const float min = 0.0f;
> +	const float max = u_uintN_max(total_bits) / factor;
> +	const uint64_t uint_val = llroundf(CLAMP(v, min, max) * factor);
> +	util_bitpack_validate_value(v);
> +	return uint_val << start;
> +}
> +
> +ALWAYS_INLINE static uint64_t
> +util_bitpack_ufixed_nonzero(float v, uint32_t start, uint32_t end,
> +			    uint32_t fract_bits)
> +{
> +	assert(v != 0.0f);
> +	return util_bitpack_ufixed(v, start, end, fract_bits);
> +}
> +
> +/* -- address type and combine function ------------------------------ */
> +
> +struct igt_address {
> +	uint64_t offset;          /* full GPU address to pack into dwords */
> +	uint32_t handle;          /* GEM handle; 0 = no reloc needed */
> +	uint32_t read_domains;
> +	uint32_t write_domain;
> +	uint64_t presumed_offset; /* BO base address (for computing bo_delta) */
> +};
> +
> +struct intel_bb;
> +
> +/*
> + * Declared here so __gen_combine_address can call it.
> + * Also declared in intel_batchbuffer.h; suppress the warning
> + * when both headers are included.
> + */
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wredundant-decls"
> +uint64_t intel_bb_offset_reloc_with_delta(struct intel_bb *ibb,
> +					  uint32_t handle,
> +					  uint32_t read_domains,
> +					  uint32_t write_domain,
> +					  uint32_t delta,
> +					  uint32_t offset,
> +					  uint64_t presumed_offset);
> +#pragma GCC diagnostic pop
> +
> +#define __gen_address_type  struct igt_address
> +#define __gen_user_data     struct intel_bb
> +
> +/*
> + * __gen_combine_address - called by genxml pack functions for every
> + * address field.  If the address carries a GEM handle, automatically
> + * register a relocation with intel_bb.
> + *
> + * @ibb:      batch buffer (passed as __gen_user_data*)
> + * @location: pointer to the dword(s) being written in the batch
> + * @addr:     address descriptor (offset + optional reloc metadata)
> + * @delta:    flag bits that genxml packed below the address field
> + */
> +static inline ALWAYS_INLINE uint64_t
> +__gen_combine_address(struct intel_bb *ibb,
> +		      void *location,
> +		      struct igt_address addr, uint32_t delta)
> +{
> +	if (addr.handle) {
> +		uint32_t batch_offset =
> +			(uint8_t *)location - (uint8_t *)ibb->batch;
> +		uint32_t bo_delta =
> +			(uint32_t)(addr.offset - addr.presumed_offset);
> +
> +		intel_bb_offset_reloc_with_delta(ibb, addr.handle,
> +						 addr.read_domains,
> +						 addr.write_domain,
> +						 bo_delta + delta,
> +						 batch_offset,
> +						 addr.presumed_offset);
> +	}
> +
> +	return addr.offset + delta;
> +}
> +
> +/* -- validation hook (no-op) ---------------------------------------- */
> +
> +#ifndef __gen_validate_value
> +#define __gen_validate_value(x)
> +#endif

Do we need the above? I don't see any usage of this.

> +
> +/* -- offset helper -------------------------------------------------- */
> +
> +static inline ALWAYS_INLINE uint64_t
> +__gen_offset(uint64_t v, ASSERTED uint32_t start, ASSERTED uint32_t end)
> +{
> +#ifndef NDEBUG
> +	uint64_t mask = (~0ull >> (64 - (end - start + 1))) << start;
> +	assert((v & ~mask) == 0);
> +#endif

Same as above about NDEBUG.

> +	__gen_validate_value(v);
> +	return v;
> +}
> +
> +static inline ALWAYS_INLINE uint64_t
> +__gen_offset_nonzero(uint64_t v, uint32_t start, uint32_t end)
> +{
> +	assert(v != 0ull);
> +	return __gen_offset(v, start, end);
> +}
> +
> +/* -- address helper ------------------------------------------------- */
> +
> +static inline ALWAYS_INLINE uint64_t
> +__gen_address(__gen_user_data *data, void *location,
> +	      __gen_address_type address, uint32_t delta,
> +	      __attribute__((unused)) uint32_t start, uint32_t end)
> +{
> +	uint64_t addr_u64 = __gen_combine_address(data, location, address, delta);
> +	if (end == 31) {
> +		return addr_u64;
> +	} else if (end < 63) {
> +		const unsigned shift = 63 - end;
> +		return (addr_u64 << shift) >> shift;
> +	} else {
> +		return addr_u64;
> +	}
> +}
> +
> +#endif /* IGT_GENXML_DEFS_H */

I started looking into generated code according to __gen_address and
for an example - xe2_pack.h: GFX20_RENDER_SURFACE_STATE_pack():

const uint64_t v10 =
   util_bitpack_uint(values->MipRegionWidthInLog2, 0, 3) |
   util_bitpack_uint(values->MipRegionHeightInLog2, 4, 7) |
   util_bitpack_uint(values->ProceduralTexture, 11, 11) |
   util_bitpack_uint(values->YOffsetforVPlane, 32, 45) |
   util_bitpack_uint(values->XOffsetforVPlane, 48, 61);
const uint64_t v10_address =
   __gen_address(data, &dw[10], values->AuxiliarySurfaceBaseAddress, v10, 12, 63);
dw[10] = v10_address;
dw[11] = (v10_address >> 32) | (v10 >> 32);
}

As __gen_address() calls __gen_combine_address() shouldn't it return

return addr.offset | delta;

as currently it returns addr.offset + delta;

I guess this work because addr.offset has lower 12bits off, but | looks
safer to me.

--
Zbigniew
