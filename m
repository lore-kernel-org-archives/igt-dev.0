Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9376710E92E
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 18:14:40 +0000 (UTC)
Date: Thu, 7 Dec 2023 19:14:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] benchmarks/gem_wsim: Fix array index issue in
 xe_sync object referencing
Message-ID: <20231207181416.fgz366mzhr6muyov@kamilkon-desk.igk.intel.com>
References: <20231207163516.8036-1-marcin.bernatowicz@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231207163516.8036-1-marcin.bernatowicz@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Marcin,
On 2023-12-07 at 17:35:16 +0100, Marcin Bernatowicz wrote:
> During the split of xe_sync types from flags introduced in commit ce4e53b0faecde8884f1d4eac81d604b6e1904b8,
> the array index of xe_sync objects was unnecessarily incremented in one of the lines.
> This caused the next line to reference the wrong xe_sync object.
> 
> This patch fixes the array index issue, ensuring the correct xe_sync object is referenced.

No need for Cc to Francois, xe uapi was already merged.

> 
> Fixes: ce4e53b0faecde8884f1d4eac81d604b6e1904b8 ("drm-uapi/xe: Split xe_sync types from flags")
> 

Remove this empty line.

> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>

Please use only one for s-o-b, the same as From:, if you want
you can add other to Cc. Use checkpatch.pl for final check.

Regards,
Kamil

> ---
>  benchmarks/gem_wsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index e937e1027..30673da8f 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -1784,7 +1784,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>  	i = 0;
>  	/* out fence */
>  	w->xe.syncs[i].handle = syncobj_create(fd, 0);
> -	w->xe.syncs[i++].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> +	w->xe.syncs[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>  	w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>  	/* in fence(s) */
>  	for_each_dep(dep, w->data_deps) {
> -- 
> 2.31.1
> 
