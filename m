Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F366E0C4
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2020 12:04:32 +0000 (UTC)
Date: Fri, 14 Feb 2020 14:04:29 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200214120429.GY25209@platvala-desk.ger.corp.intel.com>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
 <20200212132123.108506-4-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212132123.108506-4-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/9] lib: Make it possible to abort the
 whole execution from inside of a test
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

On Wed, Feb 12, 2020 at 03:21:17PM +0200, Arkadiusz Hiler wrote:
> igt_abort_on_f() is introduced which does very little cleanup and causes
> a hard exit() of the test binary with a unique exit code
> (IGT_EXIT_ABORT).
> =

> The exit code informs the monitoring process that there is a critical
> issue with the testing environment which may have an impact on the
> results if testing continues.
> =

> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/igt_core.c        |  46 ++++++++-
>  lib/igt_core.h        |  29 ++++++
>  lib/tests/igt_abort.c | 227 ++++++++++++++++++++++++++++++++++++++++++
>  lib/tests/meson.build |   1 +
>  4 files changed, 300 insertions(+), 3 deletions(-)
>  create mode 100644 lib/tests/igt_abort.c
> =

> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 51041793..8bd1e642 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -587,6 +587,7 @@ static void ftrace_dump_on_oops(bool enable)
>  }
>  =

>  bool igt_exit_called;
> +bool igt_is_aborting;
>  static void common_exit_handler(int sig)
>  {
>  	if (!igt_only_list_subtests()) {
> @@ -595,7 +596,7 @@ static void common_exit_handler(int sig)
>  =

>  	/* When not killed by a signal check that igt_exit() has been properly
>  	 * called. */
> -	assert(sig !=3D 0 || igt_exit_called);
> +	assert(sig !=3D 0 || igt_exit_called || igt_is_aborting);
>  }
>  =

>  static void print_line_wrapping(const char *indent, const char *text)
> @@ -1944,6 +1945,46 @@ void __igt_fail_assert(const char *domain, const c=
har *file, const int line,
>  	igt_fail(IGT_EXIT_FAILURE);
>  }
>  =

> +static void kill_children(void)
> +{
> +	for (int c =3D 0; c < num_test_children; c++)
> +		kill(test_children[c], SIGKILL);
> +}
> +
> +void __igt_abort(const char *domain, const char *file, const int line,
> +		 const char *func, const char *expression,
> +		 const char *f, ...)
> +{
> +	va_list args;
> +	int err =3D errno;
> +
> +	igt_is_aborting =3D true;
> +
> +	igt_log(domain, IGT_LOG_CRITICAL,
> +		"Test abort in function %s, file %s:%i:\n", func, file,
> +		line);
> +	igt_log(domain, IGT_LOG_CRITICAL, "abort condition: %s\n", expression);
> +	if (err)
> +		igt_log(domain, IGT_LOG_CRITICAL, "Last errno: %i, %s\n", err,
> +			strerror(err));
> +
> +	if (f) {
> +		va_start(args, f);
> +		igt_vlog(domain, IGT_LOG_CRITICAL, f, args);
> +		va_end(args);
> +	}
> +
> +	/* just try our best, we are aborting the execution anyway */
> +	kill_children();
> +
> +	print_backtrace();
> +
> +	if (running_under_gdb())
> +		abort();
> +
> +	exit(IGT_EXIT_ABORT);
> +}
> +
>  /**
>   * igt_exit:
>   *
> @@ -1993,8 +2034,7 @@ void igt_exit(void)
>  			 command_str, igt_exitcode);
>  	igt_debug("Exiting with status code %d\n", igt_exitcode);
>  =

> -	for (int c =3D 0; c < num_test_children; c++)
> -		kill(test_children[c], SIGKILL);
> +	kill_children();
>  	assert(!num_test_children);
>  =

>  	assert(waitpid(-1, &tmp, WNOHANG) =3D=3D -1 && errno =3D=3D ECHILD);
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index c17a7ba8..a79b41af 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -123,6 +123,14 @@ struct _GKeyFile *igt_load_igtrc(void);
>   */
>  #define IGT_EXIT_FAILURE 98
>  =

> +/**
> + * IGT_EXIT_ABORT
> + *
> + * Exit status indicating a severe test/enviroment failure, any continued
> + * testing past this point can yeild unexpected reasults and is not reco=
mmended
> + */
> +#define IGT_EXIT_ABORT 112
> +
>  bool __igt_fixture(void);
>  void __igt_fixture_complete(void);
>  void __igt_fixture_end(void) __attribute__((noreturn));
> @@ -499,6 +507,11 @@ void __igt_fail_assert(const char *domain, const cha=
r *file,
>  		       const int line, const char *func, const char *assertion,
>  		       const char *format, ...)
>  	__attribute__((noreturn));
> +__attribute__((format(printf, 6, 7)))
> +void __igt_abort(const char *domain, const char *file, const int line,
> +		 const char *func, const char *expression,
> +		 const char *f, ...)
> +	__attribute__((noreturn));
>  void igt_exit(void) __attribute__((noreturn));
>  void igt_fatal_error(void) __attribute__((noreturn));
>  =

> @@ -1027,6 +1040,22 @@ void igt_describe_f(const char *fmt, ...);
>  	else igt_debug("Test requirement passed: !(%s)\n", #expr); \
>  } while (0)
>  =

> +
> +/**
> + * igt_abort_on_f:
> + * @expr: condition to test
> + * @...: format string and optional arguments
> + *
> + * Aborts current execution if a condition is met.
> + *
> + * Should be used only when there is a serious issue with the environmen=
t and
> + * any further testing may be affected by it.
> + */
> +#define igt_abort_on_f(expr, f...) \
> +	do { if ((expr)) \
> +		__igt_abort(IGT_LOG_DOMAIN, __FILE__, __LINE__, __func__, #expr , f); \
> +	} while (0)
> +
>  /* fork support code */
>  bool __igt_fork(void);
>  =

> diff --git a/lib/tests/igt_abort.c b/lib/tests/igt_abort.c
> new file mode 100644
> index 00000000..53b7d4fd
> --- /dev/null
> +++ b/lib/tests/igt_abort.c
> @@ -0,0 +1,227 @@
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
> +#include "drmtest.h"
> +
> +#include "igt_tests_common.h"
> +
> +char test[] =3D "test";
> +char *fake_argv[] =3D { test };
> +int fake_argc =3D ARRAY_SIZE(fake_argv);
> +
> +static void fake_simple_test(void)
> +{
> +	igt_simple_init(fake_argc, fake_argv);
> +
> +	igt_abort_on_f(true, "I'm out!\n");
> +
> +	exit(0); /* unreachable */
> +}
> +
> +static void fake_fixture_test(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_fixture {
> +		igt_abort_on_f(true, "I'm out!\n");
> +	}
> +
> +	exit(0); /* unreachable */
> +}
> +
> +static void fake_outside_fixture_test(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_abort_on_f(true, "I'm out!\n");
> +
> +	exit(0); /* unreachable */
> +}
> +
> +static void fake_subtest_test(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_subtest("A")
> +		;
> +
> +	igt_subtest("B")
> +		igt_abort_on_f(true, "I'm out!\n");
> +
> +	igt_subtest("C")
> +		exit(0); /* unreachable */
> +
> +	exit(0); /* unreachable */
> +}
> +
> +static void fake_dynamic_test(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_subtest_with_dynamic("A") {
> +		igt_dynamic("AA")
> +			;
> +		igt_dynamic("AB")
> +			igt_abort_on_f(true, "I'm out!\n");
> +
> +		igt_dynamic("AC")
> +			exit(0); /* unreachable */
> +
> +	}
> +
> +	igt_subtest("B")
> +		exit(0); /* unreachable */
> +
> +	exit(0); /* unreachable */
> +}
> +
> +static void fake_outside_dynamic_test(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_subtest_with_dynamic("A") {
> +		igt_dynamic("AA")
> +			;
> +
> +		igt_abort_on_f(true, "I'm out!\n");
> +
> +		igt_dynamic("AB")
> +			exit(0); /* unreachable */
> +
> +		igt_dynamic("AC")
> +			exit(0); /* unreachable */
> +
> +	}
> +
> +	igt_subtest("B")
> +		exit(0); /* unreachable */
> +
> +	exit(0); /* unreachable */
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int status;
> +	pid_t pid;
> +
> +	/* make sure that we log the message and can abort from a simple test*/=
 {
> +		static char err[4096];
> +		int errfd;
> +
> +		pid =3D do_fork_bg_with_pipes(fake_simple_test, NULL, &errfd);
> +
> +		read_whole_pipe(errfd, err, sizeof(err));
> +
> +		internal_assert(strstr(err, "CRITICAL: Test abort"));
> +		internal_assert(strstr(err, "I'm out!"));
> +
> +		internal_assert(safe_wait(pid, &status) !=3D -1);
> +		internal_assert_wexited(status, IGT_EXIT_ABORT);
> +	}
> +
> +	/* make sure that we can abort from a fixture */ {
> +		pid =3D do_fork_bg_with_pipes(fake_fixture_test, NULL, NULL);
> +		internal_assert(safe_wait(pid, &status) !=3D -1);
> +		internal_assert_wexited(status, IGT_EXIT_ABORT);
> +	}
> +
> +	/* make sure that we can abort from outside fixture/subtest */ {
> +		pid =3D do_fork_bg_with_pipes(fake_outside_fixture_test, NULL, NULL);
> +		internal_assert(safe_wait(pid, &status) !=3D -1);
> +		internal_assert_wexited(status, IGT_EXIT_ABORT);
> +	}
> +
> +	/* make sure we abort during B and don't see B's end/C start */ {
> +		static char out[4096];
> +		int outfd;
> +
> +		pid =3D do_fork_bg_with_pipes(fake_subtest_test, &outfd, NULL);
> +
> +		read_whole_pipe(outfd, out, sizeof(out));
> +
> +		internal_assert(safe_wait(pid, &status) !=3D -1);
> +		internal_assert_wexited(status, IGT_EXIT_ABORT);
> +
> +		internal_assert(strstr(out, "Starting subtest: A"));
> +		internal_assert(strstr(out, "Subtest A:"));
> +
> +		internal_assert(strstr(out, "Starting subtest: B"));
> +		internal_assert(!strstr(out, "Subtest B:"));
> +
> +		internal_assert(!strstr(out, "Starting subtest: C"));
> +
> +		close(outfd);
> +	}
> +
> +	/* make sure we abort during AB and don't see AC/B */ {
> +		static char out[4096];
> +		int outfd;
> +
> +		pid =3D do_fork_bg_with_pipes(fake_dynamic_test, &outfd, NULL);
> +
> +		read_whole_pipe(outfd, out, sizeof(out));
> +
> +		internal_assert(safe_wait(pid, &status) !=3D -1);
> +		internal_assert_wexited(status, IGT_EXIT_ABORT);
> +
> +		internal_assert(strstr(out, "Starting subtest: A"));
> +		internal_assert(strstr(out, "Starting dynamic subtest: AA"));
> +		internal_assert(strstr(out, "Dynamic subtest AA:"));
> +
> +		internal_assert(strstr(out, "Starting dynamic subtest: AB"));
> +		internal_assert(!strstr(out, "Dynamic subtest AB:"));
> +
> +		internal_assert(!strstr(out, "Starting subtest: B"));
> +
> +		close(outfd);
> +
> +	}
> +
> +	/* make sure we abort between AA and AB */ {
> +		static char out[4096];
> +		int outfd;
> +
> +		pid =3D do_fork_bg_with_pipes(fake_outside_dynamic_test, &outfd, NULL);
> +
> +		read_whole_pipe(outfd, out, sizeof(out));
> +
> +		internal_assert(safe_wait(pid, &status) !=3D -1);
> +		internal_assert_wexited(status, IGT_EXIT_ABORT);
> +
> +		internal_assert(strstr(out, "Starting subtest: A"));
> +		internal_assert(strstr(out, "Starting dynamic subtest: AA"));
> +		internal_assert(strstr(out, "Dynamic subtest AA:"));
> +
> +		internal_assert(!strstr(out, "Starting dynamic subtest: AB"));
> +		internal_assert(!strstr(out, "Dynamic subtest AB:"));
> +
> +		internal_assert(!strstr(out, "Starting subtest: B"));
> +
> +		close(outfd);
> +
> +	}
> +
> +	return 0;
> +}
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index e5066665..e75a723a 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -1,5 +1,6 @@
>  lib_tests =3D [
>  	'igt_assert',
> +	'igt_abort',
>  	'igt_can_fail',
>  	'igt_can_fail_simple',
>  	'igt_conflicting_args',
> -- =

> 2.24.1
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
