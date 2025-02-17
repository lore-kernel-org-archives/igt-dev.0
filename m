Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAEAC021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 14:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AF010E325;
	Mon, 17 Feb 2025 14:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POSdBn5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B63710E325
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739803595; x=1771339595;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4Ng7ihq4A7p9tPBnRu2Lithp7Y52ltOOoP25eUFdPBY=;
 b=POSdBn5B446K5RCh9Mi3DS8q/n9QMxopi8btrXzLFOWU3kVgSAdv2RXN
 GBPQ+LpkOPoC5ZpqEG+wAHQByTfpSJyOZ3O4s7jmAVC+m4YH30+Ml25RS
 +MayL8HHXp8NTXoQh8BNvVIWsgavBWqZMTkaBmQfaQ1g5m4i0yHCVcyVX
 A8+0vdXvgMI1QeHOAwZA9J3dcjsp38uT9OSabznx34UY+qJST18bkTC7f
 EE3i7PK0bgqGetu/AYsa0Ag5dWM9C3391iYJQRNcAslJvZeWge+mXqLHQ
 c9CkmhYnJkb9twc5Ikycs0JWUM4yl8me1Zvdjb4tUGIYrBPceF/miIXtJ g==;
X-CSE-ConnectionGUID: 92sKB4sFRROzemb1QE5y8w==
X-CSE-MsgGUID: 0SzZYUFBSeimZYQyH6ZxNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65840705"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="65840705"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 06:46:29 -0800
X-CSE-ConnectionGUID: P8z1AIN7RdiAsxrOoWOdOQ==
X-CSE-MsgGUID: gJ09jsP0Sp+Ot1pjC50RLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119349826"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 06:46:26 -0800
Date: Mon, 17 Feb 2025 15:46:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 lucas.demarchi@intel.com, vinay.belgaumkar@intel.com,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH i-g-t v2] Add single engine busyness stats in GPUTOP
Message-ID: <20250217144624.5jqmhqvfdwsnbb4a@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 lucas.demarchi@intel.com, vinay.belgaumkar@intel.com,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com
References: <20250214163200.929653-1-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214163200.929653-1-soham.purkait@intel.com>
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

Hi Soham,
On 2025-02-14 at 22:02:00 +0530, Soham Purkait wrote:
> Add single engine busyness support in GPUTOP.
> This uses the PMU interface to display the
> busyness of each engine instances.

I didn't read all your patch, only looked in few places.

> 
> ENGINES         BUSY
> Render/3D/0   | 96.5% ███████████████████████████████████████▍|
> Blitter/0     | 91.6% █████████████████████████████████████   |
> Video/0       | 56.2% ███████████████████████████             |
> VideoEnhance/0| 97.7% ████████████████████████████████████████|
> Compute/0     | 48.5% ███████████████████████▍                |
> 
> v1 : fixed cosmetic issues
> 
> v2 : fix for refactoring GPUTOP into a
>      vendor-agnostic tool (Lucas)
> 
> ---
>  lib/igt_device_scan.c        |  82 ++++++++
>  lib/igt_device_scan.h        |   5 +

Please send changes to this lib in separate patch.

>  lib/igt_perf.c               |  53 ++++++
>  lib/igt_perf.h               |   2 +

Same here.

>  tools/gputop/common_gputop.c |  51 +++++
>  tools/gputop/common_gputop.h |  16 ++
>  tools/{ => gputop}/gputop.c  | 246 ++++++++++++++++++++----
>  tools/gputop/meson.build     |   6 +
>  tools/gputop/xe_gputop.c     | 359 +++++++++++++++++++++++++++++++++++
>  tools/gputop/xe_gputop.h     |  74 ++++++++
>  tools/meson.build            |   6 +-
>  11 files changed, 858 insertions(+), 42 deletions(-)
>  create mode 100644 tools/gputop/common_gputop.c
>  create mode 100644 tools/gputop/common_gputop.h
>  rename tools/{ => gputop}/gputop.c (65%)
>  create mode 100644 tools/gputop/meson.build
>  create mode 100644 tools/gputop/xe_gputop.c
>  create mode 100644 tools/gputop/xe_gputop.h
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 711bedc5c..c71db0094 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -773,6 +773,9 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
>  	if (dev->drm_render != NULL)
>  		safe_strncpy(card->render, dev->drm_render,
>  			     sizeof(card->render));
> +	if (dev->driver != NULL)
> +		safe_strncpy(card->driver, dev->driver,
> +			     sizeof(card->driver));
>  
>  	if (dev->pci_slot_name != NULL)
>  		safe_strncpy(card->pci_slot_name, dev->pci_slot_name,
> @@ -820,6 +823,61 @@ static bool __find_first_intel_card_by_driver_name(struct igt_device_card *card,
>  	return false;
>  }
>  
> +/*
> + * Iterate over all igt_devices array and find all discrete/integrated card.
> + * @card: double pointer to igt_device_card structure, containing
> + * an array of igt_device_card structure upon successful return.
> + */
> +static int __find_all_intel_card_by_driver_name(struct igt_device_card **card,
> +						bool want_discrete, const char *drv_name)
> +{
> +	int count = 0;
> +	struct igt_device *dev;
> +	int is_integrated;
> +	struct igt_device_card *tmp;
> +	struct igt_device_card *crd =
> +		(struct igt_device_card *)calloc(1, sizeof(struct igt_device_card));
> +
> +	igt_assert(drv_name);
> +	memset(card, 0, sizeof(*card));
> +
> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +		if (!is_pci_subsystem(dev) || strcmp(dev->driver, drv_name))
> +			continue;
> +
> +		is_integrated = !strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
> +				PCI_SLOT_NAME_SIZE);
> +
> +		if (want_discrete && !is_integrated) {
> +			__copy_dev_to_card(dev, (crd + count));
> +			count++;
> +			tmp = realloc(crd, sizeof(struct igt_device_card) * (1 + count));
> +			if (!tmp) {
> +				free(crd);
> +				return -1;
> +			}
> +			crd = tmp;
> +
> +		} else if (!want_discrete && is_integrated) {
> +			__copy_dev_to_card(dev, (crd + count));
> +			count++;
> +			tmp = realloc(crd, sizeof(struct igt_device_card) * (1 + count));
> +			if (!tmp) {
> +				free(crd);
> +				return -1;
> +			}
> +			crd = tmp;
> +		}
> +	}
> +	if (count == 0) {
> +		free(crd);
> +		return 0;
> +	}
> +
> +	*card = crd;
> +	return count;
> +}
> +
>  bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
>  {
>  	igt_assert(card);
> @@ -866,6 +924,30 @@ bool igt_device_find_xe_integrated_card(struct igt_device_card *card)
>  	return __find_first_intel_card_by_driver_name(card, false, "xe");
>  }
>  
> +int igt_device_find_all_xe_integrated_card(struct igt_device_card **card)
> +{
> +	igt_assert(card);
> +	return __find_all_intel_card_by_driver_name(card, false, "xe");
> +}
> +
> +int igt_device_find_all_i915_integrated_card(struct igt_device_card **card)
> +{
> +	igt_assert(card);
> +	return __find_all_intel_card_by_driver_name(card, false, "i915");
> +}
> +
> +int igt_device_find_all_xe_discrete_card(struct igt_device_card **card)
> +{
> +	igt_assert(card);
> +	return __find_all_intel_card_by_driver_name(card, true, "xe");
> +}
> +
> +int igt_device_find_all_i915_discrete_card(struct igt_device_card **card)
> +{
> +	igt_assert(card);
> +	return __find_all_intel_card_by_driver_name(card, true, "i915");
> +}
> +
>  static struct igt_device *igt_device_from_syspath(const char *syspath)
>  {
>  	struct igt_device *dev;
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index 92741fe3c..da107292a 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -59,6 +59,7 @@ struct igt_device_card {
>  	char subsystem[NAME_MAX];
>  	char card[NAME_MAX];
>  	char render[NAME_MAX];
> +	char driver[NAME_MAX];
>  	char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
>  	uint16_t pci_vendor, pci_device;
>  };
> @@ -92,6 +93,10 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
>  bool igt_device_find_integrated_card(struct igt_device_card *card);
>  bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
>  bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
> +int igt_device_find_all_i915_discrete_card(struct igt_device_card **card);
> +int igt_device_find_all_i915_integrated_card(struct igt_device_card **card);
> +int igt_device_find_all_xe_integrated_card(struct igt_device_card **card);
> +int igt_device_find_all_xe_discrete_card(struct igt_device_card **card);
>  char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
>  int igt_open_card(struct igt_device_card *card);
>  int igt_open_render(struct igt_device_card *card);
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index 3866c6d77..3f2f3311f 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -129,6 +129,59 @@ uint64_t igt_perf_type_id(const char *device)
>  	return strtoull(buf, NULL, 0);
>  }
>  
> +int igt_perf_format(const char *device, const char *name, char *buff, int buflen)
> +{
> +	char buf[NAME_MAX];
> +	ssize_t ret;
> +	int fd;
> +
> +	snprintf(buf, sizeof(buf),
> +		 "/sys/bus/event_source/devices/%s/format/%s", device, name);
> +
> +	fd = open(buf, O_RDONLY);
> +	if (fd < 0)
> +		return -1;
> +
> +	ret = read(fd, buff, buflen - 1);
> +	close(fd);
> +	if (ret < 1)
> +		return -1;
> +
> +	buf[ret] = '\0';
> +
> +	return 0;
> +}
> +
> +uint64_t xe_perf_event_config(int xe, const char *pmu_str)

Why 'xe_' prefix here? imho this should be 'igt_'

> +{
> +	char buf[150];
> +	ssize_t ret;
> +	int fd;
> +	uint64_t config;
> +	char device[30];
> +
> +	snprintf(buf, sizeof(buf),
> +		 "/sys/bus/event_source/devices/%s/events/%s",
> +		 xe_perf_device(xe, device, sizeof(device)),

This looks generic, not restricted to Xe driver.

> +		 pmu_str);
> +
> +	fd = open(buf, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +	ret = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	if (ret < 1)
> +		return 0;
> +
> +	buf[ret] = '\0';
> +	ret = sscanf(buf, "event=0x%lx", &config);
> +	if (ret != 1)
> +		return 0;
> +
> +	return config;
> +}
> +
>  int igt_perf_events_dir(int i915)
>  {
>  	char buf[80];
> diff --git a/lib/igt_perf.h b/lib/igt_perf.h
> index 3d9ba2917..26b9ffa29 100644
> --- a/lib/igt_perf.h
> +++ b/lib/igt_perf.h
> @@ -54,9 +54,11 @@ perf_event_open(struct perf_event_attr *attr,
>  }
>  
>  uint64_t igt_perf_type_id(const char *device);
> +uint64_t xe_perf_event_config(int xe, const char *pmu_event);
>  int igt_perf_events_dir(int i915);
>  int igt_perf_open(uint64_t type, uint64_t config);
>  int igt_perf_open_group(uint64_t type, uint64_t config, int group);
> +int igt_perf_format(const char *device, const char *name, char *buff, int buflen);
>  
>  const char *i915_perf_device(int i915, char *buf, int buflen);
>  uint64_t i915_perf_type_id(int i915);
> diff --git a/tools/gputop/common_gputop.c b/tools/gputop/common_gputop.c
> new file mode 100644
> index 000000000..1188d8e6a
> --- /dev/null
> +++ b/tools/gputop/common_gputop.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include "common_gputop.h"
> +
> +static const char * const bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> +
> +void n_spaces(const unsigned int n)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < n; i++)
> +		putchar(' ');
> +}
> +
> +void print_percentage_bar(double percent, int max_len)
> +{
> +	int bar_len, i, len = max_len - 1;
> +	const int w = 8;
> +
> +	len -= printf("|%5.1f%% ", percent);
> +
> +	/* no space left for bars, do what we can */
> +	if (len < 0)
> +		len = 0;
> +
> +	bar_len = ceil(w * percent * len / 100.0);
> +	if (bar_len > w * len)
> +		bar_len = w * len;
> +
> +	for (i = bar_len; i >= w; i -= w)
> +		printf("%s", bars[w]);
> +	if (i)
> +		printf("%s", bars[i]);
> +
> +	len -= (bar_len + (w - 1)) / w;
> +	n_spaces(len);
> +
> +	putchar('|');
> +}
> +
> +int print_engines_footer(int lines, int con_w, int con_h)
> +{
> +	if (lines++ < con_h)
> +		printf("\n");
> +
> +	return lines;
> +}
> diff --git a/tools/gputop/common_gputop.h b/tools/gputop/common_gputop.h
> new file mode 100644
> index 000000000..29ba48d86
> --- /dev/null
> +++ b/tools/gputop/common_gputop.h
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#ifndef COMMON_GPUTOP_H
> +#define COMMON_GPUTOP_H
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <math.h>

Move above std*h headers.

> +
> +void print_percentage_bar(double percent, int max_len);
> +int print_engines_footer(int lines, int con_w, int con_h);
> +void n_spaces(const unsigned int n);
> +
> +#endif // COMMON_GPUTOP_H
> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
> similarity index 65%
> rename from tools/gputop.c
> rename to tools/gputop/gputop.c
> index 43b01f566..e53d1f087 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop/gputop.c
> @@ -1,8 +1,7 @@
>  // SPDX-License-Identifier: MIT
>  /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2025 Intel Corporation

Do not erase years, add new one for example:

 * Copyright © 2023-2025 Intel Corporation

Regards,
Kamil

[...cut...]
