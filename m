Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FFA12AD49
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 09:26:23 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id pk21so24515282ejb.2
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 02:26:23 -0700 (PDT)
Message-ID: <7d392aa0-0af4-b9e6-97da-2de7e3546a6d@gmail.com>
Date: Tue, 28 Jun 2022 12:26:14 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20220627184140.7529-1-swati2.sharma@intel.com>
 <20220627184140.7529-5-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220627184140.7529-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [v4 PATCH i-g-t 4/4] tests/kms_flip_scaled_crc:
 Validate NN scaling filter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 27.6.2022 21.41, Swati Sharma wrote:
> SCALING_FILTER can be used either as plane scaler property
> or CRTC scaler property.
> The value of this property can be one of the following:
>      Default:
>               Driver's default scaling filter
>      Nearest Neighbor:
>               Nearest Neighbor scaling filter
> If NN is used for scaling, sharpness is preserved
> whereas if we use default scaling we can see blurriness
> at edges.
> 
> v2: -no need to set pipe scaler filter property
> v3: -addition of new lines to improve readability
>      -use of SPDX licence placeholder
>      -close(data.drm_fd)
> v4: -instead of creating new i-g-t, tweaked kms_flip_scaled_crc
>       to validate both default and nn scaling filters
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c                    | 16 +++++++++++
>   lib/igt_kms.h                    |  1 +
>   tests/i915/kms_flip_scaled_crc.c | 48 +++++++++++++++++++++++++++++---
>   3 files changed, 61 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 626a2567..fc3ad68b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -912,6 +912,22 @@ const char *kmstest_connector_status_str(int status)
>   	return find_type_name(connector_status_names, status);
>   }
>   
> +enum drm_scaling_filter {
> +	DRM_SCALING_FILTER_DEFAULT,
> +	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
> +};

This doesn't look like correct place to define drm_*. You are not 
getting this enum from drm_plane.h? Also these changes to lib/* imo 
could go in as separate patch.

> +
> +static const struct type_name drm_scaling_filter[] = {

Here also drm_scaling_filter name, it's already used for enum and in any 
case I'd rename it to just scaling_filter or something similar.

> +	{ DRM_SCALING_FILTER_DEFAULT, "Default" },
> +	{ DRM_SCALING_FILTER_NEAREST_NEIGHBOR, "Nearest Neighbor" },
> +	{}
> +};
> +
> +const char *kmstest_scaling_filter_str(int filter)
> +{
> +	return find_type_name(drm_scaling_filter, filter);
> +}
> +
>   static const struct type_name connector_type_names[] = {
>   	{ DRM_MODE_CONNECTOR_Unknown, "Unknown" },
>   	{ DRM_MODE_CONNECTOR_VGA, "VGA" },
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index bd05a13b..4b67708d 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -107,6 +107,7 @@ enum igt_custom_edid_type {
>   const char *kmstest_encoder_type_str(int type);
>   const char *kmstest_connector_status_str(int status);
>   const char *kmstest_connector_type_str(int type);
> +const char *kmstest_scaling_filter_str(int filter);
>   
>   void kmstest_dump_mode(drmModeModeInfo *mode);
>   #define MAX_HDISPLAY_PER_PIPE 5120
> diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
> index 88640da2..37a59c92 100644
> --- a/tests/i915/kms_flip_scaled_crc.c
> +++ b/tests/i915/kms_flip_scaled_crc.c
> @@ -26,6 +26,11 @@
>   
>   IGT_TEST_DESCRIPTION("Test flipping between scaled/nonscaled framebuffers");
>   
> +enum {
> +	DRM_SCALING_FILTER_DEFAULT,
> +	DRM_SCALING_FILTER_NEAREST_NEIGHBOR,
> +};

is this needed if you have drm_scaling_filter enum?

> +
>   typedef struct {
>   	int drm_fd;
>   	igt_display_t display;
> @@ -476,7 +481,7 @@ static void clear_lut(data_t *data, enum pipe pipe)
>   
>   static void test_flip_to_scaled(data_t *data, uint32_t index,
>   				enum pipe pipe, igt_output_t *output,
> -				drmModeModeInfoPtr modetoset)
> +				drmModeModeInfoPtr modetoset, int flags)
>   {
>   	igt_plane_t *primary;
>   	igt_crc_t small_crc, big_crc;
> @@ -518,6 +523,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
>   	igt_output_set_pipe(output, pipe);
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_skip_on_f(!igt_plane_has_prop(primary, IGT_PLANE_SCALING_FILTER), "Plane scaling filter prop not supported");
>   	igt_skip_on_f(!igt_plane_has_format_mod(primary, data->small_fb.drm_format, data->small_fb.modifier) ||
>   		      !igt_plane_has_format_mod(primary, data->big_fb.drm_format,
>   		      data->big_fb.modifier), "No requested format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
> @@ -532,6 +538,8 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
>   	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
>   					  INTEL_PIPE_CRC_SOURCE_AUTO);
>   
> +	igt_plane_set_prop_enum(primary, IGT_PLANE_SCALING_FILTER, kmstest_scaling_filter_str(flags));
> +
>   	igt_plane_set_position(primary, 0, 0);
>   	igt_plane_set_fb(primary, &data->small_fb);
>   	igt_plane_set_size(primary, data->attemptmodewidth,
> @@ -616,9 +624,39 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Tests with default plane scaling filter");
> +	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
> +		igt_describe(flip_scenario_test[index].describe);
> +		igt_subtest_with_dynamic_f("default-%s", flip_scenario_test[index].name) {
> +			free_fbs(&data);
> +			for_each_pipe(&data.display, pipe) {
> +				bool found = false;
> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +					modetoset = find_mode(&data, output);
> +					if (modetoset) {
> +						found = true;
> +						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
> +							test_flip_to_scaled(&data, index, pipe, output, modetoset,
> +									    DRM_SCALING_FILTER_DEFAULT);
> +						break;
> +					}
> +				}
> +				if (!found) {
> +					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +						igt_dynamic_f("pipe-%s-default-mode", kmstest_pipe_name(pipe))
> +							test_flip_to_scaled(&data, index, pipe, output, NULL,
> +									    DRM_SCALING_FILTER_DEFAULT);
> +					}
> +				}
> +				break;
> +			}
> +		}
> +	}
> +

Does this above block need to be duplicated? It look really similar as 
to loop there already is. I'm also bit so-so about having each test 
duplicated this way. I'd rather see each (dynamic sub-) test run both 
cases, nearest neighbor and default scaling filters.

> +	igt_describe("Tests with nearest neighbor plane scaling filter");
>   	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
>   		igt_describe(flip_scenario_test[index].describe);
> -		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
> +		igt_subtest_with_dynamic_f("nn-%s", flip_scenario_test[index].name) {
>   			free_fbs(&data);
>   			for_each_pipe(&data.display, pipe) {
>   				bool found = false;
> @@ -627,14 +665,16 @@ igt_main
>   					if (modetoset) {
>   						found = true;
>   						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
> -							test_flip_to_scaled(&data, index, pipe, output, modetoset);
> +							test_flip_to_scaled(&data, index, pipe, output, modetoset,
> +									    DRM_SCALING_FILTER_NEAREST_NEIGHBOR);
>   						break;
>   					}
>   				}
>   				if (!found) {
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   						igt_dynamic_f("pipe-%s-default-mode", kmstest_pipe_name(pipe))
> -							test_flip_to_scaled(&data, index, pipe, output, NULL);
> +							test_flip_to_scaled(&data, index, pipe, output, NULL,
> +									    DRM_SCALING_FILTER_NEAREST_NEIGHBOR);
>   					}
>   				}
>   				break;
