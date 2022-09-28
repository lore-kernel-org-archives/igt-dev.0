Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E889C10E525
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 14:17:52 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id 63so16136072ybq.4
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 07:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220927193512.447146-1-alex.hung@amd.com>
In-Reply-To: <20220927193512.447146-1-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 28 Sep 2022 10:17:41 -0400
Message-ID: <CAJUqKUqvSE=3TUZaoxmKiZBbw7r9cbSp_2GFQ+i8M4oih4BUJA@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH][V2] tests/kms_plane_multiple: turn off pipe
 if all planes are off
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

is the second fix not necessary anymore?

On Tue, Sep 27, 2022 at 3:36 PM Alex Hung <alex.hung@amd.com> wrote:
>
> amdgpu rejects when crtc is on + all planes are off, and it
> is necessary to turn off crtc when all planes are off.
>
> This is revised from https://patchwork.freedesktop.org/series/80904/
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_plane_multiple.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index cbe8c189..e900dc7f 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -311,6 +311,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>                 for_each_plane_on_pipe(&data->display, pipe, plane)
>                         igt_plane_set_fb(plane, NULL);
>
> +               if (is_amdgpu_device(data->drm_fd))
> +                       igt_output_set_pipe(output, PIPE_NONE);
I'm still confused why do you need this just for AMD. If AMD has some
requirements, I think it's gonna work for everyone else. If it breaks
in the CI (testing on intel devices), then I think something is off
here, and maybe it's a kernel thing.
If it's the crtc/plan workaround that's in amdgpu, an IGT fix has
always worked for everyone and didn't need an (is amd only) check.
>                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
>                 for (int x = 0; x < c; x++)
> @@ -344,6 +346,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>                 for_each_plane_on_pipe(&data->display, pipe, plane)
>                         igt_plane_set_fb(plane, NULL);
>
> +               igt_output_set_pipe(output, PIPE_NONE);
>                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
>                 for (int x = 0; x < c; x++)
> --
> 2.34.1
>
