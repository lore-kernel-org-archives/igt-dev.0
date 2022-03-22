Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D85210E1EB
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Mar 2022 19:09:51 +0000 (UTC)
Date: Tue, 22 Mar 2022 20:09:47 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <Yjoe7TFbxc0T7RJ3@zkempczy-mobl2>
References: <20220224130444.18793-1-kamil.konieczny@linux.intel.com>
 <20220224130444.18793-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220224130444.18793-2-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/intel_batchbuffer: add create
 without relocs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 02:04:43PM +0100, Kamil Konieczny wrote:
> There is create function with relocations, so add its
> counterpart without it.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_batchbuffer.c | 9 ++++++++-
>  lib/intel_batchbuffer.h | 1 +
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index e5666cd4..159813dd 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1484,7 +1484,14 @@ struct intel_bb *intel_bb_create(int i915, uint32_t size)
>  	return __intel_bb_create(i915, 0, size,
>  				 relocs && !aux_needs_softpin(i915), 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
> -				 ALLOC_STRATEGY_HIGH_TO_LOW);
> +				 ALLOC_STRATEGY_LOW_TO_HIGH);

Please keep HIGH_TO_LOW strategy. Only thing you need to do is 
to use CANONICAL() + EXEC_OBJECT_SUPPORTS_48B_ADDRESS. Works fine
for me. 

> +}
> +
> +struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size)
> +{
> +	return __intel_bb_create(i915, 0, size, false, 0, 0,
> +				 INTEL_ALLOCATOR_SIMPLE,
> +				 ALLOC_STRATEGY_LOW_TO_HIGH);
>  }

Same here.

--
Zbigniew

>  
>  /**
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index a488f9cf..793c16aa 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -523,6 +523,7 @@ struct intel_bb *intel_bb_create(int i915, uint32_t size);
>  struct intel_bb *
>  intel_bb_create_with_context(int i915, uint32_t ctx, uint32_t size);
>  struct intel_bb *intel_bb_create_with_relocs(int i915, uint32_t size);
> +struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size);
>  struct intel_bb *
>  intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx, uint32_t size);
>  void intel_bb_destroy(struct intel_bb *ibb);
> -- 
> 2.32.0
> 
