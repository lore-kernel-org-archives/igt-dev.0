Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DDA6F89F
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jun 2021 18:46:46 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id r198so12166760lff.11
 for <igt-dev@lists.freedesktop.org>; Fri, 04 Jun 2021 11:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <1622175883-12405-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1622175883-12405-1-git-send-email-vidya.srinivas@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 4 Jun 2021 14:46:34 -0400
Message-ID: <CAJUqKUojeh3fv2KA7=xwOWtaF+axW0EuNk3PJ0iEqft_cFXTxg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] [RFC] tests/kms_flip.c: Fix subtests
 flip-vs-suspend
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
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Tested it on ChromeOS and it runs well. But I think we should fix the
root cause instead.

On Fri, May 28, 2021 at 12:33 AM Vidya Srinivas
<vidya.srinivas@intel.com> wrote:
>
> Some Intel Gen11 systems are not able to do a RTC wake.
> Instead change the default SUSPEND_TEST_NONE to
> SUSPEND_TEST_PLATFORM.
>
Tested on ChromeOS on TGL (Delbin) and JSL (Drawlat)
Tested-by: Mark Yacoub <markyacoub@chromium.org>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_flip.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 8f736652be90..8afac88c9b15 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -835,7 +835,8 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
>
>         if (o->flags & TEST_SUSPEND)
>                 igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> -                                             SUSPEND_TEST_NONE);
> +                                             is_i915_device(drm_fd)?
> +                                             SUSPEND_TEST_PLATFORM:SUSPEND_TEST_NONE);
>
>         if (do_vblank && (o->flags & TEST_EINVAL) && o->vblank_state.count > 0)
>                 igt_assert(do_wait_for_vblank(o, o->pipe, target_seq, &vbl_reply)
> --
> 2.7.4
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
