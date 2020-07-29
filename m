Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02DA6E060
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2020 12:05:14 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200729113425.29486-2-petri.latvala@intel.com>
References: <20200729113425.29486-1-petri.latvala@intel.com>
 <20200729113425.29486-2-petri.latvala@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 29 Jul 2020 13:05:10 +0100
Message-ID: <159602431080.8877.7329399095158343474@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] runner: Also generate
 igt@runner@aborted when aborting internally
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-07-29 12:34:25)
> If we can't kill the (main) test process, or when the test process
> exits with IGT_EXIT_ABORT, we abort the execution. Pass that
> information along to the other machinery that tracks whether we
> aborted, thus also getting that information to the end user in the
> form of the pseudo-result igt@runner@aborted.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Cc: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  runner/executor.c | 47 ++++++++++++++++++++++++++---------------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 77818987..0377195d 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -795,10 +795,11 @@ static int next_kill_signal(int killed)
>   *  >0 - Timeout happened, need to recreate from journal
>   */
>  static int monitor_output(pid_t child,
> -                          int outfd, int errfd, int kmsgfd, int sigfd,
> -                          int *outputs,
> -                          double *time_spent,
> -                          struct settings *settings)
> +                         int outfd, int errfd, int kmsgfd, int sigfd,
> +                         int *outputs,
> +                         double *time_spent,
> +                         struct settings *settings,
> +                         char **abortreason)
>  {
>         fd_set set;
>         char buf[2048];
> @@ -1116,6 +1117,7 @@ static int monitor_output(pid_t child,
>                                 if (status == IGT_EXIT_ABORT) {
>                                         errf("Test exited with IGT_EXIT_ABORT, aborting.\n");
>                                         aborting = true;
> +                                       *abortreason = strdup("Test exited with IGT_EXIT_ABORT");
>                                 }
>  
>                                 if (time_spent)
> @@ -1142,6 +1144,7 @@ static int monitor_output(pid_t child,
>                                         if (kill(child, 0) && errno == ESRCH)
>                                                 errf("The test process no longer exists, "
>                                                      "but we didn't get informed of its demise...\n");
> +                                       asprintf(abortreason, "Child refuses to die, tainted 0x%lx.", taints);
>                                 }
>  
>                                 dump_dmesg(kmsgfd, outputs[_F_DMESG]);
> @@ -1309,7 +1312,8 @@ static int execute_next_entry(struct execute_state *state,
>                               struct settings *settings,
>                               struct job_list_entry *entry,
>                               int testdirfd, int resdirfd,
> -                             int sigfd, sigset_t *sigmask)
> +                             int sigfd, sigset_t *sigmask,
> +                             char **abortreason)
>  {
>         int dirfd;
>         int outputs[_F_LAST];
> @@ -1406,7 +1410,7 @@ static int execute_next_entry(struct execute_state *state,
>         outpipe[1] = errpipe[1] = -1;
>  
>         result = monitor_output(child, outfd, errfd, kmsgfd, sigfd,
> -                               outputs, time_spent, settings);
> +                               outputs, time_spent, settings, abortreason);
>  
>  out_kmsgfd:
>         close(kmsgfd);
> @@ -1783,7 +1787,7 @@ bool execute(struct execute_state *state,
>  
>         for (; state->next < job_list->size;
>              state->next++) {
> -               char *reason;
> +               char *reason = NULL;
>                 int result;
>  
>                 if (should_die_because_signal(sigfd)) {
> @@ -1797,7 +1801,21 @@ bool execute(struct execute_state *state,
>                                             settings,
>                                             &job_list->entries[state->next],
>                                             testdirfd, resdirfd,
> -                                           sigfd, &sigmask);
> +                                           sigfd, &sigmask,
> +                                           &reason);
> +
> +               if (reason != NULL || (reason = need_to_abort(settings)) != NULL) {
> +                       char *prev = entry_display_name(&job_list->entries[state->next]);
> +                       char *next = (state->next + 1 < job_list->size ?
> +                                     entry_display_name(&job_list->entries[state->next + 1]) :
> +                                     strdup("nothing"));
> +                       write_abort_file(resdirfd, reason, prev, next);
> +                       free(prev);
> +                       free(next);
> +                       free(reason);
> +                       status = false;
> +                       break;
> +               }

Ok, so this now checks for the termination before checking for the
overall timeout. That seems fine.

The question is whether that should be flagged as an igt@runner@aborted
as well since that is also an abnormal condition preventing the
execution of later tests.

Regardless this should fix the immediate problem of tests being cancelled
without a trace,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
