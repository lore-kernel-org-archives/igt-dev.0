Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43702C27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 10:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B9D10E1FD;
	Mon, 17 Jun 2024 10:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiHO3d8e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D3510E219
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718621466; x=1750157466;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6fuJj336p1FZ1K7zd39O2b3ita9CcsbDU5SoLRzN80o=;
 b=DiHO3d8ea57g3+n4WaszbVNJHEqDf6AU2sMyahSwOF6o+uIYxVbD92f/
 fzDeQyXFCj+mKHQ9Y9PfwBUD4rKP6lGdks6dZ9cCRJLlatDB/XKP0IDyV
 ZTiKwXVS7rF1vHgiOqQI+yV7TGR1mOO36b8v5vZHBexOzOtDfnTYmuyEA
 5syytrFIUzwRcjjd7hLCfubD4HTtneGWnBEmOdENwb48QH/HG3etjdgko
 dwelGqJopPlu4q91Q22g+0qzjF8Zc5smososBVwPfsa2MZZC6dvC4ahXr
 xGCRCzIHgzNWMzRYfybQlz7oXcTyvt5uCH8kApC/WODePJ6dCbowDXtN2 A==;
X-CSE-ConnectionGUID: lYP/hterQ+GSYH3//k5MJg==
X-CSE-MsgGUID: rOfwo7YgQLOVgR6YFJzkNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26857369"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="26857369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 03:51:05 -0700
X-CSE-ConnectionGUID: eOkyG6zaSviN8Bx9T1hOoA==
X-CSE-MsgGUID: dMvg8DEHRsKrAHiDsHhFTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45527631"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 03:51:04 -0700
Date: Mon, 17 Jun 2024 12:51:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v7 1/5] lib/gpu_cmds: add Xe_LP version of emit_vfe_state
Message-ID: <20240617105101.j5k4ytip4w2uz4ir@zkempczy-mobl2>
References: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
 <20240612-iga64_inline_ups-v7-1-0d4b840498c7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-iga64_inline_ups-v7-1-0d4b840498c7@intel.com>
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

On Wed, Jun 12, 2024 at 11:38:59AM +0200, Andrzej Hajda wrote:
> In Xe_LP version there is added argument to control EU thread
> dispatching mode. For shaders lagacy mode is used.
> 
> v2: added commit description
> v6: added public function descriptions
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/gpu_cmds.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++------
>  lib/gpu_cmds.h |  6 ++++++
>  2 files changed, 52 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 378fa9166ab8..b096670b073c 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -651,10 +651,10 @@ gen7_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
>  	intel_bb_out(ibb, 0);
>  }
>  
> -void
> -gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
> -		    uint32_t urb_entries, uint32_t urb_size,
> -		    uint32_t curbe_size)
> +static void
> +__gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
> +		      uint32_t urb_entries, uint32_t urb_size,
> +		      uint32_t curbe_size, bool legacy_mode)
>  {
>  	intel_bb_out(ibb, GEN7_MEDIA_VFE_STATE | (9 - 2));
>  
> @@ -662,8 +662,8 @@ gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
>  	intel_bb_out(ibb, 0);
>  	intel_bb_out(ibb, 0);
>  
> -	/* number of threads & urb entries */
> -	intel_bb_out(ibb, threads << 16 | urb_entries << 8);
> +	/* number of threads & urb entries & eu fusion */
> +	intel_bb_out(ibb, threads << 16 | urb_entries << 8 | legacy_mode << 6);
>  
>  	intel_bb_out(ibb, 0);
>  
> @@ -676,6 +676,25 @@ gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
>  	intel_bb_out(ibb, 0);
>  }
>  
> +/**
> + * gen8_emit_vfe_state:
> + * @ibb: batchbuffer
> + * @threads: maximum number of threads
> + * @urb_entries: number of URB entries
> + * @urb_size: URB entry allocation size
> + * @curbe_size: CURBE allocation size
> + *
> + * Emits instruction MEDIA_VFE_STATE for Gen8+ which sets Video Front End (VFE)
> + * state.
> + */
> +void gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
> +			 uint32_t urb_entries, uint32_t urb_size,
> +			 uint32_t curbe_size)
> +{
> +	__gen8_emit_vfe_state(ibb, threads, urb_entries, urb_size, curbe_size,
> +			      false);
> +}
> +
>  void
>  gen7_emit_curbe_load(struct intel_bb *ibb, uint32_t curbe_buffer)
>  {
> @@ -864,6 +883,27 @@ gen7_emit_media_objects(struct intel_bb *ibb,
>  			gen_emit_media_object(ibb, x + i * 16, y + j * 16);
>  }
>  
> +/**
> + * xelp_emit_vfe_state:
> + * @ibb: pointer to intel_bb
> + * @threads: maximum number of threads
> + * @urb_entries: number of URB entries
> + * @urb_size: URB entry allocation size
> + * @curbe_size: CURBE allocation size
> + * @legacy_mode: if set, threads are dispatched individually (legacy mode),
> + *     otherwise they are dispatched in sets(fused EU mode)
> + *
> + * Emits instruction MEDIA_VFE_STATE for XeLP which sets Video Front End (VFE)
> + * state.
> + */
> +void xelp_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
> +			 uint32_t urb_entries, uint32_t urb_size,
> +			 uint32_t curbe_size, bool legacy_mode)
> +{
> +	return __gen8_emit_vfe_state(ibb, threads, urb_entries, urb_size,
> +				     curbe_size, legacy_mode);

return is not necessary here, __gen8_emit_vfe_state() is void function.

As patch is already reviewed it's just notice, not nit.

--
Zbigniew

> +}
> +
>  /*
>   * XEHP
>   */
> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index 348c6c9453e9..1b9156a80c7c 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -81,6 +81,12 @@ void
>  gen8_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
>  		    uint32_t urb_entries, uint32_t urb_size,
>  		    uint32_t curbe_size);
> +
> +void
> +xelp_emit_vfe_state(struct intel_bb *ibb, uint32_t threads,
> +		    uint32_t urb_entries, uint32_t urb_size,
> +		    uint32_t curbe_size, bool legacy_mode);
> +
>  void
>  gen7_emit_curbe_load(struct intel_bb *ibb, uint32_t curbe_buffer);
>  
> 
> -- 
> 2.34.1
> 
