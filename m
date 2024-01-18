Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0A4C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 11:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4CA10E760;
	Thu, 18 Jan 2024 11:19:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C77410E760
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 11:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705576755; x=1737112755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DBT/8xidXsTtPmcsDpLFJWR92KtcxtE58E3uYChCKJ0=;
 b=g5TDcVIkA6UBJ5AAC36lLkUYW0RE6MZ0mqgyCKy599/RzUMjowl8Sb8Z
 UtlEVycuJgxCWifGYZvaT2mh38pAdIssaSWfibIPg+SaGcDScSPVkCpYr
 318pWUZuFCIru/xGwen/OAymgnTZfiy8svbYETPIyBO4TkdVQlPp80NyC
 phYaZDTlNK9Wi4qqFXTU6NJzGphHMJ/eQnyw5+rhDZD6di8fHuu+19llC
 S+qFe6tfQiPOlV0vbufusNoGcnAj7b6kuPbL+7+dfZHSDUVza1UjgOBQq
 cL/hNrB3q44TiwXxI+g0u6PHgEftBh7RNVE4cwd7FrS7dNpzZIQDK3Yhv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="397578694"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="397578694"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 03:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="334835"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 03:19:04 -0800
Date: Thu, 18 Jan 2024 12:18:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/kms_universal_plane: Re-work expectations for
 non-intel hw
Message-ID: <20240118111808.bqzbcknzia564oze@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 juha-pekka.heikkila@intel.com
References: <20240110200434.218120-1-robdclark@gmail.com>
 <20240111133659.xvhekkoisi44vk3f@kamilkon-desk.igk.intel.com>
 <CAF6AEGu4SHNRu0wZ2XZoe-5BZjjiHkZZRT49z_RvyVdvHmaoBA@mail.gmail.com>
 <20240116094251.wyqyhmpdeebrx5sx@kamilkon-desk.igk.intel.com>
 <CAF6AEGss5DgJxGHJjUgaK_mABPxThycqTjmemjFfSAiQvH_nzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGss5DgJxGHJjUgaK_mABPxThycqTjmemjFfSAiQvH_nzQ@mail.gmail.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Rob,
On 2024-01-16 at 07:55:02 -0800, Rob Clark wrote:
> On Tue, Jan 16, 2024 at 1:43 AM Kamil Konieczny
> <kamil.konieczny@linux.intel.com> wrote:
> >
> > Hi Rob,
> > On 2024-01-11 at 09:30:08 -0800, Rob Clark wrote:
> > > On Thu, Jan 11, 2024 at 5:37 AM Kamil Konieczny
> > > <kamil.konieczny@linux.intel.com> wrote:
> > > >
> > > > Hi Rob,
> > > > On 2024-01-10 at 12:04:34 -0800, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > The expectation assumptions do not fit for non-intel hw.  So re-work the
> > > > > expectations and add msm support.
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  tests/kms_universal_plane.c | 102 +++++++++++++++++++++++++-----------
> > > > >  1 file changed, 72 insertions(+), 30 deletions(-)
> > > > >
> > > > > diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> > > > > index 6a39f93cc5aa..3158ff816046 100644
> > > > > --- a/tests/kms_universal_plane.c
> > > > > +++ b/tests/kms_universal_plane.c
> > > > > @@ -402,8 +402,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> > > > >       sanity_test_t test = { .data = data };
> > > > >       igt_plane_t *primary;
> > > > >       drmModeModeInfo *mode;
> > > > > -     int i;
> > > > > -     int expect = 0;
> > > >
> > > > Could you keep this var?
> > > >
> > > > > +     int i, ret;
> > > > >
> > > > >       igt_output_set_pipe(output, pipe);
> > > > >       mode = igt_output_get_mode(output);
> > > > > @@ -418,43 +417,86 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> > > > >
> > > > >       /*
> > > > >        * Try to use universal plane API to set primary plane that
> > > > > -      * doesn't cover CRTC (should fail on pre-gen9 and succeed on
> > > > > -      * gen9+).
> > > > > +      * doesn't cover CRTC.
> > > > >        */
> > > > >       igt_plane_set_fb(primary, &test.undersized_fb);
> > > > > -     if (is_intel_device(data->drm_fd))
> > > > > -             expect = (data->display_ver < 9) ? -EINVAL : 0;
> > > > > -     igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL) == expect);
> > > > > +     ret = igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL);
> > > > > +
> > > > > +     if (is_intel_device(data->drm_fd)) {
> > > > > +             /* should fail on pre-gen9 and succeed on gen9+: */
> > > > > +             if (data->display_ver < 9)
> > > > > +                     igt_assert_eq(ret, -EINVAL);
> > > > > +             else
> > > > > +                     igt_assert_eq(ret, 0);
> > > > > +     } else if (is_msm_device(data->drm_fd)) {
> > > > > +             /* Should be supported on all gens: */
> > > > > +             igt_assert_eq(ret, 0);
> > > > > +     } else {
> > > > > +             igt_assert_eq(ret, 0);
> > > > > +     }
> > > >
> > > > The old code above should work on msm, why do you changed it?
> > >
> > > The reason for this change, and several other similar but (for msm)
> > > non-functionally-changing hunks was to document the expectations for
> > > msm and to give folks working on other drivers a guide about where to
> > > insert their specific expectations.
> > >
> > > The alternative, I think, if we don't want to keep adding driver
> > > specifics is to just change all cases to allow either success or the
> > > correct error code.
> > >
> > > BR,
> > > -R
> > >
> >
> > imho we should leave it as is and introduce changes when they will be
> > needed and keep lines of code low. If someone will have other error
> > it can be instroduced with before:
> >
> > if (is_intel_device(data->drm_fd))
> >   expect = (data->display_ver < 9) ? -EINVAL : 0;
> > else if (is_msm_device(data->drm_fd))
> 
> The problem with (and the reason I removed) the expect variable
> approach is that it can't deal with two possible results.  And short
> of enumerating every single different device, I don't think there is a
> good way to know the exact expected device.  But changing things to
> allow either success or checking for the expected errno would be
> possible.

One rule of thumb is to not touch code that works.
Second is to not to write for future, especially if that
means more code for write and read.

> 
> > As this is display code I will add Juha-Pekka to Cc.
> >
> > > > > -             expect = (data->display_ver < 9) ? -EINVAL : 0;
> > > > > -     igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL) == expect);
> > > > > +     ret = igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL);
> >
> > > >
> > > > >
> > > > > -     /* Same as above, but different plane positioning. */
> > > > > +     /* Same as above, but different plane positioning: */
> > > >
> > > > Drop this change.
> > > >
> > > > >       igt_plane_set_position(primary, 100, 100);
> > > > > -     igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL) == expect);
> > > > > +     ret = igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL);
> > > > > +
> > > > > +     if (is_intel_device(data->drm_fd)) {
> > > > > +             /* should fail on pre-gen9 and succeed on gen9+: */
> > > > > +             if (data->display_ver < 9)
> > > > > +                     igt_assert_eq(ret, -EINVAL);
> > > > > +             else
> > > > > +                     igt_assert_eq(ret, 0);
> > > > > +     } else if (is_msm_device(data->drm_fd)) {
> > > > > +             /* Should be supported on all gens: */
> > > > > +             igt_assert_eq(ret, 0);
> > > > > +     } else {
> > > > > +             igt_assert_eq(ret, 0);
> > > > > +     }
> > > >
> > > > Same here, old code should just work for msm.
> > > >
> > > > >
> > > > >       igt_plane_set_position(primary, 0, 0);
> > > > >
> > > > > -     /* Try to use universal plane API to scale down (should fail on pre-gen9) */
> > > > > -     if (is_intel_device(data->drm_fd))
> > > > > -             expect = (data->display_ver < 9) ? -ERANGE : 0;
> > > >
> > > > Please keep this if(...) expect = ...
> > > > for a reason which follows.
> > > >
> > > > > -     igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> > > > > -                                output->config.crtc->crtc_id,
> > > > > -                                test.oversized_fb.fb_id, 0,
> > > > > -                                0, 0,
> > > > > -                                mode->hdisplay + 100,
> > > > > -                                mode->vdisplay + 100,
> > > > > -                                IGT_FIXED(0,0), IGT_FIXED(0,0),
> > > > > -                                IGT_FIXED(mode->hdisplay,0),
> > > > > -                                IGT_FIXED(mode->vdisplay,0)) == expect);
> > > > > +     /* Try to use universal plane API to scale down */
> > > > > +     ret = drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> > > > > +                           output->config.crtc->crtc_id,
> > > > > +                           test.oversized_fb.fb_id, 0,
> > > > > +                           0, 0,
> > > > > +                           mode->hdisplay + 100,
> > > > > +                           mode->vdisplay + 100,
> > > > > +                           IGT_FIXED(0,0), IGT_FIXED(0,0),
> > > > > +                           IGT_FIXED(mode->hdisplay,0),
> > > > > +                           IGT_FIXED(mode->vdisplay,0));
> > > > > +
> > > > > +     if (is_intel_device(data->drm_fd)) {
> > > > > +             /* should fail on pre-gen9 and succeed on gen9+: */
> > > > > +             if (data->display_ver < 9)
> > > > > +                     igt_assert_eq(ret, -ERANGE);
> > > > > +             else
> > > > > +                     igt_assert_eq(ret, 0);
> > > >
> > > > Or just simple
> > > >                         igt_assert_eq(ret, expect);
> > > >
> > > > > +     } else {
> > > > > +             /* Could succeed or fail with -ERANGE depending on hw limits: */
> > > > > +             igt_assert((ret == 0) || (ret == -ERANGE));
> >
> > Could you read/discover those limits and check for actual
> > expected error?
> 
> Not really, other than doing atomic-test commits.  Because of the way
> this all turns into atomic test+commit on the driver side, I'm not
> sure if that really adds value compared to just allowing each of these
> to return zero or expected error code.
> 
> BR,
> -R

ok, so it fixes this for msm, so it should be adjusted like:
(spaces for keeping it in column):

if (is_intel_device(data->drm_fd)) {
    expect = (data->display_ver < 9) ? -ERANGE : 0;
    igt_assert_eq(ret, expect);
} else if (is_msm_device(data->drm_fd)) {
    /* Could succeed or fail with -ERANGE depending on hw limits: */
    igt_assert((ret == 0) || (ret == -ERANGE));
} else {
    igt_assert(ret == 0);
}

This way you adjust it for msm, let other devs check if for their
drivers.

Regards,
Kamil

> 
> > Regards,
> > Kamil
> >
> > > > > +     }
> > > >
> > > > This is a real change, it relaxed checks for non-intel HW.
> > > > imho we should ask others, for example amd developers if that is ok
> > > > for them.
> > > >
> > > > >
> > > > >       /* Try to use universal plane API to scale up (should fail on pre-gen9) */
> > > > > -     igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> > > > > -                                output->config.crtc->crtc_id,
> > > > > -                                test.oversized_fb.fb_id, 0,
> > > > > -                                0, 0,
> > > > > -                                mode->hdisplay,
> > > > > -                                mode->vdisplay,
> > > > > -                                IGT_FIXED(0,0), IGT_FIXED(0,0),
> > > > > -                                IGT_FIXED(mode->hdisplay - 100,0),
> > > > > -                                IGT_FIXED(mode->vdisplay - 100,0)) == expect);
> > > > > +     ret = drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> > > > > +                           output->config.crtc->crtc_id,
> > > > > +                           test.oversized_fb.fb_id, 0,
> > > > > +                           0, 0,
> > > > > +                           mode->hdisplay,
> > > > > +                           mode->vdisplay,
> > > > > +                           IGT_FIXED(0,0), IGT_FIXED(0,0),
> > > > > +                           IGT_FIXED(mode->hdisplay - 100,0),
> > > > > +                           IGT_FIXED(mode->vdisplay - 100,0));
> > > > > +
> > > > > +     if (is_intel_device(data->drm_fd)) {
> > > > > +             /* should fail on pre-gen9 and succeed on gen9+: */
> > > > > +             if (data->display_ver < 9)
> > > > > +                     igt_assert_eq(ret, -ERANGE);
> > > > > +             else
> > > > > +                     igt_assert_eq(ret, 0);
> > > >
> > > > Same here, just simple:
> > > >                         igt_assert_eq(ret, expect);
> > > >
> > > > Regards,
> > > > Kamil
> > > >
> > > > > +     } else {
> > > > > +             /* Could succeed or fail with -ERANGE depending on hw limits: */
> > > > > +             igt_assert((ret == 0) || (ret == -ERANGE));
> > > > > +     }
> > > > >
> > > > >       /* Find other crtcs and try to program our primary plane on them */
> > > > >       for (i = 0; i < test.moderes->count_crtcs; i++)
> > > > > --
> > > > > 2.43.0
> > > > >
