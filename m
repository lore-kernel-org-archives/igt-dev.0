Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B0D10F5D7
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Apr 2022 15:27:54 +0000 (UTC)
Date: Wed, 27 Apr 2022 17:08:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmlcXKBdeBJaog8h@kamilkon-DESK1>
References: <20220425105919.508029-1-priyanka.dandamudi@intel.com>
 <20220425105919.508029-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220425105919.508029-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_set_tiling_vs_blt: Add
 description for test case
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

On 2022-04-25 at 16:29:18 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add test description for subtest.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

>  tests/i915/gem_set_tiling_vs_blt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/i915/gem_set_tiling_vs_blt.c b/tests/i915/gem_set_tiling_vs_blt.c
> index bf274be9..5e3bf6a1 100644
> --- a/tests/i915/gem_set_tiling_vs_blt.c
> +++ b/tests/i915/gem_set_tiling_vs_blt.c
> @@ -232,6 +232,7 @@ igt_main
>  		bops = buf_ops_create(fd);
>  	}
>  
> +	igt_describe("Check for proper synchronization of untiled->tiled transition.");
>  	igt_subtest("untiled-to-tiled") {
>  		tiling = I915_TILING_NONE;
>  		tiling_after = I915_TILING_X;
> @@ -240,6 +241,7 @@ igt_main
>  		igt_assert(tiling_after == I915_TILING_X);
>  	}
>  
> +	igt_describe("Check for proper synchronization of tiled->untiled transition.");
>  	igt_subtest("tiled-to-untiled") {
>  		tiling = I915_TILING_X;
>  		tiling_after = I915_TILING_NONE;
> @@ -248,6 +250,7 @@ igt_main
>  		igt_assert(tiling_after == I915_TILING_NONE);
>  	}
>  
> +	igt_describe("Check for proper synchronization of tiled->tiled transition.");
>  	igt_subtest("tiled-to-tiled") {
>  		tiling = I915_TILING_X;
>  		tiling_after = I915_TILING_X;
> -- 
> 2.25.1
> 
