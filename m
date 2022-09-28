Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4164010E050
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 20:53:32 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id a129so13975191vsc.0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 13:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220918221535.3276922-1-jfree@freebsd.org>
 <YzQ/CnZyoBpgIfYM@kamilkon-desk1>
 <YzRBxjWDvvfTq3Yd@platvala-desk.ger.corp.intel.com>
 <CAOgZAGZjV=Eg+DJSpes2PpMKEZPFKF6CbuDZ5-9=tY5gmuQv+A@mail.gmail.com>
 <YzRrfIGlAgT307MC@kamilkon-desk1>
In-Reply-To: <YzRrfIGlAgT307MC@kamilkon-desk1>
From: Jake Freeland <jake@technologyfriends.net>
Date: Wed, 28 Sep 2022 15:53:20 -0500
Message-ID: <CAOgZAGbaS2NcPhXV8JMPYjQ5_n7oPOU9iJYgjc3qHrEFd3KPdQ@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jake Freeland <jfree@freebsd.org>, Petri Latvala <petri.latvala@intel.com>
Content-Type: multipart/alternative; boundary="0000000000000e3deb05e9c2f4fd"
Subject: Re: [igt-dev] [PATCH i-g-t] Replaced instances of mmap64() with
 mmap()
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

--0000000000000e3deb05e9c2f4fd
Content-Type: text/plain; charset="UTF-8"

Kamil,

I just resubmitted 4 patches with appropriate commit messages.

Given 32-bit's maximum of 4GB of RAM, I am doubtful that it
would be practical to map over half of that to video memory.
At least from an integrated GPU's perspective.

Jake Freeland

On Wed, Sep 28, 2022 at 10:42 AM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Jake,
>
> On 2022-09-28 at 10:19:04 -0500, Jake Freeland wrote:
> > I cannot find any relevant documentation for both Linux and FreeBSD
> > that mentions an mmap flag that supports large file allocation on
> > 32-bit architectures.
> >
> > Commit message:
> > The mmap64() function exists to point 32-bit architectures to an mmap
> > interface with the capability to address a 64-bit memory address space.
> > As 32-bit machines are replaced by 64-bit, there is no longer a need to
> > keep mmap64() around. This is especially apparent in operating systems
> > like FreeBSD that exclude the mmap64() function altogether. This patch
> > replaces all instances of mmap64() with mmap().
> >
> > Jake Freeland
>
> Commit message looks ok, please repost patch with this.
>
> For the _LARGEFILE64_SOURCE, it looks like it is enough to define
> _FILE_OFFSET_BITS on 32-bit platform during compile, see:
>
>
> https://stackoverflow.com/questions/59453555/is-there-any-difference-between-mmap-vs-mmap64
>
> The question is: are there any igt users of 32-bit platform with
> GPU memory size bigger then 2GB ?
>
> Regards,
> Kamil
>
> >
> > On Wed, Sep 28, 2022 at 7:45 AM Petri Latvala <petri.latvala@intel.com>
> > wrote:
> >
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
> > > uint64_t size, unsigned prot)
> > > > >     if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg))
> > > > >             return NULL;
> > > > >
> > > > > -   ptr = mmap64(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
> > > > > +   ptr = mmap(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
> > > > >     if (ptr == MAP_FAILED)
> > > > >             ptr = NULL;
> > > > >     else
> > > > > @@ -331,7 +331,7 @@ void *__gem_mmap_offset(int fd, uint32_t
> handle,
> > > uint64_t offset, uint64_t size,
> > > > >     if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET, &arg))
> > > > >             return NULL;
> > > > >
> > > > > -   ptr = mmap64(0, size, prot, MAP_SHARED, fd, arg.offset +
> offset);
> > > > > +   ptr = mmap(0, size, prot, MAP_SHARED, fd, arg.offset + offset);
> > > > >
> > > > >     if (ptr == MAP_FAILED)
> > > > >             ptr = NULL;
> > > > > diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c
> > > > > index 7f933b23..468383c7 100644
> > > > > --- a/lib/igt_vgem.c
> > > > > +++ b/lib/igt_vgem.c
> > > > > @@ -76,7 +76,7 @@ void *__vgem_mmap(int fd, struct vgem_bo *bo,
> > > unsigned prot)
> > > > >     if (drmIoctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &arg))
> > > > >             return NULL;
> > > > >
> > > > > -   ptr = mmap64(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
> > > > > +   ptr = mmap(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
> > > > >     if (ptr == MAP_FAILED)
> > > > >             return NULL;
> > > > >
> > > > > diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> > > > > index 4f05eb18..683eaf16 100644
> > > > > --- a/tests/i915/gem_mmap_gtt.c
> > > > > +++ b/tests/i915/gem_mmap_gtt.c
> > > > > @@ -113,11 +113,11 @@ test_access(int fd)
> > > > >     mmap_arg.handle = handle;
> > > > >     do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg);
> > > > >
> > > > > -   igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > > +   igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > >                       MAP_SHARED, fd, mmap_arg.offset));
> > > > >
> > > > >     /* Check that the same offset on the other fd doesn't work. */
> > > > > -   igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > > +   igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > >                       MAP_SHARED, fd2, mmap_arg.offset) ==
> MAP_FAILED);
> > > > >     igt_assert(errno == EACCES);
> > > > >
> > > > > @@ -128,7 +128,7 @@ test_access(int fd)
> > > > >
> > > > >     /* Recheck that it works after flink. */
> > > > >     /* Check that the same offset on the other fd doesn't work. */
> > > > > -   igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > > +   igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > > >                       MAP_SHARED, fd2, mmap_arg.offset));
> > > > >  }
> > > > >
> > > > > @@ -159,11 +159,11 @@ test_short(int fd)
> > > > >     for (pages = 1; pages <= OBJECT_SIZE / PAGE_SIZE; pages <<= 1)
> {
> > > > >             uint8_t *r, *w;
> > > > >
> > > > > -           w = mmap64(0, pages * PAGE_SIZE, PROT_READ |
> PROT_WRITE,
> > > > > +           w = mmap(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,
> > > > >                        MAP_SHARED, fd, mmap_arg.offset);
> > > > >             igt_assert(w != MAP_FAILED);
> > > > >
> > > > > -           r = mmap64(0, pages * PAGE_SIZE, PROT_READ,
> > > > > +           r = mmap(0, pages * PAGE_SIZE, PROT_READ,
> > > > >                        MAP_SHARED, fd, mmap_arg.offset);
> > > > >             igt_assert(r != MAP_FAILED);
> > > > >
> > > > > @@ -384,13 +384,13 @@ test_isolation(int i915)
> > > > >
> > > > >     close(B);
> > > > >
> > > > > -   ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > > > +   ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > > >     igt_assert(ptr != MAP_FAILED);
> > > > >     munmap(ptr, 4096);
> > > > >
> > > > >     close(A);
> > > > >
> > > > > -   ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > > > +   ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > > >     igt_assert(ptr == MAP_FAILED);
> > > > >  }
> > > > >
> > > > > @@ -400,7 +400,7 @@ test_close_race(int i915)
> > > > >     const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> > > > >     _Atomic uint32_t *handles;
> > > > >
> > > > > -   handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON,
> -1,
> > > 0);
> > > > > +   handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1,
> 0);
> > > > >     igt_assert(handles != MAP_FAILED);
> > > > >
> > > > >     igt_fork(child, ncpus + 1) {
> > > > > @@ -418,7 +418,7 @@ test_close_race(int i915)
> > > > >                               &mmap_arg) != -1) {
> > > > >                             void *ptr;
> > > > >
> > > > > -                           ptr = mmap64(0, 4096,
> > > > > +                           ptr = mmap(0, 4096,
> > > > >                                          PROT_WRITE, MAP_SHARED,
> i915,
> > > > >                                          mmap_arg.offset);
> > > > >                             if (ptr != MAP_FAILED) {
> > > > > @@ -444,7 +444,7 @@ test_flink_race(int i915)
> > > > >     const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> > > > >     _Atomic uint32_t *handles;
> > > > >
> > > > > -   handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON,
> -1,
> > > 0);
> > > > > +   handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1,
> 0);
> > > > >     igt_assert(handles != MAP_FAILED);
> > > > >
> > > > >     igt_fork(child, ncpus + 1) {
> > > > > @@ -469,7 +469,7 @@ test_flink_race(int i915)
> > > > >                               &mmap_arg) != -1) {
> > > > >                             void *ptr;
> > > > >
> > > > > -                           ptr = mmap64(0, 4096,
> > > > > +                           ptr = mmap(0, 4096,
> > > > >                                          PROT_WRITE, MAP_SHARED,
> fd,
> > > > >                                          mmap_arg.offset);
> > > > >                             if (ptr != MAP_FAILED) {
> > > > > diff --git a/tests/i915/gem_mmap_offset.c
> > > b/tests/i915/gem_mmap_offset.c
> > > > > index 5781b2fb..0933ed94 100644
> > > > > --- a/tests/i915/gem_mmap_offset.c
> > > > > +++ b/tests/i915/gem_mmap_offset.c
> > > > > @@ -66,7 +66,7 @@ __mmap_offset(int i915, uint32_t handle, uint64_t
> > > offset, uint64_t size,
> > > > >     if (mmap_offset_ioctl(i915, &arg))
> > > > >             return NULL;
> > > > >
> > > > > -   ptr = mmap64(0, size, prot, MAP_SHARED, i915, arg.offset +
> offset);
> > > > > +   ptr = mmap(0, size, prot, MAP_SHARED, i915, arg.offset +
> offset);
> > > > >     if (ptr == MAP_FAILED)
> > > > >             ptr = NULL;
> > > > >     else
> > > > > @@ -214,12 +214,12 @@ static void isolation(int i915)
> > > > >                      t->name, B, b, offset_b);
> > > > >
> > > > >             errno = 0;
> > > > > -           ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915,
> > > offset_a);
> > > > > +           ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915,
> offset_a);
> > > > >             igt_assert(ptr == MAP_FAILED);
> > > > >             igt_assert_eq(errno, EACCES);
> > > > >
> > > > >             errno = 0;
> > > > > -           ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915,
> > > offset_b);
> > > > > +           ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915,
> offset_b);
> > > > >             igt_assert(ptr == MAP_FAILED);
> > > > >             igt_assert_eq(errno, EACCES);
> > > > >
> > > > > @@ -237,13 +237,13 @@ static void isolation(int i915)
> > > > >
> > > > >             close(B);
> > > > >
> > > > > -           ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A,
> offset_a);
> > > > > +           ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A,
> offset_a);
> > > > >             igt_assert(ptr != MAP_FAILED);
> > > > >             munmap(ptr, 4096);
> > > > >
> > > > >             close(A);
> > > > >
> > > > > -           ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A,
> offset_a);
> > > > > +           ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A,
> offset_a);
> > > > >             igt_assert(ptr == MAP_FAILED);
> > > > >     }
> > > > >  }
> > > > > @@ -401,7 +401,7 @@ static void close_race(int i915, int timeout)
> > > > >     _Atomic uint32_t *handles;
> > > > >     size_t len = ALIGN((ncpus + 1) * sizeof(uint32_t), 4096);
> > > > >
> > > > > -   handles = mmap64(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON,
> -1, 0);
> > > > > +   handles = mmap(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1,
> 0);
> > > > >     igt_assert(handles != MAP_FAILED);
> > > > >
> > > > >     igt_fork(child, ncpus + 1) {
> > > > > @@ -420,7 +420,7 @@ static void close_race(int i915, int timeout)
> > > > >                               &mmap_arg) != -1) {
> > > > >                             void *ptr;
> > > > >
> > > > > -                           ptr = mmap64(0, 4096,
> > > > > +                           ptr = mmap(0, 4096,
> > > > >                                          PROT_WRITE, MAP_SHARED,
> i915,
> > > > >                                          mmap_arg.offset);
> > > > >                             if (ptr != MAP_FAILED) {
> > > > > --
> > > > > 2.37.3
> > > > >
> > >
>

--0000000000000e3deb05e9c2f4fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Kamil,<div><br></div><div>I just resubmitted 4 patches wit=
h appropriate commit messages.</div><div><br></div><div>Given 32-bit&#39;s=
=C2=A0maximum of 4GB of RAM, I am doubtful that it</div><div>would be pract=
ical to map over half of that to video memory.</div><div>At least from an i=
ntegrated GPU&#39;s perspective.</div><div></div><div><br></div><div>Jake F=
reeland</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, Sep 28, 2022 at 10:42 AM Kamil Konieczny &lt;<a href=
=3D"mailto:kamil.konieczny@linux.intel.com" target=3D"_blank">kamil.koniecz=
ny@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi Jake,<br>
<br>
On 2022-09-28 at 10:19:04 -0500, Jake Freeland wrote:<br>
&gt; I cannot find any relevant documentation for both Linux and FreeBSD<br=
>
&gt; that mentions an mmap flag that supports large file allocation on<br>
&gt; 32-bit architectures.<br>
&gt; <br>
&gt; Commit message:<br>
&gt; The mmap64() function exists to point 32-bit architectures to an mmap<=
br>
&gt; interface with the capability to address a 64-bit memory address space=
.<br>
&gt; As 32-bit machines are replaced by 64-bit, there is no longer a need t=
o<br>
&gt; keep mmap64() around. This is especially apparent in operating systems=
<br>
&gt; like FreeBSD that exclude the mmap64() function altogether. This patch=
<br>
&gt; replaces all instances of mmap64() with mmap().<br>
&gt; <br>
&gt; Jake Freeland<br>
<br>
Commit message looks ok, please repost patch with this.<br>
<br>
For the _LARGEFILE64_SOURCE, it looks like it is enough to define<br>
_FILE_OFFSET_BITS on 32-bit platform during compile, see:<br>
<br>
<a href=3D"https://stackoverflow.com/questions/59453555/is-there-any-differ=
ence-between-mmap-vs-mmap64" rel=3D"noreferrer" target=3D"_blank">https://s=
tackoverflow.com/questions/59453555/is-there-any-difference-between-mmap-vs=
-mmap64</a><br>
<br>
The question is: are there any igt users of 32-bit platform with<br>
GPU memory size bigger then 2GB ?<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; <br>
&gt; On Wed, Sep 28, 2022 at 7:45 AM Petri Latvala &lt;<a href=3D"mailto:pe=
tri.latvala@intel.com" target=3D"_blank">petri.latvala@intel.com</a>&gt;<br=
>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Sep 28, 2022 at 02:33:14PM +0200, Kamil Konieczny wrote:<=
br>
&gt; &gt; &gt; Hi Jake,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; this patch is missing commit message. Please put here short<=
br>
&gt; &gt; &gt; description of change and why you do it. Change looks resona=
ble<br>
&gt; &gt; &gt; as on 64-bit systems both functions are the same.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 2022-09-18 at 17:15:35 -0500, Jake Freeland wrote:<br>
&gt; &gt; &gt; &gt; Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfre=
e@freebsd.org" target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Adding Petri on cc as I do not know if anyone compiles this =
on<br>
&gt; &gt; &gt; 32-bit platforms.<br>
&gt; &gt;<br>
&gt; &gt; Aren&#39;t you supposed to use mmap() with _LARGEFILE_something e=
ven on<br>
&gt; &gt; 32-bit builds, instead of mmap64?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Petri Latvala<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; Kamil<br>
&gt; &gt; &gt;<br>
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
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c<=
br>
&gt; &gt; &gt; &gt; index aa9ac6f3..0b41ba70 100644<br>
&gt; &gt; &gt; &gt; --- a/lib/i915/gem_mman.c<br>
&gt; &gt; &gt; &gt; +++ b/lib/i915/gem_mman.c<br>
&gt; &gt; &gt; &gt; @@ -118,7 +118,7 @@ void *__gem_mmap__gtt(int fd, uint3=
2_t handle,<br>
&gt; &gt; uint64_t size, unsigned prot)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if (igt_ioctl(fd, DRM_IOCTL_I915_GEM=
_MMAP_GTT, &amp;mmap_arg))<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return N=
ULL;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, size, prot, MAP_SHARED,=
 fd, mmap_arg.offset);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, size, prot, MAP_SHARED, f=
d, mmap_arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D =
NULL;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; &gt; &gt; @@ -331,7 +331,7 @@ void *__gem_mmap_offset(int fd, uin=
t32_t handle,<br>
&gt; &gt; uint64_t offset, uint64_t size,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if (igt_ioctl(fd, DRM_IOCTL_I915_GEM=
_MMAP_OFFSET, &amp;arg))<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return N=
ULL;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, size, prot, MAP_SHARED,=
 fd, arg.offset + offset);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, size, prot, MAP_SHARED, f=
d, arg.offset + offset);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D =
NULL;<br>
&gt; &gt; &gt; &gt; diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c<br>
&gt; &gt; &gt; &gt; index 7f933b23..468383c7 100644<br>
&gt; &gt; &gt; &gt; --- a/lib/igt_vgem.c<br>
&gt; &gt; &gt; &gt; +++ b/lib/igt_vgem.c<br>
&gt; &gt; &gt; &gt; @@ -76,7 +76,7 @@ void *__vgem_mmap(int fd, struct vgem=
_bo *bo,<br>
&gt; &gt; unsigned prot)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if (drmIoctl(fd, DRM_IOCTL_MODE_MAP_=
DUMB, &amp;arg))<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return N=
ULL;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, bo-&gt;size, prot, MAP_=
SHARED, fd, arg.offset);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, bo-&gt;size, prot, MAP_SH=
ARED, fd, arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return N=
ULL;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem=
_mmap_gtt.c<br>
&gt; &gt; &gt; &gt; index 4f05eb18..683eaf16 100644<br>
&gt; &gt; &gt; &gt; --- a/tests/i915/gem_mmap_gtt.c<br>
&gt; &gt; &gt; &gt; +++ b/tests/i915/gem_mmap_gtt.c<br>
&gt; &gt; &gt; &gt; @@ -113,11 +113,11 @@ test_access(int fd)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0mmap_arg.handle =3D handle;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP=
_GTT, &amp;mmap_arg);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT_SIZE, PROT_RE=
AD | PROT_WRITE,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0igt_assert(mmap(0, OBJECT_SIZE, PROT_READ=
 | PROT_WRITE,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_SHARED, fd, mmap_arg.offset));<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0/* Check that the same offset on the=
 other fd doesn&#39;t work. */<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT_SIZE, PROT_RE=
AD | PROT_WRITE,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0igt_assert(mmap(0, OBJECT_SIZE, PROT_READ=
 | PROT_WRITE,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_SHARED, fd2, mmap_arg.offset) =3D=3D MAP_FAI=
LED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(errno =3D=3D EACCES);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; @@ -128,7 +128,7 @@ test_access(int fd)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0/* Recheck that it works after flink=
. */<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0/* Check that the same offset on the=
 other fd doesn&#39;t work. */<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0igt_assert(mmap64(0, OBJECT_SIZE, PROT_RE=
AD | PROT_WRITE,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0igt_assert(mmap(0, OBJECT_SIZE, PROT_READ=
 | PROT_WRITE,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_SHARED, fd2, mmap_arg.offset));<br>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; @@ -159,11 +159,11 @@ test_short(int fd)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0for (pages =3D 1; pages &lt;=3D OBJE=
CT_SIZE / PAGE_SIZE; pages &lt;&lt;=3D 1) {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t =
*r, *w;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w =3D mmap64(=
0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w =3D mmap(0,=
 pages * PAGE_SIZE, PROT_READ | PROT_WRITE,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_SHARED, fd, mmap_arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_asse=
rt(w !=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D mmap64(=
0, pages * PAGE_SIZE, PROT_READ,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D mmap(0,=
 pages * PAGE_SIZE, PROT_READ,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_SHARED, fd, mmap_arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_asse=
rt(r !=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; @@ -384,13 +384,13 @@ test_isolation(int i915)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0close(B);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SH=
ARED, A, offset_a);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, 4096, PROT_READ, MAP_SHAR=
ED, A, offset_a);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(ptr !=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0munmap(ptr, 4096);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0close(A);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, 4096, PROT_READ, MAP_SH=
ARED, A, offset_a);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, 4096, PROT_READ, MAP_SHAR=
ED, A, offset_a);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(ptr =3D=3D MAP_FAILED);<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; @@ -400,7 +400,7 @@ test_close_race(int i915)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0const int ncpus =3D sysconf(_SC_NPRO=
CESSORS_ONLN);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *handles;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0handles =3D mmap64(0, 4096, PROT_WRITE, M=
AP_SHARED | MAP_ANON, -1,<br>
&gt; &gt; 0);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0handles =3D mmap(0, 4096, PROT_WRITE, MAP=
_SHARED | MAP_ANON, -1, 0);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(handles !=3D MAP_FAILED);=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus + 1) {<br>
&gt; &gt; &gt; &gt; @@ -418,7 +418,7 @@ test_close_race(int i915)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mmap_arg) !=3D =
-1) {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *ptr;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PROT_WRITE, MAP_SHARED, i915,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 mmap_arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr !=3D MAP_FAILED) {<=
br>
&gt; &gt; &gt; &gt; @@ -444,7 +444,7 @@ test_flink_race(int i915)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0const int ncpus =3D sysconf(_SC_NPRO=
CESSORS_ONLN);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *handles;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0handles =3D mmap64(0, 4096, PROT_WRITE, M=
AP_SHARED | MAP_ANON, -1,<br>
&gt; &gt; 0);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0handles =3D mmap(0, 4096, PROT_WRITE, MAP=
_SHARED | MAP_ANON, -1, 0);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(handles !=3D MAP_FAILED);=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus + 1) {<br>
&gt; &gt; &gt; &gt; @@ -469,7 +469,7 @@ test_flink_race(int i915)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mmap_arg) !=3D =
-1) {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *ptr;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PROT_WRITE, MAP_SHARED, fd,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 mmap_arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr !=3D MAP_FAILED) {<=
br>
&gt; &gt; &gt; &gt; diff --git a/tests/i915/gem_mmap_offset.c<br>
&gt; &gt; b/tests/i915/gem_mmap_offset.c<br>
&gt; &gt; &gt; &gt; index 5781b2fb..0933ed94 100644<br>
&gt; &gt; &gt; &gt; --- a/tests/i915/gem_mmap_offset.c<br>
&gt; &gt; &gt; &gt; +++ b/tests/i915/gem_mmap_offset.c<br>
&gt; &gt; &gt; &gt; @@ -66,7 +66,7 @@ __mmap_offset(int i915, uint32_t hand=
le, uint64_t<br>
&gt; &gt; offset, uint64_t size,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if (mmap_offset_ioctl(i915, &amp;arg=
))<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return N=
ULL;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0ptr =3D mmap64(0, size, prot, MAP_SHARED,=
 i915, arg.offset + offset);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0ptr =3D mmap(0, size, prot, MAP_SHARED, i=
915, arg.offset + offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if (ptr =3D=3D MAP_FAILED)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D =
NULL;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; &gt; &gt; @@ -214,12 +214,12 @@ static void isolation(int i915)<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 t-&gt;name, B, b, offset_b);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =
=3D 0;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap6=
4(0, 4096, PROT_READ, MAP_SHARED, i915,<br>
&gt; &gt; offset_a);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(=
0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_asse=
rt(ptr =3D=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_asse=
rt_eq(errno, EACCES);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =
=3D 0;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap6=
4(0, 4096, PROT_READ, MAP_SHARED, i915,<br>
&gt; &gt; offset_b);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(=
0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_asse=
rt(ptr =3D=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_asse=
rt_eq(errno, EACCES);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; @@ -237,13 +237,13 @@ static void isolation(int i915)<b=
r>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(B)=
;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap6=
4(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(=
0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_asse=
rt(ptr !=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0munmap(p=
tr, 4096);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(A)=
;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap6=
4(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(=
0, 4096, PROT_READ, MAP_SHARED, A, offset_a);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0igt_asse=
rt(ptr =3D=3D MAP_FAILED);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; @@ -401,7 +401,7 @@ static void close_race(int i915, in=
t timeout)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0_Atomic uint32_t *handles;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0size_t len =3D ALIGN((ncpus + 1) * s=
izeof(uint32_t), 4096);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0handles =3D mmap64(0, len, PROT_WRITE, MA=
P_SHARED | MAP_ANON, -1, 0);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0handles =3D mmap(0, len, PROT_WRITE, MAP_=
SHARED | MAP_ANON, -1, 0);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_assert(handles !=3D MAP_FAILED);=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0igt_fork(child, ncpus + 1) {<br>
&gt; &gt; &gt; &gt; @@ -420,7 +420,7 @@ static void close_race(int i915, in=
t timeout)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mmap_arg) !=3D =
-1) {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *ptr;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap64(0, 4096,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D mmap(0, 4096,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PROT_WRITE, MAP_SHARED, i915,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 mmap_arg.offset);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ptr !=3D MAP_FAILED) {<=
br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; 2.37.3<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div>

--0000000000000e3deb05e9c2f4fd--
