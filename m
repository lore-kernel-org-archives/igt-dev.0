Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18D089067
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jan 2023 06:00:58 +0000 (UTC)
Message-ID: <1f7632bb-2bb2-3124-9f8a-54c186adc5d6@intel.com>
Date: Mon, 30 Jan 2023 11:30:33 +0530
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Swati Sharma <swati2.sharma@intel.com>
References: <20230103064658.27655-1-swati2.sharma@intel.com>
 <20230103064658.27655-2-swati2.sharma@intel.com>
 <Y7Rt08svsVW1D75O@kamilkon-desk1>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <Y7Rt08svsVW1D75O@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] tests/kms_atomic: Cosmetic changes
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



On Tue-03-01-2023 11:32 pm, Kamil Konieczny wrote:
> Hi Swati,
> 
> On 2023-01-03 at 12:16:55 +0530, Swati Sharma wrote:
>> Removed unnecessary newlines and comments. Corrected multi-line
>> comments. Rephrased test description.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_atomic.c | 129 ++++++++++++++++++++++-----------------------
>>   1 file changed, 63 insertions(+), 66 deletions(-)
>>
>> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
>> index 2a3fb74be..cd1dd9c87 100644
>> --- a/tests/kms_atomic.c
>> +++ b/tests/kms_atomic.c
>> @@ -27,10 +27,6 @@
>>    *    Pekka Paalanen <pekka.paalanen@collabora.co.uk>
>>    */
>>   
>> -/*
>> - * Testcase: testing atomic modesetting API
>> - */
>> -
>>   #include <unistd.h>
>>   #include <stdlib.h>
>>   #include <stdio.h>
>> @@ -72,7 +68,6 @@ static inline int damage_rect_height(struct drm_mode_rect *r)
>>   	return r->y2 - r->y1;
>>   }
>>   
>> -
>>   static bool plane_filter(enum igt_atomic_plane_properties prop)
>>   {
>>   	if ((1 << prop) & IGT_PLANE_COORD_CHANGED_MASK)
>> @@ -119,8 +114,10 @@ static void plane_check_current_state(igt_plane_t *plane, const uint64_t *values
>>   
>>   	plane_get_current_state(plane, current_values);
>>   
>> -	/* Legacy cursor ioctls create their own, unknowable, internal
>> -	 * framebuffer which we can't reason about. */
>> +	/*
>> +	 * Legacy cursor ioctls create their own, unknowable, internal
>> +	 * framebuffer which we can't reason about.
>> +	 */
>>   	if (relax & PLANE_RELAX_FB)
>>   		current_values[IGT_PLANE_FB_ID] = values[IGT_PLANE_FB_ID];
>>   
>> @@ -145,9 +142,7 @@ static void plane_commit_atomic_err(igt_plane_t *plane,
>>   	uint64_t current_values[IGT_NUM_PLANE_PROPS];
>>   
>>   	plane_get_current_state(plane, current_values);
>> -
>>   	igt_assert_eq(-err, igt_display_try_commit2(plane->pipe->display, COMMIT_ATOMIC));
>> -
> 
> imho the old one is more readable.
> 
>>   	plane_check_current_state(plane, current_values, relax);
>>   }
>>   
>> @@ -186,9 +181,7 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
>>   	if (pipe_values[IGT_CRTC_MODE_ID]) {
>>   		mode_prop = drmModeGetPropertyBlob(pipe->display->drm_fd,
>>   						   pipe_values[IGT_CRTC_MODE_ID]);
>> -
>>   		igt_assert(mode_prop);
>> -
> 
> here it is ok (two asserts one after another).
> 
>>   		igt_assert_eq(mode_prop->length,
>>   		              sizeof(struct drm_mode_modeinfo));
>>   		mode = mode_prop->data;
>> @@ -218,15 +211,16 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
>>   
>>   	crtc_get_current_state(pipe, current_pipe_values);
>>   
>> -	/* Optionally relax the check for MODE_ID: using the legacy SetCrtc
>> +	/*
>> +	 * Optionally relax the check for MODE_ID: using the legacy SetCrtc
>>   	 * API can potentially change MODE_ID even if the mode itself remains
>> -	 * unchanged. */
>> +	 * unchanged.
>> +	 */
>>   	if (relax & CRTC_RELAX_MODE && mode && current_pipe_values[IGT_CRTC_MODE_ID] &&
>>   	    current_pipe_values[IGT_CRTC_MODE_ID] != pipe_values[IGT_CRTC_MODE_ID]) {
>>   		drmModePropertyBlobRes *cur_prop =
>>   			drmModeGetPropertyBlob(pipe->display->drm_fd,
>>   					       current_pipe_values[IGT_CRTC_MODE_ID]);
>> -
>>   		igt_assert(cur_prop);
>>   		igt_assert_eq(cur_prop->length, sizeof(struct drm_mode_modeinfo));
>>   
>> @@ -521,8 +515,10 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
>>   	igt_plane_set_fb(plane, &fb);
>>   	igt_plane_set_position(plane, w/2, h/2);
>>   
>> -	/* Enable the overlay plane using the atomic API, and double-check
>> -	 * state is what we think it should be. */
>> +	/*
>> +	 * Enable the overlay plane using the atomic API, and double-check
>> +	 * state is what we think it should be.
>> +	 */
>>   	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>>   
>>   	/* Disable the plane and check the state matches the old. */
>> @@ -530,14 +526,18 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
>>   	igt_plane_set_position(plane, 0, 0);
>>   	plane_commit(plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>>   
>> -	/* Re-enable the plane through the legacy plane API, and verify through
>> -	 * atomic. */
>> +	/*
>> +	 * Re-enable the plane through the legacy plane API, and verify through
>> +	 * atomic.
>> +	 */
>>   	igt_plane_set_fb(plane, &fb);
>>   	igt_plane_set_position(plane, w/2, h/2);
>>   	plane_commit(plane, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
>>   
>> -	/* Restore the plane to its original settings through the legacy plane
>> -	 * API, and verify through atomic. */
>> +	/*
>> +	 * Restore the plane to its original settings through the legacy plane
>> +	 * API, and verify through atomic
>> +	 */
>>   	igt_plane_set_fb(plane, NULL);
>>   	igt_plane_set_position(plane, 0, 0);
>>   	plane_commit(plane, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
>> @@ -554,8 +554,10 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
>>   				    fb->drm_format, I915_TILING_NONE,
>>   				    0.2, 0.2, 0.2, &fb2);
>>   
>> -	/* Flip the primary plane using the atomic API, and double-check
>> -	 * state is what we think it should be. */
>> +	/*
>> +	 * Flip the primary plane using the atomic API, and double-check
>> +	 * state is what we think it should be.
>> +	 */
>>   	igt_plane_set_fb(plane, &fb2);
>>   	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>>   
>> @@ -563,23 +565,30 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
>>   	igt_plane_set_fb(plane, fb);
>>   	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>>   
>> -	/* Set the plane through the legacy CRTC/primary-plane API, and
>> -	 * verify through atomic. */
>> +	/*
>> +	 * Set the plane through the legacy CRTC/primary-plane API, and
>> +	 * verify through atomic.
>> +	 */
>>   	igt_plane_set_fb(plane, &fb2);
>>   	crtc_commit(pipe, plane, COMMIT_LEGACY, CRTC_RELAX_MODE);
>>   
>> -	/* Restore the plane to its original settings through the legacy CRTC
>> -	 * API, and verify through atomic. */
>> +	/*
>> +	 * Restore the plane to its original settings through the legacy CRTC
>> +	 * API, and verify through atomic.
>> +	 */
>>   	igt_plane_set_fb(plane, fb);
>>   	crtc_commit(pipe, plane, COMMIT_LEGACY, CRTC_RELAX_MODE);
>>   
>> -	/* Set the plane through the universal setplane API, and
>> -	 * verify through atomic. */
>> +	/*
>> +	 * Set the plane through the universal setplane API, and
>> +	 * verify through atomic.
>> +	 */
>>   	igt_plane_set_fb(plane, &fb2);
>>   	plane_commit(plane, COMMIT_UNIVERSAL, ATOMIC_RELAX_NONE);
>>   }
>>   
>> -/* test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
>> +/*
>> + * Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
>>    * free-standing state objects and nothing else.
>>    */
>>   static void test_only(igt_pipe_t *pipe_obj,
>> @@ -659,8 +668,10 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
>>   			    DRM_FORMAT_MOD_LINEAR,
>>   			    0.0, 0.0, 0.0, &fb);
>>   
>> -	/* Flip the cursor plane using the atomic API, and double-check
>> -	 * state is what we think it should be. */
>> +	/*
>> +	 * Flip the cursor plane using the atomic API, and double-check
>> +	 * state is what we think it should be.
>> +	 */
>>   	igt_plane_set_fb(cursor, &fb);
>>   	igt_plane_set_position(cursor, x, y);
>>   	plane_commit(cursor, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>> @@ -670,8 +681,10 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
>>   	igt_plane_set_position(cursor, 0, 0);
>>   	plane_commit(cursor, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>>   
>> -	/* Re-enable the plane through the legacy cursor API, and verify
>> -	 * through atomic. */
>> +	/*
>> +	 * Re-enable the plane through the legacy cursor API, and verify
>> +	 * through atomic.
>> +	 */
>>   	igt_plane_set_fb(cursor, &fb);
>>   	igt_plane_set_position(cursor, x, y);
>>   	plane_commit(cursor, COMMIT_LEGACY, PLANE_RELAX_FB);
>> @@ -680,8 +693,10 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
>>   	igt_plane_set_position(cursor, x - 16, y - 16);
>>   	plane_commit(cursor, COMMIT_LEGACY, PLANE_RELAX_FB);
>>   
>> -	/* Restore the plane to its original settings through the legacy cursor
>> -	 * API, and verify through atomic. */
>> +	/*
>> +	 * Restore the plane to its original settings through the legacy cursor
>> +	 * API, and verify through atomic.
>> +	 */
>>   	igt_plane_set_fb(cursor, NULL);
>>   	igt_plane_set_position(cursor, 0, 0);
>>   	plane_commit(cursor, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
>> @@ -761,7 +776,7 @@ static void plane_invalid_params_fence(igt_pipe_t *pipe,
>>   	igt_plane_set_fence_fd(plane, pipe->display->drm_fd);
>>   	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, EINVAL);
>>   
>> -	/* Valid fence_fd but invalid CRTC */
>> +	/* valid fence_fd but invalid CRTC */
> 
> New one introduced small letter at begin of sentence, so imho
> old one was correct here.

Generally, comment should start with the capital letter & end with the 
period '.'

Example:

/* This is single line comment. */

/*
  * This is the example of
  * multiline comment.
  */

- Bhanu

> 
>>   	fence_fd = sw_sync_timeline_create_fence(timeline, 1);
>>   
>>   	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, ~0);
>> @@ -817,7 +832,6 @@ static void crtc_invalid_params(igt_pipe_t *pipe,
>>   	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode) + 1);
>>   	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EINVAL);
>>   
>> -
>>   	/* Restore the CRTC and check the state matches the old. */
>>   	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode));
>>   	crtc_commit(pipe, plane, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>> @@ -882,11 +896,11 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
>>   
>>   	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_ACTIVE, 1);
>>   
>> -	/* Configuration should be valid again */
>> +	/* configuration should be valid again */
> 
> Same here, keep old one.
> 
>>   	crtc_commit_atomic_flags_err(pipe, plane, DRM_MODE_ATOMIC_TEST_ONLY,
>>   				     ATOMIC_RELAX_NONE, 0);
>>   
>> -	/* Set invalid prop */
>> +	/* set invalid prop */
> 
> Same here, keep old one.
> 
>>   	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, fb->fb_id);
>>   
>>   	/* valid out fence but invalid prop on crtc */
>> @@ -923,8 +937,10 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
>>   	igt_assert(pipe->out_fence_fd != -1);
>>   }
>>   
>> -/* Abuse the atomic ioctl directly in order to test various invalid conditions,
>> - * which the libdrm wrapper won't allow us to create. */
>> +/*
>> + * Abuse the atomic ioctl directly in order to test various invalid conditions,
>> + * which the libdrm wrapper won't allow us to create.
>> + */
>>   static void atomic_invalid_params(igt_pipe_t *pipe,
>>   				  igt_plane_t *plane,
>>   				  igt_output_t *output,
>> @@ -1007,7 +1023,6 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
>>   	do_ioctl_err(display->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
>>   
>>   	/* Valid property, valid value. */
>> -
>>   	for (i = 0; i < ARRAY_SIZE(props_raw); i++) {
>>   		props_raw[i] = pipe->props[IGT_CRTC_MODE_ID];
>>   		values_raw[i] = pipe->values[IGT_CRTC_MODE_ID];
>> @@ -1263,7 +1278,8 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
>>   	igt_remove_fb(pipe->display->drm_fd, &fb_2);
>>   }
>>   
>> -static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *output, igt_plane_t *primary, struct igt_fb *fb)
>> +static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *output,
>> +			 igt_plane_t *primary, struct igt_fb *fb)
> 
> This change is not described in commit message.
> 
>>   {
>>   	igt_output_set_pipe(output, pipe);
>>   	igt_plane_set_fb(primary, fb);
>> @@ -1296,9 +1312,7 @@ igt_main
>>   
>>   	igt_fixture {
>>   		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> -
>>   		kmstest_set_vt_graphics_mode();
>> -
>>   		igt_display_require(&display, display.drm_fd);
>>   		igt_require(display.is_atomic);
>>   		igt_display_require_output(&display);
>> @@ -1308,9 +1322,7 @@ igt_main
>>   
>>   		pipe_obj = &display.pipes[pipe];
>>   		primary = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
>> -
>>   		mode = igt_output_get_mode(output);
>> -
>>   		igt_create_pattern_fb(display.drm_fd,
>>   				      mode->hdisplay, mode->vdisplay,
>>   				      plane_get_igt_format(primary),
>> @@ -1322,9 +1334,7 @@ igt_main
>>   	igt_subtest("plane-overlay-legacy") {
>>   		igt_plane_t *overlay =
>>   			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
>> -
> 
> Keep newline here.
> 
>>   		igt_require(overlay);
>> -
>>   		atomic_setup(&display, pipe, output, primary, &fb);
>>   		plane_overlay(pipe_obj, output, overlay);
>>   	}
>> @@ -1333,16 +1343,14 @@ igt_main
>>   		     "the legacy and atomic interfaces.");
>>   	igt_subtest("plane-primary-legacy") {
>>   		atomic_setup(&display, pipe, output, primary, &fb);
>> -
> 
> Keep newline here.
> 
>>   		plane_primary(pipe_obj, primary, &fb);
>>   	}
>>   
>> -	igt_describe("Verify that the overlay plane can cover the primary one (and "\
>> +	igt_describe("Test to verify that the overlay plane can cover the primary one (and "\
> 
> imho old one was better.
> 
>>   		     "vice versa) by changing their zpos property.");
>>   	igt_subtest("plane-primary-overlay-mutable-zpos") {
>>   		uint32_t format_primary = DRM_FORMAT_ARGB8888;
>>   		uint32_t format_overlay = DRM_FORMAT_ARGB1555;
>> -
> 
> Keep newline here.
> 
>>   		igt_plane_t *overlay =
>>   			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
>>   		igt_require(overlay);
>> @@ -1352,13 +1360,12 @@ igt_main
>>   
>>   		igt_require(igt_plane_has_format_mod(primary, format_primary, 0x0));
>>   		igt_require(igt_plane_has_format_mod(overlay, format_overlay, 0x0));
>> -
>>   		igt_output_set_pipe(output, pipe);
>>   		plane_primary_overlay_mutable_zpos(pipe_obj, output, primary, overlay,
>>   						   format_primary, format_overlay);
>>   	}
>>   
>> -	igt_describe("Verify the reported zpos property of planes by making sure "\
>> +	igt_describe("Test to verify the reported zpos property of planes by making sure "\
> 
> imho old one was better.
> 
>>   		     "only higher zpos planes cover the lower zpos ones.");
>>   	igt_subtest("plane-immutable-zpos") {
>>   		igt_output_set_pipe(output, pipe);
>> @@ -1369,7 +1376,6 @@ igt_main
>>   		     "the free-standing state objects and nothing else.");
>>   	igt_subtest("test-only") {
>>   		atomic_clear(&display, pipe, primary, output);
>> -
>>   		test_only(pipe_obj, primary, output);
>>   	}
>>   
>> @@ -1378,9 +1384,7 @@ igt_main
>>   	igt_subtest("plane-cursor-legacy") {
>>   		igt_plane_t *cursor =
>>   			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
>> -
> 
> Keep newline here.
> 
>>   		igt_require(cursor);
>> -
>>   		atomic_setup(&display, pipe, output, primary, &fb);
>>   		plane_cursor(pipe_obj, output, cursor);
>>   	}
>> @@ -1388,28 +1392,24 @@ igt_main
>>   	igt_describe("Test error handling when invalid plane parameters are passed");
>>   	igt_subtest("plane-invalid-params") {
>>   		atomic_setup(&display, pipe, output, primary, &fb);
>> -
>>   		plane_invalid_params(pipe_obj, output, primary, &fb);
>>   	}
>>   
>>   	igt_describe("Test error handling when invalid plane fence parameters are passed");
>>   	igt_subtest("plane-invalid-params-fence") {
>>   		atomic_setup(&display, pipe, output, primary, &fb);
>> -
>>   		plane_invalid_params_fence(pipe_obj, output, primary);
>>   	}
>>   
>>   	igt_describe("Test error handling when invalid crtc parameters are passed");
>>   	igt_subtest("crtc-invalid-params") {
>>   		atomic_setup(&display, pipe, output, primary, &fb);
>> -
>>   		crtc_invalid_params(pipe_obj, output, primary, &fb);
>>   	}
>>   
>>   	igt_describe("Test error handling when invalid crtc fence parameters are passed");
>>   	igt_subtest("crtc-invalid-params-fence") {
>>   		atomic_setup(&display, pipe, output, primary, &fb);
>> -
>>   		crtc_invalid_params_fence(pipe_obj, output, primary, &fb);
>>   	}
>>   
>> @@ -1418,16 +1418,13 @@ igt_main
>>   		     "allow us to create.");
>>   	igt_subtest("atomic-invalid-params") {
>>   		atomic_setup(&display, pipe, output, primary, &fb);
>> -
>>   		atomic_invalid_params(pipe_obj, primary, output, &fb);
>>   	}
>>   
>> -	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
>> -	igt_subtest("atomic_plane_damage") {
>> +	igt_describe("Test to use FB_DAMAGE_CLIPS plane property");
> 
> imho old description is also good, all igt code is "testing something"
> so maybe shorten this (?) like:
> 	igt_describe("Simple checks of FB_DAMAGE_CLIPS plane property");
> Maybe you want to keep it consistent with other descriptions ? Then it
> may go with your change here like:
> 	igt_describe("Test FB_DAMAGE_CLIPS plane property");
> or
> 	igt_describe("Use FB_DAMAGE_CLIPS plane property");
> 
>> +	igt_subtest("atomic-plane-damage") {
> -------------------- ^
> This changes test name, it is not cosmetic one.
> 
> Regards,
> Kamil
> 
>>   		igt_require(igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS));
>> -
>>   		atomic_setup(&display, pipe, output, primary, &fb);
>> -
>>   		atomic_plane_damage(pipe_obj, primary, &fb);
>>   	}
>>   
>> -- 
>> 2.25.1
>>
