Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECBEC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 08:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAEC10E16A;
	Mon,  5 Aug 2024 08:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJp8o0pC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4618010E16A
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 08:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722847142; x=1754383142;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y6NY7qzbbCOB7/H2LFU8V2xXfTfH5Jv+b+B+/o4TJEk=;
 b=ZJp8o0pC2cR/HCVzWmqno9tnFN7yxZLYZRyLLpVTIz3+JnfzqJcrsfv/
 EpnfmOybvl/cX7P2M69ozrK2QYEh1UBZ3PSZdm5zNhPfHWRkBxa71r4L4
 Jr4gJdak+KGS602RKfwJ9yhYCSJr5X1djnwE3mMtDz4LcWLQpJYgkrnnT
 8xUQVR4DOa51ezHN/I3WRtyKxXQD7uHn0DtHasoLdeI7/g2iKjclgIJE7
 n1oblAnV9cjQXix+dwrhx7yfeJKzA+BGcxMQHukc2x0KFPi1aSs4ni6qD
 LiX3GrdtrnsgCi4QJpdF3DimrcVUBibq3p+PiwhulZD4y9aYFL6R/7iB4 Q==;
X-CSE-ConnectionGUID: w1vbi3XARViPNwtUiNSMTw==
X-CSE-MsgGUID: sPdgue7sROGi8/R8iTOEig==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20949395"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20949395"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 01:39:02 -0700
X-CSE-ConnectionGUID: 8Kw4kwjCRKCIIa4j1FxwYw==
X-CSE-MsgGUID: z3+InfBAQnuEfN7VrwLTPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="55762542"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 01:39:00 -0700
Date: Mon, 5 Aug 2024 10:38:57 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/1] tools/lsgpu: Introduce version printing
Message-ID: <20240805083857.v7ugynzlpfpay2ey@zkempczy-mobl2>
References: <20240802092746.22001-1-kamil.konieczny@linux.intel.com>
 <20240802092746.22001-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240802092746.22001-2-kamil.konieczny@linux.intel.com>
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

On Fri, Aug 02, 2024 at 11:27:45AM +0200, Kamil Konieczny wrote:
> Add version information for the lsgpu tool. You can now show it
> with long option --version or short -v, for example:

-v => -V

It's good idea to start versioning, With with nit addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ./lsgpu --version
> 
> Also while at this, update copyright years and sort out include
> headers.
> 
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tools/lsgpu.c | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index bdc6671fe..2bf2cf5f0 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright © 2019 Intel Corporation
> + * Copyright © 2019-2024 Intel Corporation
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining a
>   * copy of this software and associated documentation files (the "Software"),
> @@ -22,15 +22,16 @@
>   *
>   */
>  
> -#include "igt_device_scan.h"
> -#include "igt.h"
> -#include <sys/ioctl.h>
> -#include <fcntl.h>
>  #include <errno.h>
> -#include <string.h>
> -#include <signal.h>
> +#include <fcntl.h>
>  #include <glib.h>
>  #include <libudev.h>
> +#include <string.h>
> +#include <signal.h>
> +#include <sys/ioctl.h>
> +
> +#include "igt.h"
> +#include "igt_device_scan.h"
>  
>  /**
>   * SECTION:lsgpu
> @@ -80,12 +81,14 @@ enum {
>  	OPT_DEVICE         = 'd',
>  	OPT_HELP           = 'h',
>  	OPT_PCISCAN        = 'P',
> +	OPT_VERSION        = 'V',
>  };
>  
>  static bool g_show_vendors;
>  static bool g_list_filters;
>  static bool g_help;
>  static bool g_pciscan;
> +static bool g_version;
>  static char *igt_device;
>  
>  static const char *usage_str =
> @@ -99,12 +102,21 @@ static const char *usage_str =
>  	"  -v, --list-vendors          List recognized vendors\n"
>  	"  -l, --list-filter-types     List registered device filters types\n"
>  	"  -d, --device filter         Device filter, can be given multiple times\n"
> +	"  -V, --version               Show version information and exit\n"
>  	"  -h, --help                  Show this help message and exit\n"
>  	"\nOptions valid for default print out mode only:\n"
>  	"      --drm                   Show DRM filters (default) for each device\n"
>  	"      --sysfs                 Show sysfs filters for each device\n"
>  	"      --pci                   Show PCI filters for each device\n";
>  
> +static void show_version(void)
> +{
> +	printf("lsgpu version 1.0\n"
> +	       "Copyright © 2019-2024 Intel Corporation\n"
> +	       "This is free software; see the source for copying conditions.  There is NO\n"
> +	       "warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n");
> +}
> +
>  static void test_device_open(struct igt_device_card *card)
>  {
>  	int fd;
> @@ -256,6 +268,7 @@ int main(int argc, char *argv[])
>  		{"list-filter-types", no_argument,       NULL, OPT_LIST_FILTERS},
>  		{"device",            required_argument, NULL, OPT_DEVICE},
>  		{"help",              no_argument,       NULL, OPT_HELP},
> +		{"version",           no_argument,       NULL, OPT_VERSION},
>  		{0, 0, 0, 0}
>  	};
>  	int c, ret = 0, index = 0;
> @@ -264,7 +277,7 @@ int main(int argc, char *argv[])
>  			.type = IGT_PRINT_USER,
>  	};
>  
> -	while ((c = getopt_long(argc, argv, "ncspvld:hP",
> +	while ((c = getopt_long(argc, argv, "ncspvld:hPV",
>  				long_options, &index)) != -1) {
>  		switch(c) {
>  
> @@ -295,6 +308,9 @@ int main(int argc, char *argv[])
>  		case OPT_PCISCAN:
>  			g_pciscan = true;
>  			break;
> +		case OPT_VERSION:
> +			g_version = true;
> +			break;
>  		case 0:
>  			fmt.option = IGT_PRINT_DRM;
>  			break;
> @@ -315,6 +331,11 @@ int main(int argc, char *argv[])
>  		exit(0);
>  	}
>  
> +	if (g_version) {
> +		show_version();
> +		exit(0);
> +	}
> +
>  	if (g_show_vendors) {
>  		igt_devices_print_vendors();
>  		return 0;
> -- 
> 2.43.0
> 
