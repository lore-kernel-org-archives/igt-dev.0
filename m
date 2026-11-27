Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99A1606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dTbbbNda
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7F210E5C8;
	Fri, 27 Nov 2026 12:30:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497F210E5C8
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 12:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795782582; x=1827318582;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JyRl7oAFp0J8JOwRfGZQKCHCqtfmatwZK29fdu5F3Ns=;
 b=dTbbbNdaDS0l/jsc2aGL44L/JtjgOve10BVUxZsWX3L/kl/zhUcOUv4K
 mzWYD+2N6QISdpl4AQl58cyzCOQQ+4OVHh5B3mDWWfF3LequXEvLLR7fJ
 bLm3lFT5FeK4O8ybXtiNWroYC9mxLPQ11GpRov/lc4vqFAoaiXzaRiP/5
 PUqyhlpkAARq29y62t4/A5XC97H2S6MOC3PlMzwLXIFQknNbKuOf8Lvz6
 h32mOFmEouOf9mDVfu15afexaQ7jQ6WvHvknKIov0zUQ+BIN0909R1Vv+
 GNAPIPgK0j1q2JoEYMSzIrOih60n8TrTp4X50zqC3fIP091UK5Yw5fn9g A==;
X-CSE-ConnectionGUID: 0RRT9ZfOTbyjsXDwCkMvsg==
X-CSE-MsgGUID: k4/YTCyOQu64LI9hBHsEUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4784636"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4784636"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:29:41 -0800
X-CSE-ConnectionGUID: zpGigyMRS0eWKkyePhWkeQ==
X-CSE-MsgGUID: Eu6hfokTRReAtkeBJ784pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12991649"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:29:39 -0800
Date: Fri, 27 Nov 2026 13:29:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Roy <rongh7426@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] tests/kms_bw: Check is_atomic, not its address
Message-ID: <zmsmnmqd6pqrrswbcyw6zw7gqa6dyoivlczqzxh26mov2vojay@crprfrh4joyi>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Roy <rongh7426@gmail.com>, igt-dev@lists.freedesktop.org
References: <20261126162433.665660-1-rongh7426@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261126162433.665660-1-rongh7426@gmail.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Roy,
On 2026-11-27 at 00:24:32 +0800, Roy wrote:
> The fixture has igt_require(&data.display.is_atomic), which is always
> true, so the test also runs on drivers without atomic modesetting
> support. Test the value instead.

Nice catch!

> 
> This change and its description were written with the help of an AI
> coding assistant (Claude).

Please do not add it here, better place is after '---' line,
so it will not enter git log.

> 
> Signed-off-by: Roy <rongh7426@gmail.com>

As I wrote, it is better to have full name here.

> ---
>  tests/kms_bw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index ea7cf7b..10bb520 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -334,7 +334,7 @@ int igt_main()
>  		kmstest_set_vt_graphics_mode();
>  
>  		igt_display_require(&data.display, data.fd);
> -		igt_require(&data.display.is_atomic);
> +		igt_require(data.display.is_atomic);

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil
>  		igt_display_require_output(&data.display);
>  
>  	}
> -- 
> 2.51.1.windows.1
> 
