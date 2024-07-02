Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EDDC3064D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 15:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7C510E079;
	Tue,  2 Jul 2024 15:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8XbF9Fq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC2310E081
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719934097; x=1751470097;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MmWbk0ysPclq+9xfJVkP+TAhIStgUGKF9HmE/r2aFLQ=;
 b=J8XbF9FqYGEvPuIXcPzAdkrWU8Aeled7Ho84yc2c0xDgft0+3PcBkNV2
 2KWlQI3dHwPuDjiLcd/JkRV1be+b7skHOLNzqKhEWWZZvwhE8F5C421GO
 GUsrbdK7b0YcMOskYLx14rF639an68fzOP4dSk55cHf7u0cs7w5xziwmb
 ZVDy7QC4mGbEntUNGZtFsDtz8Gs6wV9nNhSwhGY2dQCSyHMPDLh3SGarO
 u3lNCkeuKmKN63VNkeY9zNQlGdjVmPgTi/kQiKcpPbyXSOeCFfCcRGkyg
 DCe3oSVh7KcB6+tbvj8HmHzCbrPz0b+u9gIsKOTfVmz0l+/zNJspsbSnk A==;
X-CSE-ConnectionGUID: k31NLP2bSKyzcebWjD0gBw==
X-CSE-MsgGUID: gRB7d0HPSWOXYuUr9J0oYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17251264"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="17251264"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 08:28:16 -0700
X-CSE-ConnectionGUID: B9PoihS0SP6hA/NKC8iXFQ==
X-CSE-MsgGUID: vTKHswYPRNuatLfHVfNd0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="51136444"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 08:28:16 -0700
Date: Tue, 2 Jul 2024 17:28:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t v4] tools/lsgpu: Add switch to display gpu pci
 devices
Message-ID: <20240702152812.rglg2tecotw7wekq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20240702082203.165672-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240702082203.165672-1-zbigniew.kempczynski@intel.com>
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
On 2024-07-02 at 10:22:03 +0200, Zbigniew Kempczyński wrote:
> Device scanning in IGT is based on iterating over udev drm devices. This
> limits to display only to devices which have driver loaded.
> 
> To remove this limitation add dedicated udev pci scanning in lsgpu which
> displays all gpu devices (pci class 0x30000 or 0x38000).
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> v2: Remove unnecessary variable
>     Add pci-id and use codename only when is pretty
> v3: Add class 0x38000 (Kamil)
>     Add --pci-scan long opt
> v4: Add 0x38000 in commit msg
>     Clean up in case of empty devices scan (Kamil)
> ---
>  tools/lsgpu.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 92 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index da84e20505..bdc6671fe1 100644
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
>  
>  static bool g_show_vendors;
>  static bool g_list_filters;
>  static bool g_help;
> +static bool g_pciscan;
>  static char *igt_device;
>  
>  static const char *usage_str =
> @@ -92,6 +95,7 @@ static const char *usage_str =
>  	"  -c, --codename              Print codename instead pretty device name\n"
>  	"  -s, --print-simple          Print simple (legacy) device details\n"
>  	"  -p, --print-details         Print devices with details\n"
> +	"  -P, --pci-scan              Print pci display devices\n"
>  	"  -v, --list-vendors          List recognized vendors\n"
>  	"  -l, --list-filter-types     List registered device filters types\n"
>  	"  -d, --device filter         Device filter, can be given multiple times\n"
> @@ -158,6 +162,85 @@ static char *get_device_from_rc(void)
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
> +	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "38000");
> +	igt_assert(!ret);
> +
> +	ret = udev_enumerate_scan_devices(enumerate);
> +	igt_assert(!ret);
> +
> +	devices = udev_enumerate_get_list_entry(enumerate);
> +	if (!devices) {
> +		printf("No pci devices with class 0x30000|0x38000 found\n");
> +		goto out;
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
> +out:
> +	udev_enumerate_unref(enumerate);
> +	udev_unref(udev);
> +
> +	return 0;
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	static struct option long_options[] = {
> @@ -168,6 +251,7 @@ int main(int argc, char *argv[])
>  		{"codename",          no_argument,       NULL, OPT_CODENAME},
>  		{"print-simple",      no_argument,       NULL, OPT_PRINT_SIMPLE},
>  		{"print-detail",      no_argument,       NULL, OPT_PRINT_DETAIL},
> +		{"pci-scan",          no_argument,       NULL, OPT_PCISCAN},
>  		{"list-vendors",      no_argument,       NULL, OPT_LIST_VENDORS},
>  		{"list-filter-types", no_argument,       NULL, OPT_LIST_FILTERS},
>  		{"device",            required_argument, NULL, OPT_DEVICE},
> @@ -180,7 +264,7 @@ int main(int argc, char *argv[])
>  			.type = IGT_PRINT_USER,
>  	};
>  
> -	while ((c = getopt_long(argc, argv, "ncspvld:h",
> +	while ((c = getopt_long(argc, argv, "ncspvld:hP",
>  				long_options, &index)) != -1) {
>  		switch(c) {
>  
> @@ -208,6 +292,9 @@ int main(int argc, char *argv[])
>  		case OPT_HELP:
>  			g_help = true;
>  			break;
> +		case OPT_PCISCAN:
> +			g_pciscan = true;
> +			break;
>  		case 0:
>  			fmt.option = IGT_PRINT_DRM;
>  			break;
> @@ -220,6 +307,9 @@ int main(int argc, char *argv[])
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
