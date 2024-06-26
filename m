Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C973BC27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 11:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4913410E85C;
	Wed, 26 Jun 2024 11:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dR85jUgF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C851910E841
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719401102; x=1750937102;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0Ia0WK2CYq0tHDjQpDvt4ePCsqlTwHTOUXawhs60XJM=;
 b=dR85jUgFIIxMvbRomgplHCO3i/YhnFxp/rDoTnhwGgU4eII1zuuveCJB
 E9cSr1qC46m2wv6EDPLFDYN0bjUeXhOW96vN7xDA5iX3wmCZsrCT91HWN
 fVQyRoihQ8iLl7eogIgSz/+fykGAkaZmCywtvrPLGYnkJ1uDMnzeUfv/U
 bmN59G7vxTuSyFESHAvH2TeYnVUwBwqgns7fZYvPcAMYalnteFjOf1TTA
 4la64f2KgrNIy5MuFNJ+yDk0BR/NpXMg3yhGAVe0V475Nl2asaI7b+5NL
 OdYudYLd6iXONXgUd8andgtaIkVgsCLN2/x4Hy7c+U0chpyby8aobO+OW w==;
X-CSE-ConnectionGUID: jiCl0dZ+QQKvF+p5gqyHQQ==
X-CSE-MsgGUID: vTMbRBAFQbGYPwnYEUFKIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16614018"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16614018"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:25:01 -0700
X-CSE-ConnectionGUID: 673isRY8SeO5RoLCZCx+Ww==
X-CSE-MsgGUID: HvFUfwU2Qh2Qth6gS3cnpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="48342593"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 04:25:00 -0700
Date: Wed, 26 Jun 2024 13:24:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/gpu_cmds: Typo fix
Message-ID: <20240626112457.mglreykj7bly6zdr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
References: <20240626063018.2931-1-dominik.karol.piatkowski@intel.com>
 <20240626063018.2931-3-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626063018.2931-3-dominik.karol.piatkowski@intel.com>
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

Hi Dominik,
On 2024-06-26 at 08:30:18 +0200, Dominik Karol Piatkowski wrote:
> Fixed typo in description of one of the dwords in
> xehp_emit_state_base_address.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/gpu_cmds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 2a502505e..2e29cc6c4 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -1032,7 +1032,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>  		intel_bb_out(ibb, 0);
>  	else
>  		intel_bb_out(ibb, 0xfffff000 | 1);
> -	/* intruction buffer size */
> +	/* instruction buffer size */
>  	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);           //dw15
>  
>  	/* Bindless surface state base address */
> -- 
> 2.34.1
> 
