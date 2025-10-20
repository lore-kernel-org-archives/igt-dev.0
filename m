Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B13FCCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 11:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172B110E29A;
	Mon, 20 Oct 2025 11:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYAPSSTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669E510E29A
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760960900; x=1792496900;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WMNclGqca5mF3NWEd6Q6KojDFIqItUJkuFoVNydI5/M=;
 b=VYAPSSTprc+b3aPDE/bXCQIWgSSH11h2yuwowcJ3pcZhAW0uL6G+RuPp
 ClkroVPIjHR3RN+YnMM1odnf8RLqXRvEZ/n+NIZoUzdCmazGKAwnsBgBB
 nJLbdaX3lcARhfvY2jkXEjAiblYao5ti8CAhOcdOlg/0UwaK5of6ZbAUp
 C9w5xoPGNw2PraXKVYNKNtV9Z3mOZkuV1EHR3sQKCqNVJk29BvibT+xzU
 pGAdc4ne1mVO2ARZXOBp4FmxgMCtJevgWdYQUxiJkjmBw+6iSORVWb1AF
 8TCkVxth+1D3JOAW6p2S5F7yrCo+cqPmgTwiLw10jNm1gIACApaHVeedj A==;
X-CSE-ConnectionGUID: 6WxpTviWT12iWpclUHYamg==
X-CSE-MsgGUID: Ddr/1oYGTyO4N2ZDhJ4coA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63114744"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="63114744"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 04:48:20 -0700
X-CSE-ConnectionGUID: FjxWXrdyT0O0zaKPw2m+7w==
X-CSE-MsgGUID: baEq5sCvSIquJM41P0u6Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183257272"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 04:48:17 -0700
Date: Mon, 20 Oct 2025 13:48:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 2/6] tests/kms_plane: Add support for
 planar-settings on non-Intel devices
Message-ID: <20251020114802.ut5syb2tgeukqaod@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251012171459.3773990-3-jason-jh.lin@mediatek.com>
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
On 2025-10-13 at 01:13:12 +0800, Jason-JH Lin wrote:
> Add an is_intel_device() check before invoking Intel-specific
> requirements in the planar-settings test.
> This allows the test to run on non-Intel devices by skipping
> Intel-only pixel format settings checks.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

I merged your patches 2,3,4 so no need for resending them
in this series.

Regards,
Kamil

> ---
>  tests/kms_plane.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index f7b672c7a01e..8dac41b24b33 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1256,9 +1256,11 @@ static void test_planar_settings(data_t *data)
>  	 * changed to if(..)
>  	 */
>  	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
> -	igt_require_intel(data->drm_fd);
> -	devid = intel_get_drm_devid(data->drm_fd);
> -	igt_require(intel_display_ver(devid) >= 9);
> +	if (is_intel_device(data->drm_fd)) {
> +		igt_require_intel(data->drm_fd);
> +		devid = intel_get_drm_devid(data->drm_fd);
> +		igt_require(intel_display_ver(devid) >= 9);
> +	}
>  
>  	output = igt_get_single_output_for_pipe(&data->display, pipe);
>  	igt_require(output);
> -- 
> 2.43.0
> 
