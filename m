Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578467A50A
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Dec 2021 17:31:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211206164251.25983-1-arjun.melkaveri@intel.com>
References: <20211206164251.25983-1-arjun.melkaveri@intel.com>
From: Chris Wilson <chris.p.wilson@intel.com>
Date: Mon, 06 Dec 2021 17:31:12 +0000
Message-ID: <163881187296.30657.6792120570675097718@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_engines: Added out
 fence for execute-one subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Arjun Melkaveri (2021-12-06 16:42:51)
> To make spinner to be on same context for following execbuf,
> spin out_fence is passed to execbuf.rsvd2.
>=20
> Used IGT_SPIN_FENCE_OUT flag in spinner.
>=20
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_ctx_engines.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> index 003dd171..c746f268 100644
> --- a/tests/i915/gem_ctx_engines.c
> +++ b/tests/i915/gem_ctx_engines.c
> @@ -298,7 +298,7 @@ static void execute_one(int i915)
>                         spin =3D igt_spin_new(i915,
>                                             .ahnd =3D ahnd,
>                                             .ctx =3D ctx,
> -                                           .flags =3D (IGT_SPIN_NO_PREEM=
PTION |
> +                                           .flags =3D (IGT_SPIN_FENCE_OU=
T | IGT_SPIN_NO_PREEMPTION |

Introducing FENCE_OUT means we can stop using the no-preemption, as no
subsequent request is allowed to execute before the cork.

But we do have to add I915_EXEC_FENCE_IN to the execbuf.flags so that it
is executed after the spinner.

>                                                       IGT_SPIN_POLL_RUN));
> =20
>                         do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
> @@ -320,6 +320,7 @@ static void execute_one(int i915)
>                                 int expected =3D j =3D=3D i ? 0 : -EINVAL;
> =20
>                                 execbuf.rsvd1 =3D ctx->id;
> +                               execbuf.rsvd2 =3D spin->out_fence;

It's also complicated by that we re-execute the spinner for each engine,
each time it will have a new out fence not recorded in spin->out_fence,
but in spin->execbuf.rsvd2.

6a4199ef96 HEAD@{1222}: am: i915/gem_ctx_engines: Replace NO_PREEMPT spinne=
rs with explicit fencing
diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 2804cae0fe..13555bc525 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -331,6 +331,7 @@ static void execute_one(int i915)
                .buffers_ptr =3D to_user_pointer(&obj),
                .buffer_count =3D 1,
                .rsvd1 =3D param.ctx_id,
+               .flags =3D I915_EXEC_FENCE_IN,
        };
        const uint32_t bbe =3D MI_BATCH_BUFFER_END;
        const struct intel_execution_engine2 *e;
@@ -338,7 +339,7 @@ static void execute_one(int i915)

        /* Prewarm the spinner */
        spin =3D igt_spin_new(i915, .ctx_id =3D param.ctx_id,
-                           .flags =3D (IGT_SPIN_NO_PREEMPTION |
+                           .flags =3D (IGT_SPIN_FENCE_OUT |
                                      IGT_SPIN_POLL_RUN));

        gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
@@ -369,6 +370,7 @@ static void execute_one(int i915)
                        gem_sync(i915, spin->handle);
                        igt_spin_reset(spin);
                        gem_execbuf(i915, &spin->execbuf);
+                       execbuf.rsvd2 =3D spin->execbuf.rsvd2 >> 32;

                        do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
                        igt_assert_eq(busy.busy, 0);
@@ -382,7 +384,6 @@ static void execute_one(int i915)
                        param.size =3D sizeof(uint64_t) + (i + 1) * sizeof(=
uint32_t);
                        gem_context_set_param(i915, &param);

-                       igt_spin_busywait_until_started(spin);
                        for (int j =3D 0; j <=3D I915_EXEC_RING_MASK; j++) {
                                int expected =3D j =3D=3D i ? 0 : -EINVAL;

@@ -397,6 +398,7 @@ static void execute_one(int i915)
                                      i !=3D -1 ? 1 << e->class : 0);

                        igt_spin_end(spin);
+                       close(spin->execbuf.rsvd2 >> 32);

                        gem_sync(i915, obj.handle);
                        do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);

The bigger challenge is removing the NO_PREEMPTION from independent-all.
-Chris
