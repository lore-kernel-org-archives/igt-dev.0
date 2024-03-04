Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF33C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 16:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A733112301;
	Mon,  4 Mar 2024 16:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGfjAElN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADEB112301
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709569396; x=1741105396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zvlkr+uIj8BvapIRJqVUTh299TuG3/b4jtp/ASjc26w=;
 b=mGfjAElNI9G/f4aKseIEpwTFxNy8SC70HpsikX+aAodmQ0pV1vZGZvvo
 X+Kad6MHIPNE0m7snZpOXRInxd8c3RRDe17aixQAYZz9ntYZ4wYTKXZzR
 DLfR6WMAfR7IFxMUpFqbTA3Ev0VFb3oWmoUbC94qvXHKSzsAhzRRVhB2t
 8rsW2D8kVXHZwvnZnz/HFCt/Sqh2Mkj/e/+RZDx5hrzDxByInWVN/I8cj
 6SSPWHUPGnB5zcE/DFOA6PK9tFnjl9/mrXtpIg+Bd+stjLVxbvgZ4sf01
 Qq9wLSc/DQNEw05YNz6zdZ11PzvqRi3o03Uiju0xjbM1C7hEPYYlntWxe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7884189"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7884189"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:23:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="39900232"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 08:23:13 -0800
Date: Mon, 4 Mar 2024 17:23:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Subject: Re: [PATCH i-g-t 2/2] igt: Remove duplicate igt_display_require()
 calls
Message-ID: <20240304162309.4sa4u4cawkuuhzwl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>
References: <20240215-duplicate-calls-v1-0-512afbe1bda7@riseup.net>
 <20240215-duplicate-calls-v1-2-512afbe1bda7@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240215-duplicate-calls-v1-2-512afbe1bda7@riseup.net>
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

Hi Arthur,
On 2024-02-15 at 16:21:05 -0300, Arthur Grillo wrote:
> Now that we don't need call igt_display_require() twice, remove the
> duplicate calls, previously needed to expose the writeback output.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  benchmarks/kms_fb_stress.c | 2 --
>  tests/kms_writeback.c      | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index 9a0e98bed8ad..00eaa0a4931a 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -150,8 +150,6 @@ igt_simple_main
>  
>  	data.fd = drm_open_driver_master(DRIVER_ANY);
>  
> -	igt_display_require(&data.display, data.fd);
> -
>  	kmstest_set_vt_graphics_mode();
>  
>  	igt_display_require(&data.display, data.fd);
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index cda13b850dfb..6cd685b37af2 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -563,7 +563,6 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>  
>  	igt_fixture {
>  		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
> -		igt_display_require(&display, display.drm_fd);
>  
>  		kmstest_set_vt_graphics_mode();
>  
> 
> -- 
> 2.43.0
> 
