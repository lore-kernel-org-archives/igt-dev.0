Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D17CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 13:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7888310E1B0;
	Wed, 20 May 2026 13:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYH4csLd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694EE10E1B0
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779285022; x=1810821022;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SFATWz+AQPjJe2LZKN8DsoqY9Q4Lnlho4jExUFXhenM=;
 b=NYH4csLdrnV+PdFQXOzpgd8guUChKJ4vgyJq4Y1G8GRTtVGqCstcmsmf
 Zmxe3L/zJME+WeSIvuCQ/l9V6V1AIyT3QOdvh6ZormApfALu1SGS6Qeyi
 7lMLkso6JxR5nE/5YDgKM5EAVCCIxjk5RI8Wfa00tnWiaWuQPlggfLEWg
 NYpQVoA5TiJP+JvRitgrp6iCsmXTbw6vJ3n6coPpB2HNtL1OzbG1lpMZO
 qdPlKN5tst94HAg6lj2at+Yl32u7qVP5lEZGBnyVqWhwaTDawk5GrZgkI
 dVjWbJOzJ6eMiFCxQVhLte6cuEvvcxom3Aq66L8/vwoQldfRYUYhrn6+m A==;
X-CSE-ConnectionGUID: SvoBL0ZQS6iiST7mhgY4sA==
X-CSE-MsgGUID: shJ6capDS0yM2o6nDsc47Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79911132"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="79911132"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 06:50:21 -0700
X-CSE-ConnectionGUID: uwLE7qk1SsqUXSE/e0grLg==
X-CSE-MsgGUID: vlfKLyZ6QuWLgTgtX2ZTig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="237586030"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.205])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 06:50:16 -0700
Date: Wed, 20 May 2026 16:50:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Message-ID: <ag28FVTooBC6Yly3@intel.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, May 20, 2026 at 02:46:26PM +0800, Jason-JH Lin wrote:
> Use igt_disable_cpu_deep_sleep() to prevent CPU wakeup latency that
> affects vblank timestamp acquisition.
> 
> This addresses vblank timing stability issues on MediaTek platforms
> where CPU entering idle states can cause ~200us timestamp jitter and
> test failures.

Can't you fix the kernel to generate accurate timestamps?

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
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> @@ -1075,6 +1078,9 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_fixture() {
> +		/* Restore CPU idle states */
> +		igt_disable_cpu_deep_sleep(drm_fd, false);
> +
>  		drmModeFreeResources(drm_resources);
>  		drm_close_driver(drm_fd);
>  	}
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
