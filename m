Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5B710E202
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 15:57:57 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b9a828c920so71695961fa.1
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Aug 2023 08:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230802211958.7027-1-robdclark@gmail.com>
 <20230807143359.5feiqklzbx7vqx5n@kamilkon-desk1>
In-Reply-To: <20230807143359.5feiqklzbx7vqx5n@kamilkon-desk1>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 7 Aug 2023 08:57:42 -0700
Message-ID: <CAF6AEGuj6VtmH1dn1pEeCPQNUA4Uh-7muf+BaidgXiMOModRLg@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH] tests/msm: Add submitoverhead benchmark
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

On Mon, Aug 7, 2023 at 7:34=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
>
> On 2023-08-02 at 14:19:54 -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Something for profiling CPU overhead of submit ioctl.  Not really a
> > functional test, but it is convenient to re-use the i-g-t infrastructur=
e
> > for this.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  tests/meson.build              |   3 +-
> >  tests/msm/msm_submitoverhead.c | 104 +++++++++++++++++++++++++++++++++
> >  2 files changed, 106 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/msm/msm_submitoverhead.c
> >
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 944a0941f9fd..ca918337ebf6 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -302,7 +302,8 @@ msm_progs =3D [
> >       'msm_mapping',
> >       'msm_recovery',
> >       'msm_shrink',
> > -     'msm_submit'
> > +     'msm_submit',
> -- ^^^^^
> > +        'msm_submitoverhead',
> -- ^^^^^^^^
> Looks like inconsistent use of spaces/tab?

Hmm, it seems my vim really dislikes tabs in meson.build files and
wants to turn them into spaces.  (Which, tbh, tab indented meson.build
isn't a thing I've seen anywhere else.)

BR,
-R

> >  ]
> >
> >  chamelium_progs =3D [
> > diff --git a/tests/msm/msm_submitoverhead.c b/tests/msm/msm_submitoverh=
ead.c
> > new file mode 100644
> > index 000000000000..d88d6d999ab9
> > --- /dev/null
> > +++ b/tests/msm/msm_submitoverhead.c
> > @@ -0,0 +1,104 @@
> > +/*
> > + * Copyright =C2=A9 2023 Google, Inc.
> > + *
>
> Use SPDX licence (look into other tests and/or check with perl script
> checkpatch.pl from LInux kernel).
>
> Rest looks ok.
>
> Regards,
> Kamil
>
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions=
:
> > + *
> > + * The above copyright notice and this permission notice (including th=
e next
> > + * paragraph) shall be included in all copies or substantial portions =
of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> > + * IN THE SOFTWARE.
> > + */
> > +
> > +#include "igt.h"
> > +#include "igt_msm.h"
> > +
> > +/*
> > + * Not as much a test, as a kernel submit overhead benchmark.  Generat=
es lots
> > + * of submit ioctls with various size #s of buffers attached for measu=
ring
> > + * and profiling kernel submit CPU overhead.
> > + */
> > +
> > +#define MAX_BOS 1000
> > +
> > +igt_main
> > +{
> > +     struct msm_device *dev =3D NULL;
> > +     struct msm_pipe *pipe =3D NULL;
> > +     struct msm_bo *bos[MAX_BOS];
> > +     struct drm_msm_gem_submit_bo bos_table[MAX_BOS];
> > +     static const int sizes[] =3D {
> > +             10, 100, 250, 500, 1000,
> > +     };
> > +
> > +     igt_fixture {
> > +             struct drm_msm_gem_submit req;
> > +
> > +             dev =3D igt_msm_dev_open();
> > +             pipe =3D igt_msm_pipe_open(dev, 0);
> > +             for (int i =3D 0; i < MAX_BOS; i++) {
> > +                     bos[i] =3D igt_msm_bo_new(dev, 0x1000, MSM_BO_WC)=
;
> > +                     bos_table[i] =3D (struct drm_msm_gem_submit_bo) {
> > +                             .handle =3D bos[i]->handle,
> > +                             /*
> > +                              * We don't bother testing BO_READ since
> > +                              * mesa doesn't use that anymore
> > +                              */
> > +                             .flags  =3D MSM_SUBMIT_BO_WRITE,
> > +                     };
> > +             }
> > +
> > +             /*
> > +              * Prime the pump, so first submit doesn't take the overh=
ead
> > +              * of allocating backing pages:
> > +              */
> > +             req =3D (struct drm_msm_gem_submit) {
> > +                     .flags   =3D pipe->pipe | MSM_SUBMIT_FENCE_FD_OUT=
,
> > +                     .queueid =3D pipe->submitqueue_id,
> > +                     .nr_bos  =3D ARRAY_SIZE(bos_table),
> > +                     .bos     =3D VOID2U64(bos_table),
> > +             };
> > +             do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
> > +             igt_wait_and_close(req.fence_fd);
> > +     }
> > +
> > +     for (int i =3D 0; i < ARRAY_SIZE(sizes); i++) {
> > +             for (int mode =3D 0; mode < 2; mode++) {
> > +                     const char *modestr =3D mode ? "-no-implicit-sync=
" : "";
> > +                     const uint32_t modeflags =3D mode ? MSM_SUBMIT_NO=
_IMPLICIT : 0;
> > +                     igt_subtest_f("submitbench-%u-bos%s", sizes[i], m=
odestr) {
> > +                             struct drm_msm_gem_submit req =3D {
> > +                                     .flags   =3D pipe->pipe | modefla=
gs,
> > +                                     .queueid =3D pipe->submitqueue_id=
,
> > +                                     .nr_bos  =3D sizes[i],
> > +                                     .bos     =3D VOID2U64(bos_table),
> > +                             };
> > +                             unsigned iterations =3D 0;
> > +                             igt_for_milliseconds(2000) {
> > +                                     do_ioctl(dev->fd, DRM_IOCTL_MSM_G=
EM_SUBMIT, &req);
> > +                                     iterations++;
> > +                             }
> > +                             igt_info("%u-bos: %u iterations\n", sizes=
[i], iterations);
> > +                     }
> > +             }
> > +     }
> > +
> > +     igt_fixture {
> > +             for (int i =3D 0; i < MAX_BOS; i++) {
> > +                     igt_msm_bo_free(bos[i]);
> > +             }
> > +             igt_msm_pipe_close(pipe);
> > +             igt_msm_dev_close(dev);
> > +     }
> > +}
> > --
> > 2.41.0
> >
