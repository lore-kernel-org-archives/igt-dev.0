Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62A16E286
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 11:58:27 +0000 (UTC)
Date: Fri, 21 Feb 2020 13:58:25 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200221115825.GF25209@platvala-desk.ger.corp.intel.com>
References: <20200219142445.69061-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219142445.69061-1-emil.l.velikov@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] ts/core_setmaster: new test for
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

On Wed, Feb 19, 2020 at 02:24:45PM +0000, Emil Velikov wrote:
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
> =

> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  tests/Makefile.sources |   1 +
>  tests/core_setmaster.c | 182 +++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |   1 +
>  3 files changed, 184 insertions(+)
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
> index 00000000..2447c077
> --- /dev/null
> +++ b/tests/core_setmaster.c
> @@ -0,0 +1,182 @@
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
> +IGT_TEST_DESCRIPTION("Check that drop/setMaster behaves correctly wrt ro=
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
> +	/* Double-check if open has failed */
> +	igt_assert_neq(master, -1);

Just use drm_open_driver(). For sure you don't want to produce a
'FAIL' when running on a system without GPU drivers. 'SKIP' is correct
for that case.

Same goes for the other __drm_open_driver() call.

> +
> +	/* At this point we're master capable due to:
> +	 * - being root - always
> +	 * - normal user - as the only drm only drm client (on this VT)
> +	 */
> +	igt_assert_eq(is_master(master), true);
> +
> +	/* If we have SYS_CAP_ADMIN we're in the textbook best-case scenario.
> +	 *
> +	 * Otherwise newer kernels allow the application to drop/revoke its
> +	 * master capability and request it again later.
> +	 *
> +	 * In this case, we address two types of issues:
> +	 * - the application no longer need suid-root (or equivalent) which
> +	 * was otherwise required _solely_ for these two ioctls
> +	 * - plenty of applications ignore (or discard) the result of the
> +	 * calls all together.
> +	 */
> +	igt_assert_eq(drmDropMaster(master), 0);
> +	igt_assert_eq(drmSetMaster(master), 0);
> +
> +	close(master);
> +}
> +
> +static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool =
save)
> +{
> +	char path[256];
> +	struct stat st;
> +	unsigned i;
> +
> +	for (i =3D 0; i < max_perm; i++) {
> +		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
> +
> +		/* Existing userspace assumes there's no gaps, do the same. */
> +		if (stat(path, &st) !=3D 0)
> +			break;
> +
> +		if (save) {
> +			/* Save and toggle */
> +			saved_perm[i] =3D st.st_mode & (S_IROTH | S_IWOTH);
> +			st.st_mode |=3D S_IROTH | S_IWOTH;
> +		} else {
> +			/* Clear and restore */
> +			st.st_mode &=3D ~(S_IROTH | S_IWOTH);
> +			st.st_mode |=3D saved_perm[i];
> +		}
> +
> +		/* In the extremely unlikely case of this failing, there't not
> +		 * much we can do.

We can igt_require that it works though. chmod failing means we get a
false 'FAIL' from the test.

Restoring failure leaves the system to a state that is going to scare
people with the extra perms...


> +		 */
> +		chmod(path, st.st_mode);
> +	}
> +	return i;
> +}
> +
> +
> +igt_main
> +{
> +	igt_subtest("master-drop-set-root") {
> +		check_drop_set();
> +	}
> +
> +
> +	igt_subtest("master-drop-set-user") {
> +		uint8_t saved_perm[255];
> +		unsigned num;
> +
> +		/* Upon dropping root we end up as random user, which
> +		 * a) is not in the video group, and
> +		 * b) lacks logind ACL, thus
> +		 * any open() fill fail.
> +		 *
> +		 * As such, save the state of original other rw permissions
> +		 * and toggle them on.
> +		 */
> +		num =3D tweak_perm(saved_perm, ARRAY_SIZE(saved_perm), true);
> +
> +		igt_fork(child, 1) {
> +			igt_drop_root();
> +			check_drop_set();
> +		}
> +		igt_waitchildren();
> +
> +		/* Restore the orignal permissions */
> +		tweak_perm(saved_perm, num, false);

If the test fails we never restore the permissions with this flow. I
suppose this would be the best (but still ugly) way to make that
happen:

igt_fixture {
   tweak_perm(...)
}

igt_subtest("master-drop-set-user") {
...
}

igt_fixture {
  tweak_perm(saved);
}

Wrapping all that in an igt_subtest_group not required but could be
used to communicate to human readers that this is the subtest these
two fixtures are for.



-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
