Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48E16EE1D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 15:18:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i7so19808623lfr.13
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 08:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151334.15818-1-vidya.srinivas@intel.com>
 <20210916135955.17270-1-vidya.srinivas@intel.com>
In-Reply-To: <20210916135955.17270-1-vidya.srinivas@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 16 Sep 2021 11:17:58 -0400
Message-ID: <CAJUqKUory3b+0r9iTFiX_deX7kYXNQT3k1e1ZbEnKVtDddZP-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Skip tests if
 selected fetch is not available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, "Modem, Bhanuprakash" <Bhanuprakash.Modem@intel.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

This looks better.

On Thu, Sep 16, 2021 at 10:12 AM Vidya Srinivas
<vidya.srinivas@intel.com> wrote:
>
> Currently the tests are failing on systems where selected
> fetch feature is not availble. Kernel returns -EINVAL when
> the test executes reporting "Invalid debug mask 4".
> Patch skips if selected fetch feature is not available
> in the kernel.
>
> v2: Incorportated Mark Yacoub's comments.
> Changed igt_skip to igt_require_f
>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reviewed-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  lib/igt_psr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 68240f9a33b4..0af503fb796e 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -167,7 +167,7 @@ static bool psr_set(int device, int debugfs_fd, int mode)
>                 }
>
>                 ret = psr_write(debugfs_fd, debug_val);
> -               igt_assert(ret > 0);
> +               igt_require_f(ret == 0, "PSR2 SF feature not available\n");
>         }
>
>         /* Restore original value on exit */
> --
> 2.33.0
>
