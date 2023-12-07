Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8A910E1E1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 13:55:29 +0000 (UTC)
Date: Thu, 7 Dec 2023 14:55:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [Patch v1] fixed malformed pipectrl command in PXP IGT
 tests
Message-ID: <20231207135508.nwsltwe2cmalg4gz@kamilkon-desk.igk.intel.com>
References: <20231205025537.1528864-1-vivaik.balasubrawmanian@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205025537.1528864-1-vivaik.balasubrawmanian@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vivaik,
On 2023-12-04 at 18:55:37 -0800, Vivaik Balasubrawmanian wrote:
> Five i915 PXP IGT tests were failing due to malformed Pipe-Ctrl cmd.
> 
> cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
- ^^
s/cc:/Cc:/

> Signed-off-by: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/gem_pxp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index 4aea765fe..dff4a5d25 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -841,7 +841,7 @@ static void emit_pipectrl(struct intel_bb *ibb, struct intel_buf *fenceb, bool b
>  	uint32_t pipe_ctl_flags = 0;
>  	uint32_t ps_op_id;
>  
> -	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(4));
> +	intel_bb_out(ibb, GFX_OP_PIPE_CONTROL(2));
>  	intel_bb_out(ibb, pipe_ctl_flags);
>  
>  	if (before)
> 
> base-commit: 222d1bdf8c598bb12164deab127af5d8d7ddc070
> -- 
> 2.34.1
> 
