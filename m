Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 1 Dec 2021 10:38:35 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Yac0i2wEZbH32lbL@platvala-desk.ger.corp.intel.com>
References: <20211130004324.337399-1-robdclark@gmail.com>
 <20211130004324.337399-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211130004324.337399-2-robdclark@gmail.com>
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
To: Rob Clark <robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 04:43:23PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>=20
> Split the readN()/writeN() helpers out into an igt_io module, so they
> can be re-used by tests.
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  lib/igt_io.c    | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_io.h    | 33 +++++++++++++++++
>  lib/igt_sysfs.c | 45 +++--------------------
>  lib/meson.build |  1 +
>  4 files changed, 135 insertions(+), 40 deletions(-)
>  create mode 100644 lib/igt_io.c
>  create mode 100644 lib/igt_io.h
>=20
> diff --git a/lib/igt_io.c b/lib/igt_io.c
> new file mode 100644
> index 00000000..ad54cbe5
> --- /dev/null
> +++ b/lib/igt_io.c
> @@ -0,0 +1,96 @@
> +/*
> + * Copyright =A9 2016 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include <errno.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +
> +#include "igt_io.h"
> +
> +/**
> + * SECTION:igt_io
> + * @short_description: Helpers for file I/O
> + * @title: io
> + * @include: igt_io.h
> + *
> + * This library provides helpers for file I/O
> + */
> +

This new section needs to be explicitly included in the docs. Squash this i=
n:

diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/ref=
erence/igt-gpu-tools/igt-gpu-tools-docs.xml
index 189597c6..0dc5a0b7 100644
--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
@@ -30,6 +30,7 @@
     <xi:include href=3D"xml/igt_fb.xml"/>
     <xi:include href=3D"xml/igt_frame.xml"/>
     <xi:include href=3D"xml/igt_gt.xml"/>
+    <xi:include href=3D"xml/igt_io.xml"/>
     <xi:include href=3D"xml/igt_kmod.xml"/>
     <xi:include href=3D"xml/igt_kms.xml"/>
     <xi:include href=3D"xml/igt_list.xml"/>



--=20
Petri Latvala
