Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B4610E954
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Oct 2023 09:04:16 +0000 (UTC)
Date: Fri, 27 Oct 2023 11:04:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231027090411.4i7uxi3vfnp4pcnu@kamilkon-desk.igk.intel.com>
References: <20231026-gtt_size_fix-v1-0-882d0e0022ec@intel.com>
 <20231026-gtt_size_fix-v1-2-882d0e0022ec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231026-gtt_size_fix-v1-2-882d0e0022ec@intel.com>
Subject: Re: [igt-dev] [PATCH 2/2] lib/intel_batchbuffer: allow GTT size be
 not power of 2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Andrzej,
On 2023-10-26 at 17:50:30 +0200, Andrzej Hajda wrote:
> GTT size reported by the driver can be shorter than
> the actual size due to possible reserved addresses.
> Rounding it up to power of 2 should give us back
> actual GTT size.
> The patch is prerequisite for upcoming driver changes
> introducing per context batch buffers.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_batchbuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index df82ef5f5ca..c32d04302fe 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1675,7 +1675,7 @@ __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
>  			offset = __intel_bb_get_offset(ibb, handle, size,
>  						       alignment);
>  		} else {
> -			offset = offset & (ibb->gtt_size - 1);
> +			offset = offset & (roundup_power_of_two(ibb->gtt_size) - 1);
>  
>  			/*
>  			 * For simple allocator check entry consistency
> 
> -- 
> 2.34.1
> 
