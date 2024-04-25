Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC7BC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 15:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB5111A544;
	Thu, 25 Apr 2024 15:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cYBvUHd/";
	dkim-atps=neutral
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A2C11A544
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 15:21:02 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso1383731a12.2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 08:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714058460; x=1714663260;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AMR9cwMOHBgKcd/R3pRZFn6KHORoTDFw0LDPJCbt+NA=;
 b=cYBvUHd/E4fUjoCNpKeX2IIPKl9Iod8v3P+Zo0S9q8JonvwjlU2QFrOBlJo4WG3yY0
 2EQu78ma+zgpHi5NGjb2fIJFtuC95fe5f7kB8LrapSpy+rk+vO6dPBDfQmMaCOs0S9Ei
 sA8b83M5zq8i2XF5KQoMxhul736vmEGJglJJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714058460; x=1714663260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AMR9cwMOHBgKcd/R3pRZFn6KHORoTDFw0LDPJCbt+NA=;
 b=wiAheftTvwK6Gs8hDkRF9sl4sZAHyyJgZV1RVjHeqoB7NY+HvLUpD4QezR9Xxc4OhS
 8iYXWJcAqCYX29L1BDJvY2gIhkBJNBFi2TjNGMM2vxlw7cJSSYTkq9WyL+4lsn62sezY
 8hNv1svzBL82PzPg2Fm7AFJFj4gU01nrKcWROCgvzwbYfTpoMKHqGLAQ/gyDskncBMvA
 PNIyY2ZIVO7MCE2abQWB7ydcR23IFNepizR2qAncvw8u/4hsZzo4zGQuZShznynN+dV/
 VjgS+tPOFd3iqMpnf0tWcHprTIF3CMjNMo4m+mushABplCGkU+O56ybyhqAMCjl7dCHD
 PrRQ==
X-Gm-Message-State: AOJu0Yzs/GzR+kDkllfM93KiW5fuD3s+bjXeEfZVLDvuVM8zcFtpAE98
 gUKjqHYWCxSGbEET74PO90c3K3j1fbsMz8hwIA3PEo5Yn/OfxQf7FbonUR4hrhfCF8mwu+0zmNp
 nskh0llOe0zgRrnu6FwUwn2DdGar6VJ8zW0ZL
X-Google-Smtp-Source: AGHT+IE7CmJkKkF/DbhY4FUuj+9TP7/4MohUCb4VjH+sYeotnoPn0oFY17K1fK0fp6y8UB2UNOK5QjvGmQVLw03CbfA=
X-Received: by 2002:a50:9552:0:b0:56d:c748:4792 with SMTP id
 v18-20020a509552000000b0056dc7484792mr3990868eda.41.1714058460492; Thu, 25
 Apr 2024 08:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240424201344.783935-1-navaremanasi@chromium.org>
 <64cef3df-1610-4d53-a44c-905220e09b76@intel.com>
In-Reply-To: <64cef3df-1610-4d53-a44c-905220e09b76@intel.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Thu, 25 Apr 2024 08:20:49 -0700
Message-ID: <CAE72mNmRsA-KcZ61F6d4Pg5_OQnpifO7AmivE2AkhN_0WT=eTw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless modeset
 to a virtual LRR mode
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

Thanks for the review.
This is not specific to edp, it applies to all connectors.

If the BAT results look okay and I have your r-b, could we get this merged?

Regards
Manasi

On Thu, Apr 25, 2024 at 12:39=E2=80=AFAM Modem, Bhanuprakash
<bhanuprakash.modem@intel.com> wrote:
>
> Hi Manasi,
>
> On 25-04-2024 01:43 am, Manasi Navare wrote:
> > This subtest validates LRR fastset functionality by testing seamless sw=
itching
> > without full modeset to any of the virtual LRR mode within VRR range.
> > Here we start from highest refresh rate mode and then switch to virtual=
 LRR
> > modes in the steps of 10Hz within the VRR range.
> >
> > This is used to test the LRR fastset functionality of the driver.
> >
> > v5:
> > - Pass a reference to flip_and_measure (bhanu)
> > - Add a new line between between declaration and code logic
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
> >   tests/kms_vrr.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++--=
-
> >   1 file changed, 69 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> > index 15c62b34b..7f64d6806 100644
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
> > @@ -641,6 +659,49 @@ test_seamless_rr_basic(data_t *data, enum pipe pip=
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
> > +
> > +             igt_info("Requesting Virtual Mode with Refresh Rate (%u H=
z): \n", vrefresh);
> > +             kmstest_dump_mode(&virtual_mode);
> > +
> > +             igt_output_override_mode(output, &virtual_mode);
> > +             igt_assert(igt_display_try_commit_atomic(&data->display, =
0, NULL) =3D=3D 0);
> > +
> > +             rate[0] =3D rate_from_refresh(vrefresh);
> > +             result =3D flip_and_measure(data, output, pipe, rate, 1, =
TEST_DURATION_NS);
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
> > @@ -686,7 +747,7 @@ static bool output_constraint(data_t *data, igt_out=
put_t *output, uint32_t flags
> >       igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE=
]);
> >
> >       /* Search for a low refresh rate mode. */
> > -     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
> > +     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAM=
LESS_VIRTUAL_RR)))
>
> Does this virtual RR applicable to eDP only or supports other connector
> types too? If it is eDP specific [*], then we must add a check for that.
>
> [*]:
> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_vrr.c#n660
>
> With above comment addressed, this patch is
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>
> - Bhanu
>
> >               return true;
> >
> >       data->switch_modes[LOW_RR_MODE] =3D low_rr_mode_with_same_res(out=
put, data->range.min);
> > @@ -841,6 +902,10 @@ igt_main_args("drs:", long_opts, help_str, opt_han=
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
