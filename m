Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B5C89A9B
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 15:28:40 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 p12-20020a05683019ccb02904b7e9d93563so7177026otp.13
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 08:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210710211923.784638-1-jason@jlekstrand.net>
In-Reply-To: <20210710211923.784638-1-jason@jlekstrand.net>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 12 Jul 2021 17:28:28 +0200
Message-ID: <CAKMK7uHiVDdz0b4TRRuKsFcrhoi_4idF9cSBEFiu_f=rAJgnAg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_param: Test that you
 can only set the VM once
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Jul 10, 2021 at 11:19 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> We're about to add this restriction to i915 so we should test for it
> explicitly.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  tests/i915/gem_ctx_param.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
> index c795f1b45..3b79a3e5e 100644
> --- a/tests/i915/gem_ctx_param.c
> +++ b/tests/i915/gem_ctx_param.c
> @@ -188,6 +188,15 @@ static void test_vm(int i915)
>         gem_vm_destroy(i915, arg.value);
>         igt_assert_eq(err, -EINVAL);
>
> +       /* Test that we can't set the VM twice */
> +       arg.ctx_id = gem_context_create(i915);
> +       arg.value = gem_vm_create(i915);
> +       gem_context_set_param(i915, &arg);
> +       err = __gem_context_set_param(i915, &arg);
> +       gem_vm_destroy(i915, arg.value);
> +       gem_context_destroy(i915, arg.ctx_id);
> +       igt_assert_eq(err, -EINVAL);
> +
>         /* Test that we can't set the VM after we've done an execbuf */
>         arg.ctx_id = gem_context_create(i915);
>         spin = igt_spin_new(i915, .ctx_id = arg.ctx_id);
> --
> 2.31.1
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
