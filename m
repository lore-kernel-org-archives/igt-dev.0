Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC986E06E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jan 2021 10:02:06 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210121095015.12102-1-petri.latvala@intel.com>
References: <20210121095015.12102-1-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 21 Jan 2021 10:02:02 +0000
Message-ID: <161122332222.32666.18149561892085481408@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner: Introduce a way to stop
 testing without marking tests incomplete
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2021-01-21 09:50:14)
> Killing igt_runner with SIGHUP will now still kill the currently
> running test, but it will mark that test as being "notrun" instead of
> "incomplete". This allows for external tools to interrupt the testing
> without messing the results.
> 
> Incidentally, Intel CI's testing procedures occasionally falsely
> determine that the machine being tested is unreachable and as its next
> step, will ssh in and issue a reboot in preparation for the next round
> of testing, causing igt_runner to be killed with a SIGHUP...
> 
> v2:
>  - Fix typo SIGUP -> SIGHUP
>  - Make runner print that a graceful exit will be done
>  - Explain the code flow regarding handling of signals to the runner process
>  - Use GRACEFUL_EXITCODE instead of -SIGHUP directly
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  runner/executor.c  | 31 +++++++++++++++++++++++++++++++
>  runner/resultgen.c | 10 +++++++---
>  2 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index c1a0545a..3ca2d20a 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1008,6 +1008,37 @@ static int monitor_output(pid_t child,
>                                              get_cmdline(siginfo.ssi_pid, comm, sizeof(comm)),
>                                              siginfo.ssi_pid,
>                                              strsignal(siginfo.ssi_signo));
> +
> +                                       if (siginfo.ssi_signo == SIGHUP) {

Detecting SIGHUP should do the job of catching the external shutdown.

> @@ -1106,6 +1108,8 @@ static const char *result_from_exitcode(int exitcode)
>                 return "abort";
>         case INCOMPLETE_EXITCODE:
>                 return "incomplete";
> +       case GRACEFUL_EXITCODE:
> +               return "notrun";
>         default:
>                 return "fail";
>         }
> @@ -1180,7 +1184,7 @@ static void fill_from_journal(int fd,
>                 }
>         }
>  
> -       if (subtests->size && exitcode == IGT_EXIT_ABORT) {
> +       if (subtests->size && (exitcode == IGT_EXIT_ABORT || exitcode == GRACEFUL_EXITCODE)) {
>                 char *last_subtest = subtests->subs[subtests->size - 1].name;
>                 char subtest_piglit_name[256];
>                 struct json_object *subtest_obj;
> @@ -1188,7 +1192,7 @@ static void fill_from_journal(int fd,
>                 generate_piglit_name(entry->binary, last_subtest, subtest_piglit_name, sizeof(subtest_piglit_name));
>                 subtest_obj = get_or_create_json_object(tests, subtest_piglit_name);
>  
> -               set_result(subtest_obj, "abort");
> +               set_result(subtest_obj, exitcode == IGT_EXIT_ABORT ? "abort" : "notrun");

And after a look through the resultgen, this looks to be the cases where
exitcode is used (and exitcode is derived from the atoi(journal)).

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
