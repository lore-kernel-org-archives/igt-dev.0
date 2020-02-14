Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78506E5D5
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2020 12:01:22 +0000 (UTC)
Date: Fri, 14 Feb 2020 14:01:20 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200214120120.GX25209@platvala-desk.ger.corp.intel.com>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
 <20200212132123.108506-3-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212132123.108506-3-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/9] lib/tests: Add support for
 redirecting fork output to /dev/null
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

On Wed, Feb 12, 2020 at 03:21:16PM +0200, Arkadiusz Hiler wrote:
> Trying to read interleaved writes is a bit tricky, so let's just use
> /dev/null if we care about contents on only one of those pipes.
> 
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/tests/igt_tests_common.h | 35 +++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/tests/igt_tests_common.h b/lib/tests/igt_tests_common.h
> index b3da3b34..f285d657 100644
> --- a/lib/tests/igt_tests_common.h
> +++ b/lib/tests/igt_tests_common.h
> @@ -28,6 +28,8 @@
>  #include <assert.h>
>  #include <sys/wait.h>
>  #include <errno.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
>  
>  /*
>   * We need to hide assert from the cocci igt test refactor spatch.
> @@ -72,19 +74,32 @@ static inline pid_t do_fork_bg_with_pipes(void (*test_to_run)(void), int *out, i
>  	int outfd[2], errfd[2];
>  	pid_t pid;
>  
> -	internal_assert(pipe(outfd) != -1);
> -	internal_assert(pipe(errfd) != -1);
> +	if (out != NULL)
> +		internal_assert(pipe(outfd) != -1);
> +
> +	if (err != NULL)
> +		internal_assert(pipe(errfd) != -1);
>  
>  	pid = fork();
>  	internal_assert(pid != -1);
>  
>  	if (pid == 0) {
> +		/* we'll leak the /dev/null fds, let them die with the forked
> +		 * process, also close reading ends if they are any */
> +		if (out == NULL)
> +			outfd[1] = open("/dev/null", O_WRONLY);
> +		else
> +			close(outfd[0]);
> +
> +		if (err == NULL)
> +			errfd[1] = open("/dev/null", O_WRONLY);
> +		else
> +			close(errfd[0]);
> +
>  		while (dup2(outfd[1], STDOUT_FILENO) == -1 && errno == EINTR) {}
>  		while (dup2(errfd[1], STDERR_FILENO) == -1 && errno == EINTR) {}
>  
> -		close(outfd[0]);
>  		close(outfd[1]);
> -		close(errfd[0]);
>  		close(errfd[1]);
>  
>  		test_to_run();
> @@ -92,11 +107,15 @@ static inline pid_t do_fork_bg_with_pipes(void (*test_to_run)(void), int *out, i
>  		exit(-1);
>  	} else {
>  		/* close the writing ends */
> -		close(outfd[1]);
> -		close(errfd[1]);
> +		if (out != NULL) {
> +			close(outfd[1]);
> +			*out = outfd[0];
> +		}
>  
> -		*out = outfd[0];
> -		*err = errfd[0];
> +		if (err != NULL) {
> +			close(errfd[1]);
> +			*err = errfd[0];
> +		}
>  
>  		return pid;
>  	}
> -- 
> 2.24.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
