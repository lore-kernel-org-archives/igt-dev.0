Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92014C27C55
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 12:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F1A10E0D0;
	Fri,  7 Jun 2024 12:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="la7qfKM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846C410E0D0
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717763480; x=1749299480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bS9jUDEe0B2EN6OR2W6KzKHLhpEGNtyYZe2bffp+C4Q=;
 b=la7qfKM//V835+I3iUdl4c9kArS7orHY3yBV7eicXkgV5bbbkFjS1+an
 oPFdPnI4fzwm+7Czts3DdMMOPtb8Gk4bOqPu6kkj+Srd5NV9pjfDmtSLH
 j1e0o3FZWH1rLbkdCBGaxJZExSt/g5osrcdgNaCLbNbdJ2ltW1F22z1kj
 stPRsLXbh+yVZ3nR8ek3JK3RA/rE3kh8QcEy01P9To46g9b8fVKPV1dmu
 qFBPorKVB+r5eftnuv/ocZZJ/ELU2ClesmD+LTGzi1Zrdr1WXSFPF+ARV
 WyQVeXEVVui2hQRkY/IsfBv565W2mmrDzJN/hQpO+dvKaVaCknuWSeIZX g==;
X-CSE-ConnectionGUID: 2tYA/LxZQK6I5UTcuMMwYw==
X-CSE-MsgGUID: yj8jmIiNSli0DcRI6WV2fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14435056"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14435056"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:31:20 -0700
X-CSE-ConnectionGUID: sI4RrdJeSDWxqs3XyNUtZQ==
X-CSE-MsgGUID: pIVYs4SHSDK9r7fSuhRtmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="42874429"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:31:18 -0700
Date: Fri, 7 Jun 2024 14:31:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Melanie Lobo <melanie.lobo@intel.com>, vidya.srinivas@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH 1/2] lib/intel_aux_pgtable: Library to add support for
 RGB16161616_64B format
Message-ID: <20240607123115.fbuxbuur6kwvnw6y@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Melanie Lobo <melanie.lobo@intel.com>, vidya.srinivas@intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20240606121523.5347-1-melanie.lobo@intel.com>
 <20240606121523.5347-2-melanie.lobo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240606121523.5347-2-melanie.lobo@intel.com>
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

Hi Melanie,
On 2024-06-06 at 17:45:22 +0530, Melanie Lobo wrote:

one more nit about subject, you wrote:
lib/intel_aux_pgtable: Library to add support for RGB16161616_64B format

This should be:
lib/intel_aux_pgtable: Add RGB16161616_64B FP16 compressed format

you already have 'lib/' in begin of filename, no need to add
that later.

Juha-Pekka or Swati - fill free to suggest better subject, I do
not know specification of this new format.

Regards,
Kamil

> MTL supports RGB16161616_64B FP16 format which is a binary
> floating-point computer number format that occupies 16 bits
> in computer memory.
> 
> This was tested with kernel patch,
> https://patchwork.freedesktop.org/series/124957/
> https://lore.kernel.org/all/20240605055819.9510-1-melanie.lobo@intel.com/
> 
> cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
> ---
>  lib/intel_aux_pgtable.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index 3cbb0e26f35c..87df50e71bbd 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -22,6 +22,7 @@
>  #define AUX_FORMAT_AYUV		0x09
>  #define AUX_FORMAT_ARGB_8B	0x0A
>  #define AUX_FORMAT_NV12_21	0x0F
> +#define AUX_FORMAT_RGBA16_FLOAT        0x1
>  
>  struct pgtable_level_desc {
>  	int idx_shift;
> @@ -306,6 +307,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
>  			entry.e.format = AUX_FORMAT_ARGB_8B;
>  			entry.e.depth = bpp_to_depth_val(32);
>  			break;
> +		case 64:
> +			entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
> +			entry.e.depth = bpp_to_depth_val(64);
> +			break;
>  		default:
>  			igt_assert(0);
>  		}
> -- 
> 2.17.1
> 
