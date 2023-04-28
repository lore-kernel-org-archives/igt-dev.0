Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDA210E0CC
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 07:50:54 +0000 (UTC)
Date: Fri, 28 Apr 2023 09:50:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230428075050.eloig2ehnedg6vqr@kamilkon-desk1>
References: <20230428062224.21322-1-zbigniew.kempczynski@intel.com>
 <20230428062224.21322-9-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230428062224.21322-9-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v8 08/17] lib/intel_batchbuffer:
 Reacquire offset for reloc allocator in reset path
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

On 2023-04-28 at 08:22:15 +0200, Zbigniew Kempczyński wrote:
> On reset path we recreate bo for batch (to avoid stalls) so we should
> reacquire the offset too. At the moment simple allocator will return
> same offset (so unfortunately we'll stall), but for reloc allocator
> we'll get new one (so we avoid stall).
> 
> I've noticed this is missing during xe_intel_bb test, where on reloc
> I noticed unexpected result (direct consequence of using same offset
> which pointed to old batch, not new one).
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_batchbuffer.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 7dbd6dd582..99b0b61585 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1280,8 +1280,9 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
>  	gem_close(ibb->fd, ibb->handle);
>  	ibb->handle = gem_create(ibb->fd, ibb->size);
>  
> -	/* Keep address for bb in reloc mode and RANDOM allocator */
> -	if (ibb->allocator_type == INTEL_ALLOCATOR_SIMPLE)
> +	/* Reacquire offset for RELOC and SIMPLE */
> +	if (ibb->allocator_type == INTEL_ALLOCATOR_SIMPLE ||
> +	    ibb->allocator_type == INTEL_ALLOCATOR_RELOC)
>  		ibb->batch_offset = __intel_bb_get_offset(ibb,
>  							  ibb->handle,
>  							  ibb->size,
> -- 
> 2.34.1
> 
