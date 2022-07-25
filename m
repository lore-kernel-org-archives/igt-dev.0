Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E7910E0C3
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Jul 2022 23:08:13 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b26so17957679wrc.2
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Jul 2022 16:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211210172006.28654-1-quic_jesszhan@quicinc.com>
 <YbyHtDTnWqD9e3QR@intel.com>
In-Reply-To: <YbyHtDTnWqD9e3QR@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 25 Jul 2022 16:07:59 -0700
Message-ID: <CAF6AEGs7P-e1FT+0topYxEyYnF_nkWMCwktEQtTfynKDkOZN+Q@mail.gmail.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: Remove vblank
 counter check immediately after flip_nonblocking
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, quic_khsieh@quicinc.com, swboyd@chromium.org,
 igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org,
 aravindh@codeaurora.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 17, 2021 at 4:51 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Dec 10, 2021 at 09:20:06AM -0800, Jessica Zhang wrote:
> > Currently, there is a check that the vblank counter shouldn't change af=
ter
> > a nonblocking page flip and DRM_IOCTL_MODE_CURSOR call. This assumes
> > that ioctl is performed before the commit from the nonblocking flip is
> > dequeued.
> >
> > The DRM_IOCTL_MODE_CURSOR callstack is as such:
> >       drm_mode_cursor_ioctl
> >       drm_mode_cursor_common
> >       drm_mode_cursor_universal
> >       __setplane_atomic
> >       drm_atomic_helper_update_plane
> >       drm_atomic_commit
> >
> > Becuase the commit work queue is scheduled earlier than
> > DRM_CURSOR_IOCTL, it will finish before the ioctl. Thus, we can't
> > assume that the current vblank count will match vblank_start after the
> > cursor ioctl finishes.
>
> Your driver is broken. The legacy cursor ioctl is expected to
> not get stuck behind the page flip.

Well, perhaps the atomic helpers are broken in that case?  But I don't
really agree that the legacy cursor was *that* well defined that we
can call this a driver bug.

What I'd propose instead is to do reverse the order of the pageflip
and cursor updates, so the cursor updates don't get stuck behind the
pageflip.

BR,
-R

>
> >
> > Tested-on: Chromebook Lazor (Trogdor)
> >
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  tests/kms_cursor_legacy.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > index d50155e8..82c01bc8 100644
> > --- a/tests/kms_cursor_legacy.c
> > +++ b/tests/kms_cursor_legacy.c
> > @@ -1307,8 +1307,6 @@ static void flip_vs_cursor_crc(igt_display_t *dis=
play, bool atomic)
> >               flip_nonblocking(display, pipe, atomic, &fb_info, NULL);
> >               do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i])=
;
> >
> > -             igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0=
), vblank_start);
> > -
> >               igt_set_timeout(1, "Stuck page flip");
> >               igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)))=
;
> >               igt_reset_timeout();
> > --
> > 2.31.0
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
