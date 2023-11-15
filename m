Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1705010E54D
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 12:32:51 +0000 (UTC)
Date: Wed, 15 Nov 2023 13:32:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231115123225.ma3n2hspzyrinwz6@kamilkon-desk.igk.intel.com>
References: <20231110142440.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231110142440.7-1-francois.dugast@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] drm-uapi/xe: Add check for access
 counter granularity
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

Hi Francois,
On 2023-11-10 at 14:24:40 +0000, Francois Dugast wrote:
> Align with commit ("drm/xe/xe_exec_queue: Add check for access counter granularity")
> 
> CC: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
- ^^
s/CC/Cc/

With or without that:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index d6dd9a388..b316868de 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -730,6 +730,20 @@ struct drm_xe_vm_bind {
>  	__u64 reserved[2];
>  };
>  
> +/* For use with XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY */
> +
> +/* Monitor 128KB contiguous region with 4K sub-granularity */
> +#define XE_ACC_GRANULARITY_128K 0
> +
> +/* Monitor 2MB contiguous region with 64KB sub-granularity */
> +#define XE_ACC_GRANULARITY_2M 1
> +
> +/* Monitor 16MB contiguous region with 512KB sub-granularity */
> +#define XE_ACC_GRANULARITY_16M 2
> +
> +/* Monitor 64MB contiguous region with 2M sub-granularity */
> +#define XE_ACC_GRANULARITY_64M 3
> +
>  /**
>   * struct drm_xe_exec_queue_set_property - exec queue set property
>   *
> -- 
> 2.34.1
> 
