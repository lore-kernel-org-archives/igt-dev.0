Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868B310E3FD
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 11:56:08 +0000 (UTC)
Date: Tue, 8 Nov 2022 12:56:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y2pD1BRp+thEZPtH@kamilkon-desk1>
References: <20221108100733.2378106-1-petri.latvala@intel.com>
 <20221108100733.2378106-2-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221108100733.2378106-2-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/6] igt_core: Split too long log
 lines when sending to runner with comms
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

Hi Petri,

On 2022-11-08 at 12:07:29 +0200, Petri Latvala wrote:
> Especially with file dumps a single log packet could exceed the max
> size of a UNIX datagram. Split too long log chunks instead.
> 
> v2: Use while loop instead of recursion (Kamil).
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_core.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3941c528..cab5f860 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -457,6 +457,27 @@ static void _igt_log_buffer_reset(void)
>  	pthread_mutex_unlock(&log_buffer_mutex);
>  }
>  
> +static void _log_to_runner_split(int stream, const char *str)
> +{
> +	size_t limit = 4096;
> +	char *buf = NULL;
> +
> +	while (strlen(str) > limit) {

Small optimization would be to get once size = strlen(str)
before while and use it in loop
	while (size > limit) {

> +		if (!buf)
> +			buf = malloc(limit + 1);
> +
> +		strncpy(buf, str, limit);
> +		buf[limit] = '\0';
> +
> +		send_to_runner(runnerpacket_log(stream, buf));
> +
> +		str += limit;

So you can add here:
		size -= limit;

With or without it

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> +	}
> +
> +	send_to_runner(runnerpacket_log(stream, str));
> +	free(buf);
> +}
> +
>  __attribute__((format(printf, 2, 3)))
>  static void _log_line_fprintf(FILE* stream, const char *format, ...)
>  {
> @@ -467,7 +488,7 @@ static void _log_line_fprintf(FILE* stream, const char *format, ...)
>  
>  	if (runner_connected()) {
>  		vasprintf(&str, format, ap);
> -		send_to_runner(runnerpacket_log(fileno(stream), str));
> +		_log_to_runner_split(fileno(stream), str);
>  		free(str);
>  	} else {
>  		vfprintf(stream, format, ap);
> -- 
> 2.30.2
> 
