Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BC910E080
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 03:47:22 +0000 (UTC)
Message-ID: <bcb7be7b-b75e-9d99-fe6c-ba6422aaab95@intel.com>
Date: Fri, 13 Oct 2023 09:17:03 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231010055940.41997-1-swati2.sharma@intel.com>
 <20231010055940.41997-6-swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231010055940.41997-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 5/6] tests/kms_atomic: check validity of
 pipe-output combo
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

Hi,

On 10/10/2023 11:29 AM, Swati Sharma wrote:
> Check validity of pipe-output combination.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_atomic.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
>
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index e9159ded2..bed468e4b 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -1393,6 +1393,22 @@ static bool has_zpos(igt_plane_t *plane)
>   	return igt_plane_has_prop(plane, IGT_PLANE_ZPOS);
>   }
>   
> +static bool
> +pipe_output_combo_valid(igt_display_t *display,
> +			enum pipe pipe, igt_output_t *output)

Could this be moved into lib? I see this is already being used in 
kms_vblank as well. May be even other tests can use this?

Thanks,
Karthik.B.S
> +{
> +	bool ret = true;
> +
> +	igt_display_reset(display);
> +
> +	igt_output_set_pipe(output, pipe);
> +	if (!i915_pipe_output_combo_valid(display))
> +		ret = false;
> +	igt_output_set_pipe(output, PIPE_NONE);
> +
> +	return ret;
> +}
> +
>   igt_main
>   {
>   	enum pipe pipe = PIPE_NONE;
> @@ -1415,6 +1431,8 @@ igt_main
>   				igt_pipe_get_plane_type(&data.display.pipes[pipe], DRM_PLANE_TYPE_OVERLAY);
>   			uint32_t format = plane_get_igt_format(overlay);
>   
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
>   			if (!overlay || !format)
>   				continue;
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1430,6 +1448,8 @@ igt_main
>   		     "the legacy and atomic interfaces.");
>   	igt_subtest_with_dynamic("plane-primary-legacy") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   				atomic_setup(&data, pipe, output);
>   				plane_primary(&data);
> @@ -1446,6 +1466,9 @@ igt_main
>   			igt_plane_t *overlay =
>   				igt_pipe_get_plane_type(&data.display.pipes[pipe], DRM_PLANE_TYPE_OVERLAY);
>   
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
>   			atomic_setup(&data, pipe, output);
>   			if (!overlay)
>   				continue;
> @@ -1469,6 +1492,8 @@ igt_main
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
>   			int n_planes = data.display.pipes[pipe].n_planes;
>   
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
>   			if (n_planes < 2)
>   				continue;
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1486,6 +1511,9 @@ igt_main
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
>   			uint32_t format;
>   
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
>   			atomic_setup(&data, pipe, output);
>   			format = plane_get_igt_format(data.primary);
>   
> @@ -1506,6 +1534,8 @@ igt_main
>   			igt_plane_t *cursor =
>   				igt_pipe_get_plane_type(&data.display.pipes[pipe], DRM_PLANE_TYPE_CURSOR);
>   
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
>   			if (!cursor)
>   				continue;
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> @@ -1520,6 +1550,8 @@ igt_main
>   	igt_describe("Test error handling when invalid plane parameters are passed");
>   	igt_subtest_with_dynamic("plane-invalid-params") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   				atomic_setup(&data, pipe, output);
>   				plane_invalid_params(&data, output);
> @@ -1532,6 +1564,8 @@ igt_main
>   	igt_describe("Test error handling when invalid plane fence parameters are passed");
>   	igt_subtest_with_dynamic("plane-invalid-params-fence") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   				atomic_setup(&data, pipe, output);
>   				plane_invalid_params_fence(&data, output);
> @@ -1544,6 +1578,8 @@ igt_main
>   	igt_describe("Test error handling when invalid crtc parameters are passed");
>   	igt_subtest_with_dynamic("crtc-invalid-params") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   				atomic_setup(&data, pipe, output);
>   				crtc_invalid_params(&data, output);
> @@ -1556,6 +1592,8 @@ igt_main
>   	igt_describe("Test error handling when invalid crtc fence parameters are passed");
>   	igt_subtest_with_dynamic("crtc-invalid-params-fence") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   				atomic_setup(&data, pipe, output);
>   				crtc_invalid_params_fence(&data, output);
> @@ -1570,6 +1608,8 @@ igt_main
>   		     "allow us to create.");
>   	igt_subtest_with_dynamic("atomic-invalid-params") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   				atomic_setup(&data, pipe, output);
>   				atomic_invalid_params(&data, output);
> @@ -1582,6 +1622,9 @@ igt_main
>   	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
>   	igt_subtest_with_dynamic("atomic-plane-damage") {
>   		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
>   			atomic_setup(&data, pipe, output);
>   
>   			if (!igt_plane_has_prop(data.primary, IGT_PLANE_FB_DAMAGE_CLIPS))
