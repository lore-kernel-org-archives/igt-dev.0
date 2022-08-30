Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7CC10E05D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Aug 2022 15:00:38 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-32a09b909f6so280662017b3.0
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Aug 2022 08:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220826210737.3263786-1-alex.hung@amd.com>
 <20220826210737.3263786-2-alex.hung@amd.com>
In-Reply-To: <20220826210737.3263786-2-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 30 Aug 2022 11:00:26 -0400
Message-ID: <CAJUqKUq_Uk-vSaP_SiTQWu8v5aOeej94HwebXLMGqJfzfo6V+w@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH 2/2][V2] tests/kms_universal_plane: Skip
 offscreen test for universal API
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

On Fri, Aug 26, 2022 at 5:08 PM Alex Hung <alex.hung@amd.com> wrote:
>
> amdgpu driver intentionally rejects plane outside of the screen and thus
> this test is skipped on AMD HW. See more details in kernel commits
> 40d916a2602c and 4abdb72bd8576 which are summarized as below:
>
> "Reject this contidion (too small viewport size) at validation time.
nit: s/contidion/condition.
> This gives the calling level a chance to handle this gracefully and
> avoid inconsistent behaivor."
nit: s/behaivor/behavior.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_universal_plane.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 9eab1a57..057a14f4 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -242,16 +242,18 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>         igt_display_commit2(display, COMMIT_LEGACY);
>
>         /* Step 14: Universal API, set primary completely offscreen (CRC 9) */
> -       igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> -                                  output->config.crtc->crtc_id,
> -                                  test.blue_fb.fb_id, 0,
> -                                  9000, 9000,
> -                                  test.mode->hdisplay,
> -                                  test.mode->vdisplay,
> -                                  IGT_FIXED(0,0), IGT_FIXED(0,0),
> -                                  IGT_FIXED(test.mode->hdisplay,0),
> -                                  IGT_FIXED(test.mode->vdisplay,0)) == 0);
> -       igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
> +       if (!is_amdgpu_device(data->drm_fd)) {
Please expand the comment above, stating in few words why you're
skipping on AMD, so we don't have to check the commit to understand
why this is happening.
> +               igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> +                                          output->config.crtc->crtc_id,
> +                                          test.blue_fb.fb_id, 0,
> +                                          9000, 9000,
> +                                          test.mode->hdisplay,
> +                                          test.mode->vdisplay,
> +                                          IGT_FIXED(0,0), IGT_FIXED(0,0),
> +                                          IGT_FIXED(test.mode->hdisplay,0),
> +                                          IGT_FIXED(test.mode->vdisplay,0)) == 0);
> +               igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
> +       }
>
>         /*
>          * Step 15: Explicitly disable primary after it's already been
> @@ -291,7 +293,8 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>          * We should be able to move the primary plane completely offscreen
>          * and have it disable successfully.
>          */
> -       igt_assert_crc_equal(&test.crc_5, &test.crc_9);
> +       if (!is_amdgpu_device(data->drm_fd))
ditto. Expand the comment above on a new line why you're skipping AMD
> +               igt_assert_crc_equal(&test.crc_5, &test.crc_9);
>
>         /*
>          * We should be able to explicitly disable an already
> --
> 2.34.1
>
