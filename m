Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B219EC54ED0
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 10:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8A010E0D1;
	Fri, 23 May 2025 10:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDjbH8Zi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0212010E0D1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747997280; x=1779533280;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fEC1hcXdmXvehxxBo76jDgDV/yA+AKPeSxIm12m52Yc=;
 b=SDjbH8ZiEGOlHC0MIkrziLcc35tagjLqkwub51DQwQAOL7rfUS28kVdO
 TQqDc5bgx5IxWicZWsIPBZJpugB940lvc21ge8GoMicbBpxSSTHeQA+c9
 5AEzeCcK9SAiGH4fBq7VnOZg6/4j7X50AYVelnHZ1S49HNXYk+9hHDmgE
 5dD+8hUhZFfK7s0SqfRSeAYDxymZaIBXEMQz1stLPufuH93H2HEluseCH
 qfk3cJ/hd3/22y59S+PM2HLVcPPqcS5cLf2lVcgrKZjnq4E+A/G1qK1ES
 HYRE68Qeoy/8OBgbUHVYB7sWdC6iCZ/zUarRgx5H0EbDjp9XV3iVCP5xN g==;
X-CSE-ConnectionGUID: HuhoL9NRSNWJhupvJnU5ag==
X-CSE-MsgGUID: qKi5QcWtQ+6+kwwm+Nif1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37673895"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="37673895"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 03:47:59 -0700
X-CSE-ConnectionGUID: QCXV47y6T9ugFfAJPLEajA==
X-CSE-MsgGUID: vV7G4UpwSDC3QcAdKlnvuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="140951414"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 03:47:58 -0700
Date: Fri, 23 May 2025 12:47:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test on SR-IOV VF
Message-ID: <20250523104740.rstjtrouv76txuiw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
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
On 2025-05-22 at 17:24:41 +0000, Jakub Kolakowski wrote:
> EU stall sampling is not supported on SR-IOV VF. Skip the test on SR-IOV
> VF.

imho better:
EU stall sampling is not supported on SR-IOV VF so add a skip for this.

> 
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>  tests/intel/xe_eu_stall.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> index 411c30871..aa94d9565 100644
> --- a/tests/intel/xe_eu_stall.c
> +++ b/tests/intel/xe_eu_stall.c
> @@ -44,6 +44,7 @@
>  
>  #include "igt.h"
>  #include "igt_core.h"
> +#include "igt_sriov_device.h"
>  #include "xe_drm.h"
>  #include "xe/xe_ioctl.h"
>  
> @@ -653,7 +654,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
>  		drm_fd = drm_open_driver(DRIVER_XE);
>  		igt_require_fd(drm_fd);
>  		devid = intel_get_drm_devid(drm_fd);
> -		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
> +		igt_require(!intel_is_vf_device(drm_fd) && (IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0)));

Please add it as separate igt_require_f with clear skip message, like:

		igt_require_f(!intel_is_vf_device(drm_fd), "EU stall sampling not supported on SRIOV VF.\n");

imho you could keep Harish r-b.

Regards,
Kamil

>  		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
>  		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
>  		if (output_file) {
> -- 
> 2.34.1
> 
