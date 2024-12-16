Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC949E7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 09:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7072D10E567;
	Mon, 16 Dec 2024 09:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0GILHeq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E167B10E565
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734342108; x=1765878108;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XXsOcegD/GYWSyox5CJvbmqFDgQtD+VwryLyxqnewek=;
 b=m0GILHeq/DrxXYvrDtWethLQl9oWF4TZjyBSl0xL+9DscClLTusCJwDB
 sdxBtjxj7//3JOvyQskJH5QW9bG8hC1D6Rc68KAHVo1FjWkRHLUst9jfV
 seIJwjHCOpbKDjnuME3u9JLuEWbvFgAltVxNRvScHpcGml9wu+dj9nGyC
 bsgY02FfeNYj5+Jjdfv5RA35vSBi3HkEIyP5+8c9xy5V5qNwWz9KxB4HT
 InyXTu87myR/IipCFrf6mDKTZveTARJBJxaN6vSxQErKKo804sZ733Ezm
 68OsHbP1dNgMefaEhR8ZsikbJNEpYSssTRhkGAn3z2ERdbTLhn+ZuEisw A==;
X-CSE-ConnectionGUID: Pql5tfFPRzOtloH8U2uHuw==
X-CSE-MsgGUID: NoslDptBTraK6I4hkFRZMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46114222"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46114222"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 01:41:48 -0800
X-CSE-ConnectionGUID: Gpw8tPzSS1OBTHG/HxQN0A==
X-CSE-MsgGUID: L6XOz+BaTEGVe+axZ4vN3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="97576681"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.228])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 01:41:42 -0800
Date: Mon, 16 Dec 2024 10:41:40 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>, Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
Subject: Re: [PATCH i-g-t v14 1/3] lib/igt_facts: Library and unit testing
 for fact tracking
Message-ID: <20241216094140.qog4rl7wmjbfe6hl@zkempczy-mobl2>
References: <20241216061036.194296-1-peter.senna@linux.intel.com>
 <20241216082504.6687-1-peter.senna@linux.intel.com>
 <20241216082504.6687-2-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216082504.6687-2-peter.senna@linux.intel.com>
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

On Mon, Dec 16, 2024 at 09:25:02AM +0100, Peter Senna Tschudin wrote:
> Introduces the igt_facts library, designed to collect and track system
> and GPU-related facts during test execution. It provides insights into
> the system state before and after running tests and highlights changes.
> 
> Facts collected:
> 
>  - GPUs on PCI bus: 'hardware PCI bus' 'GPU name'
>  - Associations between PCI GPU and DRM card: 'PCI bus': 'card number'
>  - Kernel taints: 'true' or 'false'
>  - GPU kernel modules loaded: 'driver name'
> 
> To use igt_facts, include "igt_facts.h", then:
> 
>  1. Add a call to igt_facts_lists_init()
>  2. Add calls to igt_facts(last_test) before each test and after
>     running the last test.
> 
> The argument should be NULL or a string with the name of the test:
> 
>  - The first call to igt_facts() will print the facts present
>    "before any test"
>  - Subsequent calls will print only changes to facts if any.
> 
> Here is an example output of using igt_facts when integrated
> with igt_runner. Lines containing '[FACT ' were printed by calls
> to igt_facts():
> 
>  [229.606139] [FACT before any test] new: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e20b Intel Battlemage (Gen20)
>  [229.606305] [FACT before any test] new: kernel.is_tainted.taint_warn: true
>  [229.608841] [001/267] (600s left) xe_module_load (load)
>  [229.641224] Starting subtest: load
>  [230.613328] Subtest load: SUCCESS (0.973s)
>  [230.678868] [FACT xe_module_load (load)] new: hardware.pci.drm_card_at_addr.0000:03:00.0: card0
>  [230.680801] [FACT xe_module_load (load)] new: kernel.kmod_is_loaded.xe: true
> 
> Unit testing for igt_facts is located at lib/tests/igt_facts.c. Run it
> locally with `meson test -C build`.
> 
> CC: Helen Koike <helen.koike@collabora.com>
> CC: Jani Nikula <jani.nikula@linux.intel.com>
> CC: Jani Saarinen <jani.saarinen@intel.com>
> CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> CC: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> CC: Maíra Canal <mcanal@igalia.com>
> CC: Melissa Wen <mwen@igalia.com>
> CC: Petri Latvala <adrinael@adrinael.net>
> CC: Rob Clark <robdclark@chromium.org>
> CC: Ryszard Knop <ryszard.knop@intel.com>
> CC: Swati Sharma <swati2.sharma@intel.com>
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> CC: dominik.karol.piatkowski@intel.com
> CC: himal.prasad.ghimiray@intel.com
> CC: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> CC: katarzyna.piecielska@intel.com
> CC: luciano.coelho@intel.com
> CC: nirmoy.das@intel.com
> CC: stuart.summers@intel.com
> Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  lib/igt_facts.c       | 779 ++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_facts.h       |  47 +++
>  lib/meson.build       |   1 +
>  lib/tests/igt_facts.c |  18 +
>  lib/tests/meson.build |   1 +
>  5 files changed, 846 insertions(+)
>  create mode 100644 lib/igt_facts.c
>  create mode 100644 lib/igt_facts.h
>  create mode 100644 lib/tests/igt_facts.c
> 
> diff --git a/lib/igt_facts.c b/lib/igt_facts.c
> new file mode 100644
> index 000000000..2e04a7c86
> --- /dev/null
> +++ b/lib/igt_facts.c
> @@ -0,0 +1,779 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <ctype.h>
> +#include <libudev.h>
> +#include <stdio.h>
> +#include <sys/time.h>
> +#include <time.h>
> +
> +#include "igt_core.h"
> +#include "igt_device_scan.h"
> +#include "igt_facts.h"
> +#include "igt_kmod.h"
> +#include "igt_list.h"
> +#include "igt_taints.h"
> +
> +static struct igt_list_head igt_facts_list_drm_card_head;
> +static struct igt_list_head igt_facts_list_kmod_head;
> +static struct igt_list_head igt_facts_list_ktaint_head;
> +static struct igt_list_head igt_facts_list_pci_gpu_head;
> +
> +static const char *kmod_fact = "kernel.kmod_is_loaded"; /* true or false */
> +static const char *ktaint_fact = "kernel.is_tainted"; /* name: taint_warn */
> +static const char *pci_gpu_fact = "hardware.pci.gpu_at_addr"; /*id model */
> +static const char *drm_card_fact = "hardware.pci.drm_card_at_addr"; /* cardX */
> +
> +/* There is another module list at lib/drmtest.c. We can't use it here because
> + * it's a static list. The drmtest list seems to have a different goal and
> + * trying a merge may not work well.
> + */
> +static const char * const igt_fact_kmod_list[] = {
> +	"amdgpu",
> +	"i915",
> +	"msm",
> +	"nouveau", /* Not on lib/drmtest.c */
> +	"panfrost",
> +	"radeon", /* Not on lib/drmtest.c */
> +	"v3d",
> +	"vc4",
> +	"vgem",
> +	"vmwgfx",
> +	"xe",
> +	"\0"
> +};
> +
> +struct igt_facts_config igt_facts_config = {
> +	.disable_udev = false,
> +};
> +
> +/**
> + * igt_facts_lists_init:
> + *
> + * Initialize igt_facts linked lists.
> + *
> + * Returns: void
> + */
> +void igt_facts_lists_init(void)
> +{
> +	IGT_INIT_LIST_HEAD(&igt_facts_list_drm_card_head);
> +	IGT_INIT_LIST_HEAD(&igt_facts_list_kmod_head);
> +	IGT_INIT_LIST_HEAD(&igt_facts_list_ktaint_head);
> +	IGT_INIT_LIST_HEAD(&igt_facts_list_pci_gpu_head);
> +}
> +
> +/**
> + * igt_facts_log:
> + * @last_test: name of the test that triggered the fact
> + * @name: name of the fact
> + * @new_value: new value of the fact
> + * @old_value: old value of the fact
> + *
> + * Reports fact changes:
> + * - new fact: if old_value is NULL and new_value is not NULL
> + * - deleted fact: if new_value is NULL and old_value is not NULL
> + * - changed fact: if new_value is different from old_value
> + *
> + * Returns: void
> + */
> +static void igt_facts_log(const char *last_test, const char *name,
> +			  const char *new_value, const char *old_value)
> +{
> +	struct timespec uptime_ts;
> +	char *uptime = NULL;
> +	const char *before_tests = "before any test";
> +
> +	if (old_value == NULL && new_value == NULL)
> +		return;
> +
> +	if (clock_gettime(CLOCK_BOOTTIME, &uptime_ts) != 0)
> +		return;
> +
> +	asprintf(&uptime,
> +		 "%ld.%06ld",
> +		 uptime_ts.tv_sec,
> +		 uptime_ts.tv_nsec / 1000);
> +
> +	/* New fact */
> +	if (old_value == NULL && new_value != NULL) {
> +		igt_info("[%s] [FACT %s] new: %s: %s\n",
> +			 uptime,
> +			 last_test ? last_test : before_tests,
> +			 name,
> +			 new_value);
> +		goto out;
> +	}
> +
> +	/* Update fact */
> +	if (old_value != NULL && new_value != NULL) {
> +		igt_info("[%s] [FACT %s] changed: %s: %s -> %s\n",
> +			 uptime,
> +			 last_test ? last_test : before_tests,
> +			 name,
> +			 old_value,
> +			 new_value);
> +		goto out;
> +	}
> +
> +	/* Deleted fact */
> +	if (old_value != NULL && new_value == NULL) {
> +		igt_info("[%s] [FACT %s] deleted: %s: %s\n",
> +			 uptime,
> +			 last_test ? last_test : before_tests,
> +			 name,
> +			 old_value);
> +		goto out;
> +	}
> +
> +out:
> +	free(uptime);
> +}
> +
> +/**
> + * igt_facts_list_get:
> + * @name: name of the fact to be added
> + * @head: head of the list
> + *
> + * Get a fact from the list.
> + *
> + * Returns: pointer to the fact if found, NULL otherwise
> + *
> + */
> +static igt_fact *igt_facts_list_get(const char *name,
> +				    struct igt_list_head *head)
> +{
> +	igt_fact *fact = NULL;
> +
> +	if (igt_list_empty(head))
> +		return NULL;
> +
> +	igt_list_for_each_entry(fact, head, link) {
> +		if (strcmp(fact->name, name) == 0)
> +			return fact;
> +	}
> +	return NULL;
> +}
> +
> +/**
> + * igt_facts_list_del:
> + * @name: name of the fact to be added
> + * @head: head of the list
> + * @last_test: name of the last test
> + * @log: bool indicating if the delete operation should be logged
> + *
> + * Delete a fact from the list.
> + *
> + * Returns: bool indicating if fact was deleted from the list
> + *
> + */
> +static bool igt_facts_list_del(const char *name,
> +			       struct igt_list_head *head,
> +			       const char *last_test,
> +			       bool log)
> +{
> +	igt_fact *fact = NULL;
> +
> +	if (igt_list_empty(head))
> +		return false;
> +
> +	igt_list_for_each_entry(fact, head, link) {
> +		if (strcmp(fact->name, name) == 0) {
> +			if (log)
> +				igt_facts_log(last_test, fact->name,
> +					      NULL, fact->value);
> +
> +			igt_list_del(&fact->link);
> +			free(fact->name);
> +			free(fact->value);
> +			free(fact->last_test);
> +			free(fact);
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
> +/**
> + * igt_facts_list_add:
> + * @name: name of the fact to be added
> + * @value: value of the fact to be added
> + * @last_test: name of the last test
> + * @head: head of the list
> + *
> + * Returns: bool indicating if fact was added to the list
> + *
> + */
> +static bool igt_facts_list_add(const char *name,
> +			       const char *value,
> +			       const char *last_test,
> +			       struct igt_list_head *head)
> +{
> +	igt_fact *new_fact = NULL, *old_fact = NULL;
> +	bool logged = false;
> +
> +	if (name == NULL || value == NULL)
> +		return false;
> +
> +	old_fact = igt_facts_list_get(name, head);
> +	if (old_fact) {
> +		if (strcmp(old_fact->value, value) == 0) {
> +			old_fact->present = true;
> +			return false;
> +		}
> +		igt_facts_log(last_test, name, value, old_fact->value);
> +		logged = true;
> +		igt_facts_list_del(name, head, last_test, false);
> +	}
> +
> +	new_fact = malloc(sizeof(igt_fact));
> +	if (new_fact == NULL)
> +		return false;
> +
> +	new_fact->name = strdup(name);
> +	new_fact->value = strdup(value);
> +	new_fact->last_test = last_test ? strdup(last_test) : NULL;
> +	new_fact->present = true;
> +
> +	if (!logged)
> +		igt_facts_log(last_test, name, value, NULL);
> +
> +	igt_list_add(&new_fact->link, head);
> +
> +	return true;
> +}
> +
> +/**
> + * igt_facts_list_mark:
> + * @head: head of the list
> + *
> + * Mark all facts in the list as not present. Opted for the mark and sweep
> + * design pattern due to its simplicity and efficiency.
> + *
> + * Returns: void
> + */
> +static void igt_facts_list_mark(struct igt_list_head *head)
> +{
> +	igt_fact *fact = NULL;
> +
> +	if (igt_list_empty(head))
> +		return;
> +
> +	igt_list_for_each_entry(fact, head, link)
> +		fact->present = false;
> +}
> +
> +/**
> + * igt_facts_list_sweep:
> + * @head: head of the list
> + * @last_test: name of the last test
> + *
> + * Sweep the list and delete all facts that are not present. Opted for the mark
> + * and sweep design pattern due to its simplicity and efficiency.
> + *
> + * Returns: void
> + */
> +static void igt_facts_list_sweep(struct igt_list_head *head,
> +				 const char *last_test)
> +{
> +	igt_fact *fact = NULL, *tmp = NULL;
> +
> +	if (igt_list_empty(head))
> +		return;
> +
> +	igt_list_for_each_entry_safe(fact, tmp, head, link)
> +		if (!fact->present)
> +			igt_facts_list_del(fact->name, head, last_test, true);
> +}
> +
> +/**
> + * igt_facts_list_mark_and_sweep:
> + * @head: head of the list
> + *
> + * Clean up the list using mark and sweep. Opted for the mark and sweep
> + * design pattern due to its simplicity and efficiency.
> + *
> + * Returns: void
> + */
> +static void igt_facts_list_mark_and_sweep(struct igt_list_head *head)
> +{
> +	igt_facts_list_mark(head);
> +	igt_facts_list_sweep(head, NULL);
> +}
> +
> +/**
> + * igt_facts_are_all_lists_empty:
> + *
> + * Returns true if all lists are empty. Used by the tool lsfacts.
> + *
> + * Returns: bool
> + */
> +bool igt_facts_are_all_lists_empty(void)
> +{
> +	return igt_list_empty(&igt_facts_list_drm_card_head) &&
> +	       igt_list_empty(&igt_facts_list_kmod_head) &&
> +	       igt_list_empty(&igt_facts_list_ktaint_head) &&
> +	       igt_list_empty(&igt_facts_list_pci_gpu_head);
> +}
> +
> +/**
> + * igt_facts_scan_pci_gpus:
> + * @last_test: name of the last test
> + *
> + * This function scans the pci bus for gpus using udev. It uses
> + * igt_facts_list_mark(), igt_facts_list_add() and igt_facts_list_sweep() to
> + * update igt_facts_list_pci_gpu_head.
> + *
> + * Returns: void
> + */
> +static void igt_facts_scan_pci_gpus(const char *last_test)
> +{
> +	static struct igt_list_head *head = &igt_facts_list_pci_gpu_head;
> +	struct udev *udev = NULL;
> +	struct udev_enumerate *enumerate = NULL;
> +	struct udev_list_entry *devices, *dev_list_entry;
> +	struct igt_device_card card;
> +	char pcistr[10];
> +	int ret;
> +	char *factname = NULL;
> +	char *factvalue = NULL;
> +
> +	if (igt_facts_config.disable_udev)
> +		return; /* Intentinally silent */
> +
> +	udev = udev_new();
> +	if (!udev) {
> +		igt_warn("Failed to create udev context\n");
> +		igt_facts_config.disable_udev = true;
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
> +	ret = udev_enumerate_add_match_property(enumerate,
> +						"PCI_CLASS",
> +						"30000");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = udev_enumerate_add_match_property(enumerate,
> +						"PCI_CLASS",
> +						"38000");
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
> +	igt_facts_list_mark(head);
> +
> +	udev_list_entry_foreach(dev_list_entry, devices) {
> +		const char *path;
> +		struct udev_device *udev_dev;
> +		struct udev_list_entry *entry;
> +		char *model = NULL;
> +		char *codename = NULL;
> +		igt_fact *old_fact = NULL;
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
> +				model = strdup(value);
> +			else if (!strcmp(name, "PCI_ID"))
> +				igt_assert_eq(sscanf(value, "%hx:%hx",
> +						     &card.pci_vendor,
> +						     &card.pci_device), 2);
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
> +		asprintf(&factname, "%s.%s", pci_gpu_fact, path);
> +		asprintf(&factvalue,
> +			"%s %s %s",
> +			pcistr,
> +			codename ? codename : "",
> +			model ? model : "");
> +
> +		/**
> +		 * Loading and unloading the kmod may change the human
> +		 * readeable string in value. Do not change value if the
> +		 * pci id is the same.
> +		 */
> +		old_fact = igt_facts_list_get(factname, head);
> +		if (old_fact && strncmp(old_fact->value, factvalue, 9) == 0)
> +			old_fact->present = true;
> +		else
> +			igt_facts_list_add(factname, factvalue, last_test, head);
> +
> +		free(codename);
> +		free(model);
> +		free(factname);
> +		free(factvalue);
> +		udev_device_unref(udev_dev);
> +	}
> +
> +	igt_facts_list_sweep(head, last_test);
> +
> +out:
> +	udev_enumerate_unref(enumerate);
> +	udev_unref(udev);
> +}
> +
> +/**
> + * igt_facts_scan_pci_drm_cards:
> + * @last_test: name of the last test
> + *
> + * This function scans the pci bus for drm cards using udev. It uses the
> + * igt_facts_list_mark(), igt_facts_list_add() and igt_facts_list_sweep() to
> + * update igt_facts_list_drm_card_head.
> + *
> + * Returns: void
> + */
> +static void igt_facts_scan_pci_drm_cards(const char *last_test)
> +{
> +	static struct igt_list_head *head = &igt_facts_list_drm_card_head;
> +	struct udev *udev = NULL;
> +	struct udev_enumerate *enumerate = NULL;
> +	struct udev_list_entry *devices, *dev_list_entry;
> +	int ret;
> +	char *factname = NULL;
> +	char *factvalue = NULL;
> +
> +	if (igt_facts_config.disable_udev)
> +		return; /* Intentinally silent */
> +
> +	udev = udev_new();
> +	if (!udev) {
> +		igt_warn("Failed to create udev context\n");
> +		igt_facts_config.disable_udev = true;
> +		return;
> +	}
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
> +	igt_facts_list_mark(head);
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
> +		if (strncmp(drm_name, "card", 4) != 0 ||
> +		    strchr(drm_name, '-') != NULL) {
> +			udev_device_unref(drm_dev);
> +			continue;
> +		}
> +
> +		/* Get the pci address of the gpu associated with the drm_dev*/
> +		pci_dev = udev_device_get_parent_with_subsystem_devtype(drm_dev,
> +									"pci",
> +									NULL);
> +		if (pci_dev) {
> +			pci_addr = udev_device_get_sysattr_value(pci_dev,
> +								 "address");
> +			if (!pci_addr)
> +				pci_addr = udev_device_get_sysname(pci_dev);
> +		} else {
> +			/* Some GPUs are platform devices. Ignore them. */
> +			pci_addr = NULL;
> +			udev_device_unref(drm_dev);
> +			continue;
> +		}
> +
> +		asprintf(&factname, "%s.%s", drm_card_fact, pci_addr);
> +		asprintf(&factvalue, "%s", drm_name);
> +
> +		igt_facts_list_add(factname, factvalue, last_test, head);
> +
> +		free(factname);
> +		free(factvalue);
> +		udev_device_unref(drm_dev);
> +	}
> +
> +	igt_facts_list_sweep(head, last_test);
> +
> +out:
> +	udev_enumerate_unref(enumerate);
> +	udev_unref(udev);
> +}
> +
> +/**
> + * igt_facts_scan_kernel_taints:
> + * @last_test: name of the last test
> + *
> + * This function scans for kernel taints using igt_kernel_tainted() and
> + * igt_explain_taints(). It will cut off the explanation keeping only the
> + * taint name.
> + *
> + * Returns: void
> + */
> +static void igt_facts_scan_kernel_taints(const char *last_test)
> +{
> +	static struct igt_list_head *head = &igt_facts_list_ktaint_head;
> +	unsigned long taints = 0;
> +	const char *reason = NULL;
> +	char *taint_name = NULL;
> +	char *fact_name = NULL;
> +
> +	taints = igt_kernel_tainted(&taints);
> +	/* For testing, set all bits to 1
> +	 * taints = 0xFFFFFFFF;
> +	 */
> +
> +	igt_facts_list_mark(head);
> +
> +	while ((reason = igt_explain_taints(&taints)) != NULL) {
> +		/* Cut at the ':' to get only the taint name */
> +		taint_name = strtok(strdup(reason), ":");
> +		if (!taint_name)
> +			continue;
> +
> +		/* Lowercase taint_name */
> +		for (int i = 0; taint_name[i]; i++)
> +			taint_name[i] = tolower(taint_name[i]);
> +
> +		asprintf(&fact_name, "%s.%s", ktaint_fact, taint_name);
> +		igt_facts_list_add(fact_name, "true", last_test, head);
> +
> +		free(taint_name);
> +		free(fact_name);
> +	}
> +
> +	igt_facts_list_sweep(head, last_test);
> +}
> +
> +/**
> + * igt_facts_scan_kernel_loaded_kmods:
> + * @last_test: name of the last test
> + *
> + * This function scans for loaded kmods using igt_fact_kmod_list and
> + * igt_kmod_is_loaded().
> + *
> + * Returns: void
> + */
> +static void igt_facts_scan_kernel_loaded_kmods(const char *last_test)
> +{
> +	static struct igt_list_head *head = &igt_facts_list_kmod_head;
> +	char *name = NULL;
> +
> +	igt_facts_list_mark(head);
> +
> +	/* Iterate over igt_fact_kmod_list[] until the element contains "\0" */
> +	for (int i = 0; strcmp(igt_fact_kmod_list[i], "\0") != 0; i++) {
> +		asprintf(&name, "%s.%s", kmod_fact, igt_fact_kmod_list[i]);
> +		if (igt_kmod_is_loaded(igt_fact_kmod_list[i]))
> +			igt_facts_list_add(name, "true", last_test, head);
> +
> +		free(name);
> +	}
> +
> +	igt_facts_list_sweep(head, last_test);
> +}
> +
> +/**
> + * igt_facts:
> + * @last_test: name of the last test
> + *
> + * Call this function where you want to gather and report facts.
> + *
> + * Returns: void
> + */
> +void igt_facts(const char *last_test)
> +{
> +	igt_facts_scan_pci_gpus(last_test);
> +	igt_facts_scan_pci_drm_cards(last_test);
> +	igt_facts_scan_kernel_taints(last_test);
> +	igt_facts_scan_kernel_loaded_kmods(last_test);
> +
> +	fflush(stdout);
> +	fflush(stderr);
> +}
> +
> +/*
> + * Testing
> + *
> + * Defined here to keep most of the functions static
> + *
> + */
> +
> +/**
> + * igt_facts_test_add_get:
> + * @head: head of the list
> + *
> + * Tests igt_facts_list_add and igt_facts_list_get.
> + *
> + * Returns: void
> + */
> +static void igt_facts_test_add_get(struct igt_list_head *head)
> +{
> +	igt_fact *fact = NULL;
> +	bool ret;
> +	const char *name = "hardware.pci.gpu_at_addr.0000:00:02.0";
> +	const char *value = "8086:64a0 Intel Lunarlake (Gen20)";
> +	const char *last_test = NULL;
> +
> +	ret = igt_facts_list_add(name, value, last_test, head);
> +	igt_assert(ret == true);
> +
> +	/* Assert that there is one element in the linked list */
> +	igt_assert_eq(igt_list_length(head), 1);
> +
> +	/* Assert that the element in the linked list is the one we added */
> +	fact = igt_facts_list_get(name, head);
> +	igt_assert(fact != NULL);
> +	igt_assert_eq(strcmp(fact->name, name), 0);
> +	igt_assert_eq(strcmp(fact->value, value), 0);
> +	igt_assert(fact->present == true);
> +	igt_assert(fact->last_test == NULL);
> +}
> +
> +/**
> + * igt_facts_test_mark_and_sweep:
> + * @head: head of the list
> + *
> + * - Add 3 elements to the list and mark them as not present.
> + * - Update two of the elements and mark them as present.
> + * - Sweep the list and assert that
> + *   - Only the two updated elements are present
> + *   - The third element was deleted
> + *
> + * Returns: void
> + */
> +static void igt_facts_test_mark_and_sweep(struct igt_list_head *head)
> +{
> +	igt_fact *fact = NULL;
> +	const char *name1 = "hardware.pci.gpu_at_addr.0000:00:02.0";
> +	const char *value1 = "8086:64a0 Intel Lunarlake (Gen20)";
> +	const char *name2 = "hardware.pci.gpu_at_addr.0000:00:03.0";
> +	const char *value2 = "8086:64a1 Intel Lunarlake (Gen21)";
> +	const char *name3 = "hardware.pci.gpu_at_addr.0000:00:04.0";
> +	const char *value3 = "8086:64a2 Intel Lunarlake (Gen22)";
> +
> +	igt_facts_list_add(name1, value1, NULL, head);
> +	igt_facts_list_add(name2, value2, NULL, head);
> +	igt_facts_list_add(name3, value3, NULL, head);
> +
> +	igt_facts_list_mark(head);
> +
> +	igt_facts_list_add(name1, value1, NULL, head);
> +	igt_facts_list_add(name2, value2, NULL, head);
> +
> +	igt_facts_list_sweep(head, NULL);
> +
> +	/* Assert that there are two elements in the linked list */
> +	igt_assert_eq(igt_list_length(head), 2);
> +
> +	/* Assert that the two updated elements are present */
> +	fact = igt_facts_list_get(name1, head);
> +	igt_assert(fact != NULL);
> +	igt_assert(fact->present == true);
> +
> +	fact = igt_facts_list_get(name2, head);
> +	igt_assert(fact != NULL);
> +	igt_assert(fact->present == true);
> +
> +	/* Assert that the third element was deleted */
> +	fact = igt_facts_list_get(name3, head);
> +	igt_assert(fact == NULL);
> +}
> +
> +/**
> + * igt_facts_test:
> + *
> + * Main function for testing the igt_facts module
> + *
> + * Returns: bool indicating if the tests passed
> + */
> +void igt_facts_test(void)
> +{
> +	const char *last_test = "Unit Testing";
> +
> +	igt_facts_lists_init();
> +
> +	/* Assert that all lists are empty */
> +	igt_assert(igt_list_empty(&igt_facts_list_kmod_head));
> +	igt_assert(igt_list_empty(&igt_facts_list_ktaint_head));
> +	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head));
> +	igt_assert(igt_list_empty(&igt_facts_list_drm_card_head));
> +
> +	/* Assert that add and get work. Will add one element to the list */
> +	igt_facts_test_add_get(&igt_facts_list_pci_gpu_head);
> +
> +	/* Assert that igt_facts_list_mark_and_sweep() cleans up the list */
> +	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == false);
> +	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
> +	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == true);
> +
> +	/* Test the mark and sweep pattern used to delete elements
> +	 * from the list
> +	 */
> +	igt_facts_test_mark_and_sweep(&igt_facts_list_pci_gpu_head);
> +
> +	/* Clean up the list and call igt_facts(). This should not crash */
> +	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
> +	igt_facts(last_test);
> +}
> diff --git a/lib/igt_facts.h b/lib/igt_facts.h
> new file mode 100644
> index 000000000..e96f88083
> --- /dev/null
> +++ b/lib/igt_facts.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef IGT_FACTS_H
> +#define IGT_FACTS_H
> +
> +#include <stdbool.h>
> +
> +#include "igt_list.h"
> +
> +/* igt_fact:
> + * @name: name of the fact
> + * @value: value of the fact
> + * @last_test: name of the test that triggered the fact
> + * @present: bool indicating if fact is present. Used for deleting facts from
> + * the list.
> + * @link: link to the next fact
> + *
> + * A fact is a piece of information that can be used to determine the state of
> + * the system.
> + *
> + */
> +typedef struct {
> +	char *name;
> +	char *value;
> +	char *last_test;
> +	bool present; /* For mark and sweep */
> +	struct igt_list_head link;
> +} igt_fact;
> +
> +/* igt_facts configuration:
> + * @enabled: bool indicating if igt_facts is enabled
> + * @disable_udev: bool indicating if udev is disabled
> + */
> +struct igt_facts_config {
> +	bool enabled;
> +	bool disable_udev;
> +};
> +extern struct igt_facts_config igt_facts_config;
> +
> +void igt_facts_lists_init(void);
> +void igt_facts(const char *last_test);
> +bool igt_facts_are_all_lists_empty(void);
> +void igt_facts_test(void); /* For unit testing only */
> +
> +#endif /* IGT_FACTS_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 640513e6c..2840a269a 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -18,6 +18,7 @@ lib_sources = [
>  	'i915/i915_crc.c',
>  	'igt_collection.c',
>  	'igt_color_encoding.c',
> +	'igt_facts.c',
>  	'igt_crc.c',
>  	'igt_debugfs.c',
>  	'igt_device.c',
> diff --git a/lib/tests/igt_facts.c b/lib/tests/igt_facts.c
> new file mode 100644
> index 000000000..3cb8d1069
> --- /dev/null
> +++ b/lib/tests/igt_facts.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <stdbool.h>
> +
> +#include "igt_core.h"
> +#include "igt_facts.h"
> +
> +/* Tests are not defined here so we can keep most of the functions static */
> +
> +igt_simple_main
> +{
> +	igt_info("Running igt_facts_test\n");
> +
> +	igt_facts_test();
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
> -- 
> 2.34.1
> 

No blocker from my side to this patch:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

