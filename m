Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E356CD4F25
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 11:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B761710E3A2;
	Thu, 14 May 2026 11:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZzfj5nh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E30610E3A2
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778758195; x=1810294195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2xZXLRgERfl475PpDsSBIbZcDKYAb3qZD87RwieXKsU=;
 b=jZzfj5nhJZZV4H+3lEQuPsY0MX6r5oYgkVHlLFgAb/dqD2mEnffhaiXs
 xCJsAeAuU8bw541UJsf4qTCpqDBao6GdxS5JPuB4rqqgDM6ge2LG2hiTU
 iniAeuSiUqLWLdjTZdRfwRAROOheyny76SASeoeHiqD+0s8bO0sIngcVL
 nhph15Ula28NwBz3DApFvNVDX98KXLhbVmpUyAq27bqHq4/XwN2snTvq5
 Lx6Bn2yo9XjmUDdpzVhKWoK3CmF7Kz0Ogn0gJCU0dKLNIUz97gq/SfCvy
 9rZBBbIYwFHC3gR4tBwhvCKdyxqg/T6C2HtazePFgCZFCRR41QSdogKMO Q==;
X-CSE-ConnectionGUID: 3pzsxs+lR86WjDs89KXNjg==
X-CSE-MsgGUID: 4fU8MOMwTpmrdP7J5PLtWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91083527"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91083527"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 04:29:54 -0700
X-CSE-ConnectionGUID: mBP1p+hrS6G3QkUnsetomQ==
X-CSE-MsgGUID: fzzeziq7Rc6DtxgCtnfWMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="268707520"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 04:29:52 -0700
Date: Thu, 14 May 2026 13:29:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_cursor_legacy: relax checks on MTK
Message-ID: <20260514112949.axfohd7q6sz72sqo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260506100126.9827-1-xiandong.wang@mediatek.com>
 <20260506100126.9827-2-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506100126.9827-2-xiandong.wang@mediatek.com>
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

Hi Xiandong,
On 2026-05-06 at 18:01:11 +0800, Xiandong Wang wrote:
> From: Xiandong Wang <Xiandong.Wang@mediatek.com>
> 
> kms_cursor_legacy uses tight vblank timing assertions that can be unstable
> on MTK under higher system load, leading to intermittent failures.
> 
> This patch makes two key improvements based on review feedback:
> 
> 1. In flip_vs_cursor(): Change from igt_assert_eq() to igt_assert_lte()
>    for the non-extra-vblank case. Since igt_crtc_get_vblank() will never
>    return a value less than vblank_start, this relaxation won't cause
>    regressions on any platform while improving test stability.
> 
> 2. In cursor_vs_flip(): Introduce a threshold variable approach instead
>    of hardcoding the timing assertion. For MTK platform, multiply the
>    threshold by 4x to accommodate longer cursor update times under heavy
>    load.
> 
>    MTK display hardware uses a frame-based processing model where cursor
>    plane updates are scheduled alongside other display operations in the
>    same frame queue. Under high system load (e.g., concurrent page flips,
>    CPU pressure), the cursor update path may take additional time due to:
>    - Display hardware command buffer arbitration
>    - Memory bus contention with other display operations
>    - Multi-stage pipeline latency in the display controller
> 
>    The 4x threshold multiplier (from 5*vrefresh/8 to 20*vrefresh/8) provides
>    sufficient margin for these platform-specific scheduling behaviors while
>    still validating that cursor updates complete within a reasonable timeframe.
>    This avoids false test failures on MTK platforms without compromising the
>    test's ability to catch real timing regressions.
> 
> This improves test robustness on MTK without changing expectations on
> non-MTK platforms.
> 
> v2: Refactor based on review comments from Jason-JH Lin:
>     - Remove MTK-specific guard for flip_vs_cursor() since igt_assert_lte
>       is a safe relaxation for all platforms
>     - Use threshold variable approach in cursor_vs_flip() for better
>       code clarity and maintainability
> 
> v3: Add detailed explanation of MTK hardware characteristics and timing
>     requirements
> 
> Suggested-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Xiandong Wang <Xiandong.Wang@mediatek.com>

I am going to merge it after i915 full testing.
Karthik, J-P or Swati do you have any objections?

Regards,
Kamil

> ---
>  tests/kms_cursor_legacy.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 5399ef481..4d597af79 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1039,8 +1039,8 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
>  		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
>  
>  		if (!mode_requires_extra_vblank(mode))
> -			igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
> -				      vblank_start + 1);
> +			igt_assert_lte(igt_crtc_get_vblank(crtc, 0),
> +				       vblank_start + 1);
>  		else
>  			igt_assert_lte(igt_crtc_get_vblank(crtc, 0),
>  				       vblank_start + 2);
> @@ -1442,8 +1442,20 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
>  			vblank_last = vbl.sequence;
>  		}
>  
> -		if (!cursor_slowpath(display, mode))
> -			igt_assert_lte(vbl.sequence, vblank_start + 5 * vrefresh / 8);
> +		if (!cursor_slowpath(display, mode)) {
> +			unsigned long threshold = 5 * vrefresh / 8;
> +
> +			/*
> +			 * On MTK platform, cursor updates may take longer under heavy
> +			 * load due to hardware scheduling characteristics. Relax the
> +			 * timing threshold to avoid false positives while still
> +			 * validating correctness.
> +			 */
> +			if (is_mtk_device(display->drm_fd))
> +				threshold = 4 * threshold;
> +
> +			igt_assert_lte(vbl.sequence, vblank_start + threshold);
> +		}
>  
>  		shared[0] = 1;
>  		igt_waitchildren();
> -- 
> 2.45.2
> 
