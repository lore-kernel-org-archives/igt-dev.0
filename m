Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6036ECAC58F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 14:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECA510E1CB;
	Fri, 12 Sep 2025 14:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3xybMwB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD6910EC5B
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 14:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757686492; x=1789222492;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oq0aqTZFYLzNyG3qCQOD0AR7QL0l9F101Sw1fOJzdrQ=;
 b=O3xybMwBQa9DDj3eqUFXAWzXerIWUpb8qDicpH0TOioyVJUdO1YL9pYZ
 MxQEvcQ01It7xUF51FzoMS2PpNSQSRKlUa+NTc/0jI0s2VNYHpQqlH+B3
 Xcng5szREib0e8pQ50AYXlywic/JwjIrHWnRjuzysnltFUoqd5IKmtJWM
 2zgQASYb1dL7HCaWBz7oRLjXAUpDlHv9zxLtKevmBEVtjS/uXyoAygFB7
 wJIn2qNcBoX9iFUw9u1SZvLKv84suq+rSmlkxAuPZOlGYUZ73gcfP8Ncu
 d1gv88ukbSjJYUPcs1qH8Qw19fECTQc4pP2AHPcxL2ms4Yw2lNOp08AN/ A==;
X-CSE-ConnectionGUID: LU+T0hCgREGWNrCksmgUgA==
X-CSE-MsgGUID: 7F55sucjTu+HTZE9AUX81g==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="59071231"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="59071231"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:14:52 -0700
X-CSE-ConnectionGUID: uqMJI2QfQOueTtHnNOzmHA==
X-CSE-MsgGUID: bzQHXYN8Q+OyqeXcdIXuvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173802958"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 07:14:51 -0700
Date: Fri, 12 Sep 2025 16:14:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Sk Anirban <sk.anirban@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_configfs: Skip survivability-mode
 subtest on VF
Message-ID: <20250912141447.eoy7btnzc43lquur@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Sk Anirban <sk.anirban@intel.com>
References: <20250911154411.1372973-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911154411.1372973-1-jakub1.kolakowski@intel.com>
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

Hi Jakub,
On 2025-09-11 at 15:44:11 +0000, Jakub Kolakowski wrote:
> Survivability mode is not supported in VF mode.
> Skip subtest survivability-mode when ran with driver in VF mode.
> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>

+cc Sk Anirban <sk.anirban@intel.com>

> ---
>  tests/intel/xe_configfs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 086f99ba5..27426b52a 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -9,6 +9,7 @@
>  #include "igt_device.h"
>  #include "igt_fs.h"
>  #include "igt_kmod.h"
> +#include "igt_sriov_device.h"
>  #include "igt_sysfs.h"
>  #include "xe/xe_query.h"
>  
> @@ -146,10 +147,12 @@ igt_main
>  {
>  	int fd, configfs_fd, configfs_device_fd;
>  	uint32_t devid;
> +	bool is_vf_device;
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
>  		devid = intel_get_drm_devid(fd);
> +		is_vf_device = intel_is_vf_device(fd);
>  		set_bus_addr(fd);
>  		drm_close_driver(fd);
>  
> @@ -162,6 +165,7 @@ igt_main
>  	igt_describe("Validate survivability mode");
>  	igt_subtest("survivability-mode") {
>  		igt_require(IS_BATTLEMAGE(devid));
> +		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		test_survivability_mode(configfs_device_fd);
>  	}
>  
> -- 
> 2.34.1
> 
