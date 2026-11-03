Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22CA606A338
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PWZDEcZa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778B210E127;
	Tue,  3 Nov 2026 12:51:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA3510F57C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 12:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793710228; x=1825246228;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j7ggAWiBiPuutokqLjWVspHWBocwFp+KCRQDO4SUtng=;
 b=PWZDEcZaE6ovZU4+RT0qCTC2H/IIW3Z1ff8HxeIFZntNAixZQONUQHyw
 kClmXIO/gLTrIphysmPMYynBsue9pMRG6nhFJXEWeU1avhslX3MNCUhss
 L5PRghND4iZQUf2AK2ot2NwG+ACdnwXMf789wYRee9beQJkFKCIv7mcBk
 f1HoJ90yk/IHZoWuAGOM/svuiWBpzHkbkyOp6X4XJCqT8bdB8kw1pDJLw
 +qx7ad8dJuowvccUMDuZ+Is4kGiUAb0vD+T9tUBgh1ZkMKgDyUyKv72bI
 gOiRzwBVy6nfvcwHRfa2KhOVMlbOn/ZwqEaxMd06zaQQrTKnBjVPlCFcw g==;
X-CSE-ConnectionGUID: Jl4G+0C0SfSaVkX0QxVJhg==
X-CSE-MsgGUID: u7uAQKrcTb2tujikILaGGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2312513"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2312513"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 04:50:23 -0800
X-CSE-ConnectionGUID: oHa6cs31Q9yHzfdU8W/khQ==
X-CSE-MsgGUID: LDYNHvPpSjenaUD2daPnbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6743794"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 04:50:19 -0800
Date: Tue, 3 Nov 2026 13:50:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sowmiya S <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, pranay.samala@intel.com
Subject: Re: [PATCH i-g-t v1] tests/kms_force_connector_basic: Add skip
 reason for missing VGA/HDMI connector
Message-ID: <mpilthr3dfsvwp4dvn5467ymeoxqprt73r2iotj2y5oa3ig45g@26hf63gnna6u>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Sowmiya S <sowmiya.s@intel.com>, igt-dev@lists.freedesktop.org,
 pranay.samala@intel.com
References: <20261102130451.1162404-1-sowmiya.s@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102130451.1162404-1-sowmiya.s@intel.com>
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

Hi Sowmiya,
On 2026-11-02 at 18:34:51 +0530, Sowmiya S wrote:
> igt_require(connector_id) only printed the bare variable name on skip,
> giving no indication of why the test was skipped. Use igt_require_f()
> to state that no VGA or HDMI connector was found for better test
> diagnostics.
> 
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_force_connector_basic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
> index c4252ea02..e09f63a20 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -392,7 +392,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, NULL)
>  			drmModeFreeConnector(connector);
>  		}
>  
> -		igt_require(connector_id);
> +		igt_require_f(connector_id, "no VGA or HDMI connector found\n");

nit: no VGA nor HDMI ...



Regards,
Kamil

>  
>  end:
>  		/* Reacquire status after clearing any previous overrides. */
> -- 
> 2.43.0
> 
