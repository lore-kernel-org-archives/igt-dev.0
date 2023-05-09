Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEAC10E335
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 07:22:56 +0000 (UTC)
Message-ID: <c4b3fee0-6ac9-25ce-de58-886e529bbb2a@intel.com>
Date: Tue, 9 May 2023 12:52:17 +0530
Content-Language: en-US
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
 <20230504045726.2954788-5-bhanuprakash.modem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230504045726.2954788-5-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 4/6] Revert "lib/igt_kms: Cache xe_device info
 for kms tests"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com, mchehab@kernel.org, kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com, karthik.b.s@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>



On Thu-04-05-2023 10:27 am, Bhanuprakash Modem wrote:
> As this logic is moved to driver open/close level, this is
> redundant, hence revert this logic.
> 
> This reverts commit 3e049d7c5048c8e4d0b0cfc22afca18e9e897e9a.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>   lib/igt_kms.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e085e234a..9125a8ccb 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -59,7 +59,6 @@
>   #include "igt_device.h"
>   #include "igt_sysfs.h"
>   #include "sw_sync.h"
> -#include "xe/xe_query.h"
>   #ifdef HAVE_CHAMELIUM
>   #include "igt_chamelium.h"
>   #endif
> @@ -2639,9 +2638,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   	}
>   #endif
>   
> -	if (is_xe_device(drm_fd))
> -		xe_device_get(drm_fd);
> -
>   	display->n_pipes = IGT_MAX_PIPES;
>   	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
>   	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
> @@ -2978,10 +2974,6 @@ static void igt_output_fini(igt_output_t *output)
>   void igt_display_fini(igt_display_t *display)
>   {
>   	int i;
> -	int drm_fd = display->drm_fd;
> -
> -	if (is_xe_device(drm_fd))
> -		xe_device_put(drm_fd);
>   
>   	for (i = 0; i < display->n_planes; ++i) {
>   		igt_plane_t *plane = &display->planes[i];

