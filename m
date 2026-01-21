Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D254C4450D
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 12:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478E210E786;
	Wed, 21 Jan 2026 12:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NhL85QXx";
	dkim-atps=neutral
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC47B10E776
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 12:00:32 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-81f4e136481so3075216b3a.3
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 04:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768996832; cv=none;
 d=google.com; s=arc-20240605;
 b=RxllypUNF6Dzu2WzM1MYWqDgqJs9JPTAaJFCV4QtYmFNJx3zFohM1WjfT0e6IhqRDX
 CBZ7A6p4vyY7+TX+jpR8+SBbUyYUF2/ISA+LcC6GlMuz1xzXymqMdrrig+FdOgnLIABO
 p36kGG2cauMlZf7z8w4xyz93tgbtirzKVdl0tV7gFaJktXbIX78BQysNS6FYSadOo1gP
 91TSqXgRBSdcbyBxkheCrc84wXeqGbk3/E0eWzNGSDVyjXS/6LJSsIj7WN6jKe+gXZZx
 QXQyBgseZQtv2WUe7VHHENaXpvYqwN54snx/E/OOxO1UcF59Ojy2fMWF/gP+eQTAQX1J
 CawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4f0Stl/9+qNqbgyf71uS1uMfX8S6l9nvmeKOcExGZzk=;
 fh=jiZtKjlARfrRM2yNEBasMo1wsZCckE6V/OhneC84kWQ=;
 b=BHuBQwHK4goOysyZlrd4VPDA9t4xi3BEa4jIGbI+y4pf3sStZ13nC7b13F1w6RHNui
 OomxRKFkenbq/KUdTRaabWa2qEtddZlwUg4XfaDR//Bxeu2tcwuNUaespPX07XwEWXQ8
 owu9ezKgFsrzouj8ulOOeG09s0loxBomyvR40J10z0hY2LTdlIatbwqSGekxZ7YxbQ5E
 vh1joNTTFFFJEtUj1EFaYQ/pWDMTqVLKn4ww85AJN5bPQh5i5yqOOyAH7Oorf5GXkDmk
 7aGMKpPMIpLK1Qt/37u6u4g0GoH+BQM08mfQnJkXbuf+TGWp/Xzm5Ze2Pfza7jrfD4ku
 k1PQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768996832; x=1769601632; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4f0Stl/9+qNqbgyf71uS1uMfX8S6l9nvmeKOcExGZzk=;
 b=NhL85QXxyE9oiOIyAwQ0GkpcBxDWXd/Z2NP8d281lLyUSJJ8OYyHxD+criJwJnvl4p
 JcBR7ot5au4Rc2QCCzbMKSG3J7WvRFJMeQRajvLRUjoXnlb31E+Fh7FZFQ0gWq9ceolM
 jWDJ1G9wBVD+kW0vIJ5fW/rqvplArP0eYAk2IX3mpf2ruthBAu1NNi51lYBHJrN+mfO9
 MIHNXTR1Amz+15HkUgisdigX7WDMob+yyIOso3fHbjL0g3O9VyrJboh05cexTBxaV1Vd
 +6vOWQyPxSbrB4yDp8oCysDPppwFZv3m5hbQMq33hofZbcoTGpn2Un7mwCAIMXEyHexG
 aWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768996832; x=1769601632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4f0Stl/9+qNqbgyf71uS1uMfX8S6l9nvmeKOcExGZzk=;
 b=bioUcQwPfTnG/HsRWZsJ4r0Rwb1hdmT7CJf2THFNwsuBgrO+o/EeNtLqXqA9kfK0zA
 DWtXPuZooyQhBeWInBblyYvtUg4Obz6rLdlRifZS8Yd7E789FR9M0FHaYuoBegnb/LJG
 KxBJQTP1VtClL/S7OsCI2tVzf75ADACnPArGW49u9jj9AYwgDgTDnUU6vXhehjQFxhWu
 YcyOjEb1eooMeBlJbRLHV+7fCMf16s7VUorvysHrs58iuY4TGe9iJ3fgJM2AVNA5i8/Q
 Xj/IR6xuEQ1D+bgz1KfRKm14VHLGaIKyCGIiKMe1oaG7toji2qwGHuH+JM+GKKmx560h
 Grtg==
X-Gm-Message-State: AOJu0YwW7i0PKKQTxd9Ne58X/hORqJeEOBMZMiDuIiGQPFEHtZitGYJn
 JvBBKsU8DCAaPa8pslOoePlCFacbSQgTakK9aMrip7p+o7XN8L/0fQ12mgyH0hlbt7Eo4D6FhmE
 rLtaIHEM9Fke1FgOgH0XvfK1TxsvfsSw=
X-Gm-Gg: AZuq6aKISMCpwJj10FGrFu1gjnXLgz+lRsQP/QVu6SFA72GAIaJk+oTi17Dtzprx+zA
 hnzRCvTVNQDaMhoUyRvaxtaGaXpVYYsibXh2SbF7ThZecOXKMuJNm/q8+prUPvIlkvrESQSVi2F
 D2oTScA0+pBlx6Awa8563dRVsXfgYuEqZ6UII5gA8kbyRV0Vr0vUTdpVl14bby1+QIc348rS0bf
 YTxl1eXFsvg+WDRCl0prIVkq689qYYyu3D3kJRLzkZit9scvBFtWxO/snmPf+ZZAeoBNH+bGALw
 TpUAzztA5jmAOBVMuzogzf7B4iq30w==
X-Received: by 2002:a05:6a21:6014:b0:38d:f7e8:e8a8 with SMTP id
 adf61e73a8af0-38e00da4242mr16685609637.78.1768996831895; Wed, 21 Jan 2026
 04:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
 <20260120045545.102676-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20260120045545.102676-2-ramanaidu.naladala@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 21 Jan 2026 14:00:20 +0200
X-Gm-Features: AZwV_QgQRvjjuiGoq-Fc11sf_9PVmmtB1oNeDOLARJ0Tuw2hDzMNRsSP_jEEHl8
Message-ID: <CAJ=qYWSmWEi26YKLF2WvG5rVEoFw=nZFdnyK19+gA8wOc86UNw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_i=2Dg=2Dt_v2_1=2F3=5D_tests=2Fkms=5Fplane=3A_Split_pixe?=
 =?UTF-8?Q?l=E2=80=91format_validation_into_modifier_specific?=
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevan.b@intel.com, 
 juha-pekka.heikkila@intel.com
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

There were few things that caught my eye but I guess they don't fall
in the scope of these patches, at some point will need to start to
think about restructuring this test.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Tue, Jan 20, 2026 at 7:02=E2=80=AFAM Naladala Ramanaidu
<ramanaidu.naladala@intel.com> wrote:
>
> Change restructures the pixel-format test flow so that each
> modifier is validated through its own dynamic subtest.
> Previously, all supported modifiers were exercised within a
> single test path, which made failures harder to isolate.
> The new structure improves clarity and debuggability by
> generating explicit subtest names for each modifier.
> Subtests now run only for the selected modifier, and
> unsupported combinations are cleanly skipped.
>
> v2: Fix review comments. (Jeevan)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane.c | 91 ++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 79 insertions(+), 12 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index ec3245c9f..653a911ad 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -72,13 +72,32 @@
>   */
>
>  /**
> - * SUBTEST: pixel-%s
> + * SUBTEST: pixel-format-%s-modifier
>   * Description: verify the pixel formats for given plane and pipe
>   *
> + * SUBTEST: pixel-format-%s-modifier-source-clamping
> + * Description: verify the pixel formats for given plane and pipe with s=
ource clamping
> + *
>   * arg[1]:
>   *
> - * @format:
> - * @format-source-clamping:          with source clamping
> + * @x-tiled:                     x tiled
> + * @y-tiled:                     y tiled
> + * @yf-tiled:                    yf tiled
> + * @y-tiled-ccs:                 y tiled ccs
> + * @yf-tiled-ccs:                yf tiled ccs
> + * @y-tiled-gen12-rc-ccs:        y tiled gen12 rc ccs
> + * @y-tiled-gen12-mc-ccs:        y tiled gen12 mc ccs
> + * @y-tiled-gen12-rc-ccs-cc:     y tiled gen12 rc ccs cc
> + * @4-tiled:                     4 tiled
> + * @4-tiled-dg2-rc-ccs:          4 tiled dg2 rc ccs
> + * @4-tiled-dg2-mc-ccs:          4 tiled dg2 mc ccs
> + * @4-tiled-dg2-rc-ccs-cc:       4 tiled dg2 rc ccs cc
> + * @4-tiled-mtl-rc-ccs:          4 tiled mtl rc ccs
> + * @4-tiled-mtl-mc-ccs:          4 tiled mtl mc ccs
> + * @4-tiled-mtl-mc-ccs-cc:       4 tiled mtl mc ccs cc
> + * @4-tiled-lnl-ccs:             4 tiled lnl ccs
> + * @4-tiled-bmg-ccs:             4 tiled bmg ccs
> + * @linear:                      linear
>   */
>
>  /*
> @@ -114,6 +133,7 @@ typedef struct {
>         uint32_t crop;
>         bool extended;
>         unsigned int flags;
> +       uint64_t mod;
>  } data_t;
>
>  static bool all_pipes;
> @@ -149,6 +169,30 @@ enum {
>         TEST_SUSPEND_RESUME             =3D 1 << 4,
>  };
>
> +static const struct {
> +       uint64_t modifier;
> +       const char *str;
> +} modifiers[] =3D {
> +       {I915_FORMAT_MOD_X_TILED, "x-tiled"},
> +       {I915_FORMAT_MOD_Y_TILED, "y-tiled"},
> +       {I915_FORMAT_MOD_Yf_TILED, "yf-tiled"},
> +       {I915_FORMAT_MOD_Y_TILED_CCS, "y-tiled-ccs"},
> +       {I915_FORMAT_MOD_Yf_TILED_CCS, "yf-tiled-ccs"},
> +       {I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "y-tiled-gen12-rc-ccs"},
> +       {I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, "y-tiled-gen12-mc-ccs"},
> +       {I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "y-tiled-gen12-rc-ccs-c=
c"},
> +       {I915_FORMAT_MOD_4_TILED, "4-tiled"},
> +       {I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, "4-tiled-dg2-rc-ccs"},
> +       {I915_FORMAT_MOD_4_TILED_DG2_MC_CCS, "4-tiled-dg2-mc-ccs"},
> +       {I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC, "4-tiled-dg2-rc-ccs-cc"},
> +       {I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4-tiled-mtl-rc-ccs"},
> +       {I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4-tiled-mtl-mc-ccs"},
> +       {I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, "4-tiled-mtl-mc-ccs-cc"},
> +       {I915_FORMAT_MOD_4_TILED_LNL_CCS, "4-tiled-lnl-ccs"},
> +       {I915_FORMAT_MOD_4_TILED_BMG_CCS, "4-tiled-bmg-ccs"},
> +       {DRM_FORMAT_MOD_LINEAR, "linear"},
> +};
> +
>  /*
>   * create a colored fb, possibly with a series of 64x64 colored rectangl=
es (used
>   * for position tests)
> @@ -1040,6 +1084,7 @@ static void test_format_plane(data_t *data, enum pi=
pe pipe,
>         struct format_mod ref =3D {};
>         igt_crc_t* crcset;
>         bool result =3D true;
> +       bool found =3D false;
>
>         /*
>          * No clamping test for cursor plane
> @@ -1047,6 +1092,17 @@ static void test_format_plane(data_t *data, enum p=
ipe pipe,
>         if (data->crop !=3D 0 && plane->type =3D=3D DRM_PLANE_TYPE_CURSOR=
)
>                 return;
>
> +       for (int i =3D 0; i < plane->format_mod_count; i++) {
> +               if (data->mod =3D=3D plane->modifiers[i]) {
> +                       found =3D true;
> +                       break;
> +               }
> +       }
> +
> +       igt_skip_on_f(!found,
> +                     "Modifier " IGT_MODIFIER_FMT " not supported on pla=
ne %d\n",
> +                     IGT_MODIFIER_ARGS(data->mod), plane->index);
> +
>         igt_vec_init(&tested_formats, sizeof(struct format_mod));
>
>         mode =3D igt_output_get_mode(output);
> @@ -1101,6 +1157,9 @@ static void test_format_plane(data_t *data, enum pi=
pe pipe,
>                         .modifier =3D plane->modifiers[i],
>                 };
>
> +               if (data->mod !=3D f.modifier)
> +                       continue;
> +
>                 if (f.format =3D=3D ref.format &&
>                     f.modifier =3D=3D ref.modifier)
>                         continue;
> @@ -1433,17 +1492,25 @@ static void dynamic_test_handler(data_t *data, en=
um pipe pipe)
>  static void
>  run_tests_for_pipe_plane(data_t *data)
>  {
> -       igt_describe("verify the pixel formats for given plane and pipe")=
;
> -       igt_subtest_with_dynamic_f("pixel-format")
> -               run_test(data, test_pixel_formats);
> -
> -       igt_describe("verify the pixel formats for given plane and pipe w=
ith source clamping");
> -       igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
> -               data->crop =3D 4;
> -               run_test(data, test_pixel_formats);
> +       for (int i =3D 0; i < ARRAY_SIZE(modifiers); i++) {
> +               igt_describe("verify the pixel formats for given plane an=
d pipe");
> +               igt_subtest_with_dynamic_f("pixel-format-%s-modifier", mo=
difiers[i].str) {
> +                       data->mod =3D modifiers[i].modifier;
> +                       run_test(data, test_pixel_formats);
> +               }
> +       }
> +
> +       for (int i =3D 0; i < ARRAY_SIZE(modifiers); i++) {
> +               igt_describe("verify the pixel formats for given plane an=
d pipe with source clamping");
> +               igt_subtest_with_dynamic_f("pixel-format-%s-modifier-sour=
ce-clamping",
> +                                          modifiers[i].str) {
> +                       data->mod =3D modifiers[i].modifier;
> +                       data->crop =3D 4;
> +                       run_test(data, test_pixel_formats);
> +               }
> +               data->crop =3D 0;
>         }
>
> -       data->crop =3D 0;
>         igt_describe("verify plane position using two planes to create a =
fully covered screen");
>         igt_subtest_with_dynamic_f("plane-position-covered") {
>                 data->flags =3D 0;
> --
> 2.43.0
>
