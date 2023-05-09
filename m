Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CFA10E226
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 13:47:34 +0000 (UTC)
Date: Tue, 9 May 2023 15:47:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230509134728.2o5aq3bqc5d7i6vq@kamilkon-desk1>
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
 <20230504045726.2954788-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230504045726.2954788-5-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 4/6] Revert "lib/igt_kms: Cache xe_device info
 for kms tests"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-05-04 at 10:27:24 +0530, Bhanuprakash Modem wrote:
> As this logic is moved to driver open/close level, this is
> redundant, hence revert this logic.
------------------------- ^^^^^^^^^^
s/this logic/it/

> 
> This reverts commit 3e049d7c5048c8e4d0b0cfc22afca18e9e897e9a.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Please make it last patch in this series.

Regards,
Kamil

> ---
>  lib/igt_kms.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e085e234a..9125a8ccb 100644
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
> @@ -2639,9 +2638,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	}
>  #endif
>  
> -	if (is_xe_device(drm_fd))
> -		xe_device_get(drm_fd);
> -
>  	display->n_pipes = IGT_MAX_PIPES;
>  	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
>  	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
> @@ -2978,10 +2974,6 @@ static void igt_output_fini(igt_output_t *output)
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
