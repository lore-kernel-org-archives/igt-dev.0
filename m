Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7816D10EE22
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 15:48:59 +0000 (UTC)
Date: Fri, 18 Feb 2022 16:48:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yg+/5tiAFw/mDD2k@kamilkon-DESK1>
References: <20220216072915.2471183-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220216072915.2471183-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v2] i915/gem_exec_store: Add test description
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

Hi Apoorva,

Dnia 2022-02-16 at 12:59:15 +0530, apoorva1.singh@intel.com napisał(a):
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Add description for test and all subtests
> 
> v2: Rebase
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_exec_store.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
> index cb99f951..ef5f2b2c 100644
> --- a/tests/i915/gem_exec_store.c
> +++ b/tests/i915/gem_exec_store.c
> @@ -35,6 +35,8 @@
>  #include "igt_device.h"
>  #include "igt_gt.h"
>  
> +IGT_TEST_DESCRIPTION("Test the store functionality using execbuf-ioctl");
> +

s/Test/Exercise/
s/store/store dword/

>  #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
>  
>  /* Without alignment detection we assume the worst-case scenario. */
> @@ -432,15 +434,21 @@ igt_main
>  		igt_fork_hang_detector(fd);
>  	}
>  
> +	igt_describe("Verify that all engines can store dwords to a common buffer object");
>  	igt_subtest("basic")
>  		store_all(fd, ctx);

Note that there is check if engine is capable of dword store,
so please annotate this in description,

s/all engines/all capable engines/

>  
> +	igt_describe("Verify that each engine can store a dword to a buffer object");

s/each engine/each capable engine/

>  	test_each_engine("dword", fd, ctx, e)
>  		store_dword(fd, ctx, e);
>  
> +	igt_describe("Verify that each engine can store a dword to different cachelines "

s/each engine/each capable engine/

> +	       "of a buffer object");
>  	test_each_engine("cachelines", fd, ctx, e)
>  		store_cachelines(fd, ctx, e, 0);
>  
> +	igt_describe("Verify that each engine can store a dword to various page-sized "

s/each engine/each capable engine/

> +	       "buffer objects");
>  	test_each_engine("pages", fd, ctx, e)
>  		store_cachelines(fd, ctx, e, PAGES);
>  
> -- 
> 2.25.1
> 

Regards,
Kamil Konieczny
