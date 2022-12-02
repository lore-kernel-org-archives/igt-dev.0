Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B733F10E1A4
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Dec 2022 08:54:55 +0000 (UTC)
Date: Fri, 2 Dec 2022 09:54:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y4m9W3Lh1NnDGyrj@kamilkon-desk1>
References: <20221202081025.20273-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202081025.20273-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_lmem_swapping: Use feature
 macro instead checking platform
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

On 2022-12-02 at 09:10:25 +0100, Zbigniew Kempczyński wrote:
> Avoid future subtest modification for *-ccs subtests by using
> HAS_FLATCCS() feature macro.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

lgtm
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_lmem_swapping.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 969fb9080b..75121d4194 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -581,7 +581,7 @@ static void test_evict(int i915,
>  	struct params params;
>  
>  	if (flags & TEST_CCS)
> -		igt_require(IS_DG2(intel_get_drm_devid(i915)));
> +		igt_require(HAS_FLATCCS(intel_get_drm_devid(i915)));
>  
>  	fill_params(i915, &params, region, flags, nproc, false);
>  
> -- 
> 2.34.1
> 
