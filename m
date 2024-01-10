Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DED10E656
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 18:30:45 +0000 (UTC)
Date: Wed, 10 Jan 2024 19:30:39 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Subject: Re: [PATCH i-g-t] lib/intel_cmds_info: Add MEM_COPY/SET support for
 Lunarlake
Message-ID: <20240110183039.eri6nrjts6hmwx57@zkempczy-mobl2>
References: <20240109095602.9620-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240109095602.9620-1-sai.gowtham.ch@intel.com>
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

On Tue, Jan 09, 2024 at 03:26:02PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Enable MEM_COPY/SET instructions support for Lunarlake, which
> allows to validate MEM_COPY/SET tests.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/intel_cmds_info.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index 56073bd6d..669d3e500 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -182,6 +182,8 @@ const struct intel_cmds_info xe2_cmds_info  = {
>  	.blt_cmds = {
>  		[XY_FAST_COPY] = &dg2_xy_fast_copy,
>  		[XY_BLOCK_COPY] = &xe2_xy_block_copy,
> +		[MEM_COPY] = &pvc_mem_copy,
> +		[MEM_SET] = &pvc_mem_set,
>  	}
>  };
>  
> -- 
> 2.39.1
> 

Looks good and works fine:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
