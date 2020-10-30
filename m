Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6998B6E9BA
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2020 13:40:57 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i7so3294717pgh.6
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2020 06:40:57 -0700 (PDT)
References: <20201026130811.11136-1-juhapekka.heikkila@gmail.com>
 <c372276a30e84ce0a356eafc96e876d1@intel.com>
 <9fd4258d-82a0-5bc6-8bf7-87896c53d379@gmail.com>
 <26cb550102b54cd1951fba7654bd0e3c@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <f8c82b2d-755f-9236-8b6d-2accf2660906@gmail.com>
Date: Fri, 30 Oct 2020 15:40:51 +0200
MIME-Version: 1.0
In-Reply-To: <26cb550102b54cd1951fba7654bd0e3c@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: fix pixel format
 (-clamping) tests
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
To: "Kahola, Mika" <mika.kahola@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 30.10.2020 11.07, Kahola, Mika wrote:
>> -----Original Message-----
>> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Sent: Thursday, October 29, 2020 8:23 PM
>> To: Kahola, Mika <mika.kahola@intel.com>; igt-dev@lists.freedesktop.org
>> Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: fix pixel format (-
>> clamping) tests
>>
>> On 29.10.2020 14.43, Kahola, Mika wrote:
>>>> -----Original Message-----
>>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>>>> Juha- Pekka Heikkila
>>>> Sent: Monday, October 26, 2020 3:08 PM
>>>> To: igt-dev@lists.freedesktop.org
>>>> Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: fix pixel format
>>>> (-clamping) tests
>>>>
>>>> cdclk caused modesets mid test will mess up crc sequence where two
>>>> consecutive frames will get same crc. If there come modeset restart
>>>> round for given set as modeset will anyway happen only on first color.
>>>>
>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>> ---
>>>>    tests/kms_plane.c | 28 ++++++++++++++++++++++------
>>>>    1 file changed, 22 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c index
>>>> e42c71cd9..4ce859fba 100644
>>>> --- a/tests/kms_plane.c
>>>> +++ b/tests/kms_plane.c
>>>> @@ -560,9 +560,11 @@ static void capture_format_crcs(data_t *data,
>>>> enum pipe pipe,
>>>>    	struct drm_event_vblank ev;
>>>>    	int i;
>>>>
>>>> +restart_round:
>>>>    	for (i = 0; i < data->num_colors; i++) {
>>>>    		const color_t *c = &data->colors[i];
>>>>    		struct igt_fb old_fb = *fb;
>>>> +		int ret;
>>>>
>>>>    		prepare_format_color(data, pipe, plane, format, modifier,
>>>>    				     width, height, encoding, range, c, fb); @@
>>>> -593,10 +595,22 @@ static void capture_format_crcs(data_t *data, enum
>>>> pipe pipe,
>>>>    			 * to be prepared in parallel while the current fb
>>>>    			 * awaits to be latched.
>>>>    			 */
>>>> -			igt_display_commit_atomic(&data->display,
>>>> -
>>>> DRM_MODE_ATOMIC_ALLOW_MODESET |
>>>> -
>>>> DRM_MODE_ATOMIC_NONBLOCK |
>>>> -
>>>> DRM_MODE_PAGE_FLIP_EVENT, NULL);
>>>> +			ret = igt_display_try_commit_atomic(&data->display,
>>>> +
>>>> DRM_MODE_ATOMIC_NONBLOCK |
>>>> +
>>>> DRM_MODE_PAGE_FLIP_EVENT, NULL);
>>>> +			if (ret) {
>>>> +				/*
>>>> +				 * there was needed modeset for pixel
>>>> format.
>>>> +				 * modeset here happen only on first color of
>>>> +				 * given set so restart round as modeset will
>>>> +				 * mess up crc frame sequence.
>>>> +				 */
>>>> +				igt_display_commit_atomic(&data->display,
>>>> +
>>>> DRM_MODE_ATOMIC_ALLOW_MODESET,
>>>> +							  NULL);
>>>> +				igt_remove_fb(data->drm_fd, &old_fb);
>>>> +				goto restart_round;
>>>> +			}
>>>
>>> I tried to figure out the patch and it seems that we need to do modeset
>> only once, right? However, there is a theoretical chance (probability maybe
>> next to nothing) that we keep looping on restart_found. Therefore, I was
>> thinking that we should limit the restarts to 1 or to some finite number?
>>
>> You mean there would come more than one modeset? I think many tests will
>> start to fail at that moment. Here fb which required modeset is left on screen
>> when going for restart, there shouldn't be new modeset. Then if modeset
>> itself fail that modesetting commit is not try commit so it will assert on
>> failure. I don't think there is need for additional counter unless cdclk
>> calculations fail but then everything is failing everywhere anyway I think.
> 
> That's what I was thinking that there might be a minor likelihood that more than one modeset would occur. If that happens, something else must have gone wrong.
> 
> Anyway, the patch looks ok.
> 
> Reviewed-by: Mika Kahola <mika.kahola@intel.com>

Thanks for R-b. Pushed.

/Juha-Pekka

>>
>>>
>>> Cheers,
>>> Mika
>>>>    		} else {
>>>>    			/*
>>>>    			 * Last moment to grab the previous crc @@ -815,8
>>>> +829,10 @@ static bool test_format_plane(data_t *data, enum pipe
>>>> +pipe,
>>>>
>>>>    		igt_plane_set_fb(plane, &test_fb);
>>>>
>>>> -		ret = igt_display_try_commit_atomic(&data->display,
>>>> DRM_MODE_ATOMIC_TEST_ONLY, NULL);
>>>> -
>>>> +		ret = igt_display_try_commit_atomic(&data->display,
>>>> +
>>>> DRM_MODE_ATOMIC_TEST_ONLY |
>>>> +
>>>> DRM_MODE_ATOMIC_ALLOW_MODESET,
>>>> +						    NULL);
>>>>    		if (!ret) {
>>>>    			width = test_fb.width;
>>>>    			height = test_fb.height;
>>>> --
>>>> 2.28.0
>>>>
>>>> _______________________________________________
>>>> igt-dev mailing list
>>>> igt-dev@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/igt-dev
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
