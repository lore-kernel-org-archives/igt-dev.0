Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8FC112114
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 08:28:49 +0000 (UTC)
Date: Fri, 1 Apr 2022 13:59:28 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Message-ID: <20220401082927.GA12046@intel.com>
References: <20220401072826.6447-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220401072826.6447-1-arjun.melkaveri@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_lmem_swapping: Fix bug
 in test_smem_oom
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

On 2022-04-01 at 12:58:26 +0530, Arjun Melkaveri wrote:
> ctx was not initialized with all physical engines,
> after device reopening.
> This change would resolve assert issue seen in __do_evict.
> 
> v2: Added missing intel_ctx_destroy.
> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_lmem_swapping.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 43f0688f..432607b0 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -428,10 +428,14 @@ static void test_smem_oom(int i915,
>  
>  		fill_params(i915, &params, region, 0, 1, true);
>  
> +		ctx = intel_ctx_create_all_physical(fd);
> +		__gem_context_set_persistence(fd, ctx->id, false);
> +
igt fixture already creates same kind of context and pass it here. Could
we reuse it across all the child and parent processes?

Or we need independed context only?

Ram.

>  		igt_install_exit_handler(smem_oom_exit_handler);
>  		__do_evict(fd, ctx, &region->region, &params,
>  			   params.seed + child + 1);
>  
> +		intel_ctx_destroy(fd, ctx);
>  		close(fd);
>  	}
>  
> -- 
> 2.25.1
> 
