Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69833CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 09:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D0F10E0A0;
	Wed, 20 May 2026 09:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HhDPQr5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D5610E0A0
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779270337; x=1810806337;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fydPbevjBDkB9poEmsICl3OJqZ+Cn38cI96Xt0ttEiM=;
 b=HhDPQr5A8QDqFGhh16iIwMBOlpf0snA2+Fk/nENDeuGSsqJ9dDFkzRiy
 M8ayBRhDTtbaHtWyraR1Y5gjtWrI+ZbOhh21TrjTh5G5LPKS5mmZ5duNR
 CEjF+UCeAPZkx7KBhOcYVzaXVFTxkNo6aZM7crR805Qk5jV3OPspihhM+
 V+tCDkczzALauj0vrxtYLJCwfmY1TKT1TqfQgR8UvffqGuE1cCd6xUfMP
 okuDfw/z7F5B1pai3Df8eTZN+wSVkORVL2KKDBc9r7+kSlrWQq7Qw0NDZ
 uoboCEUfPWgr0M+UW/ZbrOFPoQnWA65Acxo34B2UTU4dCz72cLKpd00Kq g==;
X-CSE-ConnectionGUID: fcCLLHAAQP2F0skRV8UABA==
X-CSE-MsgGUID: aigqbMhFSPu6ZkrkEI4hHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90461710"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="90461710"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:45:36 -0700
X-CSE-ConnectionGUID: DccPt8EyS/Kmjy6FtEjFgw==
X-CSE-MsgGUID: R9h4x2k3Say1YYv8MHy/DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="241927379"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 02:45:33 -0700
Date: Wed, 20 May 2026 11:45:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Message-ID: <20260520094509.zhxjlzditdjbzfuq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
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

Hi Jason-JH,
On 2026-05-20 at 14:46:26 +0800, Jason-JH Lin wrote:
> Use igt_disable_cpu_deep_sleep() to prevent CPU wakeup latency that
> affects vblank timestamp acquisition.
> 
> This addresses vblank timing stability issues on MediaTek platforms
> where CPU entering idle states can cause ~200us timestamp jitter and
> test failures.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_setmode.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 1f2849bc26cf..40e79ab95ae7 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -1060,6 +1060,9 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>  		igt_require(drm_resources);
>  
>  		max_dotclock = igt_get_max_dotclock(drm_fd);
> +
> +		/* Disable CPU deep sleep to ensure stable vblank timing */
> +		igt_disable_cpu_deep_sleep(drm_fd, true);

This should be:

		igt_disable_cpu_deep_sleep(drm_fd);

>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> @@ -1075,6 +1078,9 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_fixture() {
> +		/* Restore CPU idle states */
> +		igt_disable_cpu_deep_sleep(drm_fd, false);

And this one:

		igt_enable_cpu_deep_sleep(drm_fd);

Btw why do you need drm_fd in both of these functions?
Why not:
	if (drm_fd >= 0)
		igt_disable_cpu_deep_sleep();

and similar for enable?

Regards,
Kamil

> +
>  		drmModeFreeResources(drm_resources);
>  		drm_close_driver(drm_fd);
>  	}
> -- 
> 2.43.0
> 
