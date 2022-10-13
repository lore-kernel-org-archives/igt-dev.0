Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F67A10E25A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 14:19:45 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-354c7abf786so19362367b3.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 07:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221012235706.75569-1-alex.hung@amd.com>
In-Reply-To: <20221012235706.75569-1-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 13 Oct 2022 10:19:33 -0400
Message-ID: <CAJUqKUr1QyvaRZ-gAfRt5Cz2xU+Nkxf_cQ5GCwVyBPTc6hEB8w@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_universal_plane: turn off pipe
 when primary plane is off
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
> GPU drivers can reject when crtc is on and primary plane is off,
> so turn crtc off with primary plane and turn it on afterwards.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_universal_plane.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 64416afd..468f7a4e 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -62,6 +62,13 @@ typedef struct {
>         struct igt_fb biggreen_fb, smallred_fb, smallblue_fb;
>  } gen9_test_t;
>
> +static void
> +set_pipe_on_off(igt_display_t *display, igt_output_t *output, enum pipe pipe)
> +{
> +       igt_output_set_pipe(output, pipe);
> +       igt_display_commit2(display, COMMIT_LEGACY);
Why did you choose legacy commit?
> +}
> +
>  static void
>  functional_test_init(functional_test_t *test, igt_output_t *output, enum pipe pipe)
>  {
> @@ -228,12 +235,14 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>         igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_7);
>
>         /* Step 11: Disable primary plane */
> +       set_pipe_on_off(&data->display, output, PIPE_NONE);
>         igt_plane_set_fb(primary, NULL);
>         igt_display_commit2(display, COMMIT_UNIVERSAL);
>
>         /* Step 12: Legacy modeset to yellow FB (CRC 8) */
>         igt_plane_set_fb(primary, &test.yellow_fb);
>         igt_display_commit2(display, COMMIT_LEGACY);
> +       set_pipe_on_off(&data->display, output, pipe);
>         igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_8);
>
>         /* Step 13: Legacy API', blue primary, red sprite */
> @@ -497,8 +506,10 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>         igt_display_commit2(&data->display, COMMIT_LEGACY);
>
>         /* Disable the primary plane */
> +       set_pipe_on_off(&data->display, output, PIPE_NONE);
>         igt_plane_set_fb(primary, NULL);
>         igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
> +       set_pipe_on_off(&data->display, output, pipe);
>
>         /*
>          * Issue a pageflip to red FB
> @@ -520,9 +531,11 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>          * completes, which we don't have a good way to specifically test for,
>          * but at least we can make sure that nothing blows up.
>          */
> +       set_pipe_on_off(&data->display, output, pipe);
>         igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
>                                    test.red_fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT,
>                                    &test) == 0);
> +       set_pipe_on_off(&data->display, output, PIPE_NONE);
>         igt_plane_set_fb(primary, NULL);
>         igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
>
> --
> 2.38.0
>
