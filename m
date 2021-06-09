Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE156EA83
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:54:00 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id c14so7668811ybk.3
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
 <20210608192533.28684-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210608192533.28684-1-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 9 Jun 2021 12:53:48 -0500
Message-ID: <CAOFGe95QDXUY3OSHw4eZxYqqXTEPr+wq_q_L+fiaHhMVEhm9tw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_exec_reloc: Remove banned
 tests
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
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 8, 2021 at 2:25 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> These have been banned across all CI for over 2 years, realistically
> that's not going to change and they're just in the way.
>
> v2: Keep the !HANG parts (CI)
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  tests/i915/gem_exec_reloc.c  | 33 +++++++--------------------------
>  tests/intel-ci/blacklist.txt |  1 -
>  2 files changed, 7 insertions(+), 27 deletions(-)
>
> diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> index 397c335e4d3c..0e75a5e52cc4 100644
> --- a/tests/i915/gem_exec_reloc.c
> +++ b/tests/i915/gem_exec_reloc.c
> @@ -614,8 +614,6 @@ static bool has_64b_reloc(int fd)
>
>  #define NORELOC 1
>  #define ACTIVE 2
> -#define INTERRUPTIBLE 4
> -#define HANG 8
>  static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
>  {
>  #define OBJSZ 8192
> @@ -678,8 +676,7 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
>                         spin = igt_spin_new(fd,
>                                             .engine = I915_EXEC_DEFAULT,
>                                             .dependency = obj.handle);
> -                       if (!(flags & HANG))
> -                               igt_spin_set_timeout(spin, NSEC_PER_SEC/100);
> +                       igt_spin_set_timeout(spin, NSEC_PER_SEC/100);
>                         igt_assert(gem_bo_busy(fd, obj.handle));
>                 }
>
> @@ -746,8 +743,7 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
>                         spin = igt_spin_new(fd,
>                                             .engine = I915_EXEC_DEFAULT,
>                                             .dependency = obj.handle);
> -                       if (!(flags & HANG))
> -                               igt_spin_set_timeout(spin, NSEC_PER_SEC/100);
> +                       igt_spin_set_timeout(spin, NSEC_PER_SEC/100);
>                         igt_assert(gem_bo_busy(fd, obj.handle));
>                 }
>
> @@ -873,8 +869,7 @@ static void basic_range(int fd, unsigned flags)
>
>         if (flags & ACTIVE) {
>                 spin = igt_spin_new(fd, .dependency = obj[n].handle);
> -               if (!(flags & HANG))
> -                       igt_spin_set_timeout(spin, NSEC_PER_SEC/100);
> +               igt_spin_set_timeout(spin, NSEC_PER_SEC/100);
>                 igt_assert(gem_bo_busy(fd, obj[n].handle));
>         }
>
> @@ -1468,8 +1463,6 @@ igt_main
>                 { "", 0 , true},
>                 { "-noreloc", NORELOC, true },
>                 { "-active", ACTIVE, true },
> -               { "-interruptible", ACTIVE | INTERRUPTIBLE },
> -               { "-hang", ACTIVE | HANG },
>                 { },
>         }, *f;
>         uint64_t size;
> @@ -1483,14 +1476,7 @@ igt_main
>         }
>
>         for (f = flags; f->name; f++) {
> -               igt_hang_t hang;
> -
>                 igt_subtest_group {
> -                       igt_fixture {
> -                               if (f->flags & HANG)
> -                                       hang = igt_allow_hang(fd, 0, 0);
> -                       }
> -
>                         for (m = modes; m->name; m++) {
>                                 igt_subtest_f("%s%s%s",
>                                               f->basic ? "basic-" : "",
> @@ -1498,22 +1484,17 @@ igt_main
>                                               f->name) {
>                                         if ((m->before | m->after) & I915_GEM_DOMAIN_WC)
>                                                 igt_require(gem_mmap__has_wc(fd));
> -                                       igt_while_interruptible(f->flags & INTERRUPTIBLE)
> -                                               basic_reloc(fd, m->before, m->after, f->flags);
> +
> +                                       basic_reloc(fd, m->before, m->after, f->flags);
>                                 }
>                         }
>
>                         if (!(f->flags & NORELOC)) {
>                                 igt_subtest_f("%srange%s",
>                                               f->basic ? "basic-" : "", f->name) {
> -                                       igt_while_interruptible(f->flags & INTERRUPTIBLE)
> -                                               basic_range(fd, f->flags);

Did you mean to drop all basic_range here?  I think not.  With that
restored without the igt_while_interruptable(),

Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

> -                               }
> -                       }
>
> -                       igt_fixture {
> -                               if (f->flags & HANG)
> -                                       igt_disallow_hang(fd, hang);
> +                                       basic_range(fd, f->flags);
> +                               }
>                         }
>                 }
>         }
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 33f92e37f602..4d2555f8adb3 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -30,7 +30,6 @@ igt@gem_exec_flush@(?!.*basic).*
>  igt@gem_exec_latency(@.*)?
>  igt@gem_exec_lut_handle(@.*)?
>  igt@gem_exec_nop@(?!.*basic).*
> -igt@gem_exec_reloc@(?!.*basic).*
>  igt@gem_exec_suspend@(?!.*basic).*
>  igt@gem_exec_whisper@(?!basic).*
>  igt@gem_fd_exhaustion(@.*)?
> --
> 2.24.1
>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
