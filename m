Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABDA10E0EC
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 06:32:46 +0000 (UTC)
Date: Mon, 5 Dec 2022 07:32:40 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20221205073240.500a19f2@maurocar-mobl2>
In-Reply-To: <20221202205705.58879-2-kamil.konieczny@linux.intel.com>
References: <20221202205705.58879-1-kamil.konieczny@linux.intel.com>
 <20221202205705.58879-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 1/7] lib/igt_core: add igt_multi_fork
 for parallel tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri,  2 Dec 2022 21:56:59 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Add new macro igt_multi_fork() to igt_core. These should help in
> adding tests for multi-GPU hardware as it allows to reuse
> existing subtests which may use igt_fork() once.
>=20
> Cc: Anna Karas <anna.karas@intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM.
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/igt_core.c | 207 ++++++++++++++++++++++++++++++++++++++++++++-----
>  lib/igt_core.h |  21 +++++
>  2 files changed, 209 insertions(+), 19 deletions(-)
>=20
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index b77dca91..dca380d0 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -310,6 +310,12 @@ int num_test_children;
>  int test_children_sz;
>  bool test_child;
> =20
> +/* fork dynamic support state */
> +pid_t *test_multi_fork_children;
> +int num_test_multi_fork_children;
> +int test_multi_fork_children_sz;
> +bool test_multi_fork_child;
> +
>  /* For allocator purposes */
>  pid_t child_pid  =3D -1;
>  __thread pid_t child_tid  =3D -1;
> @@ -1560,6 +1566,16 @@ bool __igt_enter_dynamic_container(void)
>  	return true;
>  }
> =20
> +static void kill_and_wait(pid_t *pids, int size, int signum)
> +{
> +	for (int c =3D 0; c < size; c++) {
> +		if (pids[c] > 0) {
> +			kill(pids[c], signum);
> +			waitpid(pids[c], NULL, 0); /* don't leave zombies! */
> +		}
> +	}
> +}
> +
>  __noreturn static void exit_subtest(const char *result)
>  {
>  	struct timespec now;
> @@ -1569,11 +1585,13 @@ __noreturn static void exit_subtest(const char *r=
esult)
> =20
>  	igt_gettime(&now);
> =20
> +	if (test_multi_fork_child)
> +		__igt_plain_output =3D true;
> +
>  	_subtest_result_message(in_dynamic_subtest ? _SUBTEST_TYPE_DYNAMIC : _S=
UBTEST_TYPE_NORMAL,
>  				*subtest_name,
>  				result,
>  				igt_time_elapsed(thentime, &now));
> -
>  	igt_terminate_spins();
> =20
>  	/* If the subtest aborted, it may have left children behind */
> @@ -1584,6 +1602,10 @@ __noreturn static void exit_subtest(const char *re=
sult)
>  		}
>  	}
>  	num_test_children =3D 0;
> +	if (!test_multi_fork_child && num_test_multi_fork_children > 0)
> +		kill_and_wait(test_multi_fork_children, num_test_multi_fork_children, =
SIGKILL);
> +
> +	num_test_multi_fork_children =3D 0;
> =20
>  	/*
>  	 * When test completes - mostly in fail state it can leave allocated
> @@ -1605,9 +1627,10 @@ __noreturn static void exit_subtest(const char *re=
sult)
> =20
>  	/*
>  	 * Don't keep the above text in the log if exiting a dynamic
> -	 * subsubtest, the subtest would print it again otherwise
> +	 * subsubtest, the subtest would print it again otherwise.
> +	 * Also don't keep it if called from multi_fork.
>  	 */
> -	if (in_dynamic_subtest)
> +	if (in_dynamic_subtest || test_multi_fork_child)
>  		_igt_log_buffer_reset();
> =20
>  	*subtest_name =3D NULL;
> @@ -1636,6 +1659,8 @@ void igt_skip(const char *f, ...)
> =20
>  	internal_assert(!test_child,
>  			"skips are not allowed in forks\n");
> +	internal_assert(!test_multi_fork_child,
> +			"skips are not allowed in multi_fork\n");
> =20
>  	if (!igt_only_list_subtests()) {
>  		va_start(args, f);
> @@ -1778,7 +1803,7 @@ void igt_fail(int exitcode)
>  		dynamic_failed_one =3D true;
>  	} else {
>  		/* Dynamic subtest containers must not fail explicitly */
> -		assert(_igt_dynamic_tests_executed < 0 || dynamic_failed_one);
> +		assert(test_multi_fork_child || _igt_dynamic_tests_executed < 0 || dyn=
amic_failed_one);
> =20
>  		if (!failed_one)
>  			igt_exitcode =3D exitcode;
> @@ -1792,6 +1817,9 @@ void igt_fail(int exitcode)
> =20
>  	_igt_log_buffer_dump();
> =20
> +	if (test_multi_fork_child)
> +		exit(exitcode);
> +
>  	if (in_subtest) {
>  		exit_subtest("FAIL");
>  	} else {
> @@ -2156,6 +2184,11 @@ void igt_kill_children(int signal)
>  		if (test_children[c] > 0)
>  			kill(test_children[c], signal);
>  	}
> +
> +	for (int c =3D 0; c < num_test_multi_fork_children; c++) {
> +		if (test_multi_fork_children[c] > 0)
> +			kill(test_multi_fork_children[c], signal);
> +	}
>  }
> =20
>  void __igt_abort(const char *domain, const char *file, const int line,
> @@ -2241,13 +2274,17 @@ void igt_exit(void)
>  			igt_exitcode =3D IGT_EXIT_SKIP;
>  	}
> =20
> -	if (command_str)
> -		igt_kmsg(KMSG_INFO "%s: exiting, ret=3D%d\n",
> -			 command_str, igt_exitcode);
> -	igt_debug("Exiting with status code %d\n", igt_exitcode);
> +	if (!test_multi_fork_child) {
> +		/* parent will do the yelling */
> +		if (command_str)
> +			igt_kmsg(KMSG_INFO "%s: exiting, ret=3D%d\n",
> +				 command_str, igt_exitcode);
> +		igt_debug("Exiting with status code %d\n", igt_exitcode);
> +	}
> =20
>  	igt_kill_children(SIGKILL);
>  	assert(!num_test_children);
> +	assert(!num_test_multi_fork_children);
> =20
>  	assert(waitpid(-1, &tmp, WNOHANG) =3D=3D -1 && errno =3D=3D ECHILD);
> =20
> @@ -2268,8 +2305,13 @@ void igt_exit(void)
>  				result =3D "FAIL";
>  		}
> =20
> -		_log_line_fprintf(stdout, "%s (%.3fs)\n",
> -				  result, igt_time_elapsed(&subtest_time, &now));
> +		if (test_multi_fork_child) /* parent will do the yelling */
> +			_log_line_fprintf(stdout, "dyn_child pid:%d (%.3fs) ends with err=3D%=
d\n",
> +					  getpid(), igt_time_elapsed(&subtest_time, &now),
> +					  igt_exitcode);
> +		else
> +			_log_line_fprintf(stdout, "%s (%.3fs)\n",
> +					  result, igt_time_elapsed(&subtest_time, &now));
>  	}
> =20
>  	exit(igt_exitcode);
> @@ -2468,6 +2510,64 @@ bool __igt_fork(void)
> =20
>  }
> =20
> +static void dyn_children_exit_handler(int sig)
> +{
> +	int status;
> +
> +	/* The exit handler can be called from a fatal signal, so play safe */
> +	while (num_test_multi_fork_children-- && wait(&status))
> +		;
> +}
> +
> +bool __igt_multi_fork(void)
> +{
> +	internal_assert(!test_with_subtests || in_subtest,
> +			"multi-forking is only allowed in subtests or igt_simple_main\n");
> +	internal_assert(!test_child,
> +			"multi-forking is not allowed from already forked children\n");
> +	internal_assert(!test_multi_fork_child,
> +			"multi-forking is not allowed from already multi-forked children\n");
> +
> +	if (!num_test_multi_fork_children)
> +		igt_install_exit_handler(dyn_children_exit_handler);
> +
> +	if (num_test_multi_fork_children >=3D test_multi_fork_children_sz) {
> +		if (!test_multi_fork_children_sz)
> +			test_multi_fork_children_sz =3D 4;
> +		else
> +			test_multi_fork_children_sz *=3D 2;
> +
> +		test_multi_fork_children =3D realloc(test_multi_fork_children,
> +					sizeof(pid_t)*test_multi_fork_children_sz);
> +		igt_assert(test_multi_fork_children);
> +	}
> +
> +	/* ensure any buffers are flushed before fork */
> +	fflush(NULL);
> +
> +	switch (test_multi_fork_children[num_test_multi_fork_children++] =3D fo=
rk()) {
> +	case -1:
> +		num_test_multi_fork_children--; /* so we won't kill(-1) during cleanup=
 */
> +		igt_assert(0);
> +	case 0:
> +		test_multi_fork_child =3D true;
> +		snprintf(log_prefix, LOG_PREFIX_SIZE, "<g:%d> ", num_test_multi_fork_c=
hildren - 1);
> +		num_test_multi_fork_children =3D 0; /* only parent should care */
> +		pthread_mutex_init(&print_mutex, NULL);
> +		child_pid =3D getpid(); /* for allocator */
> +		child_tid =3D -1; /* for allocator */
> +		exit_handler_count =3D 0;
> +		reset_helper_process_list();
> +		oom_adjust_for_doom();
> +		igt_unshare_spins();
> +
> +		return true;
> +	default:
> +		return false;
> +	}
> +
> +}
> +
>  int __igt_waitchildren(void)
>  {
>  	int err =3D 0;
> @@ -2537,11 +2637,82 @@ int __igt_waitchildren(void)
>   */
>  void igt_waitchildren(void)
>  {
> -	int err =3D __igt_waitchildren();
> +	int err;
> +
> +	if (num_test_multi_fork_children)
> +		err =3D __igt_multi_wait();
> +	else
> +		err =3D __igt_waitchildren();
> +
>  	if (err)
>  		igt_fail(err);
>  }
> =20
> +int __igt_multi_wait(void)
> +{
> +	int err =3D 0;
> +	int count;
> +	bool was_killed =3D false;
> +
> +	assert(!test_multi_fork_child);
> +	count =3D 0;
> +	while (count < num_test_multi_fork_children) {
> +		int status =3D -1;
> +		int last =3D 0;
> +		pid_t pid;
> +		int c;
> +
> +		pid =3D wait(&status);
> +		if (pid =3D=3D -1) {
> +			if (errno =3D=3D EINTR)
> +				continue;
> +
> +			igt_debug("wait(multi_fork children running:%d) failed with %m\n",
> +				  num_test_multi_fork_children - count);
> +			return IGT_EXIT_FAILURE;
> +		}
> +
> +		for (c =3D 0; c < num_test_multi_fork_children; c++)
> +			if (pid =3D=3D test_multi_fork_children[c])
> +				break;
> +		if (c =3D=3D num_test_multi_fork_children)
> +			continue;
> +
> +		if (status !=3D 0) {
> +			if (WIFEXITED(status)) {
> +				printf("dynamic child %i pid:%d failed with exit status %i\n",
> +				       c, pid, WEXITSTATUS(status));
> +				last =3D WEXITSTATUS(status);
> +				test_multi_fork_children[c] =3D -1;
> +			} else if (WIFSIGNALED(status)) {
> +				printf("dynamic child %i pid:%d died with signal %i, %s\n",
> +				       c, pid, WTERMSIG(status),
> +				       strsignal(WTERMSIG(status)));
> +				last =3D 128 + WTERMSIG(status);
> +				test_multi_fork_children[c] =3D -1;
> +			} else {
> +				printf("Unhandled failure [%d] in dynamic child %i pid:%d\n",
> +				       status, c, pid);
> +				last =3D 256;
> +			}
> +
> +			/* we don't want to overwrite error with skip */
> +			if (err =3D=3D 0 || err =3D=3D IGT_EXIT_SKIP)
> +				err =3D last;
> +			if (err && err !=3D IGT_EXIT_SKIP && !was_killed) {
> +				igt_kill_children(SIGKILL); // if non-skip happen
> +				was_killed =3D true;
> +			}
> +		}
> +
> +		count++;
> +	}
> +
> +	num_test_multi_fork_children =3D 0;
> +
> +	return err;
> +}
> +
>  static void igt_alarm_killchildren(int signal)
>  {
>  	igt_info("Timed out waiting for children\n");
> @@ -2571,7 +2742,10 @@ void igt_waitchildren_timeout(int seconds, const c=
har *reason)
> =20
>  	alarm(seconds);
> =20
> -	ret =3D __igt_waitchildren();
> +	if (num_test_multi_fork_children)
> +		ret =3D __igt_multi_wait();
> +	else
> +		ret =3D __igt_waitchildren();
>  	igt_reset_timeout();
>  	if (ret)
>  		igt_fail(ret);
> @@ -2901,13 +3075,8 @@ void igt_vlog(const char *domain, enum igt_log_lev=
el level, const char *format,
>  	program_name =3D command_str;
>  #endif
> =20
> -
> -	if (igt_thread_is_main()) {
> -		thread_id =3D strdup("");
> -	} else {
> -		if (asprintf(&thread_id, "[thread:%d] ", gettid()) =3D=3D -1)
> -			thread_id =3D NULL;
> -	}
> +	if (asprintf(&thread_id, "[thread:%d] ", gettid()) =3D=3D -1)
> +		thread_id =3D NULL;
> =20
>  	if (!thread_id)
>  		return;
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index b659ea7b..5d5593e0 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1114,6 +1114,27 @@ void igt_waitchildren(void);
>  void igt_waitchildren_timeout(int seconds, const char *reason);
>  void igt_kill_children(int signal);
> =20
> +bool __igt_multi_fork(void);
> +/**
> + * igt_multi_fork:
> + * @child: name of the int variable with the child number
> + * @num_children: number of children to fork
> + *
> + * This is a magic control flow block which spawns parallel processes
> + * with fork() expecting there will runs without skips.
> + *
> + * The test children execute in parallel to the main test process.
> + * Joining all test threads should be done with igt_waitchildren.
> + * After multi_fork one can use igt_fork once to run more children.
> + *
> + * Like in igt_fork() any igt_skip() will cause test fail.
> + */
> +#define igt_multi_fork(child, num_children) \
> +	for (int child =3D 0; child < (num_children); child++) \
> +		for (; __igt_multi_fork(); exit(0))
> +
> +int __igt_multi_wait(void);
> +
>  /**
>   * igt_helper_process:
>   * @running: indicates whether the process is currently running
