Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDED6EAE1
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 18:03:21 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id f84so36815376ybg.0
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 11:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
 <20210608094020.21598-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20210608094020.21598-6-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 9 Jun 2021 13:03:09 -0500
Message-ID: <CAOFGe94-29FqdQ6QOb5LRJhS8wbh6n+nnjZFru=Zj838x8VCcg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/7] Revert "i915/gem_exec_reloc: Check
 that relocations do not block"
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

Very much

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

On Tue, Jun 8, 2021 at 4:40 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> This reverts commit 5343ca6ad8fac39fe4d468f771af72c968404bea.
>
> This validates gpu relocations, which we're about to delete.
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  tests/i915/gem_exec_reloc.c | 52 -------------------------------------
>  1 file changed, 52 deletions(-)
>
> diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> index cbd40962c610..5b15bcdc3a1f 100644
> --- a/tests/i915/gem_exec_reloc.c
> +++ b/tests/i915/gem_exec_reloc.c
> @@ -344,51 +344,6 @@ static void active(int fd, unsigned engine)
>         gem_close(fd, obj[0].handle);
>  }
>
> -static unsigned int offset_in_page(void *addr)
> -{
> -       return (uintptr_t)addr & 4095;
> -}
> -
> -static void active_spin(int fd, unsigned engine)
> -{
> -       const uint32_t bbe = MI_BATCH_BUFFER_END;
> -       struct drm_i915_gem_relocation_entry reloc;
> -       struct drm_i915_gem_exec_object2 obj[2];
> -       struct drm_i915_gem_execbuffer2 execbuf;
> -       igt_spin_t *spin;
> -
> -       spin = igt_spin_new(fd,
> -                           .engine = engine,
> -                           .flags = IGT_SPIN_NO_PREEMPTION);
> -
> -       memset(obj, 0, sizeof(obj));
> -       obj[0] = spin->obj[IGT_SPIN_BATCH];
> -       obj[0].relocs_ptr = to_user_pointer(&reloc);
> -       obj[0].relocation_count = 1;
> -       obj[1].handle = gem_create(fd, 4096);
> -       gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
> -
> -       memset(&reloc, 0, sizeof(reloc));
> -       reloc.presumed_offset = -1;
> -       reloc.offset = offset_in_page(spin->condition);
> -       reloc.target_handle = obj[0].handle;
> -
> -       memset(&execbuf, 0, sizeof(execbuf));
> -       execbuf.buffers_ptr = to_user_pointer(obj);
> -       execbuf.buffer_count = 2;
> -       execbuf.flags = engine;
> -
> -       gem_execbuf(fd, &execbuf);
> -       gem_close(fd, obj[1].handle);
> -       igt_assert_eq(*spin->condition, spin->cmd_precondition);
> -
> -       igt_spin_end(spin);
> -       gem_sync(fd, spin->handle);
> -
> -       igt_assert_eq(*spin->condition, obj[0].offset);
> -       igt_spin_free(fd, spin);
> -}
> -
>  static bool has_64b_reloc(int fd)
>  {
>         return intel_gen(intel_get_drm_devid(fd)) >= 8;
> @@ -964,13 +919,6 @@ igt_main
>                 }
>         }
>
> -       igt_subtest_with_dynamic("basic-spin") {
> -               __for_each_physical_engine(fd, e) {
> -                       igt_dynamic_f("%s", e->name)
> -                               active_spin(fd, e->flags);
> -               }
> -       }
> -
>         igt_subtest("invalid-domains")
>                 invalid_domains(fd);
>
> --
> 2.24.1
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
