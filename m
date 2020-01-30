Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1159289E03
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 10:30:22 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20200127144554.11364-2-mika.kahola@intel.com>
References: <20200127144554.11364-1-mika.kahola@intel.com>
 <20200127144554.11364-2-mika.kahola@intel.com>
Date: Thu, 30 Jan 2020 12:30:16 +0200
Message-ID: <87zhe59qyv.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_plane_lowres: Skip Yf
 tiling tests from gen12 onwards
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
To: Mika Kahola <mika.kahola@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 27 Jan 2020, Mika Kahola <mika.kahola@intel.com> wrote:
> Yf tiling is not supported by gen12. The patch proposes that we
> intentionally skip this subtest.
>
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  tests/kms_plane_lowres.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index 4c3f5636..f4a9ff8d 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -37,6 +37,7 @@ IGT_TEST_DESCRIPTION("Test atomic mode setting with a plane by switching between
>  typedef struct {
>  	int drm_fd;
>  	igt_display_t display;
> +	uint32_t devid;
>  	struct igt_fb fb_primary;
>  	struct igt_fb fb_plane[2];
>  	struct {
> @@ -236,6 +237,9 @@ test_planes_on_pipe(data_t *data, enum pipe pipe, uint64_t modifier)
>  	igt_skip_on(!igt_display_has_format_mod(&data->display,
>  						DRM_FORMAT_XRGB8888, modifier));
>  
> +	igt_skip_on(intel_gen(data->devid) >= 12 &&

In general I don't think we should skip based on platform/gen. Check for
the *feature*, not the *platform*. Don't accumulate platform specific
knowledge to igt.

BR,
Jani.

> +		    modifier == LOCAL_I915_FORMAT_MOD_Yf_TILED);
> +
>  	for_each_valid_output_on_pipe(&data->display, pipe, output)
>  		tested += test_planes_on_pipe_with_output(data, pipe, output,
>  							  modifier);
> @@ -250,6 +254,8 @@ igt_main
>  
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		data.devid = is_i915_device(data.drm_fd) ?
> +			intel_get_drm_devid(data.drm_fd) : 0;
>  
>  		kmstest_set_vt_graphics_mode();

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
