Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7019F10E4CA
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 08:37:26 +0000 (UTC)
Message-ID: <8d9935c0-8fbf-9073-b6d0-97b55f01c0c3@linux.intel.com>
Date: Fri, 6 Oct 2023 09:37:22 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
 <20231005185745.3056219-10-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231005185745.3056219-10-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 09/17] benchmarks/gem_wsim: allow
 comments in workload description files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 05/10/2023 19:57, Marcin Bernatowicz wrote:
> Lines starting with '#' are skipped.
> If command line step separator (',') is encountered after '#'
> it is replaced with ';' to not break parsing.
> 
> v2:
> - SKIP step type is not needed (Tvrtko)
> v3:
> - correct README comment (Tvrtko)
> - removed hunk for trailing comments after BATCH step,
>    as some other steps do not support it either (Tvrtko)
> v4:
> - correct out of bound access if file ends with hash (Tvrtko)
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c  | 18 +++++++++++++++++-
>   benchmarks/wsim/README |  2 ++
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 2a1991ca6..43779c70e 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -43,6 +43,7 @@
>   #include <limits.h>
>   #include <pthread.h>
>   #include <math.h>
> +#include <ctype.h>
>   
>   #include "drm.h"
>   #include "drmtest.h"
> @@ -813,6 +814,14 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
>   		if (field) {
>   			fstart = NULL;
>   
> +			/* line starting with # is a comment */
> +			if (field[0] == '#') {
> +				if (verbose > 3)
> +					printf("skipped line: %s\n", _token);
> +				free(token);
> +				continue;
> +			}
> +
>   			if (!strcmp(field, "d")) {
>   				int_field(DELAY, delay, tmp <= 0,
>   					  "Invalid delay at step %u!\n");
> @@ -2403,6 +2412,7 @@ static char *load_workload_descriptor(char *filename)
>   	char *buf;
>   	int infd, ret, i;
>   	ssize_t len;
> +	bool in_comment = false;
>   
>   	ret = stat(filename, &sbuf);
>   	if (ret || !S_ISREG(sbuf.st_mode))
> @@ -2419,8 +2429,14 @@ static char *load_workload_descriptor(char *filename)
>   	close(infd);
>   
>   	for (i = 0; i < len; i++) {
> -		if (buf[i] == '\n')
> +		/* '#' starts comment till end of line */
> +		if (buf[i] == '#')
> +			in_comment = true;
> +		else if (buf[i] == '\n') {
>   			buf[i] = ',';
> +			in_comment = false;
> +		} else if (in_comment && buf[i] == ',')
> +			buf[i] = ';';

If you checked this works it looks good to me.

Perhaps just add the full text from the commit message as a comment?

/*
  * Lines starting with '#' are skipped.
  * If command line step separator (',') is encountered after '#'
  * it is replaced with ';' to not break parsing.
  */

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

>   	}
>   
>   	len--;
> diff --git a/benchmarks/wsim/README b/benchmarks/wsim/README
> index 8c71f2fe6..d4f3dd8ae 100644
> --- a/benchmarks/wsim/README
> +++ b/benchmarks/wsim/README
> @@ -1,6 +1,8 @@
>   Workload descriptor format
>   ==========================
>   
> +Lines starting with '#' are treated as comments and will not create a work step.
> +
>   ctx.engine.duration_us.dependency.wait,...
>   <uint>.<str>.<uint>[-<uint>]|*.<int <= 0>[/<int <= 0>][...].<0|1>,...
>   B.<uint>
