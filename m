Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65414C369CB
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 06:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1837610E1E5;
	Wed, 23 Apr 2025 06:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXrYSyw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F6B10E1E5
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 06:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745390099; x=1776926099;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cIvexWX2Gnlx5QpWa6PkhfuMIL/3jQszC/ubT8ky9Ow=;
 b=aXrYSyw1l9M7gZhnHiL48pwZTUvDCjnPTETXOPiWJZ2M6iT2jUgeMIYw
 t0o3jvBfEHz6L0JyuRstBPxuOKeqJ/cIkfWVKpXWaH0XjaxUtOHdRHcpB
 DZLrBzUYe7DIRr+4jyePwi2fdZDV3zZWBD51VwaJnSVOSBEtDmxtpdNFu
 8AKbiu8jndcrMl9XGldUAovprD9iKmkxIyPVb3EjlbLoR4iIHOsoIOtkT
 FpWvzSd05rSWzdMAFoT8m17ovOfwF1i9ThR71NFsCaPVa78T0NdaZssZ6
 TxNHkhzeoeH9nZ2S/df7ywEHy3e+qrCovNaVDSGQ2Thj6NTBxEDon/kVr g==;
X-CSE-ConnectionGUID: 7HlUBS2FSy6aZsFhdpipmA==
X-CSE-MsgGUID: A+b6kGUFREOH+SCvFIINeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47097932"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47097932"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 23:34:58 -0700
X-CSE-ConnectionGUID: M+aiqLzcSoSEGOeo+trFvg==
X-CSE-MsgGUID: i/m7W1pKSXmjQzVz1Yoefg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="136295908"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 23:34:56 -0700
Date: Wed, 23 Apr 2025 08:34:53 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, ashutosh.dixit@intel.com
Subject: Re: [PATCH i-g-t v9 5/5] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
Message-ID: <20250423063453.qkvvdopputrolecj@zkempczy-mobl2>
References: <20250422171108.2170758-1-soham.purkait@intel.com>
 <20250422171108.2170758-6-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422171108.2170758-6-soham.purkait@intel.com>
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

On Tue, Apr 22, 2025 at 10:41:08PM +0530, Soham Purkait wrote:
> Introduce vendor-agnostic support for
> handling multiple GPUs and instances
> in gputop. Improve the tool's adaptability
> to various GPU configurations.
> 
> v2 : Fix for refactoring GPUTOP into a
>      vendor-agnostic tool. (Lucas)
> 
> v3 : New year included in copyright. (Kamil, Riana)
>      Removed caps in function name. (Riana)
>      Struct for driver specific operations. (Riana)
>      Headers in alphabetical order. (Kamil, Riana)
> 
> v4 : Commit description and signed-off included.
> 
> v5 : Fix for proper resource cleanup. (Riana)
>      Use "dev_type" enum for card_type. (Krzysztof)
>      Add new filter to return collection
>      of matching devices.               (Zbigniew)
> 
> v6 : Use device filter to populate the array of
>      cards for all supported drivers.   (Zbigniew)
> 
> v7 : Use filter to find all the cards.  (Zbigniew)
> 
> v8 : Removed 'drivers' array parameter from
>      card match function.               (Zbigniew)
> 
> v9 : Resolved 'populate_devices' call.
>                                   (Zbigniew)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  tools/{ => gputop}/gputop.c | 224 ++++++++++++++++++++++++++++++------
>  tools/gputop/meson.build    |   6 +
>  tools/meson.build           |   6 +-
>  3 files changed, 193 insertions(+), 43 deletions(-)
>  rename tools/{ => gputop}/gputop.c (67%)
>  create mode 100644 tools/gputop/meson.build
> 
> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
> similarity index 67%
> rename from tools/gputop.c
> rename to tools/gputop/gputop.c
> index 43b01f566..eab415ab5 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop/gputop.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: MIT
>  /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2023-2025 Intel Corporation
>   */
>  
>  #include <assert.h>
> @@ -14,66 +14,148 @@
>  #include <math.h>
>  #include <poll.h>
>  #include <signal.h>
> +#include <stdbool.h>
>  #include <stdint.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> +#include <sys/sysmacros.h>
>  #include <sys/ioctl.h>
>  #include <sys/stat.h>
>  #include <sys/types.h>
> -#include <unistd.h>
>  #include <termios.h>
> -#include <sys/sysmacros.h>
> -#include <stdbool.h>
> +#include <unistd.h>
>  
> +#include "drmtest.h"
>  #include "igt_core.h"
>  #include "igt_drm_clients.h"
>  #include "igt_drm_fdinfo.h"
> +#include "igt_perf.h"
>  #include "igt_profiling.h"
> -#include "drmtest.h"
> +#include "xe_gputop.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * Supported Drivers
> + *
> + * Adhere to the following requirements
> + * when implementing support for the
> + * new driver:
> + * @drivers: Update drivers[] with
> + * driver string.
> + * @total_count: Update NUM_DRIVER with
> + * the total number of supported drivers.
> + * @operations: Update the respective
> + * operations of the new driver:
> + * gputop_init,
> + * discover_engines,
> + * pmu_init,
> + * pmu_sample,
> + * print_engines,
> + * clean_up
> + * @devices: Update devices[] array
> + * of type "struct gputop_device" with
> + * the initial values.
> + */
> +static const char * const drivers[] = {
> +	"xe",
> +    /*Keep the last one as NULL*/

I would add space after /* and before */ for better readability.

> +	NULL
> +};
> +
> +/**
> + * Number of supported drivers needs to be adjusted
> + * as per the letgth of the drivers[] array.
> + */
> +#define NUM_DRIVER 1
> +
> +/**
> + * Supported operations on driver instances.
> + * Update the oprs[] array for
> + * each individual driver specific function.
> + * Maintain the sequence as per drivers[] array.
> + */
> +struct device_operations oprs[NUM_DRIVER] = {
> +	{
> +		xe_gputop_init,
> +		xe_populate_engines,
> +		xe_pmu_init,
> +		xe_pmu_sample,
> +		xe_print_engines,
> +		xe_clean_up
> +	}
> +};
> +
> +/*
> + * devices[] array of type
> + * struct gputop_device
> + */
> +struct gputop_device devices[] = {
> +	{false, 0, NULL}
> +};
>  
>  enum utilization_type {
>  	UTILIZATION_TYPE_ENGINE_TIME,
>  	UTILIZATION_TYPE_TOTAL_CYCLES,
>  };
>  
> -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> -
> -#define ANSI_HEADER "\033[7m"
> -#define ANSI_RESET "\033[0m"
> -
> -static void n_spaces(const unsigned int n)
> +static void gputop_clean_up(void)
>  {
> -	unsigned int i;
> -
> -	for (i = 0; i < n; i++)
> -		putchar(' ');
> +	for (int i = 0; drivers[i]; i++) {
> +		oprs[i].clean_up(devices[i].instances, devices[i].len);
> +		free(devices[i].instances);
> +		devices[i].driver_present = false;
> +		devices[i].len = 0;
> +	}
>  }
>  
> -static void print_percentage_bar(double percent, int max_len)
> +static int find_driver(struct igt_device_card *card)
>  {
> -	int bar_len, i, len = max_len - 1;
> -	const int w = 8;
> -
> -	len -= printf("|%5.1f%% ", percent);
> -
> -	/* no space left for bars, do what we can */
> -	if (len < 0)
> -		len = 0;
> +	for (int i = 0; drivers[i]; i++) {
> +		if (strcmp(drivers[i], card->driver) == 0)
> +			return i;
> +	}
> +	return -1;
> +}
>  
> -	bar_len = ceil(w * percent * len / 100.0);
> -	if (bar_len > w * len)
> -		bar_len = w * len;
> +/*
> + * If filter is not NULL i will be ignored.
> + */
> +static int populate_device_instances(const char *filter)
> +{
> +	struct igt_device_card *cards = NULL;
> +	struct igt_device_card *card_inplace = NULL;
> +	struct gputop_device *dev =  NULL;
> +	int count;
>  
> -	for (i = bar_len; i >= w; i -= w)
> -		printf("%s", bars[w]);
> -	if (i)
> -		printf("%s", bars[i]);
> +	count = igt_device_card_match_all(filter, &cards);
> +	for (int j = 0; j < count; j++) {
> +		int driver_no = find_driver(cards + j);
>  
> -	len -= (bar_len + (w - 1)) / w;
> -	n_spaces(len);
> +		if (driver_no < 0)
> +			continue;
>  
> -	putchar('|');
> +		dev = devices + driver_no;
> +		if (!dev->driver_present)
> +			dev->driver_present = true;
> +		dev->len++;
> +		dev->instances = realloc(dev->instances,
> +					 dev->len * sizeof(struct xe_gputop));
> +		if (!dev->instances) {
> +			fprintf(stderr,
> +				"Device instance realloc failed (%s)\n",
> +				strerror(errno));
> +			exit(EXIT_FAILURE);
> +		}
> +		card_inplace = (struct igt_device_card *)
> +				calloc(1, sizeof(struct igt_device_card));
> +		memcpy(card_inplace, cards + j, sizeof(struct igt_device_card));
> +		oprs[driver_no].gputop_init((struct xe_gputop *)(dev->instances + dev->len - 1),
> +			card_inplace);

card_inplace is not indented properly.

Anyway, code looks much more readable. From me:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +	}
> +	if (count)
> +		free(cards);
> +	return count;
>  }
>  
>  static int
> @@ -333,6 +415,7 @@ static void clrscr(void)
>  struct gputop_args {
>  	long n_iter;
>  	unsigned long delay_usec;
> +	char *device;
>  };
>  
>  static void help(void)
> @@ -343,16 +426,18 @@ static void help(void)
>  	       "\t-h, --help                show this help\n"
>  	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
>  	       "\t-n, --iterations =NUMBER  number of executions\n"
> +	       "\t-D, --device              Device filter\n"
>  	       , program_invocation_short_name);
>  }
>  
>  static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>  {
> -	static const char cmdopts_s[] = "hn:d:";
> +	static const char cmdopts_s[] = "hn:d:D:";
>  	static const struct option cmdopts[] = {
>  	       {"help", no_argument, 0, 'h'},
>  	       {"delay", required_argument, 0, 'd'},
>  	       {"iterations", required_argument, 0, 'n'},
> +	       {"device", required_argument, 0, 'D'},
>  	       { }
>  	};
>  
> @@ -360,6 +445,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>  	memset(args, 0, sizeof(*args));
>  	args->n_iter = -1;
>  	args->delay_usec = 2 * USEC_PER_SEC;
> +	args->device = NULL;
>  
>  	for (;;) {
>  		int c, idx = 0;
> @@ -383,6 +469,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>  				return -1;
>  			}
>  			break;
> +		case 'D':
> +			args->device = optarg;
> +			break;
>  		case 'h':
>  			help();
>  			return 0;
> @@ -422,6 +511,52 @@ int main(int argc, char **argv)
>  	n = args.n_iter;
>  	period_us = args.delay_usec;
>  
> +	if (!populate_device_instances(args.device ? args.device
> +				       : "device:card=all")) {
> +		printf("No device found.\n");
> +		gputop_clean_up();
> +		exit(1);
> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		if (devices[i].driver_present) {
> +			for (int j = 0; j < devices[i].len; j++) {
> +				if (!oprs[i].init_engines(devices[i].instances + j)) {
> +					fprintf(stderr,
> +						"Failed to initialize engines! (%s)\n",
> +						strerror(errno));
> +						gputop_clean_up();
> +					return EXIT_FAILURE;
> +				}
> +				ret = oprs[i].pmu_init(devices[i].instances + j);
> +
> +				if (ret) {
> +					fprintf(stderr,
> +						"Failed to initialize PMU! (%s)\n",
> +						strerror(errno));
> +					if (errno == EACCES && geteuid())
> +						fprintf(stderr,
> +							"\n"
> +							"When running as a normal user CAP_PERFMON is required to access performance\n"
> +							"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
> +							"distribution vendor for assistance.\n"
> +							"\n"
> +							"More information can be found at 'Perf events and tool security' document:\n"
> +							"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
> +
> +					igt_devices_free();
> +					gputop_clean_up();
> +					return EXIT_FAILURE;
> +				}
> +			}
> +		}
> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		for (int j = 0; devices[i].driver_present && j < devices[i].len; j++)
> +			oprs[i].pmu_sample(devices[i].instances + j);
> +	}
> +
>  	clients = igt_drm_clients_init(NULL);
>  	if (!clients)
>  		exit(1);
> @@ -442,14 +577,27 @@ int main(int argc, char **argv)
>  
>  	while ((n != 0) && !stop_top) {
>  		struct igt_drm_client *c, *prevc = NULL;
> -		int i, engine_w = 0, lines = 0;
> +		int k, engine_w = 0, lines = 0;
>  
>  		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> +
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++)
> +				oprs[i].pmu_sample(devices[i].instances + j);
> +		}
> +
>  		igt_drm_clients_sort(clients, client_cmp);
>  
>  		update_console_size(&con_w, &con_h);
>  		clrscr();
>  
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++) {
> +				lines = oprs[i].print_engines(devices[i].instances + j,
> +							 lines, con_w, con_h);
> +			}
> +		}
> +
>  		if (!clients->num_clients) {
>  			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>  
> @@ -457,7 +605,7 @@ int main(int argc, char **argv)
>  			       (int)(con_w - strlen(msg) - 1), msg);
>  		}
>  
> -		igt_for_each_drm_client(clients, c, i) {
> +		igt_for_each_drm_client(clients, c, k) {
>  			assert(c->status != IGT_DRM_CLIENT_PROBE);
>  			if (c->status != IGT_DRM_CLIENT_ALIVE)
>  				break; /* Active clients are first in the array. */
> @@ -481,11 +629,11 @@ int main(int argc, char **argv)
>  	}
>  
>  	igt_drm_clients_free(clients);
> +	gputop_clean_up();
>  
>  	if (profiled_devices != NULL) {
>  		igt_devices_configure_profiling(profiled_devices, false);
>  		igt_devices_free_profiling(profiled_devices);
>  	}
> -
>  	return 0;
>  }
> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
> new file mode 100644
> index 000000000..4766d8496
> --- /dev/null
> +++ b/tools/gputop/meson.build
> @@ -0,0 +1,6 @@
> +gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
> +executable('gputop', sources : gputop_src,
> +           install : true,
> +           install_rpath : bindir_rpathdir,
> +           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
> +	   install: true)
> diff --git a/tools/meson.build b/tools/meson.build
> index de866c392..8002f707d 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -69,11 +69,6 @@ if libudev.found()
>  		   install : true)
>  endif
>  
> -executable('gputop', 'gputop.c',
> -           install : true,
> -           install_rpath : bindir_rpathdir,
> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> -
>  intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>  executable('intel_l3_parity', sources : intel_l3_parity_src,
>  	   dependencies : tool_deps,
> @@ -122,3 +117,4 @@ endif
>  subdir('i915-perf')
>  subdir('xe-perf')
>  subdir('null_state_gen')
> +subdir('gputop')
> -- 
> 2.34.1
> 
