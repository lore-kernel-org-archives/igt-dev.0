Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FC9C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 11:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE82A10E088;
	Thu,  9 May 2024 11:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7SWyyrr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E895110E088
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715252968; x=1746788968;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qBhT6QaUjEQ5hnUNYo4yP1fJj9FvSH6UtnV0FWrsxw8=;
 b=T7SWyyrroCM76MnDPOhp4/gWMPeo2pxx/z5VNy8IS4h1IKw3NRkGqoz/
 m8ZRUxhzY7VfPKJcHNEowLMj5M5pExgir54Qk0fU7/ikZJ9B2lrsc1pko
 NkjoxoOTMEqNQRfepCP+BGHagao/GEgNP2pqdXCJY6oCO6V5a2OPFAii7
 62VELQmVq9V3mcYaDVoFpmhhiFvfFHYrJjR+pXzZxf23rk6Nkj8deTKhM
 mT5CcCfHIKbeN86jmXa5kVtMYZTHh8W7yWFLHBRx30ectpovw2sSAxi9+
 CR3njjOZAHmXBLnDCeGkZhZXoSZheVEMjeyAiyRCxlP7SVv85Sx4Ehg5f Q==;
X-CSE-ConnectionGUID: PUg02F9RSmu10dyX1FIjzQ==
X-CSE-MsgGUID: Zm4ST+UxQ72LkIKQCeWIKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14986761"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="14986761"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 04:09:27 -0700
X-CSE-ConnectionGUID: 1n1Qp2fXRhKSAev9XVgNSg==
X-CSE-MsgGUID: eM6ryYcjQgW/XNZTTMVyWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="34060646"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 04:09:26 -0700
Date: Thu, 9 May 2024 13:09:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH i-g-t] tests/sriov_basic: Restore the igt_sriov_is_pf check
Message-ID: <20240509110922.aligtwplkt7dffpe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com
References: <20240509105956.4118226-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240509105956.4118226-1-marcin.bernatowicz@linux.intel.com>
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
On 2024-05-09 at 10:59:56 +0000, Marcin Bernatowicz wrote:
> The requirement `igt_sriov_is_pf` is essential for accurately skipping
> tests in scenarios where the `sriov_totalvfs` attribute is absent. This
> update restores the previously removed check to ensure proper test
> behavior under such conditions.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/sriov_basic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index 1bc082d76..74f1ce41d 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -120,6 +120,7 @@ igt_main
>  
>  	igt_fixture {
>  		pf_fd = drm_open_driver(DRIVER_ANY);
> +		igt_require(igt_sriov_is_pf(pf_fd));
>  		igt_require(igt_sriov_vfs_supported(pf_fd));
>  		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>  		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> -- 
> 2.31.1
> 
