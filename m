Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D466EA9B
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:59:58 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id i4so36768235ybe.2
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
 <20210608094020.21598-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20210608094020.21598-3-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 9 Jun 2021 12:59:46 -0500
Message-ID: <CAOFGe96j_-JDNS5ExyS4hX5X+cW6Qu7UwmxAq0DH52anLM05ZA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/7] Revert "i915/gem_exec_reloc: Verify
 engine isolation"
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 8, 2021 at 4:40 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> This reverts commit 9fe244cb751c9d3be0581a943bb9baa8651d8d29.
>
> This validates gpu relocations, which we're about to delete.
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  tests/i915/gem_exec_reloc.c | 73 -------------------------------------
>  1 file changed, 73 deletions(-)
>
> diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> index efe6e2e02c52..3b200f557b2c 100644
> --- a/tests/i915/gem_exec_reloc.c
> +++ b/tests/i915/gem_exec_reloc.c
> @@ -471,72 +471,6 @@ static void active_spin(int fd, unsigned engine)
>         igt_spin_free(fd, spin);
>  }
>
> -static void others_spin(int i915, unsigned engine)
> -{
> -       struct drm_i915_gem_relocation_entry reloc = {};
> -       struct drm_i915_gem_exec_object2 obj = {
> -               .relocs_ptr = to_user_pointer(&reloc),
> -               .relocation_count = 1,
> -       };
> -       struct drm_i915_gem_execbuffer2 execbuf = {
> -               .buffers_ptr = to_user_pointer(&obj),
> -               .buffer_count = 1,
> -               .flags = engine,
> -       };
> -       const struct intel_execution_engine2 *e;
> -       igt_spin_t *spin = NULL;
> -       uint64_t addr;
> -       int fence;
> -
> -       __for_each_physical_engine(i915, e) {
> -               if (e->flags == engine)
> -                       continue;
> -
> -               if (!spin) {
> -                       spin = igt_spin_new(i915,
> -                                           .engine = e->flags,
> -                                           .flags = IGT_SPIN_FENCE_OUT);
> -                       fence = dup(spin->out_fence);
> -               } else {
> -                       int old_fence;
> -
> -                       spin->execbuf.flags &= ~I915_EXEC_RING_MASK;
> -                       spin->execbuf.flags |= e->flags;
> -                       gem_execbuf_wr(i915, &spin->execbuf);
> -
> -                       old_fence = fence;
> -                       fence = sync_fence_merge(old_fence,
> -                                                spin->execbuf.rsvd2 >> 32);
> -                       close(spin->execbuf.rsvd2 >> 32);
> -                       close(old_fence);
> -               }
> -       }
> -       igt_require(spin);
> -
> -       /* All other engines are busy, let's relocate! */
> -       obj.handle = batch_create(i915);
> -       reloc.target_handle = obj.handle;
> -       reloc.presumed_offset = -1;
> -       reloc.offset = 64;
> -       gem_execbuf(i915, &execbuf);

Does this really depend on async relocs?  The spinners above ensure
that all the OTHER engines are busy and then we try to do something
with a relocation on a fresh BO here.  That should be fine.  We should
be able to place a relocation in a BO as long as that BO isn't busy.
Or am I missing something?

--Jason

> -
> -       /* Verify the relocation took place */
> -       gem_read(i915, obj.handle, 64, &addr, sizeof(addr));
> -       igt_assert_eq_u64(addr, obj.offset);
> -       gem_close(i915, obj.handle);
> -
> -       /* Even if the spinner was harmed in the process */
> -       igt_spin_end(spin);
> -       igt_assert_eq(sync_fence_wait(fence, 200), 0);
> -       igt_assert_neq(sync_fence_status(fence), 0);
> -       if (sync_fence_status(fence) < 0)
> -               igt_warn("Spinner was cancelled, %s\n",
> -                        strerror(-sync_fence_status(fence)));
> -       close(fence);
> -
> -       igt_spin_free(i915, spin);
> -}
> -
>  static bool has_64b_reloc(int fd)
>  {
>         return intel_gen(intel_get_drm_devid(fd)) >= 8;
> @@ -1329,13 +1263,6 @@ igt_main
>                 }
>         }
>
> -       igt_subtest_with_dynamic("basic-spin-others") {
> -               __for_each_physical_engine(fd, e) {
> -                       igt_dynamic_f("%s", e->name)
> -                               others_spin(fd, e->flags);
> -               }
> -       }
> -
>         igt_subtest_with_dynamic("basic-many-active") {
>                 __for_each_physical_engine(fd, e) {
>                         igt_dynamic_f("%s", e->name)
> --
> 2.24.1
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
