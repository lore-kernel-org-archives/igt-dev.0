Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D130310E18A
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 08:42:14 +0000 (UTC)
Message-ID: <57c57f09-eadc-4a9a-86a9-c40b72caca98@intel.com>
Date: Mon, 13 Nov 2023 09:42:09 +0100
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <cover.1699647258.git.akshata.jahagirdar@intel.com>
 <4f3357f4020e149066b73f6e6d2bf9ed025f4c31.1699647258.git.akshata.jahagirdar@intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <4f3357f4020e149066b73f6e6d2bf9ed025f4c31.1699647258.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] lib: add blt command properties for
 lunarlake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com,
 matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 10.11.2023 22:24, Akshata Jahagirdar wrote:
> Add blt_cmd_info structs to describe properties of XY_BLOCK_COPY and XY_FAST_COPY blitter commands for XE2 platform. Updated the definitions for Lunarlake.

Nit: break the commit message at 80 column

> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>   lib/intel_cmds_info.c   | 24 ++++++++++++++++++++++++
>   lib/intel_cmds_info.h   |  1 +
>   lib/intel_device_info.c |  2 +-
>   3 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index 2e51ec081..fc3554271 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -67,6 +67,22 @@ static const struct blt_cmd_info
>   						 BLT_CMD_EXTENDED |
>   						 BLT_CMD_SUPPORTS_COMPRESSION);
>   
> +static const struct blt_cmd_info				
> +		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> +						 BIT(T_LINEAR) |
> +						 BIT(T_XMAJOR) |
> +						 BIT(T_TILE4)  |
> +						 BIT(T_TILE64),
> +						 BLT_CMD_EXTENDED |
> +						 BLT_CMD_SUPPORTS_COMPRESSION);

I know this might be too much work, but could we confirm that XMAJOR is
actually supported with block copy on this platform? This could be as
easy as running xe_ccs test with -p parameter, and then checking the mid
image and the tiling pattern. But I won't argue it's essential for r-b,
it's more of a sanity check.

> +
> +static const struct blt_cmd_info
> +		xe2_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> +					    BIT(T_LINEAR) |
> +					    BIT(T_XMAJOR) |
> +					    BIT(T_TILE4)  |
> +					    BIT(T_TILE64));

This looks a lot like dg2_xy_fast_copy definition. Why not reuse it when
defining xe2_cmds_info?

With these comments addressed:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> +
>   static const struct blt_cmd_info
>   		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
>   						 BIT(T_LINEAR) |
> @@ -169,6 +185,14 @@ const struct intel_cmds_info gen12_pvc_cmds_info = {
>   	}
>   };
>   
> +
> +const struct intel_cmds_info xe2_cmds_info  = {
> +	.blt_cmds = {
> +		[XY_FAST_COPY] = &xe2_xy_fast_copy,
> +		[XY_BLOCK_COPY] = &xe2_xy_block_copy,
> +	}
> +};
> +
>   const struct blt_cmd_info *blt_get_cmd_info(const struct intel_cmds_info *cmds_info,
>   					    enum blt_cmd_type cmd)
>   {
> diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> index f9e3932d1..0a83b6a44 100644
> --- a/lib/intel_cmds_info.h
> +++ b/lib/intel_cmds_info.h
> @@ -55,6 +55,7 @@ extern const struct intel_cmds_info gen12_cmds_info;
>   extern const struct intel_cmds_info gen12_dg2_cmds_info;
>   extern const struct intel_cmds_info gen12_mtl_cmds_info;
>   extern const struct intel_cmds_info gen12_pvc_cmds_info;
> +extern const struct intel_cmds_info xe2_cmds_info;
>   
>   #define for_each_tiling(__tiling) \
>   	for (__tiling = T_LINEAR; __tiling < __BLT_MAX_TILING; __tiling++)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 34817f7b6..a669797c3 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -511,7 +511,7 @@ static const struct intel_device_info intel_lunarlake_info = {
>   	.has_4tile = true,
>   	.is_lunarlake = true,
>   	.codename = "lunarlake",
> -	.cmds_info = &gen12_pvc_cmds_info,
> +	.cmds_info = &xe2_cmds_info,
>   };
>   
>   static const struct pci_id_match intel_device_match[] = {
