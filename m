Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469AF11A278
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 12:04:46 +0000 (UTC)
Date: Thu, 19 May 2022 14:04:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YoYyWl9dvpaahNNS@kamilkon-desk1>
References: <20220518135652.23899-1-sai.gowtham.ch@intel.com>
 <20220518135652.23899-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220518135652.23899-2-sai.gowtham.ch@intel.com>
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

On 2022-05-18 at 19:26:51 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Added test description for subtest that are available.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_pipe_control_store_loop.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
> index 983605e3..305ac7ae 100644
> --- a/tests/i915/gem_pipe_control_store_loop.c
> +++ b/tests/i915/gem_pipe_control_store_loop.c
> @@ -183,9 +183,11 @@ igt_main
>  		igt_skip_on(devid == PCI_CHIP_I965_G); /* has totally broken pipe control */
>  	}
>  
> +	igt_describe("Checks tlb consistency of the pipe_control with fresh buffer.");
>  	igt_subtest("fresh-buffer")
>  		store_pipe_control_loop(false, 2);
>  
> +	igt_describe("Checks tlb consistency of the pipe_control with reused buffer.");
>  	igt_subtest("reused-buffer")
>  		store_pipe_control_loop(true, 2);
>  
> -- 
> 2.35.1
> 
