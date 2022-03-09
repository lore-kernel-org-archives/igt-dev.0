Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A4910EC35
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 14:03:18 +0000 (UTC)
Date: Wed, 9 Mar 2022 15:03:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YiizodZvfj3dm9fW@kamilkon-DESK1>
References: <20220308044601.18357-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220308044601.18357-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_linear_blits: Added
 description to the subtest
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

Dnia 2022-03-08 at 10:16:01 +0530, sai.gowtham.ch@intel.com napisał(a):
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Added description to subtests.
> 
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_linear_blits.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
> index 6504c9f2..9f049863 100644
> --- a/tests/i915/gem_linear_blits.c
> +++ b/tests/i915/gem_linear_blits.c
> @@ -258,9 +258,12 @@ igt_main
>  		count = (count + ncpus - 1) / ncpus;
>  	}
>  
> +	igt_describe("Basic blitter functionality check with 2 buffers");
>  	igt_subtest("basic")
>  		run_test(fd, 2, do_relocs);
>  
> +	igt_describe("The intent is to push beyond the working GTT size to force"
> +			" the driver to rebind the buffers");
>  	igt_subtest("normal") {
>  		intel_allocator_multiprocess_start();
>  		igt_fork(child, ncpus)
> @@ -269,6 +272,7 @@ igt_main
>  		intel_allocator_multiprocess_stop();
>  	}
>  
> +	igt_describe("Test with interrupts in between the parent process");
>  	igt_subtest("interruptible") {
>  		intel_allocator_multiprocess_start();
>  		igt_fork_signal_helper();
> -- 
> 2.35.1
> 
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil
