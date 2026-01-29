Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE503D358FD
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 11:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB8710E324;
	Thu, 29 Jan 2026 11:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7jullHR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8DD10E324
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 11:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769684869; x=1801220869;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oCSaIHd2eFRzWktG2FF+A02v1MhWdfqlTls3k70mTcs=;
 b=A7jullHR/f0BdcSYVZM5AxPkDM940uA3HoSndqFcCafy9SyPmiL13G17
 YB6u99BKcEgvPPpabigyTA5j9tFQLjpfPSuPM3FP6pV982/AppqGKAOls
 A93pjNJ7r2f3Jq3xtK49axeZTzdgVAs+O3uai6FY1DHO1ZQI+kTZXrZ8r
 BJShGTbNIa4dfy7A3SSQgv30gdS0FyxAO9Bv43OYBV8vVYOS6upVYajeh
 aEwJIGe/R+pG1V9VGDhJD9Yk9t63BbVnojTFIdgSwDu81OJJMhYeVh24b
 zndggKJKp6tK1Na8owWmFV4BacFBWFtDlZ9I3yEPypqQkkn1ohFfOgnvc A==;
X-CSE-ConnectionGUID: jx44B6RCSNmQuSXrpBGPTQ==
X-CSE-MsgGUID: NuxGGVj3T/usE6RB9MzsqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69935178"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="69935178"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 03:07:49 -0800
X-CSE-ConnectionGUID: 6g3eklTHTRetlOeL/ZpJbg==
X-CSE-MsgGUID: il+Lz9eyRImomkePFuJpnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208910245"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:07:46 -0800
Date: Thu, 29 Jan 2026 12:07:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 2/2] tests/kms_color: Add 10-bit color depth
 support to CTM test for MediaTek
Message-ID: <20260129110743.uhd6fbruu53ddr6m@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
 <20260128082517.920321-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128082517.920321-3-jason-jh.lin@mediatek.com>
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
On 2026-01-28 at 16:24:43 +0800, Jason-JH Lin wrote:
> Add 10-bit color depth flow to CTM test for MediaTek devices, which only
> support bit-true results with 10-bit data. The test now selects 8-bit or
> 10-bit color depth and framebuffer format based on device type.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/kms_color.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index c6cd35d74a2f..146e1c67ea60 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -792,18 +792,23 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
>  		       int iter)
>  {
>  	bool success = false;
> +	bool depth_10bit = false;
>  	double delta;
>  	int i;
>  
>  	test_setup(data, p);
>  
> +	/* MediaTek can only support bit-ture in 10-bit depth pre color */
> +	if (is_mtk_device(data->drm_fd))
> +		depth_10bit = true;
> +
>  	/*
> -	 * We assume an 8bits depth per color for degamma/gamma LUTs
> +	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
>  	 * for CRC checks with framebuffer references.
>  	 */
> -	data->color_depth = 8;
> +	data->color_depth = depth_10bit ? 10 : 8;
>  	delta = 1.0 / (1 << data->color_depth);
> -	data->drm_format = DRM_FORMAT_XRGB8888;
> +	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
>  	data->mode = igt_output_get_mode(data->output);
>  
>  	igt_require(pipe_output_combo_valid(data, p));
> -- 
> 2.43.0
> 
