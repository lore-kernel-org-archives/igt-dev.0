Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4067C83F1D
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 11:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADED10E00F;
	Thu, 10 Jul 2025 11:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q34MZpj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A7410E00F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752148241; x=1783684241;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p1sfZPxICOLEJ8kORgnp5ve0l2v3G23RVST7n1CkTwA=;
 b=Q34MZpj6sptNIb6gVTcqjx5ngp4Io+9H815KlyLt4kgWMSJ0sHX+v9yB
 USHh4dH9tiG6k0kvP/cxjA5tmRqdeEs/BH0inCFbXRfGG1XtamCSLFWCX
 5hUC5OSDXGFgAxX0uigERjyAr6naTxpElaTTb74GrNsWBShbtMI7mAbXF
 yuGxVuP6tCXHoTnkjDdkxqfe6JgermWDRuIADn6pBs5M4I/+hkvUMxMfV
 9+S2yKH5psSlaT0+Izp1V+L/oY3qjNt2udYTNiG7GtdYbpxmjVM3//X2c
 JuG1aKr+SQ+dQfBpzqkOGDrlPVHtcjxtoWzOMsZal1ZHvKYANuEE8OFsJ Q==;
X-CSE-ConnectionGUID: dMWiMMRKTn2+FbMjMw4I+Q==
X-CSE-MsgGUID: Pv6voEDXQLGfOF0/Un1e+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54278086"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54278086"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 04:50:41 -0700
X-CSE-ConnectionGUID: PSTqL6AJT1uFU28iNeAhIQ==
X-CSE-MsgGUID: LfM69Kk+TciPWSZiRV9arA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160069722"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.27])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 04:50:39 -0700
Date: Thu, 10 Jul 2025 13:50:36 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 i-g-t 1/1] tests/intel/xe_copy : Add check for memset
 and memcpy tests.
Message-ID: <4kzhmcwcstidgbggdqrqguqulcdrcxjeb37exuiylyxvcanvjc@72h5ibt5jkyh>
References: <20250710044809.1739631-1-sobin.thomas@intel.com>
 <20250710044809.1739631-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710044809.1739631-2-sobin.thomas@intel.com>
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

On Thu, Jul 10, 2025 at 04:48:09AM +0000, Sobin Thomas wrote:
> Added checks for platforms with graphics_ver < 20 (e.g., PVC) in xe_memcpy (page copy) 
> and memset tests (e.g., xe-memset-linear) using extended parameters.

According to checkpatch this should fit in 75 characters line
width, but this is minor nit.

For the code:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_copy_basic.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index 5a050b82c..2996a496b 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -261,6 +261,7 @@ const char *help_str =
>  igt_main_args("b", NULL, help_str, opt_handler, NULL)
>  {
>  	int fd;
> +	uint16_t dev_id;
>  	struct igt_collection *set, *regions;
>  	uint32_t region;
>  	struct rect linear[] = { { 0, 0xfd, 1, MODE_BYTE },
> @@ -274,6 +275,7 @@ igt_main_args("b", NULL, help_str, opt_handler, NULL)
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> +		dev_id = intel_get_drm_devid(fd);
>  		xe_device_get(fd);
>  		set = xe_get_memory_region_set(fd,
>  					       DRM_XE_MEM_REGION_CLASS_SYSMEM,
> @@ -293,6 +295,7 @@ igt_main_args("b", NULL, help_str, opt_handler, NULL)
>  	for (int i = 0; i < ARRAY_SIZE(page); i++) {
>  		igt_subtest_f("mem-page-copy-%u", page[i].width) {
>  			igt_require(blt_has_mem_copy(fd));
> +			igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
>  			for_each_variation_r(regions, 1, set) {
>  				region = igt_collection_get_value(regions, 0);
>  				copy_test(fd, &page[i], MEM_COPY, region);
> @@ -312,6 +315,13 @@ igt_main_args("b", NULL, help_str, opt_handler, NULL)
>  
>  	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
>  		igt_subtest_f("mem-set-linear-0x%x", linear[i].width) {
> +			/* Skip mem-set-linear test for values greater than
> +			 * 0x3FFFF. As hardware with graphics_ver<20 support
> +			 * till 0x3FFFF.
> +			 */
> +			if ((linear[i].width > 0x3ffff) &&
> +				   (intel_get_device_info(dev_id)->graphics_ver < 20))
> +				igt_skip("Skipping: width exceeds 18-bit limit on gfx_ver < 20.");
>  			igt_require(blt_has_mem_set(fd));
>  			for_each_variation_r(regions, 1, set) {
>  				region = igt_collection_get_value(regions, 0);
> -- 
> 2.34.1
> 
