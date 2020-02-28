Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Sat, 29 Feb 2020 01:51:24 +0200
From: Andi Shyti <andi@etezian.org>
Message-ID: <20200228235124.GF11891@jack.zhora.eu>
References: <20200228104340.2895082-1-chris@chris-wilson.co.uk>
 <20200228104340.2895082-3-chris@chris-wilson.co.uk>
 <20200228232704.GD11891@jack.zhora.eu>
 <158293277426.29794.2343133378704199477@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158293277426.29794.2343133378704199477@skylake-alporthouse-com>
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

> > > +void dyn_sysfs_engines(int i915, int engines, const char *file,
> > > +                    void (*test)(int, int))
> > > +{
> > > +     char buf[512];
> > > +     int len;
> > > +
> > > +     lseek(engines, 0, SEEK_SET);
> > > +     while ((len = syscall(SYS_getdents64, engines, buf, sizeof(buf))) > 0) {
> > > +             void *ptr = buf;
> > > +
> > > +             while (len) {
> > > +                     struct linux_dirent64 {
> > > +                             ino64_t        d_ino;
> > > +                             off64_t        d_off;
> > > +                             unsigned short d_reclen;
> > > +                             unsigned char  d_type;
> > > +                             char           d_name[];
> > > +                     } *de = ptr;
> > 
> > what is the need for having your own linux_dirent64?
> 
> fdopendir() takes ownership of the fd, preventing reuse. And
> fdopendir(dup()) is getting ridiculous.

why not using dirent64?

Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
