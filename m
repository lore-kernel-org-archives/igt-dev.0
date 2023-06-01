Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE97810E23A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 08:31:46 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51492ae66a4so895374a12.1
 for <igt-dev@lists.freedesktop.org>; Thu, 01 Jun 2023 01:31:46 -0700 (PDT)
Message-ID: <ffa9c5e3-bb44-7f6c-8b7a-ab4df08c2b81@gmail.com>
Date: Thu, 1 Jun 2023 11:31:38 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230530044645.341877-1-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230530044645.341877-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_plane_scaling: add
 get_num_scalers()
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

On 30.5.2023 7.46, Swati Sharma wrote:
> Verify the count of supported scalers per CRTC, and proceed with
> executing tests if the necessary number of scalers is available.
> With the exception of "planes-.*" and "2x-scaler-multi-pipe"
> subtests, a minimum of 1 scaler is needed for all other tests,
> while these specific tests require a minimum of 2 scalers.
> 
> v2: -improved commit message (Kamil)
>      -handled get_num_scalers() for non-intel devices (Kamil)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_plane_scaling.c | 50 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 0e7cd4a2..4033d2ea 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -368,6 +368,32 @@ const struct {
>   	},
>   };
>   
> +/* Returns num_scalers from the crtc debugfs. */
> +static int get_num_scalers(data_t *data, enum pipe pipe)

pipe parameter is not used for anything.

> +{
> +	char buf[512];
> +	char *start_loc;
> +	int dir, res;
> +	int num_scalers = 0;
> +
> +	if (is_intel_device(data->drm_fd) &&
> +	    intel_display_ver(intel_get_drm_devid(data->drm_fd)) >= 9) {
> +
> +		dir = igt_debugfs_dir(data->drm_fd);
> +		igt_assert(dir >= 0);
> +
> +		res = igt_debugfs_simple_read(dir, "i915_display_info", buf, sizeof(buf));
> +		close(dir);
> +		igt_require(res > 0);
> +
> +		igt_assert(start_loc = strstr(buf, "num_scalers="));
> +		igt_assert_eq(sscanf(start_loc, "num_scalers=%d", &num_scalers), 1);

Here is looked for first instance of "num_scalers=" which likely will 
fit into first 512 characters, that will be amount of scalers on pipe-a.

> +
> +	}
> +
> +	return num_scalers;
> +}
> +

Fixing above function to get scaler from requested pipe probably could 
go live somewhere under lib/

>   static int get_width(drmModeModeInfo *mode, double scaling_factor)
>   {
>   	if (scaling_factor == 0.0)
> @@ -873,6 +899,9 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
>   	igt_output_set_pipe(output1, pipe1);
>   	igt_output_set_pipe(output2, pipe2);
>   
> +	igt_require(get_num_scalers(d, pipe1) >= 2);
> +	igt_require(get_num_scalers(d, pipe2) >= 2);

Here regardless of what pipe1 and pipe2 are is in both cases required 
there are 2 or more scalers on pipe-a, this is the same as on all 
following similar calls to get_num_scalers().

/Juha-Pekka

> +
>   	plane[0] = igt_output_get_plane(output1, 0);
>   	igt_require(plane[0]);
>   	plane[1] = igt_output_get_plane(output1, 0);
> @@ -963,6 +992,8 @@ static void invalid_parameter_tests(data_t *d)
>   		igt_output_set_pipe(output, pipe);
>   		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
> +		igt_require(get_num_scalers(d, pipe) >= 1);
> +
>   		igt_create_fb(d->drm_fd, 256, 256,
>   			      DRM_FORMAT_XRGB8888,
>   			      DRM_FORMAT_MOD_LINEAR,
> @@ -1138,6 +1169,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   						if (!pipe_output_combo_valid(&data.display, pipe, output))
>   							continue;
> +						if (get_num_scalers(&data, pipe) < 1)
> +							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> @@ -1161,6 +1194,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   						if (!pipe_output_combo_valid(&data.display, pipe, output))
>   							continue;
> +						if (get_num_scalers(&data, pipe) < 1)
> +							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> @@ -1184,6 +1219,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   						if (!pipe_output_combo_valid(&data.display, pipe, output))
>   							continue;
> +						if (get_num_scalers(&data, pipe) < 1)
> +							continue;
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> @@ -1206,6 +1243,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   					if (!pipe_output_combo_valid(&data.display, pipe, output))
>   						continue;
> +					if (get_num_scalers(&data, pipe) < 1)
> +							continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> @@ -1224,6 +1263,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   					if (!pipe_output_combo_valid(&data.display, pipe, output))
>   						continue;
> +					if (get_num_scalers(&data, pipe) < 1)
> +						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> @@ -1242,6 +1283,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   					if (!pipe_output_combo_valid(&data.display, pipe, output))
>   						continue;
> +					if (get_num_scalers(&data, pipe) < 1)
> +						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> @@ -1260,6 +1303,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   					if (!pipe_output_combo_valid(&data.display, pipe, output))
>   						continue;
> +					if (get_num_scalers(&data, pipe) < 2)
> +						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> @@ -1282,6 +1327,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   			igt_subtest_with_dynamic(intel_paramtests[index].testname) {
>   				igt_require_intel(data.drm_fd);
>   				for_each_pipe(&data.display, pipe) {
> +					if (get_num_scalers(&data, pipe) < 1)
> +						continue;
> +
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   						drmModeModeInfo *mode = NULL;
>   						/*
> @@ -1307,6 +1355,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   			for_each_pipe_with_valid_output(&data.display, pipe, output) {
>   				if (!pipe_output_combo_valid(&data.display, pipe, output))
>   					continue;
> +				if (get_num_scalers(&data, pipe) < 1)
> +					continue;
>   
>   				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
>   					       kmstest_pipe_name(pipe), igt_output_name(output))
