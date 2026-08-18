Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15CCC5DF67
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 07:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D3D10E187;
	Tue, 18 Aug 2026 07:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5AUfLlW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE5110E187
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787039351; x=1818575351;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RNBMBUarsLaN5aB9e9tYHkvWdhpdhnkgXXUjBJ/lUWY=;
 b=n5AUfLlWsdz7HMLhFY+1PzqzYHJjcAhC/v79a32MzBKO926shCJxVb2C
 Nq9vKm9q2iSLHDFY52RrEtQQMtBu+krYGJSXVh75wd88aAdADbm2R1bwe
 y58vveDwGg8UN6/2GPtlOt10zUe+4/ZsC1wyz0NlzIAWdbd8NrVo3MfAT
 ygqpsd0ItbHUKKyE1/WHlfdTnljpWo6WZN86m3sfDE9jtUOSdvDFEgnH8
 9IKiwuQuKflFm0h2nH23eQqLK9O/xTU7Ctj9Rg0tzpsf/Othe55UutSC5
 QJM72PFkF6RT5STlGrH2w9Ml/uAncJlZpl+VzuqhKHGGM+xslsspuHdTC g==;
X-CSE-ConnectionGUID: ACtr9JiHRbm7vjTcZhCf6Q==
X-CSE-MsgGUID: P5kUUXFCQFyN9MglGfEENA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75055496"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="75055496"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 00:49:11 -0700
X-CSE-ConnectionGUID: 1hUGLWyjRTqYy7J3TuL43g==
X-CSE-MsgGUID: AfbU2MG6S7GdHNFb4XWqBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="295079019"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:49:09 -0700
Date: Tue, 18 Aug 2026 09:48:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Varun Gupta <varun.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_prefetch_fault: add L2 prefetch
 fault subtests
Message-ID: <20260818074852.62rrk7rf5yuysr4w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Varun Gupta <varun.gupta@intel.com>, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20260818052716.156973-1-varun.gupta@intel.com>
 <20260818052716.156973-3-varun.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818052716.156973-3-varun.gupta@intel.com>
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

Hi Varun,
On 2026-08-18 at 10:57:16 +0530, Varun Gupta wrote:
> Add L2 prefetch fault testing. When L1 cache policy is
> set to uncached (UC), the prefetch bypasses LSC and is sourced from L2
> instead.
> 
> Add a new shader gpgpu_shader__l2_prefetch_fault() that uses message
> descriptor 0x49C00 (L1UC_L2C_L3UC, cache control value 4) instead of
> the existing 0x99C00 (L1C_L2C_L3C, cache control value 9). Only bits
> [19:16] of the descriptor differ.

When you add a new shader you also need to add it to compiled
source in tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c

Now linking on armhf fails with:

[1314/1800] Linking target tests/xe_prefetch_fault
FAILED: tests/xe_prefetch_fault 
/usr/bin/arm-linux-gnueabihf-gcc  -o tests/xe_prefetch_fault tests/xe_prefetch_fault.p/intel_xe_prefetch_fault.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group lib/libigt.so.0 /usr/lib/arm-linux-gnueabihf/libcairo.so /usr/lib/arm-linux-gnueabihf/libglib-2.0.so /usr/lib/arm-linux-gnueabihf/libdrm.so /usr/lib/arm-linux-gnueabihf/libdw.so /usr/lib/arm-linux-gnueabihf/libelf.so /usr/lib/arm-linux-gnueabihf/libkmod.so /usr/lib/arm-linux-gnueabihf/libpci.so /usr/lib/arm-linux-gnueabihf/libudev.so -lm /usr/lib/arm-linux-gnueabihf/libpciaccess.so /usr/lib/arm-linux-gnueabihf/libpixman-1.so -pthread -lrt -lz /usr/lib/arm-linux-gnueabihf/libdrm_nouveau.so /usr/lib/arm-linux-gnueabihf/libdrm_amdgpu.so /usr/lib/arm-linux-gnueabihf/libunwind.so /usr/lib/arm-linux-gnueabihf/libgsl.so /usr/lib/arm-linux-gnueabihf/libgslcblas.so /usr/lib/arm-linux-gnueabihf/libasound.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/opt/builds/build/lib
/usr/lib/gcc-cross/arm-linux-gnueabihf/10/../../../../arm-linux-gnueabihf/bin/ld: tests/xe_prefetch_fault.p/intel_xe_prefetch_fault.c.o: in function `gpgpu_shader__l2_prefetch_fault':
/opt/builds/build/../tests/intel/xe_prefetch_fault.c:97: undefined reference to `iga64_code_xe_l2_prefetch_fault_prefetch'
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.

+cc Andrzej Hajda



Regards,
Kamil

> 
> Add two new subtests:
>   - l2-prefetch-fault: validates L2 prefetch fault with unmapped address
>     followed by hit-under-miss with mapped page
>   - l2-prefetch-fault-svm: same as above but in SVM mode with HMM-backed
>     CPU page table resolution
> 
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  tests/intel/xe_prefetch_fault.c | 97 +++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
> index e86cd68d9..4843f56fd 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -81,6 +81,56 @@ L0:
>  	)", lower_32_bits(addr), upper_32_bits(addr));
>  }
>  
> +/**
> + * gpgpu_shader__l2_prefetch_fault:
> + * @shdr: shader to be modified
> + * @addr: ppgtt virtual address to raise L2 prefetch fault
> + *
> + * This shader can only be used when in efficient 64bit mode.
> + * For a given arbitrary ppgtt virtual address, it raises an L2 prefetch fault
> + * using load instruction with L1 uncached + L2 cached cache policy.
> + * With L1 uncached, the prefetch bypasses LSC and is sourced from L2.
> + */
> +static void gpgpu_shader__l2_prefetch_fault(struct gpgpu_shader *shdr,
> +					    uint64_t addr)
> +{
> +	igt_assert_f((addr & 0x7) == 0, "address must be aligned to QWord!\n");
> +
> +	emit_iga64_code(shdr, xe_l2_prefetch_fault_prefetch, R"(
> +#define IGA64_FLAGS ""
> +#if GFX_VER >= 4000
> +#elif GFX_VER >= 3500
> +L0:
> +// Set base address with scalar register
> +(W)	mov (1)		s0.0<1>:ud		ARG(0):ud
> +(W)	mov (1)		s0.1<1>:ud		ARG(1):ud
> +
> +// A64 offset
> +(W)	mov (8)		r30.0<1>:uq		0x0:uq
> +
> +// efficient 64bit Read with uncached L1, cached L2 and uncached L3
> +// sendg ugm load - L2 prefetch (L1 bypass)
> +// Message Descriptor
> +//      DP_LOAD_STORE_STATELESS_DESC (HAS:2209865465)
> +//      DP_CACHE_LOAD (HAS:2209865465) value 4 = L1UC_L2C_L3UC
> +//      0x49C00 =>
> +//      [45:44] Offset Scaling: 0 (disable)
> +//      [43:22] Global Offset: 0
> +//      [21] Overfetch: 0 (disable)
> +//      [19:16] Cache: 4 (L1 uncached, L2 cached and L3 uncached)
> +//      [15:14] Address Type and Size: 2 (Flat A64 Base, A64 Index)
> +//      [13:11] Data Size: 3 (D64)
> +//      [10:10] Transpose : 1 (enable)
> +//      [9:7] Vector Size: 0 (Vector length 1)
> +//      [5:0] Opcode: 0 (Load)
> +// Prefetch operations are implemented using a NULL destination register.
> +// L1 uncached forces the prefetch to bypass LSC, making L2 the fault source.
> +(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x49C00	{A@1,$5}
> +
> +#endif
> +	)", lower_32_bits(addr), upper_32_bits(addr));
> +}
> +
>  static struct intel_buf *
>  create_buf(int fd, int width, int height, uint32_t color)
>  {
> @@ -130,6 +180,17 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
>  	return shader;
>  }
>  
> +static struct gpgpu_shader *get_l2_prefetch_shader(int fd)
> +{
> +	struct gpgpu_shader *shader;
> +
> +	shader = gpgpu_shader_create(fd);
> +	gpgpu_shader__l2_prefetch_fault(shader, xe_canonical_va(fd, PREFETCH_ADDR));
> +	gpgpu_shader__eot(shader);
> +
> +	return shader;
> +}
> +
>  /**
>   * SUBTEST: prefetch-fault
>   * Description: Validate L1 prefetch fault and hit-under-miss behavior with
> @@ -140,6 +201,16 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
>   * Description: Validate L1 prefetch fault and hit-under-miss behavior in SVM
>   *		mode with L1 cached, L2 cached cache policy (fault source: LSC)
>   * Run type: FULL
> + *
> + * SUBTEST: l2-prefetch-fault
> + * Description: Validate L2 prefetch fault and hit-under-miss behavior with
> + *		L1 uncached, L2 cached cache policy (fault source: L2)
> + * Run type: FULL
> + *
> + * SUBTEST: l2-prefetch-fault-svm
> + * Description: Validate L2 prefetch fault and hit-under-miss behavior in SVM
> + *		mode with L1 uncached, L2 cached cache policy (fault source: L2)
> + * Run type: FULL
>   */
>  static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe,
>  				bool svm, get_shader_fn get_shader)
> @@ -296,6 +367,32 @@ int igt_main()
>  		}
>  	}
>  
> +	igt_subtest_with_dynamic("l2-prefetch-fault") {
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> +			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
> +				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_prefetch_fault(fd, hwe, false,
> +							    get_l2_prefetch_shader);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("l2-prefetch-fault-svm") {
> +		if (!svm_supported)
> +			igt_skip("SVM not supported on this device, skipping.\n");
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> +			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
> +				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_prefetch_fault(fd, hwe, true,
> +							    get_l2_prefetch_shader);
> +			}
> +		}
> +	}
> +
>  	igt_fixture() {
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.43.0
> 
