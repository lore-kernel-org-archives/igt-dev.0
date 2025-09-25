Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B813CAC5A7
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 12:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3333610E2C7;
	Thu, 25 Sep 2025 12:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AE/Q90mf";
	dkim-atps=neutral
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876AD10E2C7
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 12:37:50 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-330a4d4359bso876496a91.2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 05:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758803870; x=1759408670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wohwvjRR+n4C3vaxJPAR/1D9gbdFddJ/43bCcJnN7Q=;
 b=AE/Q90mfRkaNHwkZEOKP3cg7nbx2Gz893yCul6SPYu0e0vpkj0k8uuxizlwgnA1VeS
 tU/3R9L0sWErZ+klTajwCJDSeIs5mkMkI3F02PR+k/XIKZu8H/AT/aABf8i9u1KXispu
 xYHXi8w/TafVTmP+agvmeVhX3YzFcvuLAQxM5r6o4rixWEb/cx1jyniKTwjnAJHLRBUt
 38ZVbenU+W58h649OIQ4yTMRfDed8BCrHVTLDKLyDqfNwL4Tl6/Y4bz2nOtxb5FGx3QU
 qQlmClwUeGttuPz0iLtKYbkPmkVweNdwtSh8uS47HCU+M7XU4hpnasCpLT10KqZAyID+
 b3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758803870; x=1759408670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5wohwvjRR+n4C3vaxJPAR/1D9gbdFddJ/43bCcJnN7Q=;
 b=AnsHix3Xm9Q0mxyNbShcwDsnUHM7UmMx8hLTbdKcAesqEM441UtiPj4Y1WY8C34ron
 RqnlCYFB5/hiXMsC9DUYwLRRv5CgoAoL23Qi0TfSYf54jQZtoWDV/P5DoI20ZtG41vyP
 c0raAEjRJ32KwidMV+jkCJEbJKUbZ2jiHZClCi5Ow1xD1HUikjc9nzbHV3c8mZ3PiirF
 UpYDLyIfDMRZdpJwMzCjaC1xhR+UEW65M3mwFwWI1ewBQztBn1prB0iWH/sOfZORQ9/X
 TdMToARDdmiuYivfl9akv3kLOtvJrazmn09r2aogxOW3ACUtDCaPCAEKznIhmtUQGxtu
 6tvQ==
X-Gm-Message-State: AOJu0YzJucnwfgq0Z1Xq6vd0yHpq1KwfBpL6redLdu6NRS918mINm8Q2
 ffXaIPyO9vsg5N/wfAI59+PwbnAKpC5vPYFYoH+Dkx4tv8qQV4hGmQN+A9UHIiReyna4wk09xxR
 317mf4QJVlMtoJ8UXvkuJb2mpgXwcxUs=
X-Gm-Gg: ASbGncuc4sYtSPbLCaXIH2Lqq7RJgz4bT3ytxXDoDwImPK3zUrExso97TDkQgn4hKhS
 DdbYytTG7cWdRFtQn3IwR3eIu8nD5+tneL99J6pk4NudGN8YjMakCQ/h3fHH7xzvHtRJFfgghfh
 azwPE2JLxRFiKxBQky22EldwH1PVHWlLdSeAp/lBRI8oM7tH8wcQJwBbfUPRVr+H9T7Ac7CDzcG
 tbfCvXeYg==
X-Google-Smtp-Source: AGHT+IFDz5Lk5IrSg8VuhBgjMVc66cCLFfeCg5WdIih8NhtefCAgoGM7z7jnXFeGTMNOZNmSecr5lHckPJjADmBNQjw=
X-Received: by 2002:a17:90b:164a:b0:32e:3552:8c79 with SMTP id
 98e67ed59e1d1-3342a2b1065mr4193026a91.29.1758803869818; Thu, 25 Sep 2025
 05:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250924142313.4092036-1-nemesa.garg@intel.com>
In-Reply-To: <20250924142313.4092036-1-nemesa.garg@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 25 Sep 2025 15:37:38 +0300
X-Gm-Features: AS18NWCRTkt58sH8ZzxgXa6QCKlUwjsg-tmie4O8Qw0RcWGZ3t2ls4a6ln4w07E
Message-ID: <CAJ=qYWSOsVuSeP5JqYXUXKUtErRWxOPCAmKg7W_Oe_YmJ+wTQA@mail.gmail.com>
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

There's some indentation issue where spaces were used instead of tabs.
Otherwise look all ok, those indentation issues can be fixed while
merging.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Wed, Sep 24, 2025 at 5:28=E2=80=AFPM Nemesa Garg <nemesa.garg@intel.com>=
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
> v7: Make it a part of planar_seeting[JP]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  tests/kms_plane.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index d08ec81e4..c25700228 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1313,6 +1313,25 @@ static void test_planar_settings(data_t *data)
>         } else {
>                 igt_debug("Odd height NV12 framebuffer test skipped\n");
>         }
> +
> +       /* test against intel_plane_check_src_coordinates() in i915 */
> +       if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> +                                     DRM_FORMAT_MOD_LINEAR)) {
> +                int expected_rval =3D -EINVAL;
> +
> +               igt_create_fb(data->drm_fd, 810, 590,
> +                             DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb=
);
> +               igt_plane_set_fb(primary, &fb);
> +               igt_plane_set_size(primary, 810, 590);
> +               igt_plane_set_position(primary, -501, 200);
> +               rval =3D igt_display_try_commit_atomic(&data->display, DR=
M_MODE_ATOMIC_ALLOW_MODESET |
> +                                                    DRM_MODE_ATOMIC_TEST=
_ONLY, NULL);
> +
> +               igt_remove_fb(data->drm_fd, &fb);
> +                igt_assert_f(rval =3D=3D expected_rval, "Odd horizontal =
pan NV12 framebuffer\n");
> +       } else {
> +                igt_debug("Odd horizontal pan NV12 framebuffer test skip=
ped\n");
> +        }
>  }
>
>  static bool is_pipe_limit_reached(int count)
> --
> 2.25.1
>
