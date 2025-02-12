Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533F2C0219E
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 07:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C90310E26D;
	Wed, 12 Feb 2025 07:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUYispJG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C3210E26D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 07:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739346856; x=1770882856;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RP7m514TI1NUo5NqMa3AqNuFh9eSFMSJOsmeJK/68dE=;
 b=SUYispJGhu/MI3evw9igScey2wkE+I543czsxNf6nZEMbUzs+UyPNWY3
 WVsaINs/y2tbPR1ay354JkxGxRMeTJwolIYnVClqfeusfAM1W/Ok9Bokq
 iwFssFPjU3tPZmMXHTifqfLxH3Xg060p5c6Yn4rACLtr09o9/hh0zo7Ia
 ZqPG92lXF9TRIbxzo7zb8eYUNOgtcVGYLuTRy37oSV+DW5L4isz/vLvp2
 cY7hGnYyL19G+d96exjFv1ATgrctRx+CRzRZV/+g+fMGaDmYYTvQqH1BN
 wIHLzJv8ljHLTJSsYN0J/SFK8ZPJhClyVK6xXV5PWTWs3FfGIkuHY96TA g==;
X-CSE-ConnectionGUID: bYZC+wGeR+6qmYyNRoiT3w==
X-CSE-MsgGUID: KmCU67qRR9+4DafmkvNjZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39181565"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="39181565"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 23:54:15 -0800
X-CSE-ConnectionGUID: 095Nj8SYTrmBxiUA/Kd27Q==
X-CSE-MsgGUID: AlOUROi8SHS1HIaplv54yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116835945"
Received: from amiszcza-mobl.ger.corp.intel.com (HELO [10.245.81.229])
 ([10.245.81.229])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 23:54:14 -0800
Message-ID: <a6a9e96a-3dc3-49a7-99b0-38057d88be59@linux.intel.com>
Date: Wed, 12 Feb 2025 08:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/intel_reg: Add --pci-slot option
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: =?UTF-8?B?xYF1a2FzeiDFgWFndW5h?= <lukasz.laguna@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250131213733.142894-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20250131213733.142894-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Kamil,

On 31.01.2025 22:37, Kamil Konieczny wrote:
> From: Łukasz Łaguna <lukasz.laguna@intel.com>
>
> Add device selection by PCI slot with new option
>
> --pci-slot <domain>:<bus>:<device>[.<func>]
>
> Example:
>
> intel_reg dump --pci-slot 0000:01:00.0
> intel_reg dump --pci-slot 0000:8c:00
>
> This should help in multi-GPU scenario when someone uses two or
> more discrete GPUs.
>
> v1: address review comments from Jani (Kamil)
>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Łukasz Łaguna <lukasz.laguna@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
> This is a re-work of Lukasz Laguna patch from
> https://patchwork.freedesktop.org/series/131155/
> ("tools/intel_reg: add possibility to select device")
>
> Example usage on two dGPU:
> sudo ./intel_reg --pci-slot 0000:8c:00.0 read 0x00138108
>                                      (0x00138108): 0xf4e57b26
> sudo ./intel_reg --pci-slot 0000:87:00.0 read 0x00138108
>                                      (0x00138108): 0xf4162825
>
>   man/intel_reg.rst |   5 ++-
>   tools/intel_reg.c | 106 +++++++++++++++++++++++++++++++++++++++++++---
>   2 files changed, 103 insertions(+), 8 deletions(-)
>
> diff --git a/man/intel_reg.rst b/man/intel_reg.rst
> index 059d8834a..64e4fa57f 100644
> --- a/man/intel_reg.rst
> +++ b/man/intel_reg.rst
> @@ -9,7 +9,7 @@ Intel graphics register multitool
>   :Author: Jani Nikula <jani.nikula@intel.com>
>   :Date: 2016-03-01
>   :Version: |PACKAGE_STRING|
> -:Copyright: 2015-2016 Intel Corporation
> +:Copyright: 2015-2025 Intel Corporation
>   :Manual section: |MANUAL_SECTION|
>   :Manual group: |MANUAL_GROUP|
>   
> @@ -56,6 +56,9 @@ Some options are global, and some specific to commands.
>       Pretend to be PCI ID DEVID. Useful with MMIO bar snapshots from other
>       machines.
>   
> +--pci-slot <domain>:<bus>:<device>[.<func>]
> +    Find Intel GPU by PCI slot. Useful with multi-GPU hardware.
> +
>   --spec=PATH
>       Read register spec from directory or file specified by PATH; see REGISTER
>       SPEC DEFINITIONS below for details. This option implies --decode.
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index bb1ab2889..45f8b3a94 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -39,6 +39,7 @@
>   #include "intel_chipset.h"
>   
>   #include "intel_reg_spec.h"
> +#include "igt_device_scan.h"
>   
>   
>   #ifdef HAVE_SYS_IO_H
> @@ -89,6 +90,13 @@ struct config {
>   	int verbosity;
>   };
>   
> +struct igt_pci_slot {
> +	int domain;
> +	int bus;
> +	int dev;
> +	int func;
> +};
> +
>   /* port desc must have been set */
>   static int set_reg_by_addr(struct config *config, struct reg *reg,
>   			   uint32_t addr)
> @@ -1019,6 +1027,11 @@ static const struct command commands[] = {
>   		.description = "list all known register names",
>   		.decode = true,
>   	},
> +	{
> +		.name = "help",
> +		.function = intel_reg_help,
> +		.description = "show this help",
> +	},
>   };
>   
>   static int intel_reg_help(struct config *config, int argc, char *argv[])
> @@ -1055,6 +1068,8 @@ static int intel_reg_help(struct config *config, int argc, char *argv[])
>   	printf(" --devid=DEVID  Specify PCI device ID for --mmio=FILE\n");
>   	printf(" --decode       Decode registers. Implied by commands that require it\n");
>   	printf(" --all          Decode registers for all known platforms. Implies --decode\n");
> +	printf(" --pci-slot     Decode registers for platform described by PCI slot\n"
> +	       "		<domain>:<bus>:<device>[.<func>]\n");

Nit: as the new '--pci-slot' option requires a parameter, the help 
message could clearly state it
(as for --mmio/--devid options), e.g.:
--pci-slot=BDF

>   	printf(" --binary       Binary dump registers\n");
>   	printf(" --verbose      Increase verbosity\n");
>   	printf(" --quiet        Reduce verbosity\n");
> @@ -1164,6 +1179,62 @@ builtin:
>   	return config->regcount;
>   }
>   
> +static int parse_pci_slot_name(struct igt_pci_slot *st, const char *slot_name)
> +{
> +	int i;
> +
> +	st->domain = 0;
> +	st->bus = 0;
> +	st->dev = 0;
> +	st->func = 0;
> +	i = sscanf(slot_name, "%x:%x:%x.%x", &st->domain, &st->bus, &st->dev, &st->func);
> +
> +	return i;
> +}
> +
> +static bool is_graphics_card_valid(struct pci_device *pci_dev)
> +{
> +	if (!pci_dev) {
> +		fprintf(stderr, "Graphics card not found\n");
> +		return false;
> +	}
> +	if (pci_device_probe(pci_dev) != 0) {
> +		fprintf(stderr, "Couldn't probe graphics card\n");
> +		return false;
> +	}
> +	if (pci_dev->vendor_id != 0x8086) {
> +		fprintf(stderr, "Graphics card is non-intel\n");
> +		return false;
> +	}
> +	return true;
> +}
> +
> +static bool find_dev_from_slot(struct pci_device **pci_dev, char *opt_slot)
> +{
> +	struct igt_pci_slot bdf;
> +	bool ret;
> +
> +	if (parse_pci_slot_name(&bdf, opt_slot) < 3) {
> +		fprintf(stderr, "Cannot decode PCI slot from '%s'\n", opt_slot);
> +		return false;
> +	}
> +
> +	if (pci_system_init() != 0) {
> +		fprintf(stderr, "Couldn't initialize PCI system\n");
> +		return false;
> +	}
> +
> +	igt_devices_scan();
> +	*pci_dev = pci_device_find_by_slot(bdf.domain, bdf.bus, bdf.dev, bdf.func);
> +	ret = is_graphics_card_valid(*pci_dev);
> +	igt_devices_free();
> +
> +	if (!ret)
> +		fprintf(stderr, "Cannot find PCI card given by slot '%s'\n", opt_slot);
> +
> +	return ret;
> +}
> +
>   enum opt {
>   	OPT_UNKNOWN = '?',
>   	OPT_END = -1,
> @@ -1173,6 +1244,7 @@ enum opt {
>   	OPT_POST,
>   	OPT_DECODE,
>   	OPT_ALL,
> +	OPT_SLOT,
>   	OPT_BINARY,
>   	OPT_SPEC,
>   	OPT_VERBOSE,
> @@ -1182,8 +1254,9 @@ enum opt {
>   
>   int main(int argc, char *argv[])
>   {
> -	int ret, i, index;
> +	int i, index;
>   	char *endp;
> +	char *opt_slot = NULL;
>   	enum opt opt;
>   	const struct command *command = NULL;
>   	struct config config = {
> @@ -1191,6 +1264,7 @@ int main(int argc, char *argv[])
>   		.fd = -1,
>   	};
>   	bool help = false;
> +	int ret = EXIT_FAILURE;
>   
>   	static struct option options[] = {
>   		/* global options */
> @@ -1208,6 +1282,7 @@ int main(int argc, char *argv[])
>   		/* options specific to read, dump and decode */
>   		{ "decode",	no_argument,		NULL,	OPT_DECODE },
>   		{ "all",	no_argument,		NULL,	OPT_ALL },
> +		{ "pci-slot",	required_argument,	NULL,	OPT_SLOT },
>   		{ "binary",	no_argument,		NULL,	OPT_BINARY },
>   		{ 0 }
>   	};
> @@ -1257,6 +1332,14 @@ int main(int argc, char *argv[])
>   		case OPT_DECODE:
>   			config.decode = true;
>   			break;
> +		case OPT_SLOT:
> +			opt_slot = strdup(optarg);
> +			if (!opt_slot) {
> +				fprintf(stderr, "strdup: %s\n",
> +					strerror(errno));
> +				return EXIT_FAILURE;
> +			}
> +			break;
>   		case OPT_BINARY:
>   			config.binary = true;
>   			break;
> @@ -1298,7 +1381,14 @@ int main(int argc, char *argv[])
>   			fprintf(stderr, "--devid without --mmio\n");
>   			return EXIT_FAILURE;
>   		}
> -		config.pci_dev = intel_get_pci_device();
> +
> +		if (opt_slot) {
> +			if (!find_dev_from_slot(&config.pci_dev, opt_slot))
> +				return EXIT_FAILURE;
> +		} else {
> +			config.pci_dev = intel_get_pci_device();
> +		}
> +
>   		config.devid = config.pci_dev->device_id;
>   	}
>   
> @@ -1311,21 +1401,23 @@ int main(int argc, char *argv[])
>   
>   	if (!command) {
>   		fprintf(stderr, "'%s' is not an intel-reg command\n", argv[0]);
> -		return EXIT_FAILURE;
> +		goto exit;
>   	}
>   
>   	if (command->decode)
>   		config.decode = true;
>   
> -	if (read_reg_spec(&config) < 0)
> -		return EXIT_FAILURE;
> -
> -	ret = command->function(&config, argc, argv);
> +	if (read_reg_spec(&config) >= 0)
> +		ret = command->function(&config, argc, argv);
>   
> +exit:
>   	free(config.mmiofile);
>   
>   	if (config.fd >= 0)
>   		close(config.fd);
>   
> +	if (opt_slot)
> +		free(opt_slot);
> +
>   	return ret;
>   }

Verified the new option on a multi-GPU platform - reads registers for a 
device with a given PCI BDF as expected.
Suggest a small update to the help message, but overall LGTM:

Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>

