Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194C510E64F
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 17:22:40 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id q4so11618692plr.11
 for <igt-dev@lists.freedesktop.org>; Mon, 09 May 2022 10:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220506181432.165-1-quic_jesszhan@quicinc.com>
 <20220506181432.165-3-quic_jesszhan@quicinc.com>
 <Ynjad7oekC6FiUe8@platvala-desk.ger.corp.intel.com>
 <68ecb2ec-d5c3-f079-92b2-819d7e8f9096@quicinc.com>
In-Reply-To: <68ecb2ec-d5c3-f079-92b2-819d7e8f9096@quicinc.com>
From: Rob Clark <robdclark@chromium.org>
Date: Mon, 9 May 2022 10:22:28 -0700
Message-ID: <CAJs_Fx6XvWaZJg8X3zaT_V48CsJQLd+hLi4BTuS_B1zY3EyKhQ@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t v1 2/3] tests/kms_universal_plane: Use
 igt_get_assigned_primary to get the primary plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 9, 2022 at 9:30 AM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 5/9/2022 2:10 AM, Petri Latvala wrote:
> > On Fri, May 06, 2022 at 11:14:31AM -0700, Jessica Zhang wrote:
> >> Currently, pageflip_test_pipe will use igt_output_get_plane_type to get
> >> the primary plane of the pipe and assumes that the primary plane marked
> >> by the driver will also be used by drmModePageFlip to perform the page flip.
> >>
> >> This is not necessarily true in cases where there are multiple possible
> >> primary planes.
> >>
> >> To fix this, let's use igt_get_assigned_primary to get the primary plane
> >> instead.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   tests/kms_universal_plane.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> >> index 3cb6d704a6ef..7bd2c667b552 100644
> >> --- a/tests/kms_universal_plane.c
> >> +++ b/tests/kms_universal_plane.c
> >> @@ -483,7 +483,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> >>
> >>      pageflip_test_init(&test, output, pipe);
> >>
> >> -    primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> >> +    primary = igt_get_assigned_primary(output, &data->display.pipes[pipe]);
> >
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7059/shard-glk6/igt@kms_rotation_crc@primary-rotation-270.html
> >
> > The setcrtc call is getting ENOSPC there. Doing that unconditionally
> > is a no-go, and needs to be handled somehow cleanly.
> >
> > Check in igt_get_assigned_primary that there's multiple primary
> > planes? Check that in init and store that info in igt_output_t or
> > igt_pipe_t? Check for msm device specifically (I don't like this, but
> > it's the option if all else is unclean)?
>
> I see... The best option might be to check during init then storing it
> in igt_pipe_t.

Perhaps check if the CRTC is already enabled before doing the SETCRTC?
 I guess the test that is hitting the failure already has the CRTC
enabled?

BR,
-R

> Thanks,
>
> Jessica Zhang
>
> >
> >
> > --
> > Petri Latvala
