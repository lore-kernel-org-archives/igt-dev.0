Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C955E10E503
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 16:00:13 +0000 (UTC)
Date: Thu, 23 Feb 2023 16:59:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230223155934.q3ubf7cx2zmrrhq4@kamilkon-desk1>
References: <20230223081119.21616-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223081119.21616-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_softpin: Ensure gpu is idle
 when we use manual placement
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

On 2023-02-23 at 09:11:19 +0100, Zbigniew Kempczyński wrote:
> For separate execution there is no risk we may reserve offset which is
> still in use by some job. But for running bunch of allocator tests
> which may be still on gpu such risk exists. To avoid failures on
> grouped execution ensure for 'nopin' subtests gpu is idle first.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

lgtm,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> ---
>  tests/i915/gem_softpin.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index ad6d3f531c..c29bfd43d9 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -1449,13 +1449,17 @@ igt_main
>  
>  		igt_describe("Check that we can combine manual placement with automatic"
>  			     " GTT placement.");
> -		igt_subtest("allocator-nopin")
> +		igt_subtest("allocator-nopin") {
> +			gem_quiescent_gpu(fd);
>  			test_allocator_nopin(fd, false);
> +		}
>  
>  		igt_describe("Check that we can combine manual placement with automatic"
>  			     " GTT placement and reserves/unreserves space for objects.");
> -		igt_subtest("allocator-nopin-reserve")
> +		igt_subtest("allocator-nopin-reserve") {
> +			gem_quiescent_gpu(fd);
>  			test_allocator_nopin(fd, true);
> +		}
>  
>  		igt_describe("Check if multiple processes can use alloctor.");
>  		igt_subtest("allocator-fork")
> -- 
> 2.34.1
> 
