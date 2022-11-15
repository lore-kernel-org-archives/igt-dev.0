Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5279F10E044
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 16:52:09 +0000 (UTC)
Date: Tue, 15 Nov 2022 17:51:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y3PDqy3e5Xbn0/Jd@kamilkon-desk1>
References: <20221115115002.2493594-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221115115002.2493594-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Use 'abort' as result if a test
 caused an abort
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-11-15 at 13:50:02 +0200, Petri Latvala wrote:
> ... when possible, which is when using socket comms.
--^ Please put here words. With that fixed

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
> 
> This changes result types for everything that causes a taint. The plan
> is to re-run this change in premerge testing multiple times to flush
> out as many of those cases as possible to adjust the cibuglog filters
> for existing issues before merging.
> 
> 
>  runner/executor.c | 40 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 2feef2c9..94d97948 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -2164,6 +2164,31 @@ static void code_coverage_stop(struct settings *settings, const char *job_name,
>  	run_as_root(argv, sigfd, abortreason);
>  }
>  
> +/* Open the comms file if the test used socket comms */
> +static int open_comms_if_valid(int resdirfd, size_t testidx)
> +{
> +	struct comms_visitor emptyvisitor = {};
> +	char name[32];
> +	int dirfd, commsfd;
> +
> +	snprintf(name, sizeof(name), "%zd", testidx);
> +	dirfd = openat(resdirfd, name, O_DIRECTORY | O_RDONLY);
> +	if (dirfd < 0)
> +		return -1;
> +
> +	commsfd = openat(dirfd, "comms", O_RDWR);
> +	close(dirfd);
> +
> +	if (commsfd < 0)
> +		return -1;
> +
> +	if (comms_read_dump(commsfd, &emptyvisitor) == COMMSPARSE_SUCCESS)
> +		return commsfd;
> +
> +	close(commsfd);
> +	return -1;
> +}
> +
>  bool execute(struct execute_state *state,
>  	     struct settings *settings,
>  	     struct job_list *job_list)
> @@ -2320,7 +2345,20 @@ bool execute(struct execute_state *state,
>  			char *next = (state->next + 1 < job_list->size ?
>  				      entry_display_name(&job_list->entries[state->next + 1]) :
>  				      strdup("nothing"));
> -			write_abort_file(resdirfd, reason, prev, next);
> +			int commsfd;
> +
> +			commsfd = open_comms_if_valid(resdirfd, state->next);
> +			if (commsfd >= 0) {
> +				lseek(commsfd, 0, SEEK_END);
> +				write_packet_with_canary(commsfd, runnerpacket_log(STDOUT_FILENO, "\nThis test caused an abort condition: "), false);
> +				write_packet_with_canary(commsfd, runnerpacket_log(STDOUT_FILENO, reason), false);
> +				write_packet_with_canary(commsfd, runnerpacket_resultoverride("abort"), settings->sync);
> +
> +				close(commsfd);
> +			} else {
> +				write_abort_file(resdirfd, reason, prev, next);
> +			}
> +
>  			free(prev);
>  			free(next);
>  			free(reason);
> -- 
> 2.30.2
> 
