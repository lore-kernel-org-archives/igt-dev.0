Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDB66E8C0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 14:50:26 +0000 (UTC)
Date: Fri, 20 Nov 2020 15:50:20 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20201120145020.GG6508@kdec5-desk.ger.corp.intel.com>
References: <20201102151912.66557-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102151912.66557-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_tiled_fence_blits: Added test
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
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 08:49:12PM +0530, apoorva1.singh@intel.com wrote:
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Added test and subtests description
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_tiled_fence_blits.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
> index 0a633d91..433bf7b1 100644
> --- a/tests/i915/gem_tiled_fence_blits.c
> +++ b/tests/i915/gem_tiled_fence_blits.c
> @@ -45,6 +45,9 @@
>  #include "igt.h"
>  #include "igt_x86.h"
>  
> +IGT_TEST_DESCRIPTION("Test doing many tiled blits, with a working set larger"
> +		     " than the mappable aperture size.");
> +
>  enum { width = 512, height = 512 };
>  static uint32_t linear[width * height];
>  static const int bo_size = sizeof(linear);
> @@ -236,9 +239,14 @@ igt_main
>  		count = (count + ncpus - 1) / ncpus;
>  	}
>  
> +	igt_describe("Validates the content of small number of tiled buffer objects "
> +	       "after random tiled blits among each other");

Similar situation to gem_tiled_blits (I even thought I have dejavu opening
second file :))
Description of cases will be similar to gem_tiled_blits but using fences to
tiling and detiling.

Kasia
>  	igt_subtest("basic")
>  		run_test (fd, 2);
>  
> +	igt_describe("Validates the content of large number of tiled buffer objects "
> +	       "(working set larger than the mappable aperture size) after random tiled blits among "
> +	       "each other, performed on multiple parallel threads");
>  	igt_subtest("normal") {
>  		igt_fork(child, ncpus)
>  			run_test(fd, count);
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
