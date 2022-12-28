Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AF910E3CE
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Dec 2022 18:30:43 +0000 (UTC)
Message-ID: <69d486a4-3c81-0999-4762-d2a497b64d54@intel.com>
Date: Thu, 29 Dec 2022 00:00:19 +0530
MIME-Version: 1.0
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-5-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20221115170855.196572-5-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t v5 04/52] tests/kms_atomic: Add support for
 Bigjoiner
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

Hi Bhanu,

Don't try to do many things in one patch. Create smaller patches. For 
instance in this patch, only big joiner check should haven been 
introduced and rest all cleanup should have been separate patch.
However, for now

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 15-Nov-22 10:38 PM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
> 
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
> 
> V2: - Use updated helper name
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_atomic.c | 32 ++++++++++++++++++++++++++++----
>   1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 2a3fb74b..61117a3f 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -1265,6 +1265,10 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
>   
>   static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *output, igt_plane_t *primary, struct igt_fb *fb)
>   {
> +	igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +		 kmstest_pipe_name(pipe), igt_output_name(output));
> +
> +	igt_display_reset(display);
>   	igt_output_set_pipe(output, pipe);
>   	igt_plane_set_fb(primary, fb);
>   
> @@ -1293,6 +1297,7 @@ igt_main
>   	igt_plane_t *primary = NULL;
>   	drmModeModeInfo *mode;
>   	struct igt_fb fb;
> +	bool valid_config = false;
>   
>   	igt_fixture {
>   		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -1303,8 +1308,16 @@ igt_main
>   		igt_require(display.is_atomic);
>   		igt_display_require_output(&display);
>   
> -		for_each_pipe_with_valid_output(&display, pipe, output)
> -			break;
> +		for_each_pipe_with_valid_output(&display, pipe, output) {
> +			igt_display_reset(&display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (i915_pipe_output_combo_valid(&display)) {
> +				valid_config = true;
> +				break;
> +			}
> +		}
> +		igt_require(valid_config);
>   
>   		pipe_obj = &display.pipes[pipe];
>   		primary = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
> @@ -1342,9 +1355,13 @@ igt_main
>   	igt_subtest("plane-primary-overlay-mutable-zpos") {
>   		uint32_t format_primary = DRM_FORMAT_ARGB8888;
>   		uint32_t format_overlay = DRM_FORMAT_ARGB1555;
> +		igt_plane_t *overlay;
>   
> -		igt_plane_t *overlay =
> -			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
> +		igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +			 kmstest_pipe_name(pipe), igt_output_name(output));
> +
> +		igt_display_reset(&display);
> +		overlay = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
>   		igt_require(overlay);
>   
>   		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
> @@ -1361,6 +1378,10 @@ igt_main
>   	igt_describe("Verify the reported zpos property of planes by making sure "\
>   		     "only higher zpos planes cover the lower zpos ones.");
>   	igt_subtest("plane-immutable-zpos") {
> +		igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +			 kmstest_pipe_name(pipe), igt_output_name(output));
> +
> +		igt_display_reset(&display);
>   		igt_output_set_pipe(output, pipe);
>   		plane_immutable_zpos(&display, pipe_obj, output);
>   	}
> @@ -1370,6 +1391,9 @@ igt_main
>   	igt_subtest("test-only") {
>   		atomic_clear(&display, pipe, primary, output);
>   
> +		igt_info("Using (pipe %s + %s) to run the subtest.\n",
> +			 kmstest_pipe_name(pipe), igt_output_name(output));
> +
>   		test_only(pipe_obj, primary, output);
>   	}
>   

-- 
~Swati Sharma
