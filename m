Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1491610E59E
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Mar 2023 07:59:24 +0000 (UTC)
Date: Wed, 8 Mar 2023 08:59:19 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Message-ID: <20230308085919.2a3fda86@maurocar-mobl2>
In-Reply-To: <20230303110715.8183-4-dominik.karol.piatkowski@intel.com>
References: <20230303110715.8183-1-dominik.karol.piatkowski@intel.com>
 <20230303110715.8183-4-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/igt_kmod: add compatibility for
 KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri,  3 Mar 2023 12:07:14 +0100
Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com> wrote:

> From: Isabella Basso <isabbasso@riseup.net>
>=20
> This adds functions for both executing the tests as well as parsing (K)TAP
> kmsg output, as per the KTAP spec [1].
>=20
> [1] https://www.kernel.org/doc/html/latest/dev-tools/ktap.html
>=20
> v1 -> v2:
> - refactor igt_kunit function and ktap parser so that we have only one
>   parser that we call only once (code size is now less than half the
>   size as v1)
> - add lookup_value helper
> - fix parsing problems
> v2 -> v3:
> - move ktap parsing functions to own file
> - rename to ktap_parser
> - get rid of unneeded pointers in igt_kunit
> - change return values to allow for subsequent call to igt_kselftests if
>   needed
> - add docs to parsing functions and helpers
> - switch to line buffering
> - add line buffering logging helper
> - fix kunit module handling
> - fix parsing of version lines
> - use igt_subtest blocks to improve output handling on the CI
> - fix output handling during crashes
>=20
> Signed-off-by: Isabella Basso <isabbasso@riseup.net>
>=20
> v3 -> v4:
> - handle igt_ktap_parser fail with IGT_EXIT_ABORT code
>=20
> Co-authored-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@i=
ntel.com>
> ---
>  lib/igt_kmod.c  |  84 ++++++++++++
>  lib/igt_kmod.h  |   2 +
>  lib/igt_ktap.c  | 334 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_ktap.h  |  31 +++++
>  lib/meson.build |   1 +
>  5 files changed, 452 insertions(+)
>  create mode 100644 lib/igt_ktap.c
>  create mode 100644 lib/igt_ktap.h
>=20
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index fbda1aa6..a156e43d 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -29,6 +29,7 @@
>  #include "igt_aux.h"
>  #include "igt_core.h"
>  #include "igt_kmod.h"
> +#include "igt_ktap.h"
>  #include "igt_sysfs.h"
>  #include "igt_taints.h"
> =20
> @@ -744,6 +745,89 @@ void igt_kselftest_get_tests(struct kmod_module *kmo=
d,
>  	kmod_module_info_free_list(pre);
>  }
> =20
> +/**
> + * igt_kunit:
> + * @module_name: the name of the module
> + * @opts: options to load the module
> + *
> + * Loads the test module, parses its (k)tap dmesg output, then unloads it
> + *
> + * Returns: IGT default codes
> + */
> +int igt_kunit(const char *module_name, const char *opts)
> +{
> +	struct igt_ktest tst;
> +	struct kmod_module *kunit_kmod;
> +	char record[BUF_LEN + 1];
> +	FILE *f;
> +	bool is_builtin;
> +	int ret;
> +
> +	ret =3D IGT_EXIT_INVALID;
> +
> +	/* get normalized module name */
> +	if (igt_ktest_init(&tst, module_name) !=3D 0) {
> +		igt_warn("Unable to initialize ktest for %s\n", module_name);
> +		return ret;
> +	}
> +
> +	if (igt_ktest_begin(&tst) !=3D 0) {
> +		igt_warn("Unable to begin ktest for %s\n", module_name);
> +
> +		igt_ktest_fini(&tst);
> +		return ret;
> +	}
> +
> +	if (tst.kmsg < 0) {
> +		igt_warn("Could not open /dev/kmsg");
> +		goto unload;
> +	}
> +
> +	if (lseek(tst.kmsg, 0, SEEK_END)) {
> +		igt_warn("Could not seek the end of /dev/kmsg");
> +		goto unload;
> +	}
> +
> +	f =3D fdopen(tst.kmsg, "r");
> +
> +	if (f =3D=3D NULL) {
> +		igt_warn("Could not turn /dev/kmsg file descriptor into a FILE pointer=
");
> +		goto unload;
> +	}
> +
> +	if (setvbuf(f, record, _IOLBF, BUF_LEN)) {
> +		igt_warn("Could not set line buffering on /dev/kmsg");
> +		goto unload;
> +	}
> +
> +	/* The KUnit module is required for running any KUnit tests */
> +	if (igt_kmod_load("kunit", NULL) !=3D 0 ||
> +	    kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) !=3D 0)=
 {
> +		igt_warn("Unable to load KUnit\n");
> +		igt_fail(IGT_EXIT_FAILURE);
> +	}
> +
> +	is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=3D KMOD_MODULE=
_BUILTIN;
> +
> +	if (igt_kmod_load(module_name, opts) !=3D 0) {
> +		igt_warn("Unable to load %s module\n", module_name);
> +		igt_fail(IGT_EXIT_FAILURE);
> +	}
> +
> +	ret =3D igt_ktap_parser(f, record, is_builtin);
> +	if (ret !=3D 0)
> +		ret =3D IGT_EXIT_ABORT;


No. you need to actually start monitoring /dev/kmsg before loading
the module. The ktap parser should be listening and parsing the messages
as the tests are executed, and not after the end of module load.

If you don't do that:

1. the test results will only be displayed after the end of all tests;
2. if a crash happens during a test, the log output will be lost.

In order to preserver Isabella's authorship, my suggestion is to
write a patch after this one changing the logic of the ktap parser
for it to run on a thread, started before loading the module, and
finished after the end of the module probe.

Regards,
Mauro
