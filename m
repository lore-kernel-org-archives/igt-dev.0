Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347B010F636
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Apr 2022 15:47:16 +0000 (UTC)
Date: Wed, 27 Apr 2022 17:22:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmlftRF0b9r+4etf@kamilkon-DESK1>
References: <20220426041228.516686-1-priyanka.dandamudi@intel.com>
 <20220426041228.516686-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220426041228.516686-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_set_tiling_vs_pwrite:
 Added description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ranjeet Kumar <ranjeet1.kumar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Priyanka,

please check with ./gem_set_tiling_vs_pwrite --describe if there
is missing description and where to add it. Do this check again
after you add description to see if anything is missing. In this
case this is simple test without any subtests, so only global
description is needed and it is already present at begin of file.
Sorry but this patch cannot be merged.

Regards,
Kamil

On 2022-04-26 at 09:42:27 +0530, priyanka.dandamudi@intel.com wrote:
> From: ranjeet kumar <ranjeet1.kumar@intel.com>
> 
> Added test description for subtest.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: ranjeet kumar <ranjeet1.kumar@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_set_tiling_vs_pwrite.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/i915/gem_set_tiling_vs_pwrite.c
> index 6bec7f27..7e96ad96 100644
> --- a/tests/i915/gem_set_tiling_vs_pwrite.c
> +++ b/tests/i915/gem_set_tiling_vs_pwrite.c
> @@ -74,7 +74,7 @@ igt_simple_main
>  		*ptr = 0xdeadbeef;
>  	}
>  
> -	igt_info("testing pwrite on tiled buffer\n");
> +	igt_describe("Set tiling stride and domain and check pwrite coherency on tiled buffer.");
>  	gem_write(fd, handle, 0, data, OBJECT_SIZE);
>  	memset(data, 0, OBJECT_SIZE);
>  	gem_read(fd, handle, 0, data, OBJECT_SIZE);
> @@ -90,7 +90,8 @@ igt_simple_main
>  
>  	gem_set_tiling(fd, handle, I915_TILING_NONE, 0);
>  
> -	igt_info("testing pwrite on untiled, but still fenced buffer\n");
> +	igt_describe("set tiling stride as none and domain and check pwrite coherency on"
> +		     " still fenced buffer.");
>  	gem_write(fd, handle, 0, data, OBJECT_SIZE);
>  	memset(data, 0, OBJECT_SIZE);
>  	gem_read(fd, handle, 0, data, OBJECT_SIZE);
> -- 
> 2.25.1
> 
