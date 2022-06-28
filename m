Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A916010FF9A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 12:19:08 +0000 (UTC)
Date: Tue, 28 Jun 2022 14:19:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YrrxuPoWtICtW6aS@kamilkon-desk1>
References: <20220628062336.3797258-1-janga.rahul.kumar@intel.com>
 <20220628062336.3797258-2-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628062336.3797258-2-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] tests/prime_vgem : Add subtests
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janga,

On 2022-06-28 at 11:53:35 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add test description to all the available subtests and
> corrected a little old descriptions.
> 
> v2 : Add description to all subtests.
> v3 : Modified subtest description.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/prime_vgem.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 5fa6e537..a8df6413 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -1128,33 +1128,39 @@ igt_main
>  		gem_require_mmap_device_coherent(i915);
>  	}
>  
> +	igt_describe("Examine read access path.");
>  	igt_subtest("basic-read")
>  		test_read(vgem, i915);
>  
> +	igt_describe("Examine write access path.");
>  	igt_subtest("basic-write")
>  		test_write(vgem, i915);
>  
> +	igt_describe("Check that we wrap the vgem mmap with userptr.");
>  	igt_subtest("basic-userptr")
>  		test_userptr(vgem, i915);
>  
> +	igt_describe("Examine access path through GTT.");
>  	igt_subtest("basic-gtt") {
>  		gem_require_mappable_ggtt(i915);
>  		test_gtt(vgem, i915);
>  	}
>  
> -	igt_describe("Examine blitter access path");
> +	igt_describe("Examine blitter access path.");
>  	igt_subtest("basic-blt")
>  		test_blt(vgem, i915);
>  
> +	igt_describe("Examine link establishment between shrinker and vgem bo.");
>  	igt_subtest("shrink")
>  		test_shrink(vgem, i915);
>  
> +	igt_describe("Examine concurrent access of vgem bo.");
>  	igt_subtest("coherency-gtt") {
>  		gem_require_mappable_ggtt(i915);
>  		test_gtt_interleaved(vgem, i915);
>  	}
>  
> -	igt_describe("Examine blitter access path WC coherency");
> +	igt_describe("Examine blitter access path WC coherency.");
>  	igt_subtest("coherency-blt")
>  		test_blt_interleaved(vgem, i915);
>  
> @@ -1163,15 +1169,18 @@ igt_main
>  			const char *name;
>  			void (*fn)(int i915, int vgem, const intel_ctx_t *ctx,
>  				   unsigned int engine);
> +			const char *describe;
>  		} tests[] = {
> -			{ "sync", test_sync },
> -			{ "busy", test_busy },
> -			{ "wait", test_wait },
> +			{ "sync", test_sync, "Examine sync on vegem fence." },
-------------------------------------------------------------- ^
s/vegem/vgem/

> +			{ "busy", test_busy, "Examine busy check of polling for vgem fence." },
> +			{ "wait", test_wait, "Examine wait on vgem fence." },
>  			{ }
>  		};
>  
> -		for(const typeof(*tests) *t = tests; t->name; t++)
> +		for(const typeof(*tests) *t = tests; t->name; t++){
------------------ ^ -------------------------------------------- ^
Put spaces before, like this:
		for (const typeof(*tests) *t = tests; t->name; t++) {

Please use checkpatch from Linux kernel to catch such bugs.

Regards,
Kamil

> +			igt_describe(t->describe);
>  			test_each_engine(t->name, vgem, i915, t->fn);
> +		}
>  	}
>  
>  	/* Fence testing */
> @@ -1180,17 +1189,21 @@ igt_main
>  			igt_require(vgem_has_fences(vgem));
>  		}
>  
> +		igt_describe("Examine read access path fencing.");
>  		igt_subtest("basic-fence-read")
>  			test_fence_read(i915, vgem);
> +
> +		igt_describe("Examine GTT access path fencing.");
>  		igt_subtest("basic-fence-mmap") {
>  			gem_require_mappable_ggtt(i915);
>  			test_fence_mmap(i915, vgem);
>  		}
>  
> -		igt_describe("Examine blitter access path fencing");
> +		igt_describe("Examine blitter access path fencing.");
>  		igt_subtest("basic-fence-blt")
>  			test_fence_blt(i915, vgem);
>  
> +		igt_describe("Examine vgem bo front/back flip fencing.");
>  		igt_subtest("basic-fence-flip")
>  			test_flip(i915, vgem, 0);
>  
> @@ -1199,11 +1212,15 @@ igt_main
>  				igt_require(vgem_fence_has_flag(vgem, WIP_VGEM_FENCE_NOTIMEOUT));
>  			}
>  
> +			igt_describe("Examine read access path fencing with a pending gpu hang.");
>  			igt_subtest("fence-read-hang")
>  				test_fence_hang(i915, vgem, 0);
> +
> +			igt_describe("Examine write access path fencing with a pending gpu hang.");
>  			igt_subtest("fence-write-hang")
>  				test_fence_hang(i915, vgem, VGEM_FENCE_WRITE);
>  
> +			igt_describe("Examine vgem bo front/back flip fencing with a pending gpu hang.");
>  			igt_subtest("fence-flip-hang")
>  				test_flip(i915, vgem, WIP_VGEM_FENCE_NOTIMEOUT);
>  		}
> @@ -1216,6 +1233,7 @@ igt_main
>  			intel_allocator_multiprocess_start();
>  		}
>  
> +		igt_describe("Examine basic dma-buf fence interop.");
>  		test_each_engine("fence-wait", vgem, i915, test_fence_wait);
>  
>  		igt_fixture {
> -- 
> 2.25.1
> 
