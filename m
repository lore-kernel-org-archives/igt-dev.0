Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74206E3DB
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2020 12:59:57 +0000 (UTC)
Date: Thu, 18 Jun 2020 15:59:55 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200618125955.GL20883@platvala-desk.ger.corp.intel.com>
References: <20200616141450.1181127-1-arkadiusz.hiler@intel.com>
 <20200616141450.1181127-3-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616141450.1181127-3-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] igt/core: Disallow igt_require/skip
 in non-main threads
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 16, 2020 at 05:14:50PM +0300, Arkadiusz Hiler wrote:
> Handling magic control blocks and longjmp() out of them  in threads is
> hard.
> 
> The test should state the requirements before it starts spinning
> threads.
> 
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/igt_core.c         |  3 +++
>  lib/tests/igt_thread.c | 34 +++++++++++++++++++++++++++++++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index ccf06cf4..cedd8168 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1475,6 +1475,9 @@ void __igt_skip_check(const char *file, const int line,
>  	int err = errno;
>  	char *err_str = NULL;
>  
> +	if (!igt_thread_is_main())
> +		assert(!"igt_require/skip allowed only in the main thread!");
> +
>  	if (err)
>  		igt_assert_neq(asprintf(&err_str, "Last errno: %i, %s\n", err, strerror(err)),
>  			       -1);
> diff --git a/lib/tests/igt_thread.c b/lib/tests/igt_thread.c
> index 1a734e6d..3fb90416 100644
> --- a/lib/tests/igt_thread.c
> +++ b/lib/tests/igt_thread.c
> @@ -43,6 +43,12 @@ static void *failure_thread(void *data)
>  	return NULL;
>  }
>  
> +static void *require_thread(void *data)
> +{
> +	igt_require(false);
> +	return NULL;
> +}
> +
>  static void one_subtest_fail(void) {
>  	igt_subtest_init(fake_argc, fake_argv);
>  
> @@ -103,10 +109,21 @@ static void simple_failure(void) {
>  	igt_exit();
>  }
>  
> +static void require_non_main_thread(void) {
> +	pthread_t thread;
> +
> +	igt_simple_init(fake_argc, fake_argv);
> +
> +	pthread_create(&thread, 0, require_thread, NULL);
> +	pthread_join(thread, NULL);
> +
> +	igt_exit();
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	int status;
> -	int outfd;
> +	int outfd, errfd;
>  	pid_t pid;
>  
>  	/* failing should be limited just to a single subtest */ {
> @@ -190,5 +207,20 @@ int main(int argc, char **argv)
>  		close(outfd);
>  	}
>  
> +	/* require in a thread should SIGABRT */ {
> +		static char err[4096];
> +
> +		pid = do_fork_bg_with_pipes(require_non_main_thread, NULL, &errfd);
> +
> +		read_whole_pipe(errfd, err, sizeof(err));
> +
> +		internal_assert(safe_wait(pid, &status) != -1);
> +		internal_assert_wsignaled(status, SIGABRT);
> +
> +		internal_assert(strstr(err, "allowed only in the main thread"));
> +
> +		close(errfd);
> +	}
> +
>  	return 0;
>  }
> -- 
> 2.25.4
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
