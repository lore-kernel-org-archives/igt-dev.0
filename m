Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EE86EC35
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Mar 2021 21:06:48 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id u4so4904384edv.9
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Mar 2021 13:06:48 -0800 (PST)
MIME-Version: 1.0
References: <CAOFGe96q2QR8zm3UgUYGRcz_1C0H=yUe2S=5FNmR4V0tqCZU0g@mail.gmail.com>
 <87ft11tndw.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87ft11tndw.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 11 Mar 2021 15:06:36 -0600
Message-ID: <CAOFGe95n2A93bhk2EGMqb42-8BHwr1W91Hbg57TdY6ztwsuq3w@mail.gmail.com>
Subject: Re: [igt-dev] [i-g-t] lib/ioctl_wrappers: Keep IGT working without
 pread/pwrite ioctls
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 3:02 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Thu, 11 Mar 2021 12:47:41 -0800, Jason Ekstrand wrote:
> > > diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> > > index 45415621b7..4440004c42 100644
> > > --- a/lib/ioctl_wrappers.c
> > > +++ b/lib/ioctl_wrappers.c
> > > @@ -56,6 +56,7 @@
> > >  #include "igt_debugfs.h"
> > >  #include "igt_sysfs.h"
> > >  #include "config.h"
> > > +#include "i915/gem_mman.h"
> > >
> > >  #ifdef HAVE_VALGRIND
> > >  #include <valgrind/valgrind.h>
> > > @@ -324,6 +325,70 @@ void gem_close(int fd, uint32_t handle)
> > >      do_ioctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo);
> > >  }
> > >
> > > +static bool is_cache_coherent(int fd, uint32_t handle)
> > > +{
> > > +    return gem_get_caching(fd, handle) != I915_CACHING_NONE;
> > > +}
> > > +
> > > +static void mmap_write(int fd, uint32_t handle, uint64_t offset,
> > > +               const void *buf, uint64_t length)
> > > +{
> > > +    void *map = NULL;
> > > +
> > > +    if (!length)
> > > +        return;
> > > +
> > > +    if (is_cache_coherent(fd, handle)) {
> > > +        /* offset arg for mmap functions must be 0 */
> > > +        map = __gem_mmap__cpu_coherent(fd, handle, 0, offset + length,
> > > +                           PROT_READ | PROT_WRITE);
> > > +        if (map)
> > > +            gem_set_domain(fd, handle,
> > > +                       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
> >
> > Not sure how much it matters for IGT but the pread/pwrite ioctls
> > appear to always leave the BO in the GTT domain.
>
> It probably doesn't matter. This code here is actually copied from lib/intel_bufops.c:
>
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/intel_bufops.c#L423
>
> Because it has been tested and verified to work and because it is already
> used elsewhere my preference would be to leave as is unless you think
> otherwise? Thanks.

Fine with me.  I'm mostly asking questions here, not really having opinions. :-)

--Jason
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
