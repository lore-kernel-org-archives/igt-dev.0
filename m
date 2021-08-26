Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 26 Aug 2021 08:14:47 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YScjRzlv6VYySDdP@platvala-desk.ger.corp.intel.com>
References: <20210824224932.564352-1-robdclark@gmail.com>
 <20210824224932.564352-3-robdclark@gmail.com>
 <YSYDsJXPPZgTMYzR@platvala-desk.ger.corp.intel.com>
 <CAF6AEGtMwFOoTJW_zadN0d9v8+KCaS4PxKyEt485SXV7xU6uhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGtMwFOoTJW_zadN0d9v8+KCaS4PxKyEt485SXV7xU6uhA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH igt 2/3] msm: Add helper library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>
Cc: igt-dev@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jordan Crouse <jordan@cosmicpenguin.net>, Akhil P Oommen <akhilpo@codeaurora.org>, Rob Clark <robdclark@chromium.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 25, 2021 at 08:37:39AM -0700, Rob Clark wrote:
> On Wed, Aug 25, 2021 at 1:44 AM Petri Latvala <petri.latvala@intel.com> w=
rote:
> >
> > On Tue, Aug 24, 2021 at 03:49:31PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Handle some of the boilerplate for tests.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  lib/igt_msm.c   | 163 ++++++++++++++++++++++++++++++++++++++++++++++=
++
> > >  lib/igt_msm.h   | 128 +++++++++++++++++++++++++++++++++++++
> > >  lib/meson.build |   1 +
> > >  3 files changed, 292 insertions(+)
> > >  create mode 100644 lib/igt_msm.c
> > >  create mode 100644 lib/igt_msm.h
> > >
> > > diff --git a/lib/igt_msm.c b/lib/igt_msm.c
> > > new file mode 100644
> > > index 00000000..1bcb08d9
> > > --- /dev/null
> > > +++ b/lib/igt_msm.c
> > > @@ -0,0 +1,163 @@
> > > +/*
> > > + * Copyright =A9 2021 Google, Inc.
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtai=
ning a
> > > + * copy of this software and associated documentation files (the "So=
ftware"),
> > > + * to deal in the Software without restriction, including without li=
mitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, subl=
icense,
> > > + * and/or sell copies of the Software, and to permit persons to whom=
 the
> > > + * Software is furnished to do so, subject to the following conditio=
ns:
> > > + *
> > > + * The above copyright notice and this permission notice (including =
the next
> > > + * paragraph) shall be included in all copies or substantial portion=
s of the
> > > + * Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVEN=
T SHALL
> > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR OTHER
> > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, A=
RISING
> > > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTH=
ER DEALINGS
> > > + * IN THE SOFTWARE.
> > > + */
> > > +
> > > +#include <assert.h>
> > > +#include <string.h>
> > > +#include <signal.h>
> > > +#include <errno.h>
> > > +#include <sys/mman.h>
> > > +#include <sys/types.h>
> > > +#include <sys/stat.h>
> > > +#include <sys/ioctl.h>
> > > +#include <fcntl.h>
> > > +
> > > +#include "drmtest.h"
> > > +#include "igt_aux.h"
> > > +#include "igt_core.h"
> > > +#include "igt_msm.h"
> > > +#include "ioctl_wrappers.h"
> > > +
> > > +/**
> > > + * SECTION:igt_msm
> > > + * @short_description: msm support library
> > > + * @title: msm
> > > + * @include: igt_msm.h
> > > + *
> > > + * This library provides various auxiliary helper functions for writ=
ing msm
> > > + * tests.
> > > + */
> > > +
> > > +struct msm_device *
> > > +igt_msm_dev_open(void)
> > > +{
> > > +     struct msm_device *dev =3D calloc(1, sizeof(*dev));
> > > +
> > > +     dev->fd =3D drm_open_driver_render(DRIVER_MSM);
> > > +     if (dev->fd < 0) {
> > > +             free(dev);
> > > +             return NULL;
> > > +     }
> > > +
> > > +     return dev;
> > > +}
> > > +
> > > +void
> > > +igt_msm_dev_close(struct msm_device *dev)
> > > +{
> > > +     close(dev->fd);
> > > +     free(dev);
> > > +}
> > > +
> > > +struct msm_bo *
> > > +igt_msm_bo_new(struct msm_device *dev, size_t size, uint32_t flags)
> > > +{
> > > +     struct msm_bo *bo =3D calloc(1, sizeof(*bo));
> > > +
> > > +     struct drm_msm_gem_new req =3D {
> > > +                     .size =3D size,
> > > +                     .flags =3D flags,
> > > +     };
> > > +
> > > +     bo->dev =3D dev;
> > > +     bo->size =3D size;
> > > +
> > > +     do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req);
> > > +
> > > +     bo->handle =3D req.handle;
> > > +
> > > +     return bo;
> > > +}
> > > +
> > > +void
> > > +igt_msm_bo_free(struct msm_bo *bo)
> > > +{
> > > +     if (bo->map)
> > > +             munmap(bo->map, bo->size);
> > > +     gem_close(bo->dev->fd, bo->handle);
> > > +     free(bo);
> > > +}
> > > +
> > > +void *
> > > +igt_msm_bo_map(struct msm_bo *bo)
> > > +{
> > > +     if (!bo->map) {
> > > +             struct drm_msm_gem_info req =3D {
> > > +                             .handle =3D bo->handle,
> > > +                             .info =3D MSM_INFO_GET_OFFSET,
> > > +             };
> > > +             void *ptr;
> > > +
> > > +             do_ioctl(bo->dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> > > +
> > > +             ptr =3D mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_S=
HARED,
> > > +                             bo->dev->fd, req.value);
> > > +             if (ptr =3D=3D MAP_FAILED)
> > > +                     return NULL;
> > > +
> > > +             bo->map =3D ptr;
> > > +     }
> > > +     return bo->map;
> > > +}
> > > +
> > > +struct msm_pipe *
> > > +igt_msm_pipe_open(struct msm_device *dev, uint32_t prio)
> > > +{
> > > +     struct msm_pipe *pipe =3D calloc(1, sizeof(*pipe));
> > > +     struct drm_msm_submitqueue req =3D {
> > > +                     .flags =3D 0,
> > > +                     .prio =3D prio,
> > > +     };
> > > +
> > > +     pipe->dev =3D dev;
> > > +     pipe->pipe =3D MSM_PIPE_3D0;
> > > +
> > > +     /* Note that kerenels prior to v4.15 did not support submitqueu=
es.
> > > +      * Mesa maintains support for older kernels, but I do not think
> > > +      * that IGT needs to.
> > > +      */
> > > +     do_ioctl(dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_NEW, &req);
> > > +
> > > +     pipe->submitqueue_id =3D req.id;
> > > +
> > > +     return pipe;
> > > +}
> > > +
> > > +void
> > > +igt_msm_pipe_close(struct msm_pipe *pipe)
> > > +{
> > > +     do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE, &pipe-=
>submitqueue_id);
> > > +     free(pipe);
> > > +}
> > > +
> > > +uint64_t
> > > +igt_msm_pipe_get_param(struct msm_pipe *pipe, uint32_t param)
> > > +{
> > > +     struct drm_msm_param req =3D {
> > > +                     .pipe =3D pipe->pipe,
> > > +                     .param =3D param,
> > > +     };
> > > +
> > > +     do_ioctl(pipe->dev->fd, DRM_IOCTL_MSM_GET_PARAM, &req);
> > > +
> > > +     return req.value;
> > > +}
> > > diff --git a/lib/igt_msm.h b/lib/igt_msm.h
> > > new file mode 100644
> > > index 00000000..0d302e18
> > > --- /dev/null
> > > +++ b/lib/igt_msm.h
> > > @@ -0,0 +1,128 @@
> > > +/*
> > > + * Copyright =A9 2021 Google, Inc.
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtai=
ning a
> > > + * copy of this software and associated documentation files (the "So=
ftware"),
> > > + * to deal in the Software without restriction, including without li=
mitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, subl=
icense,
> > > + * and/or sell copies of the Software, and to permit persons to whom=
 the
> > > + * Software is furnished to do so, subject to the following conditio=
ns:
> > > + *
> > > + * The above copyright notice and this permission notice (including =
the next
> > > + * paragraph) shall be included in all copies or substantial portion=
s of the
> > > + * Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVEN=
T SHALL
> > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR OTHER
> > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, A=
RISING
> > > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTH=
ER DEALINGS
> > > + * IN THE SOFTWARE.
> > > + */
> > > +
> > > +#ifndef IGT_MSM_H
> > > +#define IGT_MSM_H
> > > +
> > > +#include "msm_drm.h"
> > > +
> > > +struct msm_device {
> > > +     int fd;
> > > +};
> >
> > Why do you need this wrapper struct?
>=20
> It isn't adding a lot of value yet, and I was a bit on the fence about
> whether to include it.. but based on my experience on the mesa side of
> things, I could see ways that it becomes useful.  For example if we
> needed to add refcnt'ing so the drm fd is closed when the last user is
> done (multi-threaded tests?).  Or if we want to centralize collection
> of GPU info/configuration, rather than duplicating in individual
> tests.
>=20
> In the end, it doesn't add/remove any lines of code from the tests,
> but it would be churn to retrofit it later.  So I kept it.

It does add the extra device opening wrapper that is just for msm. If
you need to box together some extra data, I suggest having a helper
that gets the fd passed to it, rather than wrapping
drm_open_driver_render().

One step further, if such boxing would be useful, it would be useful
for all drivers perhaps? But it's a moot point before such use arises.


--=20
Petri Latvala
