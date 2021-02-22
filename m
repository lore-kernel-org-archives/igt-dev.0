Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5666E50D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Feb 2021 14:07:00 +0000 (UTC)
Date: Mon, 22 Feb 2021 15:03:41 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20210222140341.GC29585@kdec5-desk.ger.corp.intel.com>
References: <20200716045633.26460-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716045633.26460-1-ranjeet1.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t]i915/gem_madvise: added description for
 test case
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
To: ranjeet1.kumar@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 10:26:33AM +0530, ranjeet1.kumar@intel.com wrote:
> From: ranjeet kumar <ranjeet1.kumar@intel.com>
> 
> Added test description for subtest.
> 
> Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
> Signed-off-by: ranjeet kumar <ranjeet1.kumar@intel.com>
> ---
>  tests/i915/gem_madvise.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
> index 54c9beff..3e168cd4 100644
> --- a/tests/i915/gem_madvise.c
> +++ b/tests/i915/gem_madvise.c
> @@ -187,15 +187,23 @@ dontneed_before_exec(void)
>  
>  igt_main
>  {
> +	igt_describe("checks signal for Segmentation Fault and bus error before"
> +		     " obtaning a purgeable object and calling for sighandler");
>  	igt_subtest("dontneed-before-mmap")
>  		dontneed_before_mmap();
>  
> +	igt_describe("checks signal for Segmentation Fault and bus error after"
> +		     " obtaning a purgeable object and calling for sighandler");
>  	igt_subtest("dontneed-after-mmap")
>  		dontneed_after_mmap();
>  
> +	igt_describe("PWRITE ioctl reports EFAULT when trying to use purged bo"
> +		     " for write operation");
>  	igt_subtest("dontneed-before-pwrite")
>  		dontneed_before_pwrite();
>  
> +	igt_describe("EXECBUFFER2 ioctl reports EFAULT when trying to submit"
> +		     " purged bo for GPU.");
>  	igt_subtest("dontneed-before-exec")
>  		dontneed_before_exec();
>  }
LGTM :)
Acked-by: Katarzyna Dec <katarzyna.dec@intel.com>

Kasia :)

> -- 
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
