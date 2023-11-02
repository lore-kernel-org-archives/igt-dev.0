Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C14710E85A
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 11:51:45 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c523ac38fbso11779921fa.0
 for <igt-dev@lists.freedesktop.org>; Thu, 02 Nov 2023 04:51:45 -0700 (PDT)
Message-ID: <8a4643a8-22ce-4aeb-aecb-c8cf60c87e9e@gmail.com>
Date: Thu, 2 Nov 2023 13:51:37 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231030160804.4083739-1-bhanuprakash.modem@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231030160804.4083739-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t] lib/intel_aux_pgtable: Add XE support for
 pagetable mapping
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 30.10.2023 18.08, Bhanuprakash Modem wrote:
> For XE device, use XE specific APIs to map pagetable.
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/intel_aux_pgtable.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index 7c7952134..3cbb0e26f 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -9,6 +9,7 @@
>   #include "ioctl_wrappers.h"
>   
>   #include "i915/gem_mman.h"
> +#include "xe/xe_ioctl.h"
>   
>   #define BITMASK(e, s)		((~0ULL << (s)) & \
>   				 (~0ULL >> (BITS_PER_LONG_LONG - 1 - (e))))
> @@ -371,10 +372,13 @@ pgt_populate_entries_for_buf(struct pgtable *pgt,
>   	}
>   }
>   
> -static void pgt_map(int i915, struct pgtable *pgt)
> +static void pgt_map(int drm_fd, struct pgtable *pgt)
>   {
> -	pgt->ptr = gem_mmap__device_coherent(i915, pgt->buf->handle, 0,
> -					     pgt->size, PROT_READ | PROT_WRITE);
> +	pgt->ptr = is_i915_device(drm_fd) ?
> +			gem_mmap__device_coherent(drm_fd, pgt->buf->handle, 0,
> +						  pgt->size, PROT_READ | PROT_WRITE):
> +			xe_bo_mmap_ext(drm_fd, pgt->buf->handle,
> +				       pgt->size, PROT_READ | PROT_WRITE);
>   }
>   
>   static void pgt_unmap(struct pgtable *pgt)
