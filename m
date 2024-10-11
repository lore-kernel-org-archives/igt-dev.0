Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B2DD24470
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 17:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F07D10EBC1;
	Fri, 11 Oct 2024 17:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOkc4I4c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C7510EBC1
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 17:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728668380; x=1760204380;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Q9dNzin1TVFn5OvdjuuRoAcWFDC3X4pbsqIh2i9iy4A=;
 b=fOkc4I4cZ3xZJY7lsg+SSnl0tVxC8u73qIQWEMgulaKml/b/oHLviNSC
 2dA1V8KcYzxaLm74aTdjmTC4lWWF/buW+4YxPQ2c88JTW0dHfYY1W/Lmc
 zUDxKVOC4ChN3nnotWjfzqhl5in/8NlEBqdRcWkvkvSA5mGLbVofWIOti
 wZAN26vLxN+SjJhBvHSXC2ShA1WYMyCvmqC1QJN6+Idle3cKlQWTbw3kl
 IWNv02zBIjekAFsOq+/SEin/e9o6odwEXB1edfQcmdxl6QBe2nlylC8D6
 w1WeGZ55fsS/qgY6asmP/z8217Ryj8Qh9RfYm57y6vH/YVqIdqGzhIl+k w==;
X-CSE-ConnectionGUID: JzXbGirKRsqgngxEsH4aDw==
X-CSE-MsgGUID: JonvN6ERQR+9un+gEMxU/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30954722"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="30954722"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 10:39:39 -0700
X-CSE-ConnectionGUID: OFWXhbG/TUat8r3t0oacBQ==
X-CSE-MsgGUID: ZP/ktPW9TWuvwWA8q3ptgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="77441788"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 10:39:38 -0700
Date: Fri, 11 Oct 2024 19:39:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 4/5] tools/power: Introduce a small power/energy
 measurement tool
Message-ID: <20241011173935.qookzabccctucbxb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
 <20240916201841.29592-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240916201841.29592-5-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-09-16 at 23:18:40 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Provide a small tool for general power/energy measurements.
> 
> The tool operates as follow:
> 1. optionally sleep for a while to let the system settle
> 2. sample from number of rapl/hwmon/battery sources
> 3. sleep for a know amount of time
> 4. sample again from the same sources
> 5. calculate the results and report how much power/energy was used
> 
> igt_power provides the actual power/energy measurement stuff.
> 
> Sample output:
> $ power -S 30 -s 30 -d /dev/dri/card0 -b 0 -r gpu -r pkg
> /dev/dri/card0[gpu]: energy 17.944336 mJ, power 0.597746 mW, time 30.020000 s
> battery[0]: energy 108000.000000 mJ, power 3597.585325 mW, time 30.020136 s
> rapl[gpu]: energy 17.944336 mJ, power 0.597824 mW, time 30.016083 s
> rapl[pkg]: energy 24139.099121 mJ, power 804.205461 mW, time 30.016085 s
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  tools/meson.build |   1 +
>  tools/power.c     | 179 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 180 insertions(+)
>  create mode 100644 tools/power.c
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index df26c4b95e3f..48c9a4b5089e 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -43,6 +43,7 @@ tools_progs = [
>  	'intel_gvtg_test',
>  	'dpcd_reg',
>  	'lsgpu',
> +	'power',
>  ]
>  tool_deps = igt_deps
>  tool_deps += zlib
> diff --git a/tools/power.c b/tools/power.c
> new file mode 100644
> index 000000000000..75c62ad39e61
> --- /dev/null
> +++ b/tools/power.c
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <fcntl.h>
> +#include <getopt.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +#include "drmtest.h"
> +#include "igt_power.h"
> +
> +struct measurement {
> +	int battery_index;
> +	const char *rapl_domain;
> +	const char *drm_device;
> +	struct power_sample pre, post;
> +	struct igt_power power;
> +};
> +
> +static bool prepare(struct measurement *m)
> +{
> +	if (m->battery_index >= 0) {
> +		if (igt_power_bat_open(&m->power, m->battery_index)) {
> +			fprintf(stderr, "Unable to open battery %d\n", m->battery_index);

It would help in debug to print also errno.

Add new line before return.

> +			return false;
> +		}
> +	}
> +
> +	if (m->rapl_domain) {
> +		int fd = -1;
> +
> +		if (m->drm_device) {
> +			fd = open(m->drm_device, O_RDONLY);
> +			if (fd < 0) {
> +				fprintf(stderr, "Unable to open drm device %s\n", m->drm_device);

Same here.

> +				return false;
> +			}
> +		}
> +
> +		if (igt_power_open(fd, &m->power, m->rapl_domain)) {
> +			if (m->drm_device)
> +				fprintf(stderr, "Unable to open hwmon/rapl for %s\n", m->drm_device);
> +			else
> +				fprintf(stderr, "Unable to open rapl domain %s\n", m->rapl_domain);

Print errno in both cases.

> +			close(fd);

Add newline.

> +			return false;
> +		}
> +
> +		close(fd);
> +	}
> +
> +	return true;
> +}
> +
> +static void sample_pre(struct measurement *m)
> +{
> +	igt_power_get_energy(&m->power, &m->pre);
> +}
> +
> +static void sample_post(struct measurement *m)
> +{
> +	igt_power_get_energy(&m->power, &m->post);
> +}
> +
> +static void report(struct measurement *m)
> +{
> +	if (m->battery_index >= 0)
> +		printf("battery[%d]: energy %f mJ, power %f mW, time %f s\n",
> +		       m->battery_index,
> +		       igt_power_get_mJ(&m->power, &m->pre, &m->post),
> +		       igt_power_get_mW(&m->power, &m->pre, &m->post),
> +		       igt_power_get_s(&m->pre, &m->post));
> +	else
> +		printf("%s[%s]: energy %f mJ, power %f mW, time %f s\n",
> +		       m->drm_device ?: "rapl", m->rapl_domain,
> +		       igt_power_get_mJ(&m->power, &m->pre, &m->post),
> +		       igt_power_get_mW(&m->power, &m->pre, &m->post),
> +		       igt_power_get_s(&m->pre, &m->post));
> +
> +	igt_power_close(&m->power);
> +}
> +
> +static void __attribute__((noreturn)) usage(const char *name)
> +{
> +	fprintf(stderr,
> +		"Usage: %s [[-d <device>][-r <domain>][-b <battery>]...][-S <seconds>][-s <seconds>]\n"
> +		"  -d,--drm <device>\tDRM device (eg. /dev/dri/card0)\n"
> +		"  -r,--rapl <domain>\trapl domain (cpu,gpu,pkg,ram)\n"
> +		"  -b,--battery <battery>\tbattery index\n"
> +		"  -S,--settle <seconds>\tsettling duration\n"
> +		"  -s,--sleep <seconds>\tmeasurement duration\n",
> +		name);
> +	exit(1);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	struct measurement measurements[8];
> +	int num_measurements = 0;
> +	int measurement_duration = 0;
> +	int settle_duration = 0;
> +
> +	for (;;) {
> +		static const struct option long_options[] = {
> +			{ .name = "drm", .has_arg = required_argument, },
> +			{ .name = "rapl", .has_arg = required_argument, },
> +			{ .name = "battery", .has_arg = required_argument, },
> +			{ .name = "sleep", .has_arg = required_argument, },
> +			{ .name = "settle", .has_arg = required_argument, },
> +			{}
> +		};
> +
> +		int opt = getopt_long(argc, argv, "d:r:b:S:s:", long_options, NULL);

Add newline.

With above fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +		if (opt == -1)
> +			break;
> +
> +		switch (opt) {
> +		case 'd':
> +			if (num_measurements >= ARRAY_SIZE(measurements))
> +				usage(argv[0]);
> +			measurements[num_measurements].battery_index = -1;
> +			measurements[num_measurements].rapl_domain = "gpu";
> +			measurements[num_measurements].drm_device = optarg;
> +			num_measurements++;
> +			break;
> +		case 'r':
> +			if (num_measurements >= ARRAY_SIZE(measurements))
> +				usage(argv[0]);
> +			measurements[num_measurements].battery_index = -1;
> +			measurements[num_measurements].rapl_domain = optarg;
> +			measurements[num_measurements].drm_device = NULL;
> +			num_measurements++;
> +			break;
> +		case 'b':
> +			if (num_measurements >= ARRAY_SIZE(measurements))
> +				usage(argv[0]);
> +			measurements[num_measurements].battery_index = atoi(optarg);
> +			measurements[num_measurements].rapl_domain = NULL;
> +			measurements[num_measurements].drm_device = NULL;
> +			num_measurements++;
> +			break;
> +		case 's':
> +			measurement_duration = atoi(optarg);
> +			break;
> +		case 'S':
> +			settle_duration = atoi(optarg);
> +			break;
> +		default:
> +			usage(argv[0]);
> +			break;
> +		}
> +	}
> +
> +	if (num_measurements == 0)
> +		usage(argv[0]);
> +
> +	for (int i = 0; i < num_measurements; i++) {
> +		if (!prepare(&measurements[i]))
> +			usage(argv[0]);
> +	}
> +
> +	sleep(settle_duration);
> +
> +	for (int i = 0; i < num_measurements; i++)
> +		sample_pre(&measurements[i]);
> +
> +	sleep(measurement_duration);
> +
> +	for (int i = 0; i < num_measurements; i++)
> +		sample_post(&measurements[i]);
> +
> +	for (int i = 0; i < num_measurements; i++)
> +		report(&measurements[i]);
> +
> +	return 0;
> +}
> -- 
> 2.44.2
> 
