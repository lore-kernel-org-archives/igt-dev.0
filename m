Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F6C10E632
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Mar 2023 14:52:05 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>,
 igt-dev@lists.freedesktop.org
Date: Fri, 03 Mar 2023 15:51:56 +0100
Message-ID: <2179118.NgBsaNRSFp@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <ZAHmx1m7FB1woy31@adrinael.net>
References: <20230303110715.8183-1-dominik.karol.piatkowski@intel.com>
 <20230303110715.8183-4-dominik.karol.piatkowski@intel.com>
 <ZAHmx1m7FB1woy31@adrinael.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

On Friday, 3 March 2023 13:23:35 CET Petri Latvala wrote:
> On Fri, Mar 03, 2023 at 12:07:14PM +0100, Dominik Karol Piatkowski wrote:
> > From: Isabella Basso <isabbasso@riseup.net>
> >=20
> > This adds functions for both executing the tests as well as parsing (K)=
TAP
> > kmsg output, as per the KTAP spec [1].
> >=20
> > [1] https://www.kernel.org/doc/html/latest/dev-tools/ktap.html
> >=20
> > v1 -> v2:
> > - refactor igt_kunit function and ktap parser so that we have only one
> >   parser that we call only once (code size is now less than half the
> >   size as v1)
> > - add lookup_value helper
> > - fix parsing problems
> > v2 -> v3:
> > - move ktap parsing functions to own file
> > - rename to ktap_parser
> > - get rid of unneeded pointers in igt_kunit
> > - change return values to allow for subsequent call to igt_kselftests if
> >   needed
> > - add docs to parsing functions and helpers
> > - switch to line buffering
> > - add line buffering logging helper
> > - fix kunit module handling
> > - fix parsing of version lines
> > - use igt_subtest blocks to improve output handling on the CI
> > - fix output handling during crashes
> >=20
> > Signed-off-by: Isabella Basso <isabbasso@riseup.net>
> >=20
> > v3 -> v4:
> > - handle igt_ktap_parser fail with IGT_EXIT_ABORT code
> >=20
> > Co-authored-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski=
@intel.com>
> > ---
> >  lib/igt_kmod.c  |  84 ++++++++++++
> >  lib/igt_kmod.h  |   2 +
> >  lib/igt_ktap.c  | 334 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_ktap.h  |  31 +++++
> >  lib/meson.build |   1 +
> >  5 files changed, 452 insertions(+)
> >  create mode 100644 lib/igt_ktap.c
> >  create mode 100644 lib/igt_ktap.h
> >=20
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index fbda1aa6..a156e43d 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -29,6 +29,7 @@
> >  #include "igt_aux.h"
> >  #include "igt_core.h"
> >  #include "igt_kmod.h"
> > +#include "igt_ktap.h"
> >  #include "igt_sysfs.h"
> >  #include "igt_taints.h"
> > =20
> > @@ -744,6 +745,89 @@ void igt_kselftest_get_tests(struct kmod_module *k=
mod,
> >  	kmod_module_info_free_list(pre);
> >  }
> > =20
> > +/**
> > + * igt_kunit:
> > + * @module_name: the name of the module
> > + * @opts: options to load the module
> > + *
> > + * Loads the test module, parses its (k)tap dmesg output, then unloads=
 it
> > + *
> > + * Returns: IGT default codes
> > + */
> > +int igt_kunit(const char *module_name, const char *opts)
> > +{
> > +	struct igt_ktest tst;
> > +	struct kmod_module *kunit_kmod;
> > +	char record[BUF_LEN + 1];
> > +	FILE *f;
> > +	bool is_builtin;
> > +	int ret;
> > +
> > +	ret =3D IGT_EXIT_INVALID;
> > +
> > +	/* get normalized module name */
> > +	if (igt_ktest_init(&tst, module_name) !=3D 0) {
> > +		igt_warn("Unable to initialize ktest for %s\n", module_name);
> > +		return ret;
> > +	}
> > +
> > +	if (igt_ktest_begin(&tst) !=3D 0) {
> > +		igt_warn("Unable to begin ktest for %s\n", module_name);
> > +
> > +		igt_ktest_fini(&tst);
> > +		return ret;
> > +	}
> > +
> > +	if (tst.kmsg < 0) {
> > +		igt_warn("Could not open /dev/kmsg");
> > +		goto unload;
> > +	}
> > +
> > +	if (lseek(tst.kmsg, 0, SEEK_END)) {
> > +		igt_warn("Could not seek the end of /dev/kmsg");
> > +		goto unload;
> > +	}
> > +
> > +	f =3D fdopen(tst.kmsg, "r");
> > +
> > +	if (f =3D=3D NULL) {
> > +		igt_warn("Could not turn /dev/kmsg file descriptor into a FILE point=
er");
> > +		goto unload;
> > +	}
> > +
> > +	if (setvbuf(f, record, _IOLBF, BUF_LEN)) {
> > +		igt_warn("Could not set line buffering on /dev/kmsg");
> > +		goto unload;
> > +	}
>=20
> Make sure all your igt_warn()s end with a newline.
>=20
> There seems to be some kind of misunderstanding with how setvbuf
> works. Here a buffer is given to setvbuf() so that fgets() in the
> parser can read one line at a time, but then that's also reading into
> the same buffer. According to setvbuf() docs you're not supposed to
> touch the buffer yourself.
>=20
> I vaguely remember someone suggesting line-buffered IO for reading
> /dev/kmsg but can't find that message now. What was the reason for it?
> Using read() on /dev/kmsg already gives only one log record at a time.

That was me, in reaction to previous implementation, based on read(), but n=
ot=20
looking good to me, see my comments to
https://patchwork.freedesktop.org/patch/499945/?series=3D105294&rev=3D2
I had no idea that read() on /dev/kmsg behaves so friendly.
=20
=2E..
> > +
> > +/**
> > + * igt_ktap_parser:
> > + * @fp: FILE pointer
> > + * @record: buffer used to read fp
> > + * @is_builtin: whether the KUnit module is built-in or not
> > + *
> > + * This function parses the output of a ktap script and prints the tes=
t results,
> > + * as well as any other output to stdout.
> > + *
> > + * Returns: IGT default codes
> > + */
> > +int igt_ktap_parser(FILE *fp, char *record, bool is_builtin)
> > +{
> > +	char test_name[BUF_LEN + 1];
> > +	bool failed_tests, found_tests;
> > +	int sublevel =3D 0;
> > +
> > +	test_name[0] =3D '\0';
> > +	test_name[BUF_LEN] =3D '\0';
> > +
> > +	failed_tests =3D false;
> > +	found_tests =3D false;
> > +
> > +	while (sublevel >=3D 0) {
> > +		if (fgets(record, BUF_LEN, fp) =3D=3D NULL) {
> > +			if (!found_tests)
> > +				igt_warn("kmsg truncated: unknown error (%m)\n");
> > +			break;
> > +		}
> > +
> > +		switch (find_next_tap_subtest(fp, record, is_builtin)) {
> > +		case -2:
> > +			/* no more data to read */
> > +			return IGT_EXIT_FAILURE;
> > +		case -1:
> > +			/* no test found, so we keep parsing */
> > +			break;
> > +		case 0:
> > +			/*
> > +			 * tests found, but they're missing info, so we might
> > +			 * have read into test output
> > +			 */
> > +			found_tests =3D true;
> > +			sublevel++;
> > +			break;
> > +		default:
> > +			if (fgets(record, BUF_LEN, fp) =3D=3D NULL) {
> > +				igt_warn("kmsg truncated: unknown error (%m)\n");
> > +				return -2;
> > +			}
> > +			found_tests =3D true;
> > +			sublevel++;
> > +			break;
> > +		}
> > +
> > +		switch (parse_kmsg_for_tap(fp, record, test_name)) {
> > +		case -2:
> > +			return IGT_EXIT_FAILURE;
> > +		case -1:
> > +			sublevel--;
> > +			failed_tests =3D true;
> > +			igt_subtest(test_name)
> > +				igt_fail(IGT_EXIT_FAILURE);
> > +			test_name[0] =3D '\0';
> > +			break;
> > +		case 0: /* fallthrough */
> > +			igt_subtest(test_name)
> > +				igt_success();
> > +			test_name[0] =3D '\0';
> > +		default:
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (failed_tests || !found_tests)
> > +		return IGT_EXIT_FAILURE;
> > +
> > +	return IGT_EXIT_SUCCESS;

I think that instead of returning just one total result, the ktap parser co=
uld
better be a background process providing us with results of every subtest i=
t=20
sees being executed, which we then read and handle on the fly like if those=
=20
were IGT dynamic sub-subtests we execute, and their results.

Thanks,
Janusz

> > +}
> > diff --git a/lib/igt_ktap.h b/lib/igt_ktap.h
> > new file mode 100644
> > index 00000000..b2f69df2
> > --- /dev/null
> > +++ b/lib/igt_ktap.h
> > @@ -0,0 +1,31 @@
> > +/*
> > + * Copyright =C2=A9 2022 Isabella Basso do Amaral <isabbasso@riseup.ne=
t>
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
> > +#ifndef IGT_KTAP_H
> > +#define IGT_KTAP_H
> > +
> > +#define BUF_LEN 4096
> > +
> > +int igt_ktap_parser(FILE *fp, char *record, bool is_builtin);
> > +
> > +#endif /* IGT_KTAP_H */
> > diff --git a/lib/meson.build b/lib/meson.build
> > index c5131d9a..58cd6f44 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -87,6 +87,7 @@ lib_sources =3D [
> >  	'igt_store.c',
> >  	'uwildmat/uwildmat.c',
> >  	'igt_kmod.c',
> > +	'igt_ktap.c',
> >  	'igt_panfrost.c',
> >  	'igt_v3d.c',
> >  	'igt_vc4.c',
>=20



