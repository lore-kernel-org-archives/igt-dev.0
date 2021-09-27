Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1085489F0B
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Sep 2021 14:32:38 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y28so77958916lfb.0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Sep 2021 07:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210924185510.551979-1-markyacoub@chromium.org>
 <YVHAd4LdBx25Ox67@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YVHAd4LdBx25Ox67@platvala-desk.ger.corp.intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 27 Sep 2021 10:32:25 -0400
Message-ID: <CAJUqKUpzZ7g=hxgW7AwJ8L6hpeAVANTT0uyMXbPtgJNOd+KsUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests/kms_addfb_basic: Remove handling for
 Unknown Vendor.
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
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>, Arkadiusz Hiler <arek@hiler.eu>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, Anson Jacob <anson.jacob@amd.com>, abhinavk@codeaurora.org, Rob Clark <robdclark@chromium.org>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

1) I looked at the IOCTL implementation. the IOCTL function makes its
way to drm_internal_framebuffer_create() [1] and framebuffer_check()
[2] where the return values are -EINVAL everywhere except for 2 cases
[3] where they return as handled by Nouveau.  Given that it's in DRM,
I think I can assume it would be a consistent behavior across drivers.

2) yeah, within the tests I ran, it was consistently an EINVAL except
for nouveau, which is still a fair return value.

3) I checked Chrome and it just checks that it's 0, otherwise, it
returns false to the operation.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_framebuffer.c#L287
[2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_framebuffer.c#L172
[3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_framebuffer.c#L214

On Mon, Sep 27, 2021 at 8:57 AM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Fri, Sep 24, 2021 at 02:55:10PM -0400, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > Looking at multiple drivers such as i915, amdgpu, and msm, EINVAL is the
> > standard errno when failing some fb errors.
> > Unless it's an exception like nouveau, every driver should act in a
> > standard manner and return EINVAL just like every other driver. Hence,
> > no special handling for unknown vendor is needed.
> >
> > [How]
> > Remove asserts for specific drivers except for a known exception.
> >
> > Tested on ChromeOS Trogdor(msm).
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  tests/kms_addfb_basic.c | 26 +++++++-------------------
> >  1 file changed, 7 insertions(+), 19 deletions(-)
> >
> > diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> > index 082f10ee..35c2ae2c 100644
> > --- a/tests/kms_addfb_basic.c
> > +++ b/tests/kms_addfb_basic.c
> > @@ -307,17 +307,10 @@ static void pitch_tests(int fd)
> >               igt_subtest_f("bad-pitch-%i", bad_pitches[i]) {
> >                       f.pitches[0] = bad_pitches[i];
> >                       igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -1);
> > -                     igt_assert(errno != 0);
> > -                     if (is_i915_device(fd) || is_amdgpu_device(fd) || is_msm_device(fd)) {
> > +                     if (is_nouveau_device(fd) && bad_pitches[i] > 4 * 1024)
> > +                             igt_assert_eq(errno, ERANGE);
> > +                     else
> >                               igt_assert_eq(errno, EINVAL);
> > -                     } else if (is_nouveau_device(fd)) {
> > -                             if (bad_pitches[i] > 4 * 1024)
> > -                                     igt_assert_eq(errno, ERANGE);
> > -                             else
> > -                                     igt_assert_eq(errno, EINVAL);
> > -                     } else {
> > -                             igt_info("Unknown vendor; errno unchecked (returned %i)", errno);
> > -                     }
> >                       errno = 0;
> >               }
> >       }
> > @@ -479,13 +472,10 @@ static void size_tests(int fd)
> >               for (i = 0; i < ARRAY_SIZE(framebuffers); i++) {
> >                       igt_debug("Checking framebuffer %i\n", i);
> >                       igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, framebuffers[i]), -1);
> > -                     igt_assert(errno != 0);
> > -                     if (is_i915_device(fd))
> > -                             igt_assert_eq(errno, EINVAL);
> > -                     else if (is_nouveau_device(fd))
> > +                     if (is_nouveau_device(fd))
> >                               igt_assert_eq(errno, ERANGE);
> >                       else
> > -                             igt_info("Unknown vendor; errno unchecked (returned %i)", errno);
> > +                             igt_assert_eq(errno, EINVAL);
> >                       errno = 0;
> >               }
> >       }
> > @@ -495,12 +485,10 @@ static void size_tests(int fd)
> >       igt_subtest("bo-too-small") {
> >               igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -1);
> >               igt_assert(errno != 0);
> > -             if (is_i915_device(fd))
> > -                     igt_assert_eq(errno, EINVAL);
> > -             else if (is_nouveau_device(fd))
> > +             if (is_nouveau_device(fd))
> >                       igt_assert_eq(errno, ERANGE);
> >               else
> > -                     igt_info("Unknown vendor; errno unchecked (returned %i)", errno);
> > +                     igt_assert_eq(errno, EINVAL);
> >               errno = 0;
> >       }
>
> Tentatively,
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
>
> How does this map to the holy trinity of
>
> 1) documentation for the ioctl
> 2) actual behaviour of the ioctl across drivers (this one is already answered in the commit message though)
> 3) how non-IGT userspace handles the ioctl
>
>
> --
> Petri Latvala
