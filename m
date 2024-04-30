Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150F6C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 17:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2651112D3C;
	Tue, 30 Apr 2024 17:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Orr5XnQz";
	dkim-atps=neutral
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A7A112D3C
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 17:03:16 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a55911bff66so729968866b.0
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 10:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714496594; x=1715101394;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emBHM0d39QGqbRDNZKpbQYyc3rQLSrQeXLYscW/7WkA=;
 b=Orr5XnQzMhX5/oGhwxqks1S4U6BK2wPmp+VUaIXTEX/ZFz6sMMdHgUs2jV9LBLiFtc
 EUQDQ40BriPyuQBX6m4/e6sz+vaXTTnxfVNRN67OfmTlKWQ+2bIEVjLsCTIVrMm6JVC3
 Vfkt3Mysy+RCG7Ro08QveoWUlgNdrAksHv44o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714496594; x=1715101394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=emBHM0d39QGqbRDNZKpbQYyc3rQLSrQeXLYscW/7WkA=;
 b=nM0jjcVIu2KoeqjyWZOlRvYLScTtukZnomy59satA71gASzEFWhfmTfhfjSPeOzX+S
 vUh+A0RDnCWuS3x7YEMK7J5Rcy9z4VoPXP6die+/BysZhweCUmaAa8PboV7Fd7e9D9Rm
 mw8DICagqFxvV4cgZZSjYwliz8bFcyBvcR4xgSJT8j1fE1edQ3xc11ULPJBqBAdMfROI
 evV0MJ8UaziL0B4VEw+1/w0LTtt95nTU4hopowbs+Y+qDis/Wrncp0oVjv0xZH5f289+
 0YhVADWQGAOpMOrZkCKgw1DdKvT/qEcmOAeRdrDtOLPtRl6+7Pvd4k4fMxqjp2hst4yx
 aBug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYSyTczqbf2YkFw1EIwHmK/V8YTeERN1P+ot5d9wOlROWm7RY28NsxaP24wsuAtHhTJwHLpjl9RaMQr8fJREm27zfnrDstIk8MkmDWpg==
X-Gm-Message-State: AOJu0YyZqUHzhQjj+AM3dRcALlAAMWj6wGxowyYw+boh1iTY3+Q27gvE
 oPVIKQHRom6jXHT5ST8iOQp88aCJogI/6QuX9r8Kk63PrcyycAuZyjS2MTcO3EIXs01if9mCIN+
 wvJ2DYdTJxA3Jb+Ew/xG1puI94n2sensabZpS
X-Google-Smtp-Source: AGHT+IE0FlQkozI0/T3NpCkARjWNWMZaNiBkFgVUuiTfwAh0VelLa+h88BGvp9zGod4H1sr8FZjvZ7ybb5EEghyILnw=
X-Received: by 2002:a17:907:bb91:b0:a55:4378:9891 with SMTP id
 xo17-20020a170907bb9100b00a5543789891mr225268ejc.24.1714496594317; Tue, 30
 Apr 2024 10:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240424201344.783935-1-navaremanasi@chromium.org>
 <64cef3df-1610-4d53-a44c-905220e09b76@intel.com>
 <CAE72mNmRsA-KcZ61F6d4Pg5_OQnpifO7AmivE2AkhN_0WT=eTw@mail.gmail.com>
 <682dccc4-c788-4bfd-b8ef-b24d60b488d6@intel.com>
 <DM8PR11MB565517E06CDBA9B389BA86BCE0162@DM8PR11MB5655.namprd11.prod.outlook.com>
 <CAE72mNkYFsViPR18xcT=WZyjNrMSJ6Gq14MUbMzUVHarDfDb6Q@mail.gmail.com>
 <DM8PR11MB5655787FEAEED06EDF0C14A4E0162@DM8PR11MB5655.namprd11.prod.outlook.com>
 <CAE72mNnxKyjXLEHuZrEsEBfaD__m==s+rrpmjs=NC0Y=vEjCLg@mail.gmail.com>
 <DM8PR11MB5655C3845292E69F8B9D7BE4E0162@DM8PR11MB5655.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5655C3845292E69F8B9D7BE4E0162@DM8PR11MB5655.namprd11.prod.outlook.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Tue, 30 Apr 2024 10:03:03 -0700
Message-ID: <CAE72mNkNRn-y+exzjNuVj8bO3rb+E6-kzXtozOakH8R6eHnBbg@mail.gmail.com>
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

Hi Bhanu,

Could you please get this landed?

Regards
Manasi

On Fri, Apr 26, 2024 at 1:03=E2=80=AFPM Saarinen, Jani <jani.saarinen@intel=
.com> wrote:
>
> Hi,
> > -----Original Message-----
> > From: Manasi Navare <navaremanasi@chromium.org>
> > Sent: Friday, 26 April 2024 22.46
> > To: Saarinen, Jani <jani.saarinen@intel.com>
> > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
> > dev@lists.freedesktop.org; Drew Davenport <ddavenport@chromium.org>;
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>; Sean Paul
> > <seanpaul@chromium.org>
> > Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless
> > modeset to a virtual LRR mode
> >
> > Great thanks Jani,
> >
> > Could you please kick in a re run on your end?
> Done: https://patchwork.freedesktop.org/series/132866/#rev2
>
> >
> > Regards
> > Manasi
> >
> > On Fri, Apr 26, 2024 at 12:42=E2=80=AFPM Saarinen, Jani <jani.saarinen@=
intel.com>
> > wrote:
> > >
> > > Hi,
> > >
> > > > -----Original Message-----
> > > > From: Manasi Navare <navaremanasi@chromium.org>
> > > > Sent: Friday, 26 April 2024 22.25
> > > > To: Saarinen, Jani <jani.saarinen@intel.com>
> > > > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
> > > > dev@lists.freedesktop.org; Drew Davenport
> > <ddavenport@chromium.org>;
> > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>; Sean Paul
> > > > <seanpaul@chromium.org>
> > > > Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for
> > > > seamless modeset to a virtual LRR mode
> > > >
> > > > Hi Bhanu, Jani,
> > > >
> > > > I do see that even the other vrr tests : seamless-rr-switch-vrr
> > > > /drrs/ basic- fastset are getting skipped on BAT, so its not relate=
d
> > > > to this test. I am able to run it here locally and test.
> > > I was mainly looking at https://patchwork.freedesktop.org/series/1328=
66/
> > >         Possible regressions
> > >         igt@debugfs_test@read_all_entries:
> > >
> > >         bat-arls-2: PASS -> FAIL +18 other tests fail
> > >         igt@gem_exec_fence@nb-await:
> > >
> > >         bat-arls-2: NOTRUN -> INCOMPLETE +7 other tests incomplete
> > >         igt@kms_addfb_basic@addfb25-modifier-no-flag:
> > >
> > >         bat-arls-2: PASS -> INCOMPLETE +37 other tests incomplete
> > >         igt@kms_vrr@seamless-rr-switch-virtual (NEW):
> > >
> > > but there was some hw maintenance done today to this setup
> > > (bar-arls-2) so maybe safest would be re-run to see latest
> > >
> > > > Could you please take a look and see why all of these would be skip=
ped?
> > > > Seems unrelated to this change.
> > > >
> > > > Regards
> > > > Manasi
> > > >
> > > > On Fri, Apr 26, 2024 at 12:48=E2=80=AFAM Saarinen, Jani
> > > > <jani.saarinen@intel.com>
> > > > wrote:
> > > > >
> > > > > Hi,
> > > > > > -----Original Message-----
> > > > > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf
> > > > > > Of Modem, Bhanuprakash
> > > > > > Sent: Friday, 26 April 2024 6.44
> > > > > > To: Manasi Navare <navaremanasi@chromium.org>
> > > > > > Cc: igt-dev@lists.freedesktop.org; Drew Davenport
> > > > > > <ddavenport@chromium.org>; Ville Syrj=C3=A4l=C3=A4
> > > > > > <ville.syrjala@linux.intel.com>; Sean Paul
> > > > > > <seanpaul@chromium.org>
> > > > > > Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for
> > > > > > seamless modeset to a virtual LRR mode
> > > > > >
> > > > > > Hi Manasi,
> > > > > >
> > > > > > On 25-04-2024 08:50 pm, Manasi Navare wrote:
> > > > > > > Hi Bhanu,
> > > > > > >
> > > > > > > Thanks for the review.
> > > > > > > This is not specific to edp, it applies to all connectors.
> > > > > > >
> > > > > > > If the BAT results look okay and I have your r-b, could we ge=
t
> > > > > > > this
> > > > merged?
> > > > > Did you look those.
> > > > >
> > > > > >
> > > > > > Looks, BAT results are not OK to me.
> > > > > Right. To me looks so too.
> > > > >
> > > > > >
> > > > > > The newly added test is getting skip on VRR configs:
> > > > > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-
> > > > > > all.html?testfilter=3Dkms_vrr&hosts=3Dbat-adlp-6%7Cbat-adlp-9%7=
Cbat-
> > > > > > rpls
> > > > > > -
> > > > > > 4%7Cbat-adls-6
> > > > > >
> > > > > > - Bhanu
> > > > > >
> > > > > > >
> > > > > > > Regards
> > > > > > > Manasi
> > > > > > >
> > > > > > > On Thu, Apr 25, 2024 at 12:39=E2=80=AFAM Modem, Bhanuprakash
> > > > > > > <bhanuprakash.modem@intel.com> wrote:
> > > > > > >>
> > > > > > >> Hi Manasi,
> > > > > > >>
> > > > > > >> On 25-04-2024 01:43 am, Manasi Navare wrote:
> > > > > > >>> This subtest validates LRR fastset functionality by testing
> > > > > > >>> seamless switching without full modeset to any of the
> > > > > > >>> virtual LRR mode within VRR
> > > > > > range.
> > > > > > >>> Here we start from highest refresh rate mode and then switc=
h
> > > > > > >>> to virtual LRR modes in the steps of 10Hz within the VRR ra=
nge.
> > > > > > >>>
> > > > > > >>> This is used to test the LRR fastset functionality of the d=
river.
> > > > > > >>>
> > > > > > >>> v5:
> > > > > > >>> - Pass a reference to flip_and_measure (bhanu)
> > > > > > >>> - Add a new line between between declaration and code logic
> > > > > > >>>
> > > > > > >>> v4:
> > > > > > >>> - Change the test name to align with drrs/vrr tests (Bhanu)
> > > > > > >>> - Fix some build warnings due to rebase
> > > > > > >>> - Use a local virtual_mode variable
> > > > > > >>>
> > > > > > >>> v3:
> > > > > > >>> - Fix build error due to rebase (Manasi)
> > > > > > >>>
> > > > > > >>> Cc: Drew Davenport <ddavenport@chromium.org>
> > > > > > >>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > > > > > >>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > > > >>> Cc: Sean Paul <seanpaul@chromium.org>
> > > > > > >>> Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
> > > > > > >>> ---
> > > > > > >>>    tests/kms_vrr.c | 73
> > > > > > ++++++++++++++++++++++++++++++++++++++++++++++---
> > > > > > >>>    1 file changed, 69 insertions(+), 4 deletions(-)
> > > > > > >>>
> > > > > > >>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index
> > > > > > >>> 15c62b34b..7f64d6806 100644
> > > > > > >>> --- a/tests/kms_vrr.c
> > > > > > >>> +++ b/tests/kms_vrr.c
> > > > > > >>> @@ -66,6 +66,11 @@
> > > > > > >>>     * Description: Test to switch RR seamlessly without mod=
eset.
> > > > > > >>>     * Functionality: adaptive_sync, drrs
> > > > > > >>>     *
> > > > > > >>> + * SUBTEST: seamless-rr-switch-virtual
> > > > > > >>> + * Description: Test to create a Virtual Mode in VRR range
> > > > > > >>> + and switch to
> > > > > > it
> > > > > > >>> + *           without a full modeset.
> > > > > > >>> + * Functionality: LRR
> > > > > > >>> + *
> > > > > > >>>     * SUBTEST: max-min
> > > > > > >>>     * Description: Oscillates between highest and lowest
> > > > > > >>> refresh each
> > > > > > frame for
> > > > > > >>>     *              manual flicker profiling
> > > > > > >>> @@ -89,9 +94,10 @@ enum {
> > > > > > >>>        TEST_FLIPLINE =3D 1 << 3,
> > > > > > >>>        TEST_SEAMLESS_VRR =3D 1 << 4,
> > > > > > >>>        TEST_SEAMLESS_DRRS =3D 1 << 5,
> > > > > > >>> -     TEST_FASTSET =3D 1 << 6,
> > > > > > >>> -     TEST_MAXMIN =3D 1 << 7,
> > > > > > >>> -     TEST_NEGATIVE =3D 1 << 8,
> > > > > > >>> +     TEST_SEAMLESS_VIRTUAL_RR =3D 1 << 6,
> > > > > > >>> +     TEST_FASTSET =3D 1 << 7,
> > > > > > >>> +     TEST_MAXMIN =3D 1 << 8,
> > > > > > >>> +     TEST_NEGATIVE =3D 1 << 9,
> > > > > > >>>    };
> > > > > > >>>
> > > > > > >>>    enum {
> > > > > > >>> @@ -214,6 +220,18 @@
> > low_rr_mode_with_same_res(igt_output_t
> > > > > > *output, unsigned int vrr_min)
> > > > > > >>>        return mode;
> > > > > > >>>    }
> > > > > > >>>
> > > > > > >>> +static drmModeModeInfo
> > > > > > >>> +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned
> > > > > > >>> +int
> > > > > > >>> +virtual_refresh_rate) {
> > > > > > >>> +     drmModeModeInfo mode =3D *igt_output_get_mode(output)=
;
> > > > > > >>> +     uint64_t clock_hz =3D mode.clock * 1000;
> > > > > > >>> +
> > > > > > >>> +     mode.vtotal =3D clock_hz / (mode.htotal * virtual_ref=
resh_rate);
> > > > > > >>> +     mode.vrefresh =3D virtual_refresh_rate;
> > > > > > >>> +
> > > > > > >>> +     return mode;
> > > > > > >>> +}
> > > > > > >>> +
> > > > > > >>>    /* Read min and max vrr range from the connector debugfs=
. */
> > > > > > >>>    static range_t
> > > > > > >>>    get_vrr_range(data_t *data, igt_output_t *output) @@
> > > > > > >>> -641,6
> > > > > > >>> +659,49 @@ test_seamless_rr_basic(data_t *data, enum pipe
> > > > > > >>> +pipe,
> > > > > > igt_output_t *output, uint3
> > > > > > >>>                     vrr ? "on" : "off", vrr ? "not reached"=
 : "exceeded", result);
> > > > > > >>>    }
> > > > > > >>>
> > > > > > >>> +static void
> > > > > > >>> +test_seamless_virtual_rr_basic(data_t *data, enum pipe
> > > > > > >>> +pipe, igt_output_t *output, uint32_t flags) {
> > > > > > >>> +     uint32_t result;
> > > > > > >>> +     unsigned int vrefresh;
> > > > > > >>> +     uint64_t rate[] =3D {0};
> > > > > > >>> +
> > > > > > >>> +     igt_info("Use HIGH_RR Mode as default\n");
> > > > > > >>> +     kmstest_dump_mode(&data-
> > >switch_modes[HIGH_RR_MODE]);
> > > > > > >>> +
> > > > > > >>> +     prepare_test(data, output, pipe);
> > > > > > >>> +     rate[0] =3D
> > > > > > >>> + rate_from_refresh(data-
> > >switch_modes[HIGH_RR_MODE].vrefres
> > > > > > >>> + h);
> > > > > > >>> +
> > > > > > >>> +     /*
> > > > > > >>> +      * Sink with DRR and VRR can be in downclock mode so
> > > > > > >>> +      * switch to highest refresh rate mode.
> > > > > > >>> +      */
> > > > > > >>> +     igt_output_override_mode(output, &data-
> > > > > > >switch_modes[HIGH_RR_MODE]);
> > > > > > >>> +
> > > > > > >>> + igt_assert(igt_display_try_commit_atomic(&data->display,
> > > > > > >>> + DRM_MODE_PAGE_FLIP_EVENT, NULL) =3D=3D 0);
> > > > > > >>> +
> > > > > > >>> +     result =3D flip_and_measure(data, output, pipe, rate,=
 1,
> > > > > > TEST_DURATION_NS);
> > > > > > >>> +     igt_assert_f(result > 75,
> > > > > > >>> +                  "Refresh rate (%u Hz) %"PRIu64"ns: Targe=
t
> > > > > > >>> + threshold not
> > > > > > reached, result was %u%%\n",
> > > > > > >>> +
> > > > > > >>> + data->switch_modes[HIGH_RR_MODE].vrefresh,
> > > > > > >>> + rate[0], result);
> > > > > > >>> +
> > > > > > >>> +     /* Switch to Virtual RR */
> > > > > > >>> +     for (vrefresh =3D data->range.min + 10; vrefresh <
> > > > > > >>> + data->range.max;
> > > > > > vrefresh +=3D 10) {
> > > > > > >>> +             drmModeModeInfo virtual_mode =3D
> > > > > > >>> + virtual_rr_vrr_range_mode(output, vrefresh);
> > > > > > >>> +
> > > > > > >>> +             igt_info("Requesting Virtual Mode with Refres=
h
> > > > > > >>> + Rate (%u Hz): \n",
> > > > > > vrefresh);
> > > > > > >>> +             kmstest_dump_mode(&virtual_mode);
> > > > > > >>> +
> > > > > > >>> +             igt_output_override_mode(output,
> > > > > > >>> + &virtual_mode);
> > > > > > >>> +
> > > > > > >>> + igt_assert(igt_display_try_commit_atomic(&data->display,
> > > > > > >>> + 0,
> > > > > > >>> + NULL) =3D=3D 0);
> > > > > > >>> +
> > > > > > >>> +             rate[0] =3D rate_from_refresh(vrefresh);
> > > > > > >>> +             result =3D flip_and_measure(data, output, pip=
e,
> > > > > > >>> + rate, 1,
> > > > > > TEST_DURATION_NS);
> > > > > > >>> +             igt_assert_f(result > 75,
> > > > > > >>> +                          "Refresh rate (%u Hz) %"PRIu64"n=
s:
> > > > > > >>> + Target threshold not
> > > > > > reached, result was %u%%\n",
> > > > > > >>> +                          vrefresh, rate[0], result);
> > > > > > >>> +     }
> > > > > > >>> +}
> > > > > > >>> +
> > > > > > >>>    static void test_cleanup(data_t *data, enum pipe pipe,
> > > > > > >>> igt_output_t
> > > > > > *output)
> > > > > > >>>    {
> > > > > > >>>        if (vrr_capable(output)) @@ -686,7 +747,7 @@ static
> > > > > > >>> bool output_constraint(data_t *data,
> > > > > > igt_output_t *output, uint32_t flags
> > > > > > >>>        igt_output_override_mode(output,
> > > > > > >>> &data->switch_modes[HIGH_RR_MODE]);
> > > > > > >>>
> > > > > > >>>        /* Search for a low refresh rate mode. */
> > > > > > >>> -     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS=
)))
> > > > > > >>> +     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS
> > > > > > >>> + |
> > > > > > >>> + TEST_SEAMLESS_VIRTUAL_RR)))
> > > > > > >>
> > > > > > >> Does this virtual RR applicable to eDP only or supports othe=
r
> > > > > > >> connector types too? If it is eDP specific [*], then we must
> > > > > > >> add a check for
> > > > > > that.
> > > > > > >>
> > > > > > >> [*]:
> > > > > > >> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/km=
s
> > > > > > >> _vrr
> > > > > > >> .c#n
> > > > > > >> 660
> > > > > > >>
> > > > > > >> With above comment addressed, this patch is
> > > > > > >> Reviewed-by: Bhanuprakash Modem
> > > > <bhanuprakash.modem@intel.com>
> > > > > > >>
> > > > > > >> - Bhanu
> > > > > > >>
> > > > > > >>>                return true;
> > > > > > >>>
> > > > > > >>>        data->switch_modes[LOW_RR_MODE] =3D
> > > > > > >>> low_rr_mode_with_same_res(output, data->range.min); @@
> > > > > > >>> -841,6
> > > > > > +902,10 @@ igt_main_args("drs:", long_opts, help_str,
> > > > > > +opt_handler,
> > > > > > +&data)
> > > > > > >>>                             "between flip timestamps
> > > > > > >>> converges to the requested
> > > > > > rate");
> > > > > > >>>                igt_subtest_with_dynamic("flip-basic-fastset=
")
> > > > > > >>>                        run_vrr_test(&data, test_basic,
> > > > > > >>> TEST_FASTSET);
> > > > > > >>> +
> > > > > > >>> +             igt_describe("Test to switch to any custom
> > > > > > >>> + virtual mode in VRR
> > > > > > range without modeset.");
> > > > > > >>> +             igt_subtest_with_dynamic("seamless-rr-switch-=
virtual")
> > > > > > >>> +                     run_vrr_test(&data,
> > > > > > >>> + test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR)=
;
> > > > > > >>>        }
> > > > > > >>>
> > > > > > >>>        igt_fixture {
