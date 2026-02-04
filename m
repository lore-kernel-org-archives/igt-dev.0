Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80105E9D3EB
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6F410E675;
	Wed,  4 Feb 2026 14:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4pP+waN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C79C10E675
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770215952; x=1801751952;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MjbxSebAgOUqougAQVS8Kgq7TdB1ni7IDK6eiHvTnIY=;
 b=g4pP+waNQAsQiQHIxFJ/EcuDOU/QzTfnm3MVSKanTl2A13WFYkWqJCbx
 B239CKrkSsb6z++rcpTBmwiEGACEiGPyu+pnYozJmqNKZjQZcPDS6meXK
 tEKlZg2azbzQuE5yKCspWtYrHuDX1SiaJ0f/aAFIu69UT+Xb1gVhmaekQ
 CbqHe6++k0R+3XtMPNzb1m5fXnQrQmnidVC6I7D+8coLAt+nNs0e477qH
 kX+StxvC1vMupB5if0x7XycE6f2bPyiQFfrM5u1dVpOlRSWObJMqJcPhJ
 8infaCYBTnNE79SxRiw080R3cW2In1CqGhom0gnsw3kLhm1beKmyjqmg6 g==;
X-CSE-ConnectionGUID: hegY8bRJS+urWdx93OXimw==
X-CSE-MsgGUID: VQ7kmjd4SzW6LSNRLJ844Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96857100"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="96857100"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:39:12 -0800
X-CSE-ConnectionGUID: CUzMpaFaS2KBOBCJjt/gbA==
X-CSE-MsgGUID: J3qIGkWEQPCo/SYiTpDEgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="247779277"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:39:11 -0800
Date: Wed, 4 Feb 2026 15:39:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com,
 piotr.piorkowski@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_vram: Add support for
 multitile platforms
Message-ID: <20260204143907.2ismkflrsp5sorbm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com,
 piotr.piorkowski@intel.com
References: <20260130101736.11715-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260130101736.11715-1-lukasz.laguna@intel.com>
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

Hi Lukasz,
On 2026-01-30 at 11:17:36 +0100, Lukasz Laguna wrote:
> So far the amount of provisioned VRAM was collected only from the first
> tile. On multitile platforms it may not reflect the full provisioned
> VRAM size. Extend it to take into account values from all tiles.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/intel/xe_sriov_vram.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
> index 622ca77fc7..e46416d96c 100644
> --- a/tests/intel/xe_sriov_vram.c
> +++ b/tests/intel/xe_sriov_vram.c
> @@ -38,10 +38,14 @@ const size_t STEP = SZ_1M;
>  
>  static uint64_t get_provisioned_vram(unsigned int pf_fd, unsigned int vf_id)
>  {
> +	unsigned int tile, main_gt;
>  	uint64_t size = 0;
>  
> -	/* TODO: adjust for multitile platforms */
> -	size = xe_sriov_pf_get_provisioned_quota(pf_fd, XE_SRIOV_SHARED_RES_LMEM, vf_id, 0);
> +	xe_for_each_tile(pf_fd, tile) {
> +		main_gt = xe_tile_get_main_gt_id(pf_fd, tile);
> +		size += xe_sriov_pf_get_provisioned_quota(pf_fd, XE_SRIOV_SHARED_RES_LMEM, vf_id,
> +							  main_gt);
> +	}

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  
>  	return size;
>  }
> -- 
> 2.40.0
> 
