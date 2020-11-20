Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D568959D
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 14:39:40 +0000 (UTC)
Date: Fri, 20 Nov 2020 15:39:35 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20201120143935.GF6508@kdec5-desk.ger.corp.intel.com>
References: <20201101121446.57220-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101121446.57220-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_tiled_blits: Added description
 of subtests
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

On Sun, Nov 01, 2020 at 05:44:46PM +0530, apoorva1.singh@intel.com wrote:
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_tiled_blits.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
> index 36e96785..3ea4dcd7 100644
> --- a/tests/i915/gem_tiled_blits.c
> +++ b/tests/i915/gem_tiled_blits.c
> @@ -189,15 +189,23 @@ igt_main
>  		count = (count + ncpus - 1) / ncpus;
>  	}
>  
> +	igt_describe("Validates the content of small number of tiled buffer objects "
> +	       "after random tiled blits among each other");
In my opinion this one is too long, I got lost what is going on.
Info about scenarios is already given at the begining of file:

 * The model is to fill a collection of 1MB objects in a way that can't trip
 * over A6 swizzling -- upload data to a non-tiled object, blit to the tiled
 * object.  Then, copy the 1MB objects randomly between each other for a while.
 * Finally, download their data through linear objects again and see what
 * resulted.

Any idea how to make is shorter, like one sentence?
Basic case is limited with size.

igt_describe("Randomly copy small tiled buffer to catch fence or tiling error. "

What do you think?
Kasia
>  	igt_subtest("basic")
>  		run_test(fd, 2);
>  
> +	igt_describe("Validates the content of large number of tiled buffer objects "
> +	       "(working set larger than the aperture size) after random tiled blits among "
> +	       "each other, performed on multiple parallel threads");
>  	igt_subtest("normal") {
>  		igt_fork(child, ncpus)
>  			run_test(fd, count);
>  		igt_waitchildren();
>  	}
>  
> +	igt_describe("Validates the content of large number of tiled buffer objects "
> +	       "(working set larger than the aperture size) after random tiled blits among "
> +	       "each other, performed on multiple parallel threads in an interrupting environment");
>  	igt_subtest("interruptible") {
>  		igt_fork_signal_helper();
>  		igt_fork(child, ncpus)
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
