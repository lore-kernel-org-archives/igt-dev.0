Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE806E51C
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 14:51:53 +0000 (UTC)
Date: Thu, 19 Nov 2020 15:51:48 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20201119145148.GZ6508@kdec5-desk.ger.corp.intel.com>
References: <20201029044109.17970-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029044109.17970-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_gttfill: Added test
 description for test case
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
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 10:11:09AM +0530, sai.gowtham.ch@intel.com wrote:
> From: sai gowtham <sai.gowtham.ch@intel.com>
> 
> Added test description to all the subtests.
> 
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_exec_gttfill.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> index 8f2336a3..e330c973 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -209,9 +209,13 @@ igt_main
>  		igt_fork_hang_detector(i915);
>  	}
>
Generally it looks good, I would make it a little bit shorter, something like:

> +	igt_describe("This test is to check the basic correctness"
> +			"of handling enough batches to fill gtt");
igt_describe("Check that we can handle enough batches to fill gtt");

Try to do similar below.
Kasia 
>  	igt_subtest("basic") /* just enough to run a single pass */
>  		fillgtt(i915, ALL_ENGINES, 1);
>  
> +	igt_describe("For each engine, it checks the correctness of handling"
> +			"enought batches to fill gtt");
>  	igt_subtest_with_dynamic("engines") {
>  		__for_each_physical_engine(i915, e) {
>  			if (!gem_class_can_store_dword(i915, e->class))
> @@ -222,6 +226,8 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("This Test is to stress and check behaviour/correctness of handling"
> +			"batches to fill gtt");
>  	igt_subtest("all")
>  		fillgtt(i915, ALL_ENGINES, 20);
>  
> -- 
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
