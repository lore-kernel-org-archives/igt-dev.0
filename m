Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063EB6EE1E
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 15:36:48 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id b18so18687210lfb.1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 08:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210916141827.17720-1-vidya.srinivas@intel.com>
In-Reply-To: <20210916141827.17720-1-vidya.srinivas@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 16 Sep 2021 11:36:34 -0400
Message-ID: <CAJUqKUqpus_Sui-O5LrViFYB1wxbMEg-Hz4Ak06XS06yxKy=QA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Fix regression in
 test_resolution_with_output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, "Modem, Bhanuprakash" <Bhanuprakash.Modem@intel.com>, Mark Yacoub <markyacoub@google.com>, Vidya Srinivas <vidya.srinivas@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

@Siquiera, I remember this also caused a regression on Qualcomm
devices as well.
Will removing this regress AMD? Any work around?

On Thu, Sep 16, 2021 at 10:30 AM Vidya Srinivas
<vidya.srinivas@intel.com> wrote:
>
> Staring commit fea0e38e690c30c6 "Making the test more generic"
> test_resolution_with_output introduced setting igt_output_set_pipe
> to PIPE_NONE. This is triggering atomic check failure resulting in
> "enabled/connectors mismatch" under drm_atomic_helper_check_modeset.
> Patch fixes this issue.
>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_concurrent.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 25c67eb469d1..40096ea1c457 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -268,7 +268,6 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
>
>                 /* switch to lower resolution */
>                 igt_output_override_mode(output, mode_lo);
> -               igt_output_set_pipe(output, PIPE_NONE);
>                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
>                 /* switch back to higher resolution */
> --
> 2.33.0
>
