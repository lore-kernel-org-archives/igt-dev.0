Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 23 May 2023 12:50:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230523105032.twzoy4oljqpykjxy@kamilkon-desk1>
References: <20230515133630.2163170-1-tvrtko.ursulin@linux.intel.com>
 <20230515133630.2163170-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230515133630.2163170-2-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/2] gputop: Move client
 name last
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-05-15 at 14:36:29 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Move client name to be the right most field which visually aligns better
> with top(1) and prepares for inserting memory usage fields somewhere in
> the middle.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Rob Clark <robdclark@chromium.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/gputop.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 4fb5ce63e07c..681f0a6bb748 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -80,15 +80,15 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>  		return lines;
>  
>  	putchar('\n');
> -	len = printf("%*s %*s ",
> -		     c->clients->max_pid_len, "PID",
> -		     c->clients->max_name_len, "NAME");
> +	len = printf("%*s ", c->clients->max_pid_len, "PID");
>  
>  	if (c->engines->num_engines) {
>  		unsigned int i;
>  		int width;
>  
> -		*engine_w = width = (con_w - len) / c->engines->num_engines;
> +		*engine_w = width =
> +			(con_w - len - c->clients->max_name_len - 1) /
> +			c->engines->num_engines;
>  
>  		for (i = 0; i <= c->engines->max_engine_id; i++) {
>  			const char *name = c->engines->names[i];
> @@ -109,8 +109,7 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>  		}
>  	}
>  
> -	n_spaces(con_w - len);
> -	printf("\033[0m\n");
> +	printf(" %-*s\033[0m\n", con_w - len - 1, "NAME");
>  
>  	return lines;
>  }
> @@ -128,6 +127,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>  	     unsigned int period_us, int *engine_w)
>  {
>  	unsigned int i;
> +	int len;
>  
>  	/* Filter out idle clients. */
>  	if (!c->total_runtime || c->samples < 2)
> @@ -142,9 +142,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>  
>  	*prevc = c;
>  
> -	printf("%*s %*s ",
> -	       c->clients->max_pid_len, c->pid_str,
> -	       c->clients->max_name_len, c->print_name);
> +	len = printf("%*s ", c->clients->max_pid_len, c->pid_str);
>  	lines++;
>  
>  	for (i = 0; c->samples > 1 && i <= c->engines->max_engine_id; i++) {
> @@ -164,9 +162,10 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>  			pct = 100.0;
>  
>  		print_percentage_bar(pct, *engine_w);
> +		len += *engine_w;
>  	}
>  
> -	putchar('\n');
> +	printf(" %-*s\n", con_w - len - 1, c->print_name);
>  
>  	return lines;
>  }
> -- 
> 2.37.2
> 
