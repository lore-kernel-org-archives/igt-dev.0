Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751646F8CD
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 17:32:22 +0000 (UTC)
Message-ID: <0cd76268-05fe-9dfc-aa44-36f8425c3dce@quicinc.com>
Date: Wed, 8 Dec 2021 09:32:20 -0800
MIME-Version: 1.0
Content-Language: en-US
References: <20211204034919.14779-1-quic_jesszhan@quicinc.com>
 <YbC72sTvptdtvFWs@platvala-desk.ger.corp.intel.com>
 <cbc3485c-61ae-87d0-517b-dce74747c97a@quicinc.com>
 <YbDmaN56Dgn/z6BL@platvala-desk.ger.corp.intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <YbDmaN56Dgn/z6BL@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Increase
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



On 12/8/2021 9:07 AM, Petri Latvala wrote:
> On Wed, Dec 08, 2021 at 08:56:03AM -0800, Jessica Zhang wrote:
>> Hi Petri,
>>
>> On 12/8/2021 6:06 AM, Petri Latvala wrote:
>>> On Fri, Dec 03, 2021 at 07:49:19PM -0800, Jessica Zhang wrote:
>>>> Catch edge cases where driver doesn't support larger scale factors or
>>>> pipe doesn't support scaling.
>>>>
>>>> Currently, a 20x20 framebuffer is passed in to be upscaled. However,
>>>> this will cause issues with other drivers as they may not support larger
>>>> scale factors or may not support scaling at all for certain planes.
>>>>
>>>> This avoids failures due to invalid scale factor by trying
>>>> the original 20x20 framebuffer commit, then trying to commit larger
>>>> framebuffers up to and including unity scale.
>>>>
>>>> Tested-on: Qualcomm RB5 (sdm845)
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>    tests/kms_plane_scaling.c | 52 ++++++++++++++++++++++++++++++---------
>>>>    1 file changed, 41 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>>>> index 85db11ee..1f0143fc 100644
>>>> --- a/tests/kms_plane_scaling.c
>>>> +++ b/tests/kms_plane_scaling.c
>>>> @@ -1,5 +1,6 @@
>>>>    /*
>>>>     * Copyright © 2013,2014 Intel Corporation
>>>> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     *
>>>>     * Permission is hereby granted, free of charge, to any person obtaining a
>>>>     * copy of this software and associated documentation files (the "Software"),
>>>> @@ -118,6 +119,30 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
>>>>    	igt_display_commit2(display, COMMIT_ATOMIC);
>>>>    }
>>>> +static int try_commit_with_fb_size(int width, int height, igt_rotation_t rot, igt_display_t *display, data_t *d, igt_plane_t *plane, drmModeModeInfo *mode)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	cleanup_crtc(d);
>>>> +
>>>> +	/* Check min to full resolution upscaling */
>>>> +	igt_fb_set_position(&d->fb[0], plane, 0, 0);
>>>> +	igt_fb_set_size(&d->fb[0], plane, width, height);
>>>> +	igt_plane_set_position(plane, 0, 0);
>>>> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>>> +	igt_plane_set_rotation(plane, rot);
>>>> +
>>>> +	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>>>> +
>>>> +	if (!ret) {
>>>> +		igt_display_commit2(display, COMMIT_ATOMIC);
>>>> +		igt_plane_set_fb(plane, NULL);
>>>> +		igt_plane_set_position(plane, 0, 0);
>>>
>>> I don't understand what's done here. If doing a commit fails, do the
>>> commit again?
>>>
>> In this method, we'll test if a commit will go through with a specific
>> framebuffer (without actually doing the commit) using
>> `igt_display_try_commit2()`.
> 
> But igt_display_try_commit2() will perform the commit. The only
> difference to igt_display_commit2() is whether the error is asserted
> or just returned.
> 
Got it, I see your point now. Will remove the `igt_display_commit2()` call.

Thanks,
Jessica Zhang
> 
