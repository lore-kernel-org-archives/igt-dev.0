Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001E4CA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 04:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9189D10E103;
	Thu, 14 Aug 2025 04:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLUOWSw0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC7A10E103
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 04:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755146907; x=1786682907;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kHPAw4azzr2lNdryvjOmJ5Eo7l8nzE9cFsMuK0HMn3k=;
 b=GLUOWSw0dAjPdlVaZzrVFmoAuyZPCXDpjTpgjzbFgQJ2rNSPhYuZ0lbt
 2HVsJO+IUfqhHdoPPLDcy+AF3MH7K/JpeFc3lgJUclP+KhboTBzPLfk17
 LwJtCbGBFKupkY/pYKDwZ5KDXV7nRTXlOiSy4aZGH19Tjl3rh1oxC8Za8
 +sqRVipalbfmLeXuJxDb4CRZoyhCLRLTsM431e1pUNdoCN7wyIfbrIf8t
 HspINKj7Hxl8PLZx4x7vFqi1P9R7SGA1qi5ycKHNg7sp/m8K9SD10jho7
 zvcixTKu16FgJBegilotbPBB+4J1UH7K3+z7vb0vHV+1pRoW9tEz+3+VX Q==;
X-CSE-ConnectionGUID: kyh6helKR06L576eGv6DKw==
X-CSE-MsgGUID: uPinI3aSRIu+Ely/9Y1Kvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="75026242"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="75026242"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 21:48:27 -0700
X-CSE-ConnectionGUID: eFh42dxgQmOJ6moT1YXmNQ==
X-CSE-MsgGUID: dZcOj/8VRsaBsqHTQ/nO2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="167466910"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.95])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 21:48:25 -0700
Date: Thu, 14 Aug 2025 06:48:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>, 
 Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juha-pekka.heikkila@intel.com>,
 Mika Kahola <mika.kahola@intel.com>
Subject: Re: [PATCH i-g-t] lib/intel/veboxcopy: Respect buffer MOCS index
Message-ID: <t3zwmxdcdavanvt2u3spd4zcdeyktym2mvfvow3tph2pni455a@mynl6lwvyy3p>
References: <20250722073906.99759-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250722073906.99759-1-tvrtko.ursulin@igalia.com>
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

On Tue, Jul 22, 2025 at 08:39:06AM +0100, Tvrtko Ursulin wrote:
> Set the MOCS indices in surface state from the source and
> destination buffers. So far it was done only for the input
> buffer and only for 4Tile formats. Always setting it alings
> with how rendercopy does it and it fixes the AuxCCS tests on
> ADL when target is of the MC flavour.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> ---
> Lets see what the CI will think of this change.
> 
> Curiously the AuxCCS tests where target is RC, so rendercopy
> which does set the MOCS correctly is used, are still flaky so
> that sounds like a different problem.
> ---
>  lib/veboxcopy_gen12.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
> index 4e3aefaf1f44..2193433a1c00 100644
> --- a/lib/veboxcopy_gen12.c
> +++ b/lib/veboxcopy_gen12.c
> @@ -258,6 +258,8 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
>  
>  	if (HAS_4TILE(ibb->devid))
>  		tc->tc1_2.input_mocs_idx = IS_DG2(ibb->devid) ? 3 : 9;
> +	else
> +		tc->tc1_2.input_mocs_idx = src->mocs_index;
>  
>  	tc->tc1_2.input_tiled_resource_mode = src->tiling == I915_TILING_Yf;
>  
> @@ -278,6 +280,8 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
>  			dst->compression == I915_COMPRESSION_RENDER;
>  	}
>  
> +	tc->tc3_4.output_mocs_idx = dst->mocs_index;
> +
>  	if (HAS_4TILE(ibb->devid))
>  		tc->tc3_4.output_mocs_idx = IS_DG2(ibb->devid) ? 3 : 9;
>  
> -- 
> 2.48.0
> 

According how intel_buf selects uc mocs index in the initialization
part (for DEFAULT_MOCS_INDEX) it looks good to me.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
