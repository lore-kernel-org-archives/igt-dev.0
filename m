Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA906E435
 for <igt-dev@lists.freedesktop.org>; Sat,  5 Jun 2021 00:27:08 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Sat, 5 Jun 2021 00:27:05 +0000
Message-ID: <BYAPR11MB3784368A2F9596E6C851F2668A3A9@BYAPR11MB3784.namprd11.prod.outlook.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-15-alan.previn.teres.alexis@intel.com>
 <YLow/eRBdRCNgwD7@intel.com>
In-Reply-To: <YLow/eRBdRCNgwD7@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 14/17] Verify execbuf ok with stale
 prot-buff and regular context
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Will do - thanks.

-----Original Message-----
From: Vivi, Rodrigo <rodrigo.vivi@intel.com> 
Sent: Friday, June 4, 2021 6:56 AM
To: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t 14/17] Verify execbuf ok with stale prot-buff and regular context

On Tue, May 18, 2021 at 03:33:41AM -0700, Alan Previn wrote:
> Add a check to verify that reusing a stale protected buffer in a 
> gem_execbuff call, but using a regular (not-
> protcted) context will succeed despite after a teardown
       ^ typo

with this fixed:
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> (triggered by suspend-resume cycle).
> 
> This ensures that user space applications that choose not to opt-in 
> for strict PXP teardown awareness (by using a regular context) won't 
> suffer gem_execbuff failures if a protected buffer was among the 
> assets used in any of its rendering operations.
> 
> Reuse the existing subtest to minimize the number of suspend resume 
> cycles we take.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  tests/i915/gem_pxp.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c index 
> b4f369ae..e3c21c70 100644
> --- a/tests/i915/gem_pxp.c
> +++ b/tests/i915/gem_pxp.c
> @@ -760,7 +760,7 @@ static void free_exec_assets(int i915, struct 
> simple_exec_assets *data)  static void 
> test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_data *pm)  {
>  	int ret;
> -	struct simple_exec_assets data[2] = {{0}, {0}};
> +	struct simple_exec_assets data[3] = {{0}, {0}, {0}};
>  	uint32_t ctx2;
>  	struct intel_bb *ibb2;
>  
> @@ -777,6 +777,15 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
>  	ret = gem_execbuf_flush_store_dw(i915, data[1].ibb, data[1].ctx, data[1].fencebuf);
>  	igt_assert(ret == 0);
>  
> +	/*
> +	 * For data[2]: Use non-pxp contexts but with protected buffers
> +	 * to verify the "pxp-execution-opt-in" expectation where
> +	 * execution will run without error (not buffer)
> +	 */
> +	prepare_exec_assets(i915, &data[2], false, true);
> +	ret = gem_execbuf_flush_store_dw(i915, data[2].ibb, data[2].ctx, data[2].fencebuf);
> +	igt_assert(ret == 0);
> +
>  	trigger_powermgt_suspend_cycle(i915, pm);
>  
>  	ret = gem_execbuf_flush_store_dw(i915, data[0].ibb, data[0].ctx, 
> data[0].fencebuf); @@ -797,8 +806,12 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
>  	ret = gem_execbuf_flush_store_dw(i915, ibb2, ctx2, data[1].fencebuf);
>  	igt_assert_f((ret == -ENOEXEC), "Executing stale pxp buffer didn't 
> fail with -ENOEXEC\n");
>  
> +	ret = gem_execbuf_flush_store_dw(i915, data[2].ibb, data[2].ctx, data[2].fencebuf);
> +	igt_assert_f((ret == 0), "Opt-out-execution with stale pxp buffer 
> +didn't succeed\n");
> +
>  	free_exec_assets(i915, &data[0]);
>  	free_exec_assets(i915, &data[1]);
> +	free_exec_assets(i915, &data[2]);
>  }
>  
>  igt_main
> --
> 2.25.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
