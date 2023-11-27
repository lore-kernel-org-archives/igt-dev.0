Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4987610E067
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Nov 2023 17:10:56 +0000 (UTC)
Date: Mon, 27 Nov 2023 18:08:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231127170818.673j6qkd7jp7jeqi@kamilkon-desk.igk.intel.com>
References: <20231123085346.8067-1-lukasz.laguna@intel.com>
 <20231123085346.8067-2-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231123085346.8067-2-lukasz.laguna@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/xe/xe_query: add media GT
 presence checker
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lukasz,
On 2023-11-23 at 09:53:46 +0100, Lukasz Laguna wrote:
> Add helper checking if platform is equipped with media GT.
> 
> v2: add "lib/" prefix to subject (Kamil)
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> ---
>  lib/xe/xe_query.c | 20 ++++++++++++++++++++
>  lib/xe/xe_query.h |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index afd443be3..1759d1e93 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -711,6 +711,26 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
>  	return false;
>  }
>  
> +/**
> + * xe_has_media_gt:
> + * @fd: xe device fd
> + *
> + * Returns true if device @fd has media GT otherwise false.
> + */
> +bool xe_has_media_gt(int fd)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev = find_in_cache(fd);
> +	igt_assert(xe_dev);
> +
> +	for (int i = 0; i < xe_dev->gt_list->num_gt; i++)
> +		if (xe_dev->gt_list->gt_list[i].type == DRM_XE_QUERY_GT_TYPE_MEDIA)
> +			return true;
> +
> +	return false;
> +}
> +
>  igt_constructor
>  {
>  	xe_device_cache_init();
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 38e9aa440..66a62eeb8 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -99,6 +99,7 @@ uint16_t xe_dev_id(int fd);
>  bool xe_supports_faults(int fd);
>  const char *xe_engine_class_string(uint32_t engine_class);
>  bool xe_has_engine_class(int fd, uint16_t engine_class);
> +bool xe_has_media_gt(int fd);
>  
>  struct xe_device *xe_device_get(int fd);
>  void xe_device_put(int fd);
> -- 
> 2.40.0
> 
