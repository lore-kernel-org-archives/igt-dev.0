Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BF010F320
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 16:34:52 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a30so4810140ljq.9
 for <igt-dev@lists.freedesktop.org>; Mon, 09 May 2022 09:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220509155045.907053-1-alex.hung@amd.com>
 <20220509155045.907053-2-alex.hung@amd.com>
In-Reply-To: <20220509155045.907053-2-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 9 May 2022 12:34:40 -0400
Message-ID: <CAJUqKUokPMnbDq8OK_jNqTLoq+eBZ_C5c1JwPyp3WJKG7yj-sA@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH 2/2 i-g-t][V2] tests/kms_universal_plane:
 Enable gen9_test_pipe for all devices
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

On Mon, May 9, 2022 at 11:51 AM Alex Hung <alex.hung@amd.com> wrote:
>
> This subtest runs on non-i915 devices, and let's make it generic by
I like this, thank you!
> removing igt_require_intel and renaming it.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_universal_plane.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 3a3667e6..eab99962 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -701,15 +701,14 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
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
> -
> -       igt_require_intel(data->drm_fd);
> -       igt_skip_on(data->display_ver < 9);
> +       if (is_i915_device(data->drm_fd))
> +               igt_skip_on(data->display_ver < 9);
you can do instead ` igt_skip_on(is_i915_device(data->drm_fd) &&
data->display_ver < 9);`
>         igt_require_pipe(&data->display, pipe);
>
>         igt_output_set_pipe(output, pipe);
> @@ -789,10 +788,10 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
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
> 2.25.1
>
