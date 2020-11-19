Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E3F6E5C5
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 18:10:51 +0000 (UTC)
Date: Thu, 19 Nov 2020 19:10:46 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20201119181046.GC6508@kdec5-desk.ger.corp.intel.com>
References: <20201112044920.28130-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112044920.28130-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_render_linear_blits: Add test
 description
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
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 10:19:20AM +0530, sai.gowtham.ch@intel.com wrote:
> From: sai gowtham <sai.gowtham.ch@intel.com>
> 
> Added more test description to the test and basic subtest.
> 
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_render_linear_blits.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/i915/gem_render_linear_blits.c b/tests/i915/gem_render_linear_blits.c
> index 8e646127..0cbd205c 100644
> --- a/tests/i915/gem_render_linear_blits.c
> +++ b/tests/i915/gem_render_linear_blits.c
> @@ -55,6 +55,9 @@
>  #define HEIGHT 512
>  #define SIZE (HEIGHT*STRIDE)
>  
> +IGT_TEST_DESCRIPTION("This is a test of doing many blits, with a working set"
> +		" larger than the aperture size. The goal is to simply ensure"
> +		" the basics work.");
Leave a blank line between.
>  static uint32_t linear[WIDTH*HEIGHT];
>  static igt_render_copyfunc_t render_copy;
>  
> @@ -170,6 +173,8 @@ igt_main
>  		igt_require_gem(fd);
>  	}
>  
> +	igt_describe("This is a basic test for render blit where it"
> +			" does many blits, with a working set larger than the aperture size.");
More specific:
igt_describe("Copy 2 buffers forward, backward and random.");
>  	igt_subtest("basic") {
>  		run_test(fd, 2);
>  	}

Maybe you could add descriptions to other cases too?
These cases are similar just more exahustive, using maximum memory.

Kasia :)

> -- 
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
