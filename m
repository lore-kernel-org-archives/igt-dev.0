Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97277C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 12:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFDC10E888;
	Thu, 22 Aug 2024 12:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zz8V7mDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A59B10E888
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724329459; x=1755865459;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+Phg5w1qfcFpVX7zg7uMn93EZsSajJ3PgXGVl4Bwj8Q=;
 b=Zz8V7mDx/cSYu2twdKR9T51xsyrpnukEbSFKiO5LokztGZo8hLF3U9UA
 zxE0Fy4yw/07ARsZNFMIXHHrbZymNjccEG9JBddQuJII6H/zR//BYgUlV
 wkXIfZT92AjzBQuGAYCXRVwEOep97ITiNYYsay5TdoNSOx0d4ZZ7Z0HYb
 psztMpGKIiSklNmtL2NbbchUyoH9hOjimEyDDCNo24oVln9bPhvwxDiD5
 jYRl/zW/vVRGM6hF4rvWAyXXvfFDcCR3K9/QZncFlOuviLUDnP9RCJl5T
 3QJqLSgcvXnT5EYGzRTS6V71ZQX9GxIJ49M8ce1qLwFZw+a+8ZnCDoNGb A==;
X-CSE-ConnectionGUID: VXmDO/L3QXafdays9DaDjg==
X-CSE-MsgGUID: LeGrHVATSLK+6qcAyaTI4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22608598"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22608598"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:24:19 -0700
X-CSE-ConnectionGUID: YNXRUeUZQAOyYWK8U5KNVg==
X-CSE-MsgGUID: YgTYkiMcRvm+c/xbHcVhtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="66354727"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 05:24:18 -0700
Date: Thu, 22 Aug 2024 14:24:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@intel.com>,
 =?utf-8?B?xYF1a2FzeiDFgWFndW5h?= <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t] tools/intel_reg: add possibility to select device
Message-ID: <20240822122404.ovkmtnzt5pi66qsm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@intel.com>,
 =?utf-8?B?xYF1a2FzeiDFgWFndW5h?= <lukasz.laguna@intel.com>
References: <20240314225839.2845585-1-ashutosh.dixit@intel.com>
 <87cyrvrh6m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyrvrh6m.fsf@intel.com>
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

Hi Jani,
On 2024-03-15 at 11:13:37 +0200, Jani Nikula wrote:
> On Thu, 14 Mar 2024, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> > From: Łukasz Łaguna <lukasz.laguna@intel.com>
> >
> > Device can be selected by slot or using filter. Example:
> >
> > intel_reg dump --slot "0000:01:00.0"
> > intel_reg dump --filter "pci:vendor=8086"
> 
> Really, if you want to add device filtering, the sensible thing to do is
> to mimic lspci -s or -d options instead of NIH'ing your own. Maybe add a
> subset of the functionality first, but please don't deviate from the
> format.
> 
> Other comments inline.
> 

It looks like NIH but there are devices which are not on pci bus,
see recent patch here:

https://patchwork.freedesktop.org/series/137520/
tests/device_reset: Require a PCI device
Submitted by Rob Clark on Aug. 20, 2024, 2:43 p.m.

Could we proceed with renamed options like --igt-filter and
--igt-slot ?

I chose that so it will not clash with '-s' which could be mistaken
as a shorter form of --slot but those options could have
another name, feel free to propose one.

And it will be possible to add libpci compatibile options.

Regards,
Kamil

> > Signed-off-by: Łukasz Łaguna <lukasz.laguna@intel.com>
> > ---
> >  tools/intel_reg.c | 128 +++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 126 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> > index 6c37e14d12..6b903f3f87 100644
> > --- a/tools/intel_reg.c
> > +++ b/tools/intel_reg.c
> > @@ -39,6 +39,7 @@
> >  #include "intel_chipset.h"
> >  
> >  #include "intel_reg_spec.h"
> > +#include "igt_device_scan.h"
> >  
> >  
> >  #ifdef HAVE_SYS_IO_H
> > @@ -86,6 +87,13 @@ struct config {
> >  	int verbosity;
> >  };
> >  
> > +struct pci_slot {
> 
> The name has clash potential with pci libs.
> 
> > +	int domain;
> > +	int bus;
> > +	int dev;
> > +	int func;
> > +};
> > +
> >  /* port desc must have been set */
> >  static int set_reg_by_addr(struct config *config, struct reg *reg,
> >  			   uint32_t addr)
> > @@ -958,6 +966,12 @@ static int intel_reg_list(struct config *config, int argc, char *argv[])
> >  	return EXIT_SUCCESS;
> >  }
> >  
> > +static int intel_reg_list_filters(struct config *config, int argc, char *argv[])
> > +{
> > +	igt_device_print_filter_types();
> > +	return EXIT_SUCCESS;
> > +}
> > +
> >  static int intel_reg_help(struct config *config, int argc, char *argv[]);
> >  
> >  struct command {
> > @@ -1001,6 +1015,11 @@ static const struct command commands[] = {
> >  		.function = intel_reg_list,
> >  		.description = "list all known register names",
> >  	},
> > +	{
> > +		.name = "list_filters",
> 
> Please do not use underscore in subcommands. list-filters.
> 
> When you update the command-line interface, a man page update is
> required as well: man/intel_reg.rst.
> 
> > +		.function = intel_reg_list_filters,
> > +		.description = "list registered device filters types",
> > +	},
> >  	{
> >  		.name = "help",
> >  		.function = intel_reg_help,
> > @@ -1041,6 +1060,8 @@ static int intel_reg_help(struct config *config, int argc, char *argv[])
> >  	printf(" --mmio=FILE    Use an MMIO snapshot\n");
> >  	printf(" --devid=DEVID  Specify PCI device ID for --mmio=FILE\n");
> >  	printf(" --all          Decode registers for all known platforms\n");
> > +	printf(" --filter       Decode registers for platform described by filter\n");
> > +	printf(" --slot         Decode registers for platform described by slot\n");
> >  	printf(" --binary       Binary dump registers\n");
> >  	printf(" --verbose      Increase verbosity\n");
> >  	printf(" --quiet        Reduce verbosity\n");
> > @@ -1147,6 +1168,52 @@ builtin:
> >  	return config->regcount;
> >  }
> >  
> > +static void parse_pci_slot_name(struct pci_slot *pci_slot, const char *pci_slot_name)
> > +{
> > +	igt_assert_eq(sscanf(pci_slot_name, "%x:%x:%x.%x",
> > +		&pci_slot->domain, &pci_slot->bus, &pci_slot->dev, &pci_slot->func), 4);
> 
> This is a tool, not a test. Please do not use igt_assert or anything
> like that. Handle the errors and fprintf a message to stderr.
> 
> > +}
> > +
> > +static struct pci_device *find_intel_graphics_card(void)
> > +{
> > +	struct pci_device *pci_dev;
> > +	struct pci_device_iterator *iter;
> > +	struct pci_id_match match;
> > +
> > +	match.vendor_id = 0x8086; /* Intel */
> > +	match.device_id = PCI_MATCH_ANY;
> > +	match.subvendor_id = PCI_MATCH_ANY;
> > +	match.subdevice_id = PCI_MATCH_ANY;
> > +
> > +	match.device_class = 0x3 << 16;
> > +	match.device_class_mask = 0xff << 16;
> > +
> > +	match.match_data = 0;
> > +
> > +	iter = pci_id_match_iterator_create(&match);
> > +	pci_dev = pci_device_next(iter);
> > +	pci_iterator_destroy(iter);
> > +
> > +	return pci_dev;
> > +}
> > +
> > +static bool is_graphics_card_valid(struct pci_device *pci_dev)
> > +{
> > +	if (!pci_dev) {
> > +		fprintf(stderr, "Graphics card not found\n");
> > +		return false;
> > +	}
> > +	if (pci_device_probe(pci_dev) != 0) {
> > +		fprintf(stderr, "Couldn't probe graphics card\n");
> > +		return false;
> > +	}
> > +	if (pci_dev->vendor_id != 0x8086) {
> > +		fprintf(stderr, "Graphics card is non-intel\n");
> > +		return false;
> > +	}
> > +	return true;
> > +}
> > +
> >  enum opt {
> >  	OPT_UNKNOWN = '?',
> >  	OPT_END = -1,
> > @@ -1155,6 +1222,8 @@ enum opt {
> >  	OPT_COUNT,
> >  	OPT_POST,
> >  	OPT_ALL,
> > +	OPT_FILTER,
> > +	OPT_SLOT,
> >  	OPT_BINARY,
> >  	OPT_SPEC,
> >  	OPT_VERBOSE,
> > @@ -1164,8 +1233,12 @@ enum opt {
> >  
> >  int main(int argc, char *argv[])
> >  {
> > -	int ret, i, index;
> > +	int ret, i, index, len;
> >  	char *endp;
> > +	char *opt_filter = NULL;
> > +	struct pci_slot bdf;
> > +	struct pci_device *pci_dev = NULL;
> > +	struct igt_device_card card;
> >  	enum opt opt;
> >  	const struct command *command = NULL;
> >  	struct config config = {
> > @@ -1189,6 +1262,8 @@ int main(int argc, char *argv[])
> >  		{ "post",	no_argument,		NULL,	OPT_POST },
> >  		/* options specific to read, dump and decode */
> >  		{ "all",	no_argument,		NULL,	OPT_ALL },
> > +		{ "filter",	required_argument,	NULL,	OPT_FILTER },
> > +		{ "slot",	required_argument,	NULL,	OPT_SLOT },
> >  		{ "binary",	no_argument,		NULL,	OPT_BINARY },
> >  		{ 0 }
> >  	};
> > @@ -1233,6 +1308,24 @@ int main(int argc, char *argv[])
> >  		case OPT_ALL:
> >  			config.all_platforms = true;
> >  			break;
> > +		case OPT_FILTER:
> > +			opt_filter = strdup(optarg);
> > +			if (!opt_filter) {
> > +				fprintf(stderr, "strdup: %s\n",
> > +					strerror(errno));
> > +				return EXIT_FAILURE;
> > +			}
> > +			break;
> > +		case OPT_SLOT:
> > +			len = strlen("pci:slot=") + strlen(optarg) + 1;
> > +			opt_filter = malloc(len);
> > +			snprintf(opt_filter, len, "%s%s", "pci:slot=", optarg);
> > +			if (!opt_filter) {
> 
> snprintf() would've crashed by now if !opt_filter.
> 
> But maybe you're looking for asprintf() instead.
> 
> > +				fprintf(stderr, "opt_filter: %s\n",
> > +					strerror(errno));
> > +				return EXIT_FAILURE;
> > +			}
> > +			break;
> 
> Adding both --filter and --slot options leaks opt_filter. It's benign
> for a small tool like this, but still wrong.
> 
> >  		case OPT_BINARY:
> >  			config.binary = true;
> >  			break;
> > @@ -1258,6 +1351,9 @@ int main(int argc, char *argv[])
> >  	if (help || (argc > 0 && strcmp(argv[0], "help") == 0))
> >  		return intel_reg_help(&config, argc, argv);
> >  
> > +	if (argc > 0 && strcmp(argv[0], "list_filters") == 0)
> > +		return intel_reg_list_filters(&config, argc, argv);
> > +
> >  	if (argc == 0) {
> >  		fprintf(stderr, "Command missing. Try intel_reg help.\n");
> >  		return EXIT_FAILURE;
> > @@ -1274,7 +1370,32 @@ int main(int argc, char *argv[])
> >  			fprintf(stderr, "--devid without --mmio\n");
> >  			return EXIT_FAILURE;
> >  		}
> > -		config.pci_dev = intel_get_pci_device();
> > +
> > +		if (pci_system_init() != 0) {
> > +			fprintf(stderr, "Couldn't initialize PCI system\n");
> > +			return EXIT_FAILURE;
> > +		}
> > +
> > +		igt_devices_scan(false);
> > +
> > +		if (opt_filter) {
> > +			if (!igt_device_card_match(opt_filter, &card)) {
> > +				fprintf(stderr, "Requested device %s not found!\n", opt_filter);
> > +				ret = EXIT_FAILURE;
> > +				goto exit;
> > +			}
> > +			parse_pci_slot_name(&bdf, card.pci_slot_name);
> > +			pci_dev = pci_device_find_by_slot(bdf.domain, bdf.bus, bdf.dev, bdf.func);
> > +		} else {
> > +			pci_dev = find_intel_graphics_card();
> > +		}
> > +
> > +		if (!is_graphics_card_valid(pci_dev)) {
> > +			ret = EXIT_FAILURE;
> > +			goto exit;
> > +		}
> > +
> 
> All of the above should be abstracted to a function instead of crammed
> into main().
> 
> > +		config.pci_dev = pci_dev;
> >  		config.devid = config.pci_dev->device_id;
> >  	}
> >  
> > @@ -1301,5 +1422,8 @@ int main(int argc, char *argv[])
> >  	if (config.fd >= 0)
> >  		close(config.fd);
> >  
> > +exit:
> > +	igt_devices_free();
> > +	free(opt_filter);
> >  	return ret;
> >  }
> 
> -- 
> Jani Nikula, Intel
