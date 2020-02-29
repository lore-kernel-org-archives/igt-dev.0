Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200229124527.GG11891@jack.zhora.eu>
References: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
 <20200228104340.2895082-3-chris@chris-wilson.co.uk>
 <20200228232704.GD11891@jack.zhora.eu>
 <158293277426.29794.2343133378704199477@skylake-alporthouse-com>
 <20200228235124.GF11891@jack.zhora.eu>
 <158297170388.24106.996217556546669029@skylake-alporthouse-com>
 <20200229124527.GG11891@jack.zhora.eu>
Message-ID: <158300128989.24106.4887554530878236232@skylake-alporthouse-com>
Date: Sat, 29 Feb 2020 18:34:49 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 3/5] i915: Exercise
 preemption timeout controls in sysfs
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
To: Andi Shyti <andi@etezian.org>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Andi Shyti (2020-02-29 12:45:27)
> > > > > > +     char buf[512];
> > > > > > +     int len;
> > > > > > +
> > > > > > +     lseek(engines, 0, SEEK_SET);
> > > > > > +     while ((len = syscall(SYS_getdents64, engines, buf, sizeof(buf))) > 0) {
> > > > > > +             void *ptr = buf;
> > > > > > +
> > > > > > +             while (len) {
> > > > > > +                     struct linux_dirent64 {
> > > > > > +                             ino64_t        d_ino;
> > > > > > +                             off64_t        d_off;
> > > > > > +                             unsigned short d_reclen;
> > > > > > +                             unsigned char  d_type;
> > > > > > +                             char           d_name[];
> > > > > > +                     } *de = ptr;
> > > > > 
> > > > > what is the need for having your own linux_dirent64?
> > > > 
> > > > fdopendir() takes ownership of the fd, preventing reuse. And
> > > > fdopendir(dup()) is getting ridiculous.
> > > 
> > > why not using dirent64?
> > 
> > It's still the same problem that it takes a DIR, assuming ownership of
> > the fd. Why using linux_dirent64 because the manpage says so -- if you
> > are going to use the syscall, you need to match it's calling
> > conventions, not a middleman's.
> 
> I understand, but in bits/dirent.h there is, with some
> assumptions, this part:
> 
> #ifdef __USE_LARGEFILE64
> struct dirent64
>   {
>     __ino64_t d_ino;
>     __off64_t d_off;
>     unsigned short int d_reclen;
>     unsigned char d_type;
>     char d_name[256];           /* We must not include limits.h! */
>   };
> #endif
> 
> why redefine a struct linux_dirent64?

Because the manpage didn't mention that!
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
