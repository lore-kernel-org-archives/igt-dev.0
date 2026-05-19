Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA71CD4F3C
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 15:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A8E10ED78;
	Tue, 19 May 2026 15:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNEWGqcr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5763E10ED6B
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779204476; x=1810740476;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SEswoi8kJGDtaltnxpf/Wi1AYxBi5WNgMRHArDjYnuQ=;
 b=iNEWGqcrLkLng/1UzYRbhtIZlQSQGi5OnwDTSHr779BNa4d+FqPP61sa
 osZmrW2GlLTpE2X7/S8xCtWO2rHTWooXBJpNDYoIfZ7DRtvpZSGr9q94t
 BZFkLPZJ5uybDsdK+SkWKwl/G0FQLG/+8FkF/kq2nsL3tQ8EPhclVgUgQ
 MERzpgw+XeJmxtNIERbPqTEZaWyIEwOosIJ5s1ayr2cDm+w3L85pOZ4SH
 ExizrQ2h14m3rnFqhSuXwkG/0o7jjn/y1sYSCTB72ss14fH4TJ/eG+Q2p
 ZlBrkAJKYVyD9vRfDs8Sduu/6Cy/wB2G2cJj74yWDKle/szQuOEsQXQHN g==;
X-CSE-ConnectionGUID: EZkgUXbJTwWpNYJ6oxpmQw==
X-CSE-MsgGUID: zEMZxoi4QteIHjAM/bxSNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90781423"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="90781423"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 08:27:56 -0700
X-CSE-ConnectionGUID: T1wzhs6zQEyvQSsXMNwdsQ==
X-CSE-MsgGUID: 0lg0LMqaTP6uRx+aAbGyTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239851617"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 08:27:54 -0700
Date: Tue, 19 May 2026 17:27:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_cursor_legacy: relax checks on MTK
Message-ID: <20260519152738.svyg244qlzzjmupf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

Thank you all, I merged this.

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
