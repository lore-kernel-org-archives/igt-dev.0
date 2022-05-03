Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E04910F7A6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 May 2022 03:36:16 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso992861pjj.2
 for <igt-dev@lists.freedesktop.org>; Mon, 02 May 2022 20:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220429011117.147-1-quic_jesszhan@quicinc.com>
 <CAJs_Fx7ccyWrdnCDMM8Ayj-jwOZ6BLgAM9hsXk2r+9QHD_gjqw@mail.gmail.com>
 <054e3a77-fbfd-1526-088b-18cd120a0c7d@quicinc.com>
 <CAJs_Fx7x4a+hsmrpSa9Cx8bm7b9oRKRs_Nup7PyA4vvSS=ipeA@mail.gmail.com>
 <90da386d-d1d0-8205-d82f-c1b2ade4d77a@quicinc.com>
In-Reply-To: <90da386d-d1d0-8205-d82f-c1b2ade4d77a@quicinc.com>
From: Rob Clark <robdclark@chromium.org>
Date: Mon, 2 May 2022 20:36:03 -0700
Message-ID: <CAJs_Fx45iU9V=z57pCiSWd7pdyoMWV28Q9-2O=LkOqyyn7uPFg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_universal_plane: Skip
 pageflip_test_pipe subtest if pipe has more than 1 primary plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 2, 2022 at 4:08 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/2/2022 3:42 PM, Rob Clark wrote:
> > On Mon, May 2, 2022 at 3:31 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/2/2022 2:50 PM, Rob Clark wrote:
> >>> On Thu, Apr 28, 2022 at 6:11 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >>>>
> >>>> Currently, IGT assumes that the first primary plane it encounters in
> >>>> display->planes is the primary plane being assigned to the current pipe
> >>>> in the driver [1]. However, this is not always the case when planes are
> >>>> being shared between pipes and there are multiple possible primary
> >>>> planes.
> >>>
> >>> I wonder if it is actually worse than that.. igt_pipe_t seems designed
> >>> around the idea that CRTCs have exclusive ownership of planes.  Not
> >>> sure if there are any tests that drive multiple CRTCs at the same
> >>> time, which could end up trying to use the same plane on multiple
> >>> pipes..
> >>>
> >>> BR,
> >>> -R
> >> Yep, there are at least a few cases in kms_atomic_transition where, with
> >> DP connected, IGT will try to do a commit for 2 CRTCs within the same
> >> commit [1]. Planning to submit a patch addressing that after we sort out
> >> the shared planes-related failures for the no DP case.
> >
> > Ok.. then perhaps until igt handles planes that can move between CRTCs
> > better, we should statically assign planes to no more than a single
> > pipe in igt_display_require()?  I _think_ that would solve both
> > issues..
> >
> > BR,
> > -R
>
> There are two concerns / issues with this:
>
> 1) How would we know which planes to assign to which pipe?
> Today we use possible_crtcs and both the crtcs are listed for the plane
> in the possible_crtcs.
>
> 2) Even if we assign one of the primary planes like IGT does today, we
> do not know if whatever we picked is what was selected even in the driver.
>
> The only way to reliably do this is if driver exposes something like
> "primary_plane_id" in the drm_mode_crtc?

no, I don't think we need new uabi for this.. just for igl to assign
planes to pipes in a sort of round-robin fashion.

BR,
-R

> 111 struct drm_mode_crtc {
> 112     __u64 set_connectors_ptr;
> 113     __u32 count_connectors;
> 114
> 115     __u32 crtc_id; /**< Id */
> 116     __u32 fb_id; /**< Id of framebuffer */
> 117
> 118     __u32 x, y; /**< Position on the frameuffer */
> 119
> 120     __u32 gamma_size;
> 121     __u32 mode_valid;
> 122     struct drm_mode_modeinfo mode;
> 123 };
>
> >
> >> (BTW, to elaborate some more on the issue we were facing with this
> >> subtest on trogdor: an -EBUSY was being thrown from the page flip ioctl
> >> [2] because we were assigning an fb to an unused primary plane.)
> >>
> >> Best,
> >>
> >> Jessica Zhang
> >>
> >> [1]
> >> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_atomic_transition.c#L709
> >> (note: `mask` in this method is a mask for which CRTC to commit to, and
> >> with DP connected it can go up to 3)
> >>
> >> [2]
> >> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/ed944b45563c694dc6373bc48dc83b8ba7edb19f
> >>
> >>>
> >>>> It's possible for IGT to set pipe->plane_primary to a primary plane
> >>>> that's different from the one being used in the driver, since IGT uses
> >>>> possible_crtcs to find the primary planes and stops at the first match.
> >>>>
> >>>> Unfortunately, DRM doesn't expose which primary plane is being used by a
> >>>> pipe, so let's skip pageflip_test_pipe for cases where there are
> >>>> multiple possible primary planes.
> >>>>
> >>>> [1]
> >>>> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_kms.c#L2305
> >>>>
> >>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>> ---
> >>>>    tests/kms_universal_plane.c | 14 +++++++++++++-
> >>>>    1 file changed, 13 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> >>>> index 3cb6d704a6ef..95cae2be1aaf 100644
> >>>> --- a/tests/kms_universal_plane.c
> >>>> +++ b/tests/kms_universal_plane.c
> >>>> @@ -470,13 +470,25 @@ static void
> >>>>    pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> >>>>    {
> >>>>           pageflip_test_t test = { .data = data };
> >>>> -       igt_plane_t *primary;
> >>>> +       igt_plane_t *primary, *plane;
> >>>>           struct timeval timeout = { .tv_sec = 0, .tv_usec = 500 };
> >>>>           drmEventContext evctx = { .version = 2 };
> >>>>
> >>>>           fd_set fds;
> >>>> +       int primary_plane_count = 0;
> >>>>           int ret = 0;
> >>>>
> >>>> +       for_each_plane_on_pipe(&data->display, pipe, plane)
> >>>> +               if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> >>>> +                       primary_plane_count++;
> >>>> +
> >>>> +       /*
> >>>> +        * Skip subtest when there are multiple primary planes since we
> >>>> +        * aren't able to distinguish which primary plane is actually being
> >>>> +        * assigned a pipe
> >>>> +        */
> >>>> +       igt_skip_on(primary_plane_count > 1);
> >>>> +
> >>>>           igt_require_pipe(&data->display, pipe);
> >>>>
> >>>>           igt_output_set_pipe(output, pipe);
> >>>> --
> >>>> 2.31.0
> >>>>
