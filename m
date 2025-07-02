Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45C7C83F04
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 13:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838BF10E6BF;
	Wed,  2 Jul 2025 13:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NpaBHUKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3105310E6BF
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751461582; x=1782997582;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7piW4o2Ba8gBOedjzIt7xQXpISpq+gtktz+T/70+CZ8=;
 b=NpaBHUKQz5rga/mb4sLOBrclK0UZ+qSvtLvEoOL6pn6y1KmVrPoZwzDs
 /x29nflPgZRNQ3ZGrSQ5CXqBXEqSW6wk4EIz2oeEEWhoZnTjZ0RsP3kse
 SkUhjJpriVTF69z2qQS1Bn6x35WRKVcNHdnnEeMzouWqJNAm585tQEcFx
 VWuvj3Kr7JfXL2xg803/D4s7EAgdn5hdJa6tFloQzHwqSDApZ8KSoiQRC
 4/xYhcmdilb3A4xvwdHlBppOIHcQkIB9hD6HpsQUpilkw1TM7+RIOEDBv
 9PDIY7yzRMRCMm3WvdH4fUwe/onMmbymQ0yvog7fxTeYvV1uMsh8FgEKv A==;
X-CSE-ConnectionGUID: jCwimPBgTaetl5iNWkirUw==
X-CSE-MsgGUID: cRgHSzRiRCKSnO4WKZ5zwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="79194622"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="79194622"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:06:22 -0700
X-CSE-ConnectionGUID: 6pJ52N6wQJ6qB3u3UXeNfw==
X-CSE-MsgGUID: 8ot03A+HRxqmXaulqPHZzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="185100076"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 06:06:20 -0700
Date: Wed, 2 Jul 2025 15:06:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 mitulkumar.ajitkumar.golani@intel.com
Subject: Re: [PATCH i-g-t v1] tests/kms_flip: Skip timestamp checks in Intel
 simulation environments
Message-ID: <20250702130617.hm7eep3vtxcotnue@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 mitulkumar.ajitkumar.golani@intel.com
References: <20250624085217.139873-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624085217.139873-1-ramanaidu.naladala@intel.com>
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
On 2025-06-24 at 14:22:17 +0530, Naladala Ramanaidu wrote:
> Bypass timestamp and sequence validations when INTEL_SIMULATION is
> active to accommodate non-deterministic timing in simulated test
> environments.
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_flip.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 65016c66d..db7ced8aa 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -318,7 +318,19 @@ static bool should_skip_ts_checks(void) {
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
> +	if (igt_check_boolean_env_var("INTEL_SIMULATION", false))

Please use function: igt_run_in_simulation() so it will be:

	if (igt_run_in_simulation())

Regards,
Kamil

> +		return true;
> +
> +	return false;
>  }
>  
>  static bool vblank_dependence(int flags)
> -- 
> 2.43.0
> 
