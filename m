Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BD210E12D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 15:58:48 +0000 (UTC)
Date: Tue, 6 Dec 2022 16:58:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y49mtZT5YwY/Xs6J@kamilkon-desk1>
References: <20221205202708.76217-1-zbigniew.kempczynski@intel.com>
 <20221205202708.76217-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221205202708.76217-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/5] tests/api_intel_allocator:
 Remove duplicated reuse and reserve subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-12-05 at 21:27:05 +0100, Zbigniew Kempczyński wrote:
> For SIMPLE allocator those subtest are duplicated outside loop which
> exercises all defined allocators. Lets remove it and not waste time
> for double run.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/api_intel_allocator.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index 098b9e6960..b55587e549 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -769,12 +769,6 @@ igt_main
>  	igt_subtest_f("reserve-simple")
>  		reserve_simple(fd);
>  
> -	igt_subtest_f("reuse")
> -		reuse(fd, INTEL_ALLOCATOR_SIMPLE);
> -
> -	igt_subtest_f("reserve")
> -		reserve(fd, INTEL_ALLOCATOR_SIMPLE);
> -
>  	igt_describe("For simple allocator check does default alignment is "
>  		     "properly handled in open and alloc functions");
>  	igt_subtest_f("default-alignment")
> -- 
> 2.34.1
> 
