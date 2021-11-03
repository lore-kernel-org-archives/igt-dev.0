Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCF47360A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Nov 2021 14:59:13 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id e2so4262181ljg.13
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Nov 2021 07:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211101163730.2769897-1-markyacoub@chromium.org>
 <YYJcN4//SrpOwoJg@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YYJcN4//SrpOwoJg@platvala-desk.ger.corp.intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 3 Nov 2021 10:59:00 -0400
Message-ID: <CAJUqKUpv+xkrCvMecPhuFUuPo4FMgWeynzov_S4qALP1Hinnnw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests/kms_cursor_legacy: igt_require_pipe_crc
 for flip_vs_cursor_crc
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
Cc: chunkuang.hu@kernel.org, igt-dev@lists.freedesktop.org, seanpaul@chromium.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 3, 2021 at 5:55 AM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Mon, Nov 01, 2021 at 12:37:30PM -0400, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > test_init uses CRC in debugfs which is not supported by some drivers.
> >
> > [How]
> > igt_require_pipe_crc before igt_pipe_crc_new is called.
> >
> > Test: igt@kms_cursor_legacy@flip-vs-cursor-crc-{atomic,legacy} on
> > ChromeOS Jacuzzi (MTK)
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  tests/kms_cursor_legacy.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > index 81362807..b006e566 100644
> > --- a/tests/kms_cursor_legacy.c
> > +++ b/tests/kms_cursor_legacy.c
> > @@ -1281,6 +1281,7 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
> >
> >       igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> >
> > +     igt_require_pipe_crc(display->drm_fd);
> >       pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
>
> These requirement checks should be done before doing anything to the
> system state, even from the context lines of this diff I see a commit
> being done. So this require call should be at the very beginning of
> this function, or in the igt_subtest() block, or in an igt_fixture
> preferrably.
>
> What about flip_vs_cursor_busy_crc?
>
> flip_vs_cursor_crc and flip_vs_cursor_busy_crc are both called in neat
> subtest groups already so I suppose the most elegant solution for both
> is to add
>
> igt_fixture {
>   igt_require_pipe_crc(display.drm_fd);
> }
Thanks for the tip. Done!
>
> to the beginning of both those groups.
>
>
> --
> Petri Latvala
