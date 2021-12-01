Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20211130004324.337399-1-robdclark@gmail.com>
 <20211130004324.337399-2-robdclark@gmail.com>
 <Yac0i2wEZbH32lbL@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Yac0i2wEZbH32lbL@platvala-desk.ger.corp.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 1 Dec 2021 13:12:04 -0800
Message-ID: <CAF6AEGtU1KSc70wndMFn6R2QTnuP3pRCb-G7RLc8iwjW0=y=0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH igt 1/2] igt: Split out I/O helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Akhil P Oommen <akhilpo@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, igt-dev@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 1, 2021 at 12:39 AM Petri Latvala <petri.latvala@intel.com> wro=
te:
>
> On Mon, Nov 29, 2021 at 04:43:23PM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Split the readN()/writeN() helpers out into an igt_io module, so they
> > can be re-used by tests.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  lib/igt_io.c    | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_io.h    | 33 +++++++++++++++++
> >  lib/igt_sysfs.c | 45 +++--------------------
> >  lib/meson.build |  1 +
> >  4 files changed, 135 insertions(+), 40 deletions(-)
> >  create mode 100644 lib/igt_io.c
> >  create mode 100644 lib/igt_io.h
> >
> > diff --git a/lib/igt_io.c b/lib/igt_io.c
> > new file mode 100644
> > index 00000000..ad54cbe5
> > --- /dev/null
> > +++ b/lib/igt_io.c
> > @@ -0,0 +1,96 @@
> > +/*
> > + * Copyright =C2=A9 2016 Intel Corporation
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
> > + *
> > + */
> > +
> > +#include <errno.h>
> > +#include <stdlib.h>
> > +#include <unistd.h>
> > +
> > +#include "igt_io.h"
> > +
> > +/**
> > + * SECTION:igt_io
> > + * @short_description: Helpers for file I/O
> > + * @title: io
> > + * @include: igt_io.h
> > + *
> > + * This library provides helpers for file I/O
> > + */
> > +
>
> This new section needs to be explicitly included in the docs. Squash this=
 in:
>
> diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/r=
eference/igt-gpu-tools/igt-gpu-tools-docs.xml
> index 189597c6..0dc5a0b7 100644
> --- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> +++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> @@ -30,6 +30,7 @@
>      <xi:include href=3D"xml/igt_fb.xml"/>
>      <xi:include href=3D"xml/igt_frame.xml"/>
>      <xi:include href=3D"xml/igt_gt.xml"/>
> +    <xi:include href=3D"xml/igt_io.xml"/>
>      <xi:include href=3D"xml/igt_kmod.xml"/>
>      <xi:include href=3D"xml/igt_kms.xml"/>
>      <xi:include href=3D"xml/igt_list.xml"/>
>
>

Oh, right.. I've squashed that in locally.. lmk if you want me to resend

BR,
-R

>
> --
> Petri Latvala
