Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229B310E1C5
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 12:49:08 +0000 (UTC)
Date: Wed, 15 Mar 2023 13:49:03 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Message-ID: <20230315134903.71c95f7b@maurocar-mobl2>
In-Reply-To: <20230315094042.5032-6-dominik.karol.piatkowski@intel.com>
References: <20230315094042.5032-1-dominik.karol.piatkowski@intel.com>
 <20230315094042.5032-6-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] Change logic of ktap parser to run
 on a thread
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 15 Mar 2023 10:40:42 +0100
Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com> wrote:

> The ktap parser should be listening and parsing messages as the tests
> are executed, and not after the end of module load.
>=20
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  lib/igt_kmod.c |  12 +++--
>  lib/igt_ktap.c | 137 +++++++++++++++++++++++++++++++------------------
>  lib/igt_ktap.h |   3 +-
>  3 files changed, 97 insertions(+), 55 deletions(-)
>=20
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 3b92cc94..23b92742 100644
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
> @@ -804,19 +803,24 @@ int igt_kunit(const char *module_name, const char *=
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
>  	}
> =20
> -	ret =3D igt_ktap_parser(f, record, is_builtin);
> -	if (ret !=3D 0)
> -		ret =3D IGT_EXIT_ABORT;
>  unload:
>  	igt_ktest_end(&tst);
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
> index 117598fa..acbb76ba 100644
> --- a/lib/igt_ktap.c
> +++ b/lib/igt_ktap.c
> @@ -10,6 +10,10 @@
>  #include "igt_core.h"
>  #include "igt_ktap.h"
> =20
> +#include <libkmod.h>
> +


> +#include <pthread.h>

Hmm... IGT has some pthread handlers. You should use them.


> +
>  static int log_to_end(enum igt_log_level level, FILE *f,
>  		      char *record, const char *format, ...) __attribute__((format(pri=
ntf, 4, 5)));
> =20
> @@ -253,6 +257,13 @@ static int parse_kmsg_for_tap(FILE *fp, char *record=
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
> @@ -264,71 +275,97 @@ static int parse_kmsg_for_tap(FILE *fp, char *recor=
d, char *test_name)
>   *
>   * Returns: IGT default codes
>   */
> -int igt_ktap_parser(FILE *fp, char *record, bool is_builtin)
> +void *igt_ktap_parser(void* unused)

Nitpick: as we use Kernel coding style, it should be:

	void *igt_ktap_parser(void *unused)


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
> +igt_ktap_parser_start:
> +	while (ktap_args.is_running) {
> +		test_name[0] =3D '\0';
> +		test_name[BUF_LEN] =3D '\0';
> +
> +		while (fgets(record, BUF_LEN, fp) !=3D NULL) {
> +			if (!ktap_args.is_running)
> +				return NULL;
> +			usleep(1000);
>  		}

Please don't add sleep, as it might lose messages on crashes.

You should probably check ferror() and/or  feof() if it returns NULL, as=20
it can indicate either:

	- that modprobe ended - so, feof() would be nonzero;
	- some error happened - so, ferror() would be nonzero.=20
	  On such case, it should likely print the error.

Also, don't call usleep(). If fp was opened on sync mode (usually the defau=
lt),
usleep is not needed at all, as fgets() will block until an error or read.=
=20

Otherwise, if fp is in async mode, you can switch to sync mode with:

	s =3D fcntl(*fd, F_GETFL);
	s |=3D O_SYNC;
	result =3D fcntl(*fd, F_SETFL, s);

and avoid the usleep().

Btw, you probably need to add error check logic too. Maybe, you could do=20
something like (untested):

	while (!feof(record)) {
		if (fgets(record, BUF_LEN, fp) =3D=3D NULL) {
			if (ferror(record))
				igt_warn("klog read failed: %s\n", strerror(errno));

			if (!ktap_args.is_running)
				return NULL;
  		}

here and the calls to fgets() below.
=20
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
> -			if (fgets(record, BUF_LEN, fp) =3D=3D NULL) {
> -				igt_warn("kmsg truncated: unknown error (%m)\n");
> -				return -2;
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
> +					igt_warn("kmsg truncated: unknown error (%m)\n");
> +					goto igt_ktap_parser_start;
> +				}
> +				found_tests =3D true;
> +				sublevel++;
> +				break;
>  			}
> -			found_tests =3D true;
> -			sublevel++;
> -			break;
> -		}
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
> +			switch (parse_kmsg_for_tap(fp, record, test_name)) {
> +			case -2:
> +				goto igt_ktap_parser_start;
> +			case -1:
> +				sublevel--;
> +				failed_tests =3D true;
> +				igt_subtest(test_name)
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
> =20
> -	return IGT_EXIT_SUCCESS;
> +void ktap_parser_start(FILE *fp, bool is_builtin)
> +{
> +	ktap_args.fp =3D fp;
> +	ktap_args.is_builtin =3D is_builtin;
> +	ktap_args.is_running =3D true;
> +	pthread_create(&ktap_parser_thread, NULL, igt_ktap_parser, NULL);
> +}
> +
> +int ktap_parser_stop(void)
> +{
> +	ktap_args.is_running =3D false;
> +	pthread_join(ktap_parser_thread, NULL);
> +	return ktap_args.ret;
>  }
> diff --git a/lib/igt_ktap.h b/lib/igt_ktap.h
> index b2f69df2..461df6f5 100644
> --- a/lib/igt_ktap.h
> +++ b/lib/igt_ktap.h
> @@ -26,6 +26,7 @@
> =20
>  #define BUF_LEN 4096
> =20
> -int igt_ktap_parser(FILE *fp, char *record, bool is_builtin);
> +void ktap_parser_start(FILE *fp, bool is_builtin);
> +int ktap_parser_stop(void);
> =20
>  #endif /* IGT_KTAP_H */
