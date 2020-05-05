Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D336E506
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 06:41:05 +0000 (UTC)
Date: Tue, 5 May 2020 09:41:02 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200505064102.GJ9497@platvala-desk.ger.corp.intel.com>
References: <20200504112623.285610-1-arkadiusz.hiler@intel.com>
 <20200504112623.285610-3-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504112623.285610-3-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib/tests: Add tests for magic
 control blocks nesting
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 04, 2020 at 02:26:23PM +0300, Arkadiusz Hiler wrote:
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>


Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Is igt_fork usage covered elsewhere?



> ---
>  lib/tests/igt_nesting.c      | 261 +++++++++++++++++++++++++++++++++++
>  lib/tests/igt_tests_common.h |   5 +
>  lib/tests/meson.build        |   1 +
>  3 files changed, 267 insertions(+)
>  create mode 100644 lib/tests/igt_nesting.c
> =

> diff --git a/lib/tests/igt_nesting.c b/lib/tests/igt_nesting.c
> new file mode 100644
> index 00000000..de674b6b
> --- /dev/null
> +++ b/lib/tests/igt_nesting.c
> @@ -0,0 +1,261 @@
> +/*
> + * Copyright =A9 2020 Intel Corporation
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
> +#include "igt_core.h"
> +#include "igt_tests_common.h"
> +#include "drmtest.h"
> +
> +char test[] =3D "test";
> +char *fake_argv[] =3D { test };
> +int fake_argc =3D ARRAY_SIZE(fake_argv);
> +
> +static void all_valid_simple_test(void)
> +{
> +	igt_simple_init(fake_argc, fake_argv);
> +
> +	igt_skip("o:");
> +	igt_assert(false);
> +
> +	igt_exit();
> +}
> +
> +static void all_valid(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_fixture {
> +	}
> +
> +	igt_subtest_group {
> +		igt_subtest_group {
> +		}
> +
> +		igt_fixture {
> +		}
> +
> +		igt_subtest("a")
> +		{
> +			igt_skip("o:\n");
> +		}
> +
> +		igt_subtest("b")
> +		{
> +			igt_assert(false);
> +		}
> +
> +		igt_subtest_with_dynamic("c") {
> +			igt_dynamic("d")
> +			{
> +				igt_skip("o:\n");
> +			}
> +
> +			igt_dynamic("e")
> +			{
> +				igt_assert(false);
> +			}
> +		}
> +
> +		igt_subtest_with_dynamic("f") {
> +			igt_skip("o:\n");
> +		}
> +
> +		igt_subtest_with_dynamic("g") {
> +		}
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void invalid_subtest_in_simple_test(void)
> +{
> +	igt_simple_init(fake_argc, fake_argv);
> +
> +	igt_subtest("a") {
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void invalid_subtest_group_in_simple_test(void)
> +{
> +	igt_simple_init(fake_argc, fake_argv);
> +
> +	igt_subtest_group {
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void invalid_subtest_with_dynamic_in_simple_test(void)
> +{
> +	igt_simple_init(fake_argc, fake_argv);
> +
> +	igt_subtest_with_dynamic("a") {
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void invalid_dynamic_in_simple_test(void)
> +{
> +	igt_simple_init(fake_argc, fake_argv);
> +
> +	igt_dynamic("a") {
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void invalid_fixture_in_fixture(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_fixture {
> +		igt_fixture {
> +		}
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void invalid_subtest_in_subtest(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_subtest("a") {
> +		igt_subtest("b") {
> +		}
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void invalid_top_level_dynamic(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_dynamic("a") {
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void invalid_dynamic_in_regular_subtest(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_subtest("a") {
> +		igt_dynamic("b") {
> +		}
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void invalid_fixture_in_subtest(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_subtest("a") {
> +		igt_fixture {
> +		}
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void invalid_top_level_skip(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_skip("o:\n");
> +
> +	igt_exit();
> +}
> +
> +static void invalid_top_level_assert(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_assert(false);
> +
> +	igt_exit();
> +}
> +
> +static void invalid_dynamic_in_dynamic(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_subtest_with_dynamic("a") {
> +		igt_dynamic("b") {
> +			igt_dynamic("c") {
> +			}
> +		}
> +	}
> +
> +	igt_exit();
> +}
> +
> +typedef void (*fork_fun)(void);
> +
> +int main(int argc, char **argv)
> +{
> +	int status;
> +
> +	/* test the invalid nesting scenarios */ {
> +		fork_fun should_sigabort[] =3D {
> +			invalid_subtest_in_simple_test,
> +			invalid_subtest_group_in_simple_test,
> +			invalid_subtest_with_dynamic_in_simple_test,
> +			invalid_dynamic_in_simple_test,
> +			invalid_fixture_in_fixture,
> +			invalid_subtest_in_subtest,
> +			invalid_top_level_dynamic,
> +			invalid_dynamic_in_regular_subtest,
> +			invalid_fixture_in_subtest,
> +			invalid_top_level_skip,
> +			invalid_top_level_assert,
> +			invalid_dynamic_in_dynamic,
> +		};
> +
> +		for (int i =3D 0; i < ARRAY_SIZE(should_sigabort); ++i) {
> +			status =3D do_fork(should_sigabort[i]);
> +			internal_assert_wsignaled(status, SIGABRT);
> +		}
> +	}
> +
> +	/* test the valid nesting scenarios */ {
> +		fork_fun should_not_signal[] =3D {
> +			all_valid_simple_test,
> +			all_valid,
> +		};
> +
> +		for (int i =3D 0; i < ARRAY_SIZE(should_not_signal); ++i) {
> +			status =3D do_fork(should_not_signal[i]);
> +			internal_assert_not_wsignaled(status);
> +		}
> +	}
> +
> +	return 0;
> +}
> diff --git a/lib/tests/igt_tests_common.h b/lib/tests/igt_tests_common.h
> index f285d657..fa8ad920 100644
> --- a/lib/tests/igt_tests_common.h
> +++ b/lib/tests/igt_tests_common.h
> @@ -51,6 +51,11 @@ static inline void internal_assert_wsignaled(int wstat=
us, int signal)
>  			WTERMSIG(wstatus) =3D=3D signal);
>  }
>  =

> +static inline void internal_assert_not_wsignaled(int wstatus)
> +{
> +	internal_assert(!WIFSIGNALED(wstatus));
> +}
> +
>  static inline int do_fork(void (*test_to_run)(void))
>  {
>  	int pid, status;
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index 22aa19da..47ef303a 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -12,6 +12,7 @@ lib_tests =3D [
>  	'igt_fork_helper',
>  	'igt_list_only',
>  	'igt_invalid_subtest_name',
> +	'igt_nesting',
>  	'igt_no_exit',
>  	'igt_segfault',
>  	'igt_simulation',
> -- =

> 2.25.2
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
