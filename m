Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C038A10E0A2
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 14:15:02 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-35711e5a5ceso108380937b3.13
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 07:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221017004936.574303-1-alex.hung@amd.com>
In-Reply-To: <20221017004936.574303-1-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 17 Oct 2022 10:14:51 -0400
Message-ID: <CAJUqKUocmpTuhtz_gurw66qrjR7T0ibHYNbo_OVOwmPqjbofng@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH 1/2][V2] tests/kms_universal_plane: turn off
 pipe when primary plane is off
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

On Sun, Oct 16, 2022 at 8:50 PM Alex Hung <alex.hung@amd.com> wrote:
>
> GPU drivers can reject when crtc is on and primary plane is off,
> so turn crtc off with primary plane and turn it on afterwards.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_universal_plane.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 64416afd..2db1d7e8 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -228,11 +228,14 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>         igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_7);
>
>         /* Step 11: Disable primary plane */
> +       igt_output_set_pipe(output, PIPE_NONE);
> +       igt_display_commit2(display, COMMIT_ATOMIC);
>         igt_plane_set_fb(primary, NULL);
>         igt_display_commit2(display, COMMIT_UNIVERSAL);
>
>         /* Step 12: Legacy modeset to yellow FB (CRC 8) */
>         igt_plane_set_fb(primary, &test.yellow_fb);
> +       igt_output_set_pipe(output, pipe);
>         igt_display_commit2(display, COMMIT_LEGACY);
>         igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_8);
>
> @@ -497,6 +500,8 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>         igt_display_commit2(&data->display, COMMIT_LEGACY);
>
>         /* Disable the primary plane */
> +       igt_output_set_pipe(output, PIPE_NONE);
> +       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>         igt_plane_set_fb(primary, NULL);
>         igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
>
> @@ -506,6 +511,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>          * Note that crtc->primary->fb = NULL causes flip to return EBUSY for
>          * historical reasons...
>          */
> +       igt_output_set_pipe(output, pipe);
>         igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
>                                    test.red_fb.fb_id, 0, NULL) == -EBUSY);
>
> @@ -520,9 +526,13 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>          * completes, which we don't have a good way to specifically test for,
>          * but at least we can make sure that nothing blows up.
>          */
> +       igt_output_set_pipe(output, pipe);
> +       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>         igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
>                                    test.red_fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT,
>                                    &test) == 0);
> +       igt_output_set_pipe(output, PIPE_NONE);
> +       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>         igt_plane_set_fb(primary, NULL);
>         igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
>
> --
> 2.38.0
>
