Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9689CD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jun 2026 09:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A32E10F520;
	Fri, 26 Jun 2026 09:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6teLBpp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05B210F520
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2026 09:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782465221; x=1814001221;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2qgBvMR8jm/OH8Stfj5XGQWpBsmMAbfaJOQx1wFfhJA=;
 b=g6teLBppMIo9Wn5Iv+J8NLpBmvc6L9WEFAUXLHKxc6/HJhGjIPVNOKZO
 +UxkGL2EUAnlAih+0Gy/84qXXNpcCVWTVHJBd/GMUp5OekMRqcEpugZ56
 BwH/UC4KxB00jx10XIh2yxEg8cJzwxcxNMx53srw3yWVeg8xJzd/Gye0G
 gj76AuIsaaFBR6iDzWWw8dxL6kJETDvNeBPH8NMkBLLyHgXqDaHcQa+If
 CNfZRS6M2ZMyPNvQe+DbTRoDvBuZ2xbV9qFCFIh8gLZWUvvTKpU590iza
 Fk0bBu/fWs10jUmnypqoVOqZuX+muLsOdxtH79yLDN2vWmYaJ7JssZ5bB Q==;
X-CSE-ConnectionGUID: n0XGlJiOQDOQDrp1Ng7wQA==
X-CSE-MsgGUID: Qk28XW9lSYGpwmntxyoJ1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93915047"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="93915047"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:13:40 -0700
X-CSE-ConnectionGUID: y/470Z7VQWqwVlsgbAENvw==
X-CSE-MsgGUID: Qtyd8/t4SoOI42vL2OGiGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="244888696"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.232])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:13:39 -0700
Date: Fri, 26 Jun 2026 11:13:36 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 10/11] lib/rendercopy: Convert render op and entry points
 to genxml
Message-ID: <7zpwusgize25q7mmz7iglsoyd4cz5fy2ssjuzwruofm73yk5zy@xlh4ihliphr4>
References: <20260622035106.3023047-1-jan.maslak@intel.com>
 <20260622035106.3023047-11-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622035106.3023047-11-jan.maslak@intel.com>
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

On Mon, Jun 22, 2026 at 05:51:05AM +0200, Jan Maslak wrote:
> Update _gen9_render_op() and the public render/clear entry points to use
> igt_genxml_emit macros backed by the genxml pack headers.

LGTM

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  lib/rendercopy_gen9.c | 53 ++++++++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 23 deletions(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index fb487cb67e..136869b74a 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -26,7 +26,6 @@
>  #include "igt_aux.h"
>  #include "intel_chipset.h"
>  #include "intel/genxml/igt_genxml.h"
> -#include "gen9_render.h"
>  #include "gen90_pack.h"
>  #include "gen110_pack.h"
>  #include "gen120_pack.h"
> @@ -1218,8 +1217,13 @@ void _gen9_render_op(struct intel_bb *ibb,
>  
>  	/* Start emitting the commands. The order roughly follows the mesa blorp
>  	 * order */
> -	intel_bb_out(ibb, G4X_PIPELINE_SELECT | PIPELINE_SELECT_3D |
> -		     GEN9_PIPELINE_SELECTION_MASK);
> +	igt_genxml_emit(ibb, GFX9_PIPELINE_SELECT, ps) {
> +		ps.PipelineSelection = GFX9_3D;
> +		/* MaskBits 15:8 is a write-enable mask for bits 5:4 (Force Media
> +		 * Awake and Media Sampler DOP Clock Gate Enable).  Value 0x3
> +		 * enables writes to both bits so PipelineSelection takes effect. */
> +		ps.MaskBits = 3;
> +	}
>  
>  	gen12_emit_aux_pgtable_state(ibb, aux_pgtable_state, true);
>  
> @@ -1250,17 +1254,21 @@ void _gen9_render_op(struct intel_bb *ibb,
>  	gen9_emit_state_base_address(ibb);
>  
>  	if (HAS_4TILE(ibb->devid) || intel_gen(ibb->devid) > 12) {
> -		intel_bb_out(ibb, GEN4_3DSTATE_BINDING_TABLE_POOL_ALLOC | 2);
> -		intel_bb_emit_reloc(ibb, ibb->handle,
> -				    I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0,
> -				    0, ibb->batch_offset);
> -		intel_bb_out(ibb, 1 << 12);
> +		igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POOL_ALLOC, btpa) {
> +			btpa.MOCS = intel_get_wb_mocs(ibb->fd);
> +			btpa.BindingTablePoolBaseAddress =
> +				igt_address_of_batch(ibb,
> +					I915_GEM_DOMAIN_RENDER | I915_GEM_DOMAIN_INSTRUCTION, 0);
> +			btpa.BindingTablePoolBufferSize = 1;
> +		}
>  	}
>  
> -	intel_bb_out(ibb, GEN7_3DSTATE_VIEWPORT_STATE_POINTERS_CC);
> -	intel_bb_out(ibb, viewport.cc_state);
> -	intel_bb_out(ibb, GEN8_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP);
> -	intel_bb_out(ibb, viewport.sf_clip_state);
> +	igt_genxml_emit(ibb, GFX9_3DSTATE_VIEWPORT_STATE_POINTERS_CC, vp) {
> +		vp.CCViewportPointer = viewport.cc_state;
> +	}
> +	igt_genxml_emit(ibb, GFX9_3DSTATE_VIEWPORT_STATE_POINTERS_SF_CLIP, vp) {
> +		vp.SFClipViewportPointer = viewport.sf_clip_state;
> +	}
>  
>  	gen7_emit_urb(ibb);
>  
> @@ -1270,11 +1278,7 @@ void _gen9_render_op(struct intel_bb *ibb,
>  
>  	gen8_emit_null_state(ibb);
>  
> -	intel_bb_out(ibb, GEN7_3DSTATE_STREAMOUT | (5 - 2));
> -	intel_bb_out(ibb, 0);
> -	intel_bb_out(ibb, 0);
> -	intel_bb_out(ibb, 0);
> -	intel_bb_out(ibb, 0);
> +	igt_genxml_emit(ibb, GFX9_3DSTATE_STREAMOUT, so) { }
>  
>  	gen7_emit_clip(ibb);
>  
> @@ -1282,14 +1286,17 @@ void _gen9_render_op(struct intel_bb *ibb,
>  
>  	gen8_emit_ps(ibb, ps_kernel_off, fast_clear);
>  
> -	intel_bb_out(ibb, GEN7_3DSTATE_BINDING_TABLE_POINTERS_PS);
> -	intel_bb_out(ibb, ps_binding_table);
> +	igt_genxml_emit(ibb, GFX9_3DSTATE_BINDING_TABLE_POINTERS_PS, bt) {
> +		bt.PointertoPSBindingTable = ps_binding_table;
> +	}
>  
> -	intel_bb_out(ibb, GEN7_3DSTATE_SAMPLER_STATE_POINTERS_PS);
> -	intel_bb_out(ibb, ps_sampler_state);
> +	igt_genxml_emit(ibb, GFX9_3DSTATE_SAMPLER_STATE_POINTERS_PS, sp) {
> +		sp.PointertoPSSamplerState = ps_sampler_state;
> +	}
>  
> -	intel_bb_out(ibb, GEN8_3DSTATE_SCISSOR_STATE_POINTERS);
> -	intel_bb_out(ibb, scissor_state);
> +	igt_genxml_emit(ibb, GFX9_3DSTATE_SCISSOR_STATE_POINTERS, ssp) {
> +		ssp.ScissorRectPointer = scissor_state;
> +	}
>  
>  	gen9_emit_depth(ibb);
>  
> -- 
> 2.43.0
> 
