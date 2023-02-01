Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8265710E41E
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Feb 2023 15:41:41 +0000 (UTC)
Date: Wed, 1 Feb 2023 16:41:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230201154115.xftfmerf5sidbdpb@kamilkon-desk1>
References: <20230201132657.575932-1-zbigniew.kempczynski@intel.com>
 <20230201132657.575932-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230201132657.575932-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915_crc: Use system memory
 buffer on integrated platforms
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

On 2023-02-01 at 14:26:56 +0100, Zbigniew Kempczyński wrote:
> Previous assumption crc32 will be calculated only on discrete is
> not valid anymore - MTL supports extended ALU SHL/SHR instructions
> so we can calculate crc there as well.
> 
> Instead of enforcing local memory as target of buffers involved
> in calculations use system memory on integrated.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> ---
>  lib/i915/i915_crc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915/i915_crc.c b/lib/i915/i915_crc.c
> index 70b84a815a..cdd3cef6df 100644
> --- a/lib/i915/i915_crc.c
> +++ b/lib/i915/i915_crc.c
> @@ -244,10 +244,11 @@ uint32_t i915_crc32(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
>  	uint64_t bb_offset, table_offset, data_offset;
>  	uint32_t bb, table, crc, table_size = 4096;
>  	uint32_t *ptr;
> +	uint32_t region = gem_has_lmem(i915) ? REGION_LMEM(0) : REGION_SMEM;
>  
>  	igt_assert(data_size % 4 == 0);
>  
> -	table = gem_create_in_memory_regions(i915, table_size, REGION_LMEM(0));
> +	table = gem_create_in_memory_regions(i915, table_size, region);
>  	gem_write(i915, table, 0, igt_crc32_tab, sizeof(igt_crc32_tab));
>  
>  	table_offset = get_offset(ahnd, table, table_size, 0);
> @@ -261,7 +262,7 @@ uint32_t i915_crc32(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
>  	obj[1].flags = EXEC_OBJECT_PINNED;
>  	obj[1].handle = data_handle;
>  
> -	bb = gem_create_in_memory_regions(i915, BBSIZE, REGION_LMEM(0));
> +	bb = gem_create_in_memory_regions(i915, BBSIZE, region);
>  	bb_offset = get_offset(ahnd, bb, BBSIZE, 0);
>  	fill_batch(i915, bb, bb_offset, table_offset, data_offset, data_size);
>  	obj[2].offset = bb_offset;
> -- 
> 2.34.1
> 
