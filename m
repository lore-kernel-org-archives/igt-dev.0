Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7A2CD98E1
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 15:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B5410E1E6;
	Tue, 16 Jun 2026 15:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdjABpFJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEF410E1E6
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781622973; x=1813158973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kcwMT6PW5TdHDKJ1f3A3fzB68QCP96AlOXy84KXgxQE=;
 b=YdjABpFJVzM1fuYp+7UAiie/7/ziDyZ1aV9jTEPM5K4q8Xo9VFL23MY9
 ++D2WDHY5JaToHHsusNZG2pIrOZ+NwYn3cI9KtuLYkbV3y9aSLnrVQn21
 pf5xVqeP2qN5v8ai8kpzYB4ed0DayRgnmhovMr1+SKk2qBzbRMqis57IG
 8dNZUO1BZdw+FQutq4dHJWstAeJ6tWDj3RQa5KEwA+Rz2LFbanwOnT7UD
 CBuWG8l8IoAqOBS/QwUkcCZ2tetMmJv0WrxMpC5eeXQHFted4KdKGmN/w
 dUAs8R14ckWD724nQoejE/QSZkNk4M+gtCTfPXmnE98crbrLG+2kXLpNF g==;
X-CSE-ConnectionGUID: gufavK20RyCUZVQFgppExg==
X-CSE-MsgGUID: mcmgxABjRTugVzmPxn9ZRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82136703"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82136703"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 08:16:12 -0700
X-CSE-ConnectionGUID: w3N+o89eQ9imAMIhHT+Whw==
X-CSE-MsgGUID: rSwCFOinTrKXJeJz5hvjMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244914682"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 08:16:10 -0700
Date: Tue, 16 Jun 2026 17:15:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 janusz.krzysztofik@linux.intel.com, lukasz.laguna@intel.com
Subject: Re: [PATCH i-g-t v2] lib/intel_chipset: Extend intel_get_pci_device
 to PCI accelerator class
Message-ID: <20260616151546.mcdw6lqo4rb2pdwx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 janusz.krzysztofik@linux.intel.com, lukasz.laguna@intel.com
References: <20260615204723.18187-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615204723.18187-1-ashutosh.dixit@intel.com>
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
On 2026-06-15 at 13:47:23 -0700, Ashutosh Dixit wrote:
> In addition to PCI display class devices, Intel devices can also be PCI
> accelerator class devices. Extend intel_get_pci_device() to also find these
> devices.

Please also write about which tool needs it.

Btw intel_reg should work with --bdf option, did you checked
that it will work with your case without this patch?

> 
> v2: Introduce intel_get_pci_device_disp for those tools who specifically
>     want only display class devices (Kamiil)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/intel_chipset.c             | 82 +++++++++++++++++++++++----------
>  lib/intel_chipset.h             |  1 +
>  tools/intel_audio_dump.c        |  2 +-
>  tools/intel_backlight.c         |  2 +-
>  tools/intel_display_bandwidth.c |  4 +-
>  tools/intel_display_poller.c    |  4 +-
>  tools/intel_panel_fitter.c      |  2 +-
>  tools/intel_watermark.c         |  2 +-
>  8 files changed, 66 insertions(+), 33 deletions(-)

Why there are changes to all tools but not to intel_reg?

> 
> diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
> index 760faede24..ff5f6c0313 100644
> --- a/lib/intel_chipset.c
> +++ b/lib/intel_chipset.c
> @@ -63,16 +63,34 @@
>   */
>  enum pch_type intel_pch;
>  
> -/**
> - * intel_get_pci_device:
> - *
> - * Looks up the main graphics pci device using libpciaccess.
> - *
> - * Returns:
> - * The pci_device, exits the program on any failures.
> - */
> -struct pci_device *
> -intel_get_pci_device(void)
> +static struct pci_device *intel_pci_device_by_class(uint8_t class)

Maybe use two params? So this will be more flexible,
provided that class zero is non-device.

> +{
> +	struct pci_device *pci_dev;
> +	struct pci_device_iterator *iter;
> +	struct pci_id_match match;
> +	int error;
> +
> +	error = igt_pci_system_init();
> +	igt_fail_on_f(error != 0, "Couldn't initialize PCI system\n");
> +
> +	match.vendor_id = 0x8086; /* Intel */
> +	match.device_id = PCI_MATCH_ANY;
> +	match.subvendor_id = PCI_MATCH_ANY;
> +	match.subdevice_id = PCI_MATCH_ANY;
> +
> +	match.device_class = class << 16;
> +	match.device_class_mask = 0xff << 16;
> +
> +	match.match_data = 0;
> +
> +	iter = pci_id_match_iterator_create(&match);
> +	pci_dev = pci_device_next(iter);
> +	pci_iterator_destroy(iter);
> +
> +	return pci_dev;
> +}
> +
> +static struct pci_device *__intel_get_pci_device(bool accel)

Please do not add bool params, they are confusing.

>  {
>  	struct pci_device *pci_dev;
>  	int error;
> @@ -85,22 +103,12 @@ intel_get_pci_device(void)
>  	 * walk the entire PCI bus for a matching device. */
>  	pci_dev = pci_device_find_by_slot(0, 0, 2, 0);
>  	if (pci_dev == NULL || pci_dev->vendor_id != 0x8086) {
> -		struct pci_device_iterator *iter;
> -		struct pci_id_match match;
> +		/* PCI display class (0x3) devices */
> +		pci_dev = intel_pci_device_by_class(0x3);
>  
> -		match.vendor_id = 0x8086; /* Intel */
> -		match.device_id = PCI_MATCH_ANY;
> -		match.subvendor_id = PCI_MATCH_ANY;
> -		match.subdevice_id = PCI_MATCH_ANY;
> -
> -		match.device_class = 0x3 << 16;
> -		match.device_class_mask = 0xff << 16;
> -
> -		match.match_data = 0;
> -
> -		iter = pci_id_match_iterator_create(&match);
> -		pci_dev = pci_device_next(iter);
> -		pci_iterator_destroy(iter);
> +		if (!pci_dev && accel)
> +			/* PCI accelerator class (0x12) devices */
> +			pci_dev = intel_pci_device_by_class(0x12);
>  	}
>  	igt_require_f(pci_dev, "Couldn't find Intel graphics card\n");
>  
> @@ -114,6 +122,30 @@ intel_get_pci_device(void)
>  	return pci_dev;
>  }
>  
> +/**
> + * intel_get_pci_device:
> + *
> + * Looks up display and accelerator class pci devices using libpciaccess
> + *
> + * Returns: The pci_device, exits the program on any failures
> + */
> +struct pci_device *intel_get_pci_device(void)

Please do not change this function, or remove it, your choice.
Imho better to add:

struct pci_device *intel_get_pci_device_display(void)
struct pci_device *intel_get_pci_device_accelerator(void)

or

struct pci_device *intel_get_pci_display(void)
struct pci_device *intel_get_pci_accelerator(void)

+cc Jani

and a helper, which will get display, and if not available,
tries to get accelerator.

Regards,
Kamil

> +{
> +	return __intel_get_pci_device(true);
> +}
> +
> +/**
> + * intel_get_pci_device_disp:
> + *
> + * Looks up display class pci device using libpciaccess
> + *
> + * Returns: The pci_device, exits the program on any failures
> + */
> +struct pci_device *intel_get_pci_device_disp(void)
> +{
> +	return __intel_get_pci_device(false);
> +}
> +
>  static uint32_t __i915_get_drm_devid(int fd)
>  {
>  	struct drm_i915_getparam gp;
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 3fcc5b18d6..ddacbb72b4 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -36,6 +36,7 @@
>  #define BIT(x) (1ul <<(x))
>  
>  struct pci_device *intel_get_pci_device(void);
> +struct pci_device *intel_get_pci_device_disp(void);
>  uint32_t intel_get_drm_devid(int fd);
>  
>  struct intel_device_info {
> diff --git a/tools/intel_audio_dump.c b/tools/intel_audio_dump.c
> index 287dbd4759..1ecac37a21 100644
> --- a/tools/intel_audio_dump.c
> +++ b/tools/intel_audio_dump.c
> @@ -2468,7 +2468,7 @@ int main(int argc, char **argv)
>  	struct pci_device *pci_dev;
>  	struct intel_mmio_data mmio_data;
>  
> -	pci_dev = intel_get_pci_device();
> +	pci_dev = intel_get_pci_device_disp();
>  	devid = pci_dev->device_id; /* XXX not true when mapping! */
>  
>  	do_self_tests();
> diff --git a/tools/intel_backlight.c b/tools/intel_backlight.c
> index edf060224f..c71862f3c2 100644
> --- a/tools/intel_backlight.c
> +++ b/tools/intel_backlight.c
> @@ -41,7 +41,7 @@ int main(int argc, char** argv)
>  	struct intel_mmio_data mmio_data;
>  	uint32_t current, max;
>  
> -	intel_mmio_use_pci_bar(&mmio_data, intel_get_pci_device());
> +	intel_mmio_use_pci_bar(&mmio_data, intel_get_pci_device_disp());
>  
>  	current = INREG(BLC_PWM_CPU_CTL) & BACKLIGHT_DUTY_CYCLE_MASK;
>  	max = INREG(BLC_PWM_PCH_CTL2) >> 16;
> diff --git a/tools/intel_display_bandwidth.c b/tools/intel_display_bandwidth.c
> index b798f8b652..204b71e810 100644
> --- a/tools/intel_display_bandwidth.c
> +++ b/tools/intel_display_bandwidth.c
> @@ -152,14 +152,14 @@ int main(int argc, char *argv[])
>  		}
>  	}
>  
> -	devid = intel_get_pci_device()->device_id;
> +	devid = intel_get_pci_device_disp()->device_id;
>  
>  	if (!has_de_power2(devid)) {
>  		fprintf(stderr, "Display bandwidth counter not available\n");
>  		return 2;
>  	}
>  
> -	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
> +	intel_register_access_init(&mmio_data, intel_get_pci_device_disp(), 0);
>  
>  	if (has_de_power2_abox0_abox1(devid))
>  		measure_de_power2_abox0_abox1(devid, sleep_duration);
> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index 6338f22223..c2b85667ec 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -1508,7 +1508,7 @@ int main(int argc, char *argv[])
>  		}
>  	}
>  
> -	devid = intel_get_pci_device()->device_id;
> +	devid = intel_get_pci_device_disp()->device_id;
>  
>  	/*
>  	 * check if the requires registers are
> @@ -1677,7 +1677,7 @@ int main(int argc, char *argv[])
>  		break;
>  	}
>  
> -	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
> +	intel_register_access_init(&mmio_data, intel_get_pci_device_disp(), 0);
>  
>  	if (auto_scanline_offset)
>  		scanline_offset = default_scanline_offset(devid, pipe);
> diff --git a/tools/intel_panel_fitter.c b/tools/intel_panel_fitter.c
> index d9555d5c67..175b4fbd53 100644
> --- a/tools/intel_panel_fitter.c
> +++ b/tools/intel_panel_fitter.c
> @@ -280,7 +280,7 @@ int main (int argc, char *argv[])
>  	       "with overscan compensation properties: it is just a temporary "
>  	       "solution that may or may not work. Use it at your own risk.\n");
>  
> -	pci_dev = intel_get_pci_device();
> +	pci_dev = intel_get_pci_device_disp();
>  	intel_register_access_init(&mmio_data, pci_dev, 0);
>  	devid = pci_dev->device_id;
>  
> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index 4ebd6eb930..d0678e6e16 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -328,7 +328,7 @@ static void skl_wm_dump(void)
>  	uint32_t wm_linetime[num_pipes];
>  	uint32_t arb_ctl, arb_ctl2, wm_dbg;
>  
> -	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
> +	intel_register_access_init(&mmio_data, intel_get_pci_device_disp(), 0);
>  
>  	arb_ctl = read_reg(0x45000);
>  	arb_ctl2 = read_reg(0x45004);
> -- 
> 2.54.0
> 
