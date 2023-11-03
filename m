Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 3 Nov 2023 19:56:08 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231103185608.r2ufhy7samn6lshy@kamilkon-desk.igk.intel.com>
References: <20231012081547.852052-1-tvrtko.ursulin@linux.intel.com>
 <20231012081547.852052-5-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231012081547.852052-5-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/9] lib/igt_drm_fdinfo: Copy over
 region map name on match
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Tvrtko,
On 2023-10-12 at 09:15:42 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> I will need some record of which regions were found for intel_gpu_top so
> lets just copy over the region name from the map on the first match.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_drm_fdinfo.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index b72822894782..222ccbfb1fd6 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -148,6 +148,10 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
>  		for (i = 0; i < region_entries; i++) {
>  			if (!strncmp(name, region_map[i], name_len)) {
>  				found = i;
> +				if (!info->region_names[info->num_regions][0]) {
> +					assert(name_len < sizeof(info->region_names[i]));
> +					strncpy(info->region_names[i], name, name_len);
> +				}
>  				break;
>  			}
>  		}
> -- 
> 2.39.2
> 
