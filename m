Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23824C83F0A
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 17:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DB110E6B5;
	Tue,  8 Jul 2025 17:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPKHHyha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E7910E6B5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 17:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751994408; x=1783530408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=es0depksWmVYt8xNNmyNHooo3offb2fTMzCUwo4++HY=;
 b=nPKHHyhaqaq28w/6guUo5NEFeByoPy7NiTqp8JeJD5tqPcOKY8Frrdpe
 21us4qNa8mVufzcQXnd6g76cmpQq051/rrVznM9jCTPOHulFAUR/nxZca
 rV+5IUoqmHj0NPm/Xw2C4S/Kxsdc5+FoqZq1+CGjU57imApVeH9uKXK7G
 h7/tX/yr0L4p9mssiL6PqDtnVkUL4fS62/n6BNO9EHBMfFj1XulPK1beu
 zKDyiLCLiqdmPiQReTvvxsw4jUKvO2lMGwfwefOLFpJ8lJHgGHXU3v8FY
 FW6X3X8mTSEPnr0DBy8b/lDhIT91F4A3SbxYUNt58yidc5O1M5H+O911t g==;
X-CSE-ConnectionGUID: AztY8NszSUmQeILmb7N/8w==
X-CSE-MsgGUID: MAtjfY7jSxmsJW2I/iczVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65302677"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="65302677"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 10:06:48 -0700
X-CSE-ConnectionGUID: VcFCAHXCRJyXao/n5sX5fQ==
X-CSE-MsgGUID: HuZpp4FGRZ65q29MbCTe7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="160083772"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 10:06:47 -0700
Date: Tue, 8 Jul 2025 19:06:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t v2] tests/kms_flip: Skip timestamp checks in Intel
 simulation environments
Message-ID: <20250708170643.f666isxtoghbu2gz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 karthik.b.s@intel.com
References: <20250624085217.139873-1-ramanaidu.naladala@intel.com>
 <20250708100813.787544-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708100813.787544-1-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2025-07-08 at 15:38:13 +0530, Naladala Ramanaidu wrote:
> Bypass timestamp and sequence validations when INTEL_SIMULATION is
> active to accommodate non-deterministic timing in simulated test
> environments.
> 
> v2: Use existing function for reading environment variables. (kamil)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_flip.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 382b92d9a..0cebbecac 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -321,7 +321,19 @@ static bool should_skip_ts_checks(void) {
>  	 * timestamp to drift with a relatively larger standard deviation over a large sample.
>  	 * As it's a known issue, skip any Timestamp or Sequence checks for MTK drivers.
>  	 */
> -	return is_mtk_device(drm_fd);
> +	if (is_mtk_device(drm_fd))
> +		return true;
> +
> +	/*
> +	 * In simulation environments, hardware behavior may not accurately reflect real-world
> +	 * timing characteristics. To avoid false negatives in tests due to simulated timing
> +	 * artifacts, skip timestamp and sequence checks when the INTEL_SIMULATION environment
> +	 * variable is set to a truthy value.
> +	 */
> +	if (igt_run_in_simulation())
> +		return true;
> +
> +	return false;
>  }
>  
>  static bool vblank_dependence(int flags)
> -- 
> 2.43.0
> 
