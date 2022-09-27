Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8EC10E3C7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 14:56:56 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id 65so5049890ybp.6
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 07:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220926214933.4077592-1-alex.hung@amd.com>
In-Reply-To: <20220926214933.4077592-1-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 27 Sep 2022 10:56:45 -0400
Message-ID: <CAJUqKUr+oP3ROrXE+xcY4ZQ5er6eZMp1uSBHmWdd-43CteZHoQ@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests/kms_plane_multiple: turn off pipe if
 all planes are off
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

On Mon, Sep 26, 2022 at 5:50 PM Alex Hung <alex.hung@amd.com> wrote:
>
> amdgpu rejects when crtc is on + all planes are off, and it
> is necessary to turn off crtc when all planes are off.
>
> This is revised from https://patchwork.freedesktop.org/series/80904/
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_plane_multiple.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index cbe8c189..6ebde8b0 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -311,6 +311,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>                 for_each_plane_on_pipe(&data->display, pipe, plane)
>                         igt_plane_set_fb(plane, NULL);
>
> +               if (is_amdgpu_device(data->drm_fd))
what if we apply it for everyone else?
> +                       igt_output_set_pipe(output, PIPE_NONE);
>                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
>                 for (int x = 0; x < c; x++)
> @@ -344,6 +346,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>                 for_each_plane_on_pipe(&data->display, pipe, plane)
>                         igt_plane_set_fb(plane, NULL);
>
> +               if (is_amdgpu_device(data->drm_fd))
ditto - would it hurt?
> +                       igt_output_set_pipe(output, PIPE_NONE);
>                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
>                 for (int x = 0; x < c; x++)
> --
> 2.34.1
>
