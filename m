Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF61B10EA04
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 11:05:39 +0000 (UTC)
Date: Fri, 20 Jan 2023 12:05:35 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230120110535.jcty57meyiewlrhs@zkempczy-mobl2>
References: <cover.1674208534.git.karolina.stolarek@intel.com>
 <576ea33a5d45eeb97a776f5d27ce4b7e416a46a0.1674208534.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <576ea33a5d45eeb97a776f5d27ce4b7e416a46a0.1674208534.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v7 2/9] lib/i915_blt: Add T_YFMAJOR
 tiling type
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

On Fri, Jan 20, 2023 at 11:14:02AM +0100, Karolina Stolarek wrote:
> Introduce a tiling type used by older generation in fast copy command.
> Update functions that use blt_tiling_type to handle this type.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/i915/i915_blt.c | 10 ++++++++++
>  lib/i915/i915_blt.h |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
> index 694c818c..a1abc2eb 100644
> --- a/lib/i915/i915_blt.c
> +++ b/lib/i915/i915_blt.c
> @@ -253,6 +253,9 @@ const char *blt_tiling_name(enum blt_tiling_type tiling)
>  	case T_YMAJOR: return "ymajor";
>  	case T_TILE4:  return "tile4";
>  	case T_TILE64: return "tile64";
> +	case T_YFMAJOR: return "yfmajor";
> +	default:
> +		break;
>  	}
>  
>  	igt_warn("invalid tiling passed: %d\n", tiling);
> @@ -267,6 +270,8 @@ static int __block_tiling(enum blt_tiling_type tiling)
>  	case T_YMAJOR: return 1;
>  	case T_TILE4:  return 2;
>  	case T_TILE64: return 3;
> +	default:
> +		break;
>  	}
>  
>  	igt_warn("invalid tiling passed: %d\n", tiling);
> @@ -898,8 +903,13 @@ static int __fast_tiling(enum blt_tiling_type tiling)
>  	case T_XMAJOR: return 1;
>  	case T_YMAJOR: return 2;
>  	case T_TILE4:  return 2;
> +	case T_YFMAJOR: return 2;
>  	case T_TILE64: return 3;
> +	default:
> +		break;
>  	}
> +
> +	igt_warn("invalid tiling passed: %d\n", tiling);
>  	return 0;
>  }
>  
> diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
> index 747eb093..bc375aba 100644
> --- a/lib/i915/i915_blt.h
> +++ b/lib/i915/i915_blt.h
> @@ -65,6 +65,7 @@ enum blt_tiling_type {
>  	T_YMAJOR,
>  	T_TILE4,
>  	T_TILE64,
> +	T_YFMAJOR,
>  };
>  
>  enum blt_compression {
> -- 
> 2.25.1
> 
