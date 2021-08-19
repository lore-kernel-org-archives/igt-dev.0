Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27F86E84F
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 15:50:40 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id y9so4926441qtv.7
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 08:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210819152507.25912-1-petri.latvala@intel.com>
In-Reply-To: <20210819152507.25912-1-petri.latvala@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 19 Aug 2021 16:50:13 +0100
Message-ID: <CAM0jSHM327JmQkDOw=mm7ZEAsutr2dwvzp=nca231q=gNi5MPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] kms_ccs: Require a connected output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>, Matthew Auld <matthew.auld@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 19 Aug 2021 at 16:22, Petri Latvala <petri.latvala@intel.com> wrote:
>
> From: Chris Wilson <chris.p.wilson@intel.com>
>
> Check that the output exists before dereferencing, as it may be NULL if
> there are no displays connected.
>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/3678

For both patches:
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>  tests/kms_ccs.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> index e60a6a77..238c245c 100644
> --- a/tests/kms_ccs.c
> +++ b/tests/kms_ccs.c
> @@ -513,6 +513,7 @@ static void test_output(data_t *data, const char* testformatstring)
>         igt_fixture {
>                 data->output = igt_get_single_output_for_pipe(&data->display,
>                                                               data->pipe);
> +               igt_require(data->output);
>                 igt_output_set_pipe(data->output, data->pipe);
>         }
>
> @@ -611,6 +612,7 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
>                 igt_require_pipe_crc(data.drm_fd);
>
>                 igt_display_require(&data.display, data.drm_fd);
> +               igt_display_require_output(&data.display);
>
>                 if (!data.user_seed)
>                         data.seed = time(NULL);
> --
> 2.29.2
>
