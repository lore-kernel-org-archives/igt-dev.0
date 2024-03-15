Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BB6C54E69
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 09:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501D010F5AA;
	Fri, 15 Mar 2024 09:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7IYSIju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9307110F5AA
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 09:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710494025; x=1742030025;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XUeK0g8Oiz3T0X/9aBlz2HaUx5WE12Mqef646Tl+l7E=;
 b=i7IYSIju8LrokaJUdTZImkvzpg/eWQicBUUjbIe9L+kFVrUPl3xy/pIG
 1fogfS8ms00tv0RTA6WI2on/w2XTf0id8DfqCb3jF8Tr9bE0UeeMm7DLR
 p7r1tjOX//ylecZwsjjtgUI+IIziwRU3OZoBD8KMHxACv7rsWKE1Yn5eH
 qL+WpUEYs6yS/7qjk/O5DjzfR1G/NRhuocLG1KCaNGH4ZTkblwmjzvskQ
 o5Q63Mox3mvGc5fu07GVL6yZ5827p4V9lSQC2hi7ufL6rJA197rG9pfBF
 4euAvf1zJfk2Qka6q6kLg3qW748dFuXAy8yKoy8mOl4MxPTm+IEWSwCmG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5485159"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5485159"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 02:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12499179"
Received: from denache-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.82])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 02:13:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Zbigniew Kempczynski
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tools/intel_reg: add possibility to select device
In-Reply-To: <20240314225839.2845585-1-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240314225839.2845585-1-ashutosh.dixit@intel.com>
Date: Fri, 15 Mar 2024 11:13:37 +0200
Message-ID: <87cyrvrh6m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 14 Mar 2024, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> From: =C5=81ukasz =C5=81aguna <lukasz.laguna@intel.com>
>
> Device can be selected by slot or using filter. Example:
>
> intel_reg dump --slot "0000:01:00.0"
> intel_reg dump --filter "pci:vendor=3D8086"

Really, if you want to add device filtering, the sensible thing to do is
to mimic lspci -s or -d options instead of NIH'ing your own. Maybe add a
subset of the functionality first, but please don't deviate from the
format.

Other comments inline.

> Signed-off-by: =C5=81ukasz =C5=81aguna <lukasz.laguna@intel.com>
> ---
>  tools/intel_reg.c | 128 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 126 insertions(+), 2 deletions(-)
>
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index 6c37e14d12..6b903f3f87 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -39,6 +39,7 @@
>  #include "intel_chipset.h"
>=20=20
>  #include "intel_reg_spec.h"
> +#include "igt_device_scan.h"
>=20=20
>=20=20
>  #ifdef HAVE_SYS_IO_H
> @@ -86,6 +87,13 @@ struct config {
>  	int verbosity;
>  };
>=20=20
> +struct pci_slot {

The name has clash potential with pci libs.

> +	int domain;
> +	int bus;
> +	int dev;
> +	int func;
> +};
> +
>  /* port desc must have been set */
>  static int set_reg_by_addr(struct config *config, struct reg *reg,
>  			   uint32_t addr)
> @@ -958,6 +966,12 @@ static int intel_reg_list(struct config *config, int=
 argc, char *argv[])
>  	return EXIT_SUCCESS;
>  }
>=20=20
> +static int intel_reg_list_filters(struct config *config, int argc, char =
*argv[])
> +{
> +	igt_device_print_filter_types();
> +	return EXIT_SUCCESS;
> +}
> +
>  static int intel_reg_help(struct config *config, int argc, char *argv[]);
>=20=20
>  struct command {
> @@ -1001,6 +1015,11 @@ static const struct command commands[] =3D {
>  		.function =3D intel_reg_list,
>  		.description =3D "list all known register names",
>  	},
> +	{
> +		.name =3D "list_filters",

Please do not use underscore in subcommands. list-filters.

When you update the command-line interface, a man page update is
required as well: man/intel_reg.rst.

> +		.function =3D intel_reg_list_filters,
> +		.description =3D "list registered device filters types",
> +	},
>  	{
>  		.name =3D "help",
>  		.function =3D intel_reg_help,
> @@ -1041,6 +1060,8 @@ static int intel_reg_help(struct config *config, in=
t argc, char *argv[])
>  	printf(" --mmio=3DFILE    Use an MMIO snapshot\n");
>  	printf(" --devid=3DDEVID  Specify PCI device ID for --mmio=3DFILE\n");
>  	printf(" --all          Decode registers for all known platforms\n");
> +	printf(" --filter       Decode registers for platform described by filt=
er\n");
> +	printf(" --slot         Decode registers for platform described by slot=
\n");
>  	printf(" --binary       Binary dump registers\n");
>  	printf(" --verbose      Increase verbosity\n");
>  	printf(" --quiet        Reduce verbosity\n");
> @@ -1147,6 +1168,52 @@ builtin:
>  	return config->regcount;
>  }
>=20=20
> +static void parse_pci_slot_name(struct pci_slot *pci_slot, const char *p=
ci_slot_name)
> +{
> +	igt_assert_eq(sscanf(pci_slot_name, "%x:%x:%x.%x",
> +		&pci_slot->domain, &pci_slot->bus, &pci_slot->dev, &pci_slot->func), 4=
);

This is a tool, not a test. Please do not use igt_assert or anything
like that. Handle the errors and fprintf a message to stderr.

> +}
> +
> +static struct pci_device *find_intel_graphics_card(void)
> +{
> +	struct pci_device *pci_dev;
> +	struct pci_device_iterator *iter;
> +	struct pci_id_match match;
> +
> +	match.vendor_id =3D 0x8086; /* Intel */
> +	match.device_id =3D PCI_MATCH_ANY;
> +	match.subvendor_id =3D PCI_MATCH_ANY;
> +	match.subdevice_id =3D PCI_MATCH_ANY;
> +
> +	match.device_class =3D 0x3 << 16;
> +	match.device_class_mask =3D 0xff << 16;
> +
> +	match.match_data =3D 0;
> +
> +	iter =3D pci_id_match_iterator_create(&match);
> +	pci_dev =3D pci_device_next(iter);
> +	pci_iterator_destroy(iter);
> +
> +	return pci_dev;
> +}
> +
> +static bool is_graphics_card_valid(struct pci_device *pci_dev)
> +{
> +	if (!pci_dev) {
> +		fprintf(stderr, "Graphics card not found\n");
> +		return false;
> +	}
> +	if (pci_device_probe(pci_dev) !=3D 0) {
> +		fprintf(stderr, "Couldn't probe graphics card\n");
> +		return false;
> +	}
> +	if (pci_dev->vendor_id !=3D 0x8086) {
> +		fprintf(stderr, "Graphics card is non-intel\n");
> +		return false;
> +	}
> +	return true;
> +}
> +
>  enum opt {
>  	OPT_UNKNOWN =3D '?',
>  	OPT_END =3D -1,
> @@ -1155,6 +1222,8 @@ enum opt {
>  	OPT_COUNT,
>  	OPT_POST,
>  	OPT_ALL,
> +	OPT_FILTER,
> +	OPT_SLOT,
>  	OPT_BINARY,
>  	OPT_SPEC,
>  	OPT_VERBOSE,
> @@ -1164,8 +1233,12 @@ enum opt {
>=20=20
>  int main(int argc, char *argv[])
>  {
> -	int ret, i, index;
> +	int ret, i, index, len;
>  	char *endp;
> +	char *opt_filter =3D NULL;
> +	struct pci_slot bdf;
> +	struct pci_device *pci_dev =3D NULL;
> +	struct igt_device_card card;
>  	enum opt opt;
>  	const struct command *command =3D NULL;
>  	struct config config =3D {
> @@ -1189,6 +1262,8 @@ int main(int argc, char *argv[])
>  		{ "post",	no_argument,		NULL,	OPT_POST },
>  		/* options specific to read, dump and decode */
>  		{ "all",	no_argument,		NULL,	OPT_ALL },
> +		{ "filter",	required_argument,	NULL,	OPT_FILTER },
> +		{ "slot",	required_argument,	NULL,	OPT_SLOT },
>  		{ "binary",	no_argument,		NULL,	OPT_BINARY },
>  		{ 0 }
>  	};
> @@ -1233,6 +1308,24 @@ int main(int argc, char *argv[])
>  		case OPT_ALL:
>  			config.all_platforms =3D true;
>  			break;
> +		case OPT_FILTER:
> +			opt_filter =3D strdup(optarg);
> +			if (!opt_filter) {
> +				fprintf(stderr, "strdup: %s\n",
> +					strerror(errno));
> +				return EXIT_FAILURE;
> +			}
> +			break;
> +		case OPT_SLOT:
> +			len =3D strlen("pci:slot=3D") + strlen(optarg) + 1;
> +			opt_filter =3D malloc(len);
> +			snprintf(opt_filter, len, "%s%s", "pci:slot=3D", optarg);
> +			if (!opt_filter) {

snprintf() would've crashed by now if !opt_filter.

But maybe you're looking for asprintf() instead.

> +				fprintf(stderr, "opt_filter: %s\n",
> +					strerror(errno));
> +				return EXIT_FAILURE;
> +			}
> +			break;

Adding both --filter and --slot options leaks opt_filter. It's benign
for a small tool like this, but still wrong.

>  		case OPT_BINARY:
>  			config.binary =3D true;
>  			break;
> @@ -1258,6 +1351,9 @@ int main(int argc, char *argv[])
>  	if (help || (argc > 0 && strcmp(argv[0], "help") =3D=3D 0))
>  		return intel_reg_help(&config, argc, argv);
>=20=20
> +	if (argc > 0 && strcmp(argv[0], "list_filters") =3D=3D 0)
> +		return intel_reg_list_filters(&config, argc, argv);
> +
>  	if (argc =3D=3D 0) {
>  		fprintf(stderr, "Command missing. Try intel_reg help.\n");
>  		return EXIT_FAILURE;
> @@ -1274,7 +1370,32 @@ int main(int argc, char *argv[])
>  			fprintf(stderr, "--devid without --mmio\n");
>  			return EXIT_FAILURE;
>  		}
> -		config.pci_dev =3D intel_get_pci_device();
> +
> +		if (pci_system_init() !=3D 0) {
> +			fprintf(stderr, "Couldn't initialize PCI system\n");
> +			return EXIT_FAILURE;
> +		}
> +
> +		igt_devices_scan(false);
> +
> +		if (opt_filter) {
> +			if (!igt_device_card_match(opt_filter, &card)) {
> +				fprintf(stderr, "Requested device %s not found!\n", opt_filter);
> +				ret =3D EXIT_FAILURE;
> +				goto exit;
> +			}
> +			parse_pci_slot_name(&bdf, card.pci_slot_name);
> +			pci_dev =3D pci_device_find_by_slot(bdf.domain, bdf.bus, bdf.dev, bdf=
.func);
> +		} else {
> +			pci_dev =3D find_intel_graphics_card();
> +		}
> +
> +		if (!is_graphics_card_valid(pci_dev)) {
> +			ret =3D EXIT_FAILURE;
> +			goto exit;
> +		}
> +

All of the above should be abstracted to a function instead of crammed
into main().

> +		config.pci_dev =3D pci_dev;
>  		config.devid =3D config.pci_dev->device_id;
>  	}
>=20=20
> @@ -1301,5 +1422,8 @@ int main(int argc, char *argv[])
>  	if (config.fd >=3D 0)
>  		close(config.fd);
>=20=20
> +exit:
> +	igt_devices_free();
> +	free(opt_filter);
>  	return ret;
>  }

--=20
Jani Nikula, Intel
