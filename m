Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800C1C79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 17:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B6210E28E;
	Thu, 10 Sep 2026 17:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBihBLID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4B08994A
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 17:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789059742; x=1820595742;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IOoGCiKLO2ZW2AE/r1PhfSjtRHc3UxDx1GISu/t1FFY=;
 b=XBihBLIDmLS/x8zuSqS55qkEPwPO51DFvuxPXC3MGR2GG004lrczlsK6
 eoatcaJT2rhAIisjZigwq0zkDEbcGThv4/Bnu2Ugt4vbN3mk0voDtkL9y
 YC4VG5JuolLWHV2CAy0vXEU+ZB1eb4NbHlww10kgKTtz+MWbBbB3Lu70Q
 so5THSTCln/kRKBtOi8QTr/8GwDhQbErWaI1+2JyU14CM/72kzpXHCffM
 /41O759oH3x/Lxc46HaOm/hmKMrPW3hIt5pVdPiJvZEg6zfcLzRGsQZGn
 qlv5hqYIglHKye8dHYciyTWvFaxNNBiiht9vqH+A8XMPN/pJfvP/Cg1WB Q==;
X-CSE-ConnectionGUID: rNoeiFGtRJab8qn9Z8yYQw==
X-CSE-MsgGUID: 34jfe3SkSYacsGHod7uVnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112290359"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="112290359"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 10:02:21 -0700
X-CSE-ConnectionGUID: SFsz3RiNQXq3mlJf6oOz9Q==
X-CSE-MsgGUID: zgfpCxl6THKTW2tRBvb5lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="267414417"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 10:02:19 -0700
Date: Thu, 10 Sep 2026 19:02:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, andrzej.hajda@intel.com
Subject: Re: [PATCH v2 1/1] lib/rendercopy: Use the Xe2+ depth buffer packet
Message-ID: <hjt2qv63b7hvhy4wmkv7xiwd7uy5mk5vlj5eor2hmwanj7k237@gyioi73vnsae>
References: <20260910162718.4189583-1-jan.maslak@intel.com>
 <20260910162718.4189583-2-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910162718.4189583-2-jan.maslak@intel.com>
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

On Thu, Sep 10, 2026 at 06:27:18PM +0200, Jan Maslak wrote:
> Genxml provides a dedicated 3DSTATE_DEPTH_BUFFER definition for Xe2 and
> newer platforms. Use GFX20_3DSTATE_DEPTH_BUFFER on those platforms,
> keeping the existing GFX125 and GFX9 selections for older hardware.
> 
> Xe2+ platforms also support Tile4, but require the eight-dword GFX20
> packet rather than the ten-dword GFX125 packet. Retain the HAS_4TILE
> capability check only for pre-Xe2 platforms.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>

LGTM. But wait for CI to make sure it doesn't regress anything.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/rendercopy_gen9.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index 31913badba..d3f793fcc3 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -1043,7 +1043,11 @@ gen9_emit_depth(struct intel_bb *ibb)
>  
>  	igt_genxml_emit(ibb, GFX9_3DSTATE_WM_DEPTH_STENCIL, wds) { }
>  
> -	if (HAS_4TILE(ibb->devid)) {
> +	if (intel_gen(ibb->devid) >= 20) {
> +		igt_genxml_emit(ibb, GFX20_3DSTATE_DEPTH_BUFFER, db) {
> +			db.MOCS = mocs;
> +		}
> +	} else if (HAS_4TILE(ibb->devid)) {
>  		igt_genxml_emit(ibb, GFX125_3DSTATE_DEPTH_BUFFER, db) {
>  			db.MOCS = mocs;
>  		}
> -- 
> 2.43.0
> 
