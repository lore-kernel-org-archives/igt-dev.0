Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C924710E159
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 15:19:21 +0000 (UTC)
Message-ID: <94672f31-599f-1926-d7dd-9ba4006d76e3@linux.intel.com>
Date: Thu, 13 Apr 2023 16:18:59 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org
References: <20230407215625.1551410-1-robdclark@gmail.com>
 <20230407215625.1551410-2-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230407215625.1551410-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH igt 1/2] lib/igt_drm_fdinfo: Parse memory usage
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
> Add parsing for the memory usage related fdinfo stats.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   lib/igt_drm_fdinfo.c | 39 +++++++++++++++++++++++++++++++++++++++
>   lib/igt_drm_fdinfo.h |  9 +++++++++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index b850d221..6269e166 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -124,6 +124,34 @@ static const char *find_kv(const char *buf, const char *key, size_t keylen)
>   	return *p ? p : NULL;
>   }
>   
> +static size_t find_mem_kv(const char *buf, const char *key)
> +{
> +	const char *val = find_kv(buf, key, strlen(key));

If you were asking yourself why I made strlen an argument to find_kv I 
have to admit I micro-optimized it a bit based on profiling. Sad fact is 
hunting for drm fdinfo in procfs sucks and gputop uses more CPU time 
than top, to even display less data. More processes with more open files 
there are, even when the 99.9% are not DRM, more taxing it is.

So I'd suggest sticking to the micro-optimized pattern. :(

> +	char *p, *unit = NULL;
> +	size_t sz;
> +
> +	if (!val)
> +		return 0;
> +
> +	sz = atoi(val);

Maybe atol and unsigned long instead of size_t would be better for the 
counts throughout? Or uint64_t?

> +
> +	p = index(val, ' ');

Ok, or can use the flexible method from find_kv which skips any amount 
of any whitespace.

> +	if (!p)
> +		return sz;
> +
> +	unit = ++p;
> +
> +	if (!strcmp(unit, "KiB")) {
> +		sz *= 1024;
> +	} else if (!strcmp(unit, "MiB")) {
> +		sz *= 1024 * 1024;
> +	} else if (!strcmp(unit, "GiB")) {
> +		sz *= 1024 * 1024 * 1024;
> +	}
> +
> +	return sz;
> +}
> +
>   unsigned int
>   __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   		       const char **name_map, unsigned int map_entries)
> @@ -140,6 +168,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   	while ((l = strtok_r(_buf, "\n", &ctx))) {
>   		uint64_t val = 0;
>   		const char *v;
> +		size_t sz;
>   		int idx;
>   
>   		_buf = NULL;
> @@ -173,6 +202,16 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>   				info->capacity[idx] = val;
>   				num_capacity++;
>   			}
> +		} else if ((sz = find_mem_kv(l, "drm-shared-memory"))) {
> +			info->mem.shared = sz;
> +		} else if ((sz = find_mem_kv(l, "drm-private-memory"))) {
> +			info->mem.private = sz;
> +		} else if ((sz = find_mem_kv(l, "drm-resident-memory"))) {
> +			info->mem.resident = sz;
> +		} else if ((sz = find_mem_kv(l, "drm-purgeable-memory"))) {
> +			info->mem.purgeable = sz;
> +		} else if ((sz = find_mem_kv(l, "drm-active-memory"))) {
> +			info->mem.active = sz;

Okay there's an open on key naming and if we went with drm-memory-... 
this could be done with just one strncmp on non-matching lines. Depends 
on the open.

>   		}
>   	}
>   
> diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
> index 6284e05e..dd4bdd54 100644
> --- a/lib/igt_drm_fdinfo.h
> +++ b/lib/igt_drm_fdinfo.h
> @@ -32,6 +32,14 @@
>   
>   #define DRM_CLIENT_FDINFO_MAX_ENGINES 16
>   
> +struct drm_client_meminfo {
> +	size_t shared;
> +	size_t private;
> +	size_t resident;
> +	size_t purgeable;
> +	size_t active;
> +};
> +
>   struct drm_client_fdinfo {
>   	char driver[128];
>   	char pdev[128];
> @@ -42,6 +50,7 @@ struct drm_client_fdinfo {
>   	unsigned int capacity[DRM_CLIENT_FDINFO_MAX_ENGINES];
>   	char names[DRM_CLIENT_FDINFO_MAX_ENGINES][256];
>   	uint64_t busy[DRM_CLIENT_FDINFO_MAX_ENGINES];
> +	struct drm_client_meminfo mem;
>   };
>   
>   /**

Regards,

Tvrtko
