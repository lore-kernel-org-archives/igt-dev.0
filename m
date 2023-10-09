Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFFE10E25C
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 10:30:55 +0000 (UTC)
Date: Mon, 9 Oct 2023 12:30:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231009103051.uifamleq5gyxxrgp@kamilkon-desk.igk.intel.com>
References: <20231009100332.392968-1-mauro.chehab@linux.intel.com>
 <20231009100332.392968-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231009100332.392968-5-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] intel/kms_frontbuffer_tracking.c:
 remove fbc-slowdraw test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

please correct subject:

intel/kms_frontbuffer_tracking.c: remove fbc-slowdraw test
----------------------------------------------------- ^^^^
s/test/docs/

I will also add Bhanu and Swati to cc.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

On 2023-10-09 at 12:01:41 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The slowdraw test is defined to run only for two features:
> 
> 	if ((t.feature & FEATURE_PSR) || (t.feature & FEATURE_DRRS))
> 		igt_subtest_f("%s-slowdraw", feature_str(t.feature)) {
> 			igt_require(igt_draw_supports_method(drm.fd, t.method));
> 			slow_draw_subtest(&t);
> 		}
> 
> As it won't be reported for FBC, remove documentation for it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 6526e1c3cffa..f90d09f9f06d 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -3025,13 +3025,6 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
>   * Mega feature: General Display Features
>   * Test category: functionality test
>   *
> - * SUBTEST: fbc-slowdraw
> - * Description: Sleep a little bit between drawing operations with FBC
> - * Driver requirement: i915, xe
> - * Functionality: fbc, fbt, kms_core
> - * Mega feature: General Display Features
> - * Test category: functionality test
> - *
>   * SUBTEST: psr-slowdraw
>   * Description: Sleep a little bit between drawing operations with PSR
>   * Driver requirement: i915, xe
> -- 
> 2.41.0
> 

