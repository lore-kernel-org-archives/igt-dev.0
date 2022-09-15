Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B9D10EBE5
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 21:17:48 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id e187so23433382ybh.10
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 14:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220914225800.3850-1-quic_jesszhan@quicinc.com>
 <f3ffbe22-8054-e51b-5aef-c2d30bd4f767@gmail.com>
 <CAJs_Fx7LWKbzcpKmhQSnbh4iNhq56-0CVz4o2zczyaorWGDF1w@mail.gmail.com>
 <104f2005-e3a0-983b-eb27-c14ce0395642@gmail.com>
 <CAJs_Fx5gvChLk=EBF8YcYO6ZtDBwwKXBnty_Q4prQbfQi3XprA@mail.gmail.com>
 <91567df0-47a5-b665-eb5c-0074c21e776f@gmail.com>
In-Reply-To: <91567df0-47a5-b665-eb5c-0074c21e776f@gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 15 Sep 2022 14:17:40 -0700
Message-ID: <CAJs_Fx71h9CmLXcR4niw0Lq33gm6ZykWM6kJG-_z-TWMJ1fX4w@mail.gmail.com>
To: juhapekka.heikkila@gmail.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_cursor_crc: Wait extra
 vblank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 15, 2022 at 1:13 PM Juha-Pekka Heikkila
<juhapekka.heikkila@gmail.com> wrote:
>
> On 15.9.2022 22.38, Rob Clark wrote:
> > On Thu, Sep 15, 2022 at 12:16 PM Juha-Pekka Heikkila
> > <juhapekka.heikkila@gmail.com> wrote:
> >>
> >> On 15.9.2022 21.39, Rob Clark wrote:
> >>> On Thu, Sep 15, 2022 at 11:02 AM Juha-Pekka Heikkila
> >>> <juhapekka.heikkila@gmail.com> wrote:
> >>>>
> >>>> Hi Jessica,
> >>>>
> >>>> On 15.9.2022 1.58, Jessica Zhang wrote:
> >>>>> Wait an extra vblank for legacy cursor ioctl to finish.
> >>>>>
> >>>>> Extra vblank wait is needed for both HW and SW test as the legacy cursor
> >>>>> ioctl is called in both cases.
> >>>>>
> >>>>> Based on Rob's patch [1] and, similarly, fixes flaky results on MSM.
> >>>>>
> >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>>
> >>>>> [1] https://patchwork.freedesktop.org/series/105999/
> >>>>> ---
> >>>>>     tests/kms_cursor_crc.c | 8 ++++----
> >>>>>     1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> >>>>> index 53f18f4f1add..272dcb7fa0a4 100644
> >>>>> --- a/tests/kms_cursor_crc.c
> >>>>> +++ b/tests/kms_cursor_crc.c
> >>>>> @@ -202,8 +202,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
> >>>>>                 igt_display_commit(display);
> >>>>>
> >>>>>                 /* Extra vblank wait is because nonblocking cursor ioctl */
> >>>>> -             igt_wait_for_vblank(data->drm_fd,
> >>>>> -                             display->pipes[data->pipe].crtc_offset);
> >>>>> +             igt_wait_for_vblank_count(data->drm_fd,
> >>>>> +                             display->pipes[data->pipe].crtc_offset, 2);
> >>>>
> >>>> It will take more than one frame on your target device for non blocking
> >>>> cursor commit to settle? This cannot be right, even if this somehow was
> >>>> the case you are breaking this test for everyone else.
> >>>
> >>> It is possible, depending on timing, kthread scheduling, etc, for a
> >>> legacy cursor to end up getting applied to the next frame.
> >>
> >> I assume there's not many heavy tasks running on test machines. Let's
> >> not forget we're talking about non blocking commit, what you above
> >> listed could cause is you'd accidentally actually get that extra frame
> >> for cursor to settle.
> >>
> >>>
> >>> How is this breaking the test for anyone else?
> >>
> >> When testing non blocking commit it is that frame where we know changes
> >> should be present which is interesting. Otherwise we can wait even full
> >> five frames just to be on safe side to let cursor show up.
> >
> > IMO, this is the legay cursor API we are talking about.. on the driver
> > side I prioritize not having fps drops over frame exactness, which
> > means that sometimes a cursor updates misses the frame.  If userspace
> > wants frame-exact cursor updates, it should be using the atomic ioctl,
> > as the behaviour there is well (and sanely) specified.  So waiting
> > extra frames is fine, otherwise this test will be too flakey to run in
> > CI.
>
> This test has been working just fine on all other hw hence you will need
> to show more than your opinion.

"It works fine on other hw" is not a valid defence of a horrible,
underspecified, legacy api, or some behavior of that API which a test
imagined it should exercise ;-)

> To me it look like your driver is broken
> and you are wanting this test to pass at any cause hence fix test to
> accept faulty behavior. This test _is_ crc test so frame exactness is
> expected starting from the test name.

The driver could be made to have frame exact cursor updates at the
cost of fps drops whenever there are cursor updates.  Which is not an
acceptable solution.

Unfortunately this is a legacy API and we need to deal with userspace
which still uses it.  But I can't find anywhere in the kernel or
commits which added the cursor interface any guarantee of frame
exactness.  In fact on hw which allows you to update the cursor
mid-frame, it is by *definition* not frame-exact!

So, sorry, this is a test problem, not a driver problem.

BR,
-R

>
> /Juha-Pekka
>
> >>
> >>>>>
> >>>>>                 igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
> >>>>>
> >>>>> @@ -243,8 +243,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
> >>>>>                 igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
> >>>>>
> >>>>>                 igt_display_commit(display);
> >>>>> -             igt_wait_for_vblank(data->drm_fd,
> >>>>> -                             display->pipes[data->pipe].crtc_offset);
> >>>>> +             igt_wait_for_vblank_count(data->drm_fd,
> >>>>> +                             display->pipes[data->pipe].crtc_offset, 2);
> >>>>
> >>>> This change make even less sense to me than above. There's nothing
> >>>> cursor plane related on this part of test. You are saying flipping
> >>>> normal framebuffers on non cursor plane take also more than one frame on
> >>>> your target device? It sound like vblank counting is somehow broken on
> >>>> your target device if these changes together fix something.
> >>>>
> >>>> /Juha-Pekka
> >>>>
> >>>>>
> >>>>>                 igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
> >>>>>                 igt_assert_crc_equal(&crc, hwcrc);
> >>>>
> >>
>
