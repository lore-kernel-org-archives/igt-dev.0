Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA00CD5BDE
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 15:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D3910E22B;
	Wed, 27 May 2026 15:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNiAeGcG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B08810E22B
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779895890; x=1811431890;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ju+tcYmXj3GRQ8XbYJ5tJE25n+gQ7NCv2keP9kf+V90=;
 b=jNiAeGcGMFxh/LksEnGXDhz54d/tSKsay83UENKSA9dfit+vRW4THlXT
 hW9CU5NRpSIc8+zk6w8HvNu/4dO2MDEMtkGL2wsVuQDAEe166LtgL5yJT
 QFSnIyBiAjtYUXU6TIG0PD8ZkN/vWo17qzobP2QpEf2D/T/8/sLdE7p3V
 q8G7ZbiobCTuBiSjTd6h6Ne4jUnbcVh2980AQaAxJSSgC75Up7B05gsvm
 j7DzKydMSDpLucDrO9McOG1rTUDWlj2veLkeOPxtlJoq6v2INEEETu3e6
 gv5h/BtwJZFxdBOvgkvZ177+lqqD02n3/IAsU4bZ0LeD5IW7Xj9XbEzOz Q==;
X-CSE-ConnectionGUID: l5b8liCaS+K0tUSp7U174w==
X-CSE-MsgGUID: 82xzHmHYQRuY9UefjHlM7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="79765088"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="79765088"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 08:31:29 -0700
X-CSE-ConnectionGUID: PEwkpPsTTpC3mvJUnba7Aw==
X-CSE-MsgGUID: N8fJk8fvSqa05ewl/Njk/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242423503"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 08:31:28 -0700
Date: Wed, 27 May 2026 17:31:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org, jia.yao@intel.com, x.wang@intel.com
Subject: Re: [PATCH 1/3] tests/intel/xe_pat: fix typo in r2 wc debug print
Message-ID: <20260527153126.4llajxjb6izfi7z5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>, igt-dev@lists.freedesktop.org,
 jia.yao@intel.com, x.wang@intel.com
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
 <20260511233622.2074382-2-zongyao.bai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511233622.2074382-2-zongyao.bai@intel.com>
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

Hi Zongyao,
On 2026-05-11 at 23:36:20 +0000, Zongyao Bai wrote:
> Fix typo in debug output: [r2] log used r1_entry.force_cpu_wc instead of
> r2_entry.force_cpu_wc.
> 
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_pat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 81c28677a..e53e08877 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -1515,7 +1515,7 @@ static void subtest_pat_index_modes_with_regions(int fd,
>  							  r1_entry.force_cpu_wc, p.r1_compressed);
>  						igt_debug("[r2]: r: %u, idx: %u (%s), coh: %u, wc: %d, comp: %d, w: %u, h: %u, a: %u\n",
>  							  p.r2, p.r2_pat_index, r2_entry.name, r2_entry.coh_mode,
> -							  r1_entry.force_cpu_wc, p.r2_compressed,
> +							  r2_entry.force_cpu_wc, p.r2_compressed,
>  							  p.size->width, p.size->height,
>  							  p.size->alignment);
>  
> -- 
> 2.43.0
> 
