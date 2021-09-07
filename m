Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7463189BF8
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Sep 2021 15:31:53 +0000 (UTC)
Date: Tue, 7 Sep 2021 18:30:06 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20210907153006.GB3945825@ideak-desk.fi.intel.com>
References: <cover.1630704099.git.ashutosh.dixit@intel.com>
 <8bf446d7841d9e7123a565baeaf8139c225ee323.1630704099.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bf446d7841d9e7123a565baeaf8139c225ee323.1630704099.git.ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_addfb_basic: Skip tiling
 subtests on device without hw tiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 03, 2021 at 02:24:42PM -0700, Ashutosh Dixit wrote:
> From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> 
> Skip subtests that are testing interoperability of FB modifiers and
> hardware tiling if the device does not support HW tiling.
> 
> Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/kms_addfb_basic.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 082f10ee9ee..4d72121e167 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -138,6 +138,7 @@ static void invalid_tests(int fd)
>  	igt_describe("Check if addfb2 call works for clobbered modifier");
>  	igt_subtest("clobberred-modifier") {
>  		igt_require_intel(fd);
> +		igt_require(gem_available_fences(fd) > 0);
>  		f.flags = 0;
>  		f.modifier[0] = 0;
>  		gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4);
> @@ -340,6 +341,7 @@ static void tiling_tests(int fd)
>  	igt_subtest_group {
>  		igt_fixture {
>  			igt_require_intel(fd);
> +			igt_require(gem_available_fences(fd) > 0);
>  			tiled_x_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
>  				DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED,
>  				1024*4, NULL, NULL, NULL);

basic-y-tiled-legacy is a valid subtest even on platforms w/o fences.
The skip for the rest looks ok.

> @@ -516,6 +518,7 @@ static void size_tests(int fd)
>  	igt_describe("Test that addfb2 call fails correctly with small buffer object after changing tile");
>  	igt_subtest("bo-too-small-due-to-tiling") {
>  		igt_require_intel(fd);
> +		igt_require(gem_available_fences(fd) > 0);
>  		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
>  			   errno == EINVAL);
> @@ -570,6 +573,7 @@ static void addfb25_tests(int fd)
>  	igt_subtest_group {
>  		igt_fixture {
>  			igt_require_intel(fd);
> +			igt_require(gem_available_fences(fd) > 0);
>  			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
>  			igt_require_fb_modifiers(fd);
>  		}
> -- 
> 2.31.1
> 
