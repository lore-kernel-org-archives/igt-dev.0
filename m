Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4454810E387
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 15:28:02 +0000 (UTC)
Message-ID: <3bea248a-701c-3d7f-f5df-406a0f3ab24b@linux.intel.com>
Date: Thu, 13 Apr 2023 16:27:51 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org
References: <20230407215625.1551410-1-robdclark@gmail.com>
 <20230407215625.1551410-3-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230407215625.1551410-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH igt 2/2] gputop: Add memory information
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 07/04/2023 22:56, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   lib/igt_drm_clients.c |  1 +
>   lib/igt_drm_clients.h |  3 +++
>   tools/gputop.c        | 24 ++++++++++++++++++++++--
>   3 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
> index b3eda39c..9cd5cc5d 100644
> --- a/lib/igt_drm_clients.c
> +++ b/lib/igt_drm_clients.c
> @@ -109,6 +109,7 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
>   		c->last[i] = info->busy[i];
>   	}
>   
> +	c->mem = info->mem;
>   	c->samples++;
>   	c->status = IGT_DRM_CLIENT_ALIVE;
>   }
> diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
> index df8022d4..1a631d20 100644
> --- a/lib/igt_drm_clients.h
> +++ b/lib/igt_drm_clients.h
> @@ -8,6 +8,8 @@
>   
>   #include <stdint.h>
>   
> +#include "lib/igt_drm_fdinfo.h"
> +
>   /**
>    * SECTION:igt_drm_clients
>    * @short_description: Parsing driver exposed fdinfo to track DRM clients
> @@ -56,6 +58,7 @@ struct igt_drm_client {
>   	unsigned long last_runtime; /* Aggregate busyness on all engines since previous scan. */
>   	unsigned long *val; /* Array of engine busyness data, relative to previous scan. */
>   	uint64_t *last; /* Array of engine busyness data as parsed from fdinfo. */
> +	struct drm_client_meminfo mem;
>   };
>   
>   struct igt_drm_clients {
> diff --git a/tools/gputop.c b/tools/gputop.c
> index d259cac1..76677e7d 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -28,6 +28,7 @@
>   
>   #include "igt_drm_clients.h"
>   #include "igt_drm_fdinfo.h"
> +#include "drmtest.h"
>   
>   static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>   
> @@ -67,7 +68,7 @@ static int
>   print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>   		    int *engine_w)
>   {
> -	const char *pidname = "    PID               NAME ";
> +	const char *pidname = "    PID    MEM ACTIV              NAME ";

Odd information sandwich? :) I guess it ends up looking better with the 
current alignment. Perhaps I should swap pid and name. Or push name last 
like top(1).

Anyway, I am happy that you were able to plug this into my code. Means 
it may not be completely impenetrable.

>   	int ret, len = strlen(pidname);
>   
>   	if (lines++ >= con_h || len >= con_w)
> @@ -118,6 +119,21 @@ newheader(const struct igt_drm_client *c, const struct igt_drm_client *pc)
>   	return !pc || c->drm_minor != pc->drm_minor;
>   }
>   
> +static void
> +print_size(size_t sz)
> +{
> +	char units[] = {'B', 'K', 'M', 'G'};
> +	unsigned u;
> +
> +	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
> +		if (sz < 1024)
> +			break;
> +		sz /= 1024;
> +	}
> +
> +	printf("%4zd%c ", sz, units[u]);
> +}
> +
>   static int
>   print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>   	     double t, int lines, int con_w, int con_h,
> @@ -138,7 +154,11 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>   
>   	*prevc = c;
>   
> -	printf("%8u %17s ", c->pid, c->print_name);
> +	printf("%8u ", c->pid);
> +	print_size(c->mem.shared + c->mem.private);
> +	print_size(c->mem.active);

Active is more interesting than resident?

> +	printf("%17s ", c->print_name);
> +
>   	lines++;
>   
>   	for (i = 0; c->samples > 1 && i <= c->engines->max_engine_id; i++) {

Looks fine overall.

Regards,

Tvrtko
