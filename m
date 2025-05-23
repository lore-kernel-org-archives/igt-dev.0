Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CC6C3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 10:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD7C10E095;
	Fri, 23 May 2025 10:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftuvhyxf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD1210E095
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747996834; x=1779532834;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gpwXHt79V43V2wZtfso6dkTWUmwKRVZeeNQBm1gZOSo=;
 b=ftuvhyxfXI1TLEXqMd2rZgMJhGHLSGcNNzadAo3uyaGHDH5/i7SvNZMY
 VC59Np62m7ezQk/VcsW6cMqC67R/+mUkVLCBxb7fVR1Dsgwero8FiyO5w
 0f6sbuMPjd6KurgFLJJfIJoZj91CoZXEZU1D73h+GjvvjxFsL7P0bvBwv
 sCipMiGqCJSi+S4HMAr8uaHDWMTev1QW8fMKjEnPY2MmO3zZ7UhZPE41G
 0+voHGEGQHEPQZFrk37f3MPveb4ut9Q+NOyR34oL/h5lqEsp0Daemkx1s
 USlStlvXZmDiINNXBExjkBeCHSD3eogc3rqdu9rOTSwoMWg5lZWpg8u0E w==;
X-CSE-ConnectionGUID: 5m8ljJAzQnurPOUzMJzJKA==
X-CSE-MsgGUID: 7CsT1Ou6SRehtjzfMRflGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53846544"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="53846544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 03:40:33 -0700
X-CSE-ConnectionGUID: 6kdJoqWjThKbl96XVw/rZA==
X-CSE-MsgGUID: k9n7Y2UsTTKzBVZq5tjQdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="145050771"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.155])
 ([10.245.254.155])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 03:40:31 -0700
Message-ID: <9eb53198-a170-4cb2-9f31-db5f3dbeb60d@linux.intel.com>
Date: Fri, 23 May 2025 12:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_eu_stall: Skip test on SR-IOV VF
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250522172441.3914198-1-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 5/22/2025 7:24 PM, Jakub Kolakowski wrote:
> EU stall sampling is not supported on SR-IOV VF. Skip the test on SR-IOV
> VF.
> 
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel/xe_eu_stall.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> index 411c30871..aa94d9565 100644
> --- a/tests/intel/xe_eu_stall.c
> +++ b/tests/intel/xe_eu_stall.c
> @@ -44,6 +44,7 @@
>   
>   #include "igt.h"
>   #include "igt_core.h"
> +#include "igt_sriov_device.h"
>   #include "xe_drm.h"
>   #include "xe/xe_ioctl.h"
>   
> @@ -653,7 +654,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
>   		drm_fd = drm_open_driver(DRIVER_XE);
>   		igt_require_fd(drm_fd);
>   		devid = intel_get_drm_devid(drm_fd);
> -		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
> +		igt_require(!intel_is_vf_device(drm_fd) && (IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0)));
>   		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
>   		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
>   		if (output_file) {

Don't we have another option to check the feature is unavailable (ex. an 
ioctl returning ENODEV) ?

