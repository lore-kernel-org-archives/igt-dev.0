Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205AE10E3DF
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 12:59:39 +0000 (UTC)
Date: Wed, 14 Dec 2022 13:59:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y5nIt8ErlMDRcJ2U@kamilkon-desk1>
References: <20221214125311.44684-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221214125311.44684-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/api_intel_bb: Release the crc32
 reloc offset after use
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

On 2022-12-14 at 13:53:11 +0100, Zbigniew Kempczyński wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> Upon completion of the crc32 calculation, release the relocation offset
> assigned to us by the allocator. Since gem_close()/gem_create() will
> reuse the same handle, the next loop tries to reuse the same relocation
> offset, but complains that it is no longer a match.
> 
> api_intel_bb:11918) DEBUG: size:          4, cpu crc: 0x2144df1c (time: 0.000), gpu crc: 0x2144df1c (time: 0.000) [ EQUAL ]
> (api_intel_bb:11918) intel_allocator_reloc-CRITICAL: Test assertion failure function intel_allocator_reloc_alloc, file ../lib/intel_allocator_reloc.c:90:
> (api_intel_bb:11918) intel_allocator_reloc-CRITICAL: Failed assertion: rec->size == size
> (api_intel_bb:11918) intel_allocator_reloc-CRITICAL: error: 0x4 != 0x10
> (api_intel_bb:11918) igt_core-INFO: Stack trace:
> (api_intel_bb:11918) igt_core-INFO:   #0 ../lib/igt_core.c:2064 __igt_fail_assert()
> (api_intel_bb:11918) igt_core-INFO:   #1 [intel_allocator_reloc_alloc+0x11b]
> (api_intel_bb:11918) igt_core-INFO:   #2 ../lib/intel_allocator.c:604 handle_request()
> (api_intel_bb:11918) igt_core-INFO:   #3 ../lib/intel_allocator.c:1125 __intel_allocator_alloc()
> (api_intel_bb:11918) igt_core-INFO:   #4 ../lib/intel_allocator.c:1150 intel_allocator_alloc()
> (api_intel_bb:11918) igt_core-INFO:   #5 ../lib/i915/i915_crc.c:256 i915_crc32()
> (api_intel_bb:11918) igt_core-INFO:   #6 ../tests/i915/api_intel_bb.c:1519 __igt_unique____real_main1565()
> (api_intel_bb:11918) igt_core-INFO:   #7 ../tests/i915/api_intel_bb.c:1565 main()
> (api_intel_bb:11918) igt_core-INFO:   #8 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
> (api_intel_bb:11918) igt_core-INFO:   #9 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
> (api_intel_bb:11918) igt_core-INFO:   #10 [_start+0x25]
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/api_intel_bb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 980906f4ed..7ccc00aa25 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -1519,6 +1519,8 @@ static void test_crc32(int i915, const intel_ctx_t *ctx,
>  			  "gpu crc: 0x%08x (time: %.3f) [ %s ]\n",
>  			  (long long) size, cpu_crc, cpu_time, gpu_crc, gpu_time,
>  			  cpu_crc == gpu_crc ? "EQUAL" : "DIFFERENT");
> +
> +		put_offset(ahnd, data);
>  		gem_close(i915, data);
>  		igt_assert(cpu_crc == gpu_crc);
>  	}
> -- 
> 2.34.1

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
