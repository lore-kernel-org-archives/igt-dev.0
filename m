Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Sat, 29 Feb 2020 14:45:27 +0200
From: Andi Shyti <andi@etezian.org>
Message-ID: <20200229124527.GG11891@jack.zhora.eu>
References: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
 <20200228104340.2895082-3-chris@chris-wilson.co.uk>
 <20200228232704.GD11891@jack.zhora.eu>
 <158293277426.29794.2343133378704199477@skylake-alporthouse-com>
 <20200228235124.GF11891@jack.zhora.eu>
 <158297170388.24106.996217556546669029@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158297170388.24106.996217556546669029@skylake-alporthouse-com>
Subject: Re: [Intel-gfx] [PATCH i-g-t 3/5] i915: Exercise preemption timeout
 controls in sysfs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

> > > > > +     char buf[512];
> > > > > +     int len;
> > > > > +
> > > > > +     lseek(engines, 0, SEEK_SET);
> > > > > +     while ((len = syscall(SYS_getdents64, engines, buf, sizeof(buf))) > 0) {
> > > > > +             void *ptr = buf;
> > > > > +
> > > > > +             while (len) {
> > > > > +                     struct linux_dirent64 {
> > > > > +                             ino64_t        d_ino;
> > > > > +                             off64_t        d_off;
> > > > > +                             unsigned short d_reclen;
> > > > > +                             unsigned char  d_type;
> > > > > +                             char           d_name[];
> > > > > +                     } *de = ptr;
> > > > 
> > > > what is the need for having your own linux_dirent64?
> > > 
> > > fdopendir() takes ownership of the fd, preventing reuse. And
> > > fdopendir(dup()) is getting ridiculous.
> > 
> > why not using dirent64?
> 
> It's still the same problem that it takes a DIR, assuming ownership of
> the fd. Why using linux_dirent64 because the manpage says so -- if you
> are going to use the syscall, you need to match it's calling
> conventions, not a middleman's.

I understand, but in bits/dirent.h there is, with some
assumptions, this part:

#ifdef __USE_LARGEFILE64
struct dirent64
  {
    __ino64_t d_ino;
    __off64_t d_off;
    unsigned short int d_reclen;
    unsigned char d_type;
    char d_name[256];           /* We must not include limits.h! */
  };
#endif

why redefine a struct linux_dirent64?

Andi

PS We have time until Monday morning to discuss this, right? :)
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
