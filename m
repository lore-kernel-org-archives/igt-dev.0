Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B6D10E592
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 08:03:13 +0000 (UTC)
Date: Wed, 24 May 2023 10:03:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230524080309.h5u3y3geirg72a32@kamilkon-desk1>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
 <20230516165058.4047595-21-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230516165058.4047595-21-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 20/20] Revert "lib/igt_kms: Cache xe_device
 info for kms tests"
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

On 2023-05-16 at 22:20:58 +0530, Bhanuprakash Modem wrote:
> As this logic is moved to driver open/close level, this is
> redundant, hence revert this logic.
> 
> This reverts commit 3e049d7c5048c8e4d0b0cfc22afca18e9e897e9a.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kms.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c54841486..bb3b924c9 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -59,7 +59,6 @@
>  #include "igt_device.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> -#include "xe/xe_query.h"
>  #ifdef HAVE_CHAMELIUM
>  #include "igt_chamelium.h"
>  #endif
> @@ -2657,9 +2656,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	}
>  #endif
>  
> -	if (is_xe_device(drm_fd))
> -		xe_device_get(drm_fd);
> -
>  	display->n_pipes = IGT_MAX_PIPES;
>  	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
>  	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
> @@ -2996,10 +2992,6 @@ static void igt_output_fini(igt_output_t *output)
>  void igt_display_fini(igt_display_t *display)
>  {
>  	int i;
> -	int drm_fd = display->drm_fd;
> -
> -	if (is_xe_device(drm_fd))
> -		xe_device_put(drm_fd);
>  
>  	for (i = 0; i < display->n_planes; ++i) {
>  		igt_plane_t *plane = &display->planes[i];
> -- 
> 2.40.0
> 
