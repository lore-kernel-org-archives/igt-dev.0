Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AD110F658
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Apr 2022 16:01:41 +0000 (UTC)
Date: Wed, 27 Apr 2022 18:01:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Ymlovfq1MJcp0VNX@kamilkon-DESK1>
References: <20220426052331.3453-1-sai.gowtham.ch@intel.com>
 <20220426052331.3453-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220426052331.3453-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_pipe_control_store_loop:
 added description for test case
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

On 2022-04-26 at 10:53:30 +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Added test description for subtest that are available.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
---------------- ^
Correct this (see my other letter on gem_partial_pwrite_pread).

> ---
>  tests/i915/gem_pipe_control_store_loop.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
> index 983605e3..070e767f 100644
> --- a/tests/i915/gem_pipe_control_store_loop.c
> +++ b/tests/i915/gem_pipe_control_store_loop.c
> @@ -183,9 +183,13 @@ igt_main
>  		igt_skip_on(devid == PCI_CHIP_I965_G); /* has totally broken pipe control */
>  	}
>  
> +	igt_describe("checks tlb consistency of the pipe_control target so creates new buffer"
--------------------- ^
Use capital letter at begin of sentence, so s/checks/Checks/

> +		     " each time, emit commands and send it to ring for execution and target"
> +		     " buffer won't get reused.");

Looks a little too long, you do not need to describe every
single step used, so imho shorten this to something like

	igt_describe("Checks tlb consistency of the pipe_control with fresh buffer.");

should be ok.

>  	igt_subtest("fresh-buffer")
>  		store_pipe_control_loop(false, 2);
>  
> +	igt_describe("Emit commands in reused buffer and send it to ring for execution.");

Here just reuse previous one with s/fresh/reused/ buffer change.

Regards,
Kamil

>  	igt_subtest("reused-buffer")
>  		store_pipe_control_loop(true, 2);
>  
> -- 
> 2.35.1
> 
