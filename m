Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22F5F4198B
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 11:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1E310E6CC;
	Wed, 15 Apr 2026 11:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MmcSdEAl";
	dkim-atps=neutral
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B2710E6CC
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 11:38:46 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-35691a231a7so4257072a91.3
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 04:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776253126; cv=none;
 d=google.com; s=arc-20240605;
 b=YHRwRzoehbH/jC1h9EQqeNkbHhMuaFKwbDxgMGGQQZx6MCceYVugXU6G263Rs2dbCu
 6RUOGIhUbpleKxKOUUq8gTivCJD/XBR1fe2h3CBIb7+fptmOCtg9HTQgGklAwUMx+YDn
 C83Uq13Q6m68VD/60Vuxlg2QC0QjnoD7Fd4yuYYbKjmVszBOkblWKnryROoz390WzUen
 MARZRHfcM9xlOpTiI8iCSqvYaum4M8IOKF0dhkevLpJv47bxZj/wAYCPuyiCh2pu276H
 ErW4vvbaZDEXDiKyxEmjfhxsRzjscyz//wiMYE0RECxx2b/g8nIHPd6//9gXHNvVs1sd
 cmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wijxYeyVcqGuWJ+1BN8AahHE9zCb9S3ad4QgDKy+mNU=;
 fh=bBOdEspSDe+Fu2GFdpJBv3sDvIILUygPFC6gbgyi0co=;
 b=NCGUGP0mlhggCtfLkJTTiJdFddktOpVlyd53lleBxDOe+vPNpgyKTbtkTS7nApZEog
 m+pDD8YcACtRs9ntXiPgmzEt8AoRa4DWKWyZbyoExpO8+pEsvgx1s0ZeDDAVYXwIMvo9
 Ermi1MQ0D31YlqBW1g7fnuPtVI81b+D3lTrhM7eIAkAeyonBvyvZVxZUrgpl/0m4Q2O7
 SZg5ezbHb792iJHO+BaxRsIuGXNNngd5ihk3ztGhlbQslxlLG6/wHA4W8AteXEUG1jF0
 GRaBq4nZrpzDSonBiROXVgH44fSd7hEq9WzQHvHd0vbftwbeayOGMdzDwgscqzlL02EM
 CggQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776253126; x=1776857926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wijxYeyVcqGuWJ+1BN8AahHE9zCb9S3ad4QgDKy+mNU=;
 b=MmcSdEAlXEETKNOugXmDtc8CbRLy8d0ByQL2QSEsG7Kk6M5koA3P8/CeVrNZkCEt1Z
 svK40dqt5fVGIl6gXVkrcHpwxeZftKVEmB62e3mFgppujhfN1psjjQXz6E3z6ZAZ85ih
 grT4qFQ+SEE5pwF1kBycBDJpNOU3ZtBxLvP6dMjzfm4uFosmQY8FT+827FsOdlU1x/f7
 nL54JLfghJDlLXJAWZjSJyW0nQxxgArzx24dhuxFzSZbylbzRub9880qVwDJ9ZGKAmBe
 2zXv7LIC5UidYvQRfg8sDH8BlDCORTcpHccN4G2SGR0atl0SARDol9wMKh1WCW+USnHU
 Ilow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776253126; x=1776857926;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wijxYeyVcqGuWJ+1BN8AahHE9zCb9S3ad4QgDKy+mNU=;
 b=QZLMou/lvrjqiSU+jT0pn5YlUCDDldtbKvzlzR6ydK5IoxSFV6kqYZ1sekFzgLumfC
 g1OHavfHtk+LH04glUvYVTYmjjq6CYsgO0I/eDtafMcXptyMczqHsM0gKE6QtElLvfjd
 OFfQ3VxUEBFTjwCi2++Nlh1/lXhvS0Sk3orXgcSs9+uictHPysyIEJ1DrSPo7b14yy3t
 hdLkgqf+oP189TqoCTmwdwwypR9cY+Wp87pTA1K4aX4jm1r+81qyPdMWPh3A/F1EHbGR
 rn5MjlLnQoWulR2wpVSLigZpmjsXPNTNm1jIgOOkiJ90FQomVqNwnIuyp0Br1zELuDtb
 6frA==
X-Gm-Message-State: AOJu0YxGvQL9hmcxGOm9akKxOOm7W5Bgolics0kEOJZExYel8l2w2z/a
 rFe1UJ9fHT7fvVNQO4Bqid/BKk6XNI0rWWrfVDlQkV7CmpPeKpSftenEmhXjJzjGf9mMzHPCE4Q
 q9Dy6RUP8SpWKA2IjElvubBYxAQig5G9TcAkxmKyPjQ==
X-Gm-Gg: AeBDievLYlkPaTVoGyAIYEg++G1CEBsOsLjL1vY+5bgGESB4F4VbBVgoykvyfBjwgK6
 pnPLXx3qe0ujgSmzGSPSXuls9JFiaMSOqdGATlkxVPWq/6FNRtlZLCotTNvkMJ8rSnwkLiq/n7w
 +yAvbd/wGVdhBvAnAmyGDPMig3giLdVeygw5HMLAG9GaUVHesutGPPZRu8p5xJ6CWNOZR1btKbN
 7g/GfFz5yM8KPBYC4aSDQO/KRnb/kdspMYgs9NV7Rx3M7luCYYFHnct5hrwIBuKdQuNVUcLAC2O
 Ik2/1ZHiODAFrQ7RlNQ+2bzsJXEaQbmRfxRBMyFcph3TQ8eB2xDT
X-Received: by 2002:a17:90a:fc4e:b0:35f:bddd:3860 with SMTP id
 98e67ed59e1d1-35fbddd407fmr10230999a91.6.1776253126267; Wed, 15 Apr 2026
 04:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
 <20260331190412.1907571-4-juhapekka.heikkila@gmail.com>
 <16c209b3-7a17-4ab3-8e97-1946fb8b05b1@intel.com>
In-Reply-To: <16c209b3-7a17-4ab3-8e97-1946fb8b05b1@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 15 Apr 2026 14:38:34 +0300
X-Gm-Features: AQROBzBH3X3cJh6ClzWCzDXT6x2R4bN6BQ0rctyCiNg7MFJBPu0g2EG2OHRb1xM
Message-ID: <CAJ=qYWR99KWUAy9Jcfv7O3xH9ccTicOJvcTL+GYrprsL3UVuHw@mail.gmail.com>
Subject: Re: [PATCH i-g-t 3/4] tests/intel/kms_sharpness_filter: restructure
 igt_main
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
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

On Fri, Apr 10, 2026 at 8:31=E2=80=AFAM Sharma, Swati2 <swati2.sharma@intel=
.com> wrote:
>
> Hi JP
>
> On 01-04-2026 12:34 am, Juha-Pekka Heikkila wrote:
>
> collect tests into list and call them through there
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 312 +++++++++++++++++------------
>  1 file changed, 180 insertions(+), 132 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpne=
ss_filter.c
> index ed8d2e48c..f08d33d7a 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -143,6 +143,131 @@ static const uint32_t scaling_modes[] =3D {
>   DRM_MODE_SCALE_ASPECT,
>  };
>
> +enum subtest_iter {
> + ITER_NONE,
> + ITER_STRENGTH,
> + ITER_MODIFIER,
> + ITER_ROTATION,
> + ITER_FORMAT,
> + ITER_SCALING_MODE,
> +};
> +
> +const struct subtest_entry {
>
> Make this static
>
> + const char *name;
> + const char *describe;
> + enum test_type type;
> + int filter_strength;
> + uint32_t format;
> + enum subtest_iter iter;
> +} subtests[] =3D {
> + {
> + .name     =3D "filter-basic",
> + .describe =3D "Verify basic content adaptive sharpness filter.",
> + .type     =3D TEST_FILTER_BASIC,
> + .filter_strength =3D -1,
>
> Can we have #define DEFAULT_FILTER_STRENGTH as -1 ?
>
> Also, shall we make iter/format explicit for clarity?
>
> .iter =3D ITER_NONE,
> .format =3D DRM_FORMAT_XRGB8888,

I think this would hide the changes that differ from defaults.

>
> + },
> + {
> + .name     =3D "filter-strength",
> + .describe =3D "Verify that varying strength (0-255) affects the degree =
of sharpeness applied.",
>
> Typo s/sharpeness/sharpness
>
> + .type     =3D TEST_FILTER_STRENGTH,
> + .filter_strength =3D -1,
> + .iter     =3D ITER_STRENGTH,
> + },
> + {
> + .name     =3D "filter-modifiers",
> + .describe =3D "Verify content adaptive sharpness filter with varying mo=
difiers.",
> + .type     =3D TEST_FILTER_MODIFIERS,
> + .filter_strength =3D -1,
> + .iter     =3D ITER_MODIFIER,
> + },
> + {
> + .name     =3D "filter-rotations",
> + .describe =3D "Verify content adaptive sharpness filter with varying ro=
tations.",
> + .type     =3D TEST_FILTER_ROTATION,
> + .filter_strength =3D -1,
> + .iter     =3D ITER_ROTATION,
> + },
> + {
> + .name     =3D "filter-formats",
> + .describe =3D "Verify content adaptive sharpness filter with varying fo=
rmats.",
> + .type     =3D TEST_FILTER_FORMATS,
> + .filter_strength =3D -1,
> + .iter     =3D ITER_FORMAT,
> + },
> + {
> + .name     =3D "filter-toggle",
> + .describe =3D "Verify toggling between enabling and disabling content a=
daptive sharpness filter.",
> + .type     =3D TEST_FILTER_TOGGLE,
> + .filter_strength =3D MAX_FILTER_STRENGTH,
> + },
> + {
> + .name     =3D "filter-tap",
> + .describe =3D "Verify content adaptive sharpness filter with resolution=
 change; "
> +    "resolution change will lead to selection of distinct taps.",
> + .type     =3D TEST_FILTER_TAP,
> + .filter_strength =3D -1,
> + },
> + {
> + .name     =3D "filter-dpms",
> + .describe =3D "Verify content adaptive sharpness filter with DPMS.",
> + .type     =3D TEST_FILTER_DPMS,
> + .filter_strength =3D -1,
> + },
> + {
> + .name     =3D "filter-suspend",
> + .describe =3D "Verify content adaptive sharpness filter with suspend.",
> + .type     =3D TEST_FILTER_SUSPEND,
> + .filter_strength =3D -1,
> + },
> + {
> + .name     =3D "filter-scaler-upscale",
> + .describe =3D "Verify content adaptive sharpness filter with 1 plane sc=
aler enabled during upscaling.",
> + .type     =3D TEST_FILTER_UPSCALE,
> + .filter_strength =3D -1,
> + },
> + {
> + .name     =3D "filter-scaler-downscale",
> + .describe =3D "Verify content adaptive sharpness filter with 1 plane sc=
aler enabled during downscaling.",
> + .type     =3D TEST_FILTER_DOWNSCALE,
> + .filter_strength =3D -1,
> + },
> + {
> + .name     =3D "invalid-filter-with-scaler",
> + .describe =3D "Negative check for content adaptive sharpness filter "
> +    "when 2 plane scalers have already been enabled and "
> +    "attempt is made to enable sharpness filter.",
> + .type     =3D TEST_INVALID_FILTER_WITH_SCALER,
> + .filter_strength =3D -1,
> + },
> + {
> + .name     =3D "invalid-filter-with-plane",
> + .describe =3D "Negative check for content adaptive sharpness filter "
> +    "when 2 NV12 planes have already been enabled and "
> +    "attempt is made to enable the sharpness filter.",
> + .type     =3D TEST_INVALID_FILTER_WITH_PLANE,
> + .filter_strength =3D -1,
> + .format   =3D DRM_FORMAT_NV12,
> + },
> + {
> + .name     =3D "invalid-plane-with-filter",
> + .describe =3D "Negative check for content adaptive sharpness filter "
> +    "when 1 NV12 plane and sharpness filter have already been enabled "
> +    "and attempt is made to enable the second NV12 plane.",
> + .type     =3D TEST_INVALID_PLANE_WITH_FILTER,
> + .filter_strength =3D -1,
> + .format   =3D DRM_FORMAT_NV12,
> + },
> + {
> + .name     =3D "invalid-filter-with-scaling-mode",
> + .describe =3D "Negative check for content adaptive sharpness filter "
> +    "when scaling mode is already enabled and attempt is made "
> +    "to enable sharpness filter.",
> + .type     =3D TEST_INVALID_FILTER_WITH_SCALING_MODE,
> + .filter_strength =3D -1,
> + .iter     =3D ITER_SCALING_MODE,
> + },
> +};
> +
>  typedef struct {
>   int drm_fd;
>   bool limited;
> @@ -588,6 +713,48 @@ static void set_data_defaults(data_t *data)
>   data->filter_strength =3D MID_FILTER_STRENGTH;
>  }
>
> +static int iter_count(enum subtest_iter iter)
> +{
> + switch (iter) {
> + case ITER_STRENGTH:
> + return ARRAY_SIZE(filter_strength_list);
> + case ITER_MODIFIER:
> + return ARRAY_SIZE(modifiers);
> + case ITER_ROTATION:
> + return ARRAY_SIZE(rotations);
> + case ITER_FORMAT:
> + return ARRAY_SIZE(formats);
> + case ITER_SCALING_MODE:
> + return ARRAY_SIZE(scaling_modes);
> + default:
> + return 1;
> + }
> +}
> +
> +static void apply_iter_param(data_t *data, const struct subtest_entry *s=
t, int idx)
> +{
> + switch (st->iter) {
> + case ITER_STRENGTH:
> + data->filter_strength =3D filter_strength_list[idx];
> + break;
> + case ITER_MODIFIER:
> + data->modifier =3D modifiers[idx].modifier;
> + data->modifier_name =3D modifiers[idx].name;
> + break;
> + case ITER_ROTATION:
> + data->rotation =3D rotations[idx];
> + break;
> + case ITER_FORMAT:
> + data->format =3D formats[idx];
> + break;
> + case ITER_SCALING_MODE:
> + data->scaling_mode =3D scaling_modes[idx];
> + break;
> + default:
> + break;
> + }
> +}
> +
>  static int opt_handler(int opt, int opt_index, void *_data)
>  {
>   data_t *data =3D _data;
> @@ -620,142 +787,23 @@ int igt_main_args("l", NULL, help_str, opt_handler=
, &data)
>   igt_display_require_output(&data.display);
>   }
>
> - igt_describe("Verify basic content adaptive sharpness filter.");
> - igt_subtest_with_dynamic("filter-basic") {
> - set_data_defaults(&data);
> - run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
> - }
> -
> - igt_describe("Verify that varying strength(0-255), affects "
> -     "the degree of sharpeness applied.");
> - igt_subtest_with_dynamic("filter-strength") {
> - set_data_defaults(&data);
> -
> - for (int i =3D 0; i < ARRAY_SIZE(filter_strength_list); i++) {
> - data.filter_strength =3D filter_strength_list[i];
> -
> - run_sharpness_filter_test(&data, TEST_FILTER_STRENGTH);
> - }
> - }
> -
> - igt_describe("Verify content adaptive sharpness filter with "
> -     "varying modifiers.");
> - igt_subtest_with_dynamic("filter-modifiers") {
> - set_data_defaults(&data);
> -
> - for (int i =3D 0; i < ARRAY_SIZE(modifiers); i++) {
> - data.modifier =3D modifiers[i].modifier;
> - data.modifier_name =3D modifiers[i].name;
> -
> - run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
> - }
> - }
> -
> - igt_describe("Verify content adaptive sharpness filter with "
> -     "varying rotations.");
> - igt_subtest_with_dynamic("filter-rotations") {
> - set_data_defaults(&data);
> -
> - for (int i =3D 0; i < ARRAY_SIZE(rotations); i++) {
> - data.rotation =3D rotations[i];
> -
> - run_sharpness_filter_test(&data, TEST_FILTER_ROTATION);
> - }
> - }
> -
> - igt_describe("Verify content adaptive sharpness filter with "
> -     "varying formats.");
> - igt_subtest_with_dynamic("filter-formats") {
> - set_data_defaults(&data);
> -
> - for (int i =3D 0; i < ARRAY_SIZE(formats); i++) {
> - data.format =3D formats[i];
> -
> - run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
> - }
> - }
> -
> - igt_describe("Verify toggling between enabling and disabling "
> -     "content adaptive sharpness filter.");
> - igt_subtest_with_dynamic("filter-toggle") {
> - set_data_defaults(&data);
> - data.filter_strength =3D MAX_FILTER_STRENGTH;
> - run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> - }
> -
> - igt_describe("Verify that following a resolution change, "
> -     "distict taps are selected.");
> - igt_subtest_with_dynamic("filter-tap") {
> - set_data_defaults(&data);
> - run_sharpness_filter_test(&data, TEST_FILTER_TAP);
> - }
> -
> - igt_describe("Verify content adaptive sharpness filter "
> -     "with DPMS.");
> - igt_subtest_with_dynamic("filter-dpms") {
> - set_data_defaults(&data);
> - run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
> - }
> -
> - igt_describe("Verify content adaptive sharpness filter "
> -     "with suspend.");
> - igt_subtest_with_dynamic("filter-suspend") {
> - set_data_defaults(&data);
> - run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
> - }
> -
> - igt_describe("Verify content adaptive sharpness filter "
> -     "with 1 plane scaler enabled.");
> - igt_subtest_with_dynamic("filter-scaler-upscale") {
> - set_data_defaults(&data);
> - run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
> - }
> -
> - igt_describe("Verify content adaptive sharpness filter "
> -     "with 1 plane scaler enabled.");
> - igt_subtest_with_dynamic("filter-scaler-downscale") {
> - set_data_defaults(&data);
> - run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
> - }
> -
> - igt_describe("Negative check for content adaptive sharpness filter "
> -     "when 2 plane scalers have already been enabled and "
> -     "attempt is made to enable sharpness filter.");
> - igt_subtest_with_dynamic("invalid-filter-with-scaler") {
> - set_data_defaults(&data);
> - run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
> - }
> -
> - igt_describe("Negative check for content adaptive sharpness filter "
> -     "when 2 NV12 planes have already been enabled and attempt is "
> -     "made to enable the sharpness filter.");
> - igt_subtest_with_dynamic("invalid-filter-with-plane") {
> - set_data_defaults(&data);
> - data.format =3D DRM_FORMAT_NV12;
> -
> - run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
> - }
> -
> - igt_describe("Negative check for content adaptive sharpness filter "
> -     "when 1 NV12 plane and sharpness filter have already been enabled "
> -     "and attempt is made to enable the second NV12 plane.");
> - igt_subtest_with_dynamic("invalid-plane-with-filter") {
> - set_data_defaults(&data);
> - data.format =3D DRM_FORMAT_NV12;
> + for (int s =3D 0; s < ARRAY_SIZE(subtests); s++) {
> + const struct subtest_entry *p =3D &subtests[s];
>
> - run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
> - }
> + igt_describe(p->describe);
> + igt_subtest_with_dynamic(p->name) {
> + set_data_defaults(&data);
>
> - igt_describe("Negative check for content adaptive sharpness filter "
> -     "when scaling mode is already enabled and attempt is made "
> -     "to enable sharpness filter.");
> - igt_subtest_with_dynamic("invalid-filter-with-scaling-mode") {
> - set_data_defaults(&data);
> + if (p->filter_strength !=3D -1)
> + data.filter_strength =3D p->filter_strength;
>
> - for (int k =3D 0; k < ARRAY_SIZE(scaling_modes); k++) {
> - data.scaling_mode =3D scaling_modes[k];
> + if (p->format !=3D 0)
> + data.format =3D p->format;
>
> - run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALING_MODE)=
;
> + for (int i =3D 0; i < iter_count(p->iter); i++) {
> + apply_iter_param(&data, p, i);
> + run_sharpness_filter_test(&data, p->type);
> + }
>   }
>   }
>
