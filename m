Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690053.outbound.protection.outlook.com [40.107.69.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034896E199
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 13:00:13 +0000 (UTC)
References: <20190128154211.19558-1-nicholas.kazlauskas@amd.com>
 <CAKMK7uEhtWP3En4seViodQ+cigt0nQJf3bP=w+0=gvLRY3-2+Q@mail.gmail.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <e9f40cc9-bef5-ba19-7184-76da30f86c76@amd.com>
Date: Tue, 14 Apr 2020 09:00:08 -0400
In-Reply-To: <CAKMK7uEhtWP3En4seViodQ+cigt0nQJf3bP=w+0=gvLRY3-2+Q@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, "Wentland, Harry" <harry.wentland@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-04-14 6:52 a.m., Daniel Vetter wrote:
>> +/* Performs an asynchronous non-blocking page-flip on a pipe. */
>> +static int
>> +do_flip(data_t *data, enum pipe pipe_id, igt_fb_t *fb)
>> +{
>> +       igt_pipe_t *pipe = &data->display.pipes[pipe_id];
>> +       int ret;
>> +
>> +       igt_set_timeout(1, "Scheduling page flip\n");
>> +
>> +       /*
>> +        * Only the legacy flip ioctl supports async flips.
>> +        * It's also non-blocking, but returns -EBUSY if flipping too fast.
>> +        * 2x monitor tests will need async flips in the atomic API.
>> +        */
> 
> Uh, if this is also how your amdgpu userspace works we've just fucked
> up the uapi for good :-/
> 
> FLIP_ASYNC = please tear
> 
> VRR = please don't strictly obey the vrefresh, but very much dont tear
> 
> Tying them together means we're deeply mixing things up.
> 
> Also amdgpu is still using it's own flip implementation, which makes
> me wonder whether VRR would even work with atomic, or whether that's
> also butchered ...
> 
> How I thought this stuff was supposed to work:
> 
> - VRR_ENABLED controls whether we do VRR
> - since atomic is awesome you can change that on every frame
> - VRR has nothing to do with ASYNC
> 
> So a) do I read this correctly b) how do we get out of this hole (and
> maybe c) amdgpu really needs to remove
> amdgpu_display_crtc_page_flip_target asap).
> 
> Manasi pointed this out to me, so adding a few more people here.
> -Daniel

Adaptive sync is an extended front porch that ends upon some signaling 
from the driver is almost always tied to a page flip.

FLIP_ASYNC is a mechanism to flip immediately without waiting for any 
double buffering from the driver or hardware, potentially causing tearing.

This test uses FLIP_ASYNC to precisely position when the flip occurs 
from userspace within the VBLANK to end the frame at the midpoint 
between the min and max range.

But it doesn't really need to be FLIP_ASYNC to make this work, explicit 
fencing is probably the better solution here for all drivers.

This test only really worked by accident for testing amdgpu. We have 
internal stalls in the driver to prevent an immediate flip from 
occurring more than once per frame, so if you try to flip in the 
extended front porch you end up hitting that stall and the returned 
timestamp is a frame ahead.

The other part of this test that's sort of an issue is that this is 
effectively a measurement for how fast you can immediate flip - which is 
good for catching performance regressions in the driver, and good for 
consistent VRR behavior, but not exactly related to the test.

The way FLIP_ASYNC should probably work in amdgpu is:

1) No stalls
2) Return -EBUSY if we're in the middle of a frame already, or even 
allow the commit to happen in the same frame since the hardware supports it

Not sure how userspace is equipped to handle that though.

Regards,
Nicholas Kazlauskas

> 
>> +       do {
>> +               ret = drmModePageFlip(data->drm_fd, pipe->crtc_id,
>> +                                     fb->fb_id,
>> +                                     DRM_MODE_PAGE_FLIP_EVENT |
>> +                                     DRM_MODE_PAGE_FLIP_ASYNC,
>> +                                     data);
>> +       } while (ret == -EBUSY);
>> +
>> +       igt_assert_eq(ret, 0);
>> +       igt_reset_timeout();
>> +
>> +       return 0;
>> +}

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
