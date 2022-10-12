Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E561010E4E3
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 13:29:41 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id s185so4267850vkb.0
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 06:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221007232757.3210308-1-jfree@freebsd.org>
 <20221007232757.3210308-2-jfree@freebsd.org>
 <Y0U5RumOStuAmibz@kamilkon-desk1>
In-Reply-To: <Y0U5RumOStuAmibz@kamilkon-desk1>
From: Jake Freeland <jake@technologyfriends.net>
Date: Wed, 12 Oct 2022 08:29:30 -0500
Message-ID: <CAOgZAGatwjMGWjRks7ZBVvLwgZ9FGMs+Ah_u8Rog=Sx+2MPTRA@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jake Freeland <jake@technologyfriends.net>, Jake Freeland <jfree@freebsd.org>,
 Petri Latvala <petri.latvala@intel.com>
Content-Type: multipart/alternative; boundary="0000000000008e2cb305ead66290"
Subject: Re: [igt-dev] [PATCH i-g-t v1 1/6] lib/igt_freebsd.h: Create
 FreeBSD compatibility header
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

--0000000000008e2cb305ead66290
Content-Type: text/plain; charset="UTF-8"

Kamil,

I will be sure to Cc another set of eyes onto the patchset next time,
preferrably
another FreeBSD committer. Thank you again for the advice.

Jake Freeland

On Tue, Oct 11, 2022 at 4:37 AM Kamil Konieczny <
kamil.konieczny@linux.intel.com> wrote:

> Hi Jake,
>
> On 2022-10-07 at 18:27:52 -0500, Jake Freeland wrote:
> > This header attempts to be a simple drop-in to enable FreeBSD
> > support in a given source file. It includes macro substitutions
> > that replace Linux-specific phrases with their FreeBSD equivalents.
> >
> > Signed-off-by: Jake Freeland <jfree@freebsd.org>
>
> Your patchset got merged but please in future ask someone from
> FreeBSD community for review of changes related to FreeBSD.
>
> Ideally, if you know who might review it, put that person on Cc
> just before your s-b, so it will look like
>
> Cc: Name Here <e-mail-address_from_freebsd.org>
> Signed-off-by: Jake Freeland <jfree@freebsd.org>
>
> btw this is only example, it may outside from freebsd.org
>
> Regards,
> Kamil
>
> > ---
> >  lib/igt_core.h    |   4 ++
> >  lib/igt_freebsd.h | 118 ++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 122 insertions(+)
> >  create mode 100644 lib/igt_freebsd.h
> >
> > diff --git a/lib/igt_core.h b/lib/igt_core.h
> > index f21723de..a6b4b5ae 100644
> > --- a/lib/igt_core.h
> > +++ b/lib/igt_core.h
> > @@ -43,6 +43,10 @@
> >  #include <getopt.h>
> >  #include <unistd.h>
> >
> > +#ifdef __FreeBSD__
> > +#include "igt_freebsd.h"
> > +#endif
> > +
> >  #ifndef IGT_LOG_DOMAIN
> >  #define IGT_LOG_DOMAIN (NULL)
> >  #endif
> > diff --git a/lib/igt_freebsd.h b/lib/igt_freebsd.h
> > new file mode 100644
> > index 00000000..53fa8fb6
> > --- /dev/null
> > +++ b/lib/igt_freebsd.h
> > @@ -0,0 +1,118 @@
> > +/*
> > + * SPDX-License-Identifier: MIT
> > + *
> > + * Copyright (c) 2022, Jake Freeland <jfree@FreeBSD.org>
> > + */
> > +
> > +#if !defined(IGT_FREEBSD_H)
> > +
> > +#if !defined(__FreeBSD__)
> > +#error "This header is only for FreeBSD platform."
> > +#endif
> > +
> > +#define IGT_FREEBSD_H
> > +
> > +#include <sys/consio.h>
> > +#include <sys/endian.h>
> > +#include <sys/errno.h>
> > +#include <sys/mman.h>
> > +#include <sys/mount.h>
> > +#include <sys/sched.h>
> > +#include <sys/types.h>
> > +#include <sys/wait.h>
> > +#include <sys/watchdog.h>
> > +
> > +#include <libgen.h>
> > +#include <limits.h>
> > +#include <pthread.h>
> > +#include <setjmp.h>
> > +#include <signal.h>
> > +#include <unistd.h>
> > +
> > +/*
> > + * Proper substitutions:
> > + * The following macros replace Linux-specific functions
> > + * and macros with their FreeBSD equivalents.
> > + */
> > +
> > +typedef      int32_t         __s32;
> > +typedef      uint32_t        __u32;
> > +typedef      uint64_t        __u64;
> > +
> > +typedef      ino_t           ino64_t;
> > +typedef      sig_t           sighandler_t;
> > +
> > +#define      jmp_buf sigjmp_buf
> > +
> > +#define      PTRACE_TRACEME  PT_TRACE_ME
> > +#define      PTRACE_ATTACH   PT_ATTACH
> > +#define      PTRACE_PEEKDATA PT_READ_D
> > +#define      PTRACE_POKEDATA PT_WRITE_D
> > +#define      PTRACE_DETACH   PT_DETACH
> > +
> > +#define      I2C_RDWR                I2CRDWR
> > +#define      I2C_M_RD                IIC_M_RD
> > +#define      i2c_msg                 iic_msg
> > +#define      i2c_rdwr_ioctl_data     iic_rdwr_data
> > +
> > +#define      bswap_32(x)     bswap32(x)
> > +
> > +#define      _IOC_TYPE(nr)   (((nr) >> 8) & 255)
> > +
> > +#define      SYS_getdents64  SYS_freebsd11_getdents
> > +
> > +#define      mount(src, dest, fstype, flags, data)   \
> > +     mount(fstype, dest, flags, data)
> > +
> > +/*
> > + * Improper substitutions:
> > + * The following macros are temporary replacements for functions
> > + * and macros that exist on Linux and do not exist on FreeBSD.
> > + */
> > +
> > +#define      ETIME   ETIMEDOUT
> > +
> > +#define      MAP_POPULATE    MAP_PREFAULT_READ
> > +
> > +#define      MADV_HUGEPAGE   MADV_SEQUENTIAL
> > +#define      MADV_DONTFORK   MADV_NOSYNC
> > +
> > +#define      WDIOC_KEEPALIVE WDIOCPATPAT
> > +
> > +#define      SCHED_RESET_ON_FORK     0
> > +#define      SCHED_IDLE      SCHED_OTHER
> > +
> > +#define      gettid()        getpid()
> > +
> > +#define      pthread_sigqueue(pid, signo, value)     \
> > +     sigqueue(pid, signo, value)
> > +
> > +#define      signalfd(fd, mask, flags)       -ENOSYS
> > +#define      timerfd_create(c, f)            -ENOSYS
> > +#define      timerfd_settime(fd, f, n, o)    -ENOSYS
> > +
> > +/*
> > + * Macro conflict resolution.
> > + */
> > +
> > +#undef       ALIGN
> > +#undef       PAGE_SIZE
> > +
> > +/*
> > + * Missing Linux structures.
> > + */
> > +
> > +struct signalfd_siginfo {
> > +     uint32_t ssi_signo;
> > +     uint32_t ssi_pid;
> > +};
> > +
> > +struct kmod_module {
> > +     size_t size;
> > +};
> > +
> > +typedef struct {
> > +     char state;
> > +} proc_t;
> > +
> > +#endif /* IGT_FREEBSD_H */
> > --
> > 2.37.3
> >
>

--0000000000008e2cb305ead66290
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Kamil,<div><br></div><div>I will be sure to Cc another set=
 of eyes onto the patchset next time, preferrably</div><div>another FreeBSD=
 committer. Thank you again for the advice.</div><div><br></div><div>Jake F=
reeland</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Oct 11, 2022 at 4:37 AM Kamil Konieczny &lt;<a href=3D=
"mailto:kamil.konieczny@linux.intel.com">kamil.konieczny@linux.intel.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi =
Jake,<br>
<br>
On 2022-10-07 at 18:27:52 -0500, Jake Freeland wrote:<br>
&gt; This header attempts to be a simple drop-in to enable FreeBSD<br>
&gt; support in a given source file. It includes macro substitutions<br>
&gt; that replace Linux-specific phrases with their FreeBSD equivalents.<br=
>
&gt; <br>
&gt; Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfree@freebsd.org" =
target=3D"_blank">jfree@freebsd.org</a>&gt;<br>
<br>
Your patchset got merged but please in future ask someone from<br>
FreeBSD community for review of changes related to FreeBSD.<br>
<br>
Ideally, if you know who might review it, put that person on Cc<br>
just before your s-b, so it will look like<br>
<br>
Cc: Name Here &lt;<a href=3D"http://e-mail-address_from_freebsd.org" rel=3D=
"noreferrer" target=3D"_blank">e-mail-address_from_freebsd.org</a>&gt;<br>
Signed-off-by: Jake Freeland &lt;<a href=3D"mailto:jfree@freebsd.org" targe=
t=3D"_blank">jfree@freebsd.org</a>&gt;<br>
<br>
btw this is only example, it may outside from <a href=3D"http://freebsd.org=
" rel=3D"noreferrer" target=3D"_blank">freebsd.org</a><br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; ---<br>
&gt;=C2=A0 lib/igt_core.h=C2=A0 =C2=A0 |=C2=A0 =C2=A04 ++<br>
&gt;=C2=A0 lib/igt_freebsd.h | 118 ++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 2 files changed, 122 insertions(+)<br>
&gt;=C2=A0 create mode 100644 lib/igt_freebsd.h<br>
&gt; <br>
&gt; diff --git a/lib/igt_core.h b/lib/igt_core.h<br>
&gt; index f21723de..a6b4b5ae 100644<br>
&gt; --- a/lib/igt_core.h<br>
&gt; +++ b/lib/igt_core.h<br>
&gt; @@ -43,6 +43,10 @@<br>
&gt;=C2=A0 #include &lt;getopt.h&gt;<br>
&gt;=C2=A0 #include &lt;unistd.h&gt;<br>
&gt;=C2=A0 <br>
&gt; +#ifdef __FreeBSD__<br>
&gt; +#include &quot;igt_freebsd.h&quot;<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 #ifndef IGT_LOG_DOMAIN<br>
&gt;=C2=A0 #define IGT_LOG_DOMAIN (NULL)<br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/lib/igt_freebsd.h b/lib/igt_freebsd.h<br>
&gt; new file mode 100644<br>
&gt; index 00000000..53fa8fb6<br>
&gt; --- /dev/null<br>
&gt; +++ b/lib/igt_freebsd.h<br>
&gt; @@ -0,0 +1,118 @@<br>
&gt; +/*<br>
&gt; + * SPDX-License-Identifier: MIT<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022, Jake Freeland &lt;jfree@FreeBSD.org&gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +#if !defined(IGT_FREEBSD_H)<br>
&gt; +<br>
&gt; +#if !defined(__FreeBSD__)<br>
&gt; +#error &quot;This header is only for FreeBSD platform.&quot;<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#define IGT_FREEBSD_H<br>
&gt; +<br>
&gt; +#include &lt;sys/consio.h&gt;<br>
&gt; +#include &lt;sys/endian.h&gt;<br>
&gt; +#include &lt;sys/errno.h&gt;<br>
&gt; +#include &lt;sys/mman.h&gt;<br>
&gt; +#include &lt;sys/mount.h&gt;<br>
&gt; +#include &lt;sys/sched.h&gt;<br>
&gt; +#include &lt;sys/types.h&gt;<br>
&gt; +#include &lt;sys/wait.h&gt;<br>
&gt; +#include &lt;sys/watchdog.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;libgen.h&gt;<br>
&gt; +#include &lt;limits.h&gt;<br>
&gt; +#include &lt;pthread.h&gt;<br>
&gt; +#include &lt;setjmp.h&gt;<br>
&gt; +#include &lt;signal.h&gt;<br>
&gt; +#include &lt;unistd.h&gt;<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Proper substitutions:<br>
&gt; + * The following macros replace Linux-specific functions<br>
&gt; + * and macros with their FreeBSD equivalents.<br>
&gt; + */<br>
&gt; +<br>
&gt; +typedef=C2=A0 =C2=A0 =C2=A0 int32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
__s32;<br>
&gt; +typedef=C2=A0 =C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32=
;<br>
&gt; +typedef=C2=A0 =C2=A0 =C2=A0 uint64_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64=
;<br>
&gt; +<br>
&gt; +typedef=C2=A0 =C2=A0 =C2=A0 ino_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ino64_t;<br>
&gt; +typedef=C2=A0 =C2=A0 =C2=A0 sig_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0sighandler_t;<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 jmp_buf sigjmp_buf<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 PTRACE_TRACEME=C2=A0 PT_TRACE_ME<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 PTRACE_ATTACH=C2=A0 =C2=A0PT_ATTACH<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 PTRACE_PEEKDATA PT_READ_D<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 PTRACE_POKEDATA PT_WRITE_D<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 PTRACE_DETACH=C2=A0 =C2=A0PT_DETACH<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 I2C_RDWR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 I2CRDWR<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 I2C_M_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 IIC_M_RD<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 i2c_msg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0iic_msg<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 i2c_rdwr_ioctl_data=C2=A0 =C2=A0 =C2=A0ii=
c_rdwr_data<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 bswap_32(x)=C2=A0 =C2=A0 =C2=A0bswap32(x)=
<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 _IOC_TYPE(nr)=C2=A0 =C2=A0(((nr) &gt;&gt;=
 8) &amp; 255)<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 SYS_getdents64=C2=A0 SYS_freebsd11_getden=
ts<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 mount(src, dest, fstype, flags, data)=C2=
=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mount(fstype, dest, flags, data)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Improper substitutions:<br>
&gt; + * The following macros are temporary replacements for functions<br>
&gt; + * and macros that exist on Linux and do not exist on FreeBSD.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 ETIME=C2=A0 =C2=A0ETIMEDOUT<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 MAP_POPULATE=C2=A0 =C2=A0 MAP_PREFAULT_RE=
AD<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 MADV_HUGEPAGE=C2=A0 =C2=A0MADV_SEQUENTIAL=
<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 MADV_DONTFORK=C2=A0 =C2=A0MADV_NOSYNC<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 WDIOC_KEEPALIVE WDIOCPATPAT<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 SCHED_RESET_ON_FORK=C2=A0 =C2=A0 =C2=A00<=
br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 SCHED_IDLE=C2=A0 =C2=A0 =C2=A0 SCHED_OTHE=
R<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 gettid()=C2=A0 =C2=A0 =C2=A0 =C2=A0 getpi=
d()<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 pthread_sigqueue(pid, signo, value)=C2=A0=
 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sigqueue(pid, signo, value)<br>
&gt; +<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 signalfd(fd, mask, flags)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0-ENOSYS<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 timerfd_create(c, f)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 -ENOSYS<br>
&gt; +#define=C2=A0 =C2=A0 =C2=A0 timerfd_settime(fd, f, n, o)=C2=A0 =C2=A0=
 -ENOSYS<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Macro conflict resolution.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#undef=C2=A0 =C2=A0 =C2=A0 =C2=A0ALIGN<br>
&gt; +#undef=C2=A0 =C2=A0 =C2=A0 =C2=A0PAGE_SIZE<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Missing Linux structures.<br>
&gt; + */<br>
&gt; +<br>
&gt; +struct signalfd_siginfo {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint32_t ssi_signo;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint32_t ssi_pid;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct kmod_module {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t size;<br>
&gt; +};<br>
&gt; +<br>
&gt; +typedef struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char state;<br>
&gt; +} proc_t;<br>
&gt; +<br>
&gt; +#endif /* IGT_FREEBSD_H */<br>
&gt; -- <br>
&gt; 2.37.3<br>
&gt; <br>
</blockquote></div>

--0000000000008e2cb305ead66290--
