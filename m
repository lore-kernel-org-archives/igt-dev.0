Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000DE10E1F5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 15:05:26 +0000 (UTC)
Date: Tue, 8 Mar 2022 16:05:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yidwq5Sk730yqqHN@kamilkon-DESK1>
References: <20220225104610.50919-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220225104610.50919-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ctx_exec: Added test
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

Hi Priyanka,

Dnia 2022-02-25 at 16:16:10 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2: Added description for newly added test case.
> 
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_ctx_exec.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Please make it HAX series for next version, as I described in
my replay to your vgem_basic patch.

> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index a1270a88..88f0d6ed 100644
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
> @@ -480,18 +481,30 @@ igt_main
>  		gem_sync(fd, handle);
>  	}
>  
> +	igt_describe("Check if __gem_execbuf returns -ENOENT"
> +		     " when non-existent context id's are set.");

Please change this, for example:
Verify that execbuf with invalid context fails.

>  	igt_subtest("basic-invalid-context")
>  		invalid_context(fd, handle);
>  
> +	igt_describe("Check maximum number of buffersit can"
-----------------------------------------------------^
Put space there, s/buffersit/buffers it/

> +		     " evict for a context.");
>  	igt_subtest("eviction")
>  		big_exec(fd, handle, 0);
>  
> +	igt_describe("Create a no-recovery scenario by allowing a hang,"
> +		     " setting I915_CONTEXT_PARAM_RECOVERABLE to 0 and then"
> +		     " force resetting the GPU and check if __gem_execbuf"
> +		     " returns -EIO.");

Please make it short here, no need to put every step taken in
description. Take also look at for loop in test, the -EIO is
returned only in one case.

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
> @@ -505,6 +518,8 @@ igt_main
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
Regards,
Kamil
 
