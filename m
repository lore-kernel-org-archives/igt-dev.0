Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F227610E0BB
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Mar 2023 12:25:37 +0000 (UTC)
Date: Wed, 1 Mar 2023 13:25:33 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230301122533.qievhqypaw3lqxyb@zkempczy-mobl2>
References: <20230301120905.1019314-1-karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230301120905.1019314-1-karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_exercise_blt: Don't allow
 hangs
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

On Wed, Mar 01, 2023 at 01:09:05PM +0100, Karolina Stolarek wrote:
> Hangs in this test are undesirable, so don't allow them.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>

lgtm:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/i915/gem_exercise_blt.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
> index 02c54f85..fb11fb92 100644
> --- a/tests/i915/gem_exercise_blt.c
> +++ b/tests/i915/gem_exercise_blt.c
> @@ -353,7 +353,6 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  	struct igt_collection *set;
>  	const intel_ctx_t *ctx;
>  	int i915;
> -	igt_hang_t hang;
>  
>  	igt_fixture {
>  		i915 = drm_open_driver(DRIVER_INTEL);
> @@ -369,7 +368,6 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  					    I915_SYSTEM_MEMORY,
>  					    I915_DEVICE_MEMORY);
>  		ctx = intel_ctx_create_all_physical(i915);
> -		hang = igt_allow_hang(i915, ctx->id, 0);
>  	}
>  
>  	igt_describe("Check fast-copy blit");
> @@ -383,7 +381,6 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_fixture {
> -		igt_disallow_hang(i915, hang);
>  		close(i915);
>  	}
>  }
> -- 
> 2.25.1
> 
