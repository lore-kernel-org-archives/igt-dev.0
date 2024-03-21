Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E77BC6FD1F
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 21:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A24112143;
	Thu, 21 Mar 2024 21:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bTZ32nV6";
	dkim-atps=neutral
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFAF112143
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 21:15:48 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-513cf9bacf1so2006255e87.0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 14:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711055746; x=1711660546;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dCJNts2+E6kTlmffT1k2vHO/wPApigtXMWgzn+OP3hk=;
 b=bTZ32nV6ah3kbiNgZ2JItlNQndmiht3Z/ET7MZO1qvvQailGQHor2v8e/I9NW1mMfy
 VBqV7MBSkTwhLVGpgyuAqELjdzs6rprvgYRb6kjmqBi2xJfA3wfkllSxcOgVi2zjaULX
 hmaNVjhExeU+wBVNBLhFifC9CegI1R9JR9IAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055746; x=1711660546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dCJNts2+E6kTlmffT1k2vHO/wPApigtXMWgzn+OP3hk=;
 b=SXeL51YWoBOTPudC9PsyKNqT3kKSuPE9JN5VTfz0EpZNuf9DVcOYHoUXNSmJehVgZ1
 AJINS3WG+WVultM1OA/0Kl4VX9U134zLzmWG7lMOeOqhrcpB5W9VSxVvJDZuDeqDUfei
 fzE7zHjSzdYpqOoo1qmwRgyYD8GuTZUL9zE9zaZkwq6WuEc9qLnTqobOVTBjgx3xDPSj
 CiAY0/2VydyzNYNVI2J/V0OXQ4TITo+uhhyV1AjxTXJNkkKVTEjIMpbUXPH3RLik2h7z
 lgZH7Ha9CNKrx8jjAvYwGrO8PdJmFRjf3WIKek5Kwsy8SDE+EamifrTIyhX5P2duFj2e
 T2SA==
X-Gm-Message-State: AOJu0Yzhmtk5gb/MyaiBcQjc+6j73uHIdliaAq36opvxmXWKaZTIAIu1
 GxmuIyUw9QKLZUqdz16e2jrBu/vzuHtUBXqo4aur4yDbsmig1pNXVFCm9/prg5ut9Ptc6gas1Cr
 /TrGhTv1lV+gJH8RsLZhQJia8ES/jEj7qYmJgznLwvmStfVM=
X-Google-Smtp-Source: AGHT+IGeRYaYcyu16IPag/CEw9/9kmnvPQsvXw4T+LIHFbqO0n010oOKF+ZDzTT5qOF19w3YnOpPkSUFjPpIwq96HbE=
X-Received: by 2002:ac2:5edb:0:b0:513:93dd:9ecd with SMTP id
 d27-20020ac25edb000000b0051393dd9ecdmr365333lfq.21.1711055746461; Thu, 21 Mar
 2024 14:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240319163338.3993235-1-navaremanasi@chromium.org>
 <814d2a46-d01c-4f20-9b55-ef960a376e81@intel.com>
In-Reply-To: <814d2a46-d01c-4f20-9b55-ef960a376e81@intel.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Thu, 21 Mar 2024 14:15:35 -0700
Message-ID: <CAE72mNnh9_OZA6ce27ayWUja3U_4p-ovPPJT=WkMN8iD7_97BA@mail.gmail.com>
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

Hi Bhanu,

Thanks for the review.
With the Seamless Virtual RR test case that I have added, we are
essentially testing creating a Virtual Mode explicitly defined and
that switch to such a mode can happen seamlessly using the VRR
fastset/LRR functionality.
Here we also cover the entire VRR range by defining the virtual mode
in the 10Hz refresh rate steps across the entire VRR range.

So this is different than just flip-basic-fastset test. Could you
please review this?

Manasi

On Thu, Mar 21, 2024 at 1:04=E2=80=AFAM Modem, Bhanuprakash
<bhanuprakash.modem@intel.com> wrote:
>
> Hi Manasi,
>
> Thanks for the patch.
>
> I don't have much exposure on this virtual LRR modes. From this patch,
> atleast I understood that you are trying to switch different refresh
> rates (without modeset) within the VRR range. And we are pretty much
> doing the same with the subtest 'igt@kms_vrr@flip-basic-fastset' with 3
> different rates.
>
> Is there anything else we are going to achieve with this patch? Please
> throw some knowledge on this.
>
> - Bhanu
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
> > +     drmModeModeInfo mode =3D *igt_output_get_mode(output);
> > +     uint64_t clock_hz =3D mode.clock * 1000;
> > +
> > +     mode.vtotal =3D clock_hz / (mode.htotal * virtual_refresh_rate);
> > +     mode.vrefresh =3D virtual_refresh_rate;
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
> > +             data->switch_modes[VIRTUAL_RR_MODE] =3D virtual_rr_vrr_ra=
nge_mode(output, vrefresh);
> > +             igt_info("Requesting Virtual Mode with Refresh Rate (%u H=
z): \n", vrefresh);
> > +             kmstest_dump_mode(&data->switch_modes[VIRTUAL_RR_MODE]);
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
