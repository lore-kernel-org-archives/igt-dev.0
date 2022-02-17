Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC10310EA08
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 14:09:56 +0000 (UTC)
Date: Thu, 17 Feb 2022 15:09:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yg5XMAV9L5AAO9ae@kamilkon-DESK1>
References: <20220215051236.21202-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215051236.21202-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_linear_blits: Added
 description to the subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Dnia 2022-02-15 at 10:42:36 +0530, sai.gowtham.ch@intel.com napisał(a):
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Added description to subtests.
> 
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_linear_blits.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
> index 6504c9f2..b570aa76 100644
> --- a/tests/i915/gem_linear_blits.c
> +++ b/tests/i915/gem_linear_blits.c
> @@ -258,9 +258,13 @@ igt_main
>  		count = (count + ncpus - 1) / ncpus;
>  	}
>  
> +	igt_describe("Excercise 2 buffer objects check if driver will"
> +			"rearrange the buffers");

This is basic one, no rearrange will happen here, so better just:
	Basic blitter functionality check with only 2 buffers

Please compile your changes and check output with
./gem_linear_blitter --description
When you split text between lines, compiler will concatenate strings and there
will be something like:

check if driver willrearrange the buffers
No space here ------^

>  	igt_subtest("basic")
>  		run_test(fd, 2, do_relocs);
>  
> +	igt_describe("The intent is to push beyond the GTT size to force the driver"
> +			"to have to rearrange the buffers");
Space needed before "to" ^

You can add " [working] " word before "GTT size".

>  	igt_subtest("normal") {
>  		intel_allocator_multiprocess_start();
>  		igt_fork(child, ncpus)
> @@ -269,6 +273,8 @@ igt_main
>  		intel_allocator_multiprocess_stop();
>  	}
>  
> +	igt_describe("Pushes beyond the GTT size checks if driver will rearrange the"
> +			"buffers, with interrupts in between the parent process");

No need to repeat whole description here, simple "Test with interrupts in between".

>  	igt_subtest("interruptible") {
>  		intel_allocator_multiprocess_start();
>  		igt_fork_signal_helper();
> -- 
> 2.35.0
> 

Regards,
Kamil Konieczny
