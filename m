Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A2310E778
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 20:39:02 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id y20so6795928uao.8
 for <igt-dev@lists.freedesktop.org>; Wed, 05 Oct 2022 13:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220918221535.3276922-1-jfree@freebsd.org>
 <YzQ/CnZyoBpgIfYM@kamilkon-desk1>
 <YzRBxjWDvvfTq3Yd@platvala-desk.ger.corp.intel.com>
 <YzRqBDptI8v/c8AG@kamilkon-desk1>
 <Yzrgxco0NHHKLpzn@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Yzrgxco0NHHKLpzn@platvala-desk.ger.corp.intel.com>
From: Jake Freeland <jake@technologyfriends.net>
Date: Wed, 5 Oct 2022 15:38:50 -0500
Message-ID: <CAOgZAGYzj1BzrrfJcbRyRYYGU5jipc71HrHzy6TyGLVVKP0Ctg@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: multipart/alternative; boundary="00000000000018144605ea4f919f"
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

--00000000000018144605ea4f919f
Content-Type: text/plain; charset="UTF-8"

Petri and Kamil,

I just sent in a new patch under the name "Replaced instances of mmap64()
with drm_mmap()".
This patch follows Rob Clark's advice and uses drm_mmap() instead of mmap()
so 32-bit
machines are (partially) accounted for.

Thank you,
Jake Freeland

On Mon, Oct 3, 2022 at 8:17 AM Petri Latvala <petri.latvala@intel.com>
wrote:

> On Wed, Sep 28, 2022 at 05:36:36PM +0200, Kamil Konieczny wrote:
> > On 2022-09-28 at 15:44:54 +0300, Petri Latvala wrote:
> > > On Wed, Sep 28, 2022 at 02:33:14PM +0200, Kamil Konieczny wrote:
> > > > Hi Jake,
> > > >
> > > > this patch is missing commit message. Please put here short
> > > > description of change and why you do it. Change looks resonable
> > > > as on 64-bit systems both functions are the same.
> > > >
> > > > On 2022-09-18 at 17:15:35 -0500, Jake Freeland wrote:
> > > > > Signed-off-by: Jake Freeland <jfree@freebsd.org>
> > > >
> > > > Adding Petri on cc as I do not know if anyone compiles this on
> > > > 32-bit platforms.
> > >
> > > Aren't you supposed to use mmap() with _LARGEFILE_something even on
> > > 32-bit builds, instead of mmap64?
> > >
> > >
> > > --
> > > Petri Latvala
> > >
> >
> > imho _LARGEFILE_... is indeed needed on 32-bit builds, no need
> > for this on our current builds as Linux runs now on 64-bit
> > machines.
> >
> > I was asking if you know of anyone compiling and using igt i915
> > code for 32-bit platform.
> >
> > I see that this patch touches also igt_vgem lib so maybe we
> > should also ask arm igt users ?
>
> Rob Clark suggested just using drm_mmap() and letting it figure out
> whether to call mmap or mmap64. Although it just seems to call mmap()
> anyway and assumes largefile always, except on android, except when
> __LP64__ is set.
>
> For IGT we could either use drm_mmap or just make the same documented
> assumption.
>
> --
> Petri Latvala
>
>
> >
> > --
> > Kamil
> >
> > >
> > >
> > > >
> > > > Regards,
> > > > Kamil
> > > >
> > > > > ---
> > > > >  lib/i915/gem_mman.c          |  4 ++--
> > > > >  lib/igt_vgem.c               |  2 +-
> > > > >  tests/i915/gem_mmap_gtt.c    | 22 +++++++++++-----------
> > > > >  tests/i915/gem_mmap_offset.c | 14 +++++++-------
> > > > >  4 files changed, 21 insertions(+), 21 deletions(-)
> > > > >
> > > > > diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
> > > > > index aa9ac6f3..0b41ba70 100644
> > > > > --- a/lib/i915/gem_mman.c
> > > > > +++ b/lib/i915/gem_mman.c
> > > > > @@ -118,7 +118,7 @@ void *__gem_mmap__gtt(int fd, uint32_t handle,
> uint64_t size, unsigned prot)
> > > > >         if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg))
> > > > >                 return NULL;
> > > > >
> > > > > -       ptr = mmap64(0, size, prot, MAP_SHARED, fd,
> mmap_arg.offset);
> > > > > +       ptr = mmap(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
> > > > >         if (ptr == MAP_FAILED)
> > > > >                 ptr = NULL;
> > > > >         else
> > > > > @@ -331,7 +331,7 @@ void *__gem_mmap_offset(int fd, uint32_t
> handle, uint64_t offset, uint64_t size,
> > > > >         if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET, &arg))
> > > > >                 return NULL;
> > > > >
> > > > > -       ptr = mmap64(0, size, prot, MAP_SHARED, fd, arg.offset +
> offset);
> > > > > +       ptr = mmap(0, size, prot, MAP_SHARED, fd, arg.offset +
> offset);
> > > > >
> > > > >         if (ptr == MAP_FAILED)
> > > > >                 ptr = NULL;
> > > > > diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c
> > > > > index 7f933b23..468383c7 100644
> > > > > --- a/lib/igt_vgem.c
> > > > > +++ b/lib/igt_vgem.c
> > > > > @@ -76,7 +76,7 @@ void *__vgem_mmap(int fd, struct vgem_bo *bo,
> unsigned prot)
> > > > >         if (drmIoctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &arg))
> > > > >                 return NULL;
> > > > >
> > > > > -       ptr = mmap64(0, bo->size, prot, MAP_SHARED, fd,
> arg.offset);
> > > > > +       ptr = mmap(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
> > > > >         if (ptr == MAP_FAILED)
> > > > >                 return NULL;
> > > > >
> > > > > diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> > > > > index 4f05eb18..683eaf16 100644
> > > > > --- a/tests/i915/gem_mmap_gtt.c
> > > > > +++ b/tests/i915/gem_mmap_gtt.c
> > > > > @@ -113,11 +113,11 @@ test_access(int fd)
> > > > >         mmap_arg.handle = handle;
> > > > >         do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg);
> > > > >
> > > > > -       igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > > +       igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > >                           MAP_SHARED, fd, mmap_arg.offset));
> > > > >
> > > > >         /* Check that the same offset on the other fd doesn't
> work. */
> > > > > -       igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > > +       igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > >                           MAP_SHARED, fd2, mmap_arg.offset) ==
> MAP_FAILED);
> > > > >         igt_assert(errno == EACCES);
> > > > >
> > > > > @@ -128,7 +128,7 @@ test_access(int fd)
> > > > >
> > > > >         /* Recheck that it works after flink. */
> > > > >         /* Check that the same offset on the other fd doesn't
> work. */
> > > > > -       igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > > +       igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > >                           MAP_SHARED, fd2, mmap_arg.offset));
> > > > >  }
> > > > >
> > > > > @@ -159,11 +159,11 @@ test_short(int fd)
> > > > >         for (pages = 1; pages <= OBJECT_SIZE / PAGE_SIZE; pages
> <<= 1) {
> > > > >                 uint8_t *r, *w;
> > > > >
> > > > > -               w = mmap64(0, pages * PAGE_SIZE, PROT_READ |
> PROT_WRITE,
> > > > > +               w = mmap(0, pages * PAGE_SIZE, PROT_READ |
> PROT_WRITE,
> > > > >                            MAP_SHARED, fd, mmap_arg.offset);
> > > > >                 igt_assert(w != MAP_FAILED);
> > > > >
> > > > > -               r = mmap64(0, pages * PAGE_SIZE, PROT_READ,
> > > > > +               r = mmap(0, pages * PAGE_SIZE, PROT_READ,
> > > > >                            MAP_SHARED, fd, mmap_arg.offset);
> > > > >                 igt_assert(r != MAP_FAILED);
> > > > >
> > > > > @@ -384,13 +384,13 @@ test_isolation(int i915)
> > > > >
> > > > >         close(B);
> > > > >
> > > > > -       ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > > > +       ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > > >         igt_assert(ptr != MAP_FAILED);
> > > > >         munmap(ptr, 4096);
> > > > >
> > > > >         close(A);
> > > > >
> > > > > -       ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > > > +       ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > > >         igt_assert(ptr == MAP_FAILED);
> > > > >  }
> > > > >
> > > > > @@ -400,7 +400,7 @@ test_close_race(int i915)
> > > > >         const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> > > > >         _Atomic uint32_t *handles;
> > > > >
> > > > > -       handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED |
> MAP_ANON, -1, 0);
> > > > > +       handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON,
> -1, 0);
> > > > >         igt_assert(handles != MAP_FAILED);
> > > > >
> > > > >         igt_fork(child, ncpus + 1) {
> > > > > @@ -418,7 +418,7 @@ test_close_race(int i915)
> > > > >                                   &mmap_arg) != -1) {
> > > > >                                 void *ptr;
> > > > >
> > > > > -                               ptr = mmap64(0, 4096,
> > > > > +                               ptr = mmap(0, 4096,
> > > > >                                              PROT_WRITE,
> MAP_SHARED, i915,
> > > > >                                              mmap_arg.offset);
> > > > >                                 if (ptr != MAP_FAILED) {
> > > > > @@ -444,7 +444,7 @@ test_flink_race(int i915)
> > > > >         const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> > > > >         _Atomic uint32_t *handles;
> > > > >
> > > > > -       handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED |
> MAP_ANON, -1, 0);
> > > > > +       handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON,
> -1, 0);
> > > > >         igt_assert(handles != MAP_FAILED);
> > > > >
> > > > >         igt_fork(child, ncpus + 1) {
> > > > > @@ -469,7 +469,7 @@ test_flink_race(int i915)
> > > > >                                   &mmap_arg) != -1) {
> > > > >                                 void *ptr;
> > > > >
> > > > > -                               ptr = mmap64(0, 4096,
> > > > > +                               ptr = mmap(0, 4096,
> > > > >                                              PROT_WRITE,
> MAP_SHARED, fd,
> > > > >                                              mmap_arg.offset);
> > > > >                                 if (ptr != MAP_FAILED) {
> > > > > diff --git a/tests/i915/gem_mmap_offset.c
> b/tests/i915/gem_mmap_offset.c
> > > > > index 5781b2fb..0933ed94 100644
> > > > > --- a/tests/i915/gem_mmap_offset.c
> > > > > +++ b/tests/i915/gem_mmap_offset.c
> > > > > @@ -66,7 +66,7 @@ __mmap_offset(int i915, uint32_t handle,
> uint64_t offset, uint64_t size,
> > > > >         if (mmap_offset_ioctl(i915, &arg))
> > > > >                 return NULL;
> > > > >
> > > > > -       ptr = mmap64(0, size, prot, MAP_SHARED, i915, arg.offset +
> offset);
> > > > > +       ptr = mmap(0, size, prot, MAP_SHARED, i915, arg.offset +
> offset);
> > > > >         if (ptr == MAP_FAILED)
> > > > >                 ptr = NULL;
> > > > >         else
> > > > > @@ -214,12 +214,12 @@ static void isolation(int i915)
> > > > >                          t->name, B, b, offset_b);
> > > > >
> > > > >                 errno = 0;
> > > > > -               ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915,
> offset_a);
> > > > > +               ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915,
> offset_a);
> > > > >                 igt_assert(ptr == MAP_FAILED);
> > > > >                 igt_assert_eq(errno, EACCES);
> > > > >
> > > > >                 errno = 0;
> > > > > -               ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915,
> offset_b);
> > > > > +               ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915,
> offset_b);
> > > > >                 igt_assert(ptr == MAP_FAILED);
> > > > >                 igt_assert_eq(errno, EACCES);
> > > > >
> > > > > @@ -237,13 +237,13 @@ static void isolation(int i915)
> > > > >
> > > > >                 close(B);
> > > > >
> > > > > -               ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A,
> offset_a);
> > > > > +               ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A,
> offset_a);
> > > > >                 igt_assert(ptr != MAP_FAILED);
> > > > >                 munmap(ptr, 4096);
> > > > >
> > > > >                 close(A);
> > > > >
> > > > > -               ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A,
> offset_a);
> > > > > +               ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A,
> offset_a);
> > > > >                 igt_assert(ptr == MAP_FAILED);
> > > > >         }
> > > > >  }
> > > > > @@ -401,7 +401,7 @@ static void close_race(int i915, int timeout)
> > > > >         _Atomic uint32_t *handles;
> > > > >         size_t len = ALIGN((ncpus + 1) * sizeof(uint32_t), 4096);
> > > > >
> > > > > -       handles = mmap64(0, len, PROT_WRITE, MAP_SHARED |
> MAP_ANON, -1, 0);
> > > > > +       handles = mmap(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON,
> -1, 0);
> > > > >         igt_assert(handles != MAP_FAILED);
> > > > >
> > > > >         igt_fork(child, ncpus + 1) {
> > > > > @@ -420,7 +420,7 @@ static void close_race(int i915, int timeout)
> > > > >                                   &mmap_arg) != -1) {
> > > > >                                 void *ptr;
> > > > >
> > > > > -                               ptr = mmap64(0, 4096,
> > > > > +                               ptr = mmap(0, 4096,
> > > > >                                              PROT_WRITE,
> MAP_SHARED, i915,
> > > > >                                              mmap_arg.offset);
> > > > >                                 if (ptr != MAP_FAILED) {
> > > > > --
> > > > > 2.37.3
> > > > >
>

--00000000000018144605ea4f919f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Petri and Kamil,<div><br></div><div>I just sent in a new p=
atch under=C2=A0the name &quot;Replaced instances of mmap64() with drm_mmap=
()&quot;.<br></div><div>This patch follows Rob Clark&#39;s advice and uses =
drm_mmap() instead of mmap() so 32-bit</div><div>machines are (partially) a=
ccounted for.</div><div><br></div><div>Thank you,</div><div>Jake Freeland</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Oct 3, 2022 at 8:17 AM Petri Latvala &lt;<a href=3D"mailto:petr=
i.latvala@intel.com" target=3D"_blank">petri.latvala@intel.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Sep 2=
8, 2022 at 05:36:36PM +0200, Kamil Konieczny wrote:<br>
&gt; On 2022-09-28 at 15:44:54 +0300, Petri Latvala wrote:<br>
&gt; &gt; On Wed, Sep 28, 2022 at 02:33:14PM +0200, Kamil Konieczny wrote:<=
br>
&gt; &gt; &gt; Hi Jake,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; this patch is missing commit message. Please put here short<=
br>
&gt; &gt; &gt; description of change and why you do it. Change looks resona=
ble<br>
&gt; &gt; &gt; as on 64-bit systems both functions are the same.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On 2022-09-18 at 17:15:35 -0500, Jake Freeland wrote:<br>
&gt; &gt; &gt; &gt; Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfre=
e@freebsd.org" target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Adding Petri on cc as I do not know if anyone compiles this =
on<br>
&gt; &gt; &gt; 32-bit platforms.<br>
&gt; &gt; <br>
&gt; &gt; Aren&#39;t you supposed to use mmap() with _LARGEFILE_something e=
ven on<br>
&gt; &gt; 32-bit builds, instead of mmap64?<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; -- <br>
&gt; &gt; Petri Latvala<br>
&gt; &gt; <br>
&gt; <br>
&gt; imho _LARGEFILE_... is indeed needed on 32-bit builds, no need<br>
&gt; for this on our current builds as Linux runs now on 64-bit<br>
&gt; machines.<br>
&gt; <br>
&gt; I was asking if you know of anyone compiling and using igt i915<br>
&gt; code for 32-bit platform.<br>
&gt; <br>
&gt; I see that this patch touches also igt_vgem lib so maybe we<br>
&gt; should also ask arm igt users ?<br>
<br>
Rob Clark suggested just using drm_mmap() and letting it figure out<br>
whether to call mmap or mmap64. Although it just seems to call mmap()<br>
anyway and assumes largefile always, except on android, except when<br>
__LP64__ is set.<br>
<br>
For IGT we could either use drm_mmap or just make the same documented<br>
assumption.<br>
<br>
-- <br>
Petri Latvala<br>
<br>
<br>
&gt; <br>
&gt; --<br>
&gt; Kamil<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; Kamil<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 lib/i915/gem_mman.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 ++--<br>
&gt; &gt; &gt; &gt;=C2=A0 lib/igt_vgem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 tests/i915/gem_mmap_gtt.c=C2=A0 =C2=A0 | 22 +++++=
++++++-----------<br>
&gt; &gt; &gt; &gt;=C2=A0 tests/i915/gem_mmap_offset.c | 14 +++++++-------<=
br>
&gt; &gt; &gt; &gt;=C2=A0 4 files changed, 21 insertions(+), 21 deletions(-=
)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c<=
br>
&gt; &gt; &gt; &gt; index aa9ac6f3..0b41ba70 100644<br>
&gt; &gt; &gt; &gt; --- a/lib/i915/gem_mman.c<br>
&gt; &gt; &gt; &gt; +++ b/lib/i915/gem_mman.c<br>
&gt; &gt; &gt; &gt; @@ -118,7 +118,7 @@ void *__gem_mmap__gtt(int fd, uint3=
2_t handle, uint64_t size, unsigned prot)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (igt_ioctl(fd, DRM_=
IOCTL_I915_GEM_MMAP_GTT, &amp;mmap_arg))<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return NULL;<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, size, pro=
t, MAP_SHARED, fd, mmap_arg.offset);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, size, prot,=
 MAP_SHARED, fd, mmap_arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAI=
LED)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ptr =3D NULL;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; &gt; &gt; @@ -331,7 +331,7 @@ void *__gem_mmap_offset(int fd, uin=
t32_t handle, uint64_t offset, uint64_t size,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (igt_ioctl(fd, DRM_=
IOCTL_I915_GEM_MMAP_OFFSET, &amp;arg))<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return NULL;<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, size, pro=
t, MAP_SHARED, fd, arg.offset + offset);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, size, prot,=
 MAP_SHARED, fd, arg.offset + offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAI=
LED)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ptr =3D NULL;<br>
&gt; &gt; &gt; &gt; diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c<br>
&gt; &gt; &gt; &gt; index 7f933b23..468383c7 100644<br>
&gt; &gt; &gt; &gt; --- a/lib/igt_vgem.c<br>
&gt; &gt; &gt; &gt; +++ b/lib/igt_vgem.c<br>
&gt; &gt; &gt; &gt; @@ -76,7 +76,7 @@ void *__vgem_mmap(int fd, struct vgem=
_bo *bo, unsigned prot)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drmIoctl(fd, DRM_I=
OCTL_MODE_MAP_DUMB, &amp;arg))<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return NULL;<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, bo-&gt;si=
ze, prot, MAP_SHARED, fd, arg.offset);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, bo-&gt;size=
, prot, MAP_SHARED, fd, arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAI=
LED)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return NULL;<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem=
_mmap_gtt.c<br>
&gt; &gt; &gt; &gt; index 4f05eb18..683eaf16 100644<br>
&gt; &gt; &gt; &gt; --- a/tests/i915/gem_mmap_gtt.c<br>
&gt; &gt; &gt; &gt; +++ b/tests/i915/gem_mmap_gtt.c<br>
&gt; &gt; &gt; &gt; @@ -113,11 +113,11 @@ test_access(int fd)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmap_arg.handle =3D ha=
ndle;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do_ioctl(fd, DRM_IOCTL=
_I915_GEM_MMAP_GTT, &amp;mmap_arg);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT=
_SIZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(mmap(0, OBJECT_S=
IZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_SHARED, fd, mmap_arg.offset));=
<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that the same=
 offset on the other fd doesn&#39;t work. */<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT=
_SIZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(mmap(0, OBJECT_S=
IZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_SHARED, fd2, mmap_arg.offset) =
=3D=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(errno =3D=
=3D EACCES);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; @@ -128,7 +128,7 @@ test_access(int fd)<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Recheck that it wor=
ks after flink. */<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that the same=
 offset on the other fd doesn&#39;t work. */<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT=
_SIZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(mmap(0, OBJECT_S=
IZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_SHARED, fd2, mmap_arg.offset))=
;<br>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; @@ -159,11 +159,11 @@ test_short(int fd)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (pages =3D 1; page=
s &lt;=3D OBJECT_SIZE / PAGE_SIZE; pages &lt;&lt;=3D 1) {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint8_t *r, *w;<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0w =3D mmap64(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0w =3D mmap(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_SHARED, fd, mmap_arg.offset);=
<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0igt_assert(w !=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0r =3D mmap64(0, pages * PAGE_SIZE, PROT_READ,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0r =3D mmap(0, pages * PAGE_SIZE, PROT_READ,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_SHARED, fd, mmap_arg.offset);=
<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0igt_assert(r !=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; @@ -384,13 +384,13 @@ test_isolation(int i915)<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(B);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096, PRO=
T_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096, PROT_=
READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(ptr !=3D MA=
P_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(ptr, 4096);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(A);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096, PRO=
T_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096, PROT_=
READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(ptr =3D=3D =
MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; @@ -400,7 +400,7 @@ test_close_race(int i915)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const int ncpus =3D sy=
sconf(_SC_NPROCESSORS_ONLN);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *hand=
les;<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0handles =3D mmap64(0, 4096,=
 PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0handles =3D mmap(0, 4096, P=
ROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(handles !=
=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus =
+ 1) {<br>
&gt; &gt; &gt; &gt; @@ -418,7 +418,7 @@ test_close_race(int i915)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;m=
map_arg) !=3D -1) {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *ptr;<br=
>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0=
, 4096,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, =
4096,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROT_WRITE, MAP_SHARED, i915,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap_arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr !=3D =
MAP_FAILED) {<br>
&gt; &gt; &gt; &gt; @@ -444,7 +444,7 @@ test_flink_race(int i915)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const int ncpus =3D sy=
sconf(_SC_NPROCESSORS_ONLN);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *hand=
les;<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0handles =3D mmap64(0, 4096,=
 PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0handles =3D mmap(0, 4096, P=
ROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(handles !=
=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus =
+ 1) {<br>
&gt; &gt; &gt; &gt; @@ -469,7 +469,7 @@ test_flink_race(int i915)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;m=
map_arg) !=3D -1) {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *ptr;<br=
>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0=
, 4096,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, =
4096,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROT_WRITE, MAP_SHARED, fd,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap_arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr !=3D =
MAP_FAILED) {<br>
&gt; &gt; &gt; &gt; diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/=
gem_mmap_offset.c<br>
&gt; &gt; &gt; &gt; index 5781b2fb..0933ed94 100644<br>
&gt; &gt; &gt; &gt; --- a/tests/i915/gem_mmap_offset.c<br>
&gt; &gt; &gt; &gt; +++ b/tests/i915/gem_mmap_offset.c<br>
&gt; &gt; &gt; &gt; @@ -66,7 +66,7 @@ __mmap_offset(int i915, uint32_t hand=
le, uint64_t offset, uint64_t size,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mmap_offset_ioctl(=
i915, &amp;arg))<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return NULL;<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, size, pro=
t, MAP_SHARED, i915, arg.offset + offset);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, size, prot,=
 MAP_SHARED, i915, arg.offset + offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAI=
LED)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ptr =3D NULL;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; &gt; &gt; @@ -214,12 +214,12 @@ static void isolation(int i915)<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t-&gt;name, B, b, offset_b);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0errno =3D 0;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ptr =3D mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0igt_assert(ptr =3D=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0igt_assert_eq(errno, EACCES);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0errno =3D 0;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ptr =3D mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0igt_assert(ptr =3D=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0igt_assert_eq(errno, EACCES);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; @@ -237,13 +237,13 @@ static void isolation(int i915)<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0close(B);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ptr =3D mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0igt_assert(ptr !=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0munmap(ptr, 4096);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0close(A);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ptr =3D mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0igt_assert(ptr =3D=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; @@ -401,7 +401,7 @@ static void close_race(int i915, in=
t timeout)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *hand=
les;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len =3D ALIGN((=
ncpus + 1) * sizeof(uint32_t), 4096);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0handles =3D mmap64(0, len, =
PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0handles =3D mmap(0, len, PR=
OT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_assert(handles !=
=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus =
+ 1) {<br>
&gt; &gt; &gt; &gt; @@ -420,7 +420,7 @@ static void close_race(int i915, in=
t timeout)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;m=
map_arg) !=3D -1) {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *ptr;<br=
>
&gt; &gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0=
, 4096,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, =
4096,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROT_WRITE, MAP_SHARED, i915,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmap_arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr !=3D =
MAP_FAILED) {<br>
&gt; &gt; &gt; &gt; -- <br>
&gt; &gt; &gt; &gt; 2.37.3<br>
&gt; &gt; &gt; &gt; <br>
</blockquote></div>

--00000000000018144605ea4f919f--
