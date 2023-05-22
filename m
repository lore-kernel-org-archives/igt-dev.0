Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B92C10E2D5
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 11:32:07 +0000 (UTC)
Date: Mon, 22 May 2023 13:32:02 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230522113202.feostmbye6zfkozh@zkempczy-mobl2>
References: <cover.1684747649.git.karolina.stolarek@intel.com>
 <6390a099791da99b9570b7143fd0cbb519450435.1684747649.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6390a099791da99b9570b7143fd0cbb519450435.1684747649.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/intel_cmds_info: Drop
 BLT_CMD_LONG flag
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

On Mon, May 22, 2023 at 11:57:13AM +0200, Karolina Stolarek wrote:
> It looks like a separate flag for longer commands isn't needed
> and we can use BLT_CMD_EXTENDED instead.

If so what for you're introducing this flag in patch 1/4?

--
Zbigniew

> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/i915/intel_cmds_info.c | 2 +-
>  lib/i915/intel_cmds_info.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/lib/i915/intel_cmds_info.c b/lib/i915/intel_cmds_info.c
> index 3ce2fd74b..09b612279 100644
> --- a/lib/i915/intel_cmds_info.c
> +++ b/lib/i915/intel_cmds_info.c
> @@ -87,7 +87,7 @@ static const struct blt_cmd_info
>  						 BIT(T_LINEAR) |
>  						 BIT(T_YMAJOR) |
>  						 BIT(T_XMAJOR),
> -						 BLT_CMD_LONG);
> +						 BLT_CMD_EXTENDED);
>  
>  static const struct blt_cmd_info
>  		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT,
> diff --git a/lib/i915/intel_cmds_info.h b/lib/i915/intel_cmds_info.h
> index 5998a35ca..91d0f15ec 100644
> --- a/lib/i915/intel_cmds_info.h
> +++ b/lib/i915/intel_cmds_info.h
> @@ -34,7 +34,6 @@ struct blt_cmd_info {
>  	uint32_t flags;
>  #define BLT_CMD_EXTENDED               (1 << 0)
>  #define BLT_CMD_SUPPORTS_COMPRESSION   (1 << 1)
> -#define BLT_CMD_LONG                   (1 << 2)
>  };
>  
>  struct intel_cmds_info {
> -- 
> 2.25.1
> 
