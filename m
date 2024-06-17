Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838BDC2BA15
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 12:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9B710E398;
	Mon, 17 Jun 2024 12:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ixysrj+F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F70A10E398
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718627859; x=1750163859;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b5+9r46up3xj50KT0nzpPelL4g6kD8j4IUU250EQL+A=;
 b=Ixysrj+F9j35TLVvpqyTacSvGkL75s1Oe5TN3RnYp3scamUjmrSE2abE
 e2MWiQE2BgB/E1oIUgx5mCcPiw6jy6LDC6gsnuJigvlY1eNkpAq94svcQ
 lO0/fT2DNGXJimGpD1Uo2XFwZFzSOmixpuzHuRSjqaeDfmgAYM+SAzFTC
 ZRvQb1ABsqmfBpX6wq+ob20Pa41OaFjPNthKsrPUXaU3HgucTTarDvhHt
 fABqdGj36s+nbh7hA4ciLb0eddPdImwtAbGkNG0fHAotKuKHiErK0yq2v
 bF3AqnVLjQsNSnEoRH5ZL6JnIvmsqHLLvlRL13XG0XLLO14jcWtJnGoMe Q==;
X-CSE-ConnectionGUID: WasVsY50QlaCTouhxF09hg==
X-CSE-MsgGUID: ADxnoA7aTnWj0ehfuzNxoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26133971"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="26133971"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 05:37:35 -0700
X-CSE-ConnectionGUID: 89HeTnnmTJuu3tO7mt0rzQ==
X-CSE-MsgGUID: MdpwA0iqRHi6kOg+qBHZJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="71936140"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 05:37:33 -0700
Date: Mon, 17 Jun 2024 14:37:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
Subject: Re: [PATCH 1/2] lib: sync xe_pciids.h with kernel
Message-ID: <20240617123730.vxkgcze6v7mddflx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
References: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
 <20240617-bmg_chipset_info-v1-1-289e3215141e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240617-bmg_chipset_info-v1-1-289e3215141e@intel.com>
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

Hi Andrzej,
On 2024-06-17 at 09:51:44 +0200, Andrzej Hajda wrote:
> This synchronizes with kernel commit
> e54700f7d6aa ("drm/xe/bmg: Add PCI IDs")
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/xe_pciids.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
> index c7fc288dacee..73d972a8aca1 100644
> --- a/lib/xe_pciids.h
> +++ b/lib/xe_pciids.h
> @@ -208,4 +208,11 @@
>  	MACRO__(0x64A0, ## __VA_ARGS__), \
>  	MACRO__(0x64B0, ## __VA_ARGS__)
>  
> +#define XE_BMG_IDS(MACRO__, ...) \
> +	MACRO__(0xE202, ## __VA_ARGS__), \
> +	MACRO__(0xE20B, ## __VA_ARGS__), \
> +	MACRO__(0xE20C, ## __VA_ARGS__), \
> +	MACRO__(0xE20D, ## __VA_ARGS__), \
> +	MACRO__(0xE212, ## __VA_ARGS__)
> +
>  #endif
> 
> -- 
> 2.34.1
> 
