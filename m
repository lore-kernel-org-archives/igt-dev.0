Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864B210E07C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Dec 2022 14:26:55 +0000 (UTC)
Date: Tue, 27 Dec 2022 15:26:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y6sAqnYc5smC6uGw@kamilkon-desk1>
References: <20221226144359.237927-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226144359.237927-1-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_addfb_basic: Avoid open-coded
 expressions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-12-26 at 11:43:59 -0300, Maíra Canal wrote:
> Replace open-coded expressions with their equivalents in the IGT
> infrastructure and macros. In particular, replace open-coded
> implementations of do_ioctl() and do_ioctl_err().
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_addfb_basic.c | 153 +++++++++++++++++-----------------------
>  1 file changed, 63 insertions(+), 90 deletions(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index f91153b5..c58783d5 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -57,18 +57,6 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
>  	return err;
>  }
>  
> -static int rmfb(int fd, uint32_t id)
> -{
> -	int err;
> -
> -	err = 0;
> -	if (igt_ioctl(fd, DRM_IOCTL_MODE_RMFB, &id))
> -		err = -errno;
> -
> -	errno = 0;
> -	return err;
> -}
> -
>  static void invalid_tests(int fd)
>  {
>  	struct drm_mode_fb_cmd2 f = {};
> @@ -88,8 +76,8 @@ static void invalid_tests(int fd)
>  
>  		f.handles[0] = gem_bo;
>  
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  		f.fb_id = 0;
>  	}
>  
> @@ -100,8 +88,7 @@ static void invalid_tests(int fd)
>  		igt_require_fb_modifiers(fd);
>  
>  		f.handles[1] = gem_bo_small;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -			   errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  		f.handles[1] = 0;
>  	}
>  
> @@ -110,8 +97,7 @@ static void invalid_tests(int fd)
>  		igt_require_fb_modifiers(fd);
>  
>  		f.pitches[1] = 512;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -			   errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  		f.pitches[1] = 0;
>  	}
>  
> @@ -120,8 +106,7 @@ static void invalid_tests(int fd)
>  		igt_require_fb_modifiers(fd);
>  
>  		f.offsets[1] = 512;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -			   errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  		f.offsets[1] = 0;
>  	}
>  
> @@ -130,8 +115,7 @@ static void invalid_tests(int fd)
>  		igt_require_fb_modifiers(fd);
>  
>  		f.modifier[1] =  I915_FORMAT_MOD_X_TILED;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -			   errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  		f.modifier[1] = 0;
>  	}
>  
> @@ -142,10 +126,10 @@ static void invalid_tests(int fd)
>  		f.flags = 0;
>  		f.modifier[0] = 0;
>  		gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  		f.fb_id = 0;
> -		igt_assert(f.modifier[0] == 0);
> +		igt_assert_eq(f.modifier[0], 0);
>  	}
>  
>  	igt_describe("Check if addfb2 with a system memory gem object "
> @@ -199,7 +183,7 @@ static void invalid_tests(int fd)
>  			igt_debug("{bpp:%d, depth:%d} -> expect:%d\n",
>  				  arg.bpp, arg.depth, known_formats[i].expect);
>  			if (arg.fb_id) {
> -				igt_assert_eq(rmfb(fd, arg.fb_id), 0);
> +				do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &arg.fb_id);
>  				arg.fb_id = 0;
>  			}
>  		}
> @@ -236,7 +220,7 @@ static void invalid_tests(int fd)
>  				     "Expected %d with {bpp:%d, depth:%d}, got %d instead\n",
>  				     expect, arg.bpp, arg.depth, err);
>  			if (arg.fb_id) {
> -				igt_assert_eq(rmfb(fd, arg.fb_id), 0);
> +				do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &arg.fb_id);
>  				arg.fb_id = 0;
>  			}
>  
> @@ -264,7 +248,7 @@ static void invalid_tests(int fd)
>  				     arg.bpp, arg.depth,
>  				     err);
>  			if (arg.fb_id) {
> -				igt_assert_eq(rmfb(fd, arg.fb_id), 0);
> +				do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &arg.fb_id);
>  				arg.fb_id = 0;
>  			}
>  		}
> @@ -298,15 +282,14 @@ static void pitch_tests(int fd)
>  
>  	igt_describe("Test that addfb2 call fails correctly without handle");
>  	igt_subtest("no-handle") {
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -			   errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  	}
>  
>  	igt_describe("Check if addfb2 call works with given handle");
>  	f.handles[0] = gem_bo;
>  	igt_subtest("basic") {
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  		f.fb_id = 0;
>  	}
>  
> @@ -362,8 +345,8 @@ static void tiling_tests(int fd)
>  			igt_require(gem_available_fences(fd) > 0);
>  			f.handles[0] = tiled_x_bo;
>  
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> +			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  			f.fb_id = 0;
>  		}
>  
> @@ -373,10 +356,10 @@ static void tiling_tests(int fd)
>  			f.handles[0] = gem_bo;
>  
>  			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> -			igt_assert(__gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4) == -EBUSY);
> -			igt_assert(__gem_set_tiling(fd, gem_bo, I915_TILING_Y, 1024*4) == -EBUSY);
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> +			igt_assert_eq(__gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4), -EBUSY);
> +			igt_assert_eq(__gem_set_tiling(fd, gem_bo, I915_TILING_Y, 1024*4), -EBUSY);
> +			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  			f.fb_id = 0;
>  		}
>  
> @@ -386,8 +369,7 @@ static void tiling_tests(int fd)
>  			igt_require(gem_available_fences(fd) > 0);
>  			f.handles[0] = tiled_x_bo;
>  
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -				   errno == EINVAL);
> +			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  		}
>  
>  		igt_describe("Test that addfb2 call fails correctly for basic y-tiling test");
> @@ -397,8 +379,7 @@ static void tiling_tests(int fd)
>  			igt_require(gem_available_fences(fd) > 0);
>  			f.handles[0] = tiled_y_bo;
>  
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -				   errno == EINVAL);
> +			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  		}
>  
>  		igt_fixture {
> @@ -449,15 +430,15 @@ static void size_tests(int fd)
>  
>  	igt_describe("Check if addfb2 call works with max size of buffer object");
>  	igt_subtest("size-max") {
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  		f.fb_id = 0;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_16) == 0);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_16.fb_id) == 0);
> +		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_16);
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f_16.fb_id);
>  		f_16.fb_id = 0;
>  		if (igt_display_has_format_mod(&display, DRM_FORMAT_C8, 0)) {
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == 0);
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_8.fb_id) == 0);
> +			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8);
> +			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f_8.fb_id);
>  			f_8.fb_id = 0;
>  		}
>  	}
> @@ -467,12 +448,9 @@ static void size_tests(int fd)
>  	f_8.width++;
>  	igt_describe("Test that addfb2 call fails correctly with increased width of fb");
>  	igt_subtest("too-wide") {
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -			   errno == EINVAL);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_16) == -1 &&
> -			   errno == EINVAL);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == -1 &&
> -			   errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f_16, EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f_8, EINVAL);
>  	}
>  	f.width--;
>  	f_16.width--;
> @@ -509,8 +487,8 @@ static void size_tests(int fd)
>  	igt_describe("Check if addfb2 call works for given height");
>  	f.height = 1020;
>  	igt_subtest("small-bo") {
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  		f.fb_id = 0;
>  	}
>  
> @@ -519,8 +497,7 @@ static void size_tests(int fd)
>  		igt_require_intel(fd);
>  		igt_require(gem_available_fences(fd) > 0);
>  		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -			   errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  	}
>  
>  
> @@ -555,7 +532,7 @@ static void addfb25_tests(int fd)
>  		igt_require_fb_modifiers(fd);
>  
>  		f.modifier[0] = I915_FORMAT_MOD_X_TILED;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  	}
>  
>  	igt_fixture
> @@ -566,7 +543,7 @@ static void addfb25_tests(int fd)
>  		igt_require_fb_modifiers(fd);
>  
>  		f.modifier[0] = ~0;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  	}
>  
>  	igt_subtest_group {
> @@ -580,24 +557,24 @@ static void addfb25_tests(int fd)
>  		igt_describe("Test that addfb2 call fails correctly for irrelevant x-tiling");
>  		igt_subtest("addfb25-x-tiled-mismatch-legacy") {
>  			f.modifier[0] = DRM_FORMAT_MOD_LINEAR;
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
> +			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  		}
>  
>  		igt_describe("Check if addfb2 call works for x-tiling");
>  		igt_subtest("addfb25-x-tiled-legacy") {
>  			f.modifier[0] = I915_FORMAT_MOD_X_TILED;
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> +			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  			f.fb_id = 0;
>  		}
>  
>  		igt_describe("Check if addfb2 call works for relevant combination of tiling and fbs");
>  		igt_subtest("addfb25-framebuffer-vs-set-tiling") {
>  			f.modifier[0] = I915_FORMAT_MOD_X_TILED;
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> -			igt_assert(__gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4) == -EBUSY);
> -			igt_assert(__gem_set_tiling(fd, gem_bo, I915_TILING_Y, 1024*4) == -EBUSY);
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
> +			igt_assert_eq(__gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4), -EBUSY);
> +			igt_assert_eq(__gem_set_tiling(fd, gem_bo, I915_TILING_Y, 1024*4), -EBUSY);
> +			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  			f.fb_id = 0;
>  		}
>  	}
> @@ -644,10 +621,10 @@ static void addfb25_ytile(int fd)
>  		igt_require_intel(fd);
>  
>  		f.modifier[0] = I915_FORMAT_MOD_Y_TILED;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) ==
> -			   addfb_expected_ret(&display, &f));
> +		igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
> +			      addfb_expected_ret(&display, &f));
>  		if (!addfb_expected_ret(&display, &f))
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  		f.fb_id = 0;
>  	}
>  
> @@ -657,10 +634,10 @@ static void addfb25_ytile(int fd)
>  		igt_require_intel(fd);
>  
>  		f.modifier[0] = I915_FORMAT_MOD_Yf_TILED;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) ==
> -			   addfb_expected_ret(&display, &f));
> +		igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
> +			      addfb_expected_ret(&display, &f));
>  		if (!addfb_expected_ret(&display, &f))
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  		f.fb_id = 0;
>  	}
>  
> @@ -673,7 +650,7 @@ static void addfb25_ytile(int fd)
>  		f.height = 1023;
>  		f.handles[0] = gem_bo_small;
>  		igt_require(addfb_expected_ret(&display, &f) == 0);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>  		f.fb_id = 0;
>  	}
>  
> @@ -715,10 +692,10 @@ static void addfb25_4tile(int fd)
>  		igt_require_intel(fd);
>  
>  		f.modifier[0] = I915_FORMAT_MOD_4_TILED;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) ==
> -			   addfb_expected_ret(&display, &f));
> +		igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
> +			      addfb_expected_ret(&display, &f));
>  		if (!addfb_expected_ret(&display, &f))
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  		f.fb_id = 0;
>  	}
>  
> @@ -747,7 +724,7 @@ static void prop_tests(int fd)
>  
>  		f.handles[0] = gem_bo;
>  
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> +		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
>  	}
>  
>  	get_props.props_ptr = (uintptr_t) &prop;
> @@ -759,16 +736,14 @@ static void prop_tests(int fd)
>  	igt_subtest("invalid-get-prop-any") {
>  		get_props.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
>  
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_OBJ_GETPROPERTIES,
> -				    &get_props) == -1 && errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_OBJ_GETPROPERTIES, &get_props, EINVAL);
>  	}
>  
>  	igt_describe("Test that get-properties ioctl call fails correctly for fb mode object");
>  	igt_subtest("invalid-get-prop") {
>  		get_props.obj_type = DRM_MODE_OBJECT_FB;
>  
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_OBJ_GETPROPERTIES,
> -				    &get_props) == -1 && errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_OBJ_GETPROPERTIES, &get_props, EINVAL);
>  	}
>  
>  	set_prop.value = 0;
> @@ -779,20 +754,18 @@ static void prop_tests(int fd)
>  	igt_subtest("invalid-set-prop-any") {
>  		set_prop.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
>  
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_OBJ_SETPROPERTY,
> -				    &set_prop) == -1 && errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_OBJ_SETPROPERTY, &set_prop, EINVAL);
>  	}
>  
>  	igt_describe("Test that get-properties ioctl call fails correctly for fb mode object");
>  	igt_subtest("invalid-set-prop") {
>  		set_prop.obj_type = DRM_MODE_OBJECT_FB;
>  
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_OBJ_SETPROPERTY,
> -				    &set_prop) == -1 && errno == EINVAL);
> +		do_ioctl_err(fd, DRM_IOCTL_MODE_OBJ_SETPROPERTY, &set_prop, EINVAL);
>  	}
>  
>  	igt_fixture
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  
>  }
>  
> @@ -812,7 +785,7 @@ static void master_tests(int fd)
>  
>  		f.handles[0] = gem_bo;
>  
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> +		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
>  	}
>  
>  	igt_describe("Check that only master can rmfb");
> @@ -823,7 +796,7 @@ static void master_tests(int fd)
>  
>  		master2_fd = drm_open_driver_master(DRIVER_ANY);
>  
> -		igt_assert_eq(rmfb(master2_fd, f.fb_id), -ENOENT);
> +		do_ioctl_err(master2_fd, DRM_IOCTL_MODE_RMFB, &f.fb_id, ENOENT);
>  
>  		igt_device_drop_master(master2_fd);
>  		close(master2_fd);
> @@ -832,7 +805,7 @@ static void master_tests(int fd)
>  	}
>  
>  	igt_fixture
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
>  
>  }
>  
> -- 
> 2.38.1
> 
