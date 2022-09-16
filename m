Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6392310ECF2
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Sep 2022 08:27:37 +0000 (UTC)
Date: Fri, 16 Sep 2022 11:27:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@chromium.org>
Message-ID: <YyQzdTqNj1ijGN4H@intel.com>
References: <20220914225800.3850-1-quic_jesszhan@quicinc.com>
 <f3ffbe22-8054-e51b-5aef-c2d30bd4f767@gmail.com>
 <CAJs_Fx7LWKbzcpKmhQSnbh4iNhq56-0CVz4o2zczyaorWGDF1w@mail.gmail.com>
 <104f2005-e3a0-983b-eb27-c14ce0395642@gmail.com>
 <CAJs_Fx5gvChLk=EBF8YcYO6ZtDBwwKXBnty_Q4prQbfQi3XprA@mail.gmail.com>
 <91567df0-47a5-b665-eb5c-0074c21e776f@gmail.com>
 <CAJs_Fx71h9CmLXcR4niw0Lq33gm6ZykWM6kJG-_z-TWMJ1fX4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJs_Fx71h9CmLXcR4niw0Lq33gm6ZykWM6kJG-_z-TWMJ1fX4w@mail.gmail.com>
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

On Thu, Sep 15, 2022 at 02:17:40PM -0700, Rob Clark wrote:
> On Thu, Sep 15, 2022 at 1:13 PM Juha-Pekka Heikkila
> <juhapekka.heikkila@gmail.com> wrote:
> >
> > On 15.9.2022 22.38, Rob Clark wrote:
> > > On Thu, Sep 15, 2022 at 12:16 PM Juha-Pekka Heikkila
> > > <juhapekka.heikkila@gmail.com> wrote:
> > >>
> > >> On 15.9.2022 21.39, Rob Clark wrote:
> > >>> On Thu, Sep 15, 2022 at 11:02 AM Juha-Pekka Heikkila
> > >>> <juhapekka.heikkila@gmail.com> wrote:
> > >>>>
> > >>>> Hi Jessica,
> > >>>>
> > >>>> On 15.9.2022 1.58, Jessica Zhang wrote:
> > >>>>> Wait an extra vblank for legacy cursor ioctl to finish.
> > >>>>>
> > >>>>> Extra vblank wait is needed for both HW and SW test as the legacy cursor
> > >>>>> ioctl is called in both cases.
> > >>>>>
> > >>>>> Based on Rob's patch [1] and, similarly, fixes flaky results on MSM.
> > >>>>>
> > >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > >>>>>
> > >>>>> [1] https://patchwork.freedesktop.org/series/105999/
> > >>>>> ---
> > >>>>>     tests/kms_cursor_crc.c | 8 ++++----
> > >>>>>     1 file changed, 4 insertions(+), 4 deletions(-)
> > >>>>>
> > >>>>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > >>>>> index 53f18f4f1add..272dcb7fa0a4 100644
> > >>>>> --- a/tests/kms_cursor_crc.c
> > >>>>> +++ b/tests/kms_cursor_crc.c
> > >>>>> @@ -202,8 +202,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
> > >>>>>                 igt_display_commit(display);
> > >>>>>
> > >>>>>                 /* Extra vblank wait is because nonblocking cursor ioctl */
> > >>>>> -             igt_wait_for_vblank(data->drm_fd,
> > >>>>> -                             display->pipes[data->pipe].crtc_offset);
> > >>>>> +             igt_wait_for_vblank_count(data->drm_fd,
> > >>>>> +                             display->pipes[data->pipe].crtc_offset, 2);
> > >>>>
> > >>>> It will take more than one frame on your target device for non blocking
> > >>>> cursor commit to settle? This cannot be right, even if this somehow was
> > >>>> the case you are breaking this test for everyone else.
> > >>>
> > >>> It is possible, depending on timing, kthread scheduling, etc, for a
> > >>> legacy cursor to end up getting applied to the next frame.
> > >>
> > >> I assume there's not many heavy tasks running on test machines. Let's
> > >> not forget we're talking about non blocking commit, what you above
> > >> listed could cause is you'd accidentally actually get that extra frame
> > >> for cursor to settle.
> > >>
> > >>>
> > >>> How is this breaking the test for anyone else?
> > >>
> > >> When testing non blocking commit it is that frame where we know changes
> > >> should be present which is interesting. Otherwise we can wait even full
> > >> five frames just to be on safe side to let cursor show up.
> > >
> > > IMO, this is the legay cursor API we are talking about.. on the driver
> > > side I prioritize not having fps drops over frame exactness, which
> > > means that sometimes a cursor updates misses the frame.  If userspace
> > > wants frame-exact cursor updates, it should be using the atomic ioctl,
> > > as the behaviour there is well (and sanely) specified.  So waiting
> > > extra frames is fine, otherwise this test will be too flakey to run in
> > > CI.
> >
> > This test has been working just fine on all other hw hence you will need
> > to show more than your opinion.
> 
> "It works fine on other hw" is not a valid defence of a horrible,
> underspecified, legacy api, or some behavior of that API which a test
> imagined it should exercise ;-)

You're right that the uapi is poorly specified. I think all the
original x86 drivers just bashed the cursor registers directly
from ioctl and thus either got a tearing or mailbox style update
depending on how the hardware worked. Both of which should work
fine with the way the test is written. One could argue that was
the defacto spec for the uapi since that's how all the drivers
worked when the uapi was introduced.

I presume your hw has one of those annoying commit bits that
once locked in can't be undone? And you then schedule the
actual hw commit to happen very close to vblank to work
around that? And sometimes that scheduled thing misses the
current vblank but the ioctl already exited before the
current vblank? I suppose doing vblank evasion when you
do the scheduling would cure it, but that does seem quite
a bit of work for something that's not well specified,
at least if you don't already have a vblank evasion thing
hooked up for something else.

So I guess changing the test might be somewhat reasonable,
the other option would be to just to not run that test on
you hw. But I guess some aspects of the test are still
interesting for you and thus you actually want to run it?

What I don't really like is making the test more forgiving
for drivers that should not need it because that opens the
door for regressions to slip in. Another problem is that
this makes the test slower (how much I dunno since the commit
message didn't have any numbers). For CI purposes we really
don't want tests to take any more time than they have to.

-- 
Ville Syrjälä
Intel
