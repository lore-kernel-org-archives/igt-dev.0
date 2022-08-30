Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9054610E091
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Aug 2022 14:55:59 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-32a09b909f6so280318067b3.0
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Aug 2022 07:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220826210737.3263786-1-alex.hung@amd.com>
In-Reply-To: <20220826210737.3263786-1-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 30 Aug 2022 10:55:42 -0400
Message-ID: <CAJUqKUrZ8rpQyNvZo+jQ4H9XgC+1KvRpcgoR9yqw8Cw2thKNYw@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH 1/2][V2] tests/kms_universal_plane: Enable
 gen9_test_pipe for all devices
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
> This subtest runs on non-i915 devices, and let's make it generic by
> removing igt_require_intel and renaming it.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_universal_plane.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 3cb6d704..9eab1a57 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -699,15 +699,14 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
>   * windowing)
>   */
>  static void
> -gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> +pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  {
>         gen9_test_t test = { .data = data };
>         igt_plane_t *primary;
>
>         int ret = 0;
>
> -       igt_require_intel(data->drm_fd);
> -       igt_skip_on(data->display_ver < 9);
> +       igt_skip_on(is_i915_device(data->drm_fd) && data->display_ver < 9);
>         igt_require_pipe(&data->display, pipe);
>
>         igt_output_set_pipe(output, pipe);
> @@ -787,10 +786,10 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>                         cursor_leak_test_pipe(data, pipe, output);
>
>         igt_describe("Check if pageflip succeeds in windowed setting");
> -       igt_subtest_f("universal-plane-gen9-features-pipe-%s",
> +       igt_subtest_f("universal-plane-pageflip-windowed-pipe-%s",
>                       kmstest_pipe_name(pipe))
>                 for_each_valid_output_on_pipe(&data->display, pipe, output)
> -                       gen9_test_pipe(data, pipe, output);
> +                       pageflip_win_test_pipe(data, pipe, output);
>  }
>
>  static data_t data;
> --
> 2.37.2
>
