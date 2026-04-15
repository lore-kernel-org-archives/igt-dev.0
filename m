Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7D6F4198B
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 11:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4853410E6CC;
	Wed, 15 Apr 2026 11:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ijlsx3uU";
	dkim-atps=neutral
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CC610E225
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 11:43:38 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-c742723c863so4217843a12.0
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 04:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776253418; cv=none;
 d=google.com; s=arc-20240605;
 b=GBws0uXIlDzvW8b8E4sFaLR1zErg7jFgd87SWJdRmPvxSowM5bt+CqF5kg5Ymt+H+k
 YXer9vksyPd3lZhkbDRtc7DpEW611vEWoh4ZiZgdK92zipO0dZ6GyIiG06CCz20P4Xgi
 2DRlP7WHJizDCL3iMhDs53Cfw/UbYQYcfTl9MtqVli1gelQD70hBoG7DYDRpegm273E2
 ZVcIUkFLOQbkYb5qMv2TreEjCrcpJxKbf45QNLE77QL2KtN0fXkvKAp4AbIL3QeysHEd
 hIRF1VROUgga9FeMkTC4m7VT3qnSaXZ0BT0nZAKPrLd/p1gXlCmxDWwmVQUZhHoKxxb3
 Mgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MfF4Yn4+sie4v6vInVP4w0WbBGX0tO9l39PAAyDuwtU=;
 fh=bBOdEspSDe+Fu2GFdpJBv3sDvIILUygPFC6gbgyi0co=;
 b=RFW813Hr08MAV30U2eVXncq0zZQabxbddXyMsyzRSzf7kFXe8vjpP9m/rGdCfN/YGW
 JLbnB36rbWOI9Bfe48znGbUxZx5CcnciIh1knBSAYaHOrLydUVJGnjPxrEiQjB+kZWt4
 ENCGR2OtVOKNoalpnMko8PPUaPzqlrV2E3sQYfexOelCh9tz7JKmvxXVYdmSmPUtF2U5
 gCCEbmuqHGTwRfcRsbSFNdxYPTYGe4ywCR9W3fJLSkA03k9GKa61/Rb2D0NlnCAPMEoN
 /GXdSCwmb0lloghwBO7SC42aSnSv3GfxHth/nl9Uz2xq+79QLkWM+v2sQp9Lz7wZyjhr
 mRag==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776253418; x=1776858218; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MfF4Yn4+sie4v6vInVP4w0WbBGX0tO9l39PAAyDuwtU=;
 b=ijlsx3uUrEGWSeqxqnQ6jjxOTw9AqayzjzxUVrVQhYffK5Q/dV4yV6Yu7n1Z/ZmI4z
 jlKE69fMZIoMHxGxLfn2dsSWuYV+0E7C3h4vc8Tbz/fkG49BVfqW95QAu17pmN+O7wDW
 w1ZkinfwemZE6oa/iEIQHxZgYgJOy/Vk4F5GezOh56hMLSOB0lDF7bXnME4k1n2jObA9
 JaAwR9qrwayUT/5Bnt6gcab8L+kTaDfB14pn28otweCyxEOuOPrV794nmMavwjajed40
 eiMAZysMWi5C+fzc8tm37myItxQ7ItN/7KISz9MLVqhp6sJTKFOvvkgVf1hxgdh/ejoN
 PGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776253418; x=1776858218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MfF4Yn4+sie4v6vInVP4w0WbBGX0tO9l39PAAyDuwtU=;
 b=LJl2x9vt42xU3mai4iyIU47/xljShYano1gKdFE3Ys0eEutV6oaYIpBXJrgrqPJ+CV
 SZIstl3w0K/3QHsXc/VrHWGN6bc8KxEtq4tIBnbZL5kPg8ImVssgCQoxGlxcdgxQrS/y
 b3yYDPiD9evt4h1k0o+yCTbMiD3eVo0cGCVIBOURuJMssBx710NmPB86DNZ8jZqBHZJF
 Fa5IT6dbaaX+xIzXcJZ/WHpa54wemJzWDieDkJF9LsjtDySQabByO6lGM4kB/pM9ssob
 jQ8ejFBKNCRC2f3s2jf5pEugprpfYXaAHg2aNU8/XVeznExQX0jVcC0mlZFStwGSR+4Z
 NbpA==
X-Gm-Message-State: AOJu0YxvvulgD0AaVTybKgRQH7cR0X2+73oltwNlzMJkAsfJpaLblkPC
 gU0NuSTz9n0/45V5RrwiHRXX76FvBD4bdY4G0YyHzu1jzd9WlKovofzihZTHnsZpV/2IFrS8YE9
 HEb7ezQPsxjvuElWajlhaXBx/SImKidk6WFP7znZvEQ==
X-Gm-Gg: AeBDievDRuX83I/2uxBm4LKtGdP7CgQ05Ofc6Ybfm53oEAqeMpgPIkpkSHvhG9HtDft
 Fk0rlZvjEY48KJZDup2OFmCsLFOp/XWW0vfqcCUMYxN+rw7Y/hw3at9rcsYtMKCvywNe+RVzZeu
 ZEqK+Tz+XLVoSRZ+nIHsfpty9+JC4R6UoB0S+8RvFaR1hZ2MWcc9X0bp+bjeoaQyadbc8nv8HZC
 245ifoLs4JaNLYhT4YiH61lR7OcnEKBdG93xus4cMYzE8vSkyELlipqxZrMGWUuqAlr2a+7Dv+4
 Flk6cOx2XIGFqkPRlpW44cY69r9mhKK3nVQ6Ud/XjDZN+WvRoUjW
X-Received: by 2002:a05:6a20:7d9d:b0:398:d70f:e012 with SMTP id
 adf61e73a8af0-39fe400f810mr23534880637.47.1776253418013; Wed, 15 Apr 2026
 04:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
 <20260331190412.1907571-3-juhapekka.heikkila@gmail.com>
 <5d92caab-f7c2-40a8-952f-b0b0f6629e47@intel.com>
In-Reply-To: <5d92caab-f7c2-40a8-952f-b0b0f6629e47@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 15 Apr 2026 14:43:26 +0300
X-Gm-Features: AQROBzBw3Yr3LaOEGcbHf2n3U9YowkFQoQpA7NFnLH2oPympPkja7J04as8aojY
Message-ID: <CAJ=qYWQGiwPsu3ObRyWkgHnL=Mjph6Op5Ntw3sxah2LGRbHddw@mail.gmail.com>
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_sharpness_filter: refactor
 test_sharpness_filter function
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, Apr 9, 2026 at 3:04=E2=80=AFPM Sharma, Swati2 <swati2.sharma@intel.=
com> wrote:
>
> Hi JP,
>
> Overall patch LGTM. One small nit.
>
> On 01-04-2026 12:34 am, Juha-Pekka Heikkila wrote:
> > refactor to make it look more nice
> >
> > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > ---
> >   tests/intel/kms_sharpness_filter.c | 108 ++++++++++++++++------------=
-
> >   1 file changed, 59 insertions(+), 49 deletions(-)
> >
> > diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharp=
ness_filter.c
> > index 029b735bd..ed8d2e48c 100644
> > --- a/tests/intel/kms_sharpness_filter.c
> > +++ b/tests/intel/kms_sharpness_filter.c
> > @@ -88,15 +88,6 @@ IGT_TEST_DESCRIPTION("Test to validate content adapt=
ive sharpness filter");
> >   #define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
> >   #define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
> >   #define NROUNDS                             10
> > -#define INVALID_TEST ((type =3D=3D TEST_INVALID_FILTER_WITH_SCALER) \
> > -                || (type =3D=3D TEST_INVALID_FILTER_WITH_PLANE) \
> > -                || (type =3D=3D TEST_INVALID_PLANE_WITH_FILTER) \
> > -                || (type =3D=3D TEST_INVALID_FILTER_WITH_SCALING_MODE)=
)
> > -#define SET_PLANES ((type =3D=3D TEST_FILTER_UPSCALE) \
> > -             ||  (type =3D=3D TEST_FILTER_DOWNSCALE) \
> > -             ||  (type =3D=3D TEST_INVALID_FILTER_WITH_SCALER) \
> > -             ||  (type =3D=3D TEST_INVALID_FILTER_WITH_PLANE) \
> > -             ||  (type =3D=3D TEST_INVALID_FILTER_WITH_SCALING_MODE))
> >
> >   enum test_type {
> >       TEST_FILTER_BASIC,
> > @@ -327,12 +318,37 @@ static int test_filter_toggle(data_t *data)
> >       return ret;
> >   }
> >
> > -static void test_sharpness_filter(data_t *data,  enum test_type type)
> > +static bool is_invalid_test(enum test_type type)
> > +{
> > +     switch (type) {
> > +     case TEST_INVALID_FILTER_WITH_SCALER:
> > +     case TEST_INVALID_FILTER_WITH_PLANE:
> > +     case TEST_INVALID_PLANE_WITH_FILTER:
> > +     case TEST_INVALID_FILTER_WITH_SCALING_MODE:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> > +static bool needs_extra_planes(enum test_type type)
> > +{
> > +     switch (type) {
> > +     case TEST_FILTER_UPSCALE:
> > +     case TEST_FILTER_DOWNSCALE:
> > +     case TEST_INVALID_FILTER_WITH_SCALER:
> > +     case TEST_INVALID_FILTER_WITH_PLANE:
> > +     case TEST_INVALID_FILTER_WITH_SCALING_MODE:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> > +static void test_sharpness_filter(data_t *data, enum test_type type)
> >   {
> >       igt_output_t *output =3D data->output;
> >       drmModeModeInfo *mode =3D data->mode;
> > -     int height =3D mode->hdisplay;
> > -     int width =3D  mode->vdisplay;
> >       igt_crc_t ref_crc, crc;
> >       igt_pipe_crc_t *pipe_crc =3D NULL;
> >       int ret;
> > @@ -343,57 +359,31 @@ static void test_sharpness_filter(data_t *data,  =
enum test_type type)
> >                     "No requested format/modifier on pipe %s\n",
> >                     igt_crtc_name(data->crtc));
> >
> > -     setup_fb(data->drm_fd, height, width, data->format, data->modifie=
r, &data->fb[0]);
> > +     setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> > +              data->format, data->modifier, &data->fb[0]);
> >       igt_plane_set_fb(data->plane[0], &data->fb[0]);
> >
> >       if (type =3D=3D TEST_FILTER_ROTATION) {
> > -             if (igt_plane_has_rotation(data->plane[0], data->rotation=
))
> > -                     igt_plane_set_rotation(data->plane[0], data->rota=
tion);
> > -             else
> > -                     igt_skip("No requested rotation on pipe %s\n",
> > -                              igt_crtc_name(data->crtc));
> > +             igt_skip_on_f(!igt_plane_has_rotation(data->plane[0],
> > +                                                   data->rotation),
> > +                           "No requested rotation on pipe %s\n",
> > +                           igt_crtc_name(data->crtc));
> > +             igt_plane_set_rotation(data->plane[0], data->rotation);
> >       }
> >
> >       if (type =3D=3D TEST_INVALID_FILTER_WITH_SCALING_MODE)
> >               igt_require_f(has_scaling_mode(output), "No connecter sca=
ling mode found on %s\n", output->name);
> >
> > -     if (SET_PLANES)
> > +     if (needs_extra_planes(type))
> >               set_planes(data, type);
> >
> >       set_filter_strength_on_pipe(data);
> >
> > -     if (!INVALID_TEST && data->filter_strength !=3D 0)
> > -             igt_debug("Sharpened image should be observed for filter =
strength > 0\n");
> Since this in NON-CRC based test, should we keep this debug msg?

I don't think this debug message help here. Maybe these tests should
be moved behind command line flag so they wouldn't be run on CI?

> > -
> >       if (type =3D=3D TEST_INVALID_FILTER_WITH_SCALING_MODE)
> >               ret =3D igt_display_try_commit_atomic(&data->display, 0, =
NULL);
> >       else
> >               ret =3D igt_display_try_commit2(&data->display, COMMIT_AT=
OMIC);
> >
> > -     if (type =3D=3D TEST_FILTER_DPMS || type =3D=3D TEST_FILTER_SUSPE=
ND) {
> > -             pipe_crc =3D igt_crtc_crc_new(data->crtc,
> > -                                         IGT_PIPE_CRC_SOURCE_AUTO);
> > -             igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> > -     }
> > -
> > -     if (type =3D=3D TEST_FILTER_DPMS) {
> > -             kmstest_set_connector_dpms(data->drm_fd,
> > -                                        output->config.connector,
> > -                                        DRM_MODE_DPMS_OFF);
> > -             kmstest_set_connector_dpms(data->drm_fd,
> > -                                        output->config.connector,
> > -                                        DRM_MODE_DPMS_ON);
> > -     }
> > -
> > -     if (type =3D=3D TEST_FILTER_SUSPEND)
> > -             igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > -                                           SUSPEND_TEST_NONE);
> > -
> > -     if (type =3D=3D TEST_FILTER_DPMS || type =3D=3D TEST_FILTER_SUSPE=
ND) {
> > -             igt_pipe_crc_collect_crc(pipe_crc, &crc);
> > -             igt_assert_crc_equal(&crc, &ref_crc);
> > -     }
> > -
> >       if (type =3D=3D TEST_FILTER_TOGGLE)
> >               ret |=3D test_filter_toggle(data);
> >
> > @@ -409,13 +399,33 @@ static void test_sharpness_filter(data_t *data,  =
enum test_type type)
> >               ret =3D igt_display_try_commit2(&data->display, COMMIT_AT=
OMIC);
> >       }
> >
> > -     if (INVALID_TEST)
> > +     if (type =3D=3D TEST_FILTER_DPMS || type =3D=3D TEST_FILTER_SUSPE=
ND) {
> > +             pipe_crc =3D igt_crtc_crc_new(data->crtc,
> > +                                         IGT_PIPE_CRC_SOURCE_AUTO);
> > +             igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> > +
> > +             if (type =3D=3D TEST_FILTER_DPMS) {
> > +                     kmstest_set_connector_dpms(data->drm_fd,
> > +                                                output->config.connect=
or,
> > +                                                DRM_MODE_DPMS_OFF);
> > +                     kmstest_set_connector_dpms(data->drm_fd,
> > +                                                output->config.connect=
or,
> > +                                                DRM_MODE_DPMS_ON);
> > +             } else {
> > +                     igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > +                                                   SUSPEND_TEST_NONE);
> > +             }
> > +
> > +             igt_pipe_crc_collect_crc(pipe_crc, &crc);
> > +             igt_assert_crc_equal(&crc, &ref_crc);
> > +             igt_pipe_crc_free(pipe_crc);
> > +     }
> > +
> > +     if (is_invalid_test(type))
> >               igt_assert_eq(ret, -EINVAL);
> >       else
> >               igt_assert_eq(ret, 0);
> >
> > -     /* clean-up */
> > -     igt_pipe_crc_free(pipe_crc);
> >       cleanup(data);
> >   }
> >
