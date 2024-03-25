Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F41C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 22:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C714A10EB4D;
	Mon, 25 Mar 2024 22:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ag54yphW";
	dkim-atps=neutral
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410A910EB4D
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 22:51:53 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-56c1a520659so1312935a12.1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711407111; x=1712011911;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mlVPxwomHhhyTE44T3FVkUgfe6hT23XH+Uh47l4G+vU=;
 b=Ag54yphWrnazL655n+61vuzuMvaNWcNy2lqhmu5NJVwgQJ9n+Bkz1ZH72QoQ0gnrEW
 RibZyXKAp4UV9QS6wFEjo1h07D21ySZazYeZC1NspVvfotIxJC1dhSSzQEKyuxVcVw83
 Ul9+KYzkLhIGUR2PdR38FymbPKut9/dUeVNWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711407111; x=1712011911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mlVPxwomHhhyTE44T3FVkUgfe6hT23XH+Uh47l4G+vU=;
 b=KE8/LdIzkMXEHclcGrC8P6R4alq7FkwX15s2FMx7lQAjEO+gG1Duo6eCJJ4iMM6Cqw
 GJB/dBA5w3ab49+BIBZVe1CTjsdE1HtHF5JOjNBX7Sege8/8qKCLtO+oZp0aCqIWcdLb
 k1pVdrANpwsTvmm0KNPClltV6Dt3pa32NysKxGpaiAs93txIXXym5AXWtwFVemdEXXj7
 l7vnJfY9c5OKqIJK8XORwKcNDAhA6di8/PbBjcPKGrdl4fZCoBryyJ3Obx170saNGwwU
 drjG06OAx8DMGb6wnnmUYziJ2GACiT2evewXc6k2M+yHgOC50XXx3YymOR4o+RSPYoON
 Dtdw==
X-Gm-Message-State: AOJu0Yw8Lp3KCB/TdWL7E21GWAtygpg7Pqls243PhAl+rU1J8zP9bO/n
 VDDQbfuYY3yjXjvoPQK5jBJ6mkjRY8J6VkInLfv2wtktkJhdJk5rpNwQcF7zHNIcvfkZ/ItGm9L
 nZGPKYEmH/vYNEjBGThBADzMkCZlz4kIfORFM
X-Google-Smtp-Source: AGHT+IGXuMYyWn9iFSzfgp+HJVYc1ceK0wSFRWQqekC/Gvg2CvSZgOvvHRHZHnqwa/4vyfQtfJrfWQUUXQGceFpeyvw=
X-Received: by 2002:a17:906:4c5a:b0:a4d:f01b:42a6 with SMTP id
 d26-20020a1709064c5a00b00a4df01b42a6mr422271ejw.43.1711407111245; Mon, 25 Mar
 2024 15:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240319163338.3993235-1-navaremanasi@chromium.org>
 <a31623e2-6cf4-44da-acd6-70572bbbd24f@intel.com>
In-Reply-To: <a31623e2-6cf4-44da-acd6-70572bbbd24f@intel.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Mon, 25 Mar 2024 15:51:40 -0700
Message-ID: <CAE72mNnb+Dq5jY4hVYA5_6YDO6w8An0qWsV_jtPy=B3Z4GPUBw@mail.gmail.com>
Subject: Re: [PATCH v3] tests/kms_vrr: Add a subtest for seamless modeset to a
 virtual LRR mode
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Drew Davenport <ddavenport@chromium.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Sean Paul <seanpaul@chromium.org>, 
 "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
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

On Thu, Mar 21, 2024 at 10:20=E2=80=AFPM Modem, Bhanuprakash
<bhanuprakash.modem@intel.com> wrote:
>
> Hi Manasi,
>
> Thanks for the patch, unfortunately it is not compiling cleanly in my WS
> and getting below warnings:
>
> [2/11] Compiling C object tests/kms_vrr.p/kms_vrr.c.o
> ../tests/kms_vrr.c: In function =E2=80=98virtual_rr_vrr_range_mode=E2=80=
=99:
> ../tests/kms_vrr.c:229:22: warning: unused variable =E2=80=98connector=E2=
=80=99
> [-Wunused-variable]
>    229 |  drmModeConnectorPtr connector =3D output->config.connector;
>        |                      ^~~~~~~~~
> ../tests/kms_vrr.c:227:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
>    227 |  int i;
>        |      ^
> ../tests/kms_vrr.c: In function =E2=80=98test_seamless_virtual_rr_basic=
=E2=80=99:
> ../tests/kms_vrr.c:685:48: warning: passing argument 4 of
> =E2=80=98flip_and_measure=E2=80=99 makes pointer from integer without a c=
ast
> [-Wint-conversion]
>    685 |  result =3D flip_and_measure(data, output, pipe, rate, 1,
> TEST_DURATION_NS);
>        |                                                ^~~~
>        |                                                |
>        |                                                uint64_t {aka
> long unsigned int}
> ../tests/kms_vrr.c:413:14: note: expected =E2=80=98uint64_t *=E2=80=99 {a=
ka =E2=80=98long
> unsigned int *=E2=80=99} but argument is of type =E2=80=98uint64_t=E2=80=
=99 {aka =E2=80=98long unsigned
> int=E2=80=99}
>    413 |    uint64_t *rates_ns, int num_rates, uint64_t duration_ns)
>        |    ~~~~~~~~~~^~~~~~~~
> ../tests/kms_vrr.c:700:49: warning: passing argument 4 of
> =E2=80=98flip_and_measure=E2=80=99 makes pointer from integer without a c=
ast
> [-Wint-conversion]
>    700 |   result =3D flip_and_measure(data, output, pipe, rate, 1,
> TEST_DURATION_NS);
>        |                                                 ^~~~
>        |                                                 |
>        |                                                 uint64_t {aka
> long unsigned int}
> ../tests/kms_vrr.c:413:14: note: expected =E2=80=98uint64_t *=E2=80=99 {a=
ka =E2=80=98long
> unsigned int *=E2=80=99} but argument is of type =E2=80=98uint64_t=E2=80=
=99 {aka =E2=80=98long unsigned
> int=E2=80=99}
>    413 |    uint64_t *rates_ns, int num_rates, uint64_t duration_ns)
>        |    ~~~~~~~~~~^~~~~~~~
>

Thanks Bhanu, I have fixed these which were new because of rebase over
upstream version.

>
> On 19-03-2024 10:03 pm, Manasi Navare wrote:
> > This subtest validates LRR fastset functionality by testing seamless sw=
itching
> > without full modeset to any of the virtual LRR mode within VRR range.
> > Here we start from highest refresh rate mode and then switch to virtual=
 LRR
> > modes in the steps of 10Hz within the VRR range.
> >
> > This is used to test the LRR fastset functionality of the driver.
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
> >   tests/kms_vrr.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++=
-
> >   1 file changed, 67 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> > index 15c62b34b..316b626c3 100644
> > --- a/tests/kms_vrr.c
> > +++ b/tests/kms_vrr.c
> > @@ -70,6 +70,11 @@
> >    * Description: Oscillates between highest and lowest refresh each fr=
ame for
> >    *              manual flicker profiling
> >    *
> > + * SUBTEST: seamless-virtual-rr-switch
>
> IMHO, we need to update the subtest name as 'seamless-rr-switch-virtual'
> to match with other subtests 'seamless-rr-switch-(drrs | vrr)'.

Sure will update this.

>
> > + * Description: Test to create a Virtual Mode in VRR range and switch =
to it
> > + *           without a full modeset.
> > + * Functionality: LRR
> > + *
> >    * SUBTEST: negative-basic
> >    * Description: Make sure that VRR should not be enabled on the Non-V=
RR panel.
> >    */
> > @@ -92,11 +97,13 @@ enum {
> >       TEST_FASTSET =3D 1 << 6,
> >       TEST_MAXMIN =3D 1 << 7,
> >       TEST_NEGATIVE =3D 1 << 8,
> > +     TEST_SEAMLESS_VIRTUAL_RR =3D 1 << 9,
>
> IMHO, we could move this enum just after the TEST_SEAMLESS_DRRS or just
> before the TEST_NEGATIVE.

Yes I agree will change this position in the enum

>
> >   };
> >
> >   enum {
> >       HIGH_RR_MODE,
> >       LOW_RR_MODE,
> > +     VIRTUAL_RR_MODE,
> >       RR_MODES_COUNT,
> >   };
> >
> > @@ -214,6 +221,19 @@ low_rr_mode_with_same_res(igt_output_t *output, un=
signed int vrr_min)
> >       return mode;
> >   }
> >
> > +static drmModeModeInfo
> > +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_r=
efresh_rate)
> > +{
> > +     int i;
> > +     drmModeConnectorPtr connector =3D output->config.connector;
>
> Please drop these unused variables 'i' & 'connector'.

Yup done

>
> > +     drmModeModeInfo mode =3D *igt_output_get_mode(output);
> > +     uint64_t clock_hz =3D mode.clock * 1000;
> > +
> > +     mode.vtotal =3D clock_hz / (mode.htotal * virtual_refresh_rate);
> > +     mode.vrefresh =3D virtual_refresh_rate;
>
> Please add a new line here.
Yup done

>
> > +     return mode;
> > +}
> > +
> >   /* Read min and max vrr range from the connector debugfs. */
> >   static range_t
> >   get_vrr_range(data_t *data, igt_output_t *output)
> > @@ -641,6 +661,48 @@ test_seamless_rr_basic(data_t *data, enum pipe pip=
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
> > +     uint64_t rate;
>
> Please declare the variable 'rate' as array or pass it's reference to
> flip_and_measure().

Yup done, changed to fix the warning

>
> > +     unsigned int vrefresh;
> > +
> > +     igt_info("Use HIGH_RR Mode as default\n");
> > +     kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> > +
> > +     prepare_test(data, output, pipe);
> > +     rate =3D rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefr=
esh);
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
> > +                  data->switch_modes[HIGH_RR_MODE].vrefresh, rate, res=
ult);
> > +
> > +     /* Switch to Virtual RR */
> > +     for (vrefresh =3D data->range.min + 10; vrefresh < data->range.ma=
x; vrefresh +=3D 10) {
> > +
> Please drop this new line.

Sure
>
> > +             data->switch_modes[VIRTUAL_RR_MODE] =3D virtual_rr_vrr_ra=
nge_mode(output, vrefresh);
>
> Do we really need this 'VIRTUAL_RR_MODE' enum? Instead we can use a
> local variable.
>
> drmModeModeInfo mode =3D virtual_rr_vrr_range_mode(output, vrefresh);

Yea I think this new logic now doesnt require VIRTUAL_RR_MODE, earlier
as I only had one virtual mode I needed it.
Will change this to use a local variable.
Thanks for catching this.

>
> > +             igt_info("Requesting Virtual Mode with Refresh Rate (%u H=
z): \n", vrefresh);
> > +             kmstest_dump_mode(&data->switch_modes[VIRTUAL_RR_MODE]);
>
> Please add a new line here.

Sure

Regards
Manasi

>
> > +             igt_output_override_mode(output, &data->switch_modes[VIRT=
UAL_RR_MODE]);
> > +             igt_assert(igt_display_try_commit_atomic(&data->display, =
0, NULL) =3D=3D 0);
> > +
> > +             rate =3D rate_from_refresh(vrefresh);
> > +             result =3D flip_and_measure(data, output, pipe, rate, 1, =
TEST_DURATION_NS);
> > +             igt_assert_f(result > 75,
> > +                          "Refresh rate (%u Hz) %"PRIu64"ns: Target th=
reshold not reached, result was %u%%\n",
> > +                          vrefresh, rate, result);
> > +     }
> > +}
> > +
> >   static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *=
output)
> >   {
> >       if (vrr_capable(output))
> > @@ -686,7 +748,7 @@ static bool output_constraint(data_t *data, igt_out=
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
> > @@ -841,6 +903,10 @@ igt_main_args("drs:", long_opts, help_str, opt_han=
dler, &data)
> >                            "between flip timestamps converges to the re=
quested rate");
> >               igt_subtest_with_dynamic("flip-basic-fastset")
> >                       run_vrr_test(&data, test_basic, TEST_FASTSET);
> > +
> > +             igt_describe("Test to switch to any custom virtual mode i=
n VRR range without modeset.");
> > +             igt_subtest_with_dynamic("seamless-virtual-rr-switch")
> > +                     run_vrr_test(&data, test_seamless_virtual_rr_basi=
c, TEST_SEAMLESS_VIRTUAL_RR);
> >       }
> >
> >       igt_fixture {
