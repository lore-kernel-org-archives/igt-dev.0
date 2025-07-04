Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709EFC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 15:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057A910E06E;
	Fri,  4 Jul 2025 15:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDnSCMJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083AE10E06E
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751641386; x=1783177386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0ktyOx/bslUE4vNSOJazhHNQxHV7lXR7SKrOEQqOjWI=;
 b=GDnSCMJCeVeb22L+jolN7E7tx42GFhFY/RhD+Ww62TfjpYRDzVNjVufN
 jSQdIr74V1lxyZvyOPDVsR3rnK9m0p2rVVE/Ht2NsPE5cejNY091t66tG
 NzjD9hnlQLBKJukr65G6IcpG9x9arBX9V9bRETtTZQDpsNFb27NmB6Wta
 y+H8lA+uHDf9VkgV6dwmgOTEt1QlEel3mwso8g/sQz+C61cg3ut0tuzb+
 oUsCiTe3zh68LN4mllwjpBQ3YCemeB/PBSFOQXD59BQUEwGYjJLztJpqn
 ombLHgTxW+VkEEVTFJQ28rg/+fBzhbTgWpzkQW/vQZ4ngf4dsWAQgCuys A==;
X-CSE-ConnectionGUID: hGmk/1SHRGOPsHTcljJ2ug==
X-CSE-MsgGUID: yBmB1hpXTDKwjl6wKuZz5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64225396"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="64225396"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 08:03:06 -0700
X-CSE-ConnectionGUID: COlesd7ZS2uq3kxMxRZY4g==
X-CSE-MsgGUID: UJHmNRV/RyqpCoOR8mvMyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="155237523"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 08:03:04 -0700
Date: Fri, 4 Jul 2025 17:02:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH i-g-t v2 1/9] tests/msm/msm_mapping: Fix memory leak
Message-ID: <20250704150248.w4ni6gjhqcs7cjhd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
 <20250702190249.376313-2-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702190249.376313-2-rob.clark@oss.qualcomm.com>
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

Hi Rob,
On 2025-07-02 at 12:02:41 -0700, Rob Clark wrote:
> We shouldn't leak the devcore.
> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>

For whole series this is
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/msm/msm_mapping.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index ac20ca91d613..1749a670e70d 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -215,6 +215,8 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
>  	ret = sscanf(s, "  - iova=%"PRIx64, &fault_addr);
>  	igt_fail_on(ret != 1);
>  	igt_fail_on(addr != fault_addr);
> +
> +	free(devcore);
>  }
>  
>  /*
> -- 
> 2.50.0
> 
