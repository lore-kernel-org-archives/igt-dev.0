Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32056CCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 10:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C3810E310;
	Thu, 26 Sep 2024 10:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/AxWQep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298F610E310
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 10:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727345175; x=1758881175;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=c4PGz8f/5UilKPvXMivs35y3T3ehVf0S3pP1vHJdPL0=;
 b=D/AxWQepYAvYVZW80pI1IqbOMlrTHVJmVs6qEA3rBf6CqboCFNqOOEAX
 HcedCJ+o3K2KPDmYENn93OfmvHJRLkgWzFKcq7fUHP2dMACyBr14AeIRV
 sThFYc3gklfTOJC853Am991Lx8+FZYYJsDA131V7hDK80j5I0S1ff2U99
 lFxxkcoAlLjCcyoltS8UKvrVFsFWzZx6r3p5YzOkItwJnpM198TEowgan
 YrqeVpuCAyAqVMrNKrIUo26giqnQgg5SUkRvKrZwiw57iiRD1zA50PWvo
 2qcemX+t4H7KtqqviN+i1Ok3n3421/BRhK8DQym9ox+e/wnnV7Smrq4vv A==;
X-CSE-ConnectionGUID: VAE5P6XlTCi72DqVj/4u4w==
X-CSE-MsgGUID: OuavGFiGR3qBLAaTeOopEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26584673"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="26584673"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:06:15 -0700
X-CSE-ConnectionGUID: zpsbZRQCT+2doEA+PQ+FvA==
X-CSE-MsgGUID: bLqbPoAbTi+e07inFcMWKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="72234494"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:06:13 -0700
Date: Thu, 26 Sep 2024 13:06:40 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/7] lib/igt_kms: Handle EINVAL error as well
Message-ID: <ZvUyMNT5XDflL6Q3@ideak-desk.fi.intel.com>
References: <20240925182944.1603015-1-kunal1.joshi@intel.com>
 <20240925182944.1603015-6-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925182944.1603015-6-kunal1.joshi@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Sep 25, 2024 at 11:59:42PM +0530, Kunal Joshi wrote:
> Previously, only -ENOSPC was handled, but -EINVAL
> can also occur under certain conditions when the
> mode can't be set.
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Suggested-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  lib/igt_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index ca5fc92cd..c96008577 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4927,7 +4927,7 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
>  
>  		if (!ret)
>  			return true;
> -		else if (ret != -ENOSPC)
> +		else if (ret != -ENOSPC && ret != -EINVAL)
>  			return false;
>  	}
>  
> -- 
> 2.43.0
> 
