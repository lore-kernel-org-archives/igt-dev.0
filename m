Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BEC88A36
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 19:17:34 +0000 (UTC)
References: <20190128154211.19558-1-nicholas.kazlauskas@amd.com>
 <CAKMK7uEhtWP3En4seViodQ+cigt0nQJf3bP=w+0=gvLRY3-2+Q@mail.gmail.com>
 <e9f40cc9-bef5-ba19-7184-76da30f86c76@amd.com>
 <CAKMK7uEdXyuKyBvHRBPC4CrjxkoMWTNUOc4YKooE=khxQLfMfg@mail.gmail.com>
From: Harry Wentland <hwentlan@amd.com>
Message-ID: <b94124c2-3aab-984b-5d6d-968fdbb96f0d@amd.com>
Date: Tue, 14 Apr 2020 15:17:20 -0400
In-Reply-To: <CAKMK7uEdXyuKyBvHRBPC4CrjxkoMWTNUOc4YKooE=khxQLfMfg@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests: Add variable refresh rate
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2020-04-14 2:50 p.m., Daniel Vetter wrote:
> On Tue, Apr 14, 2020 at 3:00 PM Kazlauskas, Nicholas
> <nicholas.kazlauskas@amd.com> wrote:
>>
>> On 2020-04-14 6:52 a.m., Daniel Vetter wrote:
>>>> +/* Performs an asynchronous non-blocking page-flip on a pipe. */
>>>> +static int
>>>> +do_flip(data_t *data, enum pipe pipe_id, igt_fb_t *fb)
>>>> +{
>>>> +       igt_pipe_t *pipe = &data->display.pipes[pipe_id];
>>>> +       int ret;
>>>> +
>>>> +       igt_set_timeout(1, "Scheduling page flip\n");
>>>> +
>>>> +       /*
>>>> +        * Only the legacy flip ioctl supports async flips.
>>>> +        * It's also non-blocking, but returns -EBUSY if flipping too fast.
>>>> +        * 2x monitor tests will need async flips in the atomic API.
>>>> +        */
>>>
>>> Uh, if this is also how your amdgpu userspace works we've just fucked
>>> up the uapi for good :-/
>>>
>>> FLIP_ASYNC = please tear
>>>
>>> VRR = please don't strictly obey the vrefresh, but very much dont tear
>>>
>>> Tying them together means we're deeply mixing things up.
>>>
>>> Also amdgpu is still using it's own flip implementation, which makes
>>> me wonder whether VRR would even work with atomic, or whether that's
>>> also butchered ...
>>>
>>> How I thought this stuff was supposed to work:
>>>
>>> - VRR_ENABLED controls whether we do VRR
>>> - since atomic is awesome you can change that on every frame
>>> - VRR has nothing to do with ASYNC
>>>
>>> So a) do I read this correctly b) how do we get out of this hole (and
>>> maybe c) amdgpu really needs to remove
>>> amdgpu_display_crtc_page_flip_target asap).
>>>
>>> Manasi pointed this out to me, so adding a few more people here.
>>> -Daniel
>>
>> Adaptive sync is an extended front porch that ends upon some signaling
>> from the driver is almost always tied to a page flip.
>>
>> FLIP_ASYNC is a mechanism to flip immediately without waiting for any
>> double buffering from the driver or hardware, potentially causing tearing.
>>
>> This test uses FLIP_ASYNC to precisely position when the flip occurs
>> from userspace within the VBLANK to end the frame at the midpoint
>> between the min and max range.
>>
>> But it doesn't really need to be FLIP_ASYNC to make this work, explicit
>> fencing is probably the better solution here for all drivers.
> 
> Ok, I freaked out for a bit there, and reading amdgpu DC code didn't
> really help with convincing me it's not needed - you're still using
> your own page_flip_target handler instead of the one in the helpers
> (written by amd people even, and for a few features before VRR), so
> biggest worry I had was that VRR doesn't work without FLIP_ASYNC set.
> I also looked at -amdgpu code, but I couldn't figure this out one way
> or another there either (since that's not using atomic either).
> 
>> This test only really worked by accident for testing amdgpu. We have
>> internal stalls in the driver to prevent an immediate flip from
>> occurring more than once per frame, so if you try to flip in the
>> extended front porch you end up hitting that stall and the returned
>> timestamp is a frame ahead.
>>
>> The other part of this test that's sort of an issue is that this is
>> effectively a measurement for how fast you can immediate flip - which is
>> good for catching performance regressions in the driver, and good for
>> consistent VRR behavior, but not exactly related to the test.
> 
> Hm yeah I think that's another reason for why this test should maybe
> use atomic with vgem dma_fences that we signal exactly when needed.
> Probably should be a 2nd subtest, so that we can keep the other one
> working.
> 
> Plus update the comment on why exactly FLIP_ASYNC is needed with your
> story above. Btw instead of FLIP_ASYNC could we use the target frame
> number, set to the next frame? That should also allow us to do an
> immediate flip while in the vblank.
> 
> Also I think we should have a normal flip which is somewhat late-ish
> in the vblank, and make sure VRR can still hit that frame. If that
> doesn't exist yet. I think with that set of tests we should be able to
> exercise all the timings we want for VRR?
> 
>> The way FLIP_ASYNC should probably work in amdgpu is:
>>
>> 1) No stalls
>> 2) Return -EBUSY if we're in the middle of a frame already, or even
>> allow the commit to happen in the same frame since the hardware supports it
>>
>> Not sure how userspace is equipped to handle that though.
> 
> I think aside from -amdgpu there's 0 userspace out there using
> FLIP_ASYNC. Plus it's not standardized for atomic drivers, so really
> the semantics are super wobbly. I'm not worried about FLIP_ASYNC
> itself (not the first piece of kms uapi that might be fun to unify
> across drivers), the only thing that worried me is tying VRR into
> FLIP_ASYNC. Looks I worried without reasons since it's just an
> igt/test hack that we can change.
> 

Thanks, Nick, and Daniel, for hashing this out a bit.

I still don't fully understand flip semantics in DRM or where they're
defined.

One thing that is problematic for some use-cases, and I'm not sure if
this is unique to amdgpu, is that a normal atomic flip (not ASYNC) will
wait until HW latches (starts scanning out) the new address before it
returns. This will stall the renderer.

A better approach, and an approach that I understand Windows is taking,
is to return immediately from the driver call after programming the new
address. AMD HW at least will guarantee that this address is scanned out
only on the following frame and won't tear (unless an immediate flip is
explicitly requested). This will let usermode render and flip at a rate
it desires and ensures that only the flip programmed closest to the
start of scanout will be actually scanned out.

Cheers,
Harry

> Thanks for your explanations and all.
> 
> Cheers, Daniel
> 
>>
>> Regards,
>> Nicholas Kazlauskas
>>
>>>
>>>> +       do {
>>>> +               ret = drmModePageFlip(data->drm_fd, pipe->crtc_id,
>>>> +                                     fb->fb_id,
>>>> +                                     DRM_MODE_PAGE_FLIP_EVENT |
>>>> +                                     DRM_MODE_PAGE_FLIP_ASYNC,
>>>> +                                     data);
>>>> +       } while (ret == -EBUSY);
>>>> +
>>>> +       igt_assert_eq(ret, 0);
>>>> +       igt_reset_timeout();
>>>> +
>>>> +       return 0;
>>>> +}
>>
> 
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
