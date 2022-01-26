Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A3F10E340
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jan 2022 17:33:33 +0000 (UTC)
Message-ID: <9d9fc6eb-fb6c-9b9d-7d63-03e5fdded1ca@quicinc.com>
Date: Wed, 26 Jan 2022 09:33:31 -0800
MIME-Version: 1.0
Content-Language: en-US
References: <20220126010105.187-1-quic_jesszhan@quicinc.com>
 <YfEgqkJDpw9ZXfLE@platvala-desk.ger.corp.intel.com>
 <YfE3rbP2LquSeSHd@platvala-desk.ger.corp.intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <YfE3rbP2LquSeSHd@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/kms_plane_scaling: Increase
 buffer size if driver doesn't support larger scale factors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: quic_khsieh@quicinc.com, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>



On 1/26/2022 3:59 AM, Petri Latvala wrote:
> On Wed, Jan 26, 2022 at 12:21:30PM +0200, Petri Latvala wrote:
>> On Tue, Jan 25, 2022 at 05:01:05PM -0800, Jessica Zhang wrote:
>>> Catch edge cases where driver doesn't support larger scale factors or
>>> pipe doesn't support scaling.
>>>
>>> Currently, a 20x20 framebuffer is passed in to be upscaled. However,
>>> this will cause issues with other drivers as they may not support larger
>>> scale factors or may not support scaling at all for certain planes.
>>>
>>> This avoids failures due to invalid scale factor by trying
>>> the original 20x20 framebuffer commit, then trying to commit larger
>>> framebuffers up to and including unity scale.
>>>
>>> Changes since V1:
>>> - try_commit_with_fb_size: Changed igt_try_commit2 to
>>>    igt_display_try_commit_atomic instead to avoid redundant commits
>>> - try_commit_with_fb_size: Moved calls to clear framebuffer to outside
>>>    of success condition and moved cleanup_crtc back to outside of method
>>>
>>> Changes since V2:
>>> - try_commit_with_fb_size: Replaced igt_display_try_commit_atomic with
>>>    igt_display_try_commit2 and removed igt_display_try_commit2 to avoid
>>>    redundant checks
>>>
>>> Changes since V3:
>>> - try_commit_with_fb_size: Moved igt_plane_set_position to outside
>>>    method after fallback cases
>>>
>>> Changes since V4:
>>> - try_commit_with_fb_size: Moved igt_create_color_fb to inside
>>>    display_try_commit_with_fb and moved igt_set_plane_fb out so that a
>>>    new framebuffer is created and set for different sizes
>>>
>>> Tested-on: Qualcomm RB5 (sdm845), Chromebook (Lazor)
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> Change-Id: Ib6758fec0293a2ba4c4109fbf42674cf93f784dd
>>> ---
>>>   tests/kms_plane_scaling.c | 57 +++++++++++++++++++++++++++++++--------
>>>   1 file changed, 46 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>>> index 85db11ee6dbd..bbc89c23b91f 100644
>>> --- a/tests/kms_plane_scaling.c
>>> +++ b/tests/kms_plane_scaling.c
>>> @@ -1,5 +1,6 @@
>>>   /*
>>>    * Copyright © 2013,2014 Intel Corporation
>>> + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>>    *
>>>    * Permission is hereby granted, free of charge, to any person obtaining a
>>>    * copy of this software and associated documentation files (the "Software"),
>>> @@ -118,6 +119,32 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
>>>   	igt_display_commit2(display, COMMIT_ATOMIC);
>>>   }
>>>   
>>> +static int try_commit_with_fb_size(int width, int height, igt_rotation_t rot,
>>> +				   igt_display_t *display, data_t *d,
>>> +				   uint32_t pixel_format,
>>> +				   uint64_t modifier,
>>> +				   igt_plane_t *plane,
>>> +				   drmModeModeInfo *mode)
>>> +{
>>> +	int ret;
>>> +
>>> +	/* create buffer in the range of  min and max source side limit.*/
>>> +	igt_create_color_fb(display->drm_fd, width, height,
>>> +		       pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
>>> +	igt_plane_set_fb(plane, &d->fb[0]);
>>> +
>>> +	/* Check min to full resolution upscaling */
>>> +	igt_fb_set_position(&d->fb[0], plane, 0, 0);
>>> +	igt_fb_set_size(&d->fb[0], plane, width, height);
>>> +	igt_plane_set_position(plane, 0, 0);
>>> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>> +	igt_plane_set_rotation(plane, rot);
>>> +
>>> +	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>   static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>>>   					 uint32_t pixel_format,
>>>   					 uint64_t modifier, enum pipe pipe,
>>> @@ -126,6 +153,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>>>   {
>>>   	igt_display_t *display = &d->display;
>>>   	int width, height;
>>> +	int commit_ret;
>>>   	drmModeModeInfo *mode;
>>>   
>>>   	cleanup_crtc(d);
>>> @@ -133,22 +161,29 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>>>   	igt_output_set_pipe(output, pipe);
>>>   	mode = igt_output_get_mode(output);
>>>   
>>> -	/* create buffer in the range of  min and max source side limit.*/
>>>   	width = height = 20;
>>> -	igt_create_color_fb(display->drm_fd, width, height,
>>> -		       pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
>>> -	igt_plane_set_fb(plane, &d->fb[0]);
>>>   
>>> -	/* Check min to full resolution upscaling */
>>> -	igt_fb_set_position(&d->fb[0], plane, 0, 0);
>>> -	igt_fb_set_size(&d->fb[0], plane, width, height);
>>> -	igt_plane_set_position(plane, 0, 0);
>>> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>> -	igt_plane_set_rotation(plane, rot);
>>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>>> +	commit_ret = try_commit_with_fb_size(width, height, rot, display, d,
>>> +					     pixel_format, modifier, plane, mode);
>>> +
>>> +	if(commit_ret == -ERANGE) {
>>> +		igt_debug("Scaling for %dx%d plane not supported, trying scale factor of 4x\n", width, height);
>>> +		width = height = mode->vdisplay / 4;
>>> +		commit_ret = try_commit_with_fb_size(width, height, rot, display, d,
>>> +						     pixel_format, modifier, plane, mode);
>>> +	}
>>> +
>>> +	if (commit_ret == -ERANGE) {
>>> +		igt_debug("Scale factor of 4x (or scaling in general) not supported, trying unity scale\n");
>>> +		width = mode->hdisplay;
>>> +		height = mode->vdisplay;
>>> +		commit_ret = try_commit_with_fb_size(width, height, rot, display, d,
>>> +						     pixel_format, modifier, plane, mode);
>>> +	}
>>
>> Now the changes look good and they do what it says on the tin. But now
>> it got me thinking if this needs to be even more complicated...
>>
>> If a kernel change causes the first scaling attempt to fail and this
>> goes into the fallbacks and succeeds there, it all happens very
>> silently. A better setup for catching that case would be to have
>> separate dynamic subtests for the different scaling factors, where the
>> unsupported factors do a 'SKIP' result with igt_skip_on_f(commit_ret
>> == -ERANGE, "Unsupported scaling factor\n");
>>
>> What do you think? Sorry to go back and forth like this on the patch.
> 
> Something like this: https://patchwork.freedesktop.org/series/99364/
> 

Good idea -- it would definitely help to make this more transparent.

Thanks,
Jessica Zhang

> 
> -- 
> Petri Latvala
