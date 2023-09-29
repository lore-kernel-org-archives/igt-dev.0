Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E118310E6CC
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Sep 2023 08:31:31 +0000 (UTC)
Message-ID: <cb0a620c-bc76-b7a8-0381-71311f99da01@linux.intel.com>
Date: Fri, 29 Sep 2023 09:28:09 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
 <20230928174535.2074462-11-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230928174535.2074462-11-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 10/17] benchmarks/gem_wsim: allow
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


On 28/09/2023 18:45, Marcin Bernatowicz wrote:
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
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c  | 16 ++++++++++++++++
>   benchmarks/wsim/README |  2 ++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 8cd68058d..87c68316d 100644
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
> @@ -2421,6 +2430,13 @@ static char *load_workload_descriptor(char *filename)
>   	close(infd);
>   
>   	for (i = 0; i < len; i++) {
> +		/* '#' starts comment till end of line */
> +		if (buf[i] == '#')
> +			/* replace ',' in comments to not break parsing */
> +			while (++i < len && buf[i] != '\n')
> +				if (buf[i] == ',')
> +					buf[i] = ';';
> +
>   		if (buf[i] == '\n')
>   			buf[i] = ',';

Is it a out of bounds access here if ++i < len was hit above? Would 
happen if file ends with a hash, I think.

Maybe:

if (buf[i] == '#') {
	in_comment = true;
} else if (buf[i] == '\n')
	buf[i] = ',';
	in_comment = false;
} else if (in_comment && buf[i] == ',')
	buf[i] = ';';
}

But please triple check. :)

Regards,

Tvrtko

>   	}
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
