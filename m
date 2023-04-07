Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5309E10E098
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Apr 2023 12:53:28 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 07 Apr 2023 14:53:15 +0200
Message-ID: <1885150.IobQ9Gjlxr@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <20230324081120.3355-6-dominik.karol.piatkowski@intel.com>
References: <20230324081120.3355-1-dominik.karol.piatkowski@intel.com>
 <20230324081120.3355-6-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] Change logic of ktap parser to run
 on a thread
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Dominik,

I can see some progress, but still quite a few issues.

If you and/or other reviewers think my concerns are not important from the =
PoV=20
of Xe validation requirements then please feel free to ignore my comments.

On Friday, 24 March 2023 09:11:20 CEST Dominik Karol Piatkowski wrote:
> The ktap parser should be listening and parsing messages as the tests
> are executed, and not after the end of module load.
>=20
> v1 -> v2:
> - fix coding style
> - remove usleep
> - add error check logic
> - follow the structure of igt_kselftests more closely
>=20
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  lib/igt_kmod.c |  26 +++++----
>  lib/igt_ktap.c | 148 ++++++++++++++++++++++++++++++++-----------------
>  lib/igt_ktap.h |   5 +-
>  3 files changed, 118 insertions(+), 61 deletions(-)
>=20
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 21e801bd..45a0c6ed 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -758,7 +758,6 @@ int igt_kunit(const char *module_name, const char *op=
ts)
>  {
>  	struct igt_ktest tst;
>  	struct kmod_module *kunit_kmod;
> -	char record[BUF_LEN + 1];
>  	FILE *f;
>  	bool is_builtin;
>  	int ret;
> @@ -771,12 +770,13 @@ int igt_kunit(const char *module_name, const char *=
opts)
>  		return ret;
>  	}
> =20
> -	if (igt_ktest_begin(&tst) !=3D 0) {
> -		igt_warn("Unable to begin ktest for %s\n", module_name);
> +	igt_fixture
> +		if (igt_ktest_begin(&tst) !=3D 0) {
> +			igt_warn("Unable to begin ktest for %s\n", module_name);
> =20
> -		igt_ktest_fini(&tst);
> -		return ret;
> -	}
> +			igt_ktest_fini(&tst);
> +			return ret;
> +		}

Please note that since igt_require() is still called inside igt_ktest_begin=
()=20
and can potentially long jump out of your igt_fixture section body, your=20
attempt to return an error code from igt_kunit() if some requirements are n=
ot=20
met can still fail.  If that happens, igt_kunit() will proceed, though all=
=20
following igt_fixture and igt_subtest section bodies will be omitted. =20
Moreover, omitted not only inside igt_kunit(), but also outside of it, afte=
r=20
it returns to its caller, until the program exits.  I believe that's not wh=
at=20
we intend.

> =20
>  	if (tst.kmsg < 0) {
>  		igt_warn("Could not open /dev/kmsg\n");
> @@ -804,19 +804,25 @@ int igt_kunit(const char *module_name, const char *=
opts)
> =20
>  	is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=3D KMOD_MODULE=
_BUILTIN;
> =20
> +	ktap_parser_start(f, is_builtin);
> +
>  	if (igt_kmod_load(module_name, opts) !=3D 0) {
>  		igt_warn("Unable to load %s module\n", module_name);
> +		ret =3D ktap_parser_stop();
>  		igt_fail(IGT_EXIT_FAILURE);

This igt_fail() (and not only this one) still seems to be called from outsi=
de=20
of any igt_fixture / igt_subtest sections.

>  	}
> =20
> -	ret =3D igt_ktap_parser(f, record, is_builtin);
> -	if (ret !=3D 0)
> -		ret =3D IGT_EXIT_ABORT;
>  unload:
> -	igt_ktest_end(&tst);
> +	igt_fixture
> +		igt_ktest_end(&tst);
> =20
>  	igt_ktest_fini(&tst);
> =20
> +	ret =3D ktap_parser_stop();
> +
> +	if (ret !=3D 0)
> +		ret =3D IGT_EXIT_ABORT;
> +
>  	if (ret =3D=3D 0)
>  		igt_success();
> =20
> diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
> index 117598fa..090f98b7 100644
> --- a/lib/igt_ktap.c
> +++ b/lib/igt_ktap.c
> @@ -5,11 +5,16 @@
> =20
>  #include <ctype.h>
>  #include <limits.h>
> +#include <libkmod.h>
> +#include <pthread.h>
> +#include <errno.h>
> =20
>  #include "igt_aux.h"
>  #include "igt_core.h"
>  #include "igt_ktap.h"
> =20
> +
> +
>  static int log_to_end(enum igt_log_level level, FILE *f,
>  		      char *record, const char *format, ...) __attribute__((format(pri=
ntf, 4, 5)));
> =20
> @@ -118,7 +123,10 @@ static int find_next_tap_subtest(FILE *fp, char *rec=
ord, bool is_builtin)
>  		igt_info("%s", version_rptr);
> =20
>  		if (fgets(record, BUF_LEN, fp) =3D=3D NULL) {

As Petri suggested in his comment to one of previous versions of the series=
,=20
using line buffered input is not needed for reading from /dev/kmesg (which =
I=20
didn't know when I suggested to switch to it before, still when Isabella wa=
s=20
working on this -- my fault, sorry).  Before you decide whether to keep usi=
ng=20
line buffered input or switch to raw read(), please have a look at=20
lib/igt_kmod.c:kmsg_dump() for an example of how we've been reading log=20
records from /dev/kmsg so far, and at commit 98783313b8b3 ("lib/kmod:=20
reimplement kmsg_dump()") for some justification.

Some of below comments apply to current line buffered reading, if you decid=
e=20
to keep it.

> -			igt_warn("kmsg truncated: unknown error (%m)\n");
> +			if (ferror(fp))
> +				igt_warn("kmsg read failed: %s\n", strerror(errno));
> +			else
> +				igt_warn("kmsg truncated: unknown error (%m)\n");
>  			return -2;
>  		}
>  	}
> @@ -253,6 +261,13 @@ static int parse_kmsg_for_tap(FILE *fp, char *record=
, char *test_name)
>  	return 1;
>  }
> =20
> +struct ktap_parser_args {
> +	FILE *fp;
> +	bool is_builtin;
> +	volatile bool is_running;
> +	int ret;
> +} ktap_args;
> +
>  /**
>   * igt_ktap_parser:
>   * @fp: FILE pointer
> @@ -264,71 +279,104 @@ static int parse_kmsg_for_tap(FILE *fp, char *reco=
rd, char *test_name)
>   *
>   * Returns: IGT default codes
>   */
> -int igt_ktap_parser(FILE *fp, char *record, bool is_builtin)
> +void *igt_ktap_parser(void *unused)
>  {
> +	FILE *fp =3D ktap_args.fp;
> +	char record[BUF_LEN + 1];
> +	bool is_builtin =3D ktap_args.is_builtin;
> +
>  	char test_name[BUF_LEN + 1];
>  	bool failed_tests, found_tests;
>  	int sublevel =3D 0;
> =20
> -	test_name[0] =3D '\0';
> -	test_name[BUF_LEN] =3D '\0';
> -
>  	failed_tests =3D false;
>  	found_tests =3D false;
> =20
> -	while (sublevel >=3D 0) {
> -		if (fgets(record, BUF_LEN, fp) =3D=3D NULL) {
> -			if (!found_tests)
> -				igt_warn("kmsg truncated: unknown error (%m)\n");
> -			break;
> -		}
> +igt_ktap_parser_start:
> +	while (ktap_args.is_running) {
> +		test_name[0] =3D '\0';
> +		test_name[BUF_LEN] =3D '\0';
> =20
> -		switch (find_next_tap_subtest(fp, record, is_builtin)) {
> -		case -2:
> -			/* no more data to read */
> -			return IGT_EXIT_FAILURE;
> -		case -1:
> -			/* no test found, so we keep parsing */
> -			break;
> -		case 0:
> -			/*
> -			 * tests found, but they're missing info, so we might
> -			 * have read into test output
> -			 */
> -			found_tests =3D true;
> -			sublevel++;
> -			break;
> -		default:
> +		while(!feof(fp)) {

Since we are reading from /dev/kmsg, which is a special character device fi=
le,=20
I think we never get EOF.

>  			if (fgets(record, BUF_LEN, fp) =3D=3D NULL) {
> -				igt_warn("kmsg truncated: unknown error (%m)\n");
> -				return -2;
> +				if (ferror(fp))
> +					igt_warn("kmsg read failed: %s\n", strerror(errno));

Moreover, I think we always get an error if no data is ready for reading. =
=20
Then we will get a lot of noise from here since we are using non-blocking=20
read.  I think we should try to use blocking mode, or switch to poll() or a=
n=20
equivalent, whichever works best for reading from a character device specia=
l=20
file.

> +
> +				if (!ktap_args.is_running)
> +					return NULL;
>  			}
> -			found_tests =3D true;
> -			sublevel++;
> -			break;
>  		}

> =20
> -		switch (parse_kmsg_for_tap(fp, record, test_name)) {
> -		case -2:
> -			return IGT_EXIT_FAILURE;
> -		case -1:
> -			sublevel--;
> -			failed_tests =3D true;
> -			igt_subtest(test_name)
> -				igt_fail(IGT_EXIT_FAILURE);
> -			test_name[0] =3D '\0';
> -			break;
> -		case 0: /* fallthrough */
> -			igt_subtest(test_name)
> -				igt_success();
> -			test_name[0] =3D '\0';
> -		default:
> -			break;
> +		while (sublevel >=3D 0) {
> +			switch (find_next_tap_subtest(fp, record, is_builtin)) {
> +			case -2:
> +				/* no more data to read */
> +				goto igt_ktap_parser_start;
> +			case -1:
> +				/* no test found, so we keep parsing */
> +				break;
> +			case 0:
> +				/*
> +				 * tests found, but they're missing info, so we might
> +				 * have read into test output
> +				 */
> +				found_tests =3D true;
> +				sublevel++;
> +				break;
> +			default:
> +				if (fgets(record, BUF_LEN, fp) =3D=3D NULL) {
> +					if (ferror(fp))
> +						igt_warn("kmsg read failed: %s\n", strerror(errno));
> +					else
> +						igt_warn("kmsg truncated: unknown error (%m)\n");
> +					goto igt_ktap_parser_start;
> +				}
> +				found_tests =3D true;
> +				sublevel++;
> +				break;
> +			}
> +
> +			switch (parse_kmsg_for_tap(fp, record, test_name)) {
> +			case -2:
> +				goto igt_ktap_parser_start;
> +			case -1:
> +				sublevel--;
> +				failed_tests =3D true;
> +				igt_subtest(test_name)

AFAICT, igt_subtest sections can be used only in the main thread.  I think=
=20
that if we are going to parse the kernel log for ktap messages from a sub-
thread then we need to establish a communication channel for passing progre=
ss=20
to the main thread.  The main thread in turn should enter an igt_subtest=20
section when start of a new subtest is reported bu the ktap parser, then wa=
it=20
for the subtest result to be reported and either leave the section on succe=
ss=20
or igt_fail() on failure.

> +					igt_fail(IGT_EXIT_FAILURE);
> +				test_name[0] =3D '\0';
> +				break;
> +			case 0: /* fallthrough */
> +				igt_subtest(test_name)
> +					igt_success();
> +				test_name[0] =3D '\0';
> +			default:
> +				break;
> +			}
>  		}

While ktap_args.is_running can help to force the parser to exit if somethin=
g=20
goes wrong, I think we should be able to leave it when we detect end of kta=
p=20
data (sublevel < 0 ?).

Thanks,
Janusz

>  	}
> =20
>  	if (failed_tests || !found_tests)
> -		return IGT_EXIT_FAILURE;
> +		ktap_args.ret =3D IGT_EXIT_FAILURE;
> +	else
> +		ktap_args.ret =3D IGT_EXIT_SUCCESS;
> +
> +	return NULL;
> +}
> +
> +static pthread_t ktap_parser_thread;
> +
> +void ktap_parser_start(FILE *fp, bool is_builtin)
> +{
> +	ktap_args.fp =3D fp;
> +	ktap_args.is_builtin =3D is_builtin;
> +	ktap_args.is_running =3D true;
> +	pthread_create(&ktap_parser_thread, NULL, igt_ktap_parser, NULL);
> +}
> =20
> -	return IGT_EXIT_SUCCESS;
> +int ktap_parser_stop(void)
> +{
> +	ktap_args.is_running =3D false;
> +	pthread_join(ktap_parser_thread, NULL);
> +	return ktap_args.ret;
>  }
> diff --git a/lib/igt_ktap.h b/lib/igt_ktap.h
> index b2f69df2..ee6689c1 100644
> --- a/lib/igt_ktap.h
> +++ b/lib/igt_ktap.h
> @@ -26,6 +26,9 @@
> =20
>  #define BUF_LEN 4096
> =20
> -int igt_ktap_parser(FILE *fp, char *record, bool is_builtin);
> +void *igt_ktap_parser(void *unused);
> +
> +void ktap_parser_start(FILE *fp, bool is_builtin);
> +int ktap_parser_stop(void);
> =20
>  #endif /* IGT_KTAP_H */
>=20





