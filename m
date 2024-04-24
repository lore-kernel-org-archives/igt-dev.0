Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68980C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 20:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1724C11222B;
	Wed, 24 Apr 2024 20:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jzONS+sV";
	dkim-atps=neutral
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB301131A1
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 20:19:18 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a55b10bfd30so17162466b.0
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 13:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713989957; x=1714594757;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vve6iIRKn6X2unci+8R7fIDYAXIAYrsGlHXvry0RC1g=;
 b=jzONS+sVRiMIezd6KWK6BfmgPTp3zUgE/gYibuWQX0nwva8X2t1DrvMPlGbHEHDN/f
 BuWx8MUnpHRzeEL/e6viJDgeb2k2EDXoVJoPV1+6kGhACb4RFTmyBqaAv0aMgTnhXFsR
 nxy/CClK/rcTfwZc7rLMLdBbXKSxWg24wLs5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713989957; x=1714594757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vve6iIRKn6X2unci+8R7fIDYAXIAYrsGlHXvry0RC1g=;
 b=w5deWEbUuT6hXILNtp1D0cK6yN1QhZEnHzFfWDuXjKKmqoX/zbCDvqQDYAtxIRmKJa
 +kcQAZtaSlBVLeSifrXaA0y+JfNgoGbS/hb0UTu7QmivzFEoogS+BvcsDlXmZJO7FMQQ
 OT2JSPYNaGHPRnlrl0KvyppeUJzkN9ti+xC6I0M6XipiK/xEXzoCsq/1T2bjAkDp1QTS
 AIU937bu+UkbSvu5F0q0MKYU2WQrfQVKmUdx/3I55L6plTSCffh5m6vp2vGAlXgb8gno
 gut+L/IBK3jGfCVr8c7nlxQkMklPtlXqxdrn7bkuATeJKBGIcWppm425T+ArfbInFrKJ
 S7Bw==
X-Gm-Message-State: AOJu0YwrGfSsgnWuMyQavdcbBW4mWx29g3CwzA9N+rL0jJ9j5yL524cw
 9ZUeNRsYSSOlvW+rzAjpDRlWgPzkxYDxX0jls8DYLkhH6X7fwRqSlzscFEFbkig3PwnkfKzo/xO
 BLuW0GTbsikWCkKo5h6+27Ln81kwXxEsSkU3qKg4vbH3bKLW9rw==
X-Google-Smtp-Source: AGHT+IFmFHvcvtqe8Dx11SWIWDHsZ/+bRhmmF3KydPWMgXUmlYZm+/XGW4g4xPz+Prr5fAxLTmyNnuc+NyFiQX/+KR0=
X-Received: by 2002:a50:bb6f:0:b0:56d:f3f3:f61f with SMTP id
 y102-20020a50bb6f000000b0056df3f3f61fmr3230974ede.9.1713989956709; Wed, 24
 Apr 2024 13:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240325230519.1787483-1-navaremanasi@chromium.org>
 <d1dca10c-dc5c-4bd2-9f94-26ae032d35de@intel.com>
In-Reply-To: <d1dca10c-dc5c-4bd2-9f94-26ae032d35de@intel.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Wed, 24 Apr 2024 13:19:05 -0700
Message-ID: <CAE72mNmWrjt6Br-HbtgdY+1YFuQ2=m3=iUSpiaBfqkJvbhaPrg@mail.gmail.com>
Subject: Re: [PATCH v5] tests/kms_vrr: Add a subtest for seamless modeset to a
 virtual LRR mode
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Drew Davenport <ddavenport@chromium.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Sean Paul <seanpaul@chromium.org>
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

Hi Bhanu,

I have created a HAX patch and addressed other comments, could you
please take a look, hopefully we will get good BAT results this time:
https://patchwork.freedesktop.org/series/132866/

Manasi

On Thu, Apr 4, 2024 at 11:37=E2=80=AFPM Modem, Bhanuprakash
<bhanuprakash.modem@intel.com> wrote:
>
> Hi Manasi,
>
> Please find the comments inline, you can get my R-b once you fix those
> minor comments.
>
> Also, I can recommend to add a HAX [*] patch (along with this patch) to
> run VRR tests in BAT. So that we can get some CI results before we
> actually merge this patch.
>
> [*]:
> https://intel-gfx-ci.01.org/#forcing-tests-in-bat-and-changing-configurat=
ion
>
> On 26-03-2024 04:35 am, Manasi Navare wrote:
> > This subtest validates LRR fastset functionality by testing seamless sw=
itching
> > without full modeset to any of the virtual LRR mode within VRR range.
> > Here we start from highest refresh rate mode and then switch to virtual=
 LRR
> > modes in the steps of 10Hz within the VRR range.
> >
> > This is used to test the LRR fastset functionality of the driver.
> >
> > v4:
> > - Change the test name to align with drrs/vrr tests (Bhanu)
> > - Fix some build warnings due to rebase
> > - Use a local virtual_mode variable
> >
> > v3:
> > - Fix build error due to rebase (Manasi)
> >
> > Cc: Drew Davenport <ddavenport@chromium.org>
> > Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
> > ---
> >   tests/kms_vrr.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++--=
-
> >   1 file changed, 68 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> > index 15c62b34b..d838647bd 100644
> > --- a/tests/kms_vrr.c
> > +++ b/tests/kms_vrr.c
> > @@ -66,6 +66,11 @@
> >    * Description: Test to switch RR seamlessly without modeset.
> >    * Functionality: adaptive_sync, drrs
> >    *
> > + * SUBTEST: seamless-rr-switch-virtual
> > + * Description: Test to create a Virtual Mode in VRR range and switch =
to it
> > + *           without a full modeset.
> > + * Functionality: LRR
> > + *
> >    * SUBTEST: max-min
> >    * Description: Oscillates between highest and lowest refresh each fr=
ame for
> >    *              manual flicker profiling
> > @@ -89,9 +94,10 @@ enum {
> >       TEST_FLIPLINE =3D 1 << 3,
> >       TEST_SEAMLESS_VRR =3D 1 << 4,
> >       TEST_SEAMLESS_DRRS =3D 1 << 5,
> > -     TEST_FASTSET =3D 1 << 6,
> > -     TEST_MAXMIN =3D 1 << 7,
> > -     TEST_NEGATIVE =3D 1 << 8,
> > +     TEST_SEAMLESS_VIRTUAL_RR =3D 1 << 6,
> > +     TEST_FASTSET =3D 1 << 7,
> > +     TEST_MAXMIN =3D 1 << 8,
> > +     TEST_NEGATIVE =3D 1 << 9,
> >   };
> >
> >   enum {
> > @@ -214,6 +220,18 @@ low_rr_mode_with_same_res(igt_output_t *output, un=
signed int vrr_min)
> >       return mode;
> >   }
> >
> > +static drmModeModeInfo
> > +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_r=
efresh_rate)
> > +{
> > +     drmModeModeInfo mode =3D *igt_output_get_mode(output);
> > +     uint64_t clock_hz =3D mode.clock * 1000;
> > +
> > +     mode.vtotal =3D clock_hz / (mode.htotal * virtual_refresh_rate);
> > +     mode.vrefresh =3D virtual_refresh_rate;
> > +
> > +     return mode;
> > +}
> > +
> >   /* Read min and max vrr range from the connector debugfs. */
> >   static range_t
> >   get_vrr_range(data_t *data, igt_output_t *output)
> > @@ -641,6 +659,48 @@ test_seamless_rr_basic(data_t *data, enum pipe pip=
e, igt_output_t *output, uint3
> >                    vrr ? "on" : "off", vrr ? "not reached" : "exceeded"=
, result);
> >   }
> >
> > +static void
> > +test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_outpu=
t_t *output, uint32_t flags)
> > +{
> > +     uint32_t result;
> > +     unsigned int vrefresh;
> > +     uint64_t rate[] =3D {0};
> > +
> > +     igt_info("Use HIGH_RR Mode as default\n");
> > +     kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> > +
> > +     prepare_test(data, output, pipe);
> > +     rate[0] =3D rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vr=
efresh);
> > +
> > +     /*
> > +      * Sink with DRR and VRR can be in downclock mode so
> > +      * switch to highest refresh rate mode.
> > +      */
> > +     igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE=
]);
> > +     igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE=
_PAGE_FLIP_EVENT, NULL) =3D=3D 0);
> > +
> > +     result =3D flip_and_measure(data, output, pipe, rate, 1, TEST_DUR=
ATION_NS);
> > +     igt_assert_f(result > 75,
> > +                  "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold =
not reached, result was %u%%\n",
> > +                  data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], =
result);
> > +
> > +     /* Switch to Virtual RR */
> > +     for (vrefresh =3D data->range.min + 10; vrefresh < data->range.ma=
x; vrefresh +=3D 10) {
> > +             drmModeModeInfo virtual_mode =3D virtual_rr_vrr_range_mod=
e(output, vrefresh);
>
> Nit: Please add a new line here to separate variable declarations from
> actual logic.
>
> > +             igt_info("Requesting Virtual Mode with Refresh Rate (%u H=
z): \n", vrefresh);
> > +             kmstest_dump_mode(&virtual_mode);
> > +
> > +             igt_output_override_mode(output, &virtual_mode);
> > +             igt_assert(igt_display_try_commit_atomic(&data->display, =
0, NULL) =3D=3D 0);
> > +
> > +             rate[0] =3D rate_from_refresh(vrefresh);
> > +             result =3D flip_and_measure(data, output, pipe, rate[0], =
1, TEST_DURATION_NS);
> ------------------------------------------------------------------^
> We need to pass the reference.
>
> s/rate[0]/rate/
>
> - Bhanu
>
> > +             igt_assert_f(result > 75,
> > +                          "Refresh rate (%u Hz) %"PRIu64"ns: Target th=
reshold not reached, result was %u%%\n",
> > +                          vrefresh, rate[0], result);
> > +     }
> > +}
> > +
> >   static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *=
output)
> >   {
> >       if (vrr_capable(output))
> > @@ -686,7 +746,7 @@ static bool output_constraint(data_t *data, igt_out=
put_t *output, uint32_t flags
> >       igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE=
]);
> >
> >       /* Search for a low refresh rate mode. */
> > -     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
> > +     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAM=
LESS_VIRTUAL_RR)))
> >               return true;
> >
> >       data->switch_modes[LOW_RR_MODE] =3D low_rr_mode_with_same_res(out=
put, data->range.min);
> > @@ -841,6 +901,10 @@ igt_main_args("drs:", long_opts, help_str, opt_han=
dler, &data)
> >                            "between flip timestamps converges to the re=
quested rate");
> >               igt_subtest_with_dynamic("flip-basic-fastset")
> >                       run_vrr_test(&data, test_basic, TEST_FASTSET);
> > +
> > +             igt_describe("Test to switch to any custom virtual mode i=
n VRR range without modeset.");
> > +             igt_subtest_with_dynamic("seamless-rr-switch-virtual")
> > +                     run_vrr_test(&data, test_seamless_virtual_rr_basi=
c, TEST_SEAMLESS_VIRTUAL_RR);
> >       }
> >
> >       igt_fixture {
