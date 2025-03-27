Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E823C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 17:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED2310E0E0;
	Thu, 27 Mar 2025 17:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDWhRaVv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C091C10E0E0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743095196; x=1774631196;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KsvORhReOQtO/owvD21jBk5fuR0f/2rTJIB/4voO6gE=;
 b=SDWhRaVvM5wE2HT/nNFvrl8wr4rknpp8X+CB+9rN6T9fFKcX/FFJvFe+
 2HAma1RlkgE5cj+g3bN+b9WFQ0h7HRoJVeG3EwHkAcpEUfmrAqeTSGwKF
 kLcvoUCqHgxz8CLLyza2KNiUXm3GLgVu6+htBvzq4imVb1PPFsy5KIKTB
 /vMQh26tJU8CwteLIYmXEdhETb56UrP2+nZu7pDItzRnLsbZEanLS5/kj
 WL9yi6IGGkiBAyvTZSH5ki5R3EWifUNpFuOMwufFXE6AkpC5ISdeul7dU
 tvGw1TBkwu8mxUBa2owFLvSCeneaQqTqmC1ZXag9jlQ+/WACPTITk5UN6 A==;
X-CSE-ConnectionGUID: 0kpmnkp7RCiznFpzgkfY7g==
X-CSE-MsgGUID: TaYx69FER3mis3BcwZD2gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44548349"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="44548349"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 10:06:28 -0700
X-CSE-ConnectionGUID: Mcq1CBkTT4KPJQbmxt45fQ==
X-CSE-MsgGUID: nxEMA6k7RwetF4lb0uPZQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="129908393"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 10:06:25 -0700
Date: Thu, 27 Mar 2025 18:06:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: Soham Purkait <soham.purkait@intel.com>, igt-dev@lists.freedesktop.org,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH 'i-g-t' v2 2/2] tools/intel_pm_rpm: Add support for xe in
 runtime pm
Message-ID: <20250327170622.dh6gvamsbi3n4bat@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, vinay.belgaumkar@intel.com,
 kamil.konieczny@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com
References: <20250327014827.1829635-1-soham.purkait@intel.com>
 <20250327014827.1829635-3-soham.purkait@intel.com>
 <9a519d72-c528-4a90-a275-6c7367af313c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9a519d72-c528-4a90-a275-6c7367af313c@intel.com>
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

Hi Riana,
On 2025-03-27 at 19:37:55 +0530, Riana Tauro wrote:
> Hi Soham
> 
> Use this while generating patch for igt
> git format-patch --subject-prefix="i-g-t"
> 
> Replace  [PATCH 'i-g-t' ...]  with [PATCH i-g-t ...]

Or follow CONTRIBUTING.md and in your igt repo do:

git config format.subjectprefix "PATCH i-g-t"

Regards,
Kamil

> 
> On 3/27/2025 7:18 AM, Soham Purkait wrote:
> >    Add support for runtime power management
> > for Xe driver along with existing i915
> > support.
> > 
> > v1 :  Updated references from "i915" to
> >        "generic GPU driver" to include support
> >        for the xe driver, ensuring clarity and
> >        consistency
> > 
> > v2 : Add prefix in commit message (Kamil)
> > 
> > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > ---
> >   tools/intel_pm_rpm.c | 28 ++++++++++++++++------------
> >   1 file changed, 16 insertions(+), 12 deletions(-)
> > 
> > diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> > index 08c25ca8a..8c4778e4f 100644
> > --- a/tools/intel_pm_rpm.c
> > +++ b/tools/intel_pm_rpm.c
> > @@ -35,7 +35,7 @@
> >   #include "igt_pm.h"
> >   #define DONT_SET_AUTOSUSPEND_DELAY (1 << 0)
> > -#define SET_I915_AUTOSUSPEND_DELAY (1 << 1)
> > +#define SET_AUTOSUSPEND_DELAY (1 << 1)
> >   typedef struct {
> >   	int drm_fd;
> > @@ -47,8 +47,8 @@ typedef struct {
> >   const char *help_str =
> >   	"  --disable-display-wait\t\tDisable all screens and try to go into runtime pm.\n"
> >   	"  --force-d3cold-wait\t\tForce dgfx gfx card to enter runtime D3Cold.\n"
> > -	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set autosupend delay to"
> > -	"  i915 autosuspend delay. Use --setup-d3cold=i915-auto-delay as optional argument.\n"
> > +	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set GPU driver's"
> > +	"  autosuspend delay. Use --setup-d3cold=auto-delay as optional argument.\n"
> >   	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
> >   static struct option long_options[] = {
> >   	{"disable-display-wait", 0, 0, 'd'},
> > @@ -80,14 +80,14 @@ static void disable_all_displays(data_t *data)
> >   static void
> >   setup_gfx_card_d3cold(data_t *data, unsigned char setup_d3cold)
> >   {
> > -	struct pci_device *root, *i915;
> > +	struct pci_device *root, *gpu_device;
> >   	root = igt_device_get_pci_root_port(data->drm_fd);
> >   	if (setup_d3cold == DONT_SET_AUTOSUSPEND_DELAY) {
> >   		igt_pm_enable_pci_card_runtime_pm(root, NULL);
> > -	} else if (setup_d3cold == SET_I915_AUTOSUSPEND_DELAY) {
> > -		i915 = igt_device_get_pci_device(data->drm_fd);
> > -		igt_pm_enable_pci_card_runtime_pm(root, i915);
> > +	} else if (setup_d3cold == SET_AUTOSUSPEND_DELAY) {
> > +		gpu_device = igt_device_get_pci_device(data->drm_fd);
> > +		igt_pm_enable_pci_card_runtime_pm(root, gpu_device);
> >   	}
> >   	igt_info("Enabled pci devs runtime pm under Root port %04x:%02x:%02x.%01x\n",
> > @@ -151,7 +151,8 @@ int main(int argc, char *argv[])
> >   			goto exit;
> >   		}
> >   	} else {
> > -		if (!igt_device_find_first_i915_discrete_card(&card)) {
> > +		if (!igt_device_find_first_i915_discrete_card(&card) &&
> > +		    !igt_device_find_first_xe_discrete_card(&card)) {
> >   			igt_warn("No discrete gpu found\n");
> >   			ret = EXIT_FAILURE;
> >   			goto exit;
> > @@ -169,8 +170,8 @@ int main(int argc, char *argv[])
> >   			break;
> >   		case 's':
> >   			if (optarg) {
> > -				if (!strcmp(optarg, "i915-auto-delay")) {
> > -					setup_d3cold = SET_I915_AUTOSUSPEND_DELAY;
> > +				if (!strcmp(optarg, "auto-delay")) {
> > +					setup_d3cold = SET_AUTOSUSPEND_DELAY;
> >   				} else	{
> >   					usage(argv[0]);
> >   					ret = EXIT_SUCCESS;
> > @@ -203,7 +204,7 @@ int main(int argc, char *argv[])
> >   		kmstest_set_vt_graphics_mode();
> >   		igt_display_require(&data.display, data.drm_fd);
> > -		/* i915 disables RPM in case DMC is not loaded on kms supported cards */
> > +		/* GPU driver disables RPM in case DMC is not loaded on kms supported cards */
> >   		if (!igt_pm_dmc_loaded(data.debugfs_fd)) {
> >   			igt_warn("dmc fw is not loaded, no runtime pm\n");
> >   			ret = EXIT_FAILURE;
> > @@ -215,7 +216,10 @@ int main(int argc, char *argv[])
> >   		igt_setup_runtime_pm(data.drm_fd);
> >   		disable_all_displays(&data);
> >   		if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)) {
> > -			__igt_debugfs_dump(data.drm_fd, "i915_runtime_pm_status", IGT_LOG_INFO);
> Add a error or warn statement for xe or else it'll just quit
> 
> Is this tested for xe since CI doesn't run tools?
> 
> Thanks
> Riana> +			if (!strcmp("i915", card.driver))
> > +				__igt_debugfs_dump(data.drm_fd,
> > +						   "i915_runtime_pm_status",
> > +						   IGT_LOG_INFO);
> >   			ret = EXIT_FAILURE;
> >   			goto exit;
> >   		}
> 
