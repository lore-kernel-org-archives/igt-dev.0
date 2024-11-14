Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D1AD637D4
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 17:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D006B10E094;
	Thu, 14 Nov 2024 17:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BwOmmm5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E889910E094
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731603988; x=1763139988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZVccWlWjULPKfD00JijoReeLyo//U/IX1P3UALg7Skc=;
 b=BwOmmm5zncgCbzMtlETugue3FoDXHyl+8odTMpZEhL3tvFSSqqJQTOZl
 TAAcByNwVFCwmMmcWB7Xe7B5yuwcO50elfo39MoDKnCXJE5NCUXGQ5AV3
 /6uvipEAw60vrAkTvhCy4r+lFWhLXugr0rCK97Ls9HBYKqeFNnjlMACDs
 oky/RedvmFmvOM2GJfV7JuethJaHdGU/kh2gvseQQ4dcYFL0Us7tbduPe
 g0PHXp0DjX1OwT99u76dRd1XTzqe1V7tfSvmOVRNcbxjbT12pVz9LxtgB
 qjle82xlq1ciWGAKjGzLqkiPgnxch8Z0J/jzO6608VuAw4RBsLn2ntLcR Q==;
X-CSE-ConnectionGUID: yY4LwIWESkOcmGHT83QzGA==
X-CSE-MsgGUID: pvRWkBohTMuSM+rOldQN1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="56963293"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="56963293"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 09:06:27 -0800
X-CSE-ConnectionGUID: ETuFgIaJT9aULWK1vhPXPg==
X-CSE-MsgGUID: ACbdRo83RCa+ZjX+MzfnuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88429106"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.16])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 09:06:26 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 6/6] lib/igt_kmod: Do not leak kmod ctx
Date: Thu, 14 Nov 2024 18:06:22 +0100
Message-ID: <6844519.31r3eYUQgx@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241107055254.3129207-7-lucas.demarchi@intel.com>
References: <20241107055254.3129207-1-lucas.demarchi@intel.com>
 <20241107055254.3129207-7-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Lucas,

On Thursday, 7 November 2024 06:52:54 CET Lucas De Marchi wrote:
> kmod_ctx() is used as a cheap way to cache the kmod ctx. Make sure it's
> released when the process exit by using igt_install_exit_handler(),
> which also guarantees children forked with igt_fork* don't free it on
> exit. Normal forks are still susceptible to breakage, but if it that
> happens, let it break so we can fix.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM.

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  lib/igt_kmod.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 7be95a61c..89736ae59 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -71,14 +71,20 @@ static void squelch(void *data, int priority,
>  {
>  }
>  
> +static struct kmod_ctx *ctx__;
> +
> +static void free_kmod_ctx(int sig)
> +{
> +	kmod_unref(ctx__);
> +}
> +
>  static struct kmod_ctx *kmod_ctx(void)
>  {
> -	static struct kmod_ctx *ctx;
>  	const char **config_paths = NULL;
>  	char *config_paths_str;
>  	char *dirname;
>  
> -	if (ctx)
> +	if (ctx__)
>  		goto out;
>  
>  	dirname = getenv("IGT_KMOD_DIRNAME");
> @@ -112,14 +118,16 @@ static struct kmod_ctx *kmod_ctx(void)
>  		config_paths[i] = NULL;
>  	}
>  
> -	ctx = kmod_new(dirname, config_paths);
> -	igt_assert(ctx != NULL);
> +	ctx__ = kmod_new(dirname, config_paths);
> +	igt_assert(ctx__ != NULL);
>  
>  	free(config_paths);
> +	igt_install_exit_handler(free_kmod_ctx);
> +
> +	kmod_set_log_fn(ctx__, squelch, NULL);
>  
> -	kmod_set_log_fn(ctx, squelch, NULL);
>  out:
> -	return ctx;
> +	return ctx__;
>  }
>  
>  /**
> 




