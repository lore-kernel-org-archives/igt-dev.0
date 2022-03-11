Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C53D10E953
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 12:23:21 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id h196so6781169qke.12
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 04:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20220311070309.3281660-1-mastanx.katragadda@intel.com>
 <Yis+nkpghfj7Qksp@kamilkon-DESK1>
In-Reply-To: <Yis+nkpghfj7Qksp@kamilkon-DESK1>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 11 Mar 2022 12:22:54 +0000
Message-ID: <CAM0jSHP1_jXfpqPHiu3uVpY6=L=YS4ADRvf-A3F5kz1FkKrJmg@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mastan Katragadda <mastanx.katragadda@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [i-g-t,
 v2] igt/gem_mmap_offset: Adding subtest oob_read
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 11 Mar 2022 at 12:20, Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Dnia 2022-03-11 at 12:33:09 +0530, Mastan Katragadda napisa=C5=82(a):
> > This test will Detect A missing bounds check in vm_access().
> ---------------- ^
> > can lead to an out-of-bounds read or write in the adjacent memory area.
> >
>
> Commit description looks like copy-paste, mixed. Maybe just
> s/This test will Detect A/Detect a/
>
> and remove dot after "vm_access()."
>
> > Changes Since V1:
> >       - Incorporated minor changes as suggested in feedback [Chris/Matt=
hew].
> >         - Fixed build failures.
> >
> > Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  tests/i915/gem_mmap_offset.c | 44 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.=
c
> > index 8148f0a2..c8fab18b 100644
> > --- a/tests/i915/gem_mmap_offset.c
> > +++ b/tests/i915/gem_mmap_offset.c
> > @@ -22,6 +22,8 @@
> >   */
> >
> >  #include <errno.h>
> > +#include <unistd.h>
> > +#include <fcntl.h>
> >  #include <pthread.h>
> >  #include <signal.h>
> >  #include <stdatomic.h>
> > @@ -289,6 +291,44 @@ static void *memchr_inv(const void *s, int c, size=
_t n)
> >       return NULL;
> >  }
> >
> > +static void
> > +test_oob_read(int i915)
> > +{
> > +     unsigned char read_buf[4096];
> > +     uint32_t handle;
> > +     uintptr_t addr;
> > +     int memfd;
> > +     int ret;
> > +
> > +     handle =3D gem_create(i915, 4096);
>
> What if page size is bigger ? You ask for only 4096 bytes, but
> you can get more depending on page size.

AFAIK this will always just give us system memory.

>
> Regards,
> Kamil Konieczny
>
> > +
> > +     for_each_mmap_offset_type(i915, t) {
> > +             uint32_t *ptr;
> > +
> > +             ptr =3D __mmap_offset(i915, handle, 0, 4096,
> > +                                 PROT_READ | PROT_WRITE,
> > +                                 t->type);
> > +             if (!ptr)
> > +                     continue;
> > +
> > +             memfd =3D open("/proc/self/mem", O_RDWR);
> > +             igt_require_f(memfd !=3D -1, "/proc/self/mem\n");
> > +
> > +             addr =3D (uintptr_t)ptr + 4092;
> > +             ret =3D lseek(memfd, addr, SEEK_SET);
> > +             igt_assert_f(ret !=3D -1, "lseek failed\n");
> > +
> > +             /* Triggering the buf (out of bound read) */
> > +             ret =3D read(memfd, read_buf, 8);
> > +             igt_assert(ret =3D=3D -1 && errno =3D=3D  EIO);
> > +
> > +             munmap(ptr, 4096);
> > +             close(memfd);
> > +     }
> > +
> > +     gem_close(i915, handle);
> > +}
> > +
> >  static void test_ptrace(int i915)
> >  {
> >       const unsigned int SZ =3D 3 * 4096;
> > @@ -692,6 +732,10 @@ igt_main
> >       igt_subtest_f("pf-nonblock")
> >               pf_nonblock(i915);
> >
> > +     igt_describe("Check Linear Out-Of-Bound in Vm_access");
> > +     igt_subtest("oob-read")
> > +             test_oob_read(i915);
> > +
> >       igt_subtest_with_dynamic("ptrace")
> >               test_ptrace(i915);
> >
> > --
> > 2.25.1
> >
