Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0276310F761
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 18:39:12 +0000 (UTC)
Date: Mon, 30 May 2022 20:39:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YpUPTDm0vTGiYR5G@kamilkon-desk1>
References: <20220530064012.1027500-1-janga.rahul.kumar@intel.com>
 <20220530064012.1027500-2-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220530064012.1027500-2-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] tests/i915/gem_render_tiled_blits : Added
 subtests description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janga,

On 2022-05-30 at 12:10:11 +0530, janga.rahul.kumar@intel.com wrote:
> From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
> 
> Added test description to all the available subtests and
> Updated file name in the file description comments.
- ^
s/Updated/fix/

Put description here what did you changed from previous version,
see other patch series with v2 (or larger version).

> 
> Signed-off-by: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
---------------- ^

Please re-arrange you name in s-o-b to:

Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Please add all addresses used for cc or to here (except this
mailinglist), for example see patch 1/2 in this series:

HAX add description to gem_exec_basic
https://patchwork.freedesktop.org/series/103196/

> ---
>  tests/i915/gem_render_tiled_blits.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_render_tiled_blits.c b/tests/i915/gem_render_tiled_blits.c
> index 187714d6..61ae9a80 100644
> --- a/tests/i915/gem_render_tiled_blits.c
> +++ b/tests/i915/gem_render_tiled_blits.c
> @@ -25,7 +25,7 @@
>   *
>   */
>  
> -/** @file gem_linear_render_blits.c
> +/** @file gem_render_tiled_blits.c

Nice catch.

>   *
>   * This is a test of doing many blits, with a working set
>   * larger than the aperture size.
> @@ -49,6 +49,10 @@
>  #include "i915/gem.h"
>  #include "igt.h"
>  
> +IGT_TEST_DESCRIPTION("Tests performs Cyclic forward, backward and random blits on tiled buffer "

s/Cyclic/cyclic/

> +		      "objects using render engine with various working set sizes and compares "
> +		      "the blits outputs with expected outputs. ");
-------------------------------------------------------------- ^

Remove spaces at strings end.

You can also shorten this a little, like:
s/the blits outputs with expected outputs. /outputs with expected ones./

or even
s/compares the blits outputs with expected outputs. /verify outputs./

Your choice (you can also rewrite it to some other form).

> +
>  #define WIDTH 512
>  #define STRIDE (WIDTH*4)
>  #define HEIGHT 512
> @@ -205,16 +209,20 @@ igt_main
>  		igt_require(gem_available_fences(fd) > 0);
>  	}
>  
> +	igt_describe("Check with working set size 2.");
------------------------------------------------- ^
This number here do not describe anything, maybe just write
"Run basic check." or "Verify basic functionality." or
something like that.

>  	igt_subtest("basic") {
>  		run_test(fd, 2);
>  	}
>  
> +	igt_describe("Check with working set size larger than aperture size.");
>  	igt_subtest("aperture-thrash") {
>  		count = 3 * gem_aperture_size(fd) / SIZE / 2;
>  		intel_require_memory(count, SIZE, CHECK_RAM);
>  		run_test(fd, count);
>  	}
>  
> +	igt_describe("Check with working set size larger than aperture size and "
> +		     "helper process to shrink the aperture.");

I am not sure that this shrinks aperture, what I see there is
drop caches. For more info see commit e8eb9afd4c5 with
git log -p e8eb9afd4c5

>  	igt_subtest("aperture-shrink") {
>  		igt_fork_shrink_helper(fd);
>  
> @@ -225,6 +233,7 @@ igt_main
>  		igt_stop_shrink_helper();
>  	}
>  
> +	igt_describe("Check with working set size larger than swap memory size.");

Do we want cause oom here ? imho test wants to use up all memory
and so system will try to use swap. This is in following line:

		count = ((intel_get_avail_ram_mb() + (swap_mb / 2)) * 1024*1024) / SIZE;

--
Kamil

>  	igt_subtest("swap-thrash") {
>  		uint64_t swap_mb = intel_get_total_swap_mb();
>  		igt_require(swap_mb > 0);
> -- 
> 2.25.1
> 
