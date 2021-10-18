Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E58B6E97B
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 07:35:42 +0000 (UTC)
Message-ID: <e2d762bc-60bf-2644-27d6-47a4263b670a@intel.com>
Date: Mon, 18 Oct 2021 13:05:00 +0530
Content-Language: en-US
References: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
 <20211013221727.6392-6-ville.syrjala@linux.intel.com>
 <42613f61-159e-9deb-e738-21a0b8a66b60@intel.com> <YW0iHhJVK7aLsJXw@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <YW0iHhJVK7aLsJXw@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 5/8] tests/i915/kms_flip_tiling:
 Generalize away copy-pasta
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 10/18/2021 12:58 PM, Ville Syrjälä wrote:
> On Mon, Oct 18, 2021 at 12:32:18PM +0530, Karthik B S wrote:
>> On 10/14/2021 3:47 AM, Ville Syrjala wrote:
>>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>
>>> Replace the huge swaths of copypasta by just looping over the
>>> set of modifiers reported by the plane, and testing each against
>>> the others (and itself).
>>>
>>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> ---
>>>    tests/i915/kms_flip_tiling.c | 209 +++++------------------------------
>>>    1 file changed, 30 insertions(+), 179 deletions(-)
>>>
>>> diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
>>> index 63e0b8b9648f..e2e6619baeca 100644
>>> --- a/tests/i915/kms_flip_tiling.c
>>> +++ b/tests/i915/kms_flip_tiling.c
>>> @@ -161,195 +161,46 @@ igt_main
>>>    		igt_display_require(&data.display, data.drm_fd);
>>>    	}
>>>    
>>> -	/*
>>> -	 * Test that a page flip from a tiled buffer to a linear one works
>>> -	 * correctly. First, it sets the crtc with the linear buffer and
>>> -	 * generates a reference crc for the pipe. Then, the crtc is set with
>>> -	 * the tiled one and page flip to the linear one issued. A new crc is
>>> -	 * generated and compared to the reference one.
>>> -	 */
>>> -
>>> -	igt_describe("Check pageflip from tiled buffer to linear one works correctly with x tiling");
>>> -	igt_subtest_with_dynamic("flip-changes-tiling") {
>>> -		uint64_t modifier[2] = { I915_FORMAT_MOD_X_TILED,
>>> -					 DRM_FORMAT_MOD_LINEAR };
>>> +	igt_describe("Check pageflip between modifiers");
>>> +	igt_subtest_with_dynamic("flip-change-tiling") {
>>>    		enum pipe pipe;
>>>    
>>> -		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
>>> -			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
>>> -
>>>    		for_each_pipe_with_valid_output(&data.display, pipe, output) {
>>> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>>> -				test_flip_tiling(&data, pipe, output, modifier);
>>> -			test_cleanup(&data, pipe, output);
>>> -		}
>>> -	}
>>> -
>>> -	igt_describe("Check pageflip from tiled buffer to linear one works correctly with y tiling");
>>> -	igt_subtest_with_dynamic("flip-changes-tiling-Y") {
>>> -		uint64_t modifier[2] = { I915_FORMAT_MOD_Y_TILED,
>>> -					 DRM_FORMAT_MOD_LINEAR };
>>> -		enum pipe pipe;
>>> +			igt_plane_t *plane;
>>>    
>>> -		igt_require_fb_modifiers(data.drm_fd);
>>> +			igt_output_set_pipe(output, pipe);
>>>    
>>> -		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
>>> -			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
>>> +			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>>    
>>> -		igt_require(data.gen >= 9);
>>> +			for (int i = 0; i < plane->format_mod_count; i++) {
>>> +				if (plane->formats[i] != data.testformat)
>>> +					continue;
>>>    
>>> -		for_each_pipe_with_valid_output(&data.display, pipe, output) {
>>> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>>> -				test_flip_tiling(&data, pipe, output, modifier);
>>> -			test_cleanup(&data, pipe, output);
>>> -		}
>>> -	}
>>> -
>>> -	igt_describe("Check pageflip from tiled buffer to linear one works correctly with yf tiling");
>>> -	igt_subtest_with_dynamic("flip-changes-tiling-Yf") {
>>> -		uint64_t modifier[2] = { I915_FORMAT_MOD_Yf_TILED,
>>> -					 DRM_FORMAT_MOD_LINEAR };
>>> -		enum pipe pipe;
>>> +				for (int j = 0; j < plane->format_mod_count; j++) {
>>> +					uint64_t modifier[2] = {
>>> +						plane->modifiers[i],
>>> +						plane->modifiers[j],
>>> +					};
>>>    
>>> -		igt_require_fb_modifiers(data.drm_fd);
>>> +					if (plane->formats[j] != data.testformat)
>>> +						continue;
>> Move this check before assigning modifier[]?
> Then I'd have to split the declaration and assignment.
Right. Should be fine to keep it as is then.
>
>>>    
>>> -		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
>>> -			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
>>> -
>>> -		igt_require(data.gen >= 9);
>>> -
>>> -		for_each_pipe_with_valid_output(&data.display, pipe, output) {
>>> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>>> -				test_flip_tiling(&data, pipe, output, modifier);
>>> -			test_cleanup(&data, pipe, output);
>>> -		}
>>> -	}
>>> -
>>> -	/*
>>> -	 * Test that a page flip from a tiled buffer to another tiled one works
>>> -	 * correctly. First, it sets the crtc with the tiled buffer and
>>> -	 * generates a reference crc for the pipe. Then a page flip to second
>>> -	 * tiled buffer is issued. A new crc is generated and compared to the
>>> -	 * reference one.
>>> -	 */
>>> -
>>> -	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with x tiling");
>>> -	igt_subtest_with_dynamic("flip-X-tiled") {
>>> -		uint64_t modifier[2] = { I915_FORMAT_MOD_X_TILED,
>>> -					 I915_FORMAT_MOD_X_TILED };
>>> -		enum pipe pipe;
>>> -
>>> -		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
>>> -			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
>>> -
>>> -		for_each_pipe_with_valid_output(&data.display, pipe, output) {
>>> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>>> -				test_flip_tiling(&data, pipe, output, modifier);
>>> -			test_cleanup(&data, pipe, output);
>>> -		}
>>> -	}
>>> -
>>> -	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with y tiling");
>>> -	igt_subtest_with_dynamic("flip-Y-tiled") {
>>> -		uint64_t modifier[2] = { I915_FORMAT_MOD_Y_TILED,
>>> -					 I915_FORMAT_MOD_Y_TILED };
>>> -		enum pipe pipe;
>>> -
>>> -		igt_require_fb_modifiers(data.drm_fd);
>>> -
>>> -		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
>>> -			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
>>> -
>>> -		igt_require(data.gen >= 9);
>>> -
>>> -		for_each_pipe_with_valid_output(&data.display, pipe, output) {
>>> -			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
>>> -				test_flip_tiling(&data, pipe, output, modifier);
>>> -			test_cleanup(&data, pipe, output);
>>> -		}
>>> -	}
>>> -
>>> -	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with yf tiling");
>>> -	igt_subtest_with_dynamic("flip-Yf-tiled") {
>>> -		uint64_t modifier[2] = { I915_FORMAT_MOD_Yf_TILED,
>>> -					 I915_FORMAT_MOD_Yf_TILED };
>>> -		enum pipe pipe;
>>> +					igt_require(igt_plane_has_format_mod(plane,
>>> +									     data.testformat,
>>> +									     modifier[0]));
>>> +					igt_require(igt_plane_has_format_mod(plane,
>>> +									     data.testformat,
>>> +									     modifier[1]));
>> Is this still required? We are already only taking modifiers which are
>> supported by this format? Please correct me if I'm missing something here.
> Not missing anything, these can go. We already checked for this by hand.
>
> Originally I forgot that plane->modifiers[]+plane->formats[] actually
> form a SoA tuple, so I just iterated plane->modifiers[] without skipping
> anything, thinking that would just iterate each modifier once. And with
> that apporach I would have still needed the igt_plane_has_format_mod().
> However as I rediscovered the truth I then added the manual
> plane->format[] checks which make these redundant.

Thank you for the clarification.

Thanks,

Karthik.B.S

>
>> With these minor updates, the patch looks good to me.
>>
>> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> Thanks.
>
