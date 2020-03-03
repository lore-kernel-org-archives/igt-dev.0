Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809F46EA67
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 13:13:17 +0000 (UTC)
Date: Tue, 3 Mar 2020 15:13:15 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200303131315.GO3839@platvala-desk.ger.corp.intel.com>
References: <20200302173314.378918-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302173314.378918-1-emil.l.velikov@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] ts/core_setmaster: new test for
 drop/set master semantics
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 05:33:14PM +0000, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> =

> This test adds three distinct subtests:
>  - drop/set master as root
>  - drop/set master as non-root
>  - drop/set master for a shared fd
> =

> Currently the second subtest will fail, with kernel patch to address
> that has been submitted.
> =

> v2: Add to the autotools build
> v3:
>  - Add igt_describe()
>  - Use igt_fixture() for tweak_perm
>  - Enhance comments
> =

> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  tests/Makefile.sources |   1 +
>  tests/core_setmaster.c | 206 +++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |   1 +
>  3 files changed, 208 insertions(+)
>  create mode 100644 tests/core_setmaster.c
> =

> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index b87d6333..5da36a91 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -18,6 +18,7 @@ TESTS_progs =3D \
>  	core_getclient \
>  	core_getstats \
>  	core_getversion \
> +	core_setmaster \
>  	core_setmaster_vs_auth \
>  	debugfs_test \
>  	dmabuf \
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> new file mode 100644
> index 00000000..58ed9771
> --- /dev/null
> +++ b/tests/core_setmaster.c
> @@ -0,0 +1,206 @@
> +/*
> + * Copyright =A9 2020 Collabora, Ltd.
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
> + * Authors:
> + *    Emil Velikov <emil.l.velikov@gmail.com>
> + *
> + */
> +
> +/*
> + * Testcase: Check that drop/setMaster behaves correctly wrt root/user a=
ccess
> + *
> + * Test checks if the ioctls succeed or fail, depending if the applicati=
ons was
> + * run with root, user privileges or if we have separate privileged arbi=
trator.
> + */
> +
> +#include "igt.h"
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +
> +IGT_TEST_DESCRIPTION("Check that Drop/SetMaster behaves correctly wrt ro=
ot/user"
> +		     " access");
> +
> +static bool is_master(int fd)
> +{
> +	/* FIXME: replace with drmIsMaster once we bumped libdrm version */
> +	return drmAuthMagic(fd, 0) !=3D -EACCES;
> +}
> +
> +static void check_drop_set(void)
> +{
> +	int master;
> +
> +	master =3D __drm_open_driver(DRIVER_ANY);
> +
> +	/* Ensure we have a valid device. This is _extremely_ unlikely to
> +	 * trigger as tweak_perm() aims to ensure we have the correct rights.
> +	 * Although:
> +	 * - according to the manual igt_drop_root() + igt_skip() is broken

I asked for clarification on this and didn't get a reply. I'm not
seeing such a mention. Well, there is the text warning about
igt_drop_root() and atexit handlers and recommending the use of
igt_drop_root() in a child process to avoid issues, and this is in a
child process.

Whatever I'm missing here surely also applies to igt_assert as well?


> +	 * - there is _no_ guarantee that we'll open a device handled by
> +	 * tweak_perm()

This is a point that came to mind later, the building blocks for that
guarantee are in igt_device_scan.

1) If filter already set (test being run with --device), use that
   filter (igt_device_filter_get or so). Otherwise loop through the
   generated card%u names, using drm:/dev/dri/card%u as the
   filter. igt_device_scan.c stuff already has a list of all possible
   devices but I don't see an easy way to get to the list.

2) igt_device_card_match() gets you a card

3) card->card should be the path to /dev/dri to chmod on

4) igt_open_card(card) gives you an fd to that card


> +	 * - having a device is integral part of the test

It's an integral part of all tests. The issue with the use of
igt_require vs igt_assert is whether it's a prerequisite or the thing
you're actually testing.


> +	 */
> +	igt_assert_neq(master, -1);
> +
> +	/* At this point we're master capable due to:
> +	 * - being root - always
> +	 * - normal user - as the only drm only drm client (on this VT)
> +	 */
> +	igt_assert_eq(is_master(master), true);

Just igt_assert(is_master(master))


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
