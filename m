Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4098110E50A
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jan 2024 18:25:18 +0000 (UTC)
Date: Thu, 4 Jan 2024 19:25:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] tests/kms_async_flips: test with modifiers
 only on intel devices
Message-ID: <20240104182512.budqo5mmt5h6f7q3@kamilkon-desk.igk.intel.com>
References: <20231226191054.23794-1-mwen@igalia.com>
 <20231226191054.23794-4-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231226191054.23794-4-mwen@igalia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-dev@igalia.com, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Melissa,
On 2023-12-26 at 17:57:34 -0100, Melissa Wen wrote:
> Although increasing the coverage of tests with modifiers, the change
> from run_test() to run_test_with_modifiers() is now a regression on
> non-intel devices. run_test_with_modifiers() only ensures conditions for
> modifiers != LINEAR on intel devices, and the original run_test() is
> more consistent across vendors.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_async_flips.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 6fddad093..55d59196e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -654,7 +654,10 @@ igt_main
>  		igt_describe("Wait for page flip events in between successive asynchronous flips");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>  			data.alternate_sync_async = false;
> -			run_test_with_modifiers(&data, test_async_flip);
> +			if (is_intel_device(data.drm_fd))
> +				run_test_with_modifiers(&data, test_async_flip);
> +			else
> +				run_test(&data, test_async_flip);
>  		}
>  
>  		igt_describe("Alternate between sync and async flips");
> -- 
> 2.43.0
> 
