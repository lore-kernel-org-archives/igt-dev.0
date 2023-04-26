Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420E410E8EC
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 07:48:41 +0000 (UTC)
Message-ID: <e5c989b4-5d1c-9a4d-94f8-6415132db369@intel.com>
Date: Wed, 26 Apr 2023 13:18:36 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
 <20230425064953.2121947-39-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230425064953.2121947-39-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V2 38/40] tests/kms_rotation_crc: Add XE
 support
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

On 25-Apr-23 12:19 PM, Bhanuprakash Modem wrote:
> Add XE driver support for kms tests.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_rotation_crc.c | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 295aed762..23c18c242 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -459,7 +459,7 @@ static bool test_format(data_t *data,
>   	if (!igt_fb_supported_format(format))
>   		return false;
>   
> -	if (!is_i915_device(data->gfx_fd) ||
> +	if (!is_intel_device(data->gfx_fd) ||
>   	    data->extended)
>   		return true;
>   
> @@ -545,14 +545,14 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   		igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
>   		igt_require(igt_plane_has_rotation(plane, data->rotation));
>   		/* CHV can't rotate and reflect simultaneously */
> -		igt_require(!is_i915_device(data->gfx_fd) ||
> +		igt_require(!is_intel_device(data->gfx_fd) ||
>   			    !IS_CHERRYVIEW(data->devid) ||
>   			    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
>   
>   		prepare_crtc(data, output, pipe, plane, true);
>   
>   		for (i = 0; i < num_rectangle_types; i++) {
> -			/* Unsupported on i915 */
> +			/* Unsupported on intel */
>   			if (plane_type == DRM_PLANE_TYPE_CURSOR &&
>   			    i != square)
>   				continue;
> @@ -560,9 +560,8 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   			/* Only support partial covering primary plane on gen9+ */
>   			if (is_amdgpu_device(data->gfx_fd) ||
>   				(plane_type == DRM_PLANE_TYPE_PRIMARY &&
> -				 is_i915_device(data->gfx_fd) &&
> -				 intel_display_ver(
> -					 intel_get_drm_devid(data->gfx_fd)) < 9)) {
> +				 is_intel_device(data->gfx_fd) &&
> +				 intel_display_ver(data->devid) < 9)) {
>   				if (i != rectangle)
>   					continue;
>   				else
> @@ -592,7 +591,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   						 data->override_fmt, test_bad_format);
>   			}
>   		}
> -		if (is_i915_device(data->gfx_fd)) {
> +		if (is_intel_device(data->gfx_fd)) {
>   			igt_pipe_crc_stop(data->pipe_crc);
>   		}
>   	}
> @@ -841,6 +840,10 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   		igt_pipe_crc_start(data->pipe_crc);
>   
>   		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
> +			if (is_xe_device(data->gfx_fd) &&
> +			    planeconfigs[i].modifier != DRM_FORMAT_MOD_LINEAR)
> +				continue;
> +
>   			p[0].fbinfo = &planeconfigs[i];
>   			pointlocation(data, p, mode, 0);
>   
> @@ -1137,7 +1140,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_fixture {
>   		data.gfx_fd = drm_open_driver_master(DRIVER_ANY);
> -		if (is_i915_device(data.gfx_fd)) {
> +		if (is_intel_device(data.gfx_fd)) {
>   			data.devid = intel_get_drm_devid(data.gfx_fd);
>   			gen = intel_display_ver(data.devid);
>   		}
> @@ -1193,6 +1196,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_describe("Checking unsupported tiling for gen9+ with 90 degree of rotation");
>   	igt_subtest_f("bad-tiling") {
> +		igt_require_i915(data.gfx_fd);
bad-tiling test should be applicable for xe too.
anything apart from LINEAR is negative test for xe.
>   		data.rotation = IGT_ROTATION_90;
>   		data.override_modifier = I915_FORMAT_MOD_X_TILED;
>   		test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, true);
> @@ -1201,6 +1206,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_describe("Tiling and Rotation test for gen 10+ for primary plane");
>   	for (reflect_x = reflect_x_subtests; reflect_x->modifier; reflect_x++) {
> +		igt_fixture
> +			igt_require_i915(data.gfx_fd);

Should we add LINEAR format tests with different rot in reflect_x_subtests,
so that we can cover xe with linear+rot combinations and continue this test
if (xe) && format != LINEAR only.

> +
>   		igt_subtest_f("primary-%s-reflect-x-%s",
>   			      modifier_test_str(reflect_x->modifier),
>   			      rot_test_str(reflect_x->rot)) {
> @@ -1260,6 +1268,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		enum pipe pipe;
>   		igt_output_t *output;
>   
> +		igt_require_i915(data.gfx_fd);
Please write a comment why only i915 and not xe.
>   		igt_display_require_output(&data.display);
>   
>   		for_each_pipe_with_valid_output(&data.display, pipe, output) {
