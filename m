Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C29F10E0A0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Apr 2022 23:29:04 +0000 (UTC)
Date: Wed, 27 Apr 2022 01:28:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmiAOgwRKJ/QESWB@kamilkon-DESK1>
References: <20220425093136.507342-1-priyanka.dandamudi@intel.com>
 <20220425093136.507342-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220425093136.507342-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_madvise: added description
 for test case
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

On 2022-04-25 at 15:01:35 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description for subtest.
------- ^--------------- ^ --------- ^
Drop s/test/ and please use plural here:

Added descriptions for subtests.

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: ranjeet kumar <ranjeet1.kumar@intel.com>
---------------- ^ ----- ^
Please change this into capital letters:

Signed-off-by: Ranjeet Kumar <ranjeet1.kumar@intel.com>

With that fixed you can add my r-b tag.

Regards,
Kamil

> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Acked-by: Katarzyna Dec <katarzyna.dec@intel.com>
> ---
>  tests/i915/gem_madvise.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
> index d88747a9..2502d84c 100644
> --- a/tests/i915/gem_madvise.c
> +++ b/tests/i915/gem_madvise.c
> @@ -190,15 +190,23 @@ dontneed_before_exec(void)
>  
>  igt_main
>  {
> +	igt_describe("Check signal for Segmentation Fault and bus error before"
> +		     " obtaining a purgeable object and calling for sighandler.");
>  	igt_subtest("dontneed-before-mmap")
>  		dontneed_before_mmap();
>  
> +	igt_describe("Check signal for Segmentation Fault and bus error after"
> +		     " obtaining a purgeable object and calling for sighandler.");
>  	igt_subtest("dontneed-after-mmap")
>  		dontneed_after_mmap();
>  
> +	igt_describe("Check if PWRITE reports EFAULT when trying to use purged bo"
> +		     " for write operation.");
>  	igt_subtest("dontneed-before-pwrite")
>  		dontneed_before_pwrite();
>  
> +	igt_describe("Check if EXECBUFFER2 reports EFAULT when trying to submit"
> +		     " purged bo for GPU.");
>  	igt_subtest("dontneed-before-exec")
>  		dontneed_before_exec();
>  }
> -- 
> 2.25.1
> 
