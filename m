Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D10510E85A
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 11:45:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40806e40fccso5446785e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 02 Nov 2023 04:45:41 -0700 (PDT)
Message-ID: <d5330fb2-6d69-4491-aba1-2cef521bda3e@gmail.com>
Date: Thu, 2 Nov 2023 13:45:33 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231030163458.4101383-1-bhanuprakash.modem@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231030163458.4101383-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] tests/intel/kms_ccs: Avoid i915 calls on XE
 device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 30.10.2023 18.34, Bhanuprakash Modem wrote:
> For XE device, use XE specific APIs to create the BO.
> 
> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/812
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/kms_ccs.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 09b98fbec..64489b7a3 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -33,6 +33,7 @@
>   
>   #include "i915/gem_create.h"
>   #include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
>   
>   /**
>    * SUBTEST: %s-%s-%s
> @@ -431,7 +432,10 @@ static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plan
>   
>   	/* Put the CCS buffer on a different BO. */
>   	if (data->flags & TEST_BAD_CCS_HANDLE) {
> -		bad_ccs_bo = gem_create(data->drm_fd, fb.size);
> +		bad_ccs_bo = is_i915_device(data->drm_fd) ?
> +				gem_create(data->drm_fd, fb.size) :
> +				xe_bo_create_flags(data->drm_fd, 0, fb.size,
> +						   visible_vram_if_possible(data->drm_fd, 0));;

You have extra semicolon above. With that removed

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>   		f.handles[ccs_plane] = bad_ccs_bo;
>   	}
>   
