Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819C7C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 08:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3908210E427;
	Mon, 14 Jul 2025 08:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFRHz8+l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932E110E427
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 08:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752483366; x=1784019366;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WsDpJAb3uGTXCaNnQpanRaBe7mRA+jUm44mXC9VNwg0=;
 b=mFRHz8+l9Z00sy9gU4DQ5291HDLiiFcvE3UgmloMwUh+m4mlXn5s4UNh
 8hP5TFg3acVWfIPz7iQSoNvpHGWaP0HsZPjo07mxY/h0v+BOKMQTMHUU6
 fCW6CjD4b+F7qRuMXKP5MrhZCjr77zSiKKUIf0P2A6YSQh0M52rpYxpa7
 gQvIfs60lcZ5hPs1RX/aHUHVG0NCLd4pi9rmshU+8JALobmMNoo7orDZn
 a3CG5a8iNg7u8w5IxIsVcVWyuZP6eV+6PZZ8uK4sYyMr9tIc7abblZbbh
 tVev3BBCaswYVCNnrOfrSFonsG8TixBYFlgOAcoOWLU7kQUER7TkdS4/S Q==;
X-CSE-ConnectionGUID: 8ChVizZTQPir4XktRObYtw==
X-CSE-MsgGUID: 8iJNLm+pStKMFxG1YAhYlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54539994"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="54539994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 01:56:06 -0700
X-CSE-ConnectionGUID: bSxun5eNQpqllEkkejPp9g==
X-CSE-MsgGUID: p0xiLRmbT2KM0JmkLZ5C9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="187880861"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 01:56:05 -0700
Message-ID: <7b3a473f-341e-4a79-8f7d-9da2da38ee54@linux.intel.com>
Date: Mon, 14 Jul 2025 10:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] tests/intel/xe_pm: Reduce debug loglevel
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
References: <20250710080929.412509-1-jan.sokolowski@intel.com>
 <20250710080929.412509-2-jan.sokolowski@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250710080929.412509-2-jan.sokolowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 7/10/2025 10:09 AM, Jan Sokolowski wrote:
> This test exceeds disk usage limit on CI environment
> due to logging too many logs.
> 
> Reduce the debug log level to a CI-friendly value
> if it's bigger than that.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>> ---
>  tests/intel/xe_pm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 7e9324eec..16b5fc686 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -826,6 +826,9 @@ igt_main
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
>  		sysfs_fd = igt_sysfs_open(device.fd_xe);
>  		device.res = drmModeGetResources(device.fd_xe);
> +
> +		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> +		update_debug_mask_if_ci(DRM_UT_KMS);
>  	}
>  
>  	for (const struct s_state *s = s_states; s->name; s++) {

