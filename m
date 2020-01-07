Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <65f5226b-9f8d-9442-1131-4c4768cfa41c@linux.intel.com>
References: <20200104153746.2175482-1-chris@chris-wilson.co.uk>
 <20200105010643.2207837-1-chris@chris-wilson.co.uk>
 <65f5226b-9f8d-9442-1131-4c4768cfa41c@linux.intel.com>
Message-ID: <157839316240.2273.2749522722629040780@skylake-alporthouse-com>
Date: Tue, 07 Jan 2020 10:32:42 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Find the associated
 perf-type for a particular device
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-01-07 09:53:39)
> 
> +Arek, Saurabhg
> 
> On 05/01/2020 01:06, Chris Wilson wrote:
> > Since with multiple devices, we may have multiple different perf_pmu
> > each with their own type, we want to find the right one for the job.
> > 
> > The tests are run with a specific fd, from which we can extract the
> > appropriate bus-id and find the associated perf-type. The performance
> > monitoring tools are a little more general and not yet ready to probe
> > all device or bind to one in particular, so we just assume the default
> > igfx for the time being.
> > 
> > v2: Extract the bus address from out of sysfs
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: "Robert M. Fosha" <robert.m.fosha@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >   benchmarks/gem_wsim.c          |  4 +-
> >   lib/igt_perf.c                 | 84 +++++++++++++++++++++++++++++++---
> >   lib/igt_perf.h                 | 13 ++++--
> >   overlay/gem-interrupts.c       |  2 +-
> >   overlay/gpu-freq.c             |  4 +-
> >   overlay/gpu-top.c              | 12 ++---
> >   overlay/rc6.c                  |  2 +-
> >   tests/i915/gem_ctx_freq.c      |  2 +-
> >   tests/i915/gem_ctx_sseu.c      |  2 +-
> >   tests/i915/gem_exec_balancer.c | 18 +++++---
> >   tests/perf_pmu.c               | 84 ++++++++++++++++++----------------
> >   tools/intel_gpu_top.c          |  2 +-
> >   12 files changed, 159 insertions(+), 70 deletions(-)
> > 
> > diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> > index 6305e0d7a..9156fdc90 100644
> > --- a/benchmarks/gem_wsim.c
> > +++ b/benchmarks/gem_wsim.c
> > @@ -2268,8 +2268,8 @@ busy_init(const struct workload_balancer *balancer, struct workload *wrk)
> >       for (d = &engines[0]; d->id != VCS; d++) {
> >               int pfd;
> >   
> > -             pfd = perf_i915_open_group(I915_PMU_ENGINE_BUSY(d->class,
> > -                                                             d->inst),
> > +             pfd = perf_igfx_open_group(I915_PMU_ENGINE_BUSY(d->class,
> > +                                                             d->inst),
> >                                          bb->fd);
> >               if (pfd < 0) {
> >                       if (d->id != VCS2)
> > diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> > index e3dec2cc2..840add043 100644
> > --- a/lib/igt_perf.c
> > +++ b/lib/igt_perf.c
> > @@ -4,17 +4,77 @@
> >   #include <stdlib.h>
> >   #include <string.h>
> >   #include <errno.h>
> > +#include <sys/stat.h>
> >   #include <sys/sysinfo.h>
> > +#include <sys/sysmacros.h>
> >   
> >   #include "igt_perf.h"
> >   
> > -uint64_t i915_type_id(void)
> > +static char *bus_address(int i915, char *path, int pathlen)
> > +{
> > +     struct stat st;
> > +     int len = -1;
> > +     int dir;
> > +     char *s;
> > +
> > +     if (fstat(i915, &st) || !S_ISCHR(st.st_mode))
> > +             return NULL;
> > +
> > +     snprintf(path, pathlen, "/sys/dev/char/%d:%d",
> > +              major(st.st_rdev), minor(st.st_rdev));
> > +
> > +     dir = open(path, O_RDONLY);
> > +     if (dir != -1) {
> > +             len = readlinkat(dir, "device", path, pathlen - 1);
> > +             close(dir);
> > +     }
> > +     if (len < 0)
> > +             return NULL;
> > +
> > +     path[len] = '\0';
> > +
> > +     /* strip off the relative path */
> > +     s = strrchr(path, '/');
> > +     if (s)
> > +             memmove(path, s + 1, len - (s - path) + 1);
> > +
> > +     return path;
> > +}
> > +
> > +const char *i915_perf_device(int i915, char *buf, int buflen)
> > +{
> > +#define prefix "i915-"
> > +#define plen strlen(prefix)
> > +
> > +     if (!buf || buflen < plen)
> > +             return "i915";
> > +
> > +     memcpy(buf, prefix, plen);
> > +
> > +     if (!bus_address(i915, buf + plen, buflen - plen) ||
> > +         strcmp(buf + plen, "0000:00:02.0") == 0) /* legacy name for igfx */
> > +             buf[plen - 1] = '\0';
> > +
> > +     return buf;
> > +}
> 
> So DRM fd -> PCI string conversion, yes? On a glance it looks okay. 
> However Arek probably has this data as part of "[PATCH i-g-t 0/4] device 
> selection && lsgpu" (https://patchwork.freedesktop.org/series/70285/).

If the string is known, we can use it. This simple routine is *simple*
yet effective :)
 
> Also:
> 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/52
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/51

How lightweight are they aiming to be?
 
> And VLK-5588.
> 
> This patch is overlap with #52 and then #51/VLK-5588 is about allowing 
> card selection for tools.
> 
> How to meld the two with minimum effort? We could put this in and then 
> later replace the PCI name resolve with a library routine and re-adjust 
> tools to allow card selection via some mechanism.

Exactly. All we need here is a name to lookup the perf type id. One
routine to provide an introspection method for a given fd and assumption
of i915, does not prevent better methods :)

I do wonder though if we should have perf_name in our sysfs.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
