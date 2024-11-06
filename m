Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F46D44D59
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 12:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B153110E1D8;
	Wed,  6 Nov 2024 12:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6Izd5e5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14E710E1D8
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730897072; x=1762433072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2sC09US/tAz4WZsCC+v9gH3SqQrlwLvGaM3qExYbF7U=;
 b=g6Izd5e591Gq+Dq5QMvuUfraF04pWu8RxPhiabC2gM6rJGRQWQClZhAz
 cL5wTmSFcKO2Ba8M1RZiuqeAvLnUQaxbY35dScUyGRWQ1e7XFeHY/NKGe
 lR8dl35ypSs6CEFTec0z6NtrfGu17varkkNeYsEDIZKDM03DdWo1hSXTI
 cv6YYjtWf1BvtWzSyQ06L0yqjZ7VuxfYUUmcIbPbc1EWXjcmK4JVsddBq
 DTqLBcxD7BHdZtgIgPu4vUSPF1ETjydkqPrJZ8O/KFdGd1zdR3GtuUM3K
 ufKa9Wpc5ZQe3A9Z6LaOLXF90EEbivu+w3UVhYvN+D++JIma9AWwJuOWH g==;
X-CSE-ConnectionGUID: 2dSj/mrYReKdvO2gXZ8TrQ==
X-CSE-MsgGUID: o2o41qqcRZCxgN6PPX1n3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30577075"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="30577075"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 04:44:31 -0800
X-CSE-ConnectionGUID: IsfYIHZRTi2dvugy3zRdvw==
X-CSE-MsgGUID: cjlmAaPwSPuvZaTLEH6nNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="89108125"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 04:44:29 -0800
Date: Wed, 6 Nov 2024 13:44:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, luciano.coelho@intel.com
Subject: Re: [PATCH i-g-t v2] igt-runner fact checking
Message-ID: <20241106124413.swtucaj5yjj6o3ou@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 luciano.coelho@intel.com
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <8c573469-ff48-49bf-a3ab-ddcfaef83e95@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c573469-ff48-49bf-a3ab-ddcfaef83e95@linux.intel.com>
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

Hi Peter,
On 2024-11-06 at 10:28:03 +0100, Peter Senna Tschudin wrote:
> When using igt-runner, collect and report facts before each test and after the
> last test. Examples:
>  - hardware.pci.gpu_at_addr.0000:03:00.0 = 8086:e20b Intel Battlemage (Gen20)
>  - hardware.pci.drm_card_at_addr.0000:03:00.0 = card1
>  - kernel.kmod_is_loaded.i915 = true

Please name facts that you intend to collect.

> 
> This change has a low execution time overhead. This change has a low logging
> overhead. It adds about 10 lines of logging for each CI run with about 100
> tests. Currently logs are going to the igt_runner0 when CI runs igt-runner.

Drop this paragraph, it looks like it belong to cover letter.

> 
> Here is an example on how to test it:

Example(s) should be put in cover letter.

>  $ cat test-list
>  igt@core_hotunplug@hotrebind
>  igt@xe_module_load@reload-no-display
> 
>  $ ... ./build/runner/igt_runner ...
>  [51.225490] [FACT before any test] new hardware.pci.gpu_at_addr.0000:03:00.0 = 8086:e20b Intel Battlemage (Gen20)
>  [51.225700] [FACT before any test] new hardware.pci.gpu_at_addr.0000:00:02.0 = 8086:a782 Intel Raptorlake_s (Gen12)
>  [51.227334] [1/2] core_hotunplug (hotrebind)
>  [59.429470] [FACT core_hotunplug (hotrebind)] new hardware.pci.drm_card_at_addr.0000:03:00.0 = card1
>  [59.429486] [FACT core_hotunplug (hotrebind)] new hardware.pci.drm_card_at_addr.0000:00:02.0 = card2
>  [59.430002] [FACT core_hotunplug (hotrebind)] new kernel.kmod_is_loaded.amdgpu = true
>  [59.430011] [FACT core_hotunplug (hotrebind)] new kernel.kmod_is_loaded.i915 = true
>  [59.430014] [FACT core_hotunplug (hotrebind)] new kernel.kmod_is_loaded.xe = true
>  [59.430456] [2/2] xe_module_load (reload-no-display)
>  [61.521348] [FACT xe_module_load (reload-no-display)] deleted hardware.pci.drm_card_at_addr.0000:03:00.0 = card1
>  [61.521834] [FACT xe_module_load (reload-no-display)] deleted kernel.kmod_is_loaded.xe = true
>  Done.
> 
> As igt@core_hotunplug@hotrebind makes changes to the system, running the same
> test-list again produces different results:
> 
>  $ ... ./build/runner/igt_runner ...
>  [141.870776] [FACT before any test] new hardware.pci.gpu_at_addr.0000:03:00.0 = 8086:e20b Intel Battlemage (Gen20)
>  [141.870820] [FACT before any test] new hardware.pci.gpu_at_addr.0000:00:02.0 = 8086:a782 Intel Raptorlake_s (Gen12)
>  [141.872987] [FACT before any test] new hardware.pci.drm_card_at_addr.0000:00:02.0 = card2
>  [141.874137] [FACT before any test] new kernel.kmod_is_loaded.amdgpu = true
>  [141.874144] [FACT before any test] new kernel.kmod_is_loaded.i915 = true
>  [141.874596] [1/2] core_hotunplug (hotrebind)
>  [146.662913] [FACT core_hotunplug (hotrebind)] changed hardware.pci.drm_card_at_addr.0000:00:02.0: card2 -> card0
>  [146.663850] [2/2] xe_module_load (reload-no-display)
>  Done.
> 
> v2:
>  - add lib/tests/igt_facts.c for basic unit testing
>  - bugfix: do not report a new gpu when the driver changes the gpu name
>  - bugfix: do not report the pci_id twice on the gpu name
> 

imho write here Cc addresses

> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  lib/igt_facts.c       | 576 ++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_facts.h       |  55 ++++
>  lib/meson.build       |   1 +
>  lib/tests/igt_facts.c |  37 +++
>  lib/tests/meson.build |   1 +
>  runner/executor.c     |   9 +

Please check your patches with checkpatch.pl from Linux kernel
and correct it's findings.

>  6 files changed, 679 insertions(+)
>  create mode 100644 lib/igt_facts.c
>  create mode 100644 lib/igt_facts.h
>  create mode 100644 lib/tests/igt_facts.c
> 
> diff --git a/lib/igt_facts.c b/lib/igt_facts.c
> new file mode 100644
> index 000000000..e75f93f92
> --- /dev/null
> +++ b/lib/igt_facts.c
> @@ -0,0 +1,576 @@
> +// SPDX-License-Identifier: MIT
> +
> +/*
> + * Copyright © 2024 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Drop this, SPDX above is enough.

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include <stdio.h>
> +#include <glib.h>
> +#include <libudev.h>

Put newline.

> +#include "igt_core.h"
> +#include "igt_kmod.h"
> +#include "igt_facts.h"
> +#include "igt_device_scan.h"
> +
> +
> +/* Report new facts and fact changes
> + * - new: new_value is NULL
> + * - change: new_value is not NULL
> + * - delete: delete is true
> + */
> +static void report_fact_change(igt_fact *fact, const char *new_value,
> +			       const char *last_test, bool delete)
> +{
> +	struct timespec uptime_ts;
> +	char *uptime = NULL;
> +	bool changed = false;
> +
> +	if (last_test == NULL)
> +		last_test = g_strdup("before any test");

Why you need it? You will need to free this before any return below.

> +
> +	if (clock_gettime(CLOCK_BOOTTIME, &uptime_ts) != 0)
> +		return;
> +
> +	uptime = g_strdup_printf("%ld.%06ld",
> +				 uptime_ts.tv_sec,
> +				 uptime_ts.tv_nsec / 1000);
> +
> +	/* If delete is true, the fact was deleted */
> +	if (delete) {
> +		igt_info("[%s] [FACT %s] deleted %s = %s\n",
> +			 uptime, last_test, fact->name, fact->value);
> +		return;
> +	}
> +
> +	/* If new_value is NULL, it is a new fact */
> +	if (new_value == NULL) {
> +		igt_info("[%s] [FACT %s] new %s = %s\n",
> +			 uptime, last_test, fact->name, fact->value);
> +		return;
> +	}
> +
> +	/* Check if the value changed
> +	 *
> +	 * There is a corner case because the gpu driver can change the human
> +	 * readeable strings. If the fact->name contains pci_gpu_fact, compare
> +	 * just the first nine characters (pci_id).
> +	 */
> +	if (strstr(fact->name, pci_gpu_fact) != NULL) {
> +		if (strncmp(fact->value, new_value, 9) != 0)
> +			changed = true;
> +	} else if (strcmp(fact->value, new_value) != 0)
> +		changed = true;
> +
> +	if (changed) {
> +		igt_info("[%s] [FACT %s] changed %s: %s -> %s\n",
> +			 uptime, last_test, fact->name, fact->value, new_value);
> +		changed = false;
> +	}
> +
> +	g_free(uptime);
> +}
> +
> +/* Get a fact by name. Return NULL if fact is not found. */
> +static igt_fact *get_fact(igt_fact_list *list, const char *name)
> +{
> +	if (!list || list->facts == NULL || list->num_facts == 0)
> +		return NULL;
> +
> +	for (int i = 0; i < list->num_facts; i++) {
> +		if (list->facts[i].name == NULL)
> +			continue;
> +
> +		if (strcmp(list->facts[i].name, name) == 0)
> +			return &list->facts[i];
> +	}
> +	return NULL;
> +}
> +
> +static bool delete_fact(igt_fact_list *list, const char *name, const char *last_test)
> +{
> +	igt_fact *fact = NULL;
> +	int i;
> +
> +	fact = get_fact(list, name);
> +	if (fact == NULL)
> +		return false;
> +
> +	/* Report the deletion */
> +	report_fact_change(fact, NULL, last_test, true);
> +
> +	/* Move all facts after the one to be deleted one step back */
> +	for (i = 0; i < list->num_facts; i++) {
> +		if (strcmp(list->facts[i].name, name) == 0) {
> +			g_free(list->facts[i].name);
> +			g_free(list->facts[i].value);
> +
> +			for (int j = i; j < list->num_facts - 1; j++)
> +				list->facts[j] = list->facts[j + 1];
> +			break;
> +		}
> +	}
> +	list->num_facts--;
> +	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));

realloc could fail.

> +
> +	return true;
> +}
> +
> +/* Only used while creating the new_list. Not intended to add facts to the
> + * global fact list.
> + */
> +static bool set_fact(igt_fact_list *list, const char *name,
> +		     const char *value, const char *last_test)
> +{
> +	igt_fact *fact = NULL;
> +
> +	/* Check that name and value are not null */
> +	if (name == NULL || value == NULL)
> +		return false;
> +
> +	fact = get_fact(list, name);
> +	if (fact != NULL)
> +		return false; /* Should not happen */
> +
> +	/* Add a new fact */
> +	list->num_facts++;
> +	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
> +	list->facts[list->num_facts - 1].name = g_strdup(name);
> +	list->facts[list->num_facts - 1].value = g_strdup(value);
> +
> +	if (last_test)
> +		list->facts[list->num_facts - 1].last_test = g_strdup(last_test);
> +	else
> +		list->facts[list->num_facts - 1].last_test = NULL;
> +
> +	return true;
> +}
> +
> +/* Add a new fact or update the value of an existing fact. Return false if
> + * the value is the same as the existing one.
> + */
> +static bool update_list(igt_fact_list *list, const char *name,
> +			const char *value, const char *last_test)
> +{
> +	igt_fact *fact = NULL;
> +
> +	/* Check that name and value are not null */
> +	if (name == NULL || value == NULL)
> +		return false;
> +
> +	fact = get_fact(list, name);
> +	if (fact != NULL) {
> +		/* Return false if fact->value equals value */
> +		if (strcmp(fact->value, value) == 0)
> +			return false; /* Not changed */
> +
> +		report_fact_change(fact, value, last_test, false);
> +
> +		/* Update the value */
> +		fact->value = g_strdup(value);
> +		return true;
> +	}
> +
> +	/* Add a new fact */
> +	list->num_facts++;
> +	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
> +	list->facts[list->num_facts - 1].name = g_strdup(name);
> +	list->facts[list->num_facts - 1].value = g_strdup(value);
> +
> +	/* Report new fact */
> +	report_fact_change(&list->facts[list->num_facts - 1], NULL,
> +					   last_test, false);
> +
> +	return true;
> +}
> +
> +/* Merge list and new_list. fact_group is used to filer entries on list
> + * that should be deleted. For example, if fact_group is "pci_gpu", we
> + * can delete the fact hardware.pci.gpu_at.0000:00:02.0 if it doesn't
> + * exist in new_list.
> + */
> +static void merge_facts(igt_fact_list *list, igt_fact_list *new_list,
> +			const char *fact_group, const char *last_test)
> +{
> +	/* Filter by fact_group and delete facts that exist on list
> +	 * but not on new_list
> +	 */
> +	for (int i = 0; i < list->num_facts; i++) {
> +		if (strstr(list->facts[i].name, fact_group) == NULL)
> +			continue;
> +		if (get_fact(new_list, list->facts[i].name) == NULL)
> +			delete_fact(list, list->facts[i].name, last_test);
> +	}
> +
> +	/* Add and update facts from new_list to list */
> +	for (int i = 0; i < new_list->num_facts; i++) {
> +		if (strstr(new_list->facts[i].name, fact_group) == NULL)
> +			continue; /* Should never happen */
> +		update_list(list, new_list->facts[i].name,
> +			    new_list->facts[i].value,
> +			    new_list->facts[i].last_test);
> +	}
> +}
> +
> +static void scan_pci_for_gpus(igt_fact_list *list, const char *last_test)
> +{
> +	struct udev *udev = NULL;
> +	struct udev_enumerate *enumerate = NULL;
> +	struct udev_list_entry *devices, *dev_list_entry;
> +	struct igt_device_card card;
> +	char pcistr[10];
> +	int ret;
> +	char *factname = NULL;
> +	char *factvalue = NULL;
> +	igt_fact_list new_list = {0};
> +
> +	udev = udev_new();
> +	if (!udev) {
> +		igt_warn("Failed to create udev context\n");
> +		return;
> +	}
> +
> +	enumerate = udev_enumerate_new(udev);
> +	if (!enumerate) {
> +		igt_warn("Failed to create udev enumerate\n");
> +		udev_unref(udev);
> +		return;
> +	}
> +
> +	ret = udev_enumerate_add_match_subsystem(enumerate, "pci");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "30000");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "38000");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = udev_enumerate_scan_devices(enumerate);
> +	if (ret < 0)
> +		goto out;
> +
> +	devices = udev_enumerate_get_list_entry(enumerate);
> +	if (!devices)
> +		goto out;
> +
> +	udev_list_entry_foreach(dev_list_entry, devices) {
> +		const char *path;
> +		struct udev_device *udev_dev;
> +		struct udev_list_entry *entry;
> +		char *model = NULL;
> +		char *codename = NULL;
> +
> +		path = udev_list_entry_get_name(dev_list_entry);
> +		udev_dev = udev_device_new_from_syspath(udev, path);
> +		if (!udev_dev)
> +			continue;
> +
> +		/* Strip path to only the content after the last / */
> +		path = strrchr(path, '/');
> +		if (path)
> +			path++;
> +		else
> +			path = "unknown";
> +
> +		strcpy(card.pci_slot_name, "-");
> +
> +		entry = udev_device_get_properties_list_entry(udev_dev);
> +		while (entry) {
> +			const char *name = udev_list_entry_get_name(entry);
> +			const char *value = udev_list_entry_get_value(entry);
> +
> +			entry = udev_list_entry_get_next(entry);
> +			if (!strcmp(name, "ID_MODEL_FROM_DATABASE"))
> +				model = g_strdup(value);
> +			else if (!strcmp(name, "PCI_ID"))
> +				igt_assert_eq(sscanf(value, "%hx:%hx",
> +						     &card.pci_vendor, &card.pci_device), 2);
> +		}
> +		snprintf(pcistr, sizeof(pcistr), "%04x:%04x",
> +			 card.pci_vendor, card.pci_device);
> +		codename = igt_device_get_pretty_name(&card, false);
> +
> +		/* Set codename to null if it is the same string as pci_id */
> +		if (codename && strcmp(pcistr, codename) == 0) {
> +			free(codename);
> +			codename = NULL;
> +		}
> +
> +		factname = g_strdup_printf("%s.%s", pci_gpu_fact, path);
> +		factvalue = g_strdup_printf("%s %s %s",
> +					    pcistr,
> +					    codename ? codename : "",
> +					    model ? model : "");
> +
> +		/* Strip whitespaces from factvalue */
> +		factvalue = g_strstrip(factvalue);
> +
> +		set_fact(&new_list, factname, factvalue, last_test);
> +
> +		free(codename);
> +		free(model);
> +		udev_device_unref(udev_dev);
> +	}
> +	merge_facts(list, &new_list, pci_gpu_fact, last_test);
> +
> +out:
> +	udev_enumerate_unref(enumerate);
> +	udev_unref(udev);
> +}
> +
> +static void scan_pci_drm_cards(igt_fact_list *list, const char *last_test)
> +{
> +	struct udev *udev = NULL;
> +	struct udev_enumerate *enumerate = NULL;
> +	struct udev_list_entry *devices, *dev_list_entry;
> +	int ret;
> +	char *factname = NULL;
> +	char *factvalue = NULL;
> +	igt_fact_list new_list = {0};
> +
> +	udev = udev_new();
> +	if (!udev)
> +		return;
> +
> +	enumerate = udev_enumerate_new(udev);
> +	if (!enumerate) {
> +		udev_unref(udev);
> +		return;
> +	}
> +
> +	ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = udev_enumerate_scan_devices(enumerate);
> +	if (ret < 0)
> +		goto out;
> +
> +	devices = udev_enumerate_get_list_entry(enumerate);
> +	if (!devices)
> +		goto out;
> +
> +	ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = udev_enumerate_scan_devices(enumerate);
> +	if (ret < 0)
> +		goto out;
> +
> +	devices = udev_enumerate_get_list_entry(enumerate);
> +	if (!devices)
> +		goto out;
> +
> +	udev_list_entry_foreach(dev_list_entry, devices) {
> +		const char *path;
> +		struct udev_device *drm_dev, *pci_dev;
> +		const char *drm_name, *pci_addr;
> +
> +		path = udev_list_entry_get_name(dev_list_entry);
> +		drm_dev = udev_device_new_from_syspath(udev, path);
> +		if (!drm_dev)
> +			continue;
> +
> +		drm_name = udev_device_get_sysname(drm_dev);
> +		/* Filter the device by name. Want devices such as card0 and card1.
> +		 * If the device has '-' in the name, contine
> +		 */
> +		if (strncmp(drm_name, "card", 4) != 0 || strchr(drm_name, '-') != NULL) {
> +			udev_device_unref(drm_dev);
> +			continue;
> +		}
> +
> +		/* Get the pci address of the gpu associated with the drm_dev*/
> +		pci_dev = udev_device_get_parent_with_subsystem_devtype(drm_dev, "pci", NULL);
> +		if (pci_dev) {
> +			pci_addr = udev_device_get_sysattr_value(pci_dev, "address");
> +			if (!pci_addr)
> +				pci_addr = udev_device_get_sysname(pci_dev);
> +		} else {
> +			/* Some GPUs are platform devices. Ignore them. */
> +			pci_addr = NULL;
> +			udev_device_unref(drm_dev);
> +			continue;
> +		}
> +
> +		factname = g_strdup_printf("%s.%s", drm_card_fact, pci_addr);
> +		factvalue = g_strdup_printf("%s", drm_name);
> +		set_fact(&new_list, factname, factvalue, last_test);
> +
> +		udev_device_unref(drm_dev);
> +	}
> +	if (new_list.num_facts > 0)
> +		merge_facts(list, &new_list, drm_card_fact, last_test);
> +
> +out:
> +	udev_enumerate_unref(enumerate);
> +	udev_unref(udev);
> +}
> +
> +static void scan_kernel_loaded_kmods(igt_fact_list *list, const char *last_test)
> +{
> +	char *name = NULL;
> +	igt_fact_list new_list = {0};
> +
> +	/* Iterate over igt_fact_kmod_list[] until the element contains "\0" */
> +	for (int i = 0; strcmp(igt_fact_kmod_list[i], "\0") != 0; i++) {
> +		name = g_strdup_printf("%s.%s", kmod_fact, igt_fact_kmod_list[i]);
> +		if (igt_kmod_is_loaded(igt_fact_kmod_list[i]))
> +			set_fact(&new_list, name, "true", last_test);
> +
> +		g_free(name);
> +	}
> +	merge_facts(list, &new_list, kmod_fact, last_test);
> +}
> +

Describe each new public function.

> +void igt_facts(igt_fact_list *list, const char *last_test)
> +{
> +	scan_pci_for_gpus(list, last_test);
> +	scan_pci_drm_cards(list, last_test);
> +	scan_kernel_loaded_kmods(list, last_test);
> +
> +	/* Flush stdout and stderr */
> +	fflush(stdout);
> +	fflush(stderr);
> +}
> +
> +/* print_all_facts: pretty print all facts */

Same here, format for description is different, see other
libs for example.

> +void print_all_facts(igt_fact_list *list)
> +{
> +	igt_info("Number of facts: %d\n", list->num_facts);
> +	for (int i = 0; i < list->num_facts; i++)
> +		igt_info(" - %s: %s\n", list->facts[i].name, list->facts[i].value);
> +}
> +
> +
> +/* Testing
> + *
> + * Defined here so that we can keep most of the functions static
> + *
> + */
> +
> +/* test function for adding a pci gpu */
> +static void igt_facts_test_pci_gpu(igt_fact_list *list,
> +				   const char *last_test,
> +				   int index)
> +{
> +	igt_fact_list new_list = {0};
> +
> +	set_fact(&new_list, /* fact list */
> +		 "hardware.pci.gpu_at_addr.0000:00:02.0", /* fact name */
> +		 "8086:64a0 Intel Lunarlake (Gen20)", /* fact value */
> +		 last_test); /* last igt test that ran. NULL means before first test */
> +
> +	igt_assert_eq(new_list.num_facts, 1);
> +	igt_assert_eq(strcmp(new_list.facts[0].name,
> +		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
> +	igt_assert_eq(strcmp(new_list.facts[0].value,
> +		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
> +	igt_assert(new_list.facts[0].last_test == NULL);
> +
> +	merge_facts(list, &new_list, pci_gpu_fact, last_test);
> +	igt_assert_eq(list->num_facts, index + 1);
> +	igt_assert_eq(strcmp(list->facts[index].name,
> +		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
> +	igt_assert_eq(strcmp(list->facts[index].value,
> +		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
> +
> +}
> +
> +/* test function for adding i915 kmod */
> +static void igt_facts_test_i915_kmod(igt_fact_list *list,
> +				     const char *last_test,
> +				     int index)
> +{
> +	igt_fact_list new_list = {0};
> +
> +	set_fact(&new_list, /* fact list */
> +		 "kernel.kmod_is_loaded.i915", /* fact name */
> +		 "true", /* fact value */
> +		 last_test); /* last igt test that ran. NULL means before first test */
> +
> +	igt_assert_eq(new_list.num_facts, 1);
> +	igt_assert_eq(strcmp(new_list.facts[0].name,
> +		      "kernel.kmod_is_loaded.i915"), 0);
> +	igt_assert_eq(strcmp(new_list.facts[0].value, "true"), 0);
> +	igt_assert(new_list.facts[0].last_test == NULL);
> +
> +	merge_facts(list, &new_list, kmod_fact, last_test);
> +	igt_assert_eq(list->num_facts, index + 1);
> +	igt_assert_eq(strcmp(list->facts[index].name,
> +		      "kernel.kmod_is_loaded.i915"), 0);
> +	igt_assert_eq(strcmp(list->facts[index].value, "true"), 0);
> +}
> +
> +/* test delete_fact in order */
> +static void igt_facts_test_delete_fact(igt_fact_list *list,
> +				       const char *last_test)
> +{
> +	igt_info("Testing delete_fact()\n");
> +
> +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
> +	igt_assert_eq(list->num_facts, 1);
> +	igt_assert_eq(strcmp(list->facts[0].name,
> +		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
> +	igt_assert_eq(strcmp(list->facts[0].value,
> +		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
> +
> +	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
> +	igt_assert_eq(list->num_facts, 0);
> +
> +	/* Test delete on an empty list */
> +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
> +	igt_assert_eq(list->num_facts, 0);
> +
> +	/* Test delete on reverse order */
> +	igt_facts_test_pci_gpu(list, NULL, 0);
> +	igt_facts_test_i915_kmod(list, NULL, 1);
> +	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
> +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
> +	igt_assert_eq(list->num_facts, 0);
> +
> +	/* List is empty from now on*/
> +	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
> +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
> +	igt_assert_eq(list->num_facts, 0);
> +}
> +
> +/* function for testing the igt_facts library */

Describe it.

> +bool igt_facts_test(void)
> +{
> +	igt_fact_list fact_list = {0};
> +
> +	/* Test set_fact for the pci gpu */
> +	igt_info("Testing set_fact()\n");
> +	igt_facts_test_pci_gpu(&fact_list, NULL, 0);
> +	igt_facts_test_i915_kmod(&fact_list, NULL, 1);
> +
> +	/* Test delete_fact */
> +	igt_facts_test_delete_fact(&fact_list, NULL);
> +
> +	return true;
> +}
> diff --git a/lib/igt_facts.h b/lib/igt_facts.h
> new file mode 100644
> index 000000000..b649f93b3
> --- /dev/null
> +++ b/lib/igt_facts.h
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: MIT

In headers use /* SPDX-.... */

> +
> +/*
> + * Copyright © 2024 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Same here, drop this.

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include <stdbool.h>
> +
> +typedef struct {
> +	char *name;
> +	char *value;
> +	char *last_test;
> +} igt_fact;
> +
> +typedef struct {
> +	igt_fact *facts;
> +	int num_facts;
> +} igt_fact_list;
> +
> +const char *igt_fact_kmod_list[] = {
> +	"amdgpu",
> +	"i915",
> +	"nouveau",
> +	"radeon",
> +	"xe",
> +	"\0"
> +};

This looks redundant, we already have such list in other place,
if you need that maybe extract this to other common lib?

> +
> +const char *kmod_fact     = "kernel.kmod_is_loaded"; /* true or false */
> +const char *pci_gpu_fact  = "hardware.pci.gpu_at_addr"; /* id vendor model */
> +const char *drm_card_fact = "hardware.pci.drm_card_at_addr"; /* cardX */
> +
> +void igt_facts(igt_fact_list *list, const char *last_test);
> +void print_all_facts(igt_fact_list *list);
> +bool igt_facts_test(void); /* For unit testing only */
> diff --git a/lib/meson.build b/lib/meson.build
> index c3556a921..c44ca2b5a 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -18,6 +18,7 @@ lib_sources = [
>  	'i915/i915_crc.c',
>  	'igt_collection.c',
>  	'igt_color_encoding.c',
> +	'igt_facts.c',

Keep it sorted.

>  	'igt_crc.c',
>  	'igt_debugfs.c',
>  	'igt_device.c',
> diff --git a/lib/tests/igt_facts.c b/lib/tests/igt_facts.c
> new file mode 100644
> index 000000000..f2b1d66ec
> --- /dev/null
> +++ b/lib/tests/igt_facts.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: MIT
> +
> +/*
> + * Copyright © 2024 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Drop text.

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include <stdbool.h>

Add newline.

> +#include "igt_core.h"
> +#include "igt_facts.h"
> +
> +/* Tests are not defined here so we can keep most of the functions static */
> +
> +igt_simple_main
> +{
> +	igt_info("Running igt_facts_test\n");
> +	igt_assert(igt_facts_test() == true);
> +}
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index df8092638..1ce19f63c 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -8,6 +8,7 @@ lib_tests = [
>  	'igt_dynamic_subtests',
>  	'igt_edid',
>  	'igt_exit_handler',
> +	'igt_facts',
>  	'igt_fork',
>  	'igt_fork_helper',
>  	'igt_hook',
> diff --git a/runner/executor.c b/runner/executor.c
> index ac73e1dde..6ff252174 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -35,6 +35,7 @@
>  #include "executor.h"
>  #include "output_strings.h"
>  #include "runnercomms.h"
> +#include "igt_facts.h"

Keep it sorted, after executor.h

>  
>  #define KMSG_HEADER "[IGT] "
>  #define KMSG_WARN 4
> @@ -2306,6 +2307,8 @@ bool execute(struct execute_state *state,
>  	sigset_t sigmask;
>  	double time_spent = 0.0;
>  	bool status = true;
> +	igt_fact_list fact_list = {0};
> +	char *last_test = NULL;
>  
>  	if (state->dry) {
>  		outf("Dry run, not executing. Invoke igt_resume if you want to execute.\n");
> @@ -2438,6 +2441,10 @@ bool execute(struct execute_state *state,
>  		int result;
>  		bool already_written = false;
>  
> +		/* Calls before running each test */
> +		igt_facts(&fact_list, last_test);
> +		last_test = entry_display_name(&job_list->entries[state->next]);
> +
>  		if (should_die_because_signal(sigfd)) {
>  			status = false;
>  			goto end;
> @@ -2526,6 +2533,8 @@ bool execute(struct execute_state *state,
>  			return execute(state, settings, job_list);
>  		}
>  	}
> +	/* Last call to collect facts after the last test runs */
> +	igt_facts(&fact_list, last_test);
>  
>  	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
>  		dprintf(timefd, "%f\n", timeofday_double());

Where is a free for a fact_list?

Regards,
Kamil

> -- 
> 2.34.1
> 
