Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499931136D0
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 15:43:46 +0000 (UTC)
Date: Fri, 3 Jun 2022 17:43:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YposLpZ+bpfke/v2@kamilkon-desk1>
References: <20220531221526.1192064-1-janga.rahul.kumar@intel.com>
 <20220531221526.1192064-2-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220531221526.1192064-2-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] tests/i915/gem_tiled_blits : Added
 subtests description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-06-01 at 03:45:25 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Added test description to all the available subtests.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/i915/gem_tiled_blits.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
> index d6c91e6f..680967d3 100644
> --- a/tests/i915/gem_tiled_blits.c
> +++ b/tests/i915/gem_tiled_blits.c
> @@ -192,9 +192,11 @@ igt_main
>  		count = (count + ncpus - 1) / ncpus;
>  	}
>  
> +	igt_describe("Check basic functionality.");
>  	igt_subtest("basic")
>  		run_test(fd, 2);
>  
> +	igt_describe("Check with parallel execution.");
>  	igt_subtest("normal") {
>  		intel_allocator_multiprocess_start();
>  		igt_fork(child, ncpus)
> @@ -203,6 +205,7 @@ igt_main
>  		intel_allocator_multiprocess_stop();
>  	}
>  
> +	igt_describe("Check with interrupts in parallel execution.");
>  	igt_subtest("interruptible") {
>  		intel_allocator_multiprocess_start();
>  		igt_fork_signal_helper();
> -- 
> 2.25.1
> 

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil
