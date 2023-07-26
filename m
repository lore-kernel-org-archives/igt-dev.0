Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 12:14:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230726101431.o53pbvurkpouv2mm@kamilkon-desk1>
References: <20230725205626.346256-1-rodrigo.vivi@intel.com>
 <20230725205626.346256-2-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230725205626.346256-2-rodrigo.vivi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] xe_debugfs: Remove guc_enable check.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rodrigo,

On 2023-07-25 at 16:56:25 -0400, Rodrigo Vivi wrote:
> drm-xe-next commit "drm/xe: Invert guc vs execlists parameters and info.")
> inverted the param to expose the status of the non-default config.
> 
> And commit ("drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC")
> entirely removed the query check.
> 
> So, let's simply stop doing this debugfs check here.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I am sorry, please drop my reply for 1/2 because separate 2/2 patch
break incremental compile, so merge all this into one commit.

With that you can add my r-b tag.

Regards,
Kamil

> ---
>  tests/xe/xe_debugfs.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
> index 5e16a71a0..5434d4645 100644
> --- a/tests/xe/xe_debugfs.c
> +++ b/tests/xe/xe_debugfs.c
> @@ -104,10 +104,6 @@ test_base(int fd, struct drm_xe_query_config *config)
>  
>  	igt_assert(igt_debugfs_search(fd, "info", reference));
>  
> -	sprintf(reference, "enable_guc %s", config->info[XE_QUERY_CONFIG_FLAGS] &
> -		XE_QUERY_CONFIG_FLAGS_USE_GUC ? "yes" : "no");
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> -
>  	sprintf(reference, "tile_count %lld", config->info[XE_QUERY_CONFIG_GT_COUNT]);
>  	igt_assert(igt_debugfs_search(fd, "info", reference));
>  
> -- 
> 2.41.0
> 
