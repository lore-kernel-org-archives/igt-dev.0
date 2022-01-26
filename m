Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E343010E268
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jan 2022 00:16:07 +0000 (UTC)
Message-ID: <5eec200b-f6e2-af8b-05c3-eceb1b545cdf@quicinc.com>
Date: Tue, 25 Jan 2022 16:09:59 -0800
MIME-Version: 1.0
Content-Language: en-US
References: <20220114014945.90-1-quic_jesszhan@quicinc.com>
 <Yefv95KjgtloCX3B@platvala-desk.ger.corp.intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <Yefv95KjgtloCX3B@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_plane_scaling: Increase
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



On 1/19/2022 3:03 AM, Petri Latvala wrote:
> On Thu, Jan 13, 2022 at 05:49:45PM -0800, Jessica Zhang wrote:
>> Catch edge cases where driver doesn't support larger scale factors or
>> pipe doesn't support scaling.
>>
>> Currently, a 20x20 framebuffer is passed in to be upscaled. However,
>> this will cause issues with other drivers as they may not support larger
>> scale factors or may not support scaling at all for certain planes.
>>
>> This avoids failures due to invalid scale factor by trying
>> the original 20x20 framebuffer commit, then trying to commit larger
>> framebuffers up to and including unity scale.
>>
>> Changes since V1:
>> - try_commit_with_fb_size: Changed igt_try_commit2 to
>>    igt_display_try_commit_atomic instead to avoid redundant commits
>> - try_commit_with_fb_size: Moved calls to clear framebuffer to outside
>>    of success condition and moved cleanup_crtc back to outside of method
>>
>> Changes since V2:
>> - try_commit_with_fb_size: Replaced igt_display_try_commit_atomic with
>>    igt_display_try_commit2 and removed igt_display_try_commit2 to avoid
>>    redundant checks
>>
>> Changes since V3:
>> - try_commit_with_fb_size: Moved igt_plane_set_position to outside
>>    method after fallback cases
>>
>> Tested-on: Qualcomm RB5 (sdm845)
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   tests/kms_plane_scaling.c | 49 ++++++++++++++++++++++++++++++++-------
>>   1 file changed, 41 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 85db11ee..b297a729 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -1,5 +1,6 @@
>>   /*
>>    * Copyright © 2013,2014 Intel Corporation
>> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
>>    *
>>    * Permission is hereby granted, free of charge, to any person obtaining a
>>    * copy of this software and associated documentation files (the "Software"),
>> @@ -118,6 +119,27 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
>>   	igt_display_commit2(display, COMMIT_ATOMIC);
>>   }
>>   
>> +static int try_commit_with_fb_size(int width, int height, igt_rotation_t rot,
>> +		                    igt_display_t *display, data_t *d,
>> +                                   igt_plane_t *plane,
>> +		                    drmModeModeInfo *mode)
>> +{
>> +	int ret;
>> +
>> +	/* Check min to full resolution upscaling */
>> +	igt_fb_set_position(&d->fb[0], plane, 0, 0);
>> +	igt_fb_set_size(&d->fb[0], plane, width, height);
>> +	igt_plane_set_position(plane, 0, 0);
>> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>> +	igt_plane_set_rotation(plane, rot);
>> +
>> +	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>> +
>> +	igt_plane_set_fb(plane, NULL);
> 
> 
> You said you wanted to keep this set_fb here to reset the size and
> such, but it also resets CRTC_ID and FB_ID and those are left to 0 for
> the fallbacks.
> 

Ah, I see... I'm going about this the wrong way. Instead of resetting 
the fb each time, I should instead be creating and setting a new fb of a 
different size.

Thanks,
Jessica Zhang

> 
> -- 
> Petri Latvala
> 
> 
> 
>> +
>> +	return ret;
>> +}
>> +
>>   static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>>   					 uint32_t pixel_format,
>>   					 uint64_t modifier, enum pipe pipe,
>> @@ -126,6 +148,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>>   {
>>   	igt_display_t *display = &d->display;
>>   	int width, height;
>> +	int commit_ret;
>>   	drmModeModeInfo *mode;
>>   
>>   	cleanup_crtc(d);
>> @@ -139,16 +162,26 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>>   		       pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
>>   	igt_plane_set_fb(plane, &d->fb[0]);
>>   
>> -	/* Check min to full resolution upscaling */
>> -	igt_fb_set_position(&d->fb[0], plane, 0, 0);
>> -	igt_fb_set_size(&d->fb[0], plane, width, height);
>> -	igt_plane_set_position(plane, 0, 0);
>> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>> -	igt_plane_set_rotation(plane, rot);
>> -	igt_display_commit2(display, COMMIT_ATOMIC);
>> +	commit_ret = try_commit_with_fb_size(width, height, rot, display,
>> +                                            d, plane, mode);
>> +
>> +	if(commit_ret == -ERANGE) {
>> +		igt_debug("Scaling for %dx%d plane not supported, trying scale factor of 4x\n", width, height);
>> +		width = height = mode->vdisplay / 4;
>> +		commit_ret = try_commit_with_fb_size(width, height, rot, display,
>> +                                                    d, plane, mode);
>> +	}
>> +
>> +	if (commit_ret == -ERANGE) {
>> +		igt_debug("Scale factor of 4x (or scaling in general) not supported, trying unity scale\n");
>> +		width = mode->hdisplay;
>> +		height = mode->vdisplay;
>> +		commit_ret = try_commit_with_fb_size(width, height, rot, display,
>> +                                                    d, plane, mode);
>> +	}
>>   
>> -	igt_plane_set_fb(plane, NULL);
>>   	igt_plane_set_position(plane, 0, 0);
>> +	igt_assert_eq(commit_ret, 0);
>>   }
>>   
>>   static const igt_rotation_t rotations[] = {
>> -- 
>> 2.34.1
>>
