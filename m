Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926E2CCD199
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 14:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCAA10E2ED;
	Thu, 16 Oct 2025 14:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RY6lHA4t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8094910E2ED
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760625496; x=1792161496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BUF24wpaLjNUYIpMaXKiT91JecNwE7z20Oxd796cGvA=;
 b=RY6lHA4t07XZuB+vH9/73xc8oBs4ah3OcmlIdNq4n7i/yhvuRZ2OJMjN
 IBoR93pIGJgN37wK9ISZUQ72vJNXrFKE+ZMqhPsLvQeMP/kjBErXsrhnz
 1/gHfgiSplCxu4nH/215+NpBZXBxKLHmb0zpKtjEfL7nLTUxxXeITm3A3
 sjR0C6jvCVxz/8Ybe3g631aNJz/tsWOBddTUd/PSi5OU2+n20ivuBZ209
 pS21j2zJPvQmYEhikCvLEkty3Vm80XYzwDuBhfYB/mwe/izpi3pVlr2zT
 ByYwONhZ5HE3QuORUv7aTUBdnbmyJ0fX5HDeFIlAEcmMu9pgGxyeQh7h3 A==;
X-CSE-ConnectionGUID: oWNUyprgSIKEs7EhwEmhvA==
X-CSE-MsgGUID: GHQm6BWpQ+KWVxUjrt8vrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73932145"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="73932145"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:38:16 -0700
X-CSE-ConnectionGUID: nwi9pGdqTWiUgXUbSiJxPw==
X-CSE-MsgGUID: wpJXDvFiR8yzpxGdTGvZ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182031841"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 07:38:13 -0700
Date: Thu, 16 Oct 2025 16:38:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 4/6] lib/igt_kms: Add support for mtk_current_bpc
 debugfs in bpc-switch test
Message-ID: <20251016143810.si4ag7sfngsf2cy6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-5-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251012171459.3773990-5-jason-jh.lin@mediatek.com>
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

Hi Jason-JH,
On 2025-10-13 at 01:13:14 +0800, Jason-JH Lin wrote:
> Add support for the "mtk_current_bpc" debugfs entry when detecting bpc
> on MediaTek devices. This allows bpc-switch tests to work properly with
> MTK platforms by reading the correct debugfs property.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kms.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 9ee03e870927..1662e6d61f50 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6261,6 +6261,8 @@ unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe)
>  		strcpy(debugfs_name, "i915_current_bpc");
>  	else if (is_amdgpu_device(drmfd))
>  		strcpy(debugfs_name, "amdgpu_current_bpc");
> +	else if (is_mtk_device(drmfd))
> +		strcpy(debugfs_name, "mtk_current_bpc");
>  
>  	res = igt_debugfs_simple_read(fd, debugfs_name, buf, sizeof(buf));
>  	igt_require(res > 0);
> -- 
> 2.43.0
> 
