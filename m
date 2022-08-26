Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FC310EA15
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Aug 2022 18:16:43 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-333a4a5d495so55652917b3.10
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Aug 2022 11:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220825012401.2753758-1-alex.hung@amd.com>
 <CAJUqKUqcQj-TTR0K_J=D=5PhvkburXJXbaqoFfF93k8_=U7JLA@mail.gmail.com>
 <38cc4ab5-d313-3375-1692-6121c96394ac@amd.com>
In-Reply-To: <38cc4ab5-d313-3375-1692-6121c96394ac@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 26 Aug 2022 14:16:31 -0400
Message-ID: <CAJUqKUrQBoCTNTB9jB=mA+=LNPu4DpDjC0Gmde20Z=Lrwp63aA@mail.gmail.com>
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

On Thu, Aug 25, 2022 at 2:21 PM Alex Hung <alex.hung@amd.com> wrote:
>
>
>
> On 2022-08-25 08:37, Mark Yacoub wrote:
> > On Thu, Aug 25, 2022 at 3:54 AM Alex Hung <alex.hung@amd.com> wrote:
> >>
> >> This is to be deprecated by a kernel fix.
> > Can you link the kernel commit for reference
>
> The kernel and IGT patches are inter-dependent. This patch is required
> to avoid regression from kernel testing and that's the reason I
> submitted IGT patch first.
sounds good. Always good removing driver specific checks.
>
> >>
> >> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Mark Yacoub <markyacoub@chromium.org>
> >> ---
> >>   tests/kms_concurrent.c | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> >> index 6f8ffd4a..3ad51569 100644
> >> --- a/tests/kms_concurrent.c
> >> +++ b/tests/kms_concurrent.c
> >> @@ -276,8 +276,6 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
> >>                  /* switch to lower resolution */
> >>                  igt_output_override_mode(output, mode_lo);
> >>                  free(mode_lo);
> >> -               if (is_amdgpu_device(data->drm_fd))
> >> -                       igt_output_set_pipe(output, PIPE_NONE);
> >>                  igt_display_commit2(&data->display, COMMIT_ATOMIC);
> >>
> >>                  /* switch back to higher resolution */
> >> --
> >> 2.37.2
> >>
