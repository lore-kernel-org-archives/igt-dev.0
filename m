Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3118C7115C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 11:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB1D10E0D3;
	Wed, 25 Jun 2025 11:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mh1sVQwQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304B910E0D3
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750849739; x=1782385739;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=khh/gmCC3rXcT6mdumIxJtaSCwh+7WCUEbBdGkVF6uI=;
 b=Mh1sVQwQSVlSkv85JSW46HgCO47D/F6C6dvow5nUHc04zx9H9Hk5tPaF
 WCtcCAE3CePqZrkdvPoyVgoY+qyGnPq5KsQlr0/gL5x1igcjFE6zSrlVE
 409ttffDY/oCMrH/cebPHHwyrMocRXdgluNmainXekhG2LbBkbjr0brcC
 d/Kg0dWaSi+lCx6rQkivZq1lR3wSyOczkmkcyhtvIvYe5ZR1ffwafJIcx
 frvqWOC+hW2l36M7QUaP+ycwKoBFFiSKeTnAh1ATCsY/EYjlNNs6/TAGK
 xxAID9y0asJ2mBCyV2rsNBWvAeTp0CzHPwGo/us/9bTEGMyWgL6UMltGn A==;
X-CSE-ConnectionGUID: 4wEqMSe2QrqdvYDL+6uVnA==
X-CSE-MsgGUID: u5nxtE77Q+CUhhdo63Ye1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56898656"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="56898656"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 04:08:59 -0700
X-CSE-ConnectionGUID: 2XHXwl1gQh6KO55506PkZg==
X-CSE-MsgGUID: ek9B8S2lRDq6qNVBessinQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151699106"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 04:08:58 -0700
Date: Wed, 25 Jun 2025 13:08:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t] Revert "tests/intel/gem_exec_capture: Deal with
 DG1 recoverable vs. capture uapi changes"
Message-ID: <20250625110855.pq4wsubwrznguk4d@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 igt-dev@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20250610141852.55249-1-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250610141852.55249-1-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,
On 2025-06-10 at 16:18:52 +0200, Krzysztof Niemiec wrote:
> This reverts commit be0b7853bb2ded0b183e87bdaeab4318a7e2cd52.
> 
> The corresponding change in the kernel [1] that made this test work on
> DG1 was ultimately reverted [2], which broke the test again. Bring back
> the code to the original state.
> 
> [1] https://lore.kernel.org/all/20250411144313.11660-2-ville.syrjala@linux.intel.com
> [2] https://lore.kernel.org/all/20250522064127.24293-1-joonas.lahtinen@linux.intel.com/
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/gem_exec_capture.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index c0549c0e3..37c1f7255 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -658,7 +658,7 @@ static bool needs_recoverable_ctx(int fd)
>  		return false;
>  
>  	devid = intel_get_drm_devid(fd);
> -	return intel_graphics_ver(devid) > IP_VER(12, 10);
> +	return gem_has_lmem(fd) ||  intel_graphics_ver(devid) > IP_VER(12, 0);
>  }
>  
>  #define find_first_available_engine(fd, ctx, e, saved) \
> -- 
> 2.45.2
> 
