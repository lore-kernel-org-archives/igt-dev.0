Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA5D10E058
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Apr 2023 23:47:04 +0000 (UTC)
Message-ID: <4350fc32-1285-60e8-e519-738f3769bc78@intel.com>
Date: Mon, 3 Apr 2023 02:46:36 +0300
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230329115642.244296-1-matthew.auld@intel.com>
 <20230329115642.244296-2-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230329115642.244296-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] xe: sync small-bar uapi
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

btw, The kernel patch hasn't been merged into drm-xe yet, are there any 
blockers to merge it?

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 3/29/23 2:56 PM, Matthew Auld wrote:
> We need a couple new fields for the region query and the new flag to
> ensure the buffer is CPU accessible.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   include/drm-uapi/xe_drm.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 593b01ba..441b377b 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -169,7 +169,9 @@ struct drm_xe_query_mem_usage {
>   		__u32 max_page_size;
>   		__u64 total_size;
>   		__u64 used;
> -		__u64 reserved[8];
> +		__u64 cpu_visible_size;
> +		__u64 cpu_visible_used;
> +		__u64 reserved[6];
>   	} regions[];
>   };
>   
> @@ -270,6 +272,7 @@ struct drm_xe_gem_create {
>   	 */
>   #define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
>   #define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
> +#define XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
>   	__u32 flags;
>   
>   	/**
