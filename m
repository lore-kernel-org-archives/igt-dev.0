Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1976F11A56D
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 11:57:21 +0000 (UTC)
Date: Thu, 19 May 2022 13:57:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YoYwnQHjNJCF8Cy3@kamilkon-desk1>
References: <20220518135908.23918-1-sai.gowtham.ch@intel.com>
 <20220518135908.23918-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220518135908.23918-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_exec_gttfill: Added test
 description for test case.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-05-18 at 19:29:07 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Added test description to all the available subtests.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Lgtm,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> ---
>  tests/i915/gem_exec_gttfill.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> index ebe6d2d3..4557142d 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -236,9 +236,12 @@ igt_main
>  		intel_allocator_multiprocess_start();
>  	}
>  
> +	igt_describe("Checks if it can handle enough batches to fill gtt");
>  	igt_subtest("basic") /* just enough to run a single pass */
>  		fillgtt(i915, ctx, ALL_ENGINES, 1);
>  
> +	igt_describe("Checks the correctness of handling enough batches "
> +		     "to fill gtt for each engine");
>  	igt_subtest_with_dynamic("engines") {
>  		for_each_ctx_engine(i915, ctx, e) {
>  			if (!gem_class_can_store_dword(i915, e->class))
> @@ -249,6 +252,8 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Stress test check behaviour/correctness of handling"
> +		     " batches to fill gtt");
>  	igt_subtest("all")
>  		fillgtt(i915, ctx, ALL_ENGINES, 20);
>  
> -- 
> 2.35.1
> 
