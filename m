Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C7F10E21D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 15:07:06 +0000 (UTC)
Date: Tue, 14 Nov 2023 16:06:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231114150607.ozwoggr5kcdrf3tt@kamilkon-desk.igk.intel.com>
References: <20231110155211.7-1-francois.dugast@intel.com>
 <20231110155211.7-3-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231110155211.7-3-francois.dugast@intel.com>
Subject: Re: [igt-dev] [PATCH v1 2/7] drm-uapi/xe: Remove GT_TYPE_REMOTE.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Francois,
On 2023-11-10 at 15:52:06 +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 

please remove last dot "." from subject (you can do it at merge):

[PATCH v1 2/7] drm-uapi/xe: Remove GT_TYPE_REMOTE.
-------------------------------------------------^

Regards,
Kamil

> Align with commit ("drm/xe/uapi: Remove GT_TYPE_REMOTE")
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
----- ^^^^^^^^^^^^^^^
Btw do you need to add yourself at Cc when you have s-o-b?

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index b316868de..8a18e1726 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -343,9 +343,8 @@ struct drm_xe_query_config {
>   */
>  struct drm_xe_query_gt {
>  #define XE_QUERY_GT_TYPE_MAIN		0
> -#define XE_QUERY_GT_TYPE_REMOTE		1
> -#define XE_QUERY_GT_TYPE_MEDIA		2
> -	/** @type: GT type: Main, Remote, or Media */
> +#define XE_QUERY_GT_TYPE_MEDIA		1
> +	/** @type: GT type: Main or Media */
>  	__u16 type;
>  	/** @gt_id: Unique ID of this GT within the PCI Device */
>  	__u16 gt_id;
> -- 
> 2.34.1
> 
