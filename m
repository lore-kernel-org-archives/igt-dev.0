Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE3B6EA6A
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 04:43:28 +0000 (UTC)
Date: Thu, 24 Sep 2020 10:10:06 +0530
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Message-ID: <20200924044006.GA2419@arjun-NUC8i7BEH>
References: <20200714044234.26328-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714044234.26328-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t][V2] i915/gem_exec_create: Added test
 description for test case.
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

On Tue, Jul 14, 2020 at 10:12:34AM +0530, sai.gowtham.ch@intel.com wrote:
> From: sai gowtham <sai.gowtham.ch@intel.com>
> 
> Added test description for test and to all 3 subtests.
> 
> Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_exec_create.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
> index ee7d4e5d..15288380 100644
> --- a/tests/i915/gem_exec_create.c
> +++ b/tests/i915/gem_exec_create.c
> @@ -42,6 +42,11 @@
>  #include "i915/gem.h"
>  #include "igt.h"
>  
> +IGT_TEST_DESCRIPTION("\n This test overloads the driver with transient active "
> +		" objects and checks if we don't kill the system under the "
> +		" mempressure. Some of the symptoms this test look for include"
> +		" mysterious hangs.");
> +
>  #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
>  
>  static double elapsed(const struct timespec *start, const struct timespec *end)
> @@ -134,11 +139,16 @@ igt_main
>  		igt_fork_hang_detector(device);
>  	}
>  
> +	igt_describe("This subtest is a quick sanitycheck of the above test setup");
>  	igt_subtest("basic")
>  		all(device, 0, 2, 1);
> +
> +	igt_describe("This test does a concurrent execution");
>  	igt_subtest("forked")
>  		all(device, 0, 20, ncpus);
>  
> +	igt_describe("This test does a forced reclaim, behaving like a bad application"
> +			" leaking its bo cache");
>  	igt_subtest("madvise")
>  		all(device, LEAK, 20, 1);
Acked-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
>  
> -- 
> 2.25.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
