Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C1210E342
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 07:16:29 +0000 (UTC)
Date: Mon, 11 Dec 2023 08:16:23 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH i-g-t v3 1/6] lib: Add blt command properties for lunarlake
Message-ID: <20231211071623.6lez47xyqj3q2r4t@zkempczy-mobl2>
References: <cover.1701180818.git.akshata.jahagirdar@intel.com>
 <49026bb5be7adbd33485c61581824076397a0c38.1701180818.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49026bb5be7adbd33485c61581824076397a0c38.1701180818.git.akshata.jahagirdar@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com,
 Mmatthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 30, 2023 at 04:35:25AM -0800, Akshata Jahagirdar wrote:
> Add blt_cmd_info structs to describe properties of XY_BLOCK_COPY and XY_FAST_COPY blitter commands for XE2 platform. Updated the definitions for Lunarlake.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  lib/intel_cmds_info.c   | 17 +++++++++++++++++
>  lib/intel_cmds_info.h   |  1 +
>  lib/intel_device_info.c |  2 +-
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index 2e51ec081..7c8790d8e 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -67,6 +67,15 @@ static const struct blt_cmd_info
>  						 BLT_CMD_EXTENDED |
>  						 BLT_CMD_SUPPORTS_COMPRESSION);
>  
> +static const struct blt_cmd_info				

Trailing spaces. Please use kernel scripts/checkpatch.pl before
sending series.

Fix this and you may add my r-b along with Karolina rb:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> +						 BIT(T_LINEAR) |
> +						 BIT(T_XMAJOR) |
> +						 BIT(T_TILE4)  |
> +						 BIT(T_TILE64),
> +						 BLT_CMD_EXTENDED |
> +						 BLT_CMD_SUPPORTS_COMPRESSION);
> +
>  static const struct blt_cmd_info
>  		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
>  						 BIT(T_LINEAR) |
> @@ -169,6 +178,14 @@ const struct intel_cmds_info gen12_pvc_cmds_info = {
>  	}
>  };
>  
> +
> +const struct intel_cmds_info xe2_cmds_info  = {
> +	.blt_cmds = {
> +		[XY_FAST_COPY] = &dg2_xy_fast_copy,
> +		[XY_BLOCK_COPY] = &xe2_xy_block_copy,
> +	}
> +};
> +
>  const struct blt_cmd_info *blt_get_cmd_info(const struct intel_cmds_info *cmds_info,
>  					    enum blt_cmd_type cmd)
>  {
> diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> index f9e3932d1..0a83b6a44 100644
> --- a/lib/intel_cmds_info.h
> +++ b/lib/intel_cmds_info.h
> @@ -55,6 +55,7 @@ extern const struct intel_cmds_info gen12_cmds_info;
>  extern const struct intel_cmds_info gen12_dg2_cmds_info;
>  extern const struct intel_cmds_info gen12_mtl_cmds_info;
>  extern const struct intel_cmds_info gen12_pvc_cmds_info;
> +extern const struct intel_cmds_info xe2_cmds_info;
>  
>  #define for_each_tiling(__tiling) \
>  	for (__tiling = T_LINEAR; __tiling < __BLT_MAX_TILING; __tiling++)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 34817f7b6..a669797c3 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -511,7 +511,7 @@ static const struct intel_device_info intel_lunarlake_info = {
>  	.has_4tile = true,
>  	.is_lunarlake = true,
>  	.codename = "lunarlake",
> -	.cmds_info = &gen12_pvc_cmds_info,
> +	.cmds_info = &xe2_cmds_info,
>  };
>  
>  static const struct pci_id_match intel_device_match[] = {
> -- 
> 2.34.1
> 
