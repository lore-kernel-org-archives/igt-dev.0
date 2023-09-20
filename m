Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EF910E036
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Sep 2023 07:52:18 +0000 (UTC)
Date: Wed, 20 Sep 2023 09:51:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230920075145.575jmjs3ojqxhdgg@kamilkon-desk.igk.intel.com>
References: <20230918164747.30171-1-nirmoy.das@intel.com>
 <20230918164747.30171-5-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230918164747.30171-5-nirmoy.das@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/intel/gem_spin_batch: Skip
 some test on MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: andi.shyti@intel.com, oak.zeng@intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nirmoy,
On 2023-09-18 at 18:47:47 +0200, Nirmoy Das wrote:
> We do GGTT update on MTL using bcs engine, blocking that would
> fail the test so skip such subtests on bcs engine for MTL.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/gem_spin_batch.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
> index 18873be16..ec1458e35 100644
> --- a/tests/intel/gem_spin_batch.c
> +++ b/tests/intel/gem_spin_batch.c
> @@ -227,6 +227,9 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>  		if (!gem_class_can_store_dword(i915, e->class))
>  			continue;
>  
> +		if (gem_engine_can_block_ggtt_binder(i915, e))
> +			continue;
> +
>  		if (flags & PARALLEL_SPIN_NEW_CTX)
>  			ctx = intel_ctx_create(i915, &cfg);
>  		ahnd = get_reloc_ahnd(i915, ctx->id);
> -- 
> 2.41.0
> 
