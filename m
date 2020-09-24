Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6BE8987A
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 04:54:06 +0000 (UTC)
Date: Thu, 24 Sep 2020 10:20:21 +0530
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Message-ID: <20200924045019.GB2419@arjun-NUC8i7BEH>
References: <20200730051931.9927-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730051931.9927-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_close: Added test description
 for test case
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 10:49:31AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description for test and to all the available subtests.
> 
> Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_close.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/i915/gem_close.c b/tests/i915/gem_close.c
> index 58f2d4b3..f2d39eef 100644
> --- a/tests/i915/gem_close.c
> +++ b/tests/i915/gem_close.c
> @@ -24,6 +24,9 @@
>  #include "i915/gem.h"
>  #include "igt.h"
>  
> +IGT_TEST_DESCRIPTION("Tests basic gem_close ioctl by closing the gem buffer handle "
> +		     "and also tests if duplicate handles are operational when original is closed.");
> +
>  static int batch_create(int fd)
>  {
>  	const uint32_t bbe = MI_BATCH_BUFFER_END;
> @@ -132,9 +135,13 @@ igt_main
>  		igt_require_gem(fd);
>  	}
>  
> +	igt_describe(" It releases a file-private gem buffer handle.");
>  	igt_subtest("basic")
>  		gem_close(fd, gem_create(fd, 4096));
Can you modify it to something like " basic test for...."
-Arjun
>  
> +	igt_describe(" The test creates duplicate handles of up to 128 for the same object "
> +		     "and checks if only permissible duplicate handles are allowed. "
> +		     "It also checks if duplicate handles are operational when original is closed.");
>  	igt_subtest("many-handles-one-vma")
>  		test_many_handles(fd);
>  }
> -- 
> 2.26.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
