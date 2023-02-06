Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3D110E187
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Feb 2023 18:14:39 +0000 (UTC)
Message-ID: <054a5aa6-522f-e625-badb-1014ea824050@intel.com>
Date: Mon, 6 Feb 2023 23:44:30 +0530
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230203075806.1589164-1-jouni.hogander@intel.com>
 <20230203075806.1589164-3-jouni.hogander@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20230203075806.1589164-3-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] kms_psr2_sf: Add dynamic
 subtests which use DSC feature
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

Patch LGTM.
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 03-Feb-23 1:28 PM, Jouni Högander wrote:
> Add mechanism to add coexisting features with selective fetch
> and add dynamic subtests for DSC as coexisting feature.
> 
> v2:
>   - check dsc is enabled (Swati)
>   - remove unused variables
> 
> Cc: Jeevan B <jeevan.b@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   tests/i915/kms_psr2_sf.c | 333 ++++++++++++++++++++++++++-------------
>   tests/meson.build        |   9 +-
>   2 files changed, 234 insertions(+), 108 deletions(-)
> 
> diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
> index 078884ac..2d761d31 100644
> --- a/tests/i915/kms_psr2_sf.c
> +++ b/tests/i915/kms_psr2_sf.c
> @@ -25,6 +25,7 @@
>   #include "igt.h"
>   #include "igt_sysfs.h"
>   #include "igt_psr.h"
> +#include "kms_dsc_helper.h"
>   #include <errno.h>
>   #include <stdbool.h>
>   #include <stdio.h>
> @@ -86,6 +87,11 @@ typedef struct {
>   	uint32_t screen_changes;
>   	int cur_x, cur_y;
>   	enum pipe pipe;
> +	enum {
> +		FEATURE_NONE  = 0,
> +		FEATURE_DSC   = 1,
> +		FEATURE_COUNT = 2,
> +	} coexist_feature;
>   } data_t;
>   
>   static const char *op_str(enum operations op)
> @@ -104,6 +110,18 @@ static const char *op_str(enum operations op)
>   	return name[op];
>   }
>   
> +static const char *coexist_feature_str(int coexist_feature)
> +{
> +	switch (coexist_feature) {
> +	case FEATURE_NONE:
> +		return "";
> +	case FEATURE_DSC:
> +		return "-dsc";
> +	default:
> +		igt_assert(false);
> +	}
> +}
> +
>   static void display_init(data_t *data)
>   {
>   	igt_display_require(&data->display, data->drm_fd);
> @@ -224,9 +242,17 @@ static void prepare(data_t *data)
>   	igt_plane_t *primary, *sprite = NULL, *cursor = NULL;
>   	int fb_w, fb_h, x, y, view_w, view_h;
>   
> -	igt_output_set_pipe(output, data->pipe);
>   	data->mode = igt_output_get_mode(output);
>   
> +	if (data->coexist_feature & FEATURE_DSC) {
> +		save_force_dsc_en(data->drm_fd, output);
> +		force_dsc_enable(data->drm_fd, output);
> +		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	}
> +
> +	igt_output_set_pipe(output, data->pipe);
> +
>   	if (data->big_fb_test) {
>   		fb_w = data->big_fb_width;
>   		fb_h = data->big_fb_height;
> @@ -357,6 +383,10 @@ static void prepare(data_t *data)
>   	igt_plane_set_size(primary, view_w, view_h);
>   	igt_plane_set_position(primary, 0, 0);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	if (data->coexist_feature & FEATURE_DSC)
> +		igt_require_f(igt_is_dsc_enabled(data->drm_fd, output->name),
> +			      "DSC is not enabled\n");
>   }
>   
>   static inline void manual(const char *expected)
> @@ -816,6 +846,11 @@ static void cleanup(data_t *data)
>   		igt_plane_set_fb(sprite, NULL);
>   	}
>   
> +	if (data->coexist_feature & FEATURE_DSC) {
> +		restore_force_dsc_en();
> +		igt_output_set_pipe(output, PIPE_NONE);
> +	}
> +
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   	igt_remove_fb(data->drm_fd, &data->fb_primary);
> @@ -839,9 +874,10 @@ igt_main
>   {
>   	data_t data = {};
>   	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
> -	int i, j;
> +	int i, j, k;
>   	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
>   	int n_pipes = 0;
> +	int coexist_features[IGT_MAX_PIPES * IGT_MAX_PIPES];
>   
>   	igt_fixture {
>   		drmModeResPtr res;
> @@ -877,9 +913,14 @@ igt_main
>   			      "PSR2 selective fetch not enabled\n");
>   
>   		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
> +			coexist_features[n_pipes] = 0;
>   			if (check_psr2_support(&data)) {
>   				pipes[n_pipes] = data.pipe;
>   				outputs[n_pipes] = data.output;
> +
> +				if (check_dsc_on_connector(data.drm_fd, data.output))
> +					coexist_features[n_pipes] |= FEATURE_DSC;
> +
>   				n_pipes++;
>   			}
>   		}
> @@ -889,16 +930,22 @@ igt_main
>   	igt_describe("Test that selective fetch works on primary plane");
>   	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
> -					data.damage_area_count = j;
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
>   					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> +					data.coexist_feature = j;
> +					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> +						data.damage_area_count = k;
> +						prepare(&data);
> +						run(&data);
> +						cleanup(&data);
> +					}
>   				}
>   			}
>   		}
> @@ -909,16 +956,22 @@ igt_main
>   	igt_describe("Test that selective fetch works on primary plane with big fb");
>   	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area-big-fb", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
> -					data.damage_area_count = j;
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
>   					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> +					data.coexist_feature = j;
> +					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> +						data.damage_area_count = k;
> +						prepare(&data);
> +						run(&data);
> +						cleanup(&data);
> +					}
>   				}
>   			}
>   		}
> @@ -929,16 +982,22 @@ igt_main
>   	igt_describe("Test that selective fetch works on overlay plane");
>   	igt_subtest_with_dynamic_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
> -					data.damage_area_count = j;
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
>   					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> +					data.coexist_feature = j;
> +					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> +						data.damage_area_count = k;
> +						prepare(&data);
> +						run(&data);
> +						cleanup(&data);
> +					}
>   				}
>   			}
>   		}
> @@ -949,14 +1008,20 @@ igt_main
>   	igt_describe("Test that selective fetch works on cursor plane");
>   	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> -				prepare(&data);
> -				run(&data);
> -				cleanup(&data);
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +					data.coexist_feature = j;
> +					prepare(&data);
> +					run(&data);
> +					cleanup(&data);
> +				}
>   			}
>   		}
>   	}
> @@ -965,14 +1030,20 @@ igt_main
>   	igt_describe("Test that selective fetch works on moving cursor plane (no update)");
>   	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> -				prepare(&data);
> -				run(&data);
> -				cleanup(&data);
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +					data.coexist_feature = j;
> +					prepare(&data);
> +					run(&data);
> +					cleanup(&data);
> +				}
>   			}
>   		}
>   	}
> @@ -981,14 +1052,20 @@ igt_main
>   	igt_describe("Test that selective fetch works on moving cursor plane exceeding partially visible area (no update)");
>   	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> -				prepare(&data);
> -				run(&data);
> -				cleanup(&data);
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +					data.coexist_feature = j;
> +					prepare(&data);
> +					run(&data);
> +					cleanup(&data);
> +				}
>   			}
>   		}
>   	}
> @@ -997,14 +1074,20 @@ igt_main
>   	igt_describe("Test that selective fetch works on moving cursor plane exceeding fully visible area (no update)");
>   	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> -				prepare(&data);
> -				run(&data);
> -				cleanup(&data);
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +					data.coexist_feature = j;
> +					prepare(&data);
> +					run(&data);
> +					cleanup(&data);
> +				}
>   			}
>   		}
>   	}
> @@ -1015,16 +1098,22 @@ igt_main
>   	igt_describe("Test that selective fetch works on moving overlay plane");
>   	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				for (j = POS_TOP_LEFT; j <= POS_BOTTOM_RIGHT ; j++) {
> -					data.pos = j;
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
>   					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> +					data.coexist_feature = j;
> +					for (k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT ; k++) {
> +						data.pos = k;
> +						prepare(&data);
> +						run(&data);
> +						cleanup(&data);
> +					}
>   				}
>   			}
>   		}
> @@ -1034,14 +1123,20 @@ igt_main
>   	igt_describe("Test that selective fetch works on moving overlay plane (no update)");
>   	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
>   				data.pipe = pipes[i];
>   				data.output = outputs[i];
>   				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +				data.coexist_feature = j;
>   				prepare(&data);
>   				run(&data);
>   				cleanup(&data);
> +				}
>   			}
>   		}
>   	}
> @@ -1050,14 +1145,20 @@ igt_main
>   	igt_describe("Test that selective fetch works on moving overlay plane partially exceeding visible area (no update)");
>   	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -				prepare(&data);
> -				run(&data);
> -				cleanup(&data);
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +					data.coexist_feature = j;
> +					prepare(&data);
> +					run(&data);
> +					cleanup(&data);
> +				}
>   			}
>   		}
>   	}
> @@ -1066,14 +1167,20 @@ igt_main
>   	igt_describe("Test that selective fetch works on moving overlay plane fully exceeding visible area (no update)");
>   	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -				prepare(&data);
> -				run(&data);
> -				cleanup(&data);
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +					data.coexist_feature = j;
> +					prepare(&data);
> +					run(&data);
> +					cleanup(&data);
> +				}
>   			}
>   		}
>   	}
> @@ -1084,16 +1191,22 @@ igt_main
>   		     "with blended overlay plane");
>   	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -					igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
> -					data.damage_area_count = j;
> -					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> +						data.damage_area_count = k;
> +						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> +						data.coexist_feature = j;
> +						prepare(&data);
> +						run(&data);
> +						cleanup(&data);
> +					}
>   				}
>   			}
>   		}
> @@ -1108,15 +1221,21 @@ igt_main
>   	igt_describe("Test that selective fetch works on overlay plane");
>   	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
>   		for (i = 0; i < n_pipes; i++) {
> -			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
> -				      igt_output_name(outputs[i])) {
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				data.damage_area_count = 1;
> -				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -				prepare(&data);
> -				run(&data);
> -				cleanup(&data);
> +			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +				if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					continue;
> +				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> +					      igt_output_name(outputs[i]),
> +					      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					data.damage_area_count = 1;
> +					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +					data.coexist_feature = j;
> +					prepare(&data);
> +					run(&data);
> +					cleanup(&data);
> +				}
>   			}
>   		}
>   	}
> diff --git a/tests/meson.build b/tests/meson.build
> index d93a07c9..6fb1bb86 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -233,7 +233,6 @@ i915_progs = [
>   	'kms_pipe_b_c_ivb',
>   	'kms_psr',
>   	'kms_psr2_su',
> -	'kms_psr2_sf',
>   	'kms_psr_stress_test',
>   	'kms_pwrite_crc',
>   	'sysfs_defaults',
> @@ -436,6 +435,14 @@ test_executables += executable('kms_dsc',
>   	   install : true)
>   test_list += 'kms_dsc'
>   
> +test_executables += executable('kms_psr2_sf',
> +	   [ join_paths('i915', 'kms_psr2_sf.c'), join_paths ('i915', 'kms_dsc_helper.c')],
> +	   dependencies : test_deps,
> +	   install_dir : libexecdir,
> +	   install_rpath : libexecdir_rpathdir,
> +	   install : true)
> +test_list += 'kms_psr2_sf'
> +
>   if chamelium.found()
>          test_executables += executable('kms_chamelium_color',
>                                [ 'chamelium/kms_chamelium_color.c', 'kms_color_helper.c' ],

-- 
~Swati Sharma
