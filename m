Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD252CCD18E
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 09:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737C310E581;
	Tue, 14 Oct 2025 09:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLdPpP5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB0210E581
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760433298; x=1791969298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xuxtyrr85teskv1rjO3ydUrGzY5ABqW/zgJanaMScD0=;
 b=aLdPpP5B0Y3PhBNsTJWXSgHxKF2G4u1xh5GmioIkLm3DqDY7gixbNHm2
 Cs8oQIL4MlPdSoedFY3WDk50ukUsHmEyK/pB0IJ2BW2N6T2gphNROGCr4
 CDI49G4xz3mfH4OEs9y5eQgfT0ghnhfchkhElJ6/k/A8NJHAUlN1ktvNe
 80eTRExYgVoCi1TNsHQZPNGiCqEz9b4mosM4R8X+2SjH0mr1bMWkhJOA1
 2CyoZM0LWwqHdA7RcgWpTJyYfGKpcjrmwLyX9EpoZav0gLshZ/W01GWKJ
 Y/DdszNfR7IsHeOimbtxkDdF3Wgm30S/YceAbuv/+ktLsV3rHYNJQTUII Q==;
X-CSE-ConnectionGUID: zdo0lldjShmQKzKdd/ZGzQ==
X-CSE-MsgGUID: +pFZ0nYrQYmsGCVb1E/a5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="65211317"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="65211317"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:14:58 -0700
X-CSE-ConnectionGUID: jJ+FQ08+SR62l2JMB59DXQ==
X-CSE-MsgGUID: 6T7SAsCMT0qsXTVqRI0/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="182291134"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.155])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:14:56 -0700
Date: Tue, 14 Oct 2025 11:14:55 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, gwan-gyeong.mun@intel.com
Subject: Re: [PATCH 2/4] lib/gpgpu_shader: add function for computing max
 number of threads per tg
Message-ID: <uzeri5sncnkwe75mfqgnpbqa62sa4f3h54ctwwmpwwq3rpqnjk@ookujlh7xhfl>
References: <20251013134043.1676308-1-jan.maslak@intel.com>
 <20251013134043.1676308-3-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013134043.1676308-3-jan.maslak@intel.com>
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

On Mon, Oct 13, 2025 at 01:40:41PM +0000, Jan Maslak wrote:
> Adds function gpgpu_shader__get_max_threads_in_tg() that computes the
> maximum allowed amount of threads in a thread group based on the provided
> shader and Xe version.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  lib/gpgpu_shader.c | 133 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/gpgpu_shader.h |  11 ++++
>  2 files changed, 144 insertions(+)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index e8600de23..343fd6329 100644
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
> @@ -333,6 +336,136 @@ void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes
>  	shdr->vrt = vrt;
>  }
>  
> +struct max_threads_config {
> +	bool large_grf_mode;
> +	uint32_t simd_size;
> +	bool hw_local_id_generation;
> +	uint32_t max_threads;
> +};
> +
> +static uint32_t compute_max_threads_in_tg_xe2(bool large_grf_mode,
> +					      uint32_t simd_size,
> +					      bool hw_local_id_generation)
> +{
> +	/* BSpec: 56590 */
> +	static const struct max_threads_config configs[] = {
> +		/* large_grf_mode, simd_size, hw_local_id_gen, max_threads */
> +		{ true,  16, false, 32 },
> +		{ true,  16, true,  32 },
> +		{ true,  32, false, 32 },
> +		{ true,  32, true,  32 },
> +		{ false, 16, false, 64 },
> +		{ false, 16, true,  64 },
> +		{ false, 32, false, 64 },
> +		{ false, 32, true,  32 },
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(configs); i++) {
> +		if (configs[i].large_grf_mode == large_grf_mode &&
> +		    configs[i].simd_size == simd_size &&
> +		    configs[i].hw_local_id_generation == hw_local_id_generation)
> +			return configs[i].max_threads;
> +	}
> +
> +	igt_assert_f(0, "Unsupported configuration: large_grf=%d, simd=%d, hw_local_id=%d\n",
> +		     large_grf_mode, simd_size, hw_local_id_generation);

Instead of asserting maybe better would be simply use igt_warn() and
return 1 here as below?

> +	return 1; /* unreachable */
> +}
> +
> +struct vrt_max_threads_config {
> +	enum gpgpu_shader_vrt_modes register_size;
> +	uint32_t simd_size;
> +	bool hw_local_id_generation;
> +	uint32_t max_threads;
> +};
> +
> +static uint32_t compute_max_threads_in_tg_xe3(enum gpgpu_shader_vrt_modes register_size,
> +					      uint32_t simd_size,
> +					      bool hw_local_id_generation)
> +{
> +	/* BSpec: 56590 */
> +	static const struct vrt_max_threads_config configs[] = {
> +		/* register_size, simd_size, hw_local_id_gen, max_threads */
> +		/* Reg-size <= 128: SIMD16 always allows 64 threads */
> +		{ VRT_32,  16, false, 64 },
> +		{ VRT_32,  16, true,  64 },
> +		{ VRT_64,  16, false, 64 },
> +		{ VRT_64,  16, true,  64 },
> +		{ VRT_96,  16, false, 64 },
> +		{ VRT_96,  16, true,  64 },
> +		{ VRT_128, 16, false, 64 },
> +		{ VRT_128, 16, true,  64 },
> +		/* Reg-size <= 128: */
> +		{ VRT_32,  32, false, 64 },
> +		{ VRT_32,  32, true,  32 },
> +		{ VRT_64,  32, false, 64 },
> +		{ VRT_64,  32, true,  32 },
> +		{ VRT_96,  32, false, 64 },
> +		{ VRT_96,  32, true,  32 },
> +		{ VRT_128, 32, false, 64 },
> +		{ VRT_128, 32, true,  32 },
> +		/* Reg-size 160 */
> +		{ VRT_160, 16, false, 48 },
> +		{ VRT_160, 16, true,  48 },
> +		{ VRT_160, 32, false, 48 },
> +		{ VRT_160, 32, true,  32 },
> +		/* Reg-size 192 */
> +		{ VRT_192, 16, false, 40 },
> +		{ VRT_192, 16, true,  40 },
> +		{ VRT_192, 32, false, 40 },
> +		{ VRT_192, 32, true,  32 },
> +		/* Reg-size 256 */
> +		{ VRT_256, 16, false, 32 },
> +		{ VRT_256, 16, true,  32 },
> +		{ VRT_256, 32, false, 32 },
> +		{ VRT_256, 32, true,  32 },
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(configs); i++) {
> +		if (configs[i].register_size == register_size &&
> +		    configs[i].simd_size == simd_size &&
> +		    configs[i].hw_local_id_generation == hw_local_id_generation)
> +			return configs[i].max_threads;
> +	}
> +
> +	igt_assert_f(0, "Unsupported configuration: register_size=%d, simd=%d, hw_local_id=%d\n",
> +		     register_size, simd_size, hw_local_id_generation);

Ditto.

> +	return 1; /* unreachable */
> +}
> +
> +/**
> + * gpgpu__shader_get_max_threads_in_tg:
> + * @shdr: shader to query
> + *
> + * Returns the maximum number of threads in thread group for the given shader
> + * based on its current configuration (VRT mode, SIMD size, etc.) and Xe version.
> + *
> + * Returns: maximum number of threads in thread group
> + */
> +uint32_t gpgpu_shader__get_max_threads_in_tg(struct gpgpu_shader *shdr)
> +{
> +	enum gpgpu_shader_vrt_modes register_size = shdr->vrt;
> +
> +	/* Not implemented for Xe1 platforms  */

s/Xe1/Xe/

--
Zbigniew

> +	if (shdr->gen_ver < 2000)
> +		return 1;
> +
> +	/* Xe2 platforms */
> +	if (shdr->gen_ver < 3000) {
> +		return compute_max_threads_in_tg_xe2(shdr->large_grf_mode,
> +						     shdr->simd_size,
> +						     shdr->hw_local_id_generation);
> +	}
> +
> +	/* Xe3 platforms */
> +	if (shdr->vrt == VRT_DISABLED) {
> +		/* BSpec: 60258 */
> +		register_size = shdr->large_grf_mode ? VRT_256 : VRT_128;
> +	}
> +	return compute_max_threads_in_tg_xe3(register_size, shdr->simd_size,
> +					     shdr->hw_local_id_generation);
> +}
> +
>  /**
>   * gpgpu_shader__breakpoint_on:
>   * @shdr: shader to create breakpoint in
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 90ef3eec8..fc931a72b 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -14,7 +14,13 @@ struct intel_bb;
>  struct intel_buf;
>  
>  enum gpgpu_shader_vrt_modes {
> +	VRT_32 = 0x0,
> +	VRT_64 = 0x1,
>  	VRT_96 = 0x2,
> +	VRT_128 = 0x3,
> +	VRT_160 = 0x4,
> +	VRT_192 = 0x5,
> +	VRT_256 = 0x7,
>  	VRT_DISABLED,
>  };
>  
> @@ -29,6 +35,9 @@ struct gpgpu_shader {
>  	struct igt_map *labels;
>  	bool illegal_opcode_exception_enable;
>  	uint32_t num_threads_in_tg;
> +	bool large_grf_mode;
> +	uint32_t simd_size;
> +	bool hw_local_id_generation;
>  	enum gpgpu_shader_vrt_modes vrt;
>  };
>  
> @@ -72,6 +81,8 @@ static inline uint32_t gpgpu_shader_last_instr(struct gpgpu_shader *shdr)
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
