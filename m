Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D087C10E78B
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 14:42:38 +0000 (UTC)
Date: Wed, 8 Nov 2023 15:37:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
Message-ID: <20231108143702.uagltus6q6ioixyu@kamilkon-desk.igk.intel.com>
References: <cover.1699473138.git.akshata.jahagirdar@intel.com>
 <7de5782983c927d98dd7fa228d1dffb15987cfd1.1699473138.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7de5782983c927d98dd7fa228d1dffb15987cfd1.1699473138.git.akshata.jahagirdar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] XE2: LNL: adding Blt command
 support for Lunarlake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

please correct subject of you mail/patch, now it reads:

[PATCH i-g-t 1/2] XE2: LNL: adding Blt command support for Lunarlake

but it should be like:

[PATCH i-g-t 1/2] lib: adding Blt command support for Lunarlake

Add (short) description here what did you added, for example
what command did you add.

Add proper From: and s-o-b:, now I see:

Author: Jahagirdar, Akshata <akshata.jahagirdar@intel.com>

it should be:

Author: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

At the end of patch add s-o-b like:

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Regards,
Kamil

On 2023-11-08 at 11:57:05 -0800, Jahagirdar, Akshata wrote:
> ---
>  lib/intel_cmds_info.c   | 24 ++++++++++++++++++++++++
>  lib/intel_cmds_info.h   |  1 +
>  lib/intel_device_info.c |  2 +-
>  3 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index 2e51ec081..fc3554271 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -67,6 +67,22 @@ static const struct blt_cmd_info
>  						 BLT_CMD_EXTENDED |
>  						 BLT_CMD_SUPPORTS_COMPRESSION);
>  
> +static const struct blt_cmd_info				
> +		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> +						 BIT(T_LINEAR) |
> +						 BIT(T_XMAJOR) |
> +						 BIT(T_TILE4)  |
> +						 BIT(T_TILE64),
> +						 BLT_CMD_EXTENDED |
> +						 BLT_CMD_SUPPORTS_COMPRESSION);
> +
> +static const struct blt_cmd_info
> +		xe2_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> +					    BIT(T_LINEAR) |
> +					    BIT(T_XMAJOR) |
> +					    BIT(T_TILE4)  |
> +					    BIT(T_TILE64));
> +
>  static const struct blt_cmd_info
>  		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
>  						 BIT(T_LINEAR) |
> @@ -169,6 +185,14 @@ const struct intel_cmds_info gen12_pvc_cmds_info = {
>  	}
>  };
>  
> +
> +const struct intel_cmds_info xe2_cmds_info  = {
> +	.blt_cmds = {
> +		[XY_FAST_COPY] = &xe2_xy_fast_copy,
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
