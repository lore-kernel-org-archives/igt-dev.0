Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C6610E7A6
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 01:30:35 +0000 (UTC)
Date: Wed, 6 Dec 2023 18:29:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZXC9kYXvhGehJJa7@DUT025-TGLU.fm.intel.com>
References: <20231207012623.15901-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207012623.15901-1-brian.welty@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe_query: Fix xe_supports_faults()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 05:26:23PM -0800, Brian Welty wrote:
> In recent uAPI changes, it was missed that setting VM_CREATE_FLAG_FAULT_MODE
> requires VM_CREATE_FLAG_LR_MODE in this query routine.
> 
> Fixes: dc71419700 (tests/intel/xe: Adjust to KMD uAPI changes for long-running VMs)
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/997
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  lib/xe/xe_query.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 3ebce83615..701fe1d1ea 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -312,6 +312,7 @@ bool xe_supports_faults(int fd)
>  
>  	struct drm_xe_vm_create create = {
>  		.flags = DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
> +			 DRM_XE_VM_CREATE_FLAG_LR_MODE |
>  			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>  	};
>  
> -- 
> 2.38.0
> 
