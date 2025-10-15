Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86622CCD185
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 15:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3735610E84D;
	Wed, 15 Oct 2025 15:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rr52Gfbn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B72310E84D
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760543479; x=1792079479;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BBojoyXxrqSuOz/gDFMrtk/SGngC/PK7C0KvW8k9uZw=;
 b=Rr52Gfbng4R6bfCnKGc75vHtR+e028LXzIzQqDO8VY1mYP2eQ5Ou0+g3
 DYdPkf6yXWLDl7vWgs35gRnoBQ9+3ovfr/j1K7HmIUkHVEDcTOcXSHrhn
 q2d8RvRqXyCg3+HUppn9uU00y6OtZfKMr6QwZRxSE30dbFP/BXX77Vteb
 UV4+NAf15daBd8xGF6Z2ji+36fkf2kBvoE7iKgJ+ZfW0tYIZvzUNG4k+0
 tWxR4K0wJ9aRvLXpag3qq5RcMQBxSp1LULMWRgMid2WIljZtVighVqEym
 Pcm+1fliZWDi8LKwDyCOdQuPSiqKlSVXxJSi6zg+4iB7gn4xO++c1Dlpd w==;
X-CSE-ConnectionGUID: qoIaQdIyT4mb9XIvoz2Bkg==
X-CSE-MsgGUID: JBQ/TuCuTvaudJzJWCZjYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74171084"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="74171084"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 08:51:19 -0700
X-CSE-ConnectionGUID: 9rMN4Ao6RgmtHxnxOiBg+Q==
X-CSE-MsgGUID: FAphJZK2SdyHWN3BIMEvtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="205911790"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 08:51:17 -0700
Date: Wed, 15 Oct 2025 17:51:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_vram: Skip the test on
 devices without VRAM
Message-ID: <20251015155101.gnvwza75sjdkxtdy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com
References: <20251013132708.20990-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251013132708.20990-1-lukasz.laguna@intel.com>
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

Hi Lukasz,
On 2025-10-13 at 15:27:08 +0200, Lukasz Laguna wrote:
> Add a check to ensure the test runs only on devices with VRAM.
> 
> Fixes: 0ef6c917ab1e ("tests/intel/xe_sriov_vram: Add test checking VF access to VRAM")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6320
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_sriov_vram.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
> index 74e7dffe9a..6c3c8e0314 100644
> --- a/tests/intel/xe_sriov_vram.c
> +++ b/tests/intel/xe_sriov_vram.c
> @@ -346,6 +346,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
>  
>  	igt_fixture {
>  		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(xe_has_vram(pf_fd));
>  		igt_require(igt_sriov_is_pf(pf_fd));
>  		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>  		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> -- 
> 2.40.0
> 
