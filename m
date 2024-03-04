Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584ADC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 10:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE96A10FF66;
	Mon,  4 Mar 2024 10:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2IQLiD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DF910FF60
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 10:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709547929; x=1741083929;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jKO/etCWHEHpXSFauQgMR2h30WtoWKsEyknI90DeFxs=;
 b=O2IQLiD0s8t9uc8n07hLxvmSDI0t9DyxzKW5m98NKGzpmyBB5rH3xgpJ
 3xwRKqPOv0aeuP3OA9q2aE4L6DMN8MOBEELxLWxadqkz9RJbxlHDIknSy
 z6WngLeD4IJgP+RDD8UsFKEYjK/h5jqeaKF2NjJsqoYHhwlGVheFlY8MH
 8EmvVDlx1rVKuVdEPS3ySf/9jDomCKEbD+Ca6FYKd6tOpWUPNjXvz3/z1
 7seIl1acaiL5Iz2fCdHTA/kybw+x9kHaJk8gwi5lcfCo3IVq9eKNp9PSL
 cciIcwjbpeBHcoRXv8IsCP75/ns/IjW3AD8/OdQb79VYc9TF9MLGhiWY+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3892225"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3892225"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="32113989"
Received: from unknown (HELO localhost) ([10.245.244.101])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:25:25 -0800
Date: Mon, 4 Mar 2024 11:25:21 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/5] lib/intel_buf: revamp MOCS usage
Message-ID: <20240304102521.437hlfyhjtgpvjqd@zkempczy-mobl2>
References: <20240301171618.395851-1-matthew.auld@intel.com>
 <20240301171618.395851-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301171618.395851-2-matthew.auld@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Fri, Mar 01, 2024 at 05:16:15PM +0000, Matthew Auld wrote:
> We want to allow the caller the set any valid MOCS index as part of the
> the intel_buf. Drop the MOCS enum in favour of raw mocs_index. Also drop
> the getter/setter interface, for which there are no current callers for
> the setter part. In the next patch we will expose the raw mocs_index.
> Should be no functional changes here.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/gpu_cmds.c        | 21 ++++++---------------
>  lib/intel_bufops.c    |  3 ++-
>  lib/intel_bufops.h    | 23 +++--------------------
>  lib/intel_mocs.h      |  2 ++
>  lib/rendercopy_gen9.c |  8 ++++++--
>  5 files changed, 19 insertions(+), 38 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 49ba364f9..f1a27b368 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -194,7 +194,6 @@ gen9_fill_surface_state(struct intel_bb *ibb,
>  	struct gen9_surface_state *ss;
>  	uint32_t write_domain, read_domain, offset;
>  	uint64_t address;
> -	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
>  
>  	if (is_dst) {
>  		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
> @@ -214,10 +213,8 @@ gen9_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.vertical_alignment = 1; /* align 4 */
>  	ss->ss0.horizontal_alignment = 1; /* align 4 */
>  
> -	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
> -	else if (mocs == INTEL_BUF_MOCS_WB)
> -		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
> +	if (buf->mocs_index != DEFAULT_MOCS_INDEX)
> +		ss->ss1.mocs_index = buf->mocs_index;

I looked for changes in xe_gpgpu_fill according to setup mocs_index
due to setting to DEFAULT but I can't find it. I think you should
also set to uc here if caller initialized intel_buf with default.

--
Zbigniew

>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> @@ -255,7 +252,6 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  	struct gen9_surface_state *ss;
>  	uint32_t write_domain, read_domain, offset;
>  	uint64_t address;
> -	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
>  
>  	if (is_dst) {
>  		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
> @@ -275,10 +271,8 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.vertical_alignment = vertical_alignment; /* align 4 */
>  	ss->ss0.horizontal_alignment = horizontal_alignment; /* align 4 */
>  
> -	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
> -	else if (mocs == INTEL_BUF_MOCS_WB)
> -		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
> +	if (buf->mocs_index != DEFAULT_MOCS_INDEX)
> +		ss->ss1.mocs_index = buf->mocs_index;
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> @@ -911,7 +905,6 @@ xehp_fill_surface_state(struct intel_bb *ibb,
>  	struct xehp_surface_state *ss;
>  	uint32_t write_domain, read_domain, offset;
>  	uint64_t address;
> -	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
>  
>  	if (is_dst) {
>  		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
> @@ -931,10 +924,8 @@ xehp_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.vertical_alignment = 1; /* align 4 */
>  	ss->ss0.horizontal_alignment = 1; /* align 4 */
>  
> -	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
> -	else if (mocs == INTEL_BUF_MOCS_WB)
> -		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
> +	if (buf->mocs_index != DEFAULT_MOCS_INDEX)
> +		ss->ss1.mocs_index = buf->mocs_index;
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 5e2701a7d..6b769fb9d 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -29,6 +29,7 @@
>  #include "igt.h"
>  #include "igt_x86.h"
>  #include "intel_bufops.h"
> +#include "intel_mocs.h"
>  #include "intel_pat.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -877,8 +878,8 @@ static void __intel_buf_init(struct buf_ops *bops,
>  	buf->bpp = bpp;
>  	buf->compression = compression;
>  	buf->addr.offset = INTEL_BUF_INVALID_ADDRESS;
> -	buf->mocs = INTEL_BUF_MOCS_DEFAULT;
>  	buf->pat_index = pat_index;
> +	buf->mocs_index = DEFAULT_MOCS_INDEX;
>  	IGT_INIT_LIST_HEAD(&buf->link);
>  
>  	tile_width = __get_min_stride(width, bpp, tiling);
> diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
> index 363f7abaa..60f7785fe 100644
> --- a/lib/intel_bufops.h
> +++ b/lib/intel_bufops.h
> @@ -12,12 +12,6 @@ struct buf_ops;
>  #define INTEL_BUF_NAME_MAXSIZE 32
>  #define INVALID_ADDR(x) ((x) == INTEL_BUF_INVALID_ADDRESS)
>  
> -enum intel_buf_mocs {
> -	INTEL_BUF_MOCS_DEFAULT,
> -	INTEL_BUF_MOCS_UC,
> -	INTEL_BUF_MOCS_WB,
> -};
> -
>  struct intel_buf {
>  	struct buf_ops *bops;
>  
> @@ -31,7 +25,6 @@ struct intel_buf {
>  	uint32_t compression;
>  	uint32_t swizzle_mode;
>  	uint32_t yuv_semiplanar_bpp;
> -	enum intel_buf_mocs mocs;
>  	bool format_is_yuv;
>  	bool format_is_yuv_semiplanar;
>  	struct {
> @@ -68,6 +61,9 @@ struct intel_buf {
>  	/* pat_index to use for mapping this buf. Only used in Xe. */
>  	uint8_t pat_index;
>  
> +	/* mocs_index to use for operations using this intel_buf, like render_copy  */
> +	uint8_t mocs_index;
> +
>  	/* For debugging purposes */
>  	char name[INTEL_BUF_NAME_MAXSIZE + 1];
>  };
> @@ -227,17 +223,4 @@ void intel_buf_draw_pattern(struct buf_ops *bops, struct intel_buf *buf,
>  			    int cx, int cy, int cw, int ch,
>  			    bool use_alternate_colors);
>  
> -static inline enum intel_buf_mocs intel_buf_get_mocs(const struct intel_buf *buf)
> -{
> -	igt_assert(buf);
> -	return buf->mocs;
> -}
> -
> -static inline void intel_buf_set_mocs(struct intel_buf *buf,
> -				      enum intel_buf_mocs mocs)
> -{
> -	igt_assert(buf);
> -	buf->mocs = mocs;
> -}
> -
>  #endif
> diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
> index a9e075273..b5c79b0e1 100644
> --- a/lib/intel_mocs.h
> +++ b/lib/intel_mocs.h
> @@ -8,6 +8,8 @@
>  
>  #include <stdint.h>
>  
> +#define DEFAULT_MOCS_INDEX ((uint8_t)-1)
> +
>  uint8_t intel_get_wb_mocs_index(int fd);
>  uint8_t intel_get_uc_mocs_index(int fd);
>  
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 404406e5f..801fcd877 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -153,6 +153,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  	struct gen9_surface_state *ss;
>  	uint32_t write_domain, read_domain;
>  	uint64_t address;
> +	uint8_t mocs_index = buf->mocs_index;
>  	int i915 = buf_ops_get_fd(buf->bops);
>  
>  	igt_assert_lte(buf->surface[0].stride, 256*1024);
> @@ -179,12 +180,15 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  	ss->ss0.vertical_alignment = 1; /* align 4 */
>  	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
>  
> +	if (mocs_index == DEFAULT_MOCS_INDEX)
> +		mocs_index = intel_get_uc_mocs_index(i915);
> +
> +	ss->ss1.mocs_index = mocs_index;
> +
>  	if (HAS_4TILE(ibb->devid)) {
> -		ss->ss1.mocs_index = intel_get_uc_mocs_index(i915);
>  		ss->ss5.mip_tail_start_lod = 0;
>  	} else {
>  		ss->ss0.render_cache_read_write = 1;
> -		ss->ss1.mocs_index = intel_get_uc_mocs_index(i915);
>  		ss->ss5.mip_tail_start_lod = 1; /* needed with trmode */
>  	}
>  
> -- 
> 2.43.2
> 
