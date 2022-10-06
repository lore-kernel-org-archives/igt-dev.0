Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F8D10E324
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Oct 2022 16:43:03 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id f129so1863969vsc.7
 for <igt-dev@lists.freedesktop.org>; Thu, 06 Oct 2022 09:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221006000201.38707-1-jfree@freebsd.org>
 <Yz6xwoPWTfteNdLf@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Yz6xwoPWTfteNdLf@platvala-desk.ger.corp.intel.com>
From: Jake Freeland <jake@technologyfriends.net>
Date: Thu, 6 Oct 2022 11:42:51 -0500
Message-ID: <CAOgZAGY+tEv9kBcxJa=EzdXQkj_jrYVx-V0ZxAm7FCTh6mo6ag@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: multipart/alternative; boundary="000000000000034d9105ea6063f8"
Subject: Re: [igt-dev] [PATCH i-g-t] Replaced instances of mmap64() with
 drm_mmap()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--000000000000034d9105ea6063f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Petri,

Got it. I just resubmitted the mmap64() -> mmap() patch:
https://patchwork.freedesktop.org/patch/506163/

Jake Freeland

On Thu, Oct 6, 2022 at 5:45 AM Petri Latvala <petri.latvala@intel.com>
wrote:

> On Wed, Oct 05, 2022 at 07:02:01PM -0500, Jake Freeland wrote:
> > The mmap64() function exists to point 32-bit architectures to an mmap
> > interface with the capability to address a 64-bit memory address space.
> > This patch replaces all instances of mmap64() with drm_mmap() to
> > ensure that the correct mmap interface is used on varying architectures
> > and operating systems.
> >
> > Signed-off-by: Jake Freeland <jfree@freebsd.org>
> > ---
> >  include/drm-uapi/libdrm.h    | 89 ++++++++++++++++++++++++++++++++++++
> >  lib/i915/gem_mman.c          |  5 +-
> >  lib/igt_vgem.c               |  3 +-
> >  tests/i915/gem_mmap_gtt.c    | 23 +++++-----
> >  tests/i915/gem_mmap_offset.c | 13 +++---
> >  5 files changed, 113 insertions(+), 20 deletions(-)
> >  create mode 100644 include/drm-uapi/libdrm.h
>
> Ah yeah, that's one snag with just using drm_mmap. The function is
> private.
>
> We can't copy it to include/drm-uapi/, as it is not kernel uapi. And
> definitely not with a misleading name.
>
> Let's go with the original patch that changes mmap64 to mmap. If bug
> reports arise that someone's distro doesn't default to
> _FILE_OFFSET_BITS=3D64 on 32bit platforms, we can tune the build system
> then.
>
>
> --
> Petri Latvala
>
>
> >
> > diff --git a/include/drm-uapi/libdrm.h b/include/drm-uapi/libdrm.h
> > new file mode 100644
> > index 00000000..acfada5c
> > --- /dev/null
> > +++ b/include/drm-uapi/libdrm.h
> > @@ -0,0 +1,89 @@
> > +/*
> > + * Copyright =C2=A9 2014 NVIDIA Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a
> > + * copy of this software and associated documentation files (the
> "Software"),
> > + * to deal in the Software without restriction, including without
> limitation
> > + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions=
:
> > + *
> > + * The above copyright notice and this permission notice shall be
> included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
> SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
> DAMAGES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#ifndef LIBDRM_LIBDRM_H
> > +#define LIBDRM_LIBDRM_H
> > +
> > +#if defined(HAVE_VISIBILITY)
> > +#  define drm_private __attribute__((visibility("hidden")))
> > +#  define drm_public __attribute__((visibility("default")))
> > +#else
> > +#  define drm_private
> > +#  define drm_public
> > +#endif
> > +
> > +
> > +/**
> > + * Static (compile-time) assertion.
> > + * Basically, use COND to dimension an array.  If COND is false/zero t=
he
> > + * array size will be -1 and we'll get a compilation error.
> > + */
> > +#define STATIC_ASSERT(COND) \
> > +   do { \
> > +      (void) sizeof(char [1 - 2*!(COND)]); \
> > +   } while (0)
> > +
> > +
> > +#include <sys/mman.h>
> > +
> > +#if defined(ANDROID)
> > +#include <errno.h> /* for EINVAL */
> > +
> > +extern void *__mmap2(void *, size_t, int, int, int, size_t);
> > +
> > +static inline void *drm_mmap(void *addr, size_t length, int prot, int
> flags,
> > +                             int fd, loff_t offset)
> > +{
> > +   /* offset must be aligned to 4096 (not necessarily the page size) *=
/
> > +   if (offset & 4095) {
> > +      errno =3D EINVAL;
> > +      return MAP_FAILED;
> > +   }
> > +
> > +   return __mmap2(addr, length, prot, flags, fd, (size_t) (offset >>
> 12));
> > +}
> > +
> > +#  define drm_munmap(addr, length) \
> > +              munmap(addr, length)
> > +
> > +
> > +#else
> > +
> > +/* assume large file support exists */
> > +#  define drm_mmap(addr, length, prot, flags, fd, offset) \
> > +              mmap(addr, length, prot, flags, fd, offset)
> > +
> > +
> > +static inline int drm_munmap(void *addr, size_t length)
> > +{
> > +   /* Copied from configure code generated by AC_SYS_LARGEFILE */
> > +#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + \
> > +                     (((off_t) 1 << 31) << 31))
> > +   STATIC_ASSERT(LARGE_OFF_T % 2147483629 =3D=3D 721 &&
> > +                 LARGE_OFF_T % 2147483647 =3D=3D 1);
> > +#undef LARGE_OFF_T
> > +
> > +   return munmap(addr, length);
> > +}
> > +#endif
> > +
> > +#endif
> > diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
> > index aa9ac6f3..4734f2af 100644
> > --- a/lib/i915/gem_mman.c
> > +++ b/lib/i915/gem_mman.c
> > @@ -31,6 +31,7 @@
> >  #include "igt_device.h"
> >  #include "ioctl_wrappers.h"
> >  #include "intel_chipset.h"
> > +#include "libdrm.h"
> >
> >  #include "gem_create.h"
> >  #include "gem_mman.h"
> > @@ -118,7 +119,7 @@ void *__gem_mmap__gtt(int fd, uint32_t handle,
> uint64_t size, unsigned prot)
> >       if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg))
> >               return NULL;
> >
> > -     ptr =3D mmap64(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
> > +     ptr =3D drm_mmap(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
> >       if (ptr =3D=3D MAP_FAILED)
> >               ptr =3D NULL;
> >       else
> > @@ -331,7 +332,7 @@ void *__gem_mmap_offset(int fd, uint32_t handle,
> uint64_t offset, uint64_t size,
> >       if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET, &arg))
> >               return NULL;
> >
> > -     ptr =3D mmap64(0, size, prot, MAP_SHARED, fd, arg.offset + offset=
);
> > +     ptr =3D drm_mmap(0, size, prot, MAP_SHARED, fd, arg.offset + offs=
et);
> >
> >       if (ptr =3D=3D MAP_FAILED)
> >               ptr =3D NULL;
> > diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c
> > index 7f933b23..a35b3cd3 100644
> > --- a/lib/igt_vgem.c
> > +++ b/lib/igt_vgem.c
> > @@ -29,6 +29,7 @@
> >  #include "igt_vgem.h"
> >  #include "igt_core.h"
> >  #include "ioctl_wrappers.h"
> > +#include "libdrm.h"
> >
> >  /**
> >   * SECTION:igt_vgem
> > @@ -76,7 +77,7 @@ void *__vgem_mmap(int fd, struct vgem_bo *bo, unsigne=
d
> prot)
> >       if (drmIoctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &arg))
> >               return NULL;
> >
> > -     ptr =3D mmap64(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
> > +     ptr =3D drm_mmap(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
> >       if (ptr =3D=3D MAP_FAILED)
> >               return NULL;
> >
> > diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> > index e39b9047..643f2f30 100644
> > --- a/tests/i915/gem_mmap_gtt.c
> > +++ b/tests/i915/gem_mmap_gtt.c
> > @@ -46,6 +46,7 @@
> >  #include "igt.h"
> >  #include "igt_sysfs.h"
> >  #include "igt_x86.h"
> > +#include "libdrm.h"
> >  #include "sw_sync.h"
> >
> >  #ifndef PAGE_SIZE
> > @@ -113,11 +114,11 @@ test_access(int fd)
> >       mmap_arg.handle =3D handle;
> >       do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg);
> >
> > -     igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > +     igt_assert(drm_mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> >                         MAP_SHARED, fd, mmap_arg.offset));
> >
> >       /* Check that the same offset on the other fd doesn't work. */
> > -     igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > +     igt_assert(drm_mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> >                         MAP_SHARED, fd2, mmap_arg.offset) =3D=3D MAP_FA=
ILED);
> >       igt_assert(errno =3D=3D EACCES);
> >
> > @@ -128,7 +129,7 @@ test_access(int fd)
> >
> >       /* Recheck that it works after flink. */
> >       /* Check that the same offset on the other fd doesn't work. */
> > -     igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > +     igt_assert(drm_mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> >                         MAP_SHARED, fd2, mmap_arg.offset));
> >  }
> >
> > @@ -159,11 +160,11 @@ test_short(int fd)
> >       for (pages =3D 1; pages <=3D OBJECT_SIZE / PAGE_SIZE; pages <<=3D=
 1) {
> >               uint8_t *r, *w;
> >
> > -             w =3D mmap64(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE=
,
> > +             w =3D drm_mmap(0, pages * PAGE_SIZE, PROT_READ | PROT_WRI=
TE,
> >                          MAP_SHARED, fd, mmap_arg.offset);
> >               igt_assert(w !=3D MAP_FAILED);
> >
> > -             r =3D mmap64(0, pages * PAGE_SIZE, PROT_READ,
> > +             r =3D drm_mmap(0, pages * PAGE_SIZE, PROT_READ,
> >                          MAP_SHARED, fd, mmap_arg.offset);
> >               igt_assert(r !=3D MAP_FAILED);
> >
> > @@ -384,13 +385,13 @@ test_isolation(int i915)
> >
> >       close(B);
> >
> > -     ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > +     ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> >       igt_assert(ptr !=3D MAP_FAILED);
> >       munmap(ptr, 4096);
> >
> >       close(A);
> >
> > -     ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > +     ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> >       igt_assert(ptr =3D=3D MAP_FAILED);
> >  }
> >
> > @@ -400,7 +401,7 @@ test_close_race(int i915)
> >       const int ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> >       _Atomic uint32_t *handles;
> >
> > -     handles =3D mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1=
,
> 0);
> > +     handles =3D drm_mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, =
-1,
> 0);
> >       igt_assert(handles !=3D MAP_FAILED);
> >
> >       igt_fork(child, ncpus + 1) {
> > @@ -418,7 +419,7 @@ test_close_race(int i915)
> >                                 &mmap_arg) !=3D -1) {
> >                               void *ptr;
> >
> > -                             ptr =3D mmap64(0, 4096,
> > +                             ptr =3D drm_mmap(0, 4096,
> >                                            PROT_WRITE, MAP_SHARED, i915=
,
> >                                            mmap_arg.offset);
> >                               if (ptr !=3D MAP_FAILED) {
> > @@ -444,7 +445,7 @@ test_flink_race(int i915)
> >       const int ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> >       _Atomic uint32_t *handles;
> >
> > -     handles =3D mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1=
,
> 0);
> > +     handles =3D drm_mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, =
-1,
> 0);
> >       igt_assert(handles !=3D MAP_FAILED);
> >
> >       igt_fork(child, ncpus + 1) {
> > @@ -469,7 +470,7 @@ test_flink_race(int i915)
> >                                 &mmap_arg) !=3D -1) {
> >                               void *ptr;
> >
> > -                             ptr =3D mmap64(0, 4096,
> > +                             ptr =3D drm_mmap(0, 4096,
> >                                            PROT_WRITE, MAP_SHARED, fd,
> >                                            mmap_arg.offset);
> >                               if (ptr !=3D MAP_FAILED) {
> > diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.=
c
> > index 2b416edd..0a6d41aa 100644
> > --- a/tests/i915/gem_mmap_offset.c
> > +++ b/tests/i915/gem_mmap_offset.c
> > @@ -38,6 +38,7 @@
> >  #include "i915/intel_memory_region.h"
> >  #include "igt.h"
> >  #include "igt_x86.h"
> > +#include "libdrm.h"
> >
> >  IGT_TEST_DESCRIPTION("Basic MMAP_OFFSET IOCTL tests for mem regions\n"=
);
> >
> > @@ -67,7 +68,7 @@ __mmap_offset(int i915, uint32_t handle, uint64_t
> offset, uint64_t size,
> >       if (mmap_offset_ioctl(i915, &arg))
> >               return NULL;
> >
> > -     ptr =3D mmap64(0, size, prot, MAP_SHARED, i915, arg.offset + offs=
et);
> > +     ptr =3D drm_mmap(0, size, prot, MAP_SHARED, i915, arg.offset +
> offset);
> >       if (ptr =3D=3D MAP_FAILED)
> >               ptr =3D NULL;
> >       else
> > @@ -321,12 +322,12 @@ static void isolation(int i915)
> >                                t->name, B, b, offset_b);
> >
> >                       errno =3D 0;
> > -                     ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, i9=
15,
> offset_a);
> > +                     ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED,
> i915, offset_a);
> >                       igt_assert(ptr =3D=3D MAP_FAILED);
> >                       igt_assert_eq(errno, EACCES);
> >
> >                       errno =3D 0;
> > -                     ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, i9=
15,
> offset_b);
> > +                     ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED,
> i915, offset_b);
> >                       igt_assert(ptr =3D=3D MAP_FAILED);
> >                       igt_assert_eq(errno, EACCES);
> >
> > @@ -344,13 +345,13 @@ static void isolation(int i915)
> >
> >                       close(B);
> >
> > -                     ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A,
> offset_a);
> > +                     ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED, =
A,
> offset_a);
> >                       igt_assert(ptr !=3D MAP_FAILED);
> >                       munmap(ptr, 4096);
> >
> >                       close(A);
> >
> > -                     ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A,
> offset_a);
> > +                     ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED, =
A,
> offset_a);
> >                       igt_assert(ptr =3D=3D MAP_FAILED);
> >               }
> >       }
> > @@ -553,7 +554,7 @@ static void close_race(int i915, int timeout)
> >       _Atomic uint32_t *handles;
> >       size_t len =3D ALIGN((ncpus + 1) * sizeof(uint32_t), 4096);
> >
> > -     handles =3D mmap64(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1,=
 0);
> > +     handles =3D drm_mmap(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -=
1,
> 0);
> >       igt_assert(handles !=3D MAP_FAILED);
> >
> >       igt_fork(child, ncpus + 1) {
> > --
> > 2.37.0 (Apple Git-136)
> >
>

--000000000000034d9105ea6063f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Petri,<div><br></div><div>Got it. I just resubmitted the m=
map64() -&gt; mmap() patch:</div><div><a href=3D"https://patchwork.freedesk=
top.org/patch/506163/">https://patchwork.freedesktop.org/patch/506163/</a><=
br></div><div><br></div><div>Jake Freeland</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022 at 5:45=
 AM Petri Latvala &lt;<a href=3D"mailto:petri.latvala@intel.com">petri.latv=
ala@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Wed, Oct 05, 2022 at 07:02:01PM -0500, Jake Freeland wrote:=
<br>
&gt; The mmap64() function exists to point 32-bit architectures to an mmap<=
br>
&gt; interface with the capability to address a 64-bit memory address space=
.<br>
&gt; This patch replaces all instances of mmap64() with drm_mmap() to<br>
&gt; ensure that the correct mmap interface is used on varying architecture=
s<br>
&gt; and operating systems.<br>
&gt; <br>
&gt; Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfree@freebsd.org" =
target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/drm-uapi/libdrm.h=C2=A0 =C2=A0 | 89 ++++++++++++++++++++=
++++++++++++++++<br>
&gt;=C2=A0 lib/i915/gem_mman.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 =
+-<br>
&gt;=C2=A0 lib/igt_vgem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 tests/i915/gem_mmap_gtt.c=C2=A0 =C2=A0 | 23 +++++-----<br>
&gt;=C2=A0 tests/i915/gem_mmap_offset.c | 13 +++---<br>
&gt;=C2=A0 5 files changed, 113 insertions(+), 20 deletions(-)<br>
&gt;=C2=A0 create mode 100644 include/drm-uapi/libdrm.h<br>
<br>
Ah yeah, that&#39;s one snag with just using drm_mmap. The function is<br>
private.<br>
<br>
We can&#39;t copy it to include/drm-uapi/, as it is not kernel uapi. And<br=
>
definitely not with a misleading name.<br>
<br>
Let&#39;s go with the original patch that changes mmap64 to mmap. If bug<br=
>
reports arise that someone&#39;s distro doesn&#39;t default to<br>
_FILE_OFFSET_BITS=3D64 on 32bit platforms, we can tune the build system<br>
then.<br>
<br>
<br>
-- <br>
Petri Latvala<br>
<br>
<br>
&gt; <br>
&gt; diff --git a/include/drm-uapi/libdrm.h b/include/drm-uapi/libdrm.h<br>
&gt; new file mode 100644<br>
&gt; index 00000000..acfada5c<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/drm-uapi/libdrm.h<br>
&gt; @@ -0,0 +1,89 @@<br>
&gt; +/*<br>
&gt; + * Copyright =C2=A9 2014 NVIDIA Corporation<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
&gt; + * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&gt; + * to deal in the Software without restriction, including without lim=
itation<br>
&gt; + * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&gt; + * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&gt; + * Software is furnished to do so, subject to the following condition=
s:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.=C2=A0 IN NO =
EVENT SHALL<br>
&gt; + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMA=
GES OR<br>
&gt; + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,<br>
&gt; + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR<br>
&gt; + * OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef LIBDRM_LIBDRM_H<br>
&gt; +#define LIBDRM_LIBDRM_H<br>
&gt; +<br>
&gt; +#if defined(HAVE_VISIBILITY)<br>
&gt; +#=C2=A0 define drm_private __attribute__((visibility(&quot;hidden&quo=
t;)))<br>
&gt; +#=C2=A0 define drm_public __attribute__((visibility(&quot;default&quo=
t;)))<br>
&gt; +#else<br>
&gt; +#=C2=A0 define drm_private<br>
&gt; +#=C2=A0 define drm_public<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Static (compile-time) assertion.<br>
&gt; + * Basically, use COND to dimension an array.=C2=A0 If COND is false/=
zero the<br>
&gt; + * array size will be -1 and we&#39;ll get a compilation error.<br>
&gt; + */<br>
&gt; +#define STATIC_ASSERT(COND) \<br>
&gt; +=C2=A0 =C2=A0do { \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 (void) sizeof(char [1 - 2*!(COND)]); \<br>
&gt; +=C2=A0 =C2=A0} while (0)<br>
&gt; +<br>
&gt; +<br>
&gt; +#include &lt;sys/mman.h&gt;<br>
&gt; +<br>
&gt; +#if defined(ANDROID)<br>
&gt; +#include &lt;errno.h&gt; /* for EINVAL */<br>
&gt; +<br>
&gt; +extern void *__mmap2(void *, size_t, int, int, int, size_t);<br>
&gt; +<br>
&gt; +static inline void *drm_mmap(void *addr, size_t length, int prot, int=
 flags,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, loff_t offset)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0/* offset must be aligned to 4096 (not necessarily the p=
age size) */<br>
&gt; +=C2=A0 =C2=A0if (offset &amp; 4095) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 errno =3D EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 return MAP_FAILED;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0return __mmap2(addr, length, prot, flags, fd, (size_t) (=
offset &gt;&gt; 12));<br>
&gt; +}<br>
&gt; +<br>
&gt; +#=C2=A0 define drm_munmap(addr, length) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 munmap(addr, length)=
<br>
&gt; +<br>
&gt; +<br>
&gt; +#else<br>
&gt; +<br>
&gt; +/* assume large file support exists */<br>
&gt; +#=C2=A0 define drm_mmap(addr, length, prot, flags, fd, offset) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap(addr, length, p=
rot, flags, fd, offset)<br>
&gt; +<br>
&gt; +<br>
&gt; +static inline int drm_munmap(void *addr, size_t length)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0/* Copied from configure code generated by AC_SYS_LARGEF=
ILE */<br>
&gt; +#define LARGE_OFF_T ((((off_t) 1 &lt;&lt; 31) &lt;&lt; 31) - 1 + \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(((off_t) 1 &lt;&lt; 31) &lt;&lt; 31))<br>
&gt; +=C2=A0 =C2=A0STATIC_ASSERT(LARGE_OFF_T % 2147483629 =3D=3D 721 &amp;&=
amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LARGE_O=
FF_T % 2147483647 =3D=3D 1);<br>
&gt; +#undef LARGE_OFF_T<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0return munmap(addr, length);<br>
&gt; +}<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c<br>
&gt; index aa9ac6f3..4734f2af 100644<br>
&gt; --- a/lib/i915/gem_mman.c<br>
&gt; +++ b/lib/i915/gem_mman.c<br>
&gt; @@ -31,6 +31,7 @@<br>
&gt;=C2=A0 #include &quot;igt_device.h&quot;<br>
&gt;=C2=A0 #include &quot;ioctl_wrappers.h&quot;<br>
&gt;=C2=A0 #include &quot;intel_chipset.h&quot;<br>
&gt; +#include &quot;libdrm.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;gem_create.h&quot;<br>
&gt;=C2=A0 #include &quot;gem_mman.h&quot;<br>
&gt; @@ -118,7 +119,7 @@ void *__gem_mmap__gtt(int fd, uint32_t handle, uin=
t64_t size, unsigned prot)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GT=
T, &amp;mmap_arg))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, size, prot, MAP_SHARED, fd, mma=
p_arg.offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ptr =3D drm_mmap(0, size, prot, MAP_SHARED, fd, m=
map_arg.offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D NULL;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; @@ -331,7 +332,7 @@ void *__gem_mmap_offset(int fd, uint32_t handle, u=
int64_t offset, uint64_t size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OF=
FSET, &amp;arg))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, size, prot, MAP_SHARED, fd, arg=
.offset + offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ptr =3D drm_mmap(0, size, prot, MAP_SHARED, fd, a=
rg.offset + offset);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D NULL;<br=
>
&gt; diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c<br>
&gt; index 7f933b23..a35b3cd3 100644<br>
&gt; --- a/lib/igt_vgem.c<br>
&gt; +++ b/lib/igt_vgem.c<br>
&gt; @@ -29,6 +29,7 @@<br>
&gt;=C2=A0 #include &quot;igt_vgem.h&quot;<br>
&gt;=C2=A0 #include &quot;igt_core.h&quot;<br>
&gt;=C2=A0 #include &quot;ioctl_wrappers.h&quot;<br>
&gt; +#include &quot;libdrm.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* SECTION:igt_vgem<br>
&gt; @@ -76,7 +77,7 @@ void *__vgem_mmap(int fd, struct vgem_bo *bo, unsign=
ed prot)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drmIoctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &a=
mp;arg))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, bo-&gt;size, prot, MAP_SHARED, =
fd, arg.offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ptr =3D drm_mmap(0, bo-&gt;size, prot, MAP_SHARED=
, fd, arg.offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c<br>
&gt; index e39b9047..643f2f30 100644<br>
&gt; --- a/tests/i915/gem_mmap_gtt.c<br>
&gt; +++ b/tests/i915/gem_mmap_gtt.c<br>
&gt; @@ -46,6 +46,7 @@<br>
&gt;=C2=A0 #include &quot;igt.h&quot;<br>
&gt;=C2=A0 #include &quot;igt_sysfs.h&quot;<br>
&gt;=C2=A0 #include &quot;igt_x86.h&quot;<br>
&gt; +#include &quot;libdrm.h&quot;<br>
&gt;=C2=A0 #include &quot;sw_sync.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #ifndef PAGE_SIZE<br>
&gt; @@ -113,11 +114,11 @@ test_access(int fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mmap_arg.handle =3D handle;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &a=
mp;mmap_arg);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PRO=
T_WRITE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_assert(drm_mmap(0, OBJECT_SIZE, PROT_READ | P=
ROT_WRITE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0MAP_SHARED, fd, mmap_arg.offset));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that the same offset on the other f=
d doesn&#39;t work. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PRO=
T_WRITE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_assert(drm_mmap(0, OBJECT_SIZE, PROT_READ | P=
ROT_WRITE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0MAP_SHARED, fd2, mmap_arg.offset) =3D=3D MAP_FAILED);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(errno =3D=3D EACCES);<br>
&gt;=C2=A0 <br>
&gt; @@ -128,7 +129,7 @@ test_access(int fd)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Recheck that it works after flink. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that the same offset on the other f=
d doesn&#39;t work. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PRO=
T_WRITE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0igt_assert(drm_mmap(0, OBJECT_SIZE, PROT_READ | P=
ROT_WRITE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0MAP_SHARED, fd2, mmap_arg.offset));<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -159,11 +160,11 @@ test_short(int fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (pages =3D 1; pages &lt;=3D OBJECT_SIZE =
/ PAGE_SIZE; pages &lt;&lt;=3D 1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *r, *w;<=
br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w =3D mmap64(0, pages=
 * PAGE_SIZE, PROT_READ | PROT_WRITE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w =3D drm_mmap(0, pag=
es * PAGE_SIZE, PROT_READ | PROT_WRITE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 MAP_SHARED, fd, mmap_arg.offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(w !=
=3D MAP_FAILED);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D mmap64(0, pages=
 * PAGE_SIZE, PROT_READ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D drm_mmap(0, pag=
es * PAGE_SIZE, PROT_READ,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 MAP_SHARED, fd, mmap_arg.offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(r !=
=3D MAP_FAILED);<br>
&gt;=C2=A0 <br>
&gt; @@ -384,13 +385,13 @@ test_isolation(int i915)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0close(B);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A,=
 offset_a);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED, =
A, offset_a);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(ptr !=3D MAP_FAILED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(ptr, 4096);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0close(A);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A,=
 offset_a);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED, =
A, offset_a);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(ptr =3D=3D MAP_FAILED);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -400,7 +401,7 @@ test_close_race(int i915)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const int ncpus =3D sysconf(_SC_NPROCESSORS_=
ONLN);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *handles;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0handles =3D mmap64(0, 4096, PROT_WRITE, MAP_SHARE=
D | MAP_ANON, -1, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0handles =3D drm_mmap(0, 4096, PROT_WRITE, MAP_SHA=
RED | MAP_ANON, -1, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(handles !=3D MAP_FAILED);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus + 1) {<br>
&gt; @@ -418,7 +419,7 @@ test_close_race(int i915)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mmap_arg) !=3D -1) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *ptr;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D drm_mmap(0, 4096,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 PROT_WRITE, MAP_SHARED, i915,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mmap_arg.offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr !=3D MAP_FAILED) {<br>
&gt; @@ -444,7 +445,7 @@ test_flink_race(int i915)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const int ncpus =3D sysconf(_SC_NPROCESSORS_=
ONLN);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *handles;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0handles =3D mmap64(0, 4096, PROT_WRITE, MAP_SHARE=
D | MAP_ANON, -1, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0handles =3D drm_mmap(0, 4096, PROT_WRITE, MAP_SHA=
RED | MAP_ANON, -1, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(handles !=3D MAP_FAILED);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus + 1) {<br>
&gt; @@ -469,7 +470,7 @@ test_flink_race(int i915)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mmap_arg) !=3D -1) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *ptr;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D drm_mmap(0, 4096,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 PROT_WRITE, MAP_SHARED, fd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mmap_arg.offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr !=3D MAP_FAILED) {<br>
&gt; diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset=
.c<br>
&gt; index 2b416edd..0a6d41aa 100644<br>
&gt; --- a/tests/i915/gem_mmap_offset.c<br>
&gt; +++ b/tests/i915/gem_mmap_offset.c<br>
&gt; @@ -38,6 +38,7 @@<br>
&gt;=C2=A0 #include &quot;i915/intel_memory_region.h&quot;<br>
&gt;=C2=A0 #include &quot;igt.h&quot;<br>
&gt;=C2=A0 #include &quot;igt_x86.h&quot;<br>
&gt; +#include &quot;libdrm.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 IGT_TEST_DESCRIPTION(&quot;Basic MMAP_OFFSET IOCTL tests for mem=
 regions\n&quot;);<br>
&gt;=C2=A0 <br>
&gt; @@ -67,7 +68,7 @@ __mmap_offset(int i915, uint32_t handle, uint64_t of=
fset, uint64_t size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mmap_offset_ioctl(i915, &amp;arg))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, size, prot, MAP_SHARED, i915, a=
rg.offset + offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ptr =3D drm_mmap(0, size, prot, MAP_SHARED, i915,=
 arg.offset + offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D NULL;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; @@ -321,12 +322,12 @@ static void isolation(int i915)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;name, B, b, offset_b);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0errno =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0igt_assert(ptr =3D=3D MAP_FAILED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0igt_assert_eq(errno, EACCES);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0errno =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0igt_assert(ptr =3D=3D MAP_FAILED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0igt_assert_eq(errno, EACCES);<br>
&gt;=C2=A0 <br>
&gt; @@ -344,13 +345,13 @@ static void isolation(int i915)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0close(B);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0igt_assert(ptr !=3D MAP_FAILED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0munmap(ptr, 4096);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0close(A);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ptr =3D drm_mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0igt_assert(ptr =3D=3D MAP_FAILED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -553,7 +554,7 @@ static void close_race(int i915, int timeout)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *handles;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len =3D ALIGN((ncpus + 1) * sizeof(ui=
nt32_t), 4096);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0handles =3D mmap64(0, len, PROT_WRITE, MAP_SHARED=
 | MAP_ANON, -1, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0handles =3D drm_mmap(0, len, PROT_WRITE, MAP_SHAR=
ED | MAP_ANON, -1, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(handles !=3D MAP_FAILED);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus + 1) {<br>
&gt; -- <br>
&gt; 2.37.0 (Apple Git-136)<br>
&gt; <br>
</blockquote></div>

--000000000000034d9105ea6063f8--
