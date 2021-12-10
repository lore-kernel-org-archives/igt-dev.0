Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522E210E22B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Dec 2021 03:25:48 +0000 (UTC)
Date: Thu, 9 Dec 2021 19:20:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20211210032023.GA22348@jons-linux-dev-box>
References: <20211209082053.1412439-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209082053.1412439-1-mastanx.katragadda@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/i915/exec_balancer: Added Skip Guc
 Submission
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mastan Katragadda <mastanx.katragadda@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 09, 2021 at 01:50:53PM +0530, Mastan Katragadda wrote:
> This test makes assumptions about the backend scheduling algorithm that
> a real world UMD would never assume. This test is not testing a UMD-KMD
> contract, rather a specific backend.It is an invalid test case thus we
> are skipping.
> 
> Changes Since v1:
>              -Updated commit message
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/i915/gem_exec_balancer.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index cc07a5a9..d58734ab 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -3320,6 +3320,7 @@ igt_main
>  
>  	igt_subtest_group {
>  		igt_fixture {
> +			igt_require(!gem_using_guc_submission(i915));
>  			intel_allocator_multiprocess_start();
>  		}
>  
> -- 
> 2.25.1
> 
