Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C10089E03
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2020 17:42:32 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200706072118.17441-2-dominik.grzegorzek@intel.com>
References: <20200706072118.17441-1-dominik.grzegorzek@intel.com>
 <20200706072118.17441-2-dominik.grzegorzek@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 06 Jul 2020 18:42:28 +0100
Message-ID: <159405734884.24180.7353589635990715231@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_caching: Remove libdrm
 dependency
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dominik Grzegorzek (2020-07-06 08:21:17)
> Thanks to intel_bb we are able to remove libdrm from gem_caching.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_caching.c | 176 ++++++++++++++++++++++++---------------
>  1 file changed, 107 insertions(+), 69 deletions(-)
> 
> diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
> index 0ffffa05..0f83d0d6 100644
> --- a/tests/i915/gem_caching.c
> +++ b/tests/i915/gem_caching.c
> @@ -39,7 +39,6 @@
>  
>  #include "i915/gem.h"
>  #include "igt.h"
> -#include "intel_bufmgr.h"
>  
>  IGT_TEST_DESCRIPTION("Test snoop consistency when touching partial"
>                      " cachelines.");
> @@ -49,50 +48,83 @@ IGT_TEST_DESCRIPTION("Test snoop consistency when touching partial"
>   *
>   */
>  
> -static drm_intel_bufmgr *bufmgr;
> -struct intel_batchbuffer *batch;
> -
> -drm_intel_bo *scratch_bo;
> -drm_intel_bo *staging_bo;
>  #define BO_SIZE (4*4096)
> -uint32_t devid;
> -int fd;
> +#define PAGE_SIZE 4096
> +
> +typedef struct {
> +       int fd;
> +       uint32_t devid;
> +       struct buf_ops *bops;
> +} data_t;
> +
> +
> +static void *__try_gtt_map_first(data_t *data, struct intel_buf *buf,
> +                                int write_enable)
> +{
> +       uint8_t *ptr;
> +       unsigned int prot = PROT_READ | (write_enable ? PROT_WRITE : 0);
> +
> +       ptr = __gem_mmap__gtt(data->fd, buf->handle, buf->size, prot);
> +       if (!ptr) {
> +               ptr = gem_mmap__device_coherent(data->fd, buf->handle,
> +                                         0, buf->size,  prot);
> +       }
> +       return ptr;
> +}

So I had to think whether or not this was worth keeping [gtt first,
rather than just use device_coherent]. And in the end the peculiarity of
GTT vs caching won out, so I agree better to keep trying gtt if it's
there.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
