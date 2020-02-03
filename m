Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3186EB72
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 09:28:21 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 03 Feb 2020 10:28:13 +0100
Message-ID: <3589468.P6aOVXCMJy@jkrzyszt-desk.ger.corp.intel.com>
In-Reply-To: <20200131173109.12527-2-ramalingam.c@intel.com>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
 <20200131173109.12527-2-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/9] tests/prime_vgem: Skip fence and
 gtt specific tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, January 31, 2020 6:31:01 PM CET Ramalingam C wrote:
> In the absence of the mappable aperture, skip GTT and
> fence specific tests.
> 
> v2:
>   requirement check is moved to subtest start [Zbigniew]
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  tests/prime_vgem.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 3bdb23007d56..c483cbe722ea 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -846,14 +846,18 @@ igt_main
>  	igt_subtest("basic-write")
>  		test_write(vgem, i915);
>  
> -	igt_subtest("basic-gtt")
> +	igt_subtest("basic-gtt") {
> +		gem_require_mappable_ggtt(i915);
>  		test_gtt(vgem, i915);
> +	}
>  
>  	igt_subtest("shrink")
>  		test_shrink(vgem, i915);
>  
> -	igt_subtest("coherency-gtt")
> +	igt_subtest("coherency-gtt") {
> +		gem_require_mappable_ggtt(i915);
>  		test_gtt_interleaved(vgem, i915);
> +	}
>  
>  	for (e = intel_execution_engines; e->name; e++) {
>  		igt_subtest_f("%ssync-%s",
> @@ -902,8 +906,10 @@ igt_main
>  
>  		igt_subtest("basic-fence-read")
>  			test_fence_read(i915, vgem);
> -		igt_subtest("basic-fence-mmap")
> +		igt_subtest("basic-fence-mmap") {
> +			gem_require_mappable_ggtt(i915);
>  			test_fence_mmap(i915, vgem);
> +		}
>  
>  		for (e = intel_execution_engines; e->name; e++) {
>  			igt_subtest_f("%sfence-wait-%s",
> 

As discussed before, we need blitter based replacements for completeness, but 
those skips are needed anyway, better than failures we currently get, as long 
as we decided to not provide support for non-GTT mapping of dma-buf objects.

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Thanks,
Janusz



_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
