Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A3510E386
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 12:54:40 +0000 (UTC)
Date: Wed, 9 Mar 2022 13:54:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YiijjCOkMuw4w3Nn@kamilkon-DESK1>
References: <20220309094719.144716-1-priyanka.dandamudi@intel.com>
 <20220309094719.144716-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220309094719.144716-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_ctx_exec: Added test
 description for testcase
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

Dnia 2022-03-09 at 15:17:18 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2: Added description for newly added test case.
> 
> v3: Modified test descriptions.
> 
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_ctx_exec.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index a1270a88..1f3d1a44 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -465,6 +465,7 @@ igt_main
>  		gem_write(fd, handle, 0, batch, sizeof(batch));
>  	}
>  
> +	igt_describe("Check the basic context batch buffer execution.");
>  	igt_subtest("basic") {
>  		ctx_id = gem_context_create(fd);
>  		igt_assert(exec(fd, handle, 0, ctx_id) == 0);
> @@ -480,18 +481,27 @@ igt_main
>  		gem_sync(fd, handle);
>  	}
>  
> +	igt_describe("Verify that execbuf with invalid context fails.");
>  	igt_subtest("basic-invalid-context")
>  		invalid_context(fd, handle);
>  
> +	igt_describe("Check maximum number of buffers it can"
> +		     " evict for a context.");
>  	igt_subtest("eviction")
>  		big_exec(fd, handle, 0);
>  
> +	igt_describe("Check the status of context after a hang"
> +		     " by setting and unsetting the RECOVERABLE.");
>  	igt_subtest("basic-norecovery")
>  		norecovery(fd);
>  
> +	igt_describe("Verify that contexts are automatically shotdown"
> +		     " on close, if hangchecking is disabled.");
>  	igt_subtest("basic-nohangcheck")
>  		nohangcheck_hostile(fd);
>  
> +	igt_describe("Race the execution and interrupt handlers along a context,"
> +	             " while closing it at a random time.");
>  	igt_subtest_group {
>  		igt_fixture {
>  			intel_allocator_multiprocess_start();
> @@ -505,6 +515,8 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Check if the kernel doesn't leak the vma"
> +		     " pin_count for the last context on reset.");
>  	igt_subtest("reset-pin-leak") {
>  		int i;
>  		uint64_t ahnd;
> -- 
> 2.25.1
> 
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil
