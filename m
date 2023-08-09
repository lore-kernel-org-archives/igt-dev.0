Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E71410E418
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 11:08:50 +0000 (UTC)
Date: Wed, 9 Aug 2023 13:08:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230809110845.lt4butqgf33g3ryw@kamilkon-desk1>
References: <20230808210437.977482-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230808210437.977482-1-adrian.larumbe@collabora.com>
Subject: Re: [igt-dev] [PATCH 1/2] gputop: fix region array max iteration
 index loop bug
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 kernel@collabora.com, tvrtko.ursulin@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Adrián,

On 2023-08-08 at 22:03:30 +0100, Adrián Larumbe wrote:
> If c->regions->num_regions equals 1, then c->regions->max_region_id equals
> 0, so neither of the cumulative memory region size loops will be executed.
> Fix it by adjusting loop termination condition.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/gputop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index ac106abea2ee..ea95e0333dd2 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -166,11 +166,11 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
>  	len = printf("%*s ", c->clients->max_pid_len, c->pid_str);
>  
>  	if (c->regions->num_regions) {
> -		for (sz = 0, i = 0; i < c->regions->max_region_id; i++)
> +		for (sz = 0, i = 0; i <= c->regions->max_region_id; i++)
>  			sz += c->memory[i].total;
>  		len += print_size(sz);
>  
> -		for (sz = 0, i = 0; i < c->regions->max_region_id; i++)
> +		for (sz = 0, i = 0; i <= c->regions->max_region_id; i++)
>  			sz += c->memory[i].resident;
>  		len += print_size(sz);
>  	}
> -- 
> 2.41.0
> 
