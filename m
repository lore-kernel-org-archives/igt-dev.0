Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAA6C83F28
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 10:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F21610E12B;
	Mon, 14 Jul 2025 10:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJP4PSza";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53ACB10E12B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752487779; x=1784023779;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lqFuO/olwq4u0zWcMwrLFh5566yyx1Zm5eB4D7Kycns=;
 b=NJP4PSzaRfaRpM32ZTzyspmrNRy9M4bNVTJxJO5OB8qEz7cETRfmpnFF
 WrSwgdWkJwC4VmNp/TenLO9CpJ+FIG29/xuEuIjoUxvdp0jk351pgYw74
 WtVbBM5FJcjtVZU9vBjzAOBQ0fTr/+Ohd3MWMlrSK+7P2mXwMHupNUR9x
 UjPvuBJSfWrqD/shNa5xSRVxT/BRrxHlwxJXEBR7gEG+jsc40JZdmvHLH
 WCMCzuwfaTDM6Tq1Rk3zoaG3RpC2TnGDA6kG+6RNvuS+Dlq2QtmR+ZCJJ
 j2NFbgo3lPVCHjoZdSEIlS79aEeH7/H5YSFrf7x85gIRNVVME7/1YPwhG Q==;
X-CSE-ConnectionGUID: f45L99ozSsq+d31+wMttmw==
X-CSE-MsgGUID: D05hPxNeQza3V7W8WEtGEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="57286308"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="57286308"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 03:09:39 -0700
X-CSE-ConnectionGUID: Ehr9qkGdSuOC4eheTREPWA==
X-CSE-MsgGUID: rdwt1PY4TxuBop/14pLSmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="194091991"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.191])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 03:09:38 -0700
Date: Mon, 14 Jul 2025 12:09:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v3 i-g-t 1/1] tests/intel/xe_copy : Add memset/memcpy
Message-ID: <bk34g24sz4rsahsmaqwjvi5p4yqcnp35q7qgccitazgp2z45zu@lsfqhhfypdus>
References: <20250710125852.1742211-1-sobin.thomas@intel.com>
 <20250710125852.1742211-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710125852.1742211-2-sobin.thomas@intel.com>
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

On Thu, Jul 10, 2025 at 12:58:52PM +0000, Sobin Thomas wrote:

Subject: [PATCH v3 i-g-t 1/1] tests/intel/xe_copy : Add memset/memcpy

is not correct, please fix. I keep my r-b for the code.

--
Zbigniew


> Added the check for platforms (graphics_ver < 20) like PVC for xe
> memcpy and memset for some tests (like xe-memset-linear) with
> extended parameters.
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
