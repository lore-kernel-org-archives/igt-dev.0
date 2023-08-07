Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 7 Aug 2023 18:14:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZNFs3Y65lM1mbjth@intel.com>
References: <20230803220248.871666-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803220248.871666-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH igt] tests/xe_debugfs: Skip test
 for tile count
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 03, 2023 at 03:02:48PM -0700, Lucas De Marchi wrote:
> Once upon a time in xe, tile count and gt count were the same thing.
> This is not necessarily true anymore. Example: Meteor Lake has just
> one tile, but 2 GTs (one for graphics, one for media).
> 
> There's little value in comparing what the kernel exports via ioctl
> from what the kernel exports via debugfs. Just remove the test.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/xe/xe_debugfs.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
> index 5434d4645..e51d03661 100644
> --- a/tests/xe/xe_debugfs.c
> +++ b/tests/xe/xe_debugfs.c
> @@ -104,9 +104,6 @@ test_base(int fd, struct drm_xe_query_config *config)
>  
>  	igt_assert(igt_debugfs_search(fd, "info", reference));
>  
> -	sprintf(reference, "tile_count %lld", config->info[XE_QUERY_CONFIG_GT_COUNT]);
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
> -
>  	switch (config->info[XE_QUERY_CONFIG_VA_BITS]) {
>  	case 48:
>  		val = 3;
> -- 
> 2.40.1
> 
