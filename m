Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80FC10E07B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 15:19:16 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id j7so12985812vsr.13
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 08:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220918221535.3276922-1-jfree@freebsd.org>
 <YzQ/CnZyoBpgIfYM@kamilkon-desk1>
 <YzRBxjWDvvfTq3Yd@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YzRBxjWDvvfTq3Yd@platvala-desk.ger.corp.intel.com>
From: Jake Freeland <jake@technologyfriends.net>
Date: Wed, 28 Sep 2022 10:19:04 -0500
Message-ID: <CAOgZAGZjV=Eg+DJSpes2PpMKEZPFKF6CbuDZ5-9=tY5gmuQv+A@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: multipart/alternative; boundary="000000000000a0de3a05e9be4867"
Subject: Re: [igt-dev] [PATCH i-g-t] Replaced instances of mmap64() with
 mmap()
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

--000000000000a0de3a05e9be4867
Content-Type: text/plain; charset="UTF-8"

I cannot find any relevant documentation for both Linux and FreeBSD
that mentions an mmap flag that supports large file allocation on
32-bit architectures.

Commit message:
The mmap64() function exists to point 32-bit architectures to an mmap
interface with the capability to address a 64-bit memory address space.
As 32-bit machines are replaced by 64-bit, there is no longer a need to
keep mmap64() around. This is especially apparent in operating systems
like FreeBSD that exclude the mmap64() function altogether. This patch
replaces all instances of mmap64() with mmap().

Jake Freeland

On Wed, Sep 28, 2022 at 7:45 AM Petri Latvala <petri.latvala@intel.com>
wrote:

> On Wed, Sep 28, 2022 at 02:33:14PM +0200, Kamil Konieczny wrote:
> > Hi Jake,
> >
> > this patch is missing commit message. Please put here short
> > description of change and why you do it. Change looks resonable
> > as on 64-bit systems both functions are the same.
> >
> > On 2022-09-18 at 17:15:35 -0500, Jake Freeland wrote:
> > > Signed-off-by: Jake Freeland <jfree@freebsd.org>
> >
> > Adding Petri on cc as I do not know if anyone compiles this on
> > 32-bit platforms.
>
> Aren't you supposed to use mmap() with _LARGEFILE_something even on
> 32-bit builds, instead of mmap64?
>
>
> --
> Petri Latvala
>
>
>
> >
> > Regards,
> > Kamil
> >
> > > ---
> > >  lib/i915/gem_mman.c          |  4 ++--
> > >  lib/igt_vgem.c               |  2 +-
> > >  tests/i915/gem_mmap_gtt.c    | 22 +++++++++++-----------
> > >  tests/i915/gem_mmap_offset.c | 14 +++++++-------
> > >  4 files changed, 21 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
> > > index aa9ac6f3..0b41ba70 100644
> > > --- a/lib/i915/gem_mman.c
> > > +++ b/lib/i915/gem_mman.c
> > > @@ -118,7 +118,7 @@ void *__gem_mmap__gtt(int fd, uint32_t handle,
> uint64_t size, unsigned prot)
> > >     if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg))
> > >             return NULL;
> > >
> > > -   ptr = mmap64(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
> > > +   ptr = mmap(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
> > >     if (ptr == MAP_FAILED)
> > >             ptr = NULL;
> > >     else
> > > @@ -331,7 +331,7 @@ void *__gem_mmap_offset(int fd, uint32_t handle,
> uint64_t offset, uint64_t size,
> > >     if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET, &arg))
> > >             return NULL;
> > >
> > > -   ptr = mmap64(0, size, prot, MAP_SHARED, fd, arg.offset + offset);
> > > +   ptr = mmap(0, size, prot, MAP_SHARED, fd, arg.offset + offset);
> > >
> > >     if (ptr == MAP_FAILED)
> > >             ptr = NULL;
> > > diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c
> > > index 7f933b23..468383c7 100644
> > > --- a/lib/igt_vgem.c
> > > +++ b/lib/igt_vgem.c
> > > @@ -76,7 +76,7 @@ void *__vgem_mmap(int fd, struct vgem_bo *bo,
> unsigned prot)
> > >     if (drmIoctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &arg))
> > >             return NULL;
> > >
> > > -   ptr = mmap64(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
> > > +   ptr = mmap(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
> > >     if (ptr == MAP_FAILED)
> > >             return NULL;
> > >
> > > diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> > > index 4f05eb18..683eaf16 100644
> > > --- a/tests/i915/gem_mmap_gtt.c
> > > +++ b/tests/i915/gem_mmap_gtt.c
> > > @@ -113,11 +113,11 @@ test_access(int fd)
> > >     mmap_arg.handle = handle;
> > >     do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg);
> > >
> > > -   igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > +   igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > >                       MAP_SHARED, fd, mmap_arg.offset));
> > >
> > >     /* Check that the same offset on the other fd doesn't work. */
> > > -   igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > +   igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > >                       MAP_SHARED, fd2, mmap_arg.offset) == MAP_FAILED);
> > >     igt_assert(errno == EACCES);
> > >
> > > @@ -128,7 +128,7 @@ test_access(int fd)
> > >
> > >     /* Recheck that it works after flink. */
> > >     /* Check that the same offset on the other fd doesn't work. */
> > > -   igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > +   igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > >                       MAP_SHARED, fd2, mmap_arg.offset));
> > >  }
> > >
> > > @@ -159,11 +159,11 @@ test_short(int fd)
> > >     for (pages = 1; pages <= OBJECT_SIZE / PAGE_SIZE; pages <<= 1) {
> > >             uint8_t *r, *w;
> > >
> > > -           w = mmap64(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,
> > > +           w = mmap(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,
> > >                        MAP_SHARED, fd, mmap_arg.offset);
> > >             igt_assert(w != MAP_FAILED);
> > >
> > > -           r = mmap64(0, pages * PAGE_SIZE, PROT_READ,
> > > +           r = mmap(0, pages * PAGE_SIZE, PROT_READ,
> > >                        MAP_SHARED, fd, mmap_arg.offset);
> > >             igt_assert(r != MAP_FAILED);
> > >
> > > @@ -384,13 +384,13 @@ test_isolation(int i915)
> > >
> > >     close(B);
> > >
> > > -   ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > +   ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > >     igt_assert(ptr != MAP_FAILED);
> > >     munmap(ptr, 4096);
> > >
> > >     close(A);
> > >
> > > -   ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > +   ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > >     igt_assert(ptr == MAP_FAILED);
> > >  }
> > >
> > > @@ -400,7 +400,7 @@ test_close_race(int i915)
> > >     const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> > >     _Atomic uint32_t *handles;
> > >
> > > -   handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1,
> 0);
> > > +   handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > >     igt_assert(handles != MAP_FAILED);
> > >
> > >     igt_fork(child, ncpus + 1) {
> > > @@ -418,7 +418,7 @@ test_close_race(int i915)
> > >                               &mmap_arg) != -1) {
> > >                             void *ptr;
> > >
> > > -                           ptr = mmap64(0, 4096,
> > > +                           ptr = mmap(0, 4096,
> > >                                          PROT_WRITE, MAP_SHARED, i915,
> > >                                          mmap_arg.offset);
> > >                             if (ptr != MAP_FAILED) {
> > > @@ -444,7 +444,7 @@ test_flink_race(int i915)
> > >     const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> > >     _Atomic uint32_t *handles;
> > >
> > > -   handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1,
> 0);
> > > +   handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > >     igt_assert(handles != MAP_FAILED);
> > >
> > >     igt_fork(child, ncpus + 1) {
> > > @@ -469,7 +469,7 @@ test_flink_race(int i915)
> > >                               &mmap_arg) != -1) {
> > >                             void *ptr;
> > >
> > > -                           ptr = mmap64(0, 4096,
> > > +                           ptr = mmap(0, 4096,
> > >                                          PROT_WRITE, MAP_SHARED, fd,
> > >                                          mmap_arg.offset);
> > >                             if (ptr != MAP_FAILED) {
> > > diff --git a/tests/i915/gem_mmap_offset.c
> b/tests/i915/gem_mmap_offset.c
> > > index 5781b2fb..0933ed94 100644
> > > --- a/tests/i915/gem_mmap_offset.c
> > > +++ b/tests/i915/gem_mmap_offset.c
> > > @@ -66,7 +66,7 @@ __mmap_offset(int i915, uint32_t handle, uint64_t
> offset, uint64_t size,
> > >     if (mmap_offset_ioctl(i915, &arg))
> > >             return NULL;
> > >
> > > -   ptr = mmap64(0, size, prot, MAP_SHARED, i915, arg.offset + offset);
> > > +   ptr = mmap(0, size, prot, MAP_SHARED, i915, arg.offset + offset);
> > >     if (ptr == MAP_FAILED)
> > >             ptr = NULL;
> > >     else
> > > @@ -214,12 +214,12 @@ static void isolation(int i915)
> > >                      t->name, B, b, offset_b);
> > >
> > >             errno = 0;
> > > -           ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915,
> offset_a);
> > > +           ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);
> > >             igt_assert(ptr == MAP_FAILED);
> > >             igt_assert_eq(errno, EACCES);
> > >
> > >             errno = 0;
> > > -           ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915,
> offset_b);
> > > +           ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);
> > >             igt_assert(ptr == MAP_FAILED);
> > >             igt_assert_eq(errno, EACCES);
> > >
> > > @@ -237,13 +237,13 @@ static void isolation(int i915)
> > >
> > >             close(B);
> > >
> > > -           ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > +           ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > >             igt_assert(ptr != MAP_FAILED);
> > >             munmap(ptr, 4096);
> > >
> > >             close(A);
> > >
> > > -           ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > +           ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > >             igt_assert(ptr == MAP_FAILED);
> > >     }
> > >  }
> > > @@ -401,7 +401,7 @@ static void close_race(int i915, int timeout)
> > >     _Atomic uint32_t *handles;
> > >     size_t len = ALIGN((ncpus + 1) * sizeof(uint32_t), 4096);
> > >
> > > -   handles = mmap64(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > > +   handles = mmap(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > >     igt_assert(handles != MAP_FAILED);
> > >
> > >     igt_fork(child, ncpus + 1) {
> > > @@ -420,7 +420,7 @@ static void close_race(int i915, int timeout)
> > >                               &mmap_arg) != -1) {
> > >                             void *ptr;
> > >
> > > -                           ptr = mmap64(0, 4096,
> > > +                           ptr = mmap(0, 4096,
> > >                                          PROT_WRITE, MAP_SHARED, i915,
> > >                                          mmap_arg.offset);
> > >                             if (ptr != MAP_FAILED) {
> > > --
> > > 2.37.3
> > >
>

--000000000000a0de3a05e9be4867
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I cannot find any relevant documentation for both Linux an=
d FreeBSD<div>that mentions an mmap flag that supports large file allocatio=
n on</div><div>32-bit architectures.</div><div><div><br></div><div>Commit m=
essage:</div><div>The mmap64() function exists to point 32-bit architecture=
s to an mmap</div><div>interface with the capability to address a 64-bit me=
mory address space.</div><div>As 32-bit machines are replaced by 64-bit, th=
ere is no longer a need to</div><div>keep mmap64() around. This is especial=
ly apparent in operating systems</div><div>like FreeBSD that exclude the mm=
ap64() function altogether. This patch</div><div>replaces all instances of =
mmap64() with mmap().</div><div><br></div><div>Jake Freeland</div></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Sep 28, 2022 at 7:45 AM Petri Latvala &lt;<a href=3D"mailto:petri.latv=
ala@intel.com">petri.latvala@intel.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, Sep 28, 2022 at 02:33:14PM +0=
200, Kamil Konieczny wrote:<br>
&gt; Hi Jake,<br>
&gt; <br>
&gt; this patch is missing commit message. Please put here short<br>
&gt; description of change and why you do it. Change looks resonable<br>
&gt; as on 64-bit systems both functions are the same.<br>
&gt; <br>
&gt; On 2022-09-18 at 17:15:35 -0500, Jake Freeland wrote:<br>
&gt; &gt; Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfree@freebsd.=
org" target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
&gt; <br>
&gt; Adding Petri on cc as I do not know if anyone compiles this on<br>
&gt; 32-bit platforms.<br>
<br>
Aren&#39;t you supposed to use mmap() with _LARGEFILE_something even on<br>
32-bit builds, instead of mmap64?<br>
<br>
<br>
-- <br>
Petri Latvala<br>
<br>
<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Kamil<br>
&gt; <br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 lib/i915/gem_mman.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 ++--<br>
&gt; &gt;=C2=A0 lib/igt_vgem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 tests/i915/gem_mmap_gtt.c=C2=A0 =C2=A0 | 22 +++++++++++----=
-------<br>
&gt; &gt;=C2=A0 tests/i915/gem_mmap_offset.c | 14 +++++++-------<br>
&gt; &gt;=C2=A0 4 files changed, 21 insertions(+), 21 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c<br>
&gt; &gt; index aa9ac6f3..0b41ba70 100644<br>
&gt; &gt; --- a/lib/i915/gem_mman.c<br>
&gt; &gt; +++ b/lib/i915/gem_mman.c<br>
&gt; &gt; @@ -118,7 +118,7 @@ void *__gem_mmap__gtt(int fd, uint32_t handle=
, uint64_t size, unsigned prot)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT,=
 &amp;mmap_arg))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, size, prot, MAP_SHARED, fd, mmap_=
arg.offset);<br>
&gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, size, prot, MAP_SHARED, fd, mmap_ar=
g.offset);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D NULL;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; @@ -331,7 +331,7 @@ void *__gem_mmap_offset(int fd, uint32_t hand=
le, uint64_t offset, uint64_t size,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFS=
ET, &amp;arg))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, size, prot, MAP_SHARED, fd, arg.o=
ffset + offset);<br>
&gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, size, prot, MAP_SHARED, fd, arg.off=
set + offset);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D NULL;<br>
&gt; &gt; diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c<br>
&gt; &gt; index 7f933b23..468383c7 100644<br>
&gt; &gt; --- a/lib/igt_vgem.c<br>
&gt; &gt; +++ b/lib/igt_vgem.c<br>
&gt; &gt; @@ -76,7 +76,7 @@ void *__vgem_mmap(int fd, struct vgem_bo *bo, u=
nsigned prot)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (drmIoctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &amp=
;arg))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, bo-&gt;size, prot, MAP_SHARED, fd=
, arg.offset);<br>
&gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, bo-&gt;size, prot, MAP_SHARED, fd, =
arg.offset);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.=
c<br>
&gt; &gt; index 4f05eb18..683eaf16 100644<br>
&gt; &gt; --- a/tests/i915/gem_mmap_gtt.c<br>
&gt; &gt; +++ b/tests/i915/gem_mmap_gtt.c<br>
&gt; &gt; @@ -113,11 +113,11 @@ test_access(int fd)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0mmap_arg.handle =3D handle;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &amp=
;mmap_arg);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_=
WRITE,<br>
&gt; &gt; +=C2=A0 =C2=A0igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WR=
ITE,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MAP_SHARED, fd, mmap_arg.offset));<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/* Check that the same offset on the other fd =
doesn&#39;t work. */<br>
&gt; &gt; -=C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_=
WRITE,<br>
&gt; &gt; +=C2=A0 =C2=A0igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WR=
ITE,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MAP_SHARED, fd2, mmap_arg.offset) =3D=3D MAP_FAILED);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(errno =3D=3D EACCES);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; @@ -128,7 +128,7 @@ test_access(int fd)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/* Recheck that it works after flink. */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/* Check that the same offset on the other fd =
doesn&#39;t work. */<br>
&gt; &gt; -=C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_=
WRITE,<br>
&gt; &gt; +=C2=A0 =C2=A0igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WR=
ITE,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MAP_SHARED, fd2, mmap_arg.offset));<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; @@ -159,11 +159,11 @@ test_short(int fd)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0for (pages =3D 1; pages &lt;=3D OBJECT_SIZE / =
PAGE_SIZE; pages &lt;&lt;=3D 1) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *r, *w;<br=
>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w =3D mmap64(0, pages *=
 PAGE_SIZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w =3D mmap(0, pages * P=
AGE_SIZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MAP_SHARED, fd, mmap_arg.offset);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(w !=3D =
MAP_FAILED);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D mmap64(0, pages *=
 PAGE_SIZE, PROT_READ,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D mmap(0, pages * P=
AGE_SIZE, PROT_READ,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MAP_SHARED, fd, mmap_arg.offset);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(r !=3D =
MAP_FAILED);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; @@ -384,13 +384,13 @@ test_isolation(int i915)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0close(B);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A, o=
ffset_a);<br>
&gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, 4096, PROT_READ, MAP_SHARED, A, off=
set_a);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(ptr !=3D MAP_FAILED);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0munmap(ptr, 4096);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0close(A);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A, o=
ffset_a);<br>
&gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, 4096, PROT_READ, MAP_SHARED, A, off=
set_a);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(ptr =3D=3D MAP_FAILED);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; @@ -400,7 +400,7 @@ test_close_race(int i915)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0const int ncpus =3D sysconf(_SC_NPROCESSORS_ON=
LN);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *handles;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0handles =3D mmap64(0, 4096, PROT_WRITE, MAP_SHARED =
| MAP_ANON, -1, 0);<br>
&gt; &gt; +=C2=A0 =C2=A0handles =3D mmap(0, 4096, PROT_WRITE, MAP_SHARED | =
MAP_ANON, -1, 0);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(handles !=3D MAP_FAILED);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus + 1) {<br>
&gt; &gt; @@ -418,7 +418,7 @@ test_close_race(int i915)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mmap_arg) !=3D -1) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *ptr;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PROT_WRITE, MAP_SHARED, i915,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mmap_arg.offset);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr !=3D MAP_FAILED) {<br>
&gt; &gt; @@ -444,7 +444,7 @@ test_flink_race(int i915)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0const int ncpus =3D sysconf(_SC_NPROCESSORS_ON=
LN);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *handles;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0handles =3D mmap64(0, 4096, PROT_WRITE, MAP_SHARED =
| MAP_ANON, -1, 0);<br>
&gt; &gt; +=C2=A0 =C2=A0handles =3D mmap(0, 4096, PROT_WRITE, MAP_SHARED | =
MAP_ANON, -1, 0);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(handles !=3D MAP_FAILED);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus + 1) {<br>
&gt; &gt; @@ -469,7 +469,7 @@ test_flink_race(int i915)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mmap_arg) !=3D -1) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *ptr;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PROT_WRITE, MAP_SHARED, fd,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mmap_arg.offset);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr !=3D MAP_FAILED) {<br>
&gt; &gt; diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_o=
ffset.c<br>
&gt; &gt; index 5781b2fb..0933ed94 100644<br>
&gt; &gt; --- a/tests/i915/gem_mmap_offset.c<br>
&gt; &gt; +++ b/tests/i915/gem_mmap_offset.c<br>
&gt; &gt; @@ -66,7 +66,7 @@ __mmap_offset(int i915, uint32_t handle, uint64=
_t offset, uint64_t size,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (mmap_offset_ioctl(i915, &amp;arg))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, size, prot, MAP_SHARED, i915, arg=
.offset + offset);<br>
&gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, size, prot, MAP_SHARED, i915, arg.o=
ffset + offset);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D NULL;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; @@ -214,12 +214,12 @@ static void isolation(int i915)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 t-&gt;name, B, b, offset_b);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,=
 PROT_READ, MAP_SHARED, i915, offset_a);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096, P=
ROT_READ, MAP_SHARED, i915, offset_a);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(ptr =3D=
=3D MAP_FAILED);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_eq(errn=
o, EACCES);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D 0;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,=
 PROT_READ, MAP_SHARED, i915, offset_b);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096, P=
ROT_READ, MAP_SHARED, i915, offset_b);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(ptr =3D=
=3D MAP_FAILED);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert_eq(errn=
o, EACCES);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; @@ -237,13 +237,13 @@ static void isolation(int i915)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(B);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,=
 PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096, P=
ROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(ptr !=
=3D MAP_FAILED);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(ptr, 4096);=
<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(A);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,=
 PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096, P=
ROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(ptr =3D=
=3D MAP_FAILED);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; @@ -401,7 +401,7 @@ static void close_race(int i915, int timeout)=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *handles;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0size_t len =3D ALIGN((ncpus + 1) * sizeof(uint=
32_t), 4096);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0handles =3D mmap64(0, len, PROT_WRITE, MAP_SHARED |=
 MAP_ANON, -1, 0);<br>
&gt; &gt; +=C2=A0 =C2=A0handles =3D mmap(0, len, PROT_WRITE, MAP_SHARED | M=
AP_ANON, -1, 0);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(handles !=3D MAP_FAILED);<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus + 1) {<br>
&gt; &gt; @@ -420,7 +420,7 @@ static void close_race(int i915, int timeout)=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mmap_arg) !=3D -1) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *ptr;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PROT_WRITE, MAP_SHARED, i915,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mmap_arg.offset);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr !=3D MAP_FAILED) {<br>
&gt; &gt; -- <br>
&gt; &gt; 2.37.3<br>
&gt; &gt; <br>
</blockquote></div>

--000000000000a0de3a05e9be4867--
