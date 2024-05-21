Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF4C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 16:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBC310E46A;
	Tue, 21 May 2024 16:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Iqs3AcQI";
	dkim-atps=neutral
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A00110E46A
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 16:04:20 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so9380800a12.3
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 09:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716307459; x=1716912259;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMnMSb6Ve3EzezmB62/KvZdyyORLXdC96TlTc0IF3lA=;
 b=Iqs3AcQIqWF0N6gtVvUza0MbvyQ/FtOh9C8Kmqc/RR+2tD+ie11Owp4kUHnL83SBPg
 2Akit6Eys7IW8aDz1Y+YE+pUqJw5KMT52ub+IQwBpn+uJAf7HEzgJ6UN18928HfgIW/L
 EXuYXFtmaEvCEp5E5w0eoj/e2kjCD88Jrc0cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716307459; x=1716912259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aMnMSb6Ve3EzezmB62/KvZdyyORLXdC96TlTc0IF3lA=;
 b=ZsqAuw5FikOir51KjjMH1xCAnYFbHZJjv1HLBpdSa1dgCfa7MWKIFHyWz8m2O9i/w9
 BtXuf7Tp7zI2tDJIF0typNeSmY59IxKE1X0hdgcJJw5CrlK3KCaPkY0zI4q+hdbDSvT1
 UQ6eELTL5h+arbDs65ruKGRwC2oE/K1r+A11VGeO3Qmf4isByGzOfg1fH/F3i4Lm4QUx
 rI+RZPPcHalc5mBuzQi5A+gyBPUCkcXoVzkYL3j0d5ozu5RN1+pUmrxTnveoXMr6vQiF
 LV7PHpr3lr9UDSDtABZfhGd6zl0gHPrghnmXltyKce9EBJUL4mnBD6uVplglPNiXWV7Z
 GnQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgibvok/qiCgMk9onE+oRNmzUIivkAKJk+uD12D5ztwP7sZ56yS4vCPoBixNXLLfIJ7KdHQSF9xKoIGDxa/iU/8MV0FIOPGOGlXAkxZQ==
X-Gm-Message-State: AOJu0YwYqHTAe8ZJueyOXH4anQFugFl/LpdG7lIMx9QbDujmsU0MS0MF
 2YTjzyRIswDqrFbPTNtdX87EOyUk+JmDsT8MjhVMt3khA8ixwLPgoLpe3fvgXA8wc+ZOQhwR764
 2ASmAHTQZgoAqK5wtLm6Bo+lv5bbGvvKIVzfK
X-Google-Smtp-Source: AGHT+IF0ixt4HzOBlV50fRu83MMq6N0Xq7Cv5EcWr2zSJprinO8ZGsg7nXPvCC+GH3Rhrf7hCOQWad8N8yCH9MFrJ94=
X-Received: by 2002:a50:99c7:0:b0:56e:2e10:7dad with SMTP id
 4fb4d7f45d1cf-574f831f472mr12490394a12.35.1716307458606; Tue, 21 May 2024
 09:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240424201344.783935-1-navaremanasi@chromium.org>
 <64cef3df-1610-4d53-a44c-905220e09b76@intel.com>
 <CAE72mNmRsA-KcZ61F6d4Pg5_OQnpifO7AmivE2AkhN_0WT=eTw@mail.gmail.com>
 <682dccc4-c788-4bfd-b8ef-b24d60b488d6@intel.com>
 <DM8PR11MB565517E06CDBA9B389BA86BCE0162@DM8PR11MB5655.namprd11.prod.outlook.com>
 <CAE72mNkYFsViPR18xcT=WZyjNrMSJ6Gq14MUbMzUVHarDfDb6Q@mail.gmail.com>
 <6ca5030f-005f-446d-a49a-be08cc8e6e0f@intel.com>
 <CAE72mNm6UuTO=PBhdOcCngMGoE1+6Qbku0RkaPuDetiaRPWEcA@mail.gmail.com>
 <f7b85a6d-45cc-4d94-a8b2-9785f69b11cd@intel.com>
 <SJ0PR11MB566435FFD29A8ABCF47A54DBE0EA2@SJ0PR11MB5664.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB566435FFD29A8ABCF47A54DBE0EA2@SJ0PR11MB5664.namprd11.prod.outlook.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Tue, 21 May 2024 09:04:07 -0700
Message-ID: <CAE72mN=Jgs2_AE4gumQ3GYQncXy1OtVNmE0nV=EGajNUyyUfOg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless modeset
 to a virtual LRR mode
To: "Saarinen, Jani" <jani.saarinen@intel.com>
Cc: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Drew Davenport <ddavenport@chromium.org>, 
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

Great thank you so much for all the reviews and validation. And thanks
Juha for merging the patch.

Regards
Manasi

On Mon, May 20, 2024 at 11:50=E2=80=AFPM Saarinen, Jani <jani.saarinen@inte=
l.com> wrote:
>
> Hi,
> > -----Original Message-----
> > From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > Sent: Tuesday, 21 May 2024 8.23
> > To: Manasi Navare <navaremanasi@chromium.org>
> > Cc: Saarinen, Jani <jani.saarinen@intel.com>; igt-dev@lists.freedesktop=
.org;
> > Drew Davenport <ddavenport@chromium.org>; Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com>; Sean Paul <seanpaul@chromium.org>
> > Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless
> > modeset to a virtual LRR mode
> >
> >
> > On 21-05-2024 10:16 am, Manasi Navare wrote:
> > > Hi Bhanu,
> > >
> > > Yes I have verified that, it looks good and I have also been running
> > > this on my Chromebook with VRR panel and it works fine.
> > > Could you please review and help get this landed?
> >
> > Thanks for the confirmation, this patch is already merged by JP.
> > https://cgit.freedesktop.org/drm/igt-gpu-
> > tools/commit/?id=3D927fecf906d25e88f19bc245982c022465276528
> Yes, as you Manasi see from " Re: =E2=9C=97 Fi.CI.BAT: failure for series=
 starting with [v3,1/2] tests/kms_vrr: Add a subtest for seamless modeset t=
o a virtual LRR mode (rev3)"
> " Hi Manasi,
>
> I merged your patch.
>
> /Juha-Pekka"
>
>
> >
> > - Bhanu
> >
> > >
> > > Manasi
> > >
> > > On Mon, May 20, 2024 at 12:54=E2=80=AFAM Modem, Bhanuprakash
> > > <bhanuprakash.modem@intel.com> wrote:
> > >>
> > >> Hi Manasi,
> > >>
> > >> Sorry for replying late, I was in vacation.
> > >>
> > >> On 27-04-2024 12:54 am, Manasi Navare wrote:
> > >>> Hi Bhanu, Jani,
> > >>>
> > >>> I do see that even the other vrr tests : seamless-rr-switch-vrr
> > >>> /drrs/ basic-fastset are getting skipped on BAT, so its not related
> > >>> to this test. I am able to run it here locally and test.
> > >>> Could you please take a look and see why all of these would be
> > >>> skipped? Seems unrelated to this change.
> > >>
> > >> In case of seamless-rr-switch-(vrr|drrs), these skips are expected,
> > >> as we don't have any valid config. These tests are eDP specific &
> > >> panel should have the modes with different refresh rates & clocks
> > >> with same resolution.
> > >>
> > >> In case of seamless-rr-switch-virtual, it is a connector agnostic
> > >> test, it should run on one of the BAT machines.
> > >>
> > >> Can you please review the helper low_rr_mode_with_same_res() once, a=
s
> > >> you are using this one to pick the low RR mode?
> > >>
> > >>>
> > >>> Regards
> > >>> Manasi
> > >>>
> > >>> On Fri, Apr 26, 2024 at 12:48=E2=80=AFAM Saarinen, Jani
> > <jani.saarinen@intel.com> wrote:
> > >>>>
> > >>>> Hi,
> > >>>>> -----Original Message-----
> > >>>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf O=
f
> > >>>>> Modem, Bhanuprakash
> > >>>>> Sent: Friday, 26 April 2024 6.44
> > >>>>> To: Manasi Navare <navaremanasi@chromium.org>
> > >>>>> Cc: igt-dev@lists.freedesktop.org; Drew Davenport
> > >>>>> <ddavenport@chromium.org>; Ville Syrj=C3=A4l=C3=A4
> > >>>>> <ville.syrjala@linux.intel.com>; Sean Paul <seanpaul@chromium.org=
>
> > >>>>> Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for
> > >>>>> seamless modeset to a virtual LRR mode
> > >>>>>
> > >>>>> Hi Manasi,
> > >>>>>
> > >>>>> On 25-04-2024 08:50 pm, Manasi Navare wrote:
> > >>>>>> Hi Bhanu,
> > >>>>>>
> > >>>>>> Thanks for the review.
> > >>>>>> This is not specific to edp, it applies to all connectors.
> > >>>>>>
> > >>>>>> If the BAT results look okay and I have your r-b, could we get t=
his
> > merged?
> > >>>> Did you look those.
> > >>>>
> > >>>>>
> > >>>>> Looks, BAT results are not OK to me.
> > >>>> Right. To me looks so too.
> > >>>>
> > >>>>>
> > >>>>> The newly added test is getting skip on VRR configs:
> > >>>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-
> > >>>>> all.html?testfilter=3Dkms_vrr&hosts=3Dbat-adlp-6%7Cbat-adlp-9%7Cb=
at-rp
> > >>>>> ls-
> > >>>>> 4%7Cbat-adls-6
> > >>>>>
> > >>>>> - Bhanu
> > >>>>>
> > >>>>>>
> > >>>>>> Regards
> > >>>>>> Manasi
> > >>>>>>
> > >>>>>> On Thu, Apr 25, 2024 at 12:39=E2=80=AFAM Modem, Bhanuprakash
> > >>>>>> <bhanuprakash.modem@intel.com> wrote:
> > >>>>>>>
> > >>>>>>> Hi Manasi,
> > >>>>>>>
> > >>>>>>> On 25-04-2024 01:43 am, Manasi Navare wrote:
> > >>>>>>>> This subtest validates LRR fastset functionality by testing
> > >>>>>>>> seamless switching without full modeset to any of the virtual
> > >>>>>>>> LRR mode within VRR
> > >>>>> range.
> > >>>>>>>> Here we start from highest refresh rate mode and then switch t=
o
> > >>>>>>>> virtual LRR modes in the steps of 10Hz within the VRR range.
> > >>>>>>>>
> > >>>>>>>> This is used to test the LRR fastset functionality of the driv=
er.
> > >>>>>>>>
> > >>>>>>>> v5:
> > >>>>>>>> - Pass a reference to flip_and_measure (bhanu)
> > >>>>>>>> - Add a new line between between declaration and code logic
> > >>>>>>>>
> > >>>>>>>> v4:
> > >>>>>>>> - Change the test name to align with drrs/vrr tests (Bhanu)
> > >>>>>>>> - Fix some build warnings due to rebase
> > >>>>>>>> - Use a local virtual_mode variable
> > >>>>>>>>
> > >>>>>>>> v3:
> > >>>>>>>> - Fix build error due to rebase (Manasi)
> > >>>>>>>>
> > >>>>>>>> Cc: Drew Davenport <ddavenport@chromium.org>
> > >>>>>>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > >>>>>>>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >>>>>>>> Cc: Sean Paul <seanpaul@chromium.org>
> > >>>>>>>> Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
> > >>>>>>>> ---
> > >>>>>>>>      tests/kms_vrr.c | 73
> > >>>>> ++++++++++++++++++++++++++++++++++++++++++++++---
> > >>>>>>>>      1 file changed, 69 insertions(+), 4 deletions(-)
> > >>>>>>>>
> > >>>>>>>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index
> > >>>>>>>> 15c62b34b..7f64d6806 100644
> > >>>>>>>> --- a/tests/kms_vrr.c
> > >>>>>>>> +++ b/tests/kms_vrr.c
> > >>>>>>>> @@ -66,6 +66,11 @@
> > >>>>>>>>       * Description: Test to switch RR seamlessly without mode=
set.
> > >>>>>>>>       * Functionality: adaptive_sync, drrs
> > >>>>>>>>       *
> > >>>>>>>> + * SUBTEST: seamless-rr-switch-virtual
> > >>>>>>>> + * Description: Test to create a Virtual Mode in VRR range an=
d
> > >>>>>>>> + switch to
> > >>>>> it
> > >>>>>>>> + *           without a full modeset.
> > >>>>>>>> + * Functionality: LRR
> > >>>>>>>> + *
> > >>>>>>>>       * SUBTEST: max-min
> > >>>>>>>>       * Description: Oscillates between highest and lowest
> > >>>>>>>> refresh each
> > >>>>> frame for
> > >>>>>>>>       *              manual flicker profiling
> > >>>>>>>> @@ -89,9 +94,10 @@ enum {
> > >>>>>>>>          TEST_FLIPLINE =3D 1 << 3,
> > >>>>>>>>          TEST_SEAMLESS_VRR =3D 1 << 4,
> > >>>>>>>>          TEST_SEAMLESS_DRRS =3D 1 << 5,
> > >>>>>>>> -     TEST_FASTSET =3D 1 << 6,
> > >>>>>>>> -     TEST_MAXMIN =3D 1 << 7,
> > >>>>>>>> -     TEST_NEGATIVE =3D 1 << 8,
> > >>>>>>>> +     TEST_SEAMLESS_VIRTUAL_RR =3D 1 << 6,
> > >>>>>>>> +     TEST_FASTSET =3D 1 << 7,
> > >>>>>>>> +     TEST_MAXMIN =3D 1 << 8,
> > >>>>>>>> +     TEST_NEGATIVE =3D 1 << 9,
> > >>>>>>>>      };
> > >>>>>>>>
> > >>>>>>>>      enum {
> > >>>>>>>> @@ -214,6 +220,18 @@
> > low_rr_mode_with_same_res(igt_output_t
> > >>>>> *output, unsigned int vrr_min)
> > >>>>>>>>          return mode;
> > >>>>>>>>      }
> > >>>>>>>>
> > >>>>>>>> +static drmModeModeInfo
> > >>>>>>>> +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int
> > >>>>>>>> +virtual_refresh_rate) {
> > >>>>>>>> +     drmModeModeInfo mode =3D *igt_output_get_mode(output);
> > >>>>>>>> +     uint64_t clock_hz =3D mode.clock * 1000;
> > >>>>>>>> +
> > >>>>>>>> +     mode.vtotal =3D clock_hz / (mode.htotal * virtual_refres=
h_rate);
> > >>>>>>>> +     mode.vrefresh =3D virtual_refresh_rate;
> > >>>>>>>> +
> > >>>>>>>> +     return mode;
> > >>>>>>>> +}
> > >>>>>>>> +
> > >>>>>>>>      /* Read min and max vrr range from the connector debugfs.=
 */
> > >>>>>>>>      static range_t
> > >>>>>>>>      get_vrr_range(data_t *data, igt_output_t *output) @@
> > >>>>>>>> -641,6
> > >>>>>>>> +659,49 @@ test_seamless_rr_basic(data_t *data, enum pipe
> > pipe,
> > >>>>> igt_output_t *output, uint3
> > >>>>>>>>                       vrr ? "on" : "off", vrr ? "not reached" =
: "exceeded",
> > result);
> > >>>>>>>>      }
> > >>>>>>>>
> > >>>>>>>> +static void
> > >>>>>>>> +test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe,
> > >>>>>>>> +igt_output_t *output, uint32_t flags) {
> > >>>>>>>> +     uint32_t result;
> > >>>>>>>> +     unsigned int vrefresh;
> > >>>>>>>> +     uint64_t rate[] =3D {0};
> > >>>>>>>> +
> > >>>>>>>> +     igt_info("Use HIGH_RR Mode as default\n");
> > >>>>>>>> +     kmstest_dump_mode(&data-
> > >switch_modes[HIGH_RR_MODE]);
> > >>>>>>>> +
> > >>>>>>>> +     prepare_test(data, output, pipe);
> > >>>>>>>> +     rate[0] =3D
> > >>>>>>>> + rate_from_refresh(data-
> > >switch_modes[HIGH_RR_MODE].vrefresh);
> > >>>>>>>> +
> > >>>>>>>> +     /*
> > >>>>>>>> +      * Sink with DRR and VRR can be in downclock mode so
> > >>>>>>>> +      * switch to highest refresh rate mode.
> > >>>>>>>> +      */
> > >>>>>>>> +     igt_output_override_mode(output, &data-
> > >>>>>> switch_modes[HIGH_RR_MODE]);
> > >>>>>>>> +     igt_assert(igt_display_try_commit_atomic(&data->display,
> > >>>>>>>> + DRM_MODE_PAGE_FLIP_EVENT, NULL) =3D=3D 0);
> > >>>>>>>> +
> > >>>>>>>> +     result =3D flip_and_measure(data, output, pipe, rate, 1,
> > >>>>> TEST_DURATION_NS);
> > >>>>>>>> +     igt_assert_f(result > 75,
> > >>>>>>>> +                  "Refresh rate (%u Hz) %"PRIu64"ns: Target
> > >>>>>>>> + threshold not
> > >>>>> reached, result was %u%%\n",
> > >>>>>>>> +                  data->switch_modes[HIGH_RR_MODE].vrefresh,
> > >>>>>>>> + rate[0], result);
> > >>>>>>>> +
> > >>>>>>>> +     /* Switch to Virtual RR */
> > >>>>>>>> +     for (vrefresh =3D data->range.min + 10; vrefresh <
> > >>>>>>>> + data->range.max;
> > >>>>> vrefresh +=3D 10) {
> > >>>>>>>> +             drmModeModeInfo virtual_mode =3D
> > >>>>>>>> + virtual_rr_vrr_range_mode(output, vrefresh);
> > >>>>>>>> +
> > >>>>>>>> +             igt_info("Requesting Virtual Mode with Refresh
> > >>>>>>>> + Rate (%u Hz): \n",
> > >>>>> vrefresh);
> > >>>>>>>> +             kmstest_dump_mode(&virtual_mode);
> > >>>>>>>> +
> > >>>>>>>> +             igt_output_override_mode(output, &virtual_mode);
> > >>>>>>>> +
> > >>>>>>>> + igt_assert(igt_display_try_commit_atomic(&data->display, 0,
> > >>>>>>>> + NULL) =3D=3D 0);
> > >>>>>>>> +
> > >>>>>>>> +             rate[0] =3D rate_from_refresh(vrefresh);
> > >>>>>>>> +             result =3D flip_and_measure(data, output, pipe,
> > >>>>>>>> + rate, 1,
> > >>>>> TEST_DURATION_NS);
> > >>>>>>>> +             igt_assert_f(result > 75,
> > >>>>>>>> +                          "Refresh rate (%u Hz) %"PRIu64"ns:
> > >>>>>>>> + Target threshold not
> > >>>>> reached, result was %u%%\n",
> > >>>>>>>> +                          vrefresh, rate[0], result);
> > >>>>>>>> +     }
> > >>>>>>>> +}
> > >>>>>>>> +
> > >>>>>>>>      static void test_cleanup(data_t *data, enum pipe pipe,
> > >>>>>>>> igt_output_t
> > >>>>> *output)
> > >>>>>>>>      {
> > >>>>>>>>          if (vrr_capable(output)) @@ -686,7 +747,7 @@ static
> > >>>>>>>> bool output_constraint(data_t *data,
> > >>>>> igt_output_t *output, uint32_t flags
> > >>>>>>>>          igt_output_override_mode(output,
> > >>>>>>>> &data->switch_modes[HIGH_RR_MODE]);
> > >>>>>>>>
> > >>>>>>>>          /* Search for a low refresh rate mode. */
> > >>>>>>>> -     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
> > >>>>>>>> +     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
> > >>>>>>>> + TEST_SEAMLESS_VIRTUAL_RR)))
> > >>>>>>>
> > >>>>>>> Does this virtual RR applicable to eDP only or supports other
> > >>>>>>> connector types too? If it is eDP specific [*], then we must ad=
d
> > >>>>>>> a check for
> > >>>>> that.
> > >>>>>>>
> > >>>>>>> [*]:
> > >>>>>>> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_v=
r
> > >>>>>>> r.c#n
> > >>>>>>> 660
> > >>>>>>>
> > >>>>>>> With above comment addressed, this patch is
> > >>>>>>> Reviewed-by: Bhanuprakash Modem
> > <bhanuprakash.modem@intel.com>
> > >>>>>>>
> > >>>>>>> - Bhanu
> > >>>>>>>
> > >>>>>>>>                  return true;
> > >>>>>>>>
> > >>>>>>>>          data->switch_modes[LOW_RR_MODE] =3D
> > >>>>>>>> low_rr_mode_with_same_res(output, data->range.min); @@ -
> > 841,6
> > >>>>> +902,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handler=
,
> > >>>>> +&data)
> > >>>>>>>>                               "between flip timestamps
> > >>>>>>>> converges to the requested
> > >>>>> rate");
> > >>>>>>>>                  igt_subtest_with_dynamic("flip-basic-fastset"=
)
> > >>>>>>>>                          run_vrr_test(&data, test_basic,
> > >>>>>>>> TEST_FASTSET);
> > >>>>>>>> +
> > >>>>>>>> +             igt_describe("Test to switch to any custom
> > >>>>>>>> + virtual mode in VRR
> > >>>>> range without modeset.");
> > >>>>>>>> +             igt_subtest_with_dynamic("seamless-rr-switch-vir=
tual")
> > >>>>>>>> +                     run_vrr_test(&data,
> > >>>>>>>> + test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
> > >>>>>>>>          }
> > >>>>>>>>
> > >>>>>>>>          igt_fixture {
