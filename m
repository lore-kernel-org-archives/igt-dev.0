Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2204D10E5A1
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Feb 2022 11:21:15 +0000 (UTC)
Date: Mon, 21 Feb 2022 12:21:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YhN1pgH0hT03qlCU@kamilkon-DESK1>
References: <20220221095633.5834-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221095633.5834-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v3] i915/gem_exec_store: Add test description
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

Dnia 2022-02-21 at 15:26:33 +0530, apoorva1.singh@intel.com napisał(a):
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Add description for test and all subtests
> 
> v2: Rebase
> 
> v3: Incorporated changes in description based
>     on feedback
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_exec_store.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
> index cb99f951..42e80041 100644
> --- a/tests/i915/gem_exec_store.c
> +++ b/tests/i915/gem_exec_store.c
> @@ -35,6 +35,8 @@
>  #include "igt_device.h"
>  #include "igt_gt.h"
>  
> +IGT_TEST_DESCRIPTION("Exercise the store dword functionality using execbuf-ioctl");
> +
>  #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
>  
>  /* Without alignment detection we assume the worst-case scenario. */
> @@ -432,15 +434,21 @@ igt_main
>  		igt_fork_hang_detector(fd);
>  	}
>  
> +	igt_describe("Verify that all capable engines can store dwords to a common buffer object");
>  	igt_subtest("basic")
>  		store_all(fd, ctx);
>  
> +	igt_describe("Verify that each capable engine can store a dword to a buffer object");
>  	test_each_engine("dword", fd, ctx, e)
>  		store_dword(fd, ctx, e);
>  
> +	igt_describe("Verify that each capable engine can store a dword to different cachelines "
> +	       "of a buffer object");
>  	test_each_engine("cachelines", fd, ctx, e)
>  		store_cachelines(fd, ctx, e, 0);
>  
> +	igt_describe("Verify that each capable engine can store a dword to various page-sized "
> +	       "buffer objects");
>  	test_each_engine("pages", fd, ctx, e)
>  		store_cachelines(fd, ctx, e, PAGES);
>  
> -- 
> 2.25.1
> 
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Kamil
