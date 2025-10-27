Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D6FCCF9EB
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 17:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560B710E51B;
	Mon, 27 Oct 2025 17:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GL19bzu+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A8810E522
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761584462; x=1793120462;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=U9/VNrQ5N3/VINIq+bZlavNVrZs9X3XM0Va6PvorjzU=;
 b=GL19bzu+K3Jep+Y9heb/Xq1ACgPTilmLrdBIieKrqnfJnK1Q7gQ3fy8r
 x0YCHha3Y7AF8EfCceYDXORNRQuDY8B4FJcgIw0/xCMkJkBJG1DxPafVs
 Vmr96tjElU+Cs7MLxEarnLkS7UR4mdiNw76PKczmsBcxFVadylS0kpT5Z
 izhlz1cZqWyc5v21jXOjIv/lNlUw0qnmpXoeQ6OKz4QueUhHRzzFJKAQ3
 bw7NfEzTKjPWsY5exgPg6glx4Yg/GNVozGddKRRkX062+Wq1aWcbxCIZG
 J7vy410n1V8nxNu+/bamWrFtkWRGZ6DGPU+mCIMArUDQocHXS2nd8hOan Q==;
X-CSE-ConnectionGUID: 0OFSzPoFSyKkegixzOA6Ug==
X-CSE-MsgGUID: JI/UONjIRDqc4f8cHZNt4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67537764"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="67537764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:01:02 -0700
X-CSE-ConnectionGUID: M9z5lNk4RbuXjy1Dn63RpQ==
X-CSE-MsgGUID: LR+p88UHSQW4MMiGNHMo1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184273846"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 10:01:00 -0700
Date: Mon, 27 Oct 2025 18:00:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [RFC PATCH v1 1/1] tests/kms_big_fb: Open compatible driver for
 the platform
Message-ID: <20251027170058.lqzg4a2ls6fvb5cb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20251027130025.1771523-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027130025.1771523-1-michal.grzelak@intel.com>
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

Hi Michał,
On 2025-10-27 at 14:00:25 +0100, Michał Grzelak wrote:
> On platforms older than ADL-P, tests should be executed with i915 loaded
> before xe. Currently, when tests are executed and xe is loaded first,
> failures are reported in multiple subtests along errors in the dmesg.
> 
> Check if i915 has been loaded before xe. If not, open and optionally
> reload proper driver according to platform's display version.

CI should use IGT_FORCE_DRIVER, like IGT_FORCE_DRIVER=i915 
and/or just unload all other GPU drivers before tests start running.

Could you give links to gitlab issues you are trying to solve?

> 
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>  tests/intel/kms_big_fb.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 41fdcacab..5e8fa6112 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -30,6 +30,8 @@
>   */
>  
>  #include "igt.h"
> +#include "igt_device.h"
> +#include "igt_kmod.h"

This should go after system includes.

>  #include <errno.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> @@ -967,6 +969,30 @@ static bool test_requirements(data_t *input_data, int l)
>  	return true;
>  }
>  
> +static int open_compatible_driver(int drm_fd) {
> +	uint32_t devid;
> +	bool is_adl, is_xe;
> +
> +	devid = is_intel_device(drm_fd);
> +	is_adl = intel_display_ver(devid) <= 13;
> +	is_xe = is_xe_device(drm_fd);
> +
> +	if (!is_adl || !is_xe) return drm_fd;
> +
> +	igt_xe_driver_unload();

I do not know if it is a good idea.

+cc Karthik and Swati
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Regards,
Kamil

> +	if(igt_kmod_is_loaded("i915")) {
> +		igt_kmod_unbind("i915", NULL);
> +		igt_kmod_unload("i915");
> +	}
> +	igt_device_drop_master(drm_fd);
> +	drm_close_driver(drm_fd);
> +	drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +
> +	igt_require(is_i915_device(drm_fd));
> +
> +	return drm_fd;
> +}
> +
>  igt_main
>  {
>  	igt_fixture {
> @@ -976,6 +1002,8 @@ igt_main
>  
>  		igt_require(is_intel_device(data.drm_fd));
>  
> +		data.drm_fd = open_compatible_driver(data.drm_fd);
> +
>  		data.devid = intel_get_drm_devid(data.drm_fd);
>  
>  		kmstest_set_vt_graphics_mode();
> -- 
> 2.45.2
> 
