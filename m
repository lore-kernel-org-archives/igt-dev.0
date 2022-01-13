Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5FF10E132
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jan 2022 22:17:11 +0000 (UTC)
Date: Thu, 13 Jan 2022 14:17:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <YeCk5STeL0BGJAJu@mdroper-desk1.amr.corp.intel.com>
References: <20220110061141.1655017-1-priyanka.dandamudi@intel.com>
 <20220110061141.1655017-3-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110061141.1655017-3-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915/gem_ctx_exec: Skip
 test for shared reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 10, 2022 at 11:41:41AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> The test tries to submit non-preemptible spinneris to all engines,
> causes a hang and expects the non-preemptible spinners to survive
> but fails to do for RCS+CCS.
> So, updated the code to skip nohangcheck subtest for a platform with RCS+CCS.
> 
> v2: Some minor fixes (Ashutosh).
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_ctx_exec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index a1270a88..4c21542d 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -292,6 +292,7 @@ static void nohangcheck_hostile(int i915)
>  	ahnd = get_reloc_ahnd(i915, ctx->id);
>  
>  	igt_require(__enable_hangcheck(dir, false));
> +	igt_require(!has_shared_reset_domain(i915, ctx));

RCS and CCS engines share a reset domain, but all of the other engines
(bcs, vcs, vecs) should still reset independently.  Shouldn't we still
test that the other engines are not impacted (and conversely that they
do not impact the RCS/CCS engines)?


Matt

>  
>  	for_each_ctx_engine(i915, ctx, e) {
>  		igt_spin_t *spin;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
