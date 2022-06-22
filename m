Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C624610E89E
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 16:14:21 +0000 (UTC)
Date: Wed, 22 Jun 2022 18:14:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YrM/2kUGqfTUWiwg@kamilkon-desk1>
References: <20220620070321.24580-1-sai.gowtham.ch@intel.com>
 <20220620070321.24580-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220620070321.24580-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_softpin: Added test
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

Hi Sai,

On 2022-06-20 at 12:33:20 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Added test description for test and to all the subtests that are
> available.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_softpin.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index b851c90e..417359d1 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -32,6 +32,10 @@
>  #include "igt_rand.h"
>  #include "intel_allocator.h"
>  
> +IGT_TEST_DESCRIPTION("Tests softpin feature, which contains error, normal usage"
---------------------------------------------- ^
This reads strange, please rewrite, maybe you want to write
error checks for invalid input ?

Maybe also add here that sofpin is also known as no-reloc ? So
s/softpin/softpin aka no-relocations (no-reloc)/

> +		     " scenarios and couple of stress tests which copy buffers"
> +		     " between CPU and GPU.");

Which are these stress tests ? Is it eviction ?

> +
>  #define EXEC_OBJECT_PINNED	(1<<4)
>  #define EXEC_OBJECT_SUPPORTS_48B_ADDRESS (1<<3)
>  
> @@ -1248,6 +1252,7 @@ igt_main
>  		ctx = intel_ctx_create_all_physical(fd);
>  	}
>  
> +	igt_describe("Check softpinnnig with invalid inputs.");

Rewrite this, for example:
"Check that invalid inputs are handled correctly." ?

>  	igt_subtest("invalid")
>  		test_invalid(fd);
>  
> @@ -1258,30 +1263,44 @@ igt_main
>  			igt_require(gem_uses_full_ppgtt(fd));
>  		}
>  
> +		igt_describe("Check full placement control under full-ppgtt");

Put dot at end of sentence (here and almost all below).
s/full-ppgtt/full-ppGTT/

>  		igt_subtest("zero")
>  			test_zero(fd);
>  
> +		igt_describe("Check the last 32b page is excluded");
>  		igt_subtest("32b-excludes-last-page")
>  			test_32b_last_page(fd);
>  
> +		igt_describe("Check the total occupancy by using pad-to-size to fill"
> +			     " the entire GTT.");
>  		igt_subtest("full")
>  			test_full(fd);
>  
> +		igt_describe("Check that we can place objects at start/end of the GTT"
> +			     " using the allocator");
>  		igt_subtest("allocator-basic")
>  			test_allocator_basic(fd, false);
>  
> +		igt_describe("Check that if we can reserve a space for a object"
---------------------------------------------------------------------- ^
s/a object/an object/

> +			     " starting from a given offset");
>  		igt_subtest("allocator-basic-reserve")
>  			test_allocator_basic(fd, true);
>  
> +		igt_describe("Check that we can combine manual placement with automatic"
> +			     " GTT placement");
>  		igt_subtest("allocator-nopin")
>  			test_allocator_nopin(fd, false);
>  
> +		igt_describe("Check that we can combine manual placement with automatic"
> +			     " GTT placement and reserves/unreserves space for objects");
>  		igt_subtest("allocator-nopin-reserve")
>  			test_allocator_nopin(fd, true);
>  
> +		igt_describe("Check if multiple process can be allocted");
------------------------------------------------------- ^
s/process can be allocated/processes can use allocator./

>  		igt_subtest("allocator-fork")
>  			test_allocator_fork(fd);
>  
> +		igt_describe("Exercise eviction with softpinning");
>  		test_each_engine("allocator-evict", fd, ctx, e)
>  			test_allocator_evict(fd, ctx, e->flags, 20);
>  
> @@ -1294,28 +1313,46 @@ igt_main
>  	igt_subtest("safe-alignment")
>  		safe_alignment(fd);
>  
> +	igt_describe("Check softpinning of a gem buffer object ");
------------------------------------------------------------- ^
Remove space from end.

>  	igt_subtest("softpin")
>  		test_softpin(fd);
> +
> +	igt_describe("Checks the behaviour by runing on all possible"

s/Checks the behaviour by runing on all possible/Check all/

> +		     " page alligned overlaps");
---------------------------- ^
s/alligned/aligned/

>  	igt_subtest("overlap")
>  		test_overlap(fd);
> +
> +	igt_describe("Check that if the user demands the vma be replaced, they are.");

Hmm, is user changing vma to second one ? Or reverses algo ?

>  	igt_subtest("reverse")
>  		test_reverse(fd);
>  
> +	igt_describe("Check that no relocation support works");
-------------------------------- ^--^
Please keep no-reloc word here and below.

>  	igt_subtest("noreloc")
>  		test_noreloc(fd, NOSLEEP, 0);
> +
> +	igt_describe("Check no relocation support with interruptible");
>  	igt_subtest("noreloc-interruptible")
>  		test_noreloc(fd, NOSLEEP, INTERRUPTIBLE);
> +
> +	igt_describe("Check norelocations hold versus suspend/resume");
--------------------------- ^
no-relocs

s/hold versus/survives after suspend to RAM/resume cycle./

>  	igt_subtest("noreloc-S3")
>  		test_noreloc(fd, SUSPEND, 0);
> +
> +	igt_describe("Check norelocations hold versus suspend/resume");

s/hold versus/survive after suspend to disk/resume cycle./

>  	igt_subtest("noreloc-S4")
>  		test_noreloc(fd, HIBERNATE, 0);
>  
>  	for (int signal = 0; signal <= 1; signal++) {
> +		igt_describe("This test checks the behaviour of softpin with busy batch");

Maybe improve with igt_describe_f() ?
This is eviction, so it is a kind of stress test.

>  		igt_subtest_f("evict-active%s", signal ? "-interruptible" : "")
>  			test_evict_active(fd, signal);
> +
> +		igt_describe("Snoop test by forcibly injecting signals");

Same here.

Regards,
Kamil

>  		igt_subtest_f("evict-snoop%s", signal ? "-interruptible" : "")
>  			test_evict_snoop(fd, signal);
>  	}
> +
> +	igt_describe("Checks behaviour of softpin with hung batch");
>  	igt_subtest("evict-hang")
>  		test_evict_hang(fd);
>  
> -- 
> 2.35.1
> 
