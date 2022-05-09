Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16CB10E64F
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 17:21:14 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id l19so17878081ljb.7
 for <igt-dev@lists.freedesktop.org>; Mon, 09 May 2022 10:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220509155045.907053-1-alex.hung@amd.com>
 <CAJUqKUqpD=dseFj9i-h1y=vnA1OXDik--8ySrBw3SeB=1Dn3kg@mail.gmail.com>
 <BYAPR12MB3048F6039FD8D2664C2C48D4F7C69@BYAPR12MB3048.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB3048F6039FD8D2664C2C48D4F7C69@BYAPR12MB3048.namprd12.prod.outlook.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 9 May 2022 13:21:00 -0400
Message-ID: <CAJUqKUp-8OO0rPAcdah39QOXEo=CdLewFhWR5j3_Nm4-S=KbJQ@mail.gmail.com>
To: "Hung, Alex" <Alex.Hung@amd.com>, Sean Paul <sean@poorly.run>,
 Petri Latvala <petri.latvala@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH 1/2 i-g-t][V2] tests/kms_universal_plane: Skip
 off screen universal calls on AMD devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

@Petri and @Sean, what do you think of this case?
Is this something the driver should allow to happen or not necessarily?

On Mon, May 9, 2022 at 12:58 PM Hung, Alex <Alex.Hung@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
>
> I think the idea is to avoid wasting of HW resources when it's not visible to end-users. If the check is removed in driver there will be other errors since the driver is not designed to handle this.
what errors do you see?
>
> If it is not visible to end-users, current AMD driver behaviours are more optimal in IMHO.
Hmm, I'm not sure about this. Not cause I disagree with you, but that
the behavior is not check against in DRM.
I'm not a fan at all if hardware specific code, so if this is a case
that DRM should allow then it should pass on AMD. if it's useless then
the test is pointless.
Deferring to Petri and Sean's judgment.
> ________________________________
> From: Mark Yacoub <markyacoub@chromium.org>
> Sent: 09 May 2022 10:21
> To: Hung, Alex <Alex.Hung@amd.com>
> Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; markyacoub@google.com <markyacoub@google.com>
> Subject: Re: [igt-dev] [PATCH 1/2 i-g-t][V2] tests/kms_universal_plane: Skip off screen universal calls on AMD devices
>
> On Mon, May 9, 2022 at 11:51 AM Alex Hung <alex.hung@amd.com> wrote:
> >
> > amdgpu_dm intentionally blocks planes outside the screen in the function
> > "dm_plane_helper_check_state" and returns -EINVAL. As a results, this
> do you know why it intentionally does that? What happens if you remove
> this check? Maybe AMD shouldn't check for it? I'm thinking that
> ideally we don't want drivers to have special handling when it's not
> needed and for KMS tests to become a standard for userspace.
> > piece of code should be skipped on AMD devices.
> >
> > Signed-off-by: Alex Hung <alex.hung@amd.com>
> > ---
> >  tests/kms_universal_plane.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> >
> > diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> > index 3cb6d704..3a3667e6 100644
> > --- a/tests/kms_universal_plane.c
> > +++ b/tests/kms_universal_plane.c
> > @@ -242,16 +242,18 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> >         igt_display_commit2(display, COMMIT_LEGACY);
> >
> >         /* Step 14: Universal API, set primary completely offscreen (CRC 9) */
> > -       igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> > -                                  output->config.crtc->crtc_id,
> > -                                  test.blue_fb.fb_id, 0,
> > -                                  9000, 9000,
> > -                                  test.mode->hdisplay,
> > -                                  test.mode->vdisplay,
> > -                                  IGT_FIXED(0,0), IGT_FIXED(0,0),
> > -                                  IGT_FIXED(test.mode->hdisplay,0),
> > -                                  IGT_FIXED(test.mode->vdisplay,0)) == 0);
> > -       igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
> > +       if (!is_amdgpu_device(data->drm_fd)) {
> > +               igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> > +                                          output->config.crtc->crtc_id,
> > +                                          test.blue_fb.fb_id, 0,
> > +                                          9000, 9000,
> > +                                          test.mode->hdisplay,
> > +                                          test.mode->vdisplay,
> > +                                          IGT_FIXED(0,0), IGT_FIXED(0,0),
> > +                                          IGT_FIXED(test.mode->hdisplay,0),
> > +                                          IGT_FIXED(test.mode->vdisplay,0)) == 0);
> > +               igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
> > +       }
> >
> >         /*
> >          * Step 15: Explicitly disable primary after it's already been
> > --
> > 2.25.1
> >
