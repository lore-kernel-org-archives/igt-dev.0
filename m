Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B065CCAC5A5
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 06:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEFB10E0D5;
	Tue, 23 Sep 2025 06:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFe08VWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CA610E0D5
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 06:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758609113; x=1790145113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I98SErxtw+82iVPjHRJkGU6cxWsKFUmBP6vhBone/CQ=;
 b=jFe08VWpluVqNhF4XxiJkaQdm1oasaP5CBgUVyygwfpxvx0x6VRrVeXT
 F3old/C0JmJNJwtun8pi2639jeEDU9EPBq76GcFaHQNV061xIcYMbaR8W
 G4+LKv4t2lns9KtqpeBejgClZPUEG5pPsivaPguvgQyPdcYeQquAM8W1g
 uXmBWawam41TQ/MyjTZWkg49H9y3RldaHTdYS0Gw5u7PQ22gxQx1GNXK4
 fdPuTAZP6NBJeHoecJlkYJmfois5wyNrHjoocb5WxK+JWvrCs9MA9h9du
 oaD7wzxwnp6IOcCHagrpzX6kXLaENCEjWEnqA1f8FsmV/LpGh5nh4nM2o w==;
X-CSE-ConnectionGUID: dhotsIaqTyS0plSS2MEEww==
X-CSE-MsgGUID: dvt2+lSASE28rBhZfd3JSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71502235"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="71502235"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:31:52 -0700
X-CSE-ConnectionGUID: v1qKp1nnRoKDhI1IGcIcPg==
X-CSE-MsgGUID: PTQViNmoTbK6SCycnnymig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="180693562"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.223])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:31:51 -0700
Date: Tue, 23 Sep 2025 08:31:47 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, gwan-gyeong.mun@intel.com, 
 andrzej.hajda@intel.com
Subject: Re: [PATCH 2/4] lib/gpgpu_shader: add function for computing max
 number of threads per tg
Message-ID: <e2mzwqd6hhajhaskxenfscdekeoo2r3xu75of7czc6wf2zh6ee@n7qalhp7w5jz>
References: <20250917165541.85203-1-jan.maslak@intel.com>
 <20250917165541.85203-3-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917165541.85203-3-jan.maslak@intel.com>
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

On Wed, Sep 17, 2025 at 04:55:39PM +0000, Jan Maslak wrote:
> Adds function gpgpu_shader__get_max_threads_in_tg() that computes the
> maximum allowed amount of threads in a thread group based on the provided
> shader.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  lib/gpgpu_shader.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/gpgpu_shader.h | 10 +++++++
>  2 files changed, 85 insertions(+)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index e8600de23..39908c491 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -282,6 +282,9 @@ struct gpgpu_shader *gpgpu_shader_create(int fd)
>  	shdr->code = malloc(4 * shdr->max_size);
>  	shdr->labels = igt_map_create(igt_map_hash_32, igt_map_equal_32);
>  	shdr->num_threads_in_tg = 1;
> +	shdr->large_grf_mode = false;
> +	shdr->simd_size = 16;  /* Default SIMD size */
> +	shdr->hw_local_id_generation = false;
>  	shdr->vrt = VRT_DISABLED;
>  	igt_assert(shdr->code);
>  
> @@ -333,6 +336,78 @@ void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes
>  	shdr->vrt = vrt;
>  }
>  
> +static uint32_t compute_max_threads_in_tg_no_vrt(bool large_grf_mode,
> +						 uint32_t simd_size)
> +{
> +	/* BSpec: 56590 */
> +	if (large_grf_mode)
> +		return 32;
> +	if (simd_size == 16)
> +		return 64;
> +	if (simd_size == 32)
> +		return 32;


As this is part of gpgpu_shader.c I think you should implement it for
all Xe, Xe2, Xe3. Above applies to Xe2 and also partially. For
large-grf-mode == 0, simd_size == 32 and hw_local_id_generation == 0
Xe2 allows max threads in tg == 64.

> +
> +	igt_warn("Unsupported SIMD size %d\n", simd_size);
> +	return 1;

1 is as safe choice for fixing later during cleaning tests with warning?

> +}
> +
> +static uint32_t compute_max_threads_in_tg_vrt(enum gpgpu_shader_vrt_modes vrt,
> +					      uint32_t simd_size,
> +					      bool hw_local_id_generation)
> +{
> +	/* BSpec: 56590 */
> +	if (vrt <= VRT_128) {
> +		if (simd_size == 16)
> +			return 64;
> +		if (simd_size == 32) {
> +			if (hw_local_id_generation)
> +				return 32;
> +			else
> +				return 64;
> +		}
> +	} else if (vrt == VRT_160) {
> +		if (simd_size == 16)
> +			return 48;
> +		if (simd_size == 32) {
> +			if (hw_local_id_generation)
> +				return 32;
> +			else
> +				return 48;
> +		}
> +	} else if (vrt == VRT_192) {
> +		if (simd_size == 16)
> +			return 40;
> +		if (simd_size == 32) {
> +			if (hw_local_id_generation)
> +				return 32;
> +			else
> +				return 40;
> +		}
> +	}

Ok, I see in below enum you're using max VRT_192, so above is correct.

Just loose thought - maybe collecting these numbers into a table
with for iterator would be more readable? Especially extending for
other vrt's would only require change in the table.
But this is not a blocker and might be changed later.


> +
> +	igt_warn("Unsupported VRT mode %d or SIMD size %d\n", vrt, simd_size);
> +	return 1;
> +}
> +
> +/**
> + * gpgpu__shader_get_max_threads_in_tg:
> + * @shdr: shader to query
> + *
> + * Returns the maximum number of threads in thread group for the given shader
> + * based on its current configuration (VRT mode, SIMD size, etc.).

+ Xe version

--
Zbigniew

> + *
> + * Returns: maximum number of threads in thread group
> + */
> +uint32_t gpgpu_shader__get_max_threads_in_tg(struct gpgpu_shader *shdr)
> +{
> +	if (shdr->vrt == VRT_DISABLED) {
> +		return compute_max_threads_in_tg_no_vrt(shdr->large_grf_mode, shdr->simd_size);
> +	} else {
> +		return compute_max_threads_in_tg_vrt(shdr->vrt, shdr->simd_size,
> +						     shdr->hw_local_id_generation);
> +	}
> +}
> +
>  /**
>   * gpgpu_shader__breakpoint_on:
>   * @shdr: shader to create breakpoint in
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 90ef3eec8..be84525ce 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -14,7 +14,12 @@ struct intel_bb;
>  struct intel_buf;
>  
>  enum gpgpu_shader_vrt_modes {
> +	VRT_32 = 0x0,
> +	VRT_64 = 0x1,
>  	VRT_96 = 0x2,
> +	VRT_128 = 0x3,
> +	VRT_160 = 0x4,
> +	VRT_192 = 0x5,
>  	VRT_DISABLED,
>  };
>  
> @@ -29,6 +34,9 @@ struct gpgpu_shader {
>  	struct igt_map *labels;
>  	bool illegal_opcode_exception_enable;
>  	uint32_t num_threads_in_tg;
> +	bool large_grf_mode;
> +	uint32_t simd_size;
> +	bool hw_local_id_generation;
>  	enum gpgpu_shader_vrt_modes vrt;
>  };
>  
> @@ -72,6 +80,8 @@ static inline uint32_t gpgpu_shader_last_instr(struct gpgpu_shader *shdr)
>  
>  void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes vrt);
>  
> +uint32_t gpgpu_shader__get_max_threads_in_tg(struct gpgpu_shader *shdr);
> +
>  void gpgpu_shader__wait(struct gpgpu_shader *shdr);
>  void gpgpu_shader__breakpoint_on(struct gpgpu_shader *shdr, uint32_t cmd_no);
>  void gpgpu_shader__breakpoint(struct gpgpu_shader *shdr);
> -- 
> 2.34.1
> 
