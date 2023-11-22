Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E43110E317
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Nov 2023 20:51:03 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-548d60a4d60so261862a12.2
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Nov 2023 12:51:03 -0800 (PST)
Message-ID: <05daa3a6-5200-46b2-b51e-df204da12054@gmail.com>
Date: Wed, 22 Nov 2023 22:50:50 +0200
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231122133612.973677-1-jouni.hogander@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231122133612.973677-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] kms_addfb_basic: Skip not relevant test
 for Xe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 22.11.2023 15.36, Jouni Högander wrote:
> Skip following tests for Xe:
> 
> tile-pitch-mismatch
> addfb25-x-tiled-mismatch-legacy
> 
> They are not relevant for Xe as tiling information is not encoded into
> backing object.
> 
> Skip following test for Xe
> 
> basic-y-tiled-legacy
> 
> As Xe supports y-tiled format on legacy addfb.
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   tests/kms_addfb_basic.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index fc16b8814..426277422 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -396,7 +396,7 @@ static void pitch_tests(int fd)
>   /**
>    * SUBTEST: basic-%s-tiled-legacy
>    * Description: Check if addfb2 and rmfb call works for basic %arg[1] test
> - * Driver requirement: i915, xe
> + * Driver requirement: i915
>    * Test category: functionality test
>    * Functionality: kms_gem_interop, tiling
>    * Mega feature: General Display Features
> @@ -410,7 +410,7 @@ static void pitch_tests(int fd)
>    *
>    * SUBTEST: tile-pitch-mismatch
>    * Description: Test that addfb2 call fails correctly for pitches mismatch
> - * Driver requirement: i915, xe
> + * Driver requirement: i915
>    * Test category: functionality test
>    * Functionality: kms_gem_interop, tiling
>    * Mega feature: General Display Features
> @@ -478,8 +478,8 @@ static void tiling_tests(int fd)
>   		igt_describe("Test that addfb2 call fails correctly for pitches mismatch");
>   			f.pitches[0] = 512*4;
>   		igt_subtest("tile-pitch-mismatch") {
> -			if (is_i915_device(fd))
> -				igt_require(gem_available_fences(fd) > 0);
> +			igt_require_i915(fd);
> +			igt_require(gem_available_fences(fd) > 0);
>   
>   			f.handles[0] = tiled_x_bo;
>   			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
> @@ -488,12 +488,10 @@ static void tiling_tests(int fd)
>   		igt_describe("Test that addfb2 call fails correctly for basic y-tiling test");
>   		f.pitches[0] = 1024*4;
>   		igt_subtest("basic-y-tiled-legacy") {
> -			if (is_i915_device(fd)) {
> -				igt_require(!gem_has_lmem(fd));
> -				igt_require(gem_available_fences(fd) > 0);
> -			} else {
> -				igt_require(!xe_has_vram(fd));
> -			}
> +			igt_require_i915(fd);
> +			igt_require(!gem_has_lmem(fd));
> +			igt_require(gem_available_fences(fd) > 0);
> +
>   			f.handles[0] = tiled_y_bo;
>   
>   			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
> @@ -682,7 +680,7 @@ static void size_tests(int fd)
>    *
>    * SUBTEST: addfb25-x-tiled-mismatch-legacy
>    * Description: Test that addfb2 call fails correctly for irrelevant x-tiling
> - * Driver requirement: i915, xe
> + * Driver requirement: i915
>    * Test category: functionality test
>    * Functionality: kms_gem_interop, tiling
>    * Mega feature: General Display Features
> @@ -752,6 +750,7 @@ static void addfb25_tests(int fd)
>   
>   		igt_describe("Test that addfb2 call fails correctly for irrelevant x-tiling");
>   		igt_subtest("addfb25-x-tiled-mismatch-legacy") {
> +			igt_require_i915(fd);
>   			f.modifier[0] = DRM_FORMAT_MOD_LINEAR;
>   			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>   		}
