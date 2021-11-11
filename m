Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 11 Nov 2021 14:12:29 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YY0IrRC0ZtkQvxJd@platvala-desk.ger.corp.intel.com>
References: <20211110184213.649787-1-robdclark@gmail.com>
 <20211110184213.649787-4-robdclark@gmail.com>
 <CAF6AEGsh4ow448Y5xtt2rnX=zcFCQvqk9Mf59AB_ifmw9mm0Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGsh4ow448Y5xtt2rnX=zcFCQvqk9Mf59AB_ifmw9mm0Lw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH igt v2 3/3] msm: Add recovery tests
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Akhil P Oommen <akhilpo@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, igt-dev@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 11:00:41AM -0800, Rob Clark wrote:
> On Wed, Nov 10, 2021 at 10:37 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add tests to exercise:
> >
> > 1. sw hangcheck timeout
> > 2. gpu fault (hang) recovery
> > 3. iova fault recovery
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  lib/igt_msm.h        |   3 +
> >  tests/meson.build    |   1 +
> >  tests/msm_recovery.c | 172 +++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 176 insertions(+)
> >  create mode 100644 tests/msm_recovery.c
> >
> > diff --git a/lib/igt_msm.h b/lib/igt_msm.h
> > index 1a66c806..421d23ed 100644
> > --- a/lib/igt_msm.h
> > +++ b/lib/igt_msm.h
> > @@ -97,6 +97,9 @@ enum adreno_pm4_packet_type {
> >
> >  enum adreno_pm4_type3_packets {
> >         CP_NOP =3D 16,
> > +       CP_WAIT_MEM_GTE =3D 20,
> > +       CP_WAIT_REG_MEM =3D 60,
> > +       CP_MEM_WRITE =3D 61,
> >  };
> >
> >  static inline unsigned
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 0af3e03a..166e3494 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -60,6 +60,7 @@ test_progs =3D [
> >         'kms_vrr',
> >         'kms_writeback',
> >         'meta_test',
> > +       'msm_recovery',
> >         'msm_submit',
> >         'panfrost_get_param',
> >         'panfrost_gem_new',
> > diff --git a/tests/msm_recovery.c b/tests/msm_recovery.c
> > new file mode 100644
> > index 00000000..b71326b8
> > --- /dev/null
> > +++ b/tests/msm_recovery.c
> > @@ -0,0 +1,172 @@
> > +/*
> > + * Copyright =A9 2021 Google, Inc.
> > + *
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
> > + * Software is furnished to do so, subject to the following conditions:
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
> > +#include <sys/poll.h>
> > +
> > +#include "igt.h"
> > +#include "igt_msm.h"
> > +
> > +static struct msm_device *dev;
> > +static struct msm_bo *scratch_bo;
> > +static uint32_t *scratch;
> > +
> > +/*
> > + * Helpers for cmdstream packet building:
> > + */
> > +
> > +static void
> > +wait_mem_gte(struct msm_cmd *cmd, uint32_t offset_dwords, uint32_t ref)
> > +{
> > +       msm_cmd_pkt7(cmd, CP_WAIT_MEM_GTE, 4);
> > +       msm_cmd_emit(cmd, 0);                              /* RESERVED =
*/
> > +       msm_cmd_bo  (cmd, scratch_bo, offset_dwords * 4);  /* POLL_ADDR=
_LO/HI */
> > +       msm_cmd_emit(cmd, ref);                            /* REF */
> > +}
> > +
> > +static void
> > +mem_write(struct msm_cmd *cmd, uint32_t offset_dwords, uint32_t val)
> > +{
> > +       msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
> > +       msm_cmd_bo  (cmd, scratch_bo, offset_dwords * 4);  /* ADDR_LO/H=
I */
> > +       msm_cmd_emit(cmd, val);                            /* VAL */
> > +}
> > +
> > +/*
> > + * Helper to wait on a fence-fd:
> > + */
> > +static void
> > +wait_and_close(int fence_fd)
> > +{
> > +       poll(&(struct pollfd){fence_fd, POLLIN}, 1, -1);
> > +       close(fence_fd);
> > +}
> > +
> > +/*
> > + * Helper for hang tests.  Emits multiple submits, with one in the mid=
dle
> > + * that triggers a fault, and confirms that the submits before and aft=
er
> > + * the faulting one execute properly, ie. that the driver properly man=
ages
> > + * to recover and re-queue the submits after the faulting submit;
> > + */
> > +static void
> > +do_hang_test(struct msm_pipe *pipe)
> > +{
> > +       struct msm_cmd *cmds[16];
> > +       int fence_fds[ARRAY_SIZE(cmds)];
> > +
> > +       memset(scratch, 0, 0x1000);
> > +
> > +       for (unsigned i =3D 0; i < ARRAY_SIZE(cmds); i++) {
> > +               struct msm_cmd *cmd =3D igt_msm_cmd_new(pipe, 0x1000);
> > +
> > +               cmds[i] =3D cmd;
> > +
> > +               /*
> > +                * Emit a packet to wait for scratch[0] to be >=3D 1
> > +                *
> > +                * This lets us force the GPU to wait until all the cmd=
stream is
> > +                * queued up.
> > +                */
> > +               wait_mem_gte(cmd, 0, 1);
> > +
> > +               if (i =3D=3D 10) {
> > +                       msm_cmd_emit(cmd, 0xdeaddead);
> > +               }
> > +
> > +               /* Emit a packet to write scratch[1+i] =3D 2+i: */
> > +               mem_write(cmd, 1+i, 2+i);
> > +       }
> > +
> > +       for (unsigned i =3D 0; i < ARRAY_SIZE(cmds); i++) {
> > +               fence_fds[i] =3D igt_msm_cmd_submit(cmds[i]);
> > +       }
> > +
> > +       usleep(10000);
> > +
> > +       /* Let the WAIT_MEM_GTE complete: */
> > +       scratch[0] =3D 1;
> > +
> > +       for (unsigned i =3D 0; i < ARRAY_SIZE(cmds); i++) {
> > +               wait_and_close(fence_fds[i]);
> > +               igt_msm_cmd_free(cmds[i]);
> > +               if (i =3D=3D 10)
> > +                       continue;
> > +               igt_assert_eq(scratch[1+i], 2+i);
> > +       }
> > +}
> > +
> > +/*
> > + * Tests for drm/msm hangcheck, recovery, and fault handling
> > + */
> > +
> > +igt_main
> > +{
> > +       static struct msm_pipe *pipe =3D NULL;
> > +
> > +       igt_fixture {
> > +               dev =3D igt_msm_dev_open();
> > +               pipe =3D igt_msm_pipe_open(dev, 0);
> > +               scratch_bo =3D igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
> > +               scratch =3D igt_msm_bo_map(scratch_bo);
> > +       }
> > +
> > +       igt_describe("Test sw hangcheck handling");
> > +       igt_subtest("hangcheck") {
> > +               igt_require(dev->gen >=3D 6);
> > +
> > +               /* Disable hw hang detection to force fallback to sw ha=
ngcheck: */
> > +               igt_debugfs_write(dev->fd, "disable_err_irq", "Y");
>=20
> note that this depends on [1].. not sure if there is any constraint
> about landing igt tests before some debugfs they depend on lands
> upstream on the kernel side?
>=20
> [1] https://patchwork.freedesktop.org/patch/462625/?series=3D96725&rev=3D1

The usual ordering dependency of kernel vs userspace, where both sides
are reviewed and ready to go before anything lands. But then the
actual merging with IGT is not so strict, IGT can go in first as long
as there's a consensus that the required kernel changes are going in
in finite time.

That said, IGT is supposed to do the right thing for kernels some time
back, especially LTS kernels, so this test needs to properly handle
the debugfs file missing regardless of merging order.

Some kind of igt_require check for the debugfs file takes care of
that.


--=20
Petri Latvala




>=20
> BR,
> -R
>=20
> > +
> > +               do_hang_test(pipe);
> > +
> > +               igt_debugfs_write(dev->fd, "disable_err_irq", "N");
> > +       }
> > +
> > +       igt_describe("Test hw fault handling");
> > +       igt_subtest("gpu-fault") {
> > +               igt_require(dev->gen >=3D 6);
> > +
> > +               do_hang_test(pipe);
> > +       }
> > +
> > +       igt_describe("Test iova fault handling");
> > +       igt_subtest("iova-fault") {
> > +               struct msm_cmd *cmd;
> > +
> > +               igt_require(dev->gen >=3D 6);
> > +
> > +               cmd =3D igt_msm_cmd_new(pipe, 0x1000);
> > +
> > +               msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
> > +               msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
> > +               msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
> > +               msm_cmd_emit(cmd, 0x123);                /* VAL */
> > +
> > +               wait_and_close(igt_msm_cmd_submit(cmd));
> > +       }
> > +
> > +       igt_fixture {
> > +               igt_msm_bo_free(scratch_bo);
> > +               igt_msm_pipe_close(pipe);
> > +               igt_msm_dev_close(dev);
> > +       }
> > +}
> > --
> > 2.31.1
> >
