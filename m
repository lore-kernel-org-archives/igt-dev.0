Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF424CAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 14:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646C610E039;
	Tue, 16 Sep 2025 14:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZV4Dy9z";
	dkim-atps=neutral
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E1E10E039
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 14:20:59 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-32bb1132c11so4952999a91.0
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758032459; x=1758637259; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K32W988IhTN6XTfvBXIi2pj+GErDX1G1Usl1o1/yuzo=;
 b=gZV4Dy9zmSN/vwUA5+WVkvX/uDl0k0GIgihL+3EOGhQq3K49g8jiBR3C2HJyve6hSH
 iSYPrPwLMvnfbFabfI+Jpm1wCkoSBDG0udVnGQ00XeF29fj5+eH5i4deOLVcLA/aDtFQ
 F2y9FEJWZTTZdUHxmvEF9XIMF4w8B7TuLmJktWXcox90X8baHqmGo6Kg8ecqRsDn+Ket
 qcFvB9qJE5tI6u0Wde7q1s4/MPN868PUSmHS77fohNY8U4S1tzExPS3b89uGELzATzwv
 MbInNhmV2uEztys3xAHNbEA/YbRKCohFQi2LbFy2CZc0bQrpwsfOKk49Gedz4x/+0qif
 Xmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032459; x=1758637259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K32W988IhTN6XTfvBXIi2pj+GErDX1G1Usl1o1/yuzo=;
 b=QwpY8uKeeGsHOr5Yg8cSiFN3gbo7l3/lpdeelpkNNXLyBROiuH0qzEuOoG52eTdxnI
 yRk7i4NQPBLgSm+51nHPBH1i5ghjRqNXEuIGd/GZU762uiqfWgE4sjjP7kKQ2SXxpYb2
 /UjnBTIf3NxRHcF3ch5HMstw+4ztqi0kQg0e39itRqsOPdNgNqFA9haEvKdyqBCCbwsW
 VA1RZwVNk84Mf8pudzh/ywoLiarLuJqG2HAgAPsxePY/icnLCiLrn7CKF7YjDb9FY99R
 8KedyGJrFSq9/TOmg0eSvw1GuryvzOkgIqSsjmLyKLVar77R0nFRbpLUOjE1+pvtQ8vR
 quAg==
X-Gm-Message-State: AOJu0YzNrodUilkEvpFEY6mfI/P9ilGWreOEKYisO9ZvRVJT21x1tQw7
 WszY4YDZGKM1JGYi/8/s4aeDOEo3Z8u6Iv3qYCWCqHJ8yF+hWyAhnFq/TGDVMNWYcaJxWctafAO
 DxXnorrLeAnVPBMc7FHwmcxvOHLg9FPN9f/f0lAG45w==
X-Gm-Gg: ASbGnctPKqq9n2TE4ets1G6Mu9IYzF5OTb06Ffac+ckkIDCHB6K7FWigQdUJ/UZ0Utu
 GSJyaN96BmBrokmhYhB9+oetilZ8bbX7gYphbZ2N5yhvybg4u/LXHhpI3X6j0hw0yNuV/vJOGtY
 tgEUSmqfOfexO4gA6esoNEgjr9K7pkdzz5Wc3PkJr4QmiyjPZUkR/ismsxmNSOBpWEJI2SLIyU7
 ZKS5KMw7g==
X-Google-Smtp-Source: AGHT+IFLQtjwONKUzI+VOm7jd+9bzYkwBg8ZqleXOyIQfUe1Ip7kh+PjBaH4HQE0wbj2tMWBhzCUe8XYQW7aqlJ90r8=
X-Received: by 2002:a17:90b:2ec8:b0:32e:72bd:6d5a with SMTP id
 98e67ed59e1d1-32ea60cd08bmr3214025a91.1.1758032458891; Tue, 16 Sep 2025
 07:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250915160536.2839057-1-nemesa.garg@intel.com>
In-Reply-To: <20250915160536.2839057-1-nemesa.garg@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 16 Sep 2025 17:20:42 +0300
X-Gm-Features: AS18NWBqc74kRB3TUALyVY98pXgxxky4HKsIw5RKh91rLTTO4IhV1R_mJ7kD-5I
Message-ID: <CAJ=qYWRZ+H3JS_CYg0gWS94AQR7BSqOy3hJPZit1=aZWe-A4rw@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane: Add test to validate odd panning
To: Nemesa Garg <nemesa.garg@intel.com>
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

Hi Nemesa,

few comments below

On Mon, Sep 15, 2025 at 7:10=E2=80=AFPM Nemesa Garg <nemesa.garg@intel.com>=
 wrote:
>
> This feature creates a NV12 plane having two framebuffers
> and moving it to odd position and then do continuous flip
> along with the change in the width of framebuffer.
> This is to check whether panning at odd position is
> supported or not.
>
> v2: Add test in kms_plane.[Swati]
> v3: Remove extra parameters[Pranay]
> v4: Add check for modifier
> v5: Adding the break condition
> v6: Change the fb size
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  tests/kms_plane.c | 107 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index d08ec81e4..4872b8ce5 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -81,6 +81,15 @@
>   * @format-source-clamping:          with source clamping
>   */
>
> +/**
> + * SUBTEST: odd-panning
> + * Description: Verify that odd panning in horizontal direction for plan=
ar format
> + * Driver requirement: i915, xe
> + * Functionality: plane, panning
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
>  /*
>   * Throw away enough lsbs in pixel formats tests
>   * to get a match despite some differences between
> @@ -93,6 +102,9 @@
>  #define CRTC_RESTRICT_CNT      2
>  #define SIM_CRTC_RESTRICT_CNT  1
>
> +#define PLANE_WIDTH 810
> +#define PLANE_HEIGHT 590
> +
>  typedef struct {
>         float red;
>         float green;
> @@ -1323,6 +1335,97 @@ static bool is_pipe_limit_reached(int count)
>                 return count >=3D CRTC_RESTRICT_CNT && !all_pipes;
>  }
>
> +static void
> +prepare_planes_panning(igt_display_t *display, const enum pipe pipe_id,
> +                      igt_output_t *output)
> +{

prepare_planes_panning name maybe could be changed to something that
says this is the test, not just prepare.

> +       igt_plane_t *primary;
> +       struct igt_fb primary_fb_1, primary_fb_2;
> +       unsigned int fb_id_1, fb_id_2;
> +       int j =3D 0, ret;
> +
> +       igt_output_set_pipe(output, pipe_id);
> +
> +       primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
> +
> +       if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +                                     DRM_FORMAT_MOD_LINEAR)) {
> +               igt_info("plane-%d does not supports NV12 format and Line=
ar modifier\n",
> +                        primary->index);
> +               return;

I think this make the test report success when nothing was tested?
Maybe need something along the lines of igt_skip_on(..) or so?

> +       }
> +
> +       fb_id_1 =3D igt_create_pattern_fb(display->drm_fd,
> +                                       810, 590,
^
this size you have defined in PLANE_WIDTH and PLANE_HEIGHT

> +                                       DRM_FORMAT_NV12,
> +                                       DRM_FORMAT_MOD_LINEAR,
> +                                       &primary_fb_1);
> +
> +       fb_id_2 =3D igt_create_pattern_fb(display->drm_fd,
> +                                       810, 590,
^
here also PLANE_WIDTH and PLANE_HEIGHT

> +                                       DRM_FORMAT_NV12,
> +                                       DRM_FORMAT_MOD_LINEAR,
> +                                       &primary_fb_2);

I was wondering why 2 framebuffers? Does this test need flipping?

> +
> +       igt_assert(fb_id_1);
> +       igt_assert(fb_id_2);

igt_create_pattern_fb already asserts these fb_ids, but as this is not
crc test you could above just use igt_create_fb instead of
igt_create_pattern_fb (and then would need these asserts)

> +
> +       igt_plane_set_fb(primary, &primary_fb_1);
> +
> +       igt_plane_set_size(primary, PLANE_WIDTH, PLANE_HEIGHT);
> +       igt_plane_set_position(primary, -501, 200);
> +
> +       ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_AL=
LOW_MODESET, NULL);
> +
> +       do {
> +               if (j % 2 =3D=3D 0) {
> +                       igt_plane_set_fb(primary, &primary_fb_1);
> +                       igt_plane_set_size(primary, PLANE_WIDTH - j, PLAN=
E_HEIGHT);

when you change plane width but not fb width, I think here fb will be scale=
d?

> +                       ret =3D igt_display_try_commit_atomic(display, 0,=
 NULL);
> +                       if (ret =3D=3D -22)
> +                               break;
> +               } else {
> +                       igt_plane_set_fb(primary, &primary_fb_2);
> +                       igt_plane_set_size(primary, PLANE_WIDTH - j, PLAN=
E_HEIGHT);
> +                       ret =3D igt_display_try_commit_atomic(display, 0,=
 NULL);
> +                       if (ret =3D=3D -22)
> +                               break;
> +               }
> +               j++;
> +       } while (j < 20);

test description talk about "Verify that odd panning in horizontal"
but your loop set fb, then set plane size. I think for pan you'd need
to either set fb or plane position? Now it look like this is more a
scaler test for nv12 at the edge of pipe.

> +
> +       igt_assert_eq(ret, -22);
> +
> +       igt_plane_set_fb(primary, NULL);
> +       igt_output_set_pipe(output, PIPE_NONE);
> +       igt_display_try_commit2(display, COMMIT_ATOMIC);
> +
> +       igt_remove_fb(display->drm_fd, &primary_fb_1);
> +       igt_remove_fb(display->drm_fd, &primary_fb_2);
> +}
> +
> +static void run_test_odd_pan(data_t *data)
> +{
> +       igt_display_t *display =3D &data->display;
> +       enum pipe pipe;
> +       igt_output_t *output;
> +       int count =3D 0;
> +
> +       for_each_pipe_with_valid_output(display, pipe, output) {
> +               igt_display_reset(display);
> +
> +               igt_output_set_pipe(output, pipe);
> +               if (!intel_pipe_output_combo_valid(display))
> +                       continue;
> +
> +               igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_=
output_name(output))
> +                       prepare_planes_panning(display, pipe, output);
> +
> +               if (is_pipe_limit_reached(++count))
> +                       break;
> +       }
> +}
> +
>  static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
>  {
>         enum pipe pipe;
> @@ -1401,6 +1504,10 @@ run_tests_for_pipe_plane(data_t *data)
>                 run_test(data, dynamic_test_handler);
>         }
>
> +       igt_describe("verify whether odd panning is supported or not");
> +       igt_subtest_with_dynamic("odd-panning")
> +               run_test_odd_pan(data);
> +
>         igt_describe("verify planar settings for pixel format are accepte=
d or rejected correctly");
>         igt_subtest_f("planar-pixel-format-settings")
>                 test_planar_settings(data);
> --
> 2.25.1
>
