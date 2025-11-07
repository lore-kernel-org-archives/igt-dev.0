Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE91CCF9E3
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 13:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2194210EACA;
	Fri,  7 Nov 2025 13:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAxPD1Ob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8943210EACA
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 13:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762523360; x=1794059360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mWsmFB+9UgD7c1Yo2WJk9a770q9KqcZGYc9TY3Rx8vk=;
 b=PAxPD1ObaIApmhOvG2ccuUEEMF+1rgY3C67+MYPyszOS2MEBi4grXYAg
 8V9lMIPRfoHXsFpBk6Io4k94uOrANkMVnDRkUw16jDspXwnm42Lj7w1x5
 aoDe52AL48D0JmlId0TVcHhsGGBD6DJL3Y59k6KXa5NxqsxKz5StnARVy
 7pw6VS8Jht/lSoRtdBI73HphMENJGSi1S+uY0mSTxtQ2Y1Iul6gIABMLy
 9nkLZACNpOHTbtELyYTz/2g+UvFmuZU5PynUzDk5JRDKs3DdATroY7MiS
 0J2Epf6SOjb4m6zOK/ikrAVJ8kbDmdf9IFSecBIQEAkVQqSIVL984kDmw g==;
X-CSE-ConnectionGUID: ZhPDVwqYTIehefi/tDsbQg==
X-CSE-MsgGUID: 3CgxDYKoQYy3DPAUhj1oag==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="68510259"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="68510259"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 05:49:20 -0800
X-CSE-ConnectionGUID: Z+YJK74FQ2G9YZwvKNNDhA==
X-CSE-MsgGUID: o34rpzdXSPucEb1etDJWJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="193217047"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 05:49:19 -0800
Date: Fri, 7 Nov 2025 14:49:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
Subject: Re: [PATCH i-g-t v3 3/3] lib/intel_pat: Define pat indices for
 xe3p_xpc
Message-ID: <20251107134916.4f5ljcpru6jg2yxk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
References: <20251107115040.1756713-1-shekhar.chauhan@intel.com>
 <20251107115040.1756713-4-shekhar.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107115040.1756713-4-shekhar.chauhan@intel.com>
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

Hi Shekhar,
On 2025-11-07 at 17:20:40 +0530, Shekhar Chauhan wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Right PAT indices selected for xe3p_xpc.

s/Right/Define proper/

This could be done at merge.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  lib/intel_pat.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 156b1ee5d..e3588110a 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -19,8 +19,12 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  {
>  	uint16_t dev_id = intel_get_drm_devid(fd);
>  
> -	if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> -	    intel_get_device_info(dev_id)->graphics_ver == 20) {
> +	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> +		pat->uc = 3;
> +		pat->wb = 2;
> +		pat->max_index = 31;
> +	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> +		   intel_get_device_info(dev_id)->graphics_ver == 20) {
>  		pat->uc = 3;
>  		pat->wt = 15; /* Compressed + WB-transient */
>  		pat->wb = 2;
> -- 
> 2.51.1
> 
