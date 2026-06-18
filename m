Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D898FCD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 20:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CE810E576;
	Thu, 18 Jun 2026 20:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gs9oDGiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDA410E576
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781814671; x=1813350671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1TYhNGdzUKnb923LWofDTue76LYegVFPNEcoOMezh10=;
 b=Gs9oDGiA4v0iEPwjSp0sVFENzDV5yYykwR93jyjeOyA8ipV0fiRHkdMS
 2okPJrdNcX/I3yxkIBkGXNsMHSZx8U8LoAYXfGOJX5bxPp2in869XkIFb
 eegzecV0/6YoCf/m9xsKqwcl5/NsfzS22sIeqCM0uqKnIzubq5somEJHz
 vJSfAtxXQ4Z+gEWZoKjLeDS3FZ6kphV1MilFBhhUL10hLErHX1avpQ7NY
 6/odGc7JVmR1ZL1vMSTDajZtk1vb5MMN9wQEgh6EN3DhxUEzz1QoLkFj3
 8+rCjPHLA3qkQxs7bleuIxtYKfimJCUt4bvO8tEF/4ps0/nRO7dz14hmq g==;
X-CSE-ConnectionGUID: gUGmvSYzQR6udYChbVempQ==
X-CSE-MsgGUID: pytAZDexQZS7DrN0S7T6Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="86582118"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="86582118"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 13:31:10 -0700
X-CSE-ConnectionGUID: 6I43KEwiSYaf2QW+XmAZrw==
X-CSE-MsgGUID: RnosuPWvTXih7k2dR3kdSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="245544442"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 13:31:09 -0700
Date: Thu, 18 Jun 2026 22:30:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 janusz.krzysztofik@linux.intel.com, lukasz.laguna@intel.com,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH i-g-t v3] lib/intel_chipset: Extend intel_get_pci_device
 to PCI accelerator class
Message-ID: <20260618203049.myzmhjuxgbobubms@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 janusz.krzysztofik@linux.intel.com, lukasz.laguna@intel.com,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20260616145458.181427-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616145458.181427-1-ashutosh.dixit@intel.com>
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
On 2026-06-16 at 07:54:58 -0700, Ashutosh Dixit wrote:
> In addition to PCI display class devices, Intel devices can also be PCI
> accelerator class devices. Extend intel_get_pci_device() to also find these
> devices.
> 
> v2: Introduce intel_get_pci_device_disp for those tools who specifically
>     want only display class devices (Kamiil)
> v3: s/intel_get_pci_device_disp/intel_get_pci_device_display/
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
>  7 files changed, 65 insertions(+), 32 deletions(-)
> 
> diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
> index 760faede24..8bf3d52b77 100644
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

Also there was a device probe, you need it here when
pci_dev != NULL

Add a check for vendor id, just like in previous implementation,
	if (pci_dev && pci_dev->vendor_id != 0x8086)
		err here


> +
> +	return pci_dev;
> +}
> +
> +static struct pci_device *__intel_get_pci_device(bool accel)

Please remove this function, see below.

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
> +{

Just encode it here:
  	struct pci_device *pci_dev = intel_pci_device_by_class(0x3);

	if (!pci_dev)
  		pci_dev = intel_pci_device_by_class(0x12);

	if (!pci_dev) {
		drop error here just like in previous implementation
	}

	return pci_dev;
> +}
> +
> +/**
> + * intel_get_pci_device_disp:

s/disp/display/

> + *
> + * Looks up display class pci device using libpciaccess
> + *
> + * Returns: The pci_device, exits the program on any failures
> + */
> +struct pci_device *intel_get_pci_device_display(void)
> +{
> +	return __intel_get_pci_device(false);

Here use helper directly:

	pci_dev = intel_pci_device_by_class(0x3);

and add error check igt_require(...)

Regards,
Kamil

> +}
> +
>  static uint32_t __i915_get_drm_devid(int fd)
>  {
>  	struct drm_i915_getparam gp;
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 3fcc5b18d6..018cfaba5e 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -36,6 +36,7 @@
>  #define BIT(x) (1ul <<(x))
>  
>  struct pci_device *intel_get_pci_device(void);
> +struct pci_device *intel_get_pci_device_display(void);
>  uint32_t intel_get_drm_devid(int fd);
>  
>  struct intel_device_info {
> diff --git a/tools/intel_audio_dump.c b/tools/intel_audio_dump.c
> index 287dbd4759..5761fc1bbc 100644
> --- a/tools/intel_audio_dump.c
> +++ b/tools/intel_audio_dump.c
> @@ -2468,7 +2468,7 @@ int main(int argc, char **argv)
>  	struct pci_device *pci_dev;
>  	struct intel_mmio_data mmio_data;
>  
> -	pci_dev = intel_get_pci_device();
> +	pci_dev = intel_get_pci_device_display();
>  	devid = pci_dev->device_id; /* XXX not true when mapping! */
>  
>  	do_self_tests();
> diff --git a/tools/intel_backlight.c b/tools/intel_backlight.c
> index edf060224f..1478583e97 100644
> --- a/tools/intel_backlight.c
> +++ b/tools/intel_backlight.c
> @@ -41,7 +41,7 @@ int main(int argc, char** argv)
>  	struct intel_mmio_data mmio_data;
>  	uint32_t current, max;
>  
> -	intel_mmio_use_pci_bar(&mmio_data, intel_get_pci_device());
> +	intel_mmio_use_pci_bar(&mmio_data, intel_get_pci_device_display());
>  
>  	current = INREG(BLC_PWM_CPU_CTL) & BACKLIGHT_DUTY_CYCLE_MASK;
>  	max = INREG(BLC_PWM_PCH_CTL2) >> 16;
> diff --git a/tools/intel_display_bandwidth.c b/tools/intel_display_bandwidth.c
> index b798f8b652..193f309d39 100644
> --- a/tools/intel_display_bandwidth.c
> +++ b/tools/intel_display_bandwidth.c
> @@ -152,14 +152,14 @@ int main(int argc, char *argv[])
>  		}
>  	}
>  
> -	devid = intel_get_pci_device()->device_id;
> +	devid = intel_get_pci_device_display()->device_id;
>  
>  	if (!has_de_power2(devid)) {
>  		fprintf(stderr, "Display bandwidth counter not available\n");
>  		return 2;
>  	}
>  
> -	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
> +	intel_register_access_init(&mmio_data, intel_get_pci_device_display(), 0);
>  
>  	if (has_de_power2_abox0_abox1(devid))
>  		measure_de_power2_abox0_abox1(devid, sleep_duration);
> diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
> index 6338f22223..df333597e7 100644
> --- a/tools/intel_display_poller.c
> +++ b/tools/intel_display_poller.c
> @@ -1508,7 +1508,7 @@ int main(int argc, char *argv[])
>  		}
>  	}
>  
> -	devid = intel_get_pci_device()->device_id;
> +	devid = intel_get_pci_device_display()->device_id;
>  
>  	/*
>  	 * check if the requires registers are
> @@ -1677,7 +1677,7 @@ int main(int argc, char *argv[])
>  		break;
>  	}
>  
> -	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
> +	intel_register_access_init(&mmio_data, intel_get_pci_device_display(), 0);
>  
>  	if (auto_scanline_offset)
>  		scanline_offset = default_scanline_offset(devid, pipe);
> diff --git a/tools/intel_panel_fitter.c b/tools/intel_panel_fitter.c
> index d9555d5c67..2234eac6c4 100644
> --- a/tools/intel_panel_fitter.c
> +++ b/tools/intel_panel_fitter.c
> @@ -280,7 +280,7 @@ int main (int argc, char *argv[])
>  	       "with overscan compensation properties: it is just a temporary "
>  	       "solution that may or may not work. Use it at your own risk.\n");
>  
> -	pci_dev = intel_get_pci_device();
> +	pci_dev = intel_get_pci_device_display();
>  	intel_register_access_init(&mmio_data, pci_dev, 0);
>  	devid = pci_dev->device_id;
>  
> -- 
> 2.54.0
> 
