Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA96CD1292
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 17:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DBF113346;
	Thu,  4 Apr 2024 17:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Xp/+DHBW";
	dkim-atps=neutral
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EA4113346
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 17:01:24 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-56e2b3e114fso121342a12.2
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Apr 2024 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712250082; x=1712854882;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZUGcg7WSr15MWB5NntvwBx4TCxLfeahYOJV2ImTyrQ=;
 b=Xp/+DHBWf/x59Whfvf2bG5m5wSfiIRHQBVtKp5UPoR+02zFUjfE0LnxotGCCMYyOfc
 D2dNbF9OqJ6SsaL75v6/YUMG9X76x0n52D3d1hEvHpNDyLuf7Txy2Jy6+VmRnMBiJDzy
 QKDXzfDe7qkTLdBHMsd1Gc5fJfq54hx3Yiqv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712250082; x=1712854882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZUGcg7WSr15MWB5NntvwBx4TCxLfeahYOJV2ImTyrQ=;
 b=u0wo5+E/P3NE6cp43DfE6Y+xEnq2KFqtMRJJi1UqAkMWJU0oulGMELCq6SDimclSPL
 52hnSBtpElLcxY5KIfo/Au0QP1PVSBDJ5pygeF7opyFaSS18kD5dxpZhexGk99nAMNgG
 DdvJefR4VEseqDlF47/CwMy6wvi3r3mjR5EG4iYvj1pqf9WxiXTYtIB3UKk4xj0XLuG4
 nzuFHB/HJfiztVj+jFJlL9Mp1poBP5jTItplb85zGtH5vTwr7Y3WhGv12MpcHggMbAlX
 kZ+g9XXBrC7VZG8HGUhSl0+6/vWWmU4O1xAfPi7ch+5GNsuSr+FsIo2hxhb5iA3AJRVG
 COPg==
X-Gm-Message-State: AOJu0YwR7wj1pU+GMgcMaVo0DnQcZk5rJwDUl/aAKmoylPaM5Uza0D6b
 P+/Cge2A55PIws6YEJGSch8860fU55NF5R8yjg4SzIerGW4jtlwc+QLaQZuYGXDLZDahGLod3Fu
 YhZPAycu9v9sZkDBSKVs6pYefeO/0KRUQ9vSc3SF0pA7DaBs=
X-Google-Smtp-Source: AGHT+IFWBmdcRBaqOSFmFFFIdNUD1fi2cXxr16AjI8rDsnpZRfxjjf0ZFlzYOBWgn1S3+Fx8+rhia6/bRawia3eXxSs=
X-Received: by 2002:a17:906:3649:b0:a51:947f:5992 with SMTP id
 r9-20020a170906364900b00a51947f5992mr924087ejb.75.1712250082461; Thu, 04 Apr
 2024 10:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240325230519.1787483-1-navaremanasi@chromium.org>
In-Reply-To: <20240325230519.1787483-1-navaremanasi@chromium.org>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Thu, 4 Apr 2024 10:01:11 -0700
Message-ID: <CAE72mNns74wxYEcTqisfxKBEDkT==xT+=GDU+CU979qAHP6s8Q@mail.gmail.com>
Subject: Re: [PATCH v5] tests/kms_vrr: Add a subtest for seamless modeset to a
 virtual LRR mode
To: igt-dev@lists.freedesktop.org
Cc: Drew Davenport <ddavenport@chromium.org>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
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

I have addressed the review comments, could you please review this
when you get a chance?

Regards
Manasi

On Mon, Mar 25, 2024 at 4:05=E2=80=AFPM Manasi Navare <navaremanasi@chromiu=
m.org> wrote:
>
> This subtest validates LRR fastset functionality by testing seamless swit=
ching
> without full modeset to any of the virtual LRR mode within VRR range.
> Here we start from highest refresh rate mode and then switch to virtual L=
RR
> modes in the steps of 10Hz within the VRR range.
>
> This is used to test the LRR fastset functionality of the driver.
>
> v4:
> - Change the test name to align with drrs/vrr tests (Bhanu)
> - Fix some build warnings due to rebase
> - Use a local virtual_mode variable
>
> v3:
> - Fix build error due to rebase (Manasi)
>
> Cc: Drew Davenport <ddavenport@chromium.org>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
> ---
>  tests/kms_vrr.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 68 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 15c62b34b..d838647bd 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -66,6 +66,11 @@
>   * Description: Test to switch RR seamlessly without modeset.
>   * Functionality: adaptive_sync, drrs
>   *
> + * SUBTEST: seamless-rr-switch-virtual
> + * Description: Test to create a Virtual Mode in VRR range and switch to=
 it
> + *             without a full modeset.
> + * Functionality: LRR
> + *
>   * SUBTEST: max-min
>   * Description: Oscillates between highest and lowest refresh each frame=
 for
>   *              manual flicker profiling
> @@ -89,9 +94,10 @@ enum {
>         TEST_FLIPLINE =3D 1 << 3,
>         TEST_SEAMLESS_VRR =3D 1 << 4,
>         TEST_SEAMLESS_DRRS =3D 1 << 5,
> -       TEST_FASTSET =3D 1 << 6,
> -       TEST_MAXMIN =3D 1 << 7,
> -       TEST_NEGATIVE =3D 1 << 8,
> +       TEST_SEAMLESS_VIRTUAL_RR =3D 1 << 6,
> +       TEST_FASTSET =3D 1 << 7,
> +       TEST_MAXMIN =3D 1 << 8,
> +       TEST_NEGATIVE =3D 1 << 9,
>  };
>
>  enum {
> @@ -214,6 +220,18 @@ low_rr_mode_with_same_res(igt_output_t *output, unsi=
gned int vrr_min)
>         return mode;
>  }
>
> +static drmModeModeInfo
> +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_ref=
resh_rate)
> +{
> +       drmModeModeInfo mode =3D *igt_output_get_mode(output);
> +       uint64_t clock_hz =3D mode.clock * 1000;
> +
> +       mode.vtotal =3D clock_hz / (mode.htotal * virtual_refresh_rate);
> +       mode.vrefresh =3D virtual_refresh_rate;
> +
> +       return mode;
> +}
> +
>  /* Read min and max vrr range from the connector debugfs. */
>  static range_t
>  get_vrr_range(data_t *data, igt_output_t *output)
> @@ -641,6 +659,48 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe,=
 igt_output_t *output, uint3
>                      vrr ? "on" : "off", vrr ? "not reached" : "exceeded"=
, result);
>  }
>
> +static void
> +test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_=
t *output, uint32_t flags)
> +{
> +       uint32_t result;
> +       unsigned int vrefresh;
> +       uint64_t rate[] =3D {0};
> +
> +       igt_info("Use HIGH_RR Mode as default\n");
> +       kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +
> +       prepare_test(data, output, pipe);
> +       rate[0] =3D rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vr=
efresh);
> +
> +       /*
> +        * Sink with DRR and VRR can be in downclock mode so
> +        * switch to highest refresh rate mode.
> +        */
> +       igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE=
]);
> +       igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE=
_PAGE_FLIP_EVENT, NULL) =3D=3D 0);
> +
> +       result =3D flip_and_measure(data, output, pipe, rate, 1, TEST_DUR=
ATION_NS);
> +       igt_assert_f(result > 75,
> +                    "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold =
not reached, result was %u%%\n",
> +                    data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], =
result);
> +
> +       /* Switch to Virtual RR */
> +       for (vrefresh =3D data->range.min + 10; vrefresh < data->range.ma=
x; vrefresh +=3D 10) {
> +               drmModeModeInfo virtual_mode =3D virtual_rr_vrr_range_mod=
e(output, vrefresh);
> +               igt_info("Requesting Virtual Mode with Refresh Rate (%u H=
z): \n", vrefresh);
> +               kmstest_dump_mode(&virtual_mode);
> +
> +               igt_output_override_mode(output, &virtual_mode);
> +               igt_assert(igt_display_try_commit_atomic(&data->display, =
0, NULL) =3D=3D 0);
> +
> +               rate[0] =3D rate_from_refresh(vrefresh);
> +               result =3D flip_and_measure(data, output, pipe, rate[0], =
1, TEST_DURATION_NS);
> +               igt_assert_f(result > 75,
> +                            "Refresh rate (%u Hz) %"PRIu64"ns: Target th=
reshold not reached, result was %u%%\n",
> +                            vrefresh, rate[0], result);
> +       }
> +}
> +
>  static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *out=
put)
>  {
>         if (vrr_capable(output))
> @@ -686,7 +746,7 @@ static bool output_constraint(data_t *data, igt_outpu=
t_t *output, uint32_t flags
>         igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE=
]);
>
>         /* Search for a low refresh rate mode. */
> -       if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
> +       if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAM=
LESS_VIRTUAL_RR)))
>                 return true;
>
>         data->switch_modes[LOW_RR_MODE] =3D low_rr_mode_with_same_res(out=
put, data->range.min);
> @@ -841,6 +901,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handl=
er, &data)
>                              "between flip timestamps converges to the re=
quested rate");
>                 igt_subtest_with_dynamic("flip-basic-fastset")
>                         run_vrr_test(&data, test_basic, TEST_FASTSET);
> +
> +               igt_describe("Test to switch to any custom virtual mode i=
n VRR range without modeset.");
> +               igt_subtest_with_dynamic("seamless-rr-switch-virtual")
> +                       run_vrr_test(&data, test_seamless_virtual_rr_basi=
c, TEST_SEAMLESS_VIRTUAL_RR);
>         }
>
>         igt_fixture {
> --
> 2.44.0.396.g6e790dbe36-goog
>
