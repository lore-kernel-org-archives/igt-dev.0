Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6E7CD6E79
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 19:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360D610F961;
	Mon,  8 Jun 2026 19:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDoZZNeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D545910F961
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 19:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780948689; x=1812484689;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EIFUWDNqcrICzHQEbLnMe0SXnugokjsfdZWOVMdTIig=;
 b=PDoZZNeJp1UMcm/CcyUfR7RaeCQZmJ7dBHKnZcaOTSiEVM497n44KKty
 fiQmDuDLqnd/LjeMxS0RQ06flGms+OD92jQHL0RIB6NYkLchN2GUIKrlE
 EYepEEIjqUdt6EUs/dpfONmL4iiGVzHkWolBE/l3LpHrtW8XW0T8wko1D
 OQghi1SlpPi/fa9/yhRJo81HcCcbJOmWZTw0bjrya4v7L2b4B7XlkVaVo
 yjsjH2UeVyiKPQsYXdtRIio1HiiJ9BzqYji9PFl3oliuo1pmn8uOTK9Gc
 lrqTyo0uSWuFi5AQxzPu079tZHGb2/WHcP7u3ED8EEr4rKoVRKvvVd1U6 Q==;
X-CSE-ConnectionGUID: DAwVidqDSe2mqvA82KrJmg==
X-CSE-MsgGUID: zuaXxr96Rb6cfHWKdJuhhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81762759"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81762759"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:58:09 -0700
X-CSE-ConnectionGUID: f4T7ejUzT/SszIVSsB2GcQ==
X-CSE-MsgGUID: FhaQIAQwRIeSAM2tlf1qrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="269344780"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.118])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:58:07 -0700
Date: Mon, 8 Jun 2026 21:58:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] docs/reference: Fix build on ancient Meson versions
Message-ID: <wanpgqijmvmngyigj7jurvyijw3iafof6alm37odgyehlatc6d@6xvm3lcyalab>
References: <20260608195124.32361-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608195124.32361-1-ryszard.knop@intel.com>
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

On Mon, Jun 08, 2026 at 09:51:08PM +0200, Ryszard Knop wrote:
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  docs/reference/igt-gpu-tools/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
> index 2c65155b7f21..f52c2c2e6eb0 100644
> --- a/docs/reference/igt-gpu-tools/meson.build
> +++ b/docs/reference/igt-gpu-tools/meson.build
> @@ -65,7 +65,7 @@ foreach group : test_groups
>  	generated_docs += custom_target(description_xml,
>  		      build_by_default : true,
>  		      output : description_xml,
> -		      depends : test_executables + test_list_target,
> +		      depends : test_executables + [ test_list_target ],
>  		      command : [ gen_description, '@OUTPUT@', group, test_list_target ])
>  endforeach
>  
> -- 
> 2.54.0
> 

Ubuntu 24.04 and 26.04 are still fine, I hope this will fix older meson
issue.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
