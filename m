Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC956EA42
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 16:45:48 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id r5so17703154lfr.5
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 09:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210618142855.5750-1-Anson.Jacob@amd.com>
 <20210618142855.5750-5-Anson.Jacob@amd.com>
In-Reply-To: <20210618142855.5750-5-Anson.Jacob@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 18 Jun 2021 12:45:36 -0400
Message-ID: <CAJUqKUo_VHrYWZwQ=6NOWs=uNRt43PmJF9AchXu6uqfvc5-1QA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/kms_plane_multiple: Disable
 CRTC if no planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anson Jacob <Anson.Jacob@amd.com>
Cc: igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>, Petri Latvala <petri.latvala@intel.com>, Victor Lu <victorchengchi.lu@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 10:29 AM Anson Jacob <Anson.Jacob@amd.com> wrote:
>
> From: Victor Lu <victorchengchi.lu@amd.com>
>
> [why]
> amdgpu will reject commits where the CRTC is enabled and there are no
> active planes.
>
> [how]
> Disable the CRTC when committing with no active planes.
Have we decided that this is the way moving forward?
I got no strong opinion, just wondering.
>
> Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
> Acked-by: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Mark Yacoub <markyacoub@google.com>
For posterity, please use markyacoub@chromium.org. thanks!
> ---
>  tests/kms_plane_multiple.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 4424b864b2d6..805c2a2130d7 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -315,6 +315,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>                 for_each_plane_on_pipe(&data->display, pipe, plane)
>                         igt_plane_set_fb(plane, NULL);
>
> +               /* Disable CRTC if no active planes */
> +               igt_output_set_pipe(output, PIPE_NONE);
>                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
>                 for (int x = 0; x < c; x++)
> @@ -344,6 +346,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>                 for_each_plane_on_pipe(&data->display, pipe, plane)
>                         igt_plane_set_fb(plane, NULL);
>
> +               /* Disable CRTC if no active planes */
> +               igt_output_set_pipe(output, PIPE_NONE);
>                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
>                 for (int x = 0; x < c; x++)
> --
> 2.25.1
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
