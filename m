Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2881E10E4F8
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 15:28:22 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id 65so1343310ybp.6
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 08:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220923012819.4174059-1-alex.hung@amd.com>
In-Reply-To: <20220923012819.4174059-1-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 26 Sep 2022 11:28:10 -0400
Message-ID: <CAJUqKUpLfY4oQS-zSSCF=_LPSBj97m+uUH-pOqgXyJM33S0JXg@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests/kms_plane_cursor: update pipe to output
 for each test
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

On Thu, Sep 22, 2022 at 9:28 PM Alex Hung <alex.hung@amd.com> wrote:
>
> Pipe/pipe_id changes during test executions, and it
> needs updating in test_cursor.
>
> Resolved input/output error when reading CRC:
>
> Test assertion failure function igt_pipe_crc_start ...
> Failed assertion: pipe_crc->crc_fd != -1
> Last errno: 5, Input/output error
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_plane_cursor.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 6b7e5cef..d29dc327 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -87,8 +87,6 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
>         data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
>                                           INTEL_PIPE_CRC_SOURCE_AUTO);
>
> -       igt_output_set_pipe(data->output, data->pipe_id);
> -
>         /* Overlay rectangle for a rect in the center of the screen */
>         data->or.x = data->mode->hdisplay / 4;
>         data->or.y = data->mode->vdisplay / 4;
> @@ -244,6 +242,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
>                             1.0, 0.0, 1.0, &data->cfb);
>
>         igt_plane_set_fb(data->primary, &data->pfb);
> +       igt_output_set_pipe(data->output, data->pipe_id);
>         igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
>         test_cursor_spots(data, size, flags);
> --
> 2.34.1
>
