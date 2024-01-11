Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB0E10E0C5
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 14:51:23 +0000 (UTC)
Date: Thu, 11 Jan 2024 09:51:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/3] tests/xe_waitfence: Removed drm_xe_sync data in
 exec_queue_reset_wait
Message-ID: <ZaAAZNFrRe25Atxd@intel.com>
References: <20240111062518.393544-1-krishnaiah.bommu@intel.com>
 <20240111062518.393544-3-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240111062518.393544-3-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
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

On Thu, Jan 11, 2024 at 11:55:17AM +0530, Bommu Krishnaiah wrote:
> Removed drm_xe_sync data in exec_queue_reset_wait since it was declared
> and unused, 

are you sure this is unused? or this is what will force the timeout,
then reset, then the wait_user_fence to really wait to the end?

Cc: Matthew Brost

> failure Intel XE#1081

What is 'Intel XE#1081'?

> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/intel/xe_waitfence.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index fd515a151..2f0f00cf4 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -248,16 +248,8 @@ exec_queue_reset_wait(int fd)
>  		uint32_t data;
>  	} *data;
>  
> -#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> -	struct drm_xe_sync sync[1] = {
> -		{ .flags = DRM_XE_SYNC_TYPE_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
> -			.timeline_value = USER_FENCE_VALUE },
> -	};
> -
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(sync),
>  	};
>  
>  	uint32_t vm = xe_vm_create(fd, 0, 0);
> -- 
> 2.25.1
> 
