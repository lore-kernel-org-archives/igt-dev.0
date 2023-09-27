Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76ED10E4DB
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 11:22:27 +0000 (UTC)
Date: Wed, 27 Sep 2023 13:22:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <20230927112224.pc54ygtkghrqp5od@zkempczy-mobl2>
References: <20230926122749.32460-1-sai.gowtham.ch@intel.com>
 <20230926122749.32460-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926122749.32460-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/intel_blt: Add check to see if
 blt commands are supported by the platforms
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

On Tue, Sep 26, 2023 at 05:57:47PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> This commit has following changes:
> 
> 1. Add check to see if blt commands are supported by the platforms.
> 2. Add MEM_COPY and MEM_SET instructions
> 3. Update cmd info for MEM_COPY and MEM_SET
> 4. Add copy type used for MEM_COPY and MEM_SET.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/intel_blt.c       | 32 ++++++++++++++++++++++++++++++++
>  lib/intel_blt.h       |  2 ++
>  lib/intel_cmds_info.c | 12 ++++++++++++
>  lib/intel_cmds_info.h |  7 +++++++
>  4 files changed, 53 insertions(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 429511920..b55fa9b52 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -289,6 +289,38 @@ bool blt_has_block_copy(int fd)
>  	return blt_supports_command(cmds_info, XY_BLOCK_COPY);
>  }
>  
> +/**
> + * blt_has_mem_copy
> + * @fd: drm fd
> + *
> + * Check if mem copy is supported by @fd device
> + *
> + * Returns:
> + * true if it does, false otherwise.
> + */
> +bool blt_has_mem_copy(int fd)
> +{
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
> +
> +	return blt_supports_command(cmds_info, MEM_COPY);
> +}
> +
> +/**
> + * blt_has_mem_set
> + * @fd: drm fd
> + *
> + * Check if mem set is supported by @fd device
> + *
> + * Returns:
> + * true if it does, false otherwise.
> + */
> +bool blt_has_mem_set(int fd)
> +{
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
> +
> +	return blt_supports_command(cmds_info, MEM_SET);
> +}
> +
>  /**
>   * blt_has_fast_copy
>   * @fd: drm fd
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index b8b3d724d..d9c8883c7 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -175,6 +175,8 @@ bool blt_cmd_has_property(const struct intel_cmds_info *cmds_info,
>  			  uint32_t prop);
>  
>  bool blt_has_block_copy(int fd);
> +bool blt_has_mem_copy(int fd);
> +bool blt_has_mem_set(int fd);
>  bool blt_has_fast_copy(int fd);
>  bool blt_has_xy_src_copy(int fd);
>  bool blt_has_xy_color(int fd);
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index 366b37f2c..2e51ec081 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -82,6 +82,16 @@ static const struct blt_cmd_info
>  						 BIT(T_TILE64),
>  						 BLT_CMD_EXTENDED);
>  
> +static const struct blt_cmd_info
> +		pvc_mem_copy = BLT_INFO(MEM_COPY,
> +					BIT(M_LINEAR) |
> +					BIT(M_MATRIX));

You've decided to pack blt_copy_type to .supported_tiling. I can
accept that conditionally (unless someone else will complain).

> +
> +static const struct blt_cmd_info
> +		pvc_mem_set = BLT_INFO(MEM_SET,
> +				       BIT(M_LINEAR) |
> +				       BIT(M_MATRIX));
> +
>  static const struct blt_cmd_info
>  		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT,
>  						 BIT(T_LINEAR) |
> @@ -154,6 +164,8 @@ const struct intel_cmds_info gen12_pvc_cmds_info = {
>  	.blt_cmds = {
>  		[XY_FAST_COPY] = &pvc_xy_fast_copy,
>  		[XY_BLOCK_COPY] = &pvc_xy_block_copy,
> +		[MEM_COPY] = &pvc_mem_copy,
> +		[MEM_SET] = &pvc_mem_set,
>  	}
>  };
>  
> diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> index 91d0f15ec..7396215e3 100644
> --- a/lib/intel_cmds_info.h
> +++ b/lib/intel_cmds_info.h
> @@ -18,8 +18,15 @@ enum blt_tiling_type {
>  	__BLT_MAX_TILING
>  };
>  
> +enum blt_copy_type {
> +	M_LINEAR,
> +	M_MATRIX,
> +};

I would rather call this 'blt_memop_type'.

With above minor fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +
>  enum blt_cmd_type {
>  	SRC_COPY,
> +	MEM_SET,
> +	MEM_COPY,
>  	XY_SRC_COPY,
>  	XY_FAST_COPY,
>  	XY_BLOCK_COPY,
> -- 
> 2.39.1
> 
