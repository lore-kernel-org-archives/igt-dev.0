Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDCAC4345F
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 07:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C2E10FCD4;
	Mon,  6 May 2024 07:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXnG76ln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF7410FB35
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 07:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714980413; x=1746516413;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=58SoB/rCRhEL1nQ3B5ksbHngbkDvnMYiN5eY3wdck2s=;
 b=aXnG76lnFt2Z7C976kso5cf+Xl1wosrCUOzgMlq1rM6gc5rt5Bb7lmas
 CHI09Zq1P088kEDmm7i86I5zVYHWxg4iZ2k3+bHXh7VFd84NWittXyUZl
 G6hXK3xqkC0x/Nx4fpmIxHRikaNgHcdlB0JJVxo9ZaQWcGGks+wPat9rT
 uZKdkv0+EThdadCMreJo8QU1UikbDXlIFYrSdVXdB/IcYahgbhiE6fk4M
 d9e6pYAxEryRUi7oVUX6eh0w55CBRdBLmyR8j1U7LACIJ39tFO3A8k+Ur
 yhLj8yoNdFmFpQTL7Qhkqiyn/9K1swLRZFNBEafMSx84bL+SqGIket49l A==;
X-CSE-ConnectionGUID: 5rqN79IMRDqefJ0Q5kSw1g==
X-CSE-MsgGUID: ky6AP3tLS4u1qimMX1LDHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21868101"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="21868101"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 00:26:52 -0700
X-CSE-ConnectionGUID: uZUG0MSvQUahcpL4DH3xGg==
X-CSE-MsgGUID: iwKQctEoRfy1cdiA2vjDLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28190003"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.219])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 00:26:51 -0700
Date: Mon, 6 May 2024 09:26:48 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/gpu_cmds: be ready to use xe2 gpgpu fill on
 newer platforms
Message-ID: <20240506072648.56oemjhnqefnqerl@zkempczy-mobl2>
References: <20240425121337.433948-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425121337.433948-1-dominik.grzegorzek@intel.com>
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

On Thu, Apr 25, 2024 at 02:13:37PM +0200, Dominik Grzegorzek wrote:
> Doing xe2 gpgpu pipeline implementation we mostly taken into account
> possibility of reusing the implementation for future platforms.
> But not everywhere. Make it common.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/gpu_cmds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index f37e725e7..40522d58e 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -1030,7 +1030,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>  	intel_bb_out(ibb, 0);
>  
>  	/* stateless data port */
> -	tmp = intel_graphics_ver(ibb->devid) == IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
> +	tmp = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
>  	intel_bb_out(ibb, 0 | tmp);                  //dw3
>  
>  	/* surface */
> @@ -1056,7 +1056,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>  	/* dynamic state buffer size */
>  	intel_bb_out(ibb, 1 << 12 | 1);                             //dw13
>  	/* indirect object buffer size */
> -	if (intel_graphics_ver(ibb->devid) == IP_VER(20, 0))	    //dw14
> +	if (intel_graphics_ver(ibb->devid) >= IP_VER(20, 0))	    //dw14
>  		intel_bb_out(ibb, 0);
>  	else
>  		intel_bb_out(ibb, 0xfffff000 | 1);
> -- 
> 2.34.1
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
