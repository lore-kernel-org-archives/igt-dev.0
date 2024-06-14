Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91BEC27C77
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 15:16:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF8910ED95;
	Fri, 14 Jun 2024 15:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBVTCvAt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADB110E26C
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718378212; x=1749914212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W9IxufdTI2tP+XWrbr2cxZzJXC2R9nSkceH9rSqKdvw=;
 b=HBVTCvAtmxtitMhACXmXxl+XTp8IB+avpw9AJmtdA4e8RC76thytVPMf
 va2P99r/tYyoqjGPafxL9kIs+q02LF7JIZFmGgVGR4PZmFp/0PSILToCk
 h39kPQf3Q85Aro6owiBNXxi+PPmJtE95klgsXHaUCqCv0bL2Fn48HLxN9
 nYOObOJ9kI97ITUH2CMtqiVdXzuLUfRltwQ2gKHbPzgowmLDPv7YTuNJT
 AmpFQRK6D6Yn5l0jcwcQBFDE6AFaVswTj6y7WMikf0kcEismhepe5InNP
 +l3SSnMOPbpjrKf/P3Cx1dNJ7+hksnpCOSQc8v2oC3TocXKqA1/jUOWMx A==;
X-CSE-ConnectionGUID: NZ2o8jLiSGy8cQgwVJkx6w==
X-CSE-MsgGUID: r8hDu6rsQ4CP7y5dwnCqaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="18188947"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="18188947"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 08:16:50 -0700
X-CSE-ConnectionGUID: sgm4tFRASZeew/DDKoAakw==
X-CSE-MsgGUID: gcT/Dmn9Ri66h31ftHvsOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="71724280"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 08:16:47 -0700
Date: Fri, 14 Jun 2024 17:16:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t v2] tools/lsgpu: Add switch to display gpu pci
 devices
Message-ID: <20240614151628.dtut44j27ew2jefi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20240605045308.97175-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240605045308.97175-1-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2024-06-05 at 06:53:08 +0200, Zbigniew Kempczyński wrote:
> Device scanning in IGT is based on iterating over udev drm devices. This
> limits to display only to devices which have driver loaded.
> 
> To remove this limitation add dedicated udev pci scanning in lsgpu which
> displays all gpu devices (pci class 0x30000).

This or class 0x38000. 0x30000 catches aspeed display card and others
but I do not see ATS-M cards, after loading Xe driver:

sudo build/tools/lsgpu
card0                    Intel Ats_m (Gen12)               drm:/dev/dri/card0
└─renderD128                                               drm:/dev/dri/renderD128

sudo build/tools/lsgpu -pn |grep -i class

ID_PCI_CLASS_FROM_DATABASE      : Display controller
ID_PCI_SUBCLASS_FROM_DATABASE   : Display controller
PCI_CLASS                       : 38000
class                           : 0x038000

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> v2: Remove unnecessary variable
>     Add pci-id and use codename only when is pretty
> ---
>  tools/lsgpu.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 87 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index da84e20505..23ea8ccdd7 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -30,6 +30,7 @@
>  #include <string.h>
>  #include <signal.h>
>  #include <glib.h>
> +#include <libudev.h>
>  
>  /**
>   * SECTION:lsgpu
> @@ -77,12 +78,14 @@ enum {
>  	OPT_LIST_VENDORS   = 'v',
>  	OPT_LIST_FILTERS   = 'l',
>  	OPT_DEVICE         = 'd',
> -	OPT_HELP           = 'h'
> +	OPT_HELP           = 'h',
> +	OPT_PCISCAN        = 'P',
>  };

I do not see description of 'P' option after --help?

>  
>  static bool g_show_vendors;
>  static bool g_list_filters;
>  static bool g_help;
> +static bool g_pciscan;
>  static char *igt_device;
>  
>  static const char *usage_str =
> @@ -158,6 +161,82 @@ static char *get_device_from_rc(void)
>  	return rc_device;
>  }
>  
> +static int pciscan(void)
> +{
> +	struct udev *udev;
> +	struct udev_enumerate *enumerate;
> +	struct udev_list_entry *devices, *dev_list_entry;
> +	struct igt_device_card card;
> +	char pcistr[10];
> +	int ret;
> +
> +	udev = udev_new();
> +	igt_assert(udev);
> +
> +	enumerate = udev_enumerate_new(udev);
> +	igt_assert(enumerate);
> +
> +	printf("Scanning pci subsystem\n");
> +	printf("----------------------\n");
> +	ret = udev_enumerate_add_match_subsystem(enumerate, "pci");
> +	igt_assert(!ret);
> +
> +	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "30000");
> +	igt_assert(!ret);

I am not sure if assert is good here, why not gracefull return?
Print info and return.

> +
> +	ret = udev_enumerate_scan_devices(enumerate);
> +	igt_assert(!ret);

Same here.

> +
> +	devices = udev_enumerate_get_list_entry(enumerate);
> +	if (!devices) {
> +		printf("No pci devices with class 0x30000 found\n");

Why not make class a param?

Regards,
Kamil

> +		return 0;
> +	}
> +
> +	udev_list_entry_foreach(dev_list_entry, devices) {
> +		const char *path;
> +		struct udev_device *udev_dev;
> +		struct udev_list_entry *entry;
> +		char *codename;
> +
> +		path = udev_list_entry_get_name(dev_list_entry);
> +		udev_dev = udev_device_new_from_syspath(udev, path);
> +		printf("[%s]\n", path);
> +
> +		strcpy(card.pci_slot_name, "-");
> +		entry = udev_device_get_properties_list_entry(udev_dev);
> +		while (entry) {
> +			const char *name = udev_list_entry_get_name(entry);
> +			const char *value = udev_list_entry_get_value(entry);
> +
> +			entry = udev_list_entry_get_next(entry);
> +			if (!strcmp(name, "ID_VENDOR_FROM_DATABASE"))
> +				printf("  vendor [db]: %s\n", value);
> +			else if (!strcmp(name, "ID_MODEL_FROM_DATABASE"))
> +				printf("  model  [db]: %s\n", value);
> +			else if (!strcmp(name, "DRIVER"))
> +				printf("  driver     : %s\n", value);
> +			else if (!strcmp(name, "PCI_ID"))
> +				igt_assert_eq(sscanf(value, "%hx:%hx",
> +						     &card.pci_vendor, &card.pci_device), 2);
> +		}
> +		snprintf(pcistr, sizeof(pcistr), "%04x:%04x",
> +			 card.pci_vendor, card.pci_device);
> +		printf("  pci id     : %s\n", pcistr);
> +		codename = igt_device_get_pretty_name(&card, false);
> +		if (strcmp(pcistr, codename))
> +			printf("  codename   : %s\n", codename);
> +		free(codename);
> +
> +		udev_device_unref(udev_dev);
> +	}
> +
> +	udev_enumerate_unref(enumerate);
> +	udev_unref(udev);
> +
> +	return 0;
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	static struct option long_options[] = {
> @@ -180,7 +259,7 @@ int main(int argc, char *argv[])
>  			.type = IGT_PRINT_USER,
>  	};
>  
> -	while ((c = getopt_long(argc, argv, "ncspvld:h",
> +	while ((c = getopt_long(argc, argv, "ncspvld:hP",
>  				long_options, &index)) != -1) {
>  		switch(c) {
>  
> @@ -208,6 +287,9 @@ int main(int argc, char *argv[])
>  		case OPT_HELP:
>  			g_help = true;
>  			break;
> +		case OPT_PCISCAN:
> +			g_pciscan = true;
> +			break;
>  		case 0:
>  			fmt.option = IGT_PRINT_DRM;
>  			break;
> @@ -220,6 +302,9 @@ int main(int argc, char *argv[])
>  		}
>  	}
>  
> +	if (g_pciscan)
> +		return pciscan();
> +
>  	if (g_help) {
>  		printf("%s\n", usage_str);
>  		exit(0);
> -- 
> 2.34.1
> 
