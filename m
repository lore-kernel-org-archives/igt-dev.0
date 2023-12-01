Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A75010E863
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 12:57:44 +0000 (UTC)
Message-ID: <6bb7f33c-1126-4aef-9037-93913e2a4ad1@intel.com>
Date: Fri, 1 Dec 2023 18:27:36 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
References: <20231201124953.2172215-1-jeevan.b@intel.com>
 <20231201124953.2172215-5-jeevan.b@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231201124953.2172215-5-jeevan.b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/intel/kms_psr2_sf: Add FBC
 support to PSR2 tests
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 01-Dec-23 6:19 PM, Jeevan B wrote:
> For LunarLake (intel_display_ver 20), FBC can be enabled along with PSR2,
> thereby adding FBC checks to validate this scenario.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   tests/intel/kms_psr2_sf.c | 623 +++++++++++++++++++++-----------------
>   1 file changed, 351 insertions(+), 272 deletions(-)
> 
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index 27faa93d9..779dd8c58 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -28,11 +28,11 @@
>    * Description: Tests to varify PSR2 selective fetch by sending multiple damaged
>    *              areas
>    * Driver requirement: i915, xe
> - * Functionality: plane, psr2, selective_fetch
>    * Mega feature: PSR
>    * Test category: functionality test
>    */
>   
> +#include "i915/intel_fbc.h"
>   #include "igt.h"
>   #include "igt_sysfs.h"
>   #include "igt_psr.h"
> @@ -46,6 +46,12 @@
>    * SUBTEST: %s-plane-move-continuous-%s
>    * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
>    *              visible area (no update)
> + * Functionality: plane, psr2, selective_fetch
> + *
> + * SUBTEST: fbc-%s-plane-move-continuous-%s
> + * Description: Test that fbc with selective fetch works on moving %arg[1] plane %arg[2]
> + *              visible area (no update)
> + * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * arg[1]:
>    *
> @@ -62,25 +68,61 @@
>   /**
>    * SUBTEST: cursor-plane-update-sf
>    * Description: Test that selective fetch works on cursor plane
> + * Functionality: plane, psr2, selective_fetch
> + *
> + * SUBTEST: fbc-cursor-plane-update-continuous-sf
> + * Description: Test that fbc with selective fetch works on cursor plane
> + * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: overlay-plane-update-continuous-sf
>    * Description: Test that selective fetch works on overlay plane
> + * Functionality: plane, psr2, selective_fetch
> + *
> + * SUBTEST: fbc-overlay-plane-update-continuous-sf-dmg-area
> + * Description: Test that fbc with selective fetch works on overlay plane
> + * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: overlay-plane-update-sf-dmg-area
>    * Description: Test that selective fetch works on overlay plane
> + * Functionality: plane, psr2, selective_fetch
> + *
> + * SUBTEST: fbc-overlay-plane-update-continuous-sf
> + * Description: Test that fbc with selective fetch works on overlay plane
> + * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: overlay-primary-update-sf-dmg-area
>    * Description: Test that selective fetch works on primary plane with blended
>    *              overlay plane
> + * Functionality: plane, psr2, selective_fetch
> + *
> + * SUBTEST: fbc-overlay-primary-update-sf-dmg-area
> + * Description: Test that fbc with selective fetch works on primary plane with blended
> + *              overlay plane
> + * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: plane-move-sf-dmg-area
>    * Description: Test that selective fetch works on moving overlay plane
> + * Functionality: plane, psr2, selective_fetch
> + *
> + * SUBTEST: fbc-plane-move-sf-dmg-area
> + * Description: Test that fbc with selective fetch works on moving overlay plane
> + * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: primary-plane-update-sf-dmg-area
>    * Description: Test that selective fetch works on primary plane
> + * Functionality: plane, psr2, selective_fetch
> + *
> + * SUBTEST: fbc-primary-plane-update-continuous-sf-dmg-area
> + * Description: Test that fbc with selective fetch works on primary plane
> + * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: primary-plane-update-sf-dmg-area-big-fb
>    * Description: Test that selective fetch works on primary plane with big fb
> + * Functionality: plane, psr2, selective_fetch
> + *
> + * SUBTEST: fbc-primary-plane-update-continuous-sf-dmg-area-big-fb
> + * Description: Test that fbc with selective fetch works on primary plane with big fb
> + * Functionality: plane, psr2, selective_fetch, fbc
>    */
>   
>   IGT_TEST_DESCRIPTION("Tests to varify PSR2 selective fetch by sending multiple"
> @@ -131,10 +173,12 @@ typedef struct {
>   	struct drm_mode_rect plane_move_clip;
>   	struct drm_mode_rect cursor_clip;
>   	enum operations op;
> +	enum fbc_mode op_fbc_mode;
>   	enum plane_move_postion pos;
>   	int test_plane_id;
>   	igt_plane_t *test_plane;
>   	bool big_fb_test;
> +	bool fbc_flag;
>   	cairo_t *cr;
>   	uint32_t screen_changes;
>   	int cur_x, cur_y;
> @@ -840,6 +884,11 @@ static void run(data_t *data)
>   
>   	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
>   
> +	if (data->fbc_flag == true && data->op_fbc_mode == FBC_ENABLED)
> +		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
> +							  data->pipe),
> +							  "FBC still disabled");
> +
>   	data->screen_changes = 0;
>   
>   	switch (data->op) {
> @@ -942,10 +991,15 @@ igt_main
>   {
>   	data_t data = {};
>   	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
> -	int i, j, k;
> +	int i, j, k, y;
>   	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
>   	int n_pipes = 0;
>   	int coexist_features[IGT_MAX_PIPES * IGT_MAX_PIPES];
> +	const char *append_fbc_subtest[2] = {
> +		"",
> +		"fbc-"
> +	};
> +	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
>   
>   	igt_fixture {
>   		drmModeResPtr res;
> @@ -961,6 +1015,11 @@ igt_main
>   
>   		display_init(&data);
>   
> +		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd) == 20)) &&
> +		    (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe))) {
> +			data.fbc_flag = true;
> +		}
> +
>   		/* Test if PSR2 can be enabled */
>   		igt_require_f(psr_enable(data.drm_fd,
>   					 data.debugfs_fd, PSR_MODE_2_SEL_FETCH),
> @@ -995,54 +1054,116 @@ igt_main
>   		}
>   	}
>   
> -	/* Verify primary plane selective fetch */
> -	igt_describe("Test that selective fetch works on primary plane");
> -	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
> +	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
> +		data.op_fbc_mode = fbc_status[y];
> +		/* Verify primary plane selective fetch */
> +		igt_describe("Test that selective fetch works on primary plane");
> +		igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> +					continue;
> +
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> +						data.coexist_feature = j;
> +						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> +							data.damage_area_count = k;
> +							prepare(&data);
> +							run(&data);
> +							cleanup(&data);
> +						}
> +					}
> +				}
> +			}
> +		}
>   
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +		/* Verify primary plane selective fetch with big fb */
> +		data.big_fb_test = 1;
> +		igt_describe("Test that selective fetch works on primary plane with big fb");
> +		igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area-big-fb", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>   					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -					data.pipe = pipes[i];
> -					data.output = outputs[i];
> -					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> -					data.coexist_feature = j;
> -					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> -						data.damage_area_count = k;
> -						prepare(&data);
> -						run(&data);
> -						cleanup(&data);
> +
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> +						data.coexist_feature = j;
> +						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> +							data.damage_area_count = k;
> +							prepare(&data);
> +							run(&data);
> +							cleanup(&data);
> +						}
>   					}
>   				}
>   			}
>   		}
> -	}
>   
> -	/* Verify primary plane selective fetch with big fb */
> -	data.big_fb_test = 1;
> -	igt_describe("Test that selective fetch works on primary plane with big fb");
> -	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area-big-fb", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
> +		data.big_fb_test = 0;
> +		/* Verify overlay plane selective fetch */
> +		igt_describe("Test that selective fetch works on overlay plane");
> +		igt_subtest_with_dynamic_f("%soverlay-%s-sf-dmg-area", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> +					continue;
>   
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +						data.coexist_feature = j;
> +						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> +							data.damage_area_count = k;
> +							prepare(&data);
> +							run(&data);
> +							cleanup(&data);
> +						}
> +					}
> +				}
> +			}
> +		}
> +
> +		data.damage_area_count = 1;
> +		/* Verify cursor plane selective fetch */
> +		igt_describe("Test that selective fetch works on cursor plane");
> +		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>   					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -					data.pipe = pipes[i];
> -					data.output = outputs[i];
> -					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> -					data.coexist_feature = j;
> -					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> -						data.damage_area_count = k;
> +
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +						data.coexist_feature = j;
>   						prepare(&data);
>   						run(&data);
>   						cleanup(&data);
> @@ -1050,28 +1171,25 @@ igt_main
>   				}
>   			}
>   		}
> -	}
>   
> -	data.big_fb_test = 0;
> -	/* Verify overlay plane selective fetch */
> -	igt_describe("Test that selective fetch works on overlay plane");
> -	igt_subtest_with_dynamic_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
> -
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +		data.op = PLANE_MOVE_CONTINUOUS;
> +		igt_describe("Test that selective fetch works on moving cursor plane (no update)");
> +		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>   					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -					data.pipe = pipes[i];
> -					data.output = outputs[i];
> -					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -					data.coexist_feature = j;
> -					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> -						data.damage_area_count = k;
> +
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +						data.coexist_feature = j;
>   						prepare(&data);
>   						run(&data);
>   						cleanup(&data);
> @@ -1079,130 +1197,137 @@ igt_main
>   				}
>   			}
>   		}
> -	}
> -
> -	data.damage_area_count = 1;
> -	/* Verify cursor plane selective fetch */
> -	igt_describe("Test that selective fetch works on cursor plane");
> -	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
>   
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +		data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
> +		igt_describe("Test that selective fetch works on moving cursor plane exceeding "
> +			     "partially visible area (no update)");
> +		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>   					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -					data.pipe = pipes[i];
> -					data.output = outputs[i];
> -					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> -					data.coexist_feature = j;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> +
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +						data.coexist_feature = j;
> +						prepare(&data);
> +						run(&data);
> +						cleanup(&data);
> +					}
>   				}
>   			}
>   		}
> -	}
>   
> -	data.op = PLANE_MOVE_CONTINUOUS;
> -	igt_describe("Test that selective fetch works on moving cursor plane (no update)");
> -	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
> -
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +		data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
> +		igt_describe("Test that selective fetch works on moving cursor plane exceeding "
> +			     "fully visible area (no update)");
> +		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>   					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -					data.pipe = pipes[i];
> -					data.output = outputs[i];
> -					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> -					data.coexist_feature = j;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> +
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +						data.coexist_feature = j;
> +						prepare(&data);
> +						run(&data);
> +						cleanup(&data);
> +					}
>   				}
>   			}
>   		}
> -	}
>   
> -	data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
> -	igt_describe("Test that selective fetch works on moving cursor plane exceeding partially visible area (no update)");
> -	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
> -
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +		/* Only for overlay plane */
> +		data.op = PLANE_MOVE;
> +		/* Verify overlay plane move selective fetch */
> +		igt_describe("Test that selective fetch works on moving overlay plane");
> +		igt_subtest_with_dynamic_f("%s%s-sf-dmg-area", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>   					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -					data.pipe = pipes[i];
> -					data.output = outputs[i];
> -					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> -					data.coexist_feature = j;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> +
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +						data.coexist_feature = j;
> +						for (k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT ; k++) {
> +							data.pos = k;
> +							prepare(&data);
> +							run(&data);
> +							cleanup(&data);
> +						}
> +					}
>   				}
>   			}
>   		}
> -	}
> -
> -	data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
> -	igt_describe("Test that selective fetch works on moving cursor plane exceeding fully visible area (no update)");
> -	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
>   
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +		data.op = PLANE_MOVE_CONTINUOUS;
> +		igt_describe("Test that selective fetch works on moving overlay plane (no update)");
> +		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>   					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> +
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
> -					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
>   					data.coexist_feature = j;
>   					prepare(&data);
>   					run(&data);
>   					cleanup(&data);
> +					}
>   				}
>   			}
>   		}
> -	}
>   
> -	/* Only for overlay plane */
> -	data.op = PLANE_MOVE;
> -	/* Verify overlay plane move selective fetch */
> -	igt_describe("Test that selective fetch works on moving overlay plane");
> -	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
> -
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +		data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
> +		igt_describe("Test that selective fetch works on moving overlay plane partially "
> +			     "exceeding visible area (no update)");
> +		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>   					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -					data.pipe = pipes[i];
> -					data.output = outputs[i];
> -					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -					data.coexist_feature = j;
> -					for (k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT ; k++) {
> -						data.pos = k;
> +
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +						data.coexist_feature = j;
>   						prepare(&data);
>   						run(&data);
>   						cleanup(&data);
> @@ -1210,103 +1335,88 @@ igt_main
>   				}
>   			}
>   		}
> -	}
> -
> -	data.op = PLANE_MOVE_CONTINUOUS;
> -	igt_describe("Test that selective fetch works on moving overlay plane (no update)");
> -	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
>   
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +		data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
> +		igt_describe("Test that selective fetch works on moving overlay plane fully "
> +			     "exceeding visible area (no update)");
> +		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>   					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -				data.coexist_feature = j;
> -				prepare(&data);
> -				run(&data);
> -				cleanup(&data);
> -				}
> -			}
> -		}
> -	}
> -
> -	data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
> -	igt_describe("Test that selective fetch works on moving overlay plane partially exceeding visible area (no update)");
> -	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
>   
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> -					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -					data.pipe = pipes[i];
> -					data.output = outputs[i];
> -					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -					data.coexist_feature = j;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +						data.coexist_feature = j;
> +						prepare(&data);
> +						run(&data);
> +						cleanup(&data);
> +					}
>   				}
>   			}
>   		}
> -	}
>   
> -	data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
> -	igt_describe("Test that selective fetch works on moving overlay plane fully exceeding visible area (no update)");
> -	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
> -
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +		/* Verify primary plane selective fetch with overplay plane blended */
> +		data.op = OVERLAY_PRIM_UPDATE;
> +		igt_describe("Test that selective fetch works on primary plane "
> +			     "with blended overlay plane");
> +		igt_subtest_with_dynamic_f("%s%s-sf-dmg-area", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>   					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -					data.pipe = pipes[i];
> -					data.output = outputs[i];
> -					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -					data.coexist_feature = j;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> +
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> +							data.damage_area_count = k;
> +							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> +							data.coexist_feature = j;
> +							prepare(&data);
> +							run(&data);
> +							cleanup(&data);
> +						}
> +					}
>   				}
>   			}
>   		}
> -	}
>   
> -	/* Verify primary plane selective fetch with overplay plane blended */
> -	data.op = OVERLAY_PRIM_UPDATE;
> -	igt_describe("Test that selective fetch works on primary plane "
> -		     "with blended overlay plane");
> -	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
> -
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +		/*
> +		 * Verify overlay plane selective fetch using NV12 primary
> +		 * plane and continuous updates.
> +		 */
> +		data.op = PLANE_UPDATE_CONTINUOUS;
> +		data.primary_format = DRM_FORMAT_NV12;
> +		igt_describe("Test that selective fetch works on overlay plane");
> +		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
> +					   op_str(data.op)) {
> +			for (i = 0; i < n_pipes; i++) {
> +				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
>   					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -					data.pipe = pipes[i];
> -					data.output = outputs[i];
> -					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> -						data.damage_area_count = k;
> -						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> +
> +				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +						continue;
> +					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +						      igt_output_name(outputs[i]),
> +						      coexist_feature_str(j)) {
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						data.damage_area_count = 1;
> +						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
>   						data.coexist_feature = j;
>   						prepare(&data);
>   						run(&data);
> @@ -1317,37 +1427,6 @@ igt_main
>   		}
>   	}
>   
> -	/*
> -	 * Verify overlay plane selective fetch using NV12 primary
> -	 * plane and continuous updates.
> -	 */
> -	data.op = PLANE_UPDATE_CONTINUOUS;
> -	data.primary_format = DRM_FORMAT_NV12;
> -	igt_describe("Test that selective fetch works on overlay plane");
> -	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
> -		for (i = 0; i < n_pipes; i++) {
> -			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -				continue;
> -
> -			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> -					continue;
> -				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -					      igt_output_name(outputs[i]),
> -					      coexist_feature_str(j)) {
> -					data.pipe = pipes[i];
> -					data.output = outputs[i];
> -					data.damage_area_count = 1;
> -					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -					data.coexist_feature = j;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> -				}
> -			}
> -		}
> -	}
> -
>   	igt_fixture {
>   		close(data.debugfs_fd);
>   		display_fini(&data);
