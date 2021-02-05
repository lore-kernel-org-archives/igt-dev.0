Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5666E185
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Feb 2021 05:55:29 +0000 (UTC)
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
Date: Fri, 5 Feb 2021 05:55:24 +0000
Message-ID: <3d594be8e394476588ea9d58802b892e@intel.com>
References: <20210128202136.2439931-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210128202136.2439931-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_addfb_basic:Added subtest
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
To: "Hagaragi, Arundhati" <arundhati.hagaragi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "B@freedesktop.org" <B@freedesktop.org>, "S@freedesktop.org" <S@freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Arundhati
> Hagaragi
> Sent: 29 January 2021 01:52
> To: igt-dev@lists.freedesktop.org
> Cc: S@freedesktop.org; B@freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_addfb_basic:Added subtest
> description
> 
> Added description for all subtests
> 
> Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
> Cc: B S, Karthik <Karthik.B.S@intel.com>
> ---
>  tests/kms_addfb_basic.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c index
> 090abe7f..84b34981 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -94,6 +94,7 @@ static void invalid_tests(int fd)
> 
>  	f.flags = LOCAL_DRM_MODE_FB_MODIFIERS;
> 
> +	igt_describe("Check if fb (addfb2) works with given buffer object");
>  	igt_subtest("unused-handle") {
>  		igt_require_fb_modifiers(fd);


The description seems to be wrong as test checks for the failed call to 
DRM_IOCTL_MODE_ADDFB2.

igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
	                           errno == EINVAL);
       
 I think the description should be something  like
 "Test that addfb2 call fails correctly for unused handle"

 In fact various other subtests check on failed call to DRM_IOCTL_MODE_ADDFB2
so test description needs to be changed accordingly.

Thanks,
Pankaj
> 
> @@ -103,6 +104,7 @@ static void invalid_tests(int fd)
>  		f.handles[1] = 0;
>  	}
> 
> +	igt_describe("Check if fb (addfb2) works with given pitch");
>  	igt_subtest("unused-pitches") {
>  		igt_require_fb_modifiers(fd);
> 
> @@ -112,6 +114,7 @@ static void invalid_tests(int fd)
>  		f.pitches[1] = 0;
>  	}
> 
> +	igt_describe("Check if fb (addfb2) works with given offset");
>  	igt_subtest("unused-offsets") {
>  		igt_require_fb_modifiers(fd);
> 
> @@ -121,6 +124,7 @@ static void invalid_tests(int fd)
>  		f.offsets[1] = 0;
>  	}
> 
> +	igt_describe("Check if fb (addfb2) works with given modifier");
>  	igt_subtest("unused-modifier") {
>  		igt_require_fb_modifiers(fd);
> 
> @@ -130,6 +134,7 @@ static void invalid_tests(int fd)
>  		f.modifier[1] = 0;
>  	}
> 
> +	igt_describe("Check if fb (addfb2) works with clobberred modifier");
>  	igt_subtest("clobberred-modifier") {
>  		igt_require_intel(fd);
>  		f.flags = 0;
> @@ -141,6 +146,7 @@ static void invalid_tests(int fd)
>  		igt_assert(f.modifier[0] == 0);
>  	}
> 
> +	igt_describe("Check for legacy interface to addfb2");
>  	igt_subtest("legacy-format") {
>  		struct {
>  			/* drm_mode_legacy_fb_format() */
> @@ -266,11 +272,13 @@ static void pitch_tests(int fd)
>  		igt_assert(gem_bo);
>  	}
> 
> +	igt_describe("Check if fb (addfb2) works without buffer object");
>  	igt_subtest("no-handle") {
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1
> &&
>  			   errno == EINVAL);
>  	}
> 
> +	igt_describe("Check if fb (addfb2 and rmfb) works with given buffer
> +object");
>  	f.handles[0] = gem_bo;
>  	igt_subtest("basic") {
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> @@ -278,6 +286,7 @@ static void pitch_tests(int fd)
>  		f.fb_id = 0;
>  	}
> 
> +	igt_describe("Check if fb (addfb2) works with given bad_pitches");
>  	for (i = 0; i < ARRAY_SIZE(bad_pitches); i++) {
>  		igt_subtest_f("bad-pitch-%i", bad_pitches[i]) {
>  			f.pitches[0] = bad_pitches[i];
> @@ -331,6 +340,7 @@ static void tiling_tests(int fd)
>  		}
> 
>  		f.pitches[0] = 1024*4;
> +		igt_describe("Basic x-tiling test");
>  		igt_subtest("basic-x-tiled-legacy") {
>  			f.handles[0] = tiled_x_bo;
> 
> @@ -339,6 +349,7 @@ static void tiling_tests(int fd)
>  			f.fb_id = 0;
>  		}
> 
> +		igt_describe("Tiling test for both x & y tiling with fb(addfb2 &
> +rmfb");
>  		igt_subtest("framebuffer-vs-set-tiling") {
>  			f.handles[0] = gem_bo;
> 
> @@ -350,7 +361,9 @@ static void tiling_tests(int fd)
>  			f.fb_id = 0;
>  		}
> 
> -		f.pitches[0] = 512*4;
> +		igt_describe("Tiling test to check if fb (addfb2) works well with
> given pitch and  "
> +				"x-tiled buffer object");
> +			f.pitches[0] = 512*4;
>  		igt_subtest("tile-pitch-mismatch") {
>  			f.handles[0] = tiled_x_bo;
> 
> @@ -358,6 +371,7 @@ static void tiling_tests(int fd)
>  				   errno == EINVAL);
>  		}
> 
> +		igt_describe("Basic y-tiling test");
>  		f.pitches[0] = 1024*4;
>  		igt_subtest("basic-y-tiled-legacy") {
>  			f.handles[0] = tiled_y_bo;
> @@ -409,6 +423,7 @@ static void size_tests(int fd)
>  	f_16.handles[0] = gem_bo;
>  	f_8.handles[0] = gem_bo;
> 
> +	igt_describe("Check if fb(addfb2 & rmfb) works with given size of
> +buffer object");
>  	igt_subtest("size-max") {
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) ==
> 0); @@ -424,6 +439,7 @@ static void size_tests(int fd)
>  	f.width++;
>  	f_16.width++;
>  	f_8.width++;
> +	igt_describe("Check if fb(addfb2 & rmfb) works with increased width of
> +fb");
>  	igt_subtest("too-wide") {
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1
> &&
>  			   errno == EINVAL);
> @@ -438,6 +454,7 @@ static void size_tests(int fd)
>  	f.height++;
>  	f_16.height++;
>  	f_8.height++;
> +	igt_describe("Check if fb(addfb2 & rmfb) works with increased height
> +of fb");
>  	igt_subtest("too-high") {
>  		for (i = 0; i < ARRAY_SIZE(framebuffers); i++) {
>  			igt_debug("Checking framebuffer %i\n", i); @@ -453,6
> +470,7 @@ static void size_tests(int fd)
>  		}
>  	}
> 
> +	igt_describe("Check if fb(addfb2 & rmfb) works with small buffer
> +object");
>  	f.handles[0] = gem_bo_small;
>  	igt_subtest("bo-too-small") {
>  		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -
> 1); @@ -467,6 +485,7 @@ static void size_tests(int fd)
>  	}
> 
>  	/* Just to check that the parameters would work. */
> +	igt_describe("Check if fb(addfb2 & rmfb) works with given random
> +height");
>  	f.height = 1020;
>  	igt_subtest("small-bo") {
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
> @@ -474,6 +493,7 @@ static void size_tests(int fd)
>  		f.fb_id = 0;
>  	}
> 
> +	igt_describe("Check if fb(addfb2 & rmfb) works with small buffer
> +object after changing tile");
>  	igt_subtest("bo-too-small-due-to-tiling") {
>  		igt_require_intel(fd);
>  		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
> @@ -508,6 +528,7 @@ static void addfb25_tests(int fd)
>  		f.handles[0] = gem_bo;
>  	}
> 
> +	igt_describe("Check if fb(addfb2) works with x-tiling tests and
> +without flag");
>  	igt_subtest("addfb25-modifier-no-flag") {
>  		igt_require_fb_modifiers(fd);
> 
> @@ -518,6 +539,7 @@ static void addfb25_tests(int fd)
>  	igt_fixture
>  		f.flags = LOCAL_DRM_MODE_FB_MODIFIERS;
> 
> +	igt_describe("Checks irrelevant modifier which wont work with
> +fb(addfb2)");
>  	igt_subtest("addfb25-bad-modifier") {
>  		igt_require_fb_modifiers(fd);
> 
> @@ -532,11 +554,13 @@ static void addfb25_tests(int fd)
>  			igt_require_fb_modifiers(fd);
>  		}
> 
> +		igt_describe("Tiling test that check fb(addfb2) which wont work
> with
> +x-tiling");
>  		igt_subtest("addfb25-x-tiled-mismatch-legacy") {
>  			f.modifier[0] = LOCAL_DRM_FORMAT_MOD_NONE;
>  			igt_assert(drmIoctl(fd,
> LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
>  		}
> 
> +		igt_describe("Tiling test that check fb(addfb2 & rmfb) work well
> with
> +x-tiling ");
>  		igt_subtest("addfb25-x-tiled-legacy") {
>  			f.modifier[0] = LOCAL_I915_FORMAT_MOD_X_TILED;
>  			igt_assert(drmIoctl(fd,
> LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0); @@ -544,6 +568,7 @@ static
> void addfb25_tests(int fd)
>  			f.fb_id = 0;
>  		}
> 
> +		igt_describe("Tiling test that check relevant combination of
> tiling
> +and fbs which works");
>  		igt_subtest("addfb25-framebuffer-vs-set-tiling") {
>  			f.modifier[0] = LOCAL_I915_FORMAT_MOD_X_TILED;
>  			igt_assert(drmIoctl(fd,
> LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0); @@ -596,6 +621,7 @@ static
> void addfb25_ytile(int fd)
>  		f.handles[0] = gem_bo;
>  	}
> 
> +	igt_describe("Tiling test that check fb(addfb2) works with y-tiling");
>  	igt_subtest("addfb25-y-tiled-legacy") {
>  		igt_require_fb_modifiers(fd);
>  		igt_require_intel(fd);
> @@ -608,6 +634,7 @@ static void addfb25_ytile(int fd)
>  		f.fb_id = 0;
>  	}
> 
> +	igt_describe("Tiling test that check fb(addfb2) works with
> +yf-tiling");
>  	igt_subtest("addfb25-yf-tiled-legacy") {
>  		igt_require_fb_modifiers(fd);
>  		igt_require_intel(fd);
> @@ -620,6 +647,7 @@ static void addfb25_ytile(int fd)
>  		f.fb_id = 0;
>  	}
> 
> +	igt_describe("Tiling test that check fb(addfb2) works with y-tiling
> +else return relevant error");
>  	igt_subtest("addfb25-y-tiled-small-legacy") {
>  		igt_require_fb_modifiers(fd);
>  		igt_require_intel(fd);
> @@ -667,6 +695,7 @@ static void prop_tests(int fd)
>  	get_props.count_props = 1;
>  	get_props.obj_id = f.fb_id;
> 
> +	igt_describe("Test to get the properties with combination of any mode
> +object");
>  	igt_subtest("invalid-get-prop-any") {
>  		get_props.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
> 
> @@ -674,6 +703,7 @@ static void prop_tests(int fd)
>  				    &get_props) == -1 && errno == EINVAL);
>  	}
> 
> +	igt_describe("Test to get the properties with given mode object");
>  	igt_subtest("invalid-get-prop") {
>  		get_props.obj_type = DRM_MODE_OBJECT_FB;
> 
> @@ -685,6 +715,7 @@ static void prop_tests(int fd)
>  	set_prop.prop_id = 1;
>  	set_prop.obj_id = f.fb_id;
> 
> +	igt_describe("Test to set the properties with combination of any mode
> +object");
>  	igt_subtest("invalid-set-prop-any") {
>  		set_prop.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
> 
> @@ -692,6 +723,7 @@ static void prop_tests(int fd)
>  				    &set_prop) == -1 && errno == EINVAL);
>  	}
> 
> +	igt_describe("Test to get the properties with given mode object");
>  	igt_subtest("invalid-set-prop") {
>  		set_prop.obj_type = DRM_MODE_OBJECT_FB;
> 
> @@ -723,6 +755,7 @@ static void master_tests(int fd)
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
>  	}
> 
> +	igt_describe("Check that only master can rmfb");
>  	igt_subtest("master-rmfb") {
>  		int master2_fd;
> 
> --
> 2.25.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
