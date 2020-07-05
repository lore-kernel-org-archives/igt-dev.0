Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F69B6EC3A
 for <igt-dev@lists.freedesktop.org>; Sun,  5 Jul 2020 19:45:07 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id by13so22999924edb.11
 for <igt-dev@lists.freedesktop.org>; Sun, 05 Jul 2020 12:45:07 -0700 (PDT)
References: <20200622135900.3227-1-juhapekka.heikkila@gmail.com>
 <6C6F3077F20030489816322B9AE9C6150CE48D5D@pgsmsx114.gar.corp.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <51f63b91-dac6-4af0-82ef-73d0dd8f3242@gmail.com>
Date: Sun, 5 Jul 2020 22:44:53 +0300
MIME-Version: 1.0
In-Reply-To: <6C6F3077F20030489816322B9AE9C6150CE48D5D@pgsmsx114.gar.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip_tiling: remove
 cut'n'paste
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Tomi Sarvela <tomi.p.sarvela@intel.com>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Hiler, Arkadiusz" <arkadiusz.hiler@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi guys,

this patch will change names of subtests on kms_flip_tiling. I'm sending 
you guys list of tests which will get new name as we did agree with ivyl 
and tsa earlier on irc so you can adapt ci history. I'll push this patch 
to igt once some of you guys have acked this change in ci regard.

"flip-changes-tiling"    -> "flip-x-tiled-to-linear"
"flip-changes-tiling-Y"  -> "flip-y-tiled-to-linear"
"flip-changes-tiling-Yf" -> "flip-yf-tiled-to-linear"
"flip-X-tiled"           -> "flip-x-tiled-to-x-tiled"
"flip-Y-tiled"           -> "flip-y-tiled-to-y-tiled"
"flip-Yf-tiled"          -> "flip-yf-tiled-to-yf-tiled"
"flip-to-X-tiled"        -> "flip-linear-to-x-tiled"
"flip-to-Y-tiled"        -> "flip-linear-to-y-tiled"
"flip-to-Yf-tiled"       -> "flip-linear-to-yf-tiled"

/Juha-Pekka

On 24.6.2020 17.46, B, Jeevan wrote:
> Hi,
> 
> Patch looks good to me.
> 
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-
>> Pekka Heikkila
>> Sent: Monday, June 22, 2020 7:29 PM
>> To: igt-dev@lists.freedesktop.org
>> Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip_tiling: remove cut'n'paste
>>
>> convert all tests to be created in nested for-loops which will create tests for all
>> flip changes.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>> tests/kms_flip_tiling.c | 186 +++++++---------------------------------
>> 1 file changed, 33 insertions(+), 153 deletions(-)
>>
>> diff --git a/tests/kms_flip_tiling.c b/tests/kms_flip_tiling.c index
>> fb79de15..329e0bda 100644
>> --- a/tests/kms_flip_tiling.c
>> +++ b/tests/kms_flip_tiling.c
>> @@ -153,6 +153,16 @@ igt_output_t *output;
>>
>> igt_main
>> {
>> +	const struct {
>> +		uint64_t tiling_format;
>> +		const char*    name;
>> +	} tiling_formats[] = {
>> +		{ LOCAL_DRM_FORMAT_MOD_NONE, "linear"},
>> +		{ LOCAL_I915_FORMAT_MOD_X_TILED, "x-tiled"},
>> +		{ LOCAL_I915_FORMAT_MOD_Y_TILED, "y-tiled"},
>> +		{ LOCAL_I915_FORMAT_MOD_Yf_TILED, "yf-tiled"},
>> +	};
>> +
>> 	igt_fixture {
>> 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
>> 		data.gen = intel_gen(intel_get_drm_devid(data.drm_fd));
>> @@ -165,160 +175,30 @@ igt_main
>> 		igt_display_require(&data.display, data.drm_fd);
>> 	}
>>
>> -	/*
>> -	 * Test that a page flip from a tiled buffer to a linear one works
>> -	 * correctly. First, it sets the crtc with the linear buffer and
>> -	 * generates a reference crc for the pipe. Then, the crtc is set with
>> -	 * the tiled one and page flip to the linear one issued. A new crc is
>> -	 * generated and compared to the reference one.
>> -	 */
>> -
>> -	igt_subtest_f("flip-changes-tiling") {
>> -		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
>> -				       LOCAL_DRM_FORMAT_MOD_NONE };
>> -		enum pipe pipe;
>> -
>> -		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>> -
>> 	igt_require(igt_display_has_format_mod(&data.display,
>> data.testformat, tiling[i]));
>> -
>> -		for_each_pipe_with_valid_output(&data.display, pipe,
>> output)
>> -			test_flip_tiling(&data, pipe, output, tiling);
>> -	}
>> -
>> -	igt_subtest_f("flip-changes-tiling-Y") {
>> -		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
>> -				       LOCAL_DRM_FORMAT_MOD_NONE };
>> -		enum pipe pipe;
>> -
>> -		igt_require_fb_modifiers(data.drm_fd);
>> -
>> -		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>> -
>> 	igt_require(igt_display_has_format_mod(&data.display,
>> data.testformat, tiling[i]));
>> -
>> -		igt_require(data.gen >= 9);
>> -
>> -		for_each_pipe_with_valid_output(&data.display, pipe,
>> output)
>> -			test_flip_tiling(&data, pipe, output, tiling);
>> -	}
>> -
>> -	igt_subtest_f("flip-changes-tiling-Yf") {
>> -		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
>> -				       LOCAL_DRM_FORMAT_MOD_NONE };
>> -		enum pipe pipe;
>> -
>> -		igt_require_fb_modifiers(data.drm_fd);
>> -
>> -		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>> -
>> 	igt_require(igt_display_has_format_mod(&data.display,
>> data.testformat, tiling[i]));
>> -
>> -		igt_require(data.gen >= 9);
>> -
>> -		for_each_pipe_with_valid_output(&data.display, pipe,
>> output)
>> -			test_flip_tiling(&data, pipe, output, tiling);
>> -	}
>> -
>> -	/*
>> -	 * Test that a page flip from a tiled buffer to another tiled one works
>> -	 * correctly. First, it sets the crtc with the tiled buffer and
>> -	 * generates a reference crc for the pipe. Then a page flip to second
>> -	 * tiled buffer is issued. A new crc is generated and compared to the
>> -	 * reference one.
>> -	 */
>> -
>> -	igt_subtest_f("flip-X-tiled") {
>> -		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
>> -				       LOCAL_I915_FORMAT_MOD_X_TILED };
>> -		enum pipe pipe;
>> -
>> -		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>> -
>> 	igt_require(igt_display_has_format_mod(&data.display,
>> data.testformat, tiling[i]));
>> -
>> -		for_each_pipe_with_valid_output(&data.display, pipe,
>> output)
>> -			test_flip_tiling(&data, pipe, output, tiling);
>> -	}
>> -
>> -	igt_subtest_f("flip-Y-tiled") {
>> -		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
>> -				       LOCAL_I915_FORMAT_MOD_Y_TILED };
>> -		enum pipe pipe;
>> -
>> -		igt_require_fb_modifiers(data.drm_fd);
>> -
>> -		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>> -
>> 	igt_require(igt_display_has_format_mod(&data.display,
>> data.testformat, tiling[i]));
>> -
>> -		igt_require(data.gen >= 9);
>> -
>> -		for_each_pipe_with_valid_output(&data.display, pipe,
>> output)
>> -			test_flip_tiling(&data, pipe, output, tiling);
>> -	}
>> -
>> -	igt_subtest_f("flip-Yf-tiled") {
>> -		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
>> -				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
>> -		enum pipe pipe;
>> -
>> -		igt_require_fb_modifiers(data.drm_fd);
>> -
>> -		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>> -
>> 	igt_require(igt_display_has_format_mod(&data.display,
>> data.testformat, tiling[i]));
>> -
>> -		igt_require(data.gen >= 9);
>> -
>> -		for_each_pipe_with_valid_output(&data.display, pipe,
>> output)
>> -			test_flip_tiling(&data, pipe, output, tiling);
>> -	}
>> -
>> -	/*
>> -	 * Test that a page flip from a linear buffer to a tiled one works
>> -	 * correctly. First, it sets the crtc with the linear buffer and
>> -	 * generates a reference crc for the pipe. Then a page flip to a tiled
>> -	 * buffer is issued. A new crc is generated and compared to the
>> -	 * reference one.
>> -	 */
>> -
>> -	igt_subtest_f("flip-to-X-tiled") {
>> -		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
>> -				       LOCAL_I915_FORMAT_MOD_X_TILED };
>> -		enum pipe pipe;
>> -
>> -		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>> -
>> 	igt_require(igt_display_has_format_mod(&data.display,
>> data.testformat, tiling[i]));
>> -
>> -		for_each_pipe_with_valid_output(&data.display, pipe,
>> output)
>> -			test_flip_tiling(&data, pipe, output, tiling);
>> -	}
>> -
>> -	igt_subtest_f("flip-to-Y-tiled") {
>> -		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
>> -				       LOCAL_I915_FORMAT_MOD_Y_TILED };
>> -		enum pipe pipe;
>> -
>> -		igt_require_fb_modifiers(data.drm_fd);
>> -
>> -		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>> -
>> 	igt_require(igt_display_has_format_mod(&data.display,
>> data.testformat, tiling[i]));
>> -
>> -		igt_require(data.gen >= 9);
>> -
>> -		for_each_pipe_with_valid_output(&data.display, pipe,
>> output)
>> -			test_flip_tiling(&data, pipe, output, tiling);
>> -	}
>> -
>> -	igt_subtest_f("flip-to-Yf-tiled") {
>> -		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
>> -				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
>> -		enum pipe pipe;
>> -
>> -		igt_require_fb_modifiers(data.drm_fd);
>> -
>> -		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
>> -
>> 	igt_require(igt_display_has_format_mod(&data.display,
>> data.testformat, tiling[i]));
>> -
>> -		igt_require(data.gen >= 9);
>> +	for (int i = 0; i < ARRAY_SIZE(tiling_formats); i++) {
>> +		for (int j = 0; j < ARRAY_SIZE(tiling_formats); j++) {
>> +
>> +			igt_describe_f("Check using crcs flipping from %s fb to
>> %s fb works correctly.\n",
>> +				     tiling_formats[i].name,
>> tiling_formats[j].name);
>> +			igt_subtest_f("flip-%s-to-%s", tiling_formats[i].name,
>> tiling_formats[j].name) {
>> +				uint64_t tiling[2] = {
>> tiling_formats[i].tiling_format,
>> +
>> tiling_formats[j].tiling_format };
>> +				enum pipe pipe;
>> +
>> +				for (int c = 0; c < ARRAY_SIZE(tiling); c++) {
>> +					if (tiling[c] !=
>> LOCAL_DRM_FORMAT_MOD_NONE &&
>> +					    tiling[c] !=
>> LOCAL_I915_FORMAT_MOD_X_TILED) {
>> +						igt_require(data.gen >= 9);
>> +
>> 	igt_require_fb_modifiers(data.drm_fd);
>> +					}
>> +
>> 	igt_require(igt_display_has_format_mod(&data.display,
>> data.testformat, tiling[c]));
>> +				}
>> +
>> +
>> 	for_each_pipe_with_valid_output(&data.display, pipe, output)
>> +					test_flip_tiling(&data, pipe, output,
>> tiling);
>> +			}
>> +		}
>>
>> -		for_each_pipe_with_valid_output(&data.display, pipe,
>> output)
>> -			test_flip_tiling(&data, pipe, output, tiling);
>> 	}
>>
>> 	igt_fixture {
>> --
>> 2.26.0
> Reviewed-by:  Jeevan B <jeevan.b@intel.com>
>>
>> _______________________________________________
>> igt-dev mailing list
>> igt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/igt-dev
> 
> Thanks
> Jeevan B
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
