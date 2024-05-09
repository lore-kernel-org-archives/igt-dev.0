Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4221DC10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 09:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F5D10E170;
	Thu,  9 May 2024 09:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/5DB6MO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1A310E170
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715247298; x=1746783298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4gnJjBX3spJfc3B5cCSroDkBh4SZ3hhwq8eQ/gEf8nM=;
 b=W/5DB6MOC8gmDPliI9sWbnIEdbRaaixw+ltZf5dnBlRGv3W4hf1KvlyG
 zs/dqQDbc2SHfP0HRkO1Jollfb00r6PP13t0CxWt0WP+ugt3usXEBkMuG
 Ti18FZ3mDiFN78wWwMFKt3jnh6Ozc+qhqObzcd0EKtxNP8xsWalx0yCZO
 7+2MCnRCzkWSt084MAc8SeddfmSb5KgELWUK19AQGBzvYPgWjlXRM6IhN
 ivN1/x5tKMXK8gi1KEBwApfgEab9eb/g7GdukcXviEwy9ytp/WKnCbKPi
 XqbtIdjADxbiYM4HA/0NafVsmdL9csJUl/ByfnyknxcMn14mUpheRNTS/ A==;
X-CSE-ConnectionGUID: UqVaVgORTuuiVTwa06ud+A==
X-CSE-MsgGUID: YI6pz8DLQ5COAZwPrJee0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21753130"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="21753130"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 02:34:57 -0700
X-CSE-ConnectionGUID: NRZOmsNrQN6rTAXhs46Bww==
X-CSE-MsgGUID: sMHj04bwRKmPgBwPW8IWlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="33982388"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 02:34:56 -0700
Date: Thu, 9 May 2024 11:34:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH i-g-t] tests/sriov_basic: Skip tests if sriov_totalvfs is
 zero
Message-ID: <20240509093434.icf7n665o6flwdi4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com
References: <20240508193258.4069853-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240508193258.4069853-1-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2024-05-08 at 19:32:58 +0000, Marcin Bernatowicz wrote:
> There is no point to run the tests if no VFs can be enabled.
> Additionally, the `for_random_sriov_num_vfs` macro will lead
> to undefined behavior if `sriov_totalvfs` is zero.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/sriov_basic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index f58b3b7ba..1bc082d76 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -120,7 +120,7 @@ igt_main
>  
>  	igt_fixture {
>  		pf_fd = drm_open_driver(DRIVER_ANY);
> -		igt_require(igt_sriov_is_pf(pf_fd));

Could you keep this require here?

Regards,
Kamil

> +		igt_require(igt_sriov_vfs_supported(pf_fd));
>  		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>  		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>  	}
> -- 
> 2.31.1
> 
