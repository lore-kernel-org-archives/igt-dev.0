Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2982710E374
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Aug 2022 14:38:02 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-3321c2a8d4cso546754197b3.5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Aug 2022 07:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220825012401.2753758-1-alex.hung@amd.com>
In-Reply-To: <20220825012401.2753758-1-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 25 Aug 2022 10:37:50 -0400
Message-ID: <CAJUqKUqcQj-TTR0K_J=D=5PhvkburXJXbaqoFfF93k8_=U7JLA@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests/kms_concurrent: remove an AMD device
 check
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

On Thu, Aug 25, 2022 at 3:54 AM Alex Hung <alex.hung@amd.com> wrote:
>
> This is to be deprecated by a kernel fix.
Can you link the kernel commit for reference
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_concurrent.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 6f8ffd4a..3ad51569 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -276,8 +276,6 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
>                 /* switch to lower resolution */
>                 igt_output_override_mode(output, mode_lo);
>                 free(mode_lo);
> -               if (is_amdgpu_device(data->drm_fd))
> -                       igt_output_set_pipe(output, PIPE_NONE);
>                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
>                 /* switch back to higher resolution */
> --
> 2.37.2
>
