Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B50C28B28
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 15:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB7210E14C;
	Tue, 18 Mar 2025 15:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwxhnGa1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B87110E14C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742312802; x=1773848802;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xZJUARbM9RGuBtPuJ7ovzAL8B2WFJSEyV6jQQfCr16k=;
 b=nwxhnGa1smZdxpbTz5aMGGUWrvxuoaPpVvvXn2h2ZDx4PxAMm5ouu2tf
 ad7a9wTILDoCNv21hl28DtJTj8/8BtM4vS4u0SFkasTEa1ATDG+d1gTCF
 YZHNM9TsVIdk/hS6DRtb4GQtM13tiQHBd/vlgHoyhrEuUoF5cFa06NxPe
 YSLRxsgAE2NWHWUlYLJ6AlunV1c/hKNFK5+GQKsrClZ9dGeajtxgQ+Rbw
 1NkuIs9vcBNvMytCQwcUYmvz6kRJADXrTGBQ9VTwTHZjqr/p/Fu1GmI1/
 pP2EELZ4l4H3EpCrOVuEUC7UvvnTqlYQsHCG7NDeKoEjpMu7zhpB+nLEW g==;
X-CSE-ConnectionGUID: DsKy765bSIWWLsaDNhqh4w==
X-CSE-MsgGUID: k3sQs/YlTbyDN3+zfndX8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="65924615"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="65924615"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 08:46:39 -0700
X-CSE-ConnectionGUID: kqkSiIrYQE6jOK9SuSjeRw==
X-CSE-MsgGUID: YYMuVV8YS8Cbb8rAr2FUug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="159460969"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 08:46:37 -0700
Date: Tue, 18 Mar 2025 16:46:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH <i-g-t> v1 1/2] Add support for xe in runtime pm
Message-ID: <20250318154618.miv5mukkp2svfnwz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com
References: <20250317082823.1631744-1-soham.purkait@intel.com>
 <20250317082823.1631744-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317082823.1631744-2-soham.purkait@intel.com>
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

Hi Soham,
On 2025-03-17 at 13:58:22 +0530, Soham Purkait wrote:
> Add support for runtime power management
> for Xe driver along with existing i915
> support
> 
> v1 :  Updated references from "i915" to
>       "generic GPU driver" to include support
>       for the xe driver, ensuring clarity and
>       consistency
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  tools/intel_pm_rpm.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index 08c25ca8a..8c4778e4f 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -35,7 +35,7 @@
>  #include "igt_pm.h"
>  
>  #define DONT_SET_AUTOSUSPEND_DELAY (1 << 0)
> -#define SET_I915_AUTOSUSPEND_DELAY (1 << 1)
> +#define SET_AUTOSUSPEND_DELAY (1 << 1)
>  
>  typedef struct {
>  	int drm_fd;
> @@ -47,8 +47,8 @@ typedef struct {
>  const char *help_str =
>  	"  --disable-display-wait\t\tDisable all screens and try to go into runtime pm.\n"
>  	"  --force-d3cold-wait\t\tForce dgfx gfx card to enter runtime D3Cold.\n"
> -	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set autosupend delay to"
> -	"  i915 autosuspend delay. Use --setup-d3cold=i915-auto-delay as optional argument.\n"
> +	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set GPU driver's"
> +	"  autosuspend delay. Use --setup-d3cold=auto-delay as optional argument.\n"
>  	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
>  static struct option long_options[] = {
>  	{"disable-display-wait", 0, 0, 'd'},
> @@ -80,14 +80,14 @@ static void disable_all_displays(data_t *data)
>  static void
>  setup_gfx_card_d3cold(data_t *data, unsigned char setup_d3cold)
>  {
> -	struct pci_device *root, *i915;
> +	struct pci_device *root, *gpu_device;
>  
>  	root = igt_device_get_pci_root_port(data->drm_fd);
>  	if (setup_d3cold == DONT_SET_AUTOSUSPEND_DELAY) {
>  		igt_pm_enable_pci_card_runtime_pm(root, NULL);
> -	} else if (setup_d3cold == SET_I915_AUTOSUSPEND_DELAY) {
> -		i915 = igt_device_get_pci_device(data->drm_fd);
> -		igt_pm_enable_pci_card_runtime_pm(root, i915);
> +	} else if (setup_d3cold == SET_AUTOSUSPEND_DELAY) {
> +		gpu_device = igt_device_get_pci_device(data->drm_fd);
> +		igt_pm_enable_pci_card_runtime_pm(root, gpu_device);
>  	}
>  
>  	igt_info("Enabled pci devs runtime pm under Root port %04x:%02x:%02x.%01x\n",
> @@ -151,7 +151,8 @@ int main(int argc, char *argv[])
>  			goto exit;
>  		}
>  	} else {
> -		if (!igt_device_find_first_i915_discrete_card(&card)) {
> +		if (!igt_device_find_first_i915_discrete_card(&card) &&
> +		    !igt_device_find_first_xe_discrete_card(&card)) {
>  			igt_warn("No discrete gpu found\n");
>  			ret = EXIT_FAILURE;
>  			goto exit;
> @@ -169,8 +170,8 @@ int main(int argc, char *argv[])
>  			break;
>  		case 's':
>  			if (optarg) {
> -				if (!strcmp(optarg, "i915-auto-delay")) {
> -					setup_d3cold = SET_I915_AUTOSUSPEND_DELAY;
> +				if (!strcmp(optarg, "auto-delay")) {
> +					setup_d3cold = SET_AUTOSUSPEND_DELAY;
>  				} else	{
>  					usage(argv[0]);
>  					ret = EXIT_SUCCESS;
> @@ -203,7 +204,7 @@ int main(int argc, char *argv[])
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
>  
> -		/* i915 disables RPM in case DMC is not loaded on kms supported cards */
> +		/* GPU driver disables RPM in case DMC is not loaded on kms supported cards */
>  		if (!igt_pm_dmc_loaded(data.debugfs_fd)) {
>  			igt_warn("dmc fw is not loaded, no runtime pm\n");
>  			ret = EXIT_FAILURE;
> @@ -215,7 +216,10 @@ int main(int argc, char *argv[])
>  		igt_setup_runtime_pm(data.drm_fd);
>  		disable_all_displays(&data);
>  		if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)) {
> -			__igt_debugfs_dump(data.drm_fd, "i915_runtime_pm_status", IGT_LOG_INFO);
> +			if (!strcmp("i915", card.driver))
> +				__igt_debugfs_dump(data.drm_fd,
> +						   "i915_runtime_pm_status",
> +						   IGT_LOG_INFO);

Dump this also fo xe driver.

Regards,
Kamil

>  			ret = EXIT_FAILURE;
>  			goto exit;
>  		}
> -- 
> 2.34.1
> 
