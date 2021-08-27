Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 27 Aug 2021 08:37:51 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YSh6L+oBDPMFqq06@platvala-desk.ger.corp.intel.com>
References: <20210825233139.1066504-1-robdclark@gmail.com>
 <20210825233139.1066504-4-robdclark@gmail.com>
 <YScnGRjPt48cEtF1@platvala-desk.ger.corp.intel.com>
 <CAF6AEGsf=jf7-miUXt+4h5cOEYx0obW-_Gmxm=vUL4wWTsbsJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGsf=jf7-miUXt+4h5cOEYx0obW-_Gmxm=vUL4wWTsbsJw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH igt v2 3/3] msm: Add submit ioctl tests
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

On Thu, Aug 26, 2021 at 08:37:19AM -0700, Rob Clark wrote:
> On Wed, Aug 25, 2021 at 10:28 PM Petri Latvala <petri.latvala@intel.com> =
wrote:
> >
> > On Wed, Aug 25, 2021 at 04:31:39PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add an initial set of tests for the submit ioctl.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  tests/meson.build  |   1 +
> > >  tests/msm_submit.c | 186 +++++++++++++++++++++++++++++++++++++++++++=
++
> > >  2 files changed, 187 insertions(+)
> > >  create mode 100644 tests/msm_submit.c
> > >
> > > diff --git a/tests/meson.build b/tests/meson.build
> > > index 1bdfddbb..ff7c709a 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -107,6 +107,7 @@ test_progs =3D [
> > >       'vc4_wait_seqno',
> > >       'vgem_basic',
> > >       'vgem_slow',
> > > +     'msm_submit',
> > >  ]
> > >
> > >  i915_progs =3D [
> > > diff --git a/tests/msm_submit.c b/tests/msm_submit.c
> > > new file mode 100644
> > > index 00000000..da93c574
> > > --- /dev/null
> > > +++ b/tests/msm_submit.c
> > > @@ -0,0 +1,186 @@
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
> > > +#include "igt.h"
> > > +#include "igt_msm.h"
> > > +
> > > +igt_main
> > > +{
> > > +     struct msm_device *dev;
> > > +     struct msm_pipe *pipe;
> > > +     struct msm_bo *a, *b;
> > > +
> > > +     igt_fixture {
> > > +             dev =3D igt_msm_dev_open();
> >
> > What I replied on 2/3 applies here: If opening the device fails,
> > igt_msm_dev_open() does not return and 'dev' is left uninitialized,
> > those other pointers likewise. Leading to...
> >
> > > +             pipe =3D igt_msm_pipe_open(dev, 0);
> > > +             a =3D igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
> > > +             b =3D igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
> > > +     }
> > > +
> > > +     igt_subtest("empty-submit") {
> > > +             struct drm_msm_gem_submit req =3D {
> > > +                             .flags   =3D pipe->pipe,
> > > +                             .queueid =3D pipe->submitqueue_id,
> > > +             };
> > > +             do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
> > > +     }
> > > +
> > > +     igt_subtest("invalid-queue-submit") {
> > > +             struct drm_msm_gem_submit req =3D {
> > > +                             .flags   =3D pipe->pipe,
> > > +                             .queueid =3D 0x1234,
> > > +             };
> > > +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, E=
NOENT);
> > > +     }
> > > +
> > > +     igt_subtest("invalid-flags-submit") {
> > > +             struct drm_msm_gem_submit req =3D {
> > > +                             .flags   =3D 0x1234,
> > > +                             .queueid =3D pipe->submitqueue_id,
> > > +             };
> > > +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, E=
INVAL);
> > > +     }
> > > +
> > > +     igt_subtest("invalid-in-fence-submit") {
> > > +             struct drm_msm_gem_submit req =3D {
> > > +                             .flags   =3D pipe->pipe | MSM_SUBMIT_FE=
NCE_FD_IN,
> > > +                             .queueid =3D pipe->submitqueue_id,
> > > +                             .fence_fd =3D dev->fd,  /* This is not =
a fence fd! */
> > > +             };
> > > +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, E=
INVAL);
> > > +     }
> > > +
> > > +     igt_subtest("invalid-duplicate-bo-submit") {
> > > +             struct drm_msm_gem_submit_bo bos[] =3D {
> > > +                     [0] =3D {
> > > +                             .handle     =3D a->handle,
> > > +                             .flags      =3D MSM_SUBMIT_BO_READ,
> > > +                     },
> > > +                     [1] =3D {
> > > +                             .handle     =3D b->handle,
> > > +                             .flags      =3D MSM_SUBMIT_BO_READ,
> > > +                     },
> > > +                     [2] =3D {
> > > +                             /* this is invalid.. there should not b=
e two entries
> > > +                              * for the same bo, instead a single en=
try w/ all
> > > +                              * usage flags OR'd together should be =
used.  Kernel
> > > +                              * should catch this, and return an err=
or code after
> > > +                              * cleaning up properly (not leaking an=
y bo's)
> > > +                              */
> > > +                             .handle     =3D a->handle,
> > > +                             .flags      =3D MSM_SUBMIT_BO_WRITE,
> > > +                     },
> > > +             };
> > > +             struct drm_msm_gem_submit req =3D {
> > > +                             .flags   =3D pipe->pipe,
> > > +                             .queueid =3D pipe->submitqueue_id,
> > > +                             .nr_bos  =3D ARRAY_SIZE(bos),
> > > +                             .bos     =3D VOID2U64(bos),
> > > +             };
> > > +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, E=
INVAL);
> > > +     }
> > > +
> > > +     igt_subtest("invalid-cmd-idx-submit") {
> > > +             struct drm_msm_gem_submit_cmd cmds[] =3D {
> > > +                     [0] =3D {
> > > +                             .type       =3D MSM_SUBMIT_CMD_BUF,
> > > +                             .submit_idx =3D 0,      /* bos[0] does =
not exist */
> > > +                             .size       =3D 4 * 4,  /* 4 dwords in =
cmdbuf */
> > > +                     },
> > > +             };
> > > +             struct drm_msm_gem_submit req =3D {
> > > +                             .flags   =3D pipe->pipe,
> > > +                             .queueid =3D pipe->submitqueue_id,
> > > +                             .nr_cmds    =3D ARRAY_SIZE(cmds),
> > > +                             .cmds       =3D VOID2U64(cmds),
> > > +             };
> > > +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, E=
INVAL);
> > > +     }
> > > +
> > > +     igt_subtest("invalid-cmd-type-submit") {
> > > +             struct drm_msm_gem_submit_bo bos[] =3D {
> > > +                     [0] =3D {
> > > +                             .handle     =3D a->handle,
> > > +                             .flags      =3D MSM_SUBMIT_BO_READ,
> > > +                     },
> > > +             };
> > > +             struct drm_msm_gem_submit_cmd cmds[] =3D {
> > > +                     [0] =3D {
> > > +                             .type       =3D 0x1234,
> > > +                             .submit_idx =3D 0,
> > > +                             .size       =3D 4 * 4,  /* 4 dwords in =
cmdbuf */
> > > +                     },
> > > +             };
> > > +             struct drm_msm_gem_submit req =3D {
> > > +                             .flags   =3D pipe->pipe,
> > > +                             .queueid =3D pipe->submitqueue_id,
> > > +                             .nr_cmds    =3D ARRAY_SIZE(cmds),
> > > +                             .cmds       =3D VOID2U64(cmds),
> > > +                             .nr_bos  =3D ARRAY_SIZE(bos),
> > > +                             .bos     =3D VOID2U64(bos),
> > > +             };
> > > +             do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, E=
INVAL);
> > > +     }
> > > +
> > > +     igt_subtest("valid-submit") {
> > > +             struct drm_msm_gem_submit_bo bos[] =3D {
> > > +                     [0] =3D {
> > > +                             .handle     =3D a->handle,
> > > +                             .flags      =3D MSM_SUBMIT_BO_READ,
> > > +                     },
> > > +             };
> > > +             struct drm_msm_gem_submit_cmd cmds[] =3D {
> > > +                     [0] =3D {
> > > +                             .type       =3D MSM_SUBMIT_CMD_BUF,
> > > +                             .submit_idx =3D 0,
> > > +                             .size       =3D 4 * 4,  /* 4 dwords in =
cmdbuf */
> > > +                     },
> > > +             };
> > > +             struct drm_msm_gem_submit req =3D {
> > > +                             .flags   =3D pipe->pipe,
> > > +                             .queueid =3D pipe->submitqueue_id,
> > > +                             .nr_cmds    =3D ARRAY_SIZE(cmds),
> > > +                             .cmds       =3D VOID2U64(cmds),
> > > +                             .nr_bos  =3D ARRAY_SIZE(bos),
> > > +                             .bos     =3D VOID2U64(bos),
> > > +             };
> > > +             uint32_t *cmdstream =3D igt_msm_bo_map(a);
> > > +             if (dev->gen >=3D 5) {
> > > +                     *(cmdstream++) =3D pm4_pkt7_hdr(CP_NOP, 3);
> > > +             } else {
> > > +                     *(cmdstream++) =3D pm4_pkt3_hdr(CP_NOP, 3);
> > > +             }
> > > +             *(cmdstream++) =3D 0;
> > > +             *(cmdstream++) =3D 0;
> > > +             *(cmdstream++) =3D 0;
> > > +
> > > +             do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
> > > +     }
> > > +
> > > +     igt_fixture {
> > > +             igt_msm_bo_free(a);
> > > +             igt_msm_bo_free(b);
> > > +             igt_msm_pipe_close(pipe);
> > > +             igt_msm_dev_close(dev);
> >
> > ... crashes in here.
> >
>=20
> I did test this on intel as well, and it skips properly.. I think the
> setjmp/longjmp magic just bails completely out so we never try to run
> the cleanup?

Ah, indeed, skip_henceforth prevents entering the latter fixture.

It still looks scary, can I implore to add some defensive layers with
NULL-inits and handling of NULLs in the functions? It might not crash
today...


--=20
Petri Latvala
