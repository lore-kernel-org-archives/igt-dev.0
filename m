Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10AE6E093
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 07:59:06 +0000 (UTC)
References: <20200226134508.3374-1-swati2.sharma@intel.com>
 <bbc61826-330e-28ab-b1a0-938547dc3f01@linux.intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <9d91ab7d-db5b-09bd-8579-8a44613804c1@intel.com>
Date: Thu, 12 Mar 2020 13:29:03 +0530
MIME-Version: 1.0
In-Reply-To: <bbc61826-330e-28ab-b1a0-938547dc3f01@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic: add test to validate
 immutable zpos
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Martin Peres <martin.peres@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 27-Feb-20 12:33 PM, Martin Peres wrote:
> On 2020-02-26 15:45, Swati Sharma wrote:
>> i915 implements immutable zpos property whereas the existing test
>> case is written to validate mutable zpos.
>>
>> Added new test case to validate immutable zpos and skip existing
>> test case if i915 driver is not detected.
>>
>> Issue: https://gitlab.freedesktop.org/drm/intel/issues/404
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_atomic.c | 120 ++++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 112 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
>> index 8462d128..7a5edc8e 100644
>> --- a/tests/kms_atomic.c
>> +++ b/tests/kms_atomic.c
>> @@ -121,7 +121,7 @@ static void plane_check_current_state(igt_plane_t *plane, const uint64_t *values
>>   }
>>   
>>   static void plane_commit(igt_plane_t *plane, enum igt_commit_style s,
>> -                                enum kms_atomic_check_relax relax)
>> +                         enum kms_atomic_check_relax relax)
>>   {
>>   	igt_display_commit2(plane->pipe->display, s);
>>   	plane_check_current_state(plane, plane->values, relax);
>> @@ -277,9 +277,9 @@ static uint32_t plane_get_igt_format(igt_plane_t *plane)
>>   }
>>   
>>   static void
>> -plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
>> -			   igt_plane_t *primary, igt_plane_t *overlay,
>> -			   uint32_t format_primary, uint32_t format_overlay)
>> +plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
>> +			           igt_plane_t *primary, igt_plane_t *overlay,
>> +			           uint32_t format_primary, uint32_t format_overlay)
>>   {
>>   	struct igt_fb fb_primary, fb_overlay;
>>   	drmModeModeInfo *mode = igt_output_get_mode(output);
>> @@ -358,6 +358,97 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
>>   	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 1);
>>   }
>>   
>> +static void
>> +plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
>> +		     igt_output_t *output)
>> +{
>> +	cairo_t *cr;
>> +	int n_planes;
>> +	uint32_t format;
>> +	struct igt_fb fb_ref;
>> +	igt_plane_t *primary;
>> +	drmModeModeInfo *mode;
>> +	igt_pipe_crc_t *pipe_crc;
>> +	igt_crc_t ref_crc, new_crc;
>> +	igt_plane_t *plane_lower, *plane_upper;
>> +	uint32_t w_lower, h_lower, w_upper, h_upper;
>> +
>> +	n_planes = pipe->n_planes;
>> +	mode = igt_output_get_mode(output);
>> +	primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +	/* for lower plane */
>> +	w_lower = mode->hdisplay;
>> +	h_lower = mode->vdisplay;
>> +
>> +	/* for upper plane */
>> +	w_upper = mode->hdisplay / 2;
>> +	h_upper = mode->vdisplay / 2;
>> +
>> +	if (intel_gen(display->drm_fd) == 3)
>> +		format = DRM_FORMAT_RGB565;
>> +	else
>> +		format = DRM_FORMAT_ARGB8888;
> 
> Let's not make this test intel-only. There should be a function in IGT
> to pick an available format supported by IGT (no matter which one).

Done in v2. I have used XRGB8888 pixel format, i could have used IGT 
func to pick an available format but since formats do come with 
limitations too..avoided that and used fixed XRGB8888 as used in other 
IGTs since this IGT doesn't test pixel formats and format shouldn't be 
constraint. Is it okay? 	
> 
>> +
>> +	igt_create_color_fb(display->drm_fd,
>> +			    w_lower, h_lower,
>> +			    format, I915_TILING_NONE,
>> +			    0.0, 0.0, 0.0, &fb_ref);
>> +
>> +	cr = igt_get_cairo_ctx(display->drm_fd, &fb_ref);
>> +	igt_assert(cairo_status(cr) == 0);
>> +	igt_paint_color(cr, 0, 0, w_lower, h_lower, 0.0, 0.0, 1.0);
>> +	igt_paint_color(cr, w_upper / 2, h_upper / 2, w_upper, h_upper, 1.0, 1.0, 0.0);
>> +	igt_put_cairo_ctx(display->drm_fd, &fb_ref, cr);
>> +	igt_plane_set_fb(primary, &fb_ref);
>> +	igt_display_commit2(display, COMMIT_ATOMIC);
> 
> Isn't that something the other zpos function do too? Maybe extracting it
> into a function would be good? Or make the plane_zpos function take a
> parameter (immutable / mutable)?

No the other mutable zpos doesn't do the same thing, function definition 
itself is different since it tests only 2 planes primary and overlay. 
And there is no CRC based validation, so no need to drawing reference image.
> 
>> +
>> +	/* create the pipe_crc object for this pipe */
>> +	pipe_crc = igt_pipe_crc_new(pipe->display->drm_fd, pipe->pipe,
>> +				    INTEL_PIPE_CRC_SOURCE_AUTO);
>> +
>> +	/* get reference crc */
>> +	igt_pipe_crc_start(pipe_crc);
>> +        igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &ref_crc);
> 
> Space / tab issue here?

Done in v2
> 
>> +
>> +	igt_plane_set_fb(primary, NULL);
>> +
> 
> A comment here explaining that we want to avoid combinatorial explosion
> and thus only check pairs of planes in an increasing fashion?

Done in v2
> 
>> +	for (int i = 0; i < n_planes - 1; i++) {
>> +		struct igt_fb fb[2];
>> +		plane_lower = &display->pipes[pipe->pipe].planes[i];
>> +		plane_upper = &display->pipes[pipe->pipe].planes[i + 1];
>> +
>> +		igt_require(igt_plane_has_prop(plane_lower, IGT_PLANE_ZPOS));
>> +		igt_require(igt_plane_has_prop(plane_upper, IGT_PLANE_ZPOS));
> 
> Isn't require leading to a skip if one plane is not supporting the zpos?
> Shouldn't we just continue instead?

Done in v2
> 
>> +
>> +		if ((plane_lower->type == DRM_PLANE_TYPE_CURSOR) ||
>> +				(plane_upper->type == DRM_PLANE_TYPE_CURSOR))
>> +			continue;
> 
> Why special case the cursor plane? Because of its size?

Yes, cursor needs small buffer size, so avoided that.
> 
>> +
>> +		igt_create_color_fb(display->drm_fd, w_lower, h_lower,
>> +				    format, I915_TILING_NONE,
>> +				    0.0, 0.0, 1.0, &fb[0]);
>> +
>> +		igt_create_color_fb(display->drm_fd, w_upper, h_upper,
>> +				    format, I915_TILING_NONE,
>> +				    1.0, 1.0, 0.0, &fb[1]);
>> +
>> +		igt_plane_set_position(plane_lower, 0, 0);
>> +		igt_plane_set_fb(plane_lower, &fb[0]);
>> +
>> +		igt_plane_set_position(plane_upper, w_upper / 2, h_upper / 2);
>> +		igt_plane_set_fb(plane_upper, &fb[1]);
>> +
>> +		igt_display_commit2(display, COMMIT_ATOMIC);
>> +		igt_pipe_crc_get_current(pipe->display->drm_fd, pipe_crc, &new_crc);
>> +
>> +		igt_assert_crc_equal(&ref_crc, &new_crc);
> 
> Just a though, since the lower plane is supposed to always cover
> anything under, we could set all the planes under the lower plane to a
> solid red color. This would make sure that lower planes have no
> influence over upper planes.
> 
> What do you think?

Since we are validating zpos 2 planes at time, there won't be any plane 
below the lower plane, so may be coloring lower planes as red not 
required. I tried to accommodate it like committing with plane_max => 
yellow, small size and plane_(max-1) => blue, full screen and rest 
planes as red..but for this we need to enable all planes which will lead 
to BW issues. Anyhow if we validate p1 & p2, p2 & p3 it automatically 
validates p1 & p3 (transitive). Is it okay?
> 
>> +
>> +		igt_plane_set_fb(plane_lower, NULL);
>> +		igt_plane_set_fb(plane_upper, NULL);
>> +	}
>> +}
>> +
>>   static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *plane)
>>   {
>>   	drmModeModeInfo *mode = igt_output_get_mode(output);
>> @@ -987,14 +1078,20 @@ igt_main
>>   		plane_primary(pipe_obj, primary, &fb);
>>   	}
>>   
>> -	igt_subtest("plane_primary_overlay_zpos") {
>> +	igt_subtest("plane_primary_overlay_mutable_zpos") {
>> +		/*
>> +		 * Since i915 driver doesn't support mutable zpos;
>> +		 * skipping.
>> +		 */
>> +		igt_require(!is_i915_device(display.drm_fd));
>> +
> 
> Let it fail / skip, no need to encode in IGT the capabilities of i915.

Done in v2
> 
>>   		uint32_t format_primary = DRM_FORMAT_ARGB8888;
>>   		uint32_t format_overlay = DRM_FORMAT_ARGB1555;
>>   
>>   		igt_plane_t *overlay =
>>   			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
>> -
>>   		igt_require(overlay);
>> +
>>   		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
>>   		igt_require(igt_plane_has_prop(overlay, IGT_PLANE_ZPOS));
>>   
>> @@ -1002,8 +1099,14 @@ igt_main
>>   		igt_require(igt_plane_has_format_mod(overlay, format_overlay, 0x0));
>>   
>>   		igt_output_set_pipe(output, pipe);
>> -		plane_primary_overlay_zpos(pipe_obj, output, primary, overlay,
>> -					   format_primary, format_overlay);
>> +		plane_primary_overlay_mutable_zpos(pipe_obj, output, primary, overlay,
>> +						   format_primary, format_overlay);
>> +	}
>> +
>> +	igt_subtest("plane_immutable_zpos") {
>> +		igt_require(is_i915_device(display.drm_fd));
>> +		igt_output_set_pipe(output, pipe);
>> +		plane_immutable_zpos(&display, pipe_obj, output);
>>   	}
> 
> Documentation missing for both the plane_immutable_zpos and
> plane_primary_overlay_mutable_zpos. Since you are now the expert on
> this, it would be nice for you to explain what the tests do as explained
> in
> https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
> . Something like "Test that the reported zpos of a plane is correct by
> making sure a full-screen plane covers all other planes with a lower
> zpos, and the plane with the next available zpos is indeed partially
> covering the full-screen plane".
> 

Done in v2.
> Otherwise, it looks pretty good. Looks more minor improvements needed
> rather than anything big. Well done!

Thanks Martin for the review.
> 
> Martin
> 
>>   
>>   	igt_subtest("test_only") {
>> @@ -1011,6 +1114,7 @@ igt_main
>>   
>>   		test_only(pipe_obj, primary, output);
>>   	}
>> +
>>   	igt_subtest("plane_cursor_legacy") {
>>   		igt_plane_t *cursor =
>>   			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
>>

-- 
~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
