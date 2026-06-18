Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3127CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 14:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AA810E076;
	Thu, 18 Jun 2026 14:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNA6Xk20";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3FF10E076
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 14:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781794168; x=1813330168;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=+SqMRMyjMYEZg5TJa4WkZsPGueei/rHHyde1sDGRRvw=;
 b=VNA6Xk20pmSargLkds4pBFa+HswEbiLwyKUTivNbHmQwHBvatbPnLCtV
 +JlzzRgFJ8Yvli5c/jCGmsU7uvoGX8vvYenmgGy4FXBU/Zk394AdxK/yg
 H5+NsuzmIzCpYP08wgeX2APVdlr9fyo7YC/Ss6yyUlUghgCPIWxY9ox5F
 4597IF4JaAydUkzplsiWS9AJ82Gs5FM7nxPewF7hsJDFX9PIDvuD5pSa2
 P8Yxk+aDSfTGVjvzFfltfNlduw38ST0J7l3lfKa/u5QJpe0nAS80E4y56
 r5OEmrMc1cg8UP8hbYd/2ivVfdCnAz9tcwTN6z4cNQ2CgdIAvWg9DbRC0 Q==;
X-CSE-ConnectionGUID: LDNl2Zc1SaGCnG4fD/o/nQ==
X-CSE-MsgGUID: 7msiCOM8RVK2/dvD6ZKr2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86542685"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86542685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:49:28 -0700
X-CSE-ConnectionGUID: ffW/VGyiSICrbCc9hhbttQ==
X-CSE-MsgGUID: 2muzFHN2S/qXwz7z+/u8IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="248462977"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:49:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org,
 riana.tauro@intel.com
Subject: Re: [PATCH i-g-t] tests/intel: Enable survivability tests on
 discrete platforms >= BMG
In-Reply-To: <20260618142403.18705-1-himanshu.girotra@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260618142403.18705-1-himanshu.girotra@intel.com>
Date: Thu, 18 Jun 2026 17:49:23 +0300
Message-ID: <8fcc35cf62a9039ce75c746af76d59310edeade9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 18 Jun 2026, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>
> The survivability mode tests in xe_survivability and xe_configfs were
> initially developed for Battlemage (BMG) and gated with IS_BATTLEMAGE.
> Survivability mode is, however, supported by the KMD on all discrete
> platforms from BMG onwards.
>
> Mirror this on the IGT side by replacing the BMG-only check with a
> runtime discrete check combined with a graphics version check
> of at least BMG (IP_VER(20, 1)).
>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_configfs.c      | 4 +++-
>  tests/intel/xe_survivability.c | 3 ++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index e7c797eb7..3ae5d7ee4 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -379,6 +379,7 @@ int igt_main()
>  	int fd, configfs_fd, configfs_device_fd;
>  	uint32_t devid;
>  	bool is_vf_device;
> +	bool is_dgfx;
>  	const char *engine = NULL;
>  
>  	igt_fixture() {
> @@ -387,6 +388,7 @@ int igt_main()
>  		fd = drm_open_driver(DRIVER_XE);
>  		devid = intel_get_drm_devid(fd);
>  		is_vf_device = intel_is_vf_device(fd);
> +		is_dgfx = xe_has_vram(fd);

If you mean is_intel_dgfx(), please use that instead of a different
check, even if they turn out to be the same thing.

BR,
Jani.


>  		set_bus_addr(fd);
>  
>  		xe_for_each_engine(fd, hwe) {
> @@ -410,7 +412,7 @@ int igt_main()
>  
>  	igt_describe("Validate survivability mode");
>  	igt_subtest("survivability-mode") {
> -		igt_require(IS_BATTLEMAGE(devid));
> +		igt_require(is_dgfx && intel_graphics_ver(devid) >= IP_VER(20, 1));
>  		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
>  		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_survivability_mode(configfs_device_fd);
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index d5d7e048c..65814edc6 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -217,7 +217,8 @@ int igt_main()
>  
>  	igt_fixture() {
>  		fd = drm_open_driver(DRIVER_XE);
> -		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		igt_require(xe_has_vram(fd) &&
> +			    intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(20, 1));
>  		vf_device = intel_is_vf_device(fd);
>  		igt_require_f(!vf_device, "survivability mode not supported in VF\n");
>  		pci_xe = igt_device_get_pci_device(fd);

-- 
Jani Nikula, Intel
