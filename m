Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BD2892C2
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2020 13:56:52 +0000 (UTC)
From: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
In-Reply-To: <20200818045908.8075-1-priyanka.dandamudi@intel.com>
References: <20200818045908.8075-1-priyanka.dandamudi@intel.com>
Date: Wed, 19 Aug 2020 15:56:49 +0200
Message-ID: <87a6yqbuxq.fsf@lfiedoro-desk1.igk.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_create: Added test description
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
To: priyanka.dandamudi@intel.com, Arjun.Melkaveri@intel.com, igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

<priyanka.dandamudi@intel.com> writes:

> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
> Added test description to all the available subtests.
>
> Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>

> ---
>  tests/i915/gem_create.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index c7444d55..72a9864e 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -244,16 +244,25 @@ igt_main
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_INTEL);
>  	}
> -
> +	igt_describe("Test tries to create a gem object of invalid size 0"
> +		     " and checks if ioctl returns error.");
>  	igt_subtest("create-invalid-size")
>  		invalid_size_test(fd);
>  
> +	igt_describe("Test creates an object with non-aligned size request "
> +		     "and assert the buffer is page aligned and tests the "
> +		     "write into the padded extra memory.");
>  	igt_subtest("create-valid-nonaligned")
>  		valid_nonaligned_size(fd);
> -
> +	
> +	igt_describe("Test tries to create a gem object with size 15 "
> +	             "and checks if the actual created size to be default page size.");
>  	igt_subtest("create-size-update")
>  		size_update(fd);
>  
> +	igt_describe("The kernel must not return stale information back to userspace when they "
> +    		     "create a new object. For that purpose, we always clear objects on "
> +		     "creation.The test tries to clear objects and also checks number of pages cleared.");
>  	igt_subtest("create-clear")
>  		always_clear(fd, 30);
>  }
> -- 
> 2.26.2
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Thanks,
Lukasz
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
