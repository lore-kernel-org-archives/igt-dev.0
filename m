Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D026E3DB
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2020 12:59:08 +0000 (UTC)
Date: Thu, 18 Jun 2020 15:59:06 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200618125906.GK20883@platvala-desk.ger.corp.intel.com>
References: <20200616141450.1181127-1-arkadiusz.hiler@intel.com>
 <20200616141450.1181127-2-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616141450.1181127-2-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/core: Handle asserts in threads
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

On Tue, Jun 16, 2020 at 05:14:49PM +0300, Arkadiusz Hiler wrote:
> Since IGT is using magic control blocks (igt_subtest et al.) asserts
> jump out the them using longjmp() causing a bunch of confusing messages
> and occasionally crashing the whole process.
> =

> This is not the behavior we want :-)
> =

> With this patch:
> =

> 1. simple_main, dynamic and subtest each clears the thread failure state
>    at the start
> =

> 2. each of those blocks also asserts no thread failures at the end
> =

> 3. igt_assert() in non-main thread prints out the error + stacktrace
>    and marks that we have failed thread
> =

> Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/55
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  lib/igt_core.c               |  12 +++
>  lib/igt_thread.c             |  30 ++++++
>  lib/igt_thread.h             |   4 +
>  lib/tests/igt_tests_common.h |  22 ++++
>  lib/tests/igt_thread.c       | 194 +++++++++++++++++++++++++++++++++++
>  lib/tests/meson.build        |   1 +
>  6 files changed, 263 insertions(+)
>  create mode 100644 lib/tests/igt_thread.c
> =

> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index c95295c7..ccf06cf4 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1272,6 +1272,7 @@ bool __igt_run_subtest(const char *subtest_name, co=
nst char *file, const int lin
>  		fprintf(stderr, "Starting subtest: %s\n", subtest_name);
>  =

>  	_igt_log_buffer_reset();
> +	igt_thread_clear_fail_state();
>  =

>  	igt_gettime(&subtest_time);
>  	return (in_subtest =3D subtest_name);
> @@ -1302,6 +1303,7 @@ bool __igt_run_dynamic_subtest(const char *dynamic_=
subtest_name)
>  		fprintf(stderr, "Starting dynamic subtest: %s\n", dynamic_subtest_name=
);
>  =

>  	_igt_log_buffer_reset();
> +	igt_thread_clear_fail_state();
>  =

>  	_igt_dynamic_tests_executed++;
>  =

> @@ -1510,6 +1512,8 @@ void __igt_skip_check(const char *file, const int l=
ine,
>   */
>  void igt_success(void)
>  {
> +	igt_thread_assert_no_failures();
> +
>  	if (in_subtest && !in_dynamic_subtest && _igt_dynamic_tests_executed >=
=3D 0) {
>  		/*
>  		 * We're exiting a dynamic container, yield a result
> @@ -1549,6 +1553,11 @@ void igt_fail(int exitcode)
>  {
>  	assert(exitcode !=3D IGT_EXIT_SUCCESS && exitcode !=3D IGT_EXIT_SKIP);
>  =

> +	if (!igt_thread_is_main()) {
> +		igt_thread_fail();
> +		pthread_exit(NULL);
> +	}
> +
>  	igt_debug_wait_for_keypress("failure");
>  =

>  	/* Exit immediately if the test is already exiting and igt_fail is
> @@ -2049,6 +2058,9 @@ void igt_exit(void)
>  {
>  	int tmp;
>  =

> +	if (!test_with_subtests)
> +		igt_thread_assert_no_failures();
> +
>  	igt_exit_called =3D true;
>  =

>  	if (igt_key_file)
> diff --git a/lib/igt_thread.c b/lib/igt_thread.c
> index deab6225..5bdda410 100644
> --- a/lib/igt_thread.c
> +++ b/lib/igt_thread.c
> @@ -22,12 +22,42 @@
>   */
>  =

>  #include <pthread.h>
> +#include <stdlib.h>
> +#include <stdatomic.h>
>  =

>  #include "igt_core.h"
>  #include "igt_thread.h"
>  =

>  static pthread_key_t __igt_is_main_thread;
>  =

> +static _Atomic(bool) __thread_failed =3D false;
> +
> +void igt_thread_clear_fail_state(void)
> +{
> +	assert(igt_thread_is_main());
> +
> +	__thread_failed =3D false;
> +}
> +
> +void igt_thread_fail(void)
> +{
> +	assert(!igt_thread_is_main());
> +
> +	__thread_failed =3D true;
> +}
> +
> +void igt_thread_assert_no_failures(void)
> +{
> +	assert(igt_thread_is_main());
> +
> +	if (__thread_failed) {
> +		/* so we won't get stuck in a loop */
> +		igt_thread_clear_fail_state();
> +		igt_critical("Failure in a thread!\n");
> +		igt_fail(IGT_EXIT_FAILURE);
> +	}
> +}
> +
>  bool igt_thread_is_main(void)
>  {
>  	return pthread_getspecific(__igt_is_main_thread) !=3D NULL;
> diff --git a/lib/igt_thread.h b/lib/igt_thread.h
> index b16f803f..4b9c222d 100644
> --- a/lib/igt_thread.h
> +++ b/lib/igt_thread.h
> @@ -21,4 +21,8 @@
>   * IN THE SOFTWARE.
>   */
>  =

> +void igt_thread_clear_fail_state(void);
> +void igt_thread_fail(void);
> +void igt_thread_assert_no_failures(void);
> +
>  bool igt_thread_is_main(void);
> diff --git a/lib/tests/igt_tests_common.h b/lib/tests/igt_tests_common.h
> index fa8ad920..058f6265 100644
> --- a/lib/tests/igt_tests_common.h
> +++ b/lib/tests/igt_tests_common.h
> @@ -30,6 +30,7 @@
>  #include <errno.h>
>  #include <sys/stat.h>
>  #include <fcntl.h>
> +#include <regex.h>
>  =

>  /*
>   * We need to hide assert from the cocci igt test refactor spatch.
> @@ -161,4 +162,25 @@ static inline void read_whole_pipe(int fd, char *buf=
, size_t buflen)
>  		offset +=3D readlen;
>  	}
>  }
> +
> +static inline bool matches(char *str, const char *regex)
> +{
> +	int ret;
> +	regex_t reg;
> +
> +	ret =3D regcomp(&reg, regex, REG_EXTENDED | REG_NEWLINE);
> +
> +	if (ret =3D=3D 0)
> +		ret =3D regexec(&reg, str, 0, NULL, 0);
> +
> +	if (0 !=3D ret && REG_NOMATCH !=3D ret) {
> +		char err[256];
> +		regerror(ret, &reg, err, sizeof(err));
> +		printf("%s\n", err);
> +		abort();
> +	}
> +
> +	regfree(&reg);
> +	return !ret;
> +}
>  #endif
> diff --git a/lib/tests/igt_thread.c b/lib/tests/igt_thread.c
> new file mode 100644
> index 00000000..1a734e6d
> --- /dev/null
> +++ b/lib/tests/igt_thread.c
> @@ -0,0 +1,194 @@
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
> +#include <pthread.h>
> +
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "igt_tests_common.h"
> +
> +char prog[] =3D "igt_thread";
> +char *fake_argv[] =3D { prog };
> +int fake_argc =3D ARRAY_SIZE(fake_argv);
> +
> +static void *succes_thread(void *data)

Typo in the name: succes -> success

Otherwise,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> +{
> +	return NULL;
> +}
> +
> +static void *failure_thread(void *data)
> +{
> +	igt_assert(false);
> +	return NULL;
> +}
> +
> +static void one_subtest_fail(void) {
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_subtest("subtest-a") {
> +		pthread_t thread;
> +		pthread_create(&thread, 0, failure_thread, NULL);
> +		pthread_join(thread, NULL);
> +	}
> +
> +	igt_subtest("subtest-b") {
> +		pthread_t thread;
> +		pthread_create(&thread, 0, succes_thread, NULL);
> +		pthread_join(thread, NULL);
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void one_dynamic_fail(void) {
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_subtest_with_dynamic("dynamic-container") {
> +		igt_dynamic("dynamic-a") {
> +			pthread_t thread;
> +			pthread_create(&thread, 0, failure_thread, NULL);
> +			pthread_join(thread, NULL);
> +		}
> +
> +		igt_dynamic("dynamic-b") {
> +			pthread_t thread;
> +			pthread_create(&thread, 0, succes_thread, NULL);
> +			pthread_join(thread, NULL);
> +		}
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void simple_success(void) {
> +	pthread_t thread;
> +
> +	igt_simple_init(fake_argc, fake_argv);
> +
> +	pthread_create(&thread, 0, succes_thread, NULL);
> +	pthread_join(thread, NULL);
> +
> +	igt_exit();
> +}
> +
> +static void simple_failure(void) {
> +	pthread_t thread;
> +
> +	igt_simple_init(fake_argc, fake_argv);
> +
> +	pthread_create(&thread, 0, failure_thread, NULL);
> +	pthread_join(thread, NULL);
> +
> +	igt_exit();
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int status;
> +	int outfd;
> +	pid_t pid;
> +
> +	/* failing should be limited just to a single subtest */ {
> +		static char out[4096];
> +
> +		pid =3D do_fork_bg_with_pipes(one_subtest_fail, &outfd, NULL);
> +
> +		read_whole_pipe(outfd, out, sizeof(out));
> +
> +		internal_assert(safe_wait(pid, &status) !=3D -1);
> +		internal_assert_wexited(status, IGT_EXIT_FAILURE);
> +
> +		internal_assert(matches(out, "\\[thread:.*\\] Stack trace"));
> +		internal_assert(strstr(out, "Subtest subtest-a: FAIL"));
> +		internal_assert(strstr(out, "Subtest subtest-b: SUCCESS"));
> +
> +		close(outfd);
> +	}
> +
> +	/* failing should be limited just to a dynamic subsubtest */ {
> +		static char out[4096];
> +
> +		pid =3D do_fork_bg_with_pipes(one_dynamic_fail, &outfd, NULL);
> +
> +		read_whole_pipe(outfd, out, sizeof(out));
> +
> +		internal_assert(safe_wait(pid, &status) !=3D -1);
> +		internal_assert_wexited(status, IGT_EXIT_FAILURE);
> +
> +		internal_assert(matches(out, "\\[thread:.*\\] Stack trace"));
> +		internal_assert(strstr(out, "Dynamic subtest dynamic-a: FAIL"));
> +		internal_assert(strstr(out, "Dynamic subtest dynamic-b: SUCCESS"));
> +
> +		close(outfd);
> +	}
> +
> +	/* success in a simple test */ {
> +		static char out[4096];
> +
> +		pid =3D do_fork_bg_with_pipes(simple_success, &outfd, NULL);
> +
> +		read_whole_pipe(outfd, out, sizeof(out));
> +
> +		internal_assert(safe_wait(pid, &status) !=3D -1);
> +		internal_assert_wexited(status, IGT_EXIT_SUCCESS);
> +
> +
> +		internal_assert(matches(out, "^SUCCESS"));
> +
> +		close(outfd);
> +	}
> +
> +	/* success in a simple test */ {
> +		static char out[4096];
> +
> +		pid =3D do_fork_bg_with_pipes(simple_success, &outfd, NULL);
> +
> +		read_whole_pipe(outfd, out, sizeof(out));
> +
> +		internal_assert(safe_wait(pid, &status) !=3D -1);
> +		internal_assert_wexited(status, IGT_EXIT_SUCCESS);
> +
> +		internal_assert(matches(out, "^SUCCESS"));
> +
> +		close(outfd);
> +	}
> +
> +	/* failure in a simple test */ {
> +		static char out[4096];
> +
> +		pid =3D do_fork_bg_with_pipes(simple_failure, &outfd, NULL);
> +
> +		read_whole_pipe(outfd, out, sizeof(out));
> +
> +		internal_assert(safe_wait(pid, &status) !=3D -1);
> +		internal_assert_wexited(status, IGT_EXIT_FAILURE);
> +
> +		internal_assert(matches(out, "\\[thread:.*\\] Stack trace"));
> +		internal_assert(matches(out, "^FAIL"));
> +
> +		close(outfd);
> +	}
> +
> +	return 0;
> +}
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index 47ef303a..9cf5ff47 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -18,6 +18,7 @@ lib_tests =3D [
>  	'igt_simulation',
>  	'igt_stats',
>  	'igt_subtest_group',
> +	'igt_thread',
>  	'i915_perf_data_alignment',
>  ]
>  =

> -- =

> 2.25.4
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
