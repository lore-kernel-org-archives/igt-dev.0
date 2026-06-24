Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB3BCDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 19:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5115610E0F1;
	Wed, 24 Jun 2026 19:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="rZnc8ogt";
	dkim-atps=neutral
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC4710E0F1
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 19:36:04 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-13981833e13so1823040c88.1
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 12:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782329764; cv=none;
 d=google.com; s=arc-20240605;
 b=FfE8F/RP0vWKMdmLK5CHsKlkhULYdrG7gWZQNJK69fsw2IZX9+HHXy1kiP1wO2a20T
 Hb467GrQeltI8+OYkH+Bl2m/u5YQ/9yGw45uq4Hn9FVhhednNk2nsnEAJJWKQW+J/8jd
 4AKg3JZLnTS0f8MLr9p48WcitGKQJMb0ypM2lO5UNvBZ9KYBDa+TJ38rSjd3U8UsfToc
 nPp68aeVnrWchrK4Prtg4NWkHeu0NxG+N4Xc7/W7Rlk+OnGtqc4/xFHqRjrYeMd2u1Xb
 jbi/0gyXzsgwmeE0FXwx5XY5EocPmXWhOfcxP8mZ0jvUWRzS6FC1oe3X4P+fDRQx/3/j
 jsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=naev4awr0opkAWbEtkfyjsjcwkuSOMrR9As8AzvbUWo=;
 fh=Tc952vv6JDoBaNSrZUFpmXX0uVRXdT+vEVq50nB4PoM=;
 b=emFkegMx7RcezN7K3/aCfJWOKOLlKLTqmInV3wYqC4dMFURXoBc2xPBoMXH/+mk/tE
 dePWRiCTsYTCzvf6f+T3LJWAbUv887E5RrqwMNihwclZPFZYJn4zaMmlZ/oGuKrGH0Tf
 3Exy8F3OWGw6ptjH6q/kyoNg6mYw3Fkd00JnHbTk+Q/lDj7llBZ2GiFVosp3YmbXd2u7
 yDZQ711hfpixVdl2wm36u5X2Ltd7TXDbn9CAr3iEWwjpLwhC10rQlE2whmOKOprwZPxC
 a/FKp4FH+9t8sQK27MlNcUrt9aC+/Py4zXb2PFAI18cyGz5OOkwxHT/Hiqy19EJ/RHFL
 TOdw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1782329764; x=1782934564;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=naev4awr0opkAWbEtkfyjsjcwkuSOMrR9As8AzvbUWo=;
 b=rZnc8ogtlYjJggVRzRkdGUgogfGWn2wGwVIEDp1I1JLuI4R/3ZcGj3LmByAHZfRl3n
 KqheUnlCy+2fU3fYJDfD/RNh2WlkZ1/IxRXURXoXs/zrVwpLFlYWDpiA92Do9VvRcuZ8
 3RbpkS1SH2HHxcdfehiaF+xcOpVXSQenmCAFXKBXg1f3LnEg6WF/SVb1OxuPLYQ236+4
 AWt6YNUMvUQIkT504XUo6g8UMki5k4XHN8MYRrdrdNCokai8weiK+8iQxl/NrnK5mU+n
 Tkpk/EIzYwVLbhF/6RrNejRn0tsgy4oeaYQ6g3m3HSVBuvvBUxbNzTkkeJF5Zt9qM85U
 SbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782329764; x=1782934564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=naev4awr0opkAWbEtkfyjsjcwkuSOMrR9As8AzvbUWo=;
 b=R8g1c1yDbOFbNg6ilfXCXsG6dIuOQgvvDQGN+S/k8aJ/vannwUjbtgy/gYXKf1jYvE
 e7eLh23/4AxKm7zgjeqkBR55Oa5zFrQ4tZdfOCDWyaIEjkhN7fMWQiQhBs8qzcz2+JP1
 NbbQqkk/qzvZDS88CKhwJ3FuGtpoDOKPdOol9NkyBhtZMnZwPcMOBspSi1RJEBN4Ix3Y
 9+/EA+BATdy9qE5MiPPGrLInqdjbtqGcyQkXSoHVzu7qRFrrOZXu82J1qjh/bQNY8N33
 Mw/F7iGf7TC5qc9nFQq90AoV+6/4sJmsoe7ss6OFT56RNTRiY++kK/WSWC0AfLLRZCIP
 SgSg==
X-Gm-Message-State: AOJu0YyJbcu9cNr8uNlPhocgdfZNPp8k9zu35/fVFlIpEsSK9Wo7D8Pb
 Y0ol0OSmki0zjP7Xj6T41m9Xn4L6+Z7oPD15XCPQClzwGTD0QTf7BQ7acULieapFq6mLXS8YZ8c
 1KeaP1ji2/GV5Gdx3GX/xZR3cpcJ1TXaktp9s//r7
X-Gm-Gg: AfdE7ckEAs3XtS/xT0+fgp4C+Z8a1ivFc3XumQedEyuHxjwPXchRRFvNCTqV7Ycbj02
 nXkgXd0/FMWPaSE10npOk1GrhQ1ll4CnPaOqsaZ9aUAV8m2X60HHpHBsUoI1LaK8VzDcvZULK0/
 CdmYSEpmRBAQSCMigpMBGxQA3yFxXeLQJanENGrpCX9MPTwpBhfvS2oo97NXHZUqXKLhiAAMYhz
 v9Oy39i/0Qvy36fTWoeWXTN2GW7wJtNQqUk4Cyt10WZPOZslmTbvg2hMzCJ/75MVh22Yiw2yAS1
 m9lMTQbqCPNVh1c2eibXMvV3kenzHRyZOUFGHspVZSGCfVXcTOW0Hk7jjxIBoiyYYouR0uw=
X-Received: by 2002:a05:7022:2222:b0:130:c9cc:3395 with SMTP id
 a92af1059eb24-139c5df989amr6356157c88.29.1782329762970; Wed, 24 Jun 2026
 12:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260621084445.614024-1-jason-jh.lin@mediatek.com>
 <20260621084445.614024-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20260621084445.614024-3-jason-jh.lin@mediatek.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 24 Jun 2026 12:35:51 -0700
X-Gm-Features: AVVi8CeQRMCAz09hjlWyo7YVEH0etySjelxu9kQWbfgiZS3XG_sVqwCWQAGbRFs
Message-ID: <CAMNLLoSVfnrn0TknRWx3pJ82-WwQm07qP7vGhrY9pnd+omvHNA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_setmode: Add basic-no-cpu-idle
 subtest
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ville Syrjala <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>, 
 Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Lancelot Wu <Lancelot.Wu@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

Thanks Jason for the patch.
@Karthik B S  @Swati Sharma : Could we please get some reviews here ,
this is just a separate subtest that is added for any platform that
does not have support for VCounter and hence we need to disable the
deep sleep.

Regards
Manasi

On Sun, Jun 21, 2026 at 1:44=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add a new subtest that disables CPU deep sleep to eliminate wakeup
> latency interference during vblank timestamp verification.
>
> This allows platforms without get_scanout_position() to verify their
> timestamp accuracy is correct, separate from CPU idle interference.
>
> The original "basic" test remains unchanged to detect any timestamp
> issues including CPU idle interference, while "basic-no-cpu-idle"
> specifically tests timestamp accuracy without external interference.
>
> Once get_scanout_position() is implemented, the vblank timestamp
> will be accurately compensated regardless of CPU idle states.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_setmode.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 3adc4534ce88..e5f2c4fee141 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -42,6 +42,7 @@
>  #include <math.h>
>
>  #include "i915/intel_drrs.h"
> +#include "igt_pm.h"
>  #include "xe/xe_query.h"
>
>  /**
> @@ -49,6 +50,13 @@
>   * Description: Tests the vblank timing by iterating through all valid c=
rtc/connector
>   *              combinations
>   *
> + * SUBTEST: basic-no-cpu-idle
> + * Description: Tests vblank timing with CPU deep sleep disabled to veri=
fy
> + *              timestamp accuracy without CPU idle interference. This t=
est
> + *              is for platforms lacking HW/SW get_scanout_position() su=
pport,
> + *              allowing them to verify vblank timestamp correctness wit=
hout
> + *              external CPU wakeup latency interference.
> + *
>   * SUBTEST: basic-clone-single-crtc
>   * Description: Test allows the use of a single CRTC for two connectors,=
 such as VGA/HDMI,
>   *             VGA/DP, and HDMI/HDMI
> @@ -1106,6 +1114,30 @@ int igt_main_args("det:", NULL, help_str, opt_hand=
ler, NULL)
>                 }
>         }
>
> +       /*
> +        * This subtest disables CPU deep sleep to eliminate wakeup laten=
cy
> +        * interference during vblank timestamp verification.
> +        *
> +        * NOTE: This is for platforms that have not yet implemented
> +        * get_scanout_position(). Once get_scanout_position() is properl=
y
> +        * implemented, the vblank timestamp will be accurately compensat=
ed
> +        * regardless of CPU idle states, and this test becomes redundant
> +        * with the standard "basic" test.
> +        */
> +       igt_describe("Tests vblank timing with CPU deep sleep disabled");
> +       igt_subtest_with_dynamic("basic-no-cpu-idle") {
> +               struct test_config tconf =3D {
> +                       .flags          =3D TEST_TIMINGS,
> +                       .name           =3D "basic-no-cpu-idle",
> +                       .resources      =3D drm_resources,
> +               };
> +
> +               igt_require_f(igt_pm_disable_cpu_deep_sleep(),
> +                             "Platform does not support CPU idle control=
\n");
> +               run_test(&tconf);
> +               igt_pm_enable_cpu_deep_sleep();
> +       }
> +
>         igt_fixture() {
>                 drmModeFreeResources(drm_resources);
>                 drm_close_driver(drm_fd);
> --
> 2.43.0
>
