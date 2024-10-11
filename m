Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F34DCFD30C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 09:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A10F10E1E4;
	Fri, 11 Oct 2024 09:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7SOcW4a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE4410E1E4
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728638777; x=1760174777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WRGSSxiVNBNxDSFciNKd9sovfv1238guSoLZIcNLKf4=;
 b=b7SOcW4abKA92sh2i6dX5jmeW70qghwqz/6Zhxa/5BiO7iVsArRJ2g2Z
 hQ/Hh2Zj6va067y1//Y0P4Ct/UUz9D1Kq37fS5GxUn9D7W8/3bZGkIUEm
 gPRYp4SlO2zuD0UfbzME5cDHi6XLrvt2oEFV310Mn65b7TGDvG0h9SIUC
 gdeE683o4xDom11W8i8CYL5Xw1x9qnXIQsvuakdcQwH/7sQztTDsytCD9
 NJQYvGaRAJtkrkauGJiM6iyHOziZdD9t0tp3FhTgBWSih7rPMu2ZDNrw0
 Mtz2zRYaA5x8R+jcGhf6d+ptBpmVoOE+YN4BnLDWGtX1Lf7lMwBhaibXN w==;
X-CSE-ConnectionGUID: 0v8Bbw4ATMK7bHbWpFlYKQ==
X-CSE-MsgGUID: aC9t4dxwQ8uQtfdfveDveg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38603496"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="38603496"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 02:26:17 -0700
X-CSE-ConnectionGUID: j+yH2cH8TMSLIUIv28AhpQ==
X-CSE-MsgGUID: iZhmTZdKSUi3UCQlCrKBcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="77063547"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 02:26:16 -0700
Date: Fri, 11 Oct 2024 11:25:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: Fix intel_gpu_top for pre-snb
Message-ID: <20241011092559.3iwr7vulod7vw7nf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20241008214944.27549-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241008214944.27549-1-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-10-09 at 00:49:44 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> __I915_PMU_REQUESTED_FREQUENCY is not available on pre-snb (*)
> so checking for it breaks intel_gpu_top completely for those
> machines. Check __I915_PMU_INTERRUPTS instead, which I believe
> is available on everything. Another option would be
> __I915_PMU_SOFTWARE_GT_AWAKE_TIME.
> 
> * we do have frequency information on ilk, but we've not
>   reverse engineered the hw unit<->Hz conversion factor so
>   exposing it as is might be a bit confusing...
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/intel_gpu_top.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 9b65ae4eb941..a608b894d3de 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -563,7 +563,7 @@ static int get_num_gts(uint64_t type)
>  
>  	errno = 0;
>  	for (cnt = 0; cnt < MAX_GTS; cnt++) {
> -		fd = igt_perf_open(type, __I915_PMU_REQUESTED_FREQUENCY(cnt));
> +		fd = igt_perf_open(type, __I915_PMU_INTERRUPTS(cnt));
>  		if (fd < 0)
>  			break;
>  
> -- 
> 2.45.2
> 
