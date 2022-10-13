Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3508910E262
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 14:21:45 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-35befab86a4so18913517b3.8
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 07:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221012235706.75569-1-alex.hung@amd.com>
 <20221012235706.75569-2-alex.hung@amd.com>
In-Reply-To: <20221012235706.75569-2-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 13 Oct 2022 10:21:33 -0400
Message-ID: <CAJUqKUoHjE4dYU3izvVz1uXyxSBqGV5oQbACpGPgs77uwD6J+A@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_universal_plane: skip when pipe
 and primary plane cannot be off
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 12, 2022 at 7:57 PM Alex Hung <alex.hung@amd.com> wrote:
>
> amdgpu rejects when crtc is on + primary plane is off. As a result,
> skipping these scenario when they cannot be turned off together, i.e.
> crtc cannot be off when reading crc values.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Mark Yacoub <markyacoub@chromium.org>

> ---
>  tests/kms_universal_plane.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 468f7a4e..8d51f288 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -197,9 +197,11 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>         igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_4);
>
>         /* Step 5: Universal API's, disable primary plane (CRC 5) */
> -       igt_plane_set_fb(primary, NULL);
> -       igt_display_commit2(display, COMMIT_UNIVERSAL);
> -       igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);
> +       if (!is_amdgpu_device(data->drm_fd)) {
> +               igt_plane_set_fb(primary, NULL);
> +               igt_display_commit2(display, COMMIT_UNIVERSAL);
> +               igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);
> +       }
>
>         /* Step 6: Universal API's, re-enable primary with blue (CRC 6) */
>         igt_plane_set_fb(primary, &test.blue_fb);
> @@ -271,9 +273,11 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>          * Step 15: Explicitly disable primary after it's already been
>          * implicitly disabled (CRC 10).
>          */
> -       igt_plane_set_fb(primary, NULL);
> -       igt_display_commit2(display, COMMIT_UNIVERSAL);
> -       igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_10);
> +       if (!is_amdgpu_device(data->drm_fd)) {
> +               igt_plane_set_fb(primary, NULL);
> +               igt_display_commit2(display, COMMIT_UNIVERSAL);
> +               igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_10);
> +       }
>
>         /* Step 16: Legacy API's, blue primary, red sprite */
>         igt_plane_set_fb(primary, &test.blue_fb);
> @@ -284,7 +288,8 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>         igt_assert_crc_equal(&test.crc_2, &test.crc_4);
>
>         /* Disabling primary plane should be same as black primary */
> -       igt_assert_crc_equal(&test.crc_1, &test.crc_5);
> +       if (!is_amdgpu_device(data->drm_fd))
> +               igt_assert_crc_equal(&test.crc_1, &test.crc_5);
>
>         /* Re-enabling primary should return to blue properly */
>         igt_assert_crc_equal(&test.crc_2, &test.crc_6);
> @@ -306,8 +311,7 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>          * and have it disable successfully. Skip on amdgpu since crc_9 was
>          * skipped with offscreen planes previously.
>          */
> -       if (!is_amdgpu_device(data->drm_fd))
> -               igt_assert_crc_equal(&test.crc_5, &test.crc_9);
> +       igt_assert_crc_equal(&test.crc_5, &test.crc_9);
>
>         /*
>          * We should be able to explicitly disable an already
> --
> 2.38.0
>
