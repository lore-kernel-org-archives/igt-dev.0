Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846D1C4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 07:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD5010EE71;
	Wed,  1 May 2024 07:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jgZh89UN";
	dkim-atps=neutral
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD1010EE71
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 07:32:58 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a58989cd1f8so834068366b.1
 for <igt-dev@lists.freedesktop.org>; Wed, 01 May 2024 00:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714548777; x=1715153577;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gMPBgr+fMnA4RdO532voltm0ZLxvk6UgpQ8+1Yv6c1s=;
 b=jgZh89UNvClcMoCfvekcoXXp4it/9gEpyc/cY9coXVlvMj/hXJUXNO7focyNHvOo2r
 bnU5SF3KsNdtpABL8+SJpHeAmf/YoZqfp7PEyMxDXFFR02PrkHRfduaoQyvdU2qFSacs
 cvp8nMQODwOTHURVysK4OcxQZa+QDYzpV1ArQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714548777; x=1715153577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gMPBgr+fMnA4RdO532voltm0ZLxvk6UgpQ8+1Yv6c1s=;
 b=jeh83aN6rzsS0/DwsrKxipbJN+is5RuC8C/uJZHWbSNNFZibPcfAmG9nb/q550Z6ng
 FYNXewB0UoTk7DedX4zcxPWBx1HxctIqb6y0v9SsSh12TaDqU+eU50ojf1EmefoIuN33
 MP8CS31qLW612W6C1hG5pU/X2VrluGP+zsF8fPPfXzbrd17nKTWvEyhemc6xEOihF8B2
 7ylYwsz7WFRnoMMcDOHfBi7tpBS6cQ08gn7FzscG0XYz9NicgNg7Vrpv7b+EDYRW7DZ+
 ZSNPG15Kdq7jH3/hsC3p1LZ+fJ8ikVQmr2Ctnmw3e6w3OzVDNf4Ym0RBkV5ant+Iaxl0
 xtPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUevn7NlRDF5ridkaXmL7Fgr4veuM5xPFK0rgz4SfK6YaXDhZKOW500P611Uilw2gWDE0ap110Y3Df3tUVMvKINYpkGfpcqz78SeuLaUg==
X-Gm-Message-State: AOJu0YwXw32NCWDFwLt8hhpXoLTTTUpO0GJ+jRx6qiri5XK7D7EQrz4I
 LVFOeQxCWSbIImDF6OY6X+DyEr++uKOKYIKlfCm1SCFi3gTiM5oT+Go8sHub17/auh3uSro8WeN
 N+Nb3twG+IyCI4UsvhM0JHNcwuC2IzOVQvwvs
X-Google-Smtp-Source: AGHT+IHseRNRaW+Oo28hDxSetx0fVgIdgCW2CQ1HgsWuouKHan340yiz3FtoFoIbpO9R+FysPDJtaCwassugROotvD8=
X-Received: by 2002:a17:906:2591:b0:a52:2441:277 with SMTP id
 m17-20020a170906259100b00a5224410277mr1026338ejb.66.1714548777048; Wed, 01
 May 2024 00:32:57 -0700 (PDT)
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
 <CAE72mNkNRn-y+exzjNuVj8bO3rb+E6-kzXtozOakH8R6eHnBbg@mail.gmail.com>
In-Reply-To: <CAE72mNkNRn-y+exzjNuVj8bO3rb+E6-kzXtozOakH8R6eHnBbg@mail.gmail.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Wed, 1 May 2024 00:32:45 -0700
Message-ID: <CAE72mNk=YSD88ixaDGbO85phQYagwQp2==ssy-=93GFgoRdFOg@mail.gmail.com>
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

Hi Jani, Bhanu,

Even with the rerun there are some skips that are not related to the
changes in this test. Could you please take a look and merge this
since Bhanu already reviewed this.

Regards
Manasi

On Tue, Apr 30, 2024 at 10:03=E2=80=AFAM Manasi Navare
<navaremanasi@chromium.org> wrote:
>
> Hi Bhanu,
>
> Could you please get this landed?
>
> Regards
> Manasi
>
> On Fri, Apr 26, 2024 at 1:03=E2=80=AFPM Saarinen, Jani <jani.saarinen@int=
el.com> wrote:
> >
> > Hi,
> > > -----Original Message-----
> > > From: Manasi Navare <navaremanasi@chromium.org>
> > > Sent: Friday, 26 April 2024 22.46
> > > To: Saarinen, Jani <jani.saarinen@intel.com>
> > > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
> > > dev@lists.freedesktop.org; Drew Davenport <ddavenport@chromium.org>;
> > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>; Sean Paul
> > > <seanpaul@chromium.org>
> > > Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless
> > > modeset to a virtual LRR mode
> > >
> > > Great thanks Jani,
> > >
> > > Could you please kick in a re run on your end?
> > Done: https://patchwork.freedesktop.org/series/132866/#rev2
> >
> > >
> > > Regards
> > > Manasi
> > >
> > > On Fri, Apr 26, 2024 at 12:42=E2=80=AFPM Saarinen, Jani <jani.saarine=
n@intel.com>
> > > wrote:
> > > >
> > > > Hi,
> > > >
> > > > > -----Original Message-----
> > > > > From: Manasi Navare <navaremanasi@chromium.org>
> > > > > Sent: Friday, 26 April 2024 22.25
> > > > > To: Saarinen, Jani <jani.saarinen@intel.com>
> > > > > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
> > > > > dev@lists.freedesktop.org; Drew Davenport
> > > <ddavenport@chromium.org>;
> > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>; Sean Pau=
l
> > > > > <seanpaul@chromium.org>
> > > > > Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for
> > > > > seamless modeset to a virtual LRR mode
> > > > >
> > > > > Hi Bhanu, Jani,
> > > > >
> > > > > I do see that even the other vrr tests : seamless-rr-switch-vrr
> > > > > /drrs/ basic- fastset are getting skipped on BAT, so its not rela=
ted
> > > > > to this test. I am able to run it here locally and test.
> > > > I was mainly looking at https://patchwork.freedesktop.org/series/13=
2866/
> > > >         Possible regressions
> > > >         igt@debugfs_test@read_all_entries:
> > > >
> > > >         bat-arls-2: PASS -> FAIL +18 other tests fail
> > > >         igt@gem_exec_fence@nb-await:
> > > >
> > > >         bat-arls-2: NOTRUN -> INCOMPLETE +7 other tests incomplete
> > > >         igt@kms_addfb_basic@addfb25-modifier-no-flag:
> > > >
> > > >         bat-arls-2: PASS -> INCOMPLETE +37 other tests incomplete
> > > >         igt@kms_vrr@seamless-rr-switch-virtual (NEW):
> > > >
> > > > but there was some hw maintenance done today to this setup
> > > > (bar-arls-2) so maybe safest would be re-run to see latest
> > > >
> > > > > Could you please take a look and see why all of these would be sk=
ipped?
> > > > > Seems unrelated to this change.
> > > > >
> > > > > Regards
> > > > > Manasi
> > > > >
> > > > > On Fri, Apr 26, 2024 at 12:48=E2=80=AFAM Saarinen, Jani
> > > > > <jani.saarinen@intel.com>
> > > > > wrote:
> > > > > >
> > > > > > Hi,
> > > > > > > -----Original Message-----
> > > > > > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Beha=
lf
> > > > > > > Of Modem, Bhanuprakash
> > > > > > > Sent: Friday, 26 April 2024 6.44
> > > > > > > To: Manasi Navare <navaremanasi@chromium.org>
> > > > > > > Cc: igt-dev@lists.freedesktop.org; Drew Davenport
> > > > > > > <ddavenport@chromium.org>; Ville Syrj=C3=A4l=C3=A4
> > > > > > > <ville.syrjala@linux.intel.com>; Sean Paul
> > > > > > > <seanpaul@chromium.org>
> > > > > > > Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for
> > > > > > > seamless modeset to a virtual LRR mode
> > > > > > >
> > > > > > > Hi Manasi,
> > > > > > >
> > > > > > > On 25-04-2024 08:50 pm, Manasi Navare wrote:
> > > > > > > > Hi Bhanu,
> > > > > > > >
> > > > > > > > Thanks for the review.
> > > > > > > > This is not specific to edp, it applies to all connectors.
> > > > > > > >
> > > > > > > > If the BAT results look okay and I have your r-b, could we =
get
> > > > > > > > this
> > > > > merged?
> > > > > > Did you look those.
> > > > > >
> > > > > > >
> > > > > > > Looks, BAT results are not OK to me.
> > > > > > Right. To me looks so too.
> > > > > >
> > > > > > >
> > > > > > > The newly added test is getting skip on VRR configs:
> > > > > > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-
> > > > > > > all.html?testfilter=3Dkms_vrr&hosts=3Dbat-adlp-6%7Cbat-adlp-9=
%7Cbat-
> > > > > > > rpls
> > > > > > > -
> > > > > > > 4%7Cbat-adls-6
> > > > > > >
> > > > > > > - Bhanu
> > > > > > >
> > > > > > > >
> > > > > > > > Regards
> > > > > > > > Manasi
> > > > > > > >
> > > > > > > > On Thu, Apr 25, 2024 at 12:39=E2=80=AFAM Modem, Bhanuprakas=
h
> > > > > > > > <bhanuprakash.modem@intel.com> wrote:
> > > > > > > >>
> > > > > > > >> Hi Manasi,
> > > > > > > >>
> > > > > > > >> On 25-04-2024 01:43 am, Manasi Navare wrote:
> > > > > > > >>> This subtest validates LRR fastset functionality by testi=
ng
> > > > > > > >>> seamless switching without full modeset to any of the
> > > > > > > >>> virtual LRR mode within VRR
> > > > > > > range.
> > > > > > > >>> Here we start from highest refresh rate mode and then swi=
tch
> > > > > > > >>> to virtual LRR modes in the steps of 10Hz within the VRR =
range.
> > > > > > > >>>
> > > > > > > >>> This is used to test the LRR fastset functionality of the=
 driver.
> > > > > > > >>>
> > > > > > > >>> v5:
> > > > > > > >>> - Pass a reference to flip_and_measure (bhanu)
> > > > > > > >>> - Add a new line between between declaration and code log=
ic
> > > > > > > >>>
> > > > > > > >>> v4:
> > > > > > > >>> - Change the test name to align with drrs/vrr tests (Bhan=
u)
> > > > > > > >>> - Fix some build warnings due to rebase
> > > > > > > >>> - Use a local virtual_mode variable
> > > > > > > >>>
> > > > > > > >>> v3:
> > > > > > > >>> - Fix build error due to rebase (Manasi)
> > > > > > > >>>
> > > > > > > >>> Cc: Drew Davenport <ddavenport@chromium.org>
> > > > > > > >>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > > > > > > >>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.co=
m>
> > > > > > > >>> Cc: Sean Paul <seanpaul@chromium.org>
> > > > > > > >>> Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
> > > > > > > >>> ---
> > > > > > > >>>    tests/kms_vrr.c | 73
> > > > > > > ++++++++++++++++++++++++++++++++++++++++++++++---
> > > > > > > >>>    1 file changed, 69 insertions(+), 4 deletions(-)
> > > > > > > >>>
> > > > > > > >>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index
> > > > > > > >>> 15c62b34b..7f64d6806 100644
> > > > > > > >>> --- a/tests/kms_vrr.c
> > > > > > > >>> +++ b/tests/kms_vrr.c
> > > > > > > >>> @@ -66,6 +66,11 @@
> > > > > > > >>>     * Description: Test to switch RR seamlessly without m=
odeset.
> > > > > > > >>>     * Functionality: adaptive_sync, drrs
> > > > > > > >>>     *
> > > > > > > >>> + * SUBTEST: seamless-rr-switch-virtual
> > > > > > > >>> + * Description: Test to create a Virtual Mode in VRR ran=
ge
> > > > > > > >>> + and switch to
> > > > > > > it
> > > > > > > >>> + *           without a full modeset.
> > > > > > > >>> + * Functionality: LRR
> > > > > > > >>> + *
> > > > > > > >>>     * SUBTEST: max-min
> > > > > > > >>>     * Description: Oscillates between highest and lowest
> > > > > > > >>> refresh each
> > > > > > > frame for
> > > > > > > >>>     *              manual flicker profiling
> > > > > > > >>> @@ -89,9 +94,10 @@ enum {
> > > > > > > >>>        TEST_FLIPLINE =3D 1 << 3,
> > > > > > > >>>        TEST_SEAMLESS_VRR =3D 1 << 4,
> > > > > > > >>>        TEST_SEAMLESS_DRRS =3D 1 << 5,
> > > > > > > >>> -     TEST_FASTSET =3D 1 << 6,
> > > > > > > >>> -     TEST_MAXMIN =3D 1 << 7,
> > > > > > > >>> -     TEST_NEGATIVE =3D 1 << 8,
> > > > > > > >>> +     TEST_SEAMLESS_VIRTUAL_RR =3D 1 << 6,
> > > > > > > >>> +     TEST_FASTSET =3D 1 << 7,
> > > > > > > >>> +     TEST_MAXMIN =3D 1 << 8,
> > > > > > > >>> +     TEST_NEGATIVE =3D 1 << 9,
> > > > > > > >>>    };
> > > > > > > >>>
> > > > > > > >>>    enum {
> > > > > > > >>> @@ -214,6 +220,18 @@
> > > low_rr_mode_with_same_res(igt_output_t
> > > > > > > *output, unsigned int vrr_min)
> > > > > > > >>>        return mode;
> > > > > > > >>>    }
> > > > > > > >>>
> > > > > > > >>> +static drmModeModeInfo
> > > > > > > >>> +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned
> > > > > > > >>> +int
> > > > > > > >>> +virtual_refresh_rate) {
> > > > > > > >>> +     drmModeModeInfo mode =3D *igt_output_get_mode(outpu=
t);
> > > > > > > >>> +     uint64_t clock_hz =3D mode.clock * 1000;
> > > > > > > >>> +
> > > > > > > >>> +     mode.vtotal =3D clock_hz / (mode.htotal * virtual_r=
efresh_rate);
> > > > > > > >>> +     mode.vrefresh =3D virtual_refresh_rate;
> > > > > > > >>> +
> > > > > > > >>> +     return mode;
> > > > > > > >>> +}
> > > > > > > >>> +
> > > > > > > >>>    /* Read min and max vrr range from the connector debug=
fs. */
> > > > > > > >>>    static range_t
> > > > > > > >>>    get_vrr_range(data_t *data, igt_output_t *output) @@
> > > > > > > >>> -641,6
> > > > > > > >>> +659,49 @@ test_seamless_rr_basic(data_t *data, enum pipe
> > > > > > > >>> +pipe,
> > > > > > > igt_output_t *output, uint3
> > > > > > > >>>                     vrr ? "on" : "off", vrr ? "not reache=
d" : "exceeded", result);
> > > > > > > >>>    }
> > > > > > > >>>
> > > > > > > >>> +static void
> > > > > > > >>> +test_seamless_virtual_rr_basic(data_t *data, enum pipe
> > > > > > > >>> +pipe, igt_output_t *output, uint32_t flags) {
> > > > > > > >>> +     uint32_t result;
> > > > > > > >>> +     unsigned int vrefresh;
> > > > > > > >>> +     uint64_t rate[] =3D {0};
> > > > > > > >>> +
> > > > > > > >>> +     igt_info("Use HIGH_RR Mode as default\n");
> > > > > > > >>> +     kmstest_dump_mode(&data-
> > > >switch_modes[HIGH_RR_MODE]);
> > > > > > > >>> +
> > > > > > > >>> +     prepare_test(data, output, pipe);
> > > > > > > >>> +     rate[0] =3D
> > > > > > > >>> + rate_from_refresh(data-
> > > >switch_modes[HIGH_RR_MODE].vrefres
> > > > > > > >>> + h);
> > > > > > > >>> +
> > > > > > > >>> +     /*
> > > > > > > >>> +      * Sink with DRR and VRR can be in downclock mode s=
o
> > > > > > > >>> +      * switch to highest refresh rate mode.
> > > > > > > >>> +      */
> > > > > > > >>> +     igt_output_override_mode(output, &data-
> > > > > > > >switch_modes[HIGH_RR_MODE]);
> > > > > > > >>> +
> > > > > > > >>> + igt_assert(igt_display_try_commit_atomic(&data->display=
,
> > > > > > > >>> + DRM_MODE_PAGE_FLIP_EVENT, NULL) =3D=3D 0);
> > > > > > > >>> +
> > > > > > > >>> +     result =3D flip_and_measure(data, output, pipe, rat=
e, 1,
> > > > > > > TEST_DURATION_NS);
> > > > > > > >>> +     igt_assert_f(result > 75,
> > > > > > > >>> +                  "Refresh rate (%u Hz) %"PRIu64"ns: Tar=
get
> > > > > > > >>> + threshold not
> > > > > > > reached, result was %u%%\n",
> > > > > > > >>> +
> > > > > > > >>> + data->switch_modes[HIGH_RR_MODE].vrefresh,
> > > > > > > >>> + rate[0], result);
> > > > > > > >>> +
> > > > > > > >>> +     /* Switch to Virtual RR */
> > > > > > > >>> +     for (vrefresh =3D data->range.min + 10; vrefresh <
> > > > > > > >>> + data->range.max;
> > > > > > > vrefresh +=3D 10) {
> > > > > > > >>> +             drmModeModeInfo virtual_mode =3D
> > > > > > > >>> + virtual_rr_vrr_range_mode(output, vrefresh);
> > > > > > > >>> +
> > > > > > > >>> +             igt_info("Requesting Virtual Mode with Refr=
esh
> > > > > > > >>> + Rate (%u Hz): \n",
> > > > > > > vrefresh);
> > > > > > > >>> +             kmstest_dump_mode(&virtual_mode);
> > > > > > > >>> +
> > > > > > > >>> +             igt_output_override_mode(output,
> > > > > > > >>> + &virtual_mode);
> > > > > > > >>> +
> > > > > > > >>> + igt_assert(igt_display_try_commit_atomic(&data->display=
,
> > > > > > > >>> + 0,
> > > > > > > >>> + NULL) =3D=3D 0);
> > > > > > > >>> +
> > > > > > > >>> +             rate[0] =3D rate_from_refresh(vrefresh);
> > > > > > > >>> +             result =3D flip_and_measure(data, output, p=
ipe,
> > > > > > > >>> + rate, 1,
> > > > > > > TEST_DURATION_NS);
> > > > > > > >>> +             igt_assert_f(result > 75,
> > > > > > > >>> +                          "Refresh rate (%u Hz) %"PRIu64=
"ns:
> > > > > > > >>> + Target threshold not
> > > > > > > reached, result was %u%%\n",
> > > > > > > >>> +                          vrefresh, rate[0], result);
> > > > > > > >>> +     }
> > > > > > > >>> +}
> > > > > > > >>> +
> > > > > > > >>>    static void test_cleanup(data_t *data, enum pipe pipe,
> > > > > > > >>> igt_output_t
> > > > > > > *output)
> > > > > > > >>>    {
> > > > > > > >>>        if (vrr_capable(output)) @@ -686,7 +747,7 @@ stati=
c
> > > > > > > >>> bool output_constraint(data_t *data,
> > > > > > > igt_output_t *output, uint32_t flags
> > > > > > > >>>        igt_output_override_mode(output,
> > > > > > > >>> &data->switch_modes[HIGH_RR_MODE]);
> > > > > > > >>>
> > > > > > > >>>        /* Search for a low refresh rate mode. */
> > > > > > > >>> -     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DR=
RS)))
> > > > > > > >>> +     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DR=
RS
> > > > > > > >>> + |
> > > > > > > >>> + TEST_SEAMLESS_VIRTUAL_RR)))
> > > > > > > >>
> > > > > > > >> Does this virtual RR applicable to eDP only or supports ot=
her
> > > > > > > >> connector types too? If it is eDP specific [*], then we mu=
st
> > > > > > > >> add a check for
> > > > > > > that.
> > > > > > > >>
> > > > > > > >> [*]:
> > > > > > > >> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/=
kms
> > > > > > > >> _vrr
> > > > > > > >> .c#n
> > > > > > > >> 660
> > > > > > > >>
> > > > > > > >> With above comment addressed, this patch is
> > > > > > > >> Reviewed-by: Bhanuprakash Modem
> > > > > <bhanuprakash.modem@intel.com>
> > > > > > > >>
> > > > > > > >> - Bhanu
> > > > > > > >>
> > > > > > > >>>                return true;
> > > > > > > >>>
> > > > > > > >>>        data->switch_modes[LOW_RR_MODE] =3D
> > > > > > > >>> low_rr_mode_with_same_res(output, data->range.min); @@
> > > > > > > >>> -841,6
> > > > > > > +902,10 @@ igt_main_args("drs:", long_opts, help_str,
> > > > > > > +opt_handler,
> > > > > > > +&data)
> > > > > > > >>>                             "between flip timestamps
> > > > > > > >>> converges to the requested
> > > > > > > rate");
> > > > > > > >>>                igt_subtest_with_dynamic("flip-basic-fasts=
et")
> > > > > > > >>>                        run_vrr_test(&data, test_basic,
> > > > > > > >>> TEST_FASTSET);
> > > > > > > >>> +
> > > > > > > >>> +             igt_describe("Test to switch to any custom
> > > > > > > >>> + virtual mode in VRR
> > > > > > > range without modeset.");
> > > > > > > >>> +             igt_subtest_with_dynamic("seamless-rr-switc=
h-virtual")
> > > > > > > >>> +                     run_vrr_test(&data,
> > > > > > > >>> + test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_R=
R);
> > > > > > > >>>        }
> > > > > > > >>>
> > > > > > > >>>        igt_fixture {
