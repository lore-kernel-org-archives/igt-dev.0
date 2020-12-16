Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCD089ADC
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Dec 2020 18:22:33 +0000 (UTC)
Date: Wed, 16 Dec 2020 19:23:48 +0200
From: Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20201216172348.6wikkt2tkbkqnhiq@hatecraft.localdomain>
References: <20201211140735.23262-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211140735.23262-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Introduce a way to stop testing
 without marking tests incomplete
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 04:07:35PM +0200, Petri Latvala wrote:
> Killing igt_runner with SIGHUP will now still kill the currently
> running test, but it will mark that test as being "notrun" instead of
> "incomplete". This allows for external tools to interrupt the testing
> without messing the results.
> 
> Incidentally, Intel CI's testing procedures occasionally falsely
> determine that the machine being tested is unreachable and as its next
> step, will ssh in and issue a reboot in preparation for the next round
> of testing, causing igt_runner to be killed with a SIGHUP...

Fair enough.

> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  runner/executor.c  | 17 +++++++++++++++++
>  runner/resultgen.c |  9 ++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index faf272d8..d0eca938 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1054,6 +1054,23 @@ static int monitor_output(pid_t child,
>  					     get_cmdline(siginfo.ssi_pid, comm, sizeof(comm)),
>  					     siginfo.ssi_pid,
>  					     strsignal(siginfo.ssi_signo));
> +
> +					if (siginfo.ssi_signo == SIGHUP) {
> +						/*
> +						 * If taken down with
> +						 * SIGUP, arrange the

s/SIGUP/SIGHUP/

> +						 * current test to be
> +						 * marked as notrun
> +						 * instead of
> +						 * incomplete
> +						 */

Since there is no man page for the runner and this behavior is
undocumented beyond here, maybe we should outf a line explaining what
happens?

> +
> +						dprintf(outputs[_F_JOURNAL], "%s%d (%.3fs)\n",
> +							EXECUTOR_EXIT,
> +							-SIGHUP, 0.0);
> +						if (settings->sync)
> +							fdatasync(outputs[_F_JOURNAL]);
> +					}
>  				}

This feels oddly specific and doesn't reconsider the sensible behavior
for all the other signals. What about KILL, TERM, QUIT?

We should at least be more verbose about what happens with the test
that gets canceled through them.

>  
>  				aborting = true;
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 3fe83b43..d291cc37 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -17,11 +17,12 @@
>  #include "executor.h"
>  #include "output_strings.h"
>  
> -#define INCOMPLETE_EXITCODE -1
> +#define INCOMPLETE_EXITCODE -1234
>  
>  _Static_assert(INCOMPLETE_EXITCODE != IGT_EXIT_SKIP, "exit code clash");
>  _Static_assert(INCOMPLETE_EXITCODE != IGT_EXIT_SUCCESS, "exit code clash");
>  _Static_assert(INCOMPLETE_EXITCODE != IGT_EXIT_INVALID, "exit code clash");
> +_Static_assert(INCOMPLETE_EXITCODE != -SIGHUP, "exit code clash");
>  
>  struct subtest
>  {
> @@ -1099,6 +1100,8 @@ static const char *result_from_exitcode(int exitcode)
>  		return "abort";
>  	case INCOMPLETE_EXITCODE:
>  		return "incomplete";
> +	case -SIGHUP:
> +		return "notrun";

Should do for now, but NOTRUN_EXITCODE may be better. That random
-SIGHUP sprinkled around looks a bit off.

-- 
Cheers,
Arek

>  	default:
>  		return "fail";
>  	}
> @@ -1173,7 +1176,7 @@ static void fill_from_journal(int fd,
>  		}
>  	}
>  
> -	if (subtests->size && exitcode == IGT_EXIT_ABORT) {
> +	if (subtests->size && (exitcode == IGT_EXIT_ABORT || exitcode == -SIGHUP)) {
>  		char *last_subtest = subtests->subs[subtests->size - 1].name;
>  		char subtest_piglit_name[256];
>  		struct json_object *subtest_obj;
> @@ -1181,7 +1184,7 @@ static void fill_from_journal(int fd,
>  		generate_piglit_name(entry->binary, last_subtest, subtest_piglit_name, sizeof(subtest_piglit_name));
>  		subtest_obj = get_or_create_json_object(tests, subtest_piglit_name);
>  
> -		set_result(subtest_obj, "abort");
> +		set_result(subtest_obj, exitcode == IGT_EXIT_ABORT ? "abort" : "notrun");
>  	}
>  
>  	if (subtests->size == 0) {
> -- 
> 2.20.1
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
