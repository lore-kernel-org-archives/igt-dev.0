Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0BB10E541
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Apr 2023 14:27:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f833bda191so938062f8f.1
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Apr 2023 07:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230414210328.1153659-1-alex.hung@amd.com>
In-Reply-To: <20230414210328.1153659-1-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 17 Apr 2023 10:27:21 -0400
Message-ID: <CAJUqKUqFCX=hM+y6dOeG2kyuuoyeGYvMannQMX12keV4=4dWsg@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH] tests/kms_universal_plane: Enable
 sanity_test_pipe for all devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thank you for enabling this.

On Fri, Apr 14, 2023 at 5:03=E2=80=AFPM Alex Hung <alex.hung@amd.com> wrote=
:
>
> This subtest can run on non-i915 devices.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_universal_plane.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 114918d9..369e5665 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -377,7 +377,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_ou=
tput_t *output)
>         igt_plane_t *primary;
>         drmModeModeInfo *mode;
>         int i;
> -       int expect;
> +       int expect =3D 0;
>
>         igt_require_pipe(&data->display, pipe);
>
> @@ -400,9 +400,9 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_ou=
tput_t *output)
>          * doesn't cover CRTC (should fail on pre-gen9 and succeed on
>          * gen9+).
>          */
> -       igt_require_intel(data->drm_fd);
>         igt_plane_set_fb(primary, &test.undersized_fb);
> -       expect =3D (data->display_ver < 9) ? -EINVAL : 0;
> +       if (is_i915_device(data->drm_fd))
> +               expect =3D (data->display_ver < 9) ? -EINVAL : 0;
>         igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNIVERS=
AL) =3D=3D expect);
>
>         /* Same as above, but different plane positioning. */
> @@ -412,7 +412,8 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_ou=
tput_t *output)
>         igt_plane_set_position(primary, 0, 0);
>
>         /* Try to use universal plane API to scale down (should fail on p=
re-gen9) */
> -       expect =3D (data->display_ver < 9) ? -ERANGE : 0;
> +       if (is_i915_device(data->drm_fd))
> +               expect =3D (data->display_ver < 9) ? -ERANGE : 0;
>         igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plan=
e_id,
>                                    output->config.crtc->crtc_id,
>                                    test.oversized_fb.fb_id, 0,
> --
> 2.40.0
>
