Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2AA6E270
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 19:21:16 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id d16so878822ljq.4
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Sep 2021 12:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210728171616.2242447-1-markyacoub@chromium.org>
 <20210901190609.qrqxasenc4htaota@hatecraft.localdomain>
In-Reply-To: <20210901190609.qrqxasenc4htaota@hatecraft.localdomain>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 1 Sep 2021 15:21:02 -0400
Message-ID: <CAJUqKUpT=HpcAMH955pzF4upt4Fvz4=207xy82kFUTJAZLs1FQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests/kms_flip: Discard any stale event at
 each retry
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arek@hiler.eu>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>, Petri Latvala <petri.latvala@intel.com>, abhinavk@codeaurora.org, Rob Clark <robdclark@chromium.org>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 1, 2021 at 3:06 PM Arkadiusz Hiler <arek@hiler.eu> wrote:
>
> On Wed, Jul 28, 2021 at 01:16:16PM -0400, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > On slower devices, non blocking do_page_flip followed by wait_for_events does not finish fast enough to send an event to be consumed by wait_for_events.
>
> This sentence should be wrapped like the rest of the commit message.
>
> > Instead, wait_for_events ends up finding an unconsumed event from a
> > previous do_page_flip (i.e. a skipped preceding subtest) and signals
> > that the userspace is ready to do another do_page_flip while the first
> > one hasn't finished yet, resulting in an EBUSY.
> >
> > [How]
> > At the beginning of every test running on crtc set, check for any stale
> > events and consume them so the kernel has no pending events.
>
> I am not opposed to this approach, it's nice to know that we can trust
> the state as the test start, but I wonder where and how do we leak those
> pending flips? Have you looked into where those are coming from?
Yeah I spent a fair amount of time debugging this but it's been a
month so I vaguely remember it was cause the first subtest doesn't
finish all the way to the end (can't remember if it was an assertion
or requirement) so it ends early but with an event that's not been
consumed, then comes the second subtest working on top of an
unconsumed event. The bug exists in all devices, but they're probably
fast enough to not run into this case while my test device was slow
and suffered from this.
If you need it, I can debug the code again and report back exactly
what is happening.
>
> > Fixes: flip-vs-suspend and flip-vs-suspend-interruptible.
> > Tested on ChromeOS Volteer(i915-TGL) and Trogdor(msm)
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > Change-Id: I254a84a202140c332312aba1d9edf15ea78b7a61
>
> It would be nice to not include your internal gerrit's Change-Id
> (or discard them upon commit). Those does not mean anything in the
> upstream.
My bad. I added a script that will prevent me from sending a patch if
it has the gerrit ID.
>
> > ---
> >  tests/kms_flip.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> > index f2fce8d2..0a2041c5 100755
> > --- a/tests/kms_flip.c
> > +++ b/tests/kms_flip.c
> > @@ -1261,6 +1261,26 @@ static bool needs_retry_after_link_reset(struct udev_monitor *mon)
> >       return hotplug_detected;
> >  }
> >
> > +static void discard_any_stale_events() {
> > +     fd_set fds;
> > +     FD_ZERO(&fds);
> > +     FD_SET(drm_fd, &fds);
> > +     struct timeval timeout = { .tv_sec = 3, .tv_usec = 0 };
>
> Is the 3s timeout necessary? I can imagine that in a lot of cases this
> will end up being sleep(3), as we don't expect any stale events in a
> normal case. That's a significant time increase if you count all the
> invocations.
>
I don't have a strong reason besides that I used the same
implementation in wait_for_events() which uses 3 seconds for timeout.

> > +     int ret = select(drm_fd + 1, &fds, NULL, NULL, &timeout);
> > +
> > +     if (ret > 0) {
> > +             drmEventContext evctx;
> > +             memset(&evctx, 0, sizeof evctx);
> > +             evctx.version = 2;
> > +             igt_info("Stale Event found - Discarding now\n");
> > +             drmHandleEvent(drm_fd, &evctx);
> > +     }
> > +     else {
> > +             igt_debug("No stale Event found\n");
> > +     }
> > +}
>
> I think it should plural (and lowercase) "events" as it will go through
> all the pending events on that fd.
>
> > +
> > +
> >  static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
> >                                  int crtc_count, int duration_ms)
> >  {
> > @@ -1311,6 +1331,9 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
> >               kmstest_dump_mode(&o->kmode[i]);
> >
> >  retry:
> > +     // Discard any pending event that hasn't been consumed from a previous retry or subtest.
>
> Generally C-style comments (/* bla */) are preferred, but I don't think
> IGT or the kernel coding style explicitly mentions that. Also there are
> occurrences of C++-style comments in the code already. Oh well...
>
Sorry, it's just a habit, my bad.

> All the cosmetic nitpicks can be fixed by me or another committer when
> merging the patch (assuming that you are ok with them), so there's not
> need to resend unless you want to make changes to the actual code.
>
> Cheers,
> Arek
>
Thanks for reviewing!
> > +     discard_any_stale_events();
> > +
> >       memset(&o->vblank_state, 0, sizeof(o->vblank_state));
> >       memset(&o->flip_state, 0, sizeof(o->flip_state));
> >       o->flip_state.name = "flip";
> > --
> > 2.32.0.432.gabb21c7263-goog
