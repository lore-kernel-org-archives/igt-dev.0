Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11BA10E995
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 10:50:02 +0000 (UTC)
Date: Wed, 15 Mar 2023 11:49:59 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230315104959.kvgwxxudkdq5nl5l@zkempczy-mobl2>
References: <cover.1678804829.git.karolina.stolarek@intel.com>
 <9128e61421af539ff918aea7aeeb3de961dc0fd5.1678804829.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9128e61421af539ff918aea7aeeb3de961dc0fd5.1678804829.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 7/8] lib/intel_cmds_info: Reorder
 blt_tiling_type enum
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

On Tue, Mar 14, 2023 at 03:44:39PM +0100, Karolina Stolarek wrote:
> Move Yf Major up so it follows the order of tiling definitions
> in intel_batchbuffer.h
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/i915/intel_cmds_info.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/i915/intel_cmds_info.h b/lib/i915/intel_cmds_info.h
> index 57e34c4b..9af2f2d9 100644
> --- a/lib/i915/intel_cmds_info.h
> +++ b/lib/i915/intel_cmds_info.h
> @@ -13,8 +13,8 @@ enum blt_tiling_type {
>  	T_XMAJOR,
>  	T_YMAJOR,
>  	T_TILE4,
> -	T_TILE64,
>  	T_YFMAJOR,
> +	T_TILE64,
>  	__BLT_MAX_TILING
>  };
>  
> -- 
> 2.25.1
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
