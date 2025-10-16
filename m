Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B254CCD199
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 14:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD1210E2ED;
	Thu, 16 Oct 2025 14:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Htc1eRBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9EB10E2ED
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 14:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760625425; x=1792161425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/TtNDf8f4HAUyabfRs9zihYBTxF8ebkazESuqhl2gg4=;
 b=Htc1eRBRYfdTpBdVm1l36vpcvCh/5NPf3uNwMaGPpLo0/UP5hsA7QR5M
 mvJwljbD6oqNQqU+ZpzgEdSkMKIBTVev8I4nDlUWmjt+5yq1C4SfF4Uhn
 8lPY1KdTXP52HcM8PjQG9Vt4wHY1SZ2slVmfWpfkxmOUArJnUO9W2JgDp
 u0LLUmQ0AXMqw/sTR97ulnyOprquhpkEJSB0+pWko0xcZjSvJlQ3Y+tgo
 728FJi3AZdEa00zg/adKtSOG0++zdIbUZQUcWEJgXqCmmYjunfr8n9TlV
 y+9j0AxEMvr9ZVjREd/P5b+AiIltPMTzG0hCEcaik7/IDu00/C/vlc/cR g==;
X-CSE-ConnectionGUID: lbsKXyJUTM+5mBNYCnFc/Q==
X-CSE-MsgGUID: qISZcHKESReMPsox38keag==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="65434612"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="65434612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:37:04 -0700
X-CSE-ConnectionGUID: lrdvjN1nSPWUjMeZoWV6mw==
X-CSE-MsgGUID: ssbnEMJ3RoG0G2i56B0/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186743770"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 07:37:02 -0700
Date: Thu, 16 Oct 2025 16:36:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 2/6] tests/kms_plane: Add support for
 planar-settings on non-Intel devices
Message-ID: <20251016143659.j2c2mygmodwnvzhc@kamilkon-DESK.igk.intel.com>
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

Good catch, so it was Intel-only... LGTM

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  
>  	output = igt_get_single_output_for_pipe(&data->display, pipe);
>  	igt_require(output);
> -- 
> 2.43.0
> 
