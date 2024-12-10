Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1921CE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 11:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F8410E88F;
	Tue, 10 Dec 2024 11:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMF2OWHQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D06D10E892
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 11:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733829307; x=1765365307;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4E6YtpysexJwcXdC1Lv2jwJgY7WbQLOpt5nyzmLLz+k=;
 b=MMF2OWHQL6jG0T/K+4zvO98RlN9f1X+BXzP41LRbBMmQhEBC7S3kffEj
 jrPxiVfxOYWMarsnIeH1/FlLTuPr4gehxWkw2XvD+D2pUkGNZ0etMm71k
 45HhN2NXMPAQKQegRMIk/J3D8c54t3L6FLHgzp/04TwfqYOqZYe2f0WWY
 ULPPWEB3FHdK/EBCOVZWFKjRFpSdOAFR43281lUv3EQI8+54ch/ETpUqn
 jZLxMgZNaqIuVJ6O25+/Fu+k6cWpRp6DJ8y5EEDuC0qeef44g0THyEn5h
 RiAH8fhLxSuAL/93Vw0LL37LUiAP0eKA644teW/vkw4dq58sm1stkVdyj A==;
X-CSE-ConnectionGUID: vKyVjL2qTi61xaXr4rzwvA==
X-CSE-MsgGUID: KeNY8VesRkiXlAwHafshXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44841968"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="44841968"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 03:15:07 -0800
X-CSE-ConnectionGUID: PoEMNnDJSOewr5CmGYyj1A==
X-CSE-MsgGUID: 24+/jhhwSmeJLjfdrIxuNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95203174"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 03:15:05 -0800
Date: Tue, 10 Dec 2024 12:15:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_oa: Move Xe2+ check before
 init_sys_info
Message-ID: <20241210111502.2yz5vouacupywu3h@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20241210020812.1513475-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210020812.1513475-1-ashutosh.dixit@intel.com>
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

Hi Ashutosh,
On 2024-12-09 at 18:08:10 -0800, Ashutosh Dixit wrote:
> In order to avoid failures on unsupported Xe1 platforms, move Xe2+ check
> before init_sys_info.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3645
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_oa.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 8a88945a2b..9e7c2ae1e6 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -4855,14 +4855,14 @@ igt_main
>  		devid = intel_get_drm_devid(drm_fd);
>  		sysfs = igt_sysfs_open(drm_fd);
>  
> +		/* Currently only run on Xe2+ */
> +		igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
> +
>  		igt_require(init_sys_info());
>  
>  		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
>  
>  		render_copy = igt_get_render_copyfunc(devid);
> -
> -		/* Currently only run on Xe2+ */
> -		igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
>  	}
>  
>  	igt_subtest("non-system-wide-paranoid")
> -- 
> 2.47.1
> 
