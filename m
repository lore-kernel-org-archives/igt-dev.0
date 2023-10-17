Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB74410E009
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 08:52:31 +0000 (UTC)
Date: Tue, 17 Oct 2023 10:52:27 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <20231017085227.4yo7u4nkc3jg2ik3@zkempczy-mobl2>
References: <20231016180716.8513-1-sai.gowtham.ch@intel.com>
 <20231016180716.8513-3-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231016180716.8513-3-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/intel_cmds_info: Add M_MATRIX
 in mem_copy as it is supported for PVC
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

On Mon, Oct 16, 2023 at 11:37:15PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Adding M_MATRIX copy type in MEM_COPY as it is supported for PVC
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/intel_cmds_info.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index 1bf13fdc1..2e51ec081 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -84,7 +84,8 @@ static const struct blt_cmd_info
>  
>  static const struct blt_cmd_info
>  		pvc_mem_copy = BLT_INFO(MEM_COPY,
> -					BIT(M_LINEAR));
> +					BIT(M_LINEAR) |
> +					BIT(M_MATRIX));
>  
>  static const struct blt_cmd_info
>  		pvc_mem_set = BLT_INFO(MEM_SET,
> -- 
> 2.39.1
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
