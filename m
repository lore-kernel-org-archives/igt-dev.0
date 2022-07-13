Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948D193069
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 01:27:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 9-20020a1c0209000000b003a2dfdebe47so361485wmc.3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jul 2022 18:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220622163915.364-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220622163915.364-1-quic_jesszhan@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 12 Jul 2022 18:27:45 -0700
Message-ID: <CAF6AEGudF4G7yQHK+jk_jP0nd62JMoLYL+P29GnfLfG4A3ETZg@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_writeback: Detach pipe
 only for valid FB_ID
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 9:39 AM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Currently, the writeback DRM driver will accept a commit on the
> writeback connector only if a valid FB_ID is presented. When we run
> the "writeback-invalid-parameters" or "writeback-format-pixels" subtests
> individually, this will not be true because no successful commit has
> happened. So there is no need to clean up the pipes in detach_crtc.
>
> Only issue a NULL commit if FB_ID is greater than zero. This will make
> sure that a cleanup happens only when necessary.
>
> Changes since V1:
> - Fix improper brace style for detach_crtc()
> - Rebase onto tip of master
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  tests/kms_writeback.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 6efc72df4327..1a623655da49 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -139,7 +139,16 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>         return NULL;
>  }
>
> -static void detach_crtc(igt_display_t *display, igt_output_t *output) {
> +static uint64_t get_writeback_fb_id(igt_output_t *output)
> +{
> +       return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
> +}
> +
> +static void detach_crtc(igt_display_t *display, igt_output_t *output)
> +{
> +       if (get_writeback_fb_id(output) == 0)
> +               return;
> +
>         igt_output_set_pipe(output, PIPE_NONE);
>         igt_display_commit2(display, COMMIT_ATOMIC);
>  }
> --
> 2.31.0
>
