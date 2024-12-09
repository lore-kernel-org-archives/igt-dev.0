Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E085E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 10:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302E410E6C4;
	Mon,  9 Dec 2024 10:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQFwm8VS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE39210E6C4
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 10:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733741621; x=1765277621;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WRyIzGGw+5CbOgyA7szRc7OkKCQHDLH1UVUDkQ37xvs=;
 b=EQFwm8VSHcG+T/OWni50/aWmAbDci0lIfOOnV3aoGjCg0zsIwKtDNR90
 Zk0+kbiXwYlfgfvCBMHaVqMiGJj4oiouWHDL8ikJEed4/3D1POJG5oGG1
 CfEou0t9yb3SBnxJgCX2Uakdqy/6uWN2j+zfn7iaugwU+7qiHJqB+3vgs
 P7ibBGc46wmg+9oBHV62l41hGE4FLP3NP7/SkZkSXLONDZxck4lhqb/0g
 nROVO9cIcOZ1v+aro/WW1V7Dtb5xD49zGZI2C9nychw5IxfCeYuY1L51Q
 D/Avit9utxzglPW478gzAkx/sAYatcioy/7D6WQNDfZwJjWYqV6abHx7q g==;
X-CSE-ConnectionGUID: U6WePpkbTi29lAZv7/hPfQ==
X-CSE-MsgGUID: YK6iYWfZScS2ZNs8mp29Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37709255"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="37709255"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 02:53:41 -0800
X-CSE-ConnectionGUID: MUMCFRSdQIWN0qqC1lRPaw==
X-CSE-MsgGUID: DjsMqmVwQDy2juDR7jk/8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="95494973"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 02:53:37 -0800
Date: Mon, 9 Dec 2024 11:53:35 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 luciano.coelho@intel.com, nirmoy.das@intel.com,
 stuart.summers@intel.com, himal.prasad.ghimiray@intel.com,
 dominik.karol.piatkowski@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v11] igt-runner fact checking
Message-ID: <20241209105335.a533h5gwjiq6rsfj@zkempczy-mobl2>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <b2da3859-8450-465d-b62d-7ddef7698f0d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2da3859-8450-465d-b62d-7ddef7698f0d@linux.intel.com>
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

On Thu, Dec 05, 2024 at 11:51:43AM +0100, Peter Senna Tschudin wrote:
> When using igt-runner, collect facts before each test and after the
> last test, and report when facts change. The facts are:
>  - GPUs on PCI bus: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e20b Intel Battlemage (Gen20)
>  - Associations between PCI GPU and DRM card: hardware.pci.drm_card_at_addr.0000:03:00.0: card1
>  - Kernel taints: kernel.is_tainted.taint_warn: true
>  - GPU kernel modules loaded: kernel.kmod_is_loaded.i915: true
> 
> This change imposes little execution overhead and adds just a few
> lines of logging. The facts will be printed on normal igt-runner
> output. Here is a real example from our CI shwoing
> hotreplug-lateclose changing the DRM card number and tainting the
> kernel on the abort path:
> 
>  [245.316207] [056/121] (816s left) core_hotunplug (hotreplug-lateclose)
>  [245.383596] Starting subtest: hotreplug-lateclose
>  [249.843361] Aborting: Lockdep not active
>  [249.858249] [FACT core_hotunplug (hotreplug-lateclose)] changed: hardware.pci.drm_card_at_addr.0000:00:02.0: card0 -> card1
>  [249.858392] [FACT core_hotunplug (hotreplug-lateclose)] new: kernel.is_tainted.taint_die: true
>  [249.859075] Closing watchdogs
> 
> CC: Ryszard Knop <ryszard.knop@intel.com>
> CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> CC: luciano.coelho@intel.com
> CC: nirmoy.das@intel.com
> CC: stuart.summers@intel.com
> CC: himal.prasad.ghimiray@intel.com
> CC: dominik.karol.piatkowski@intel.com
> CC: katarzyna.piecielska@intel.com
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

According to our offline discussion today according acceptance criteria
from my pov:

- split patch to library, tool and test part (3 commits + cover letter)
- add switch (set it to disabled by default) to enable the facts collection
  by CI, it can selectively enable your feature and this will give the
  time to warm up. I have in my mind how long I've been working on bug
  in udev scanning race (commit: a23e8aed0b54018339647d0817267431bd2b7075)
- get r-b from CI folks (+Ryszard in cc). According to my request they
  will need to enable using facts in CI. I don't know is any other
  vendor interested with using facts (I guess on embedded likely not)
  because there was no feedback from them, but I assume we don't want
  to break their CI if there will be any issue with facts. I prefer
  to be polite in meaning - "there's new code, it's hard to say it
  is bug free, so we're allow you to enable this if you want. In the
  meantime we'll be using this in our CI so that's will give the time
  to warm it up". I have no such resistance in tests, sometimes in library
  because there's more samples which might catch this on premerge. For
  runner there's only one sample per machine (unless it will reboot)
  but this is too small set to me. Selective enabling will give us
  more samples in the some time period in which at least we won't break
  other vendors CI.
- there's minor issue I'm asking people when I'm doing review for them
  - use /* */ comments instead of //.

Ping me when you'll address all of my requests.

--
Zbigniew

> ---
> v11:
>  - fix typo
> 
> v10:
>  - fix memory leaks from asprintf (Thank you Dominik Karol!)
>  - fix comments for consistency (Thank you Dominik Karol!)
> 
> v9:
>  - do not report new hardware when loading/unloading kmod changes the
>    string of the GPU name. I accidentally reintroduced this issue
>    when refactoring to use linked lists.
>  - add tools/lsfacts: 9 lines of code that print either the facts or
>    that no facts were found.
>  - fix code comments describing functions
>  - fix white space issues
> 
> v8:
>  - fix white space issues
> 
> v7:
>  - refactor to use linked lists provided by igt_lists
>  - Added function arguments to code comments
>  - updated commit message
> 
> v6:
>  - sort includes in igt_facts.c alphabetically
>  - add facts for kernel taints using igt_kernel_tainted() and
>    igt_explain_taints()
> 
> v5:
>  - fix the broken patch format from v4
> 
> v4:
>  - fix a bug on delete_fact()
>  - drop glib and calls to g_ functions
>  - change commit message to indicate that report only on fact changes
>  - use consistent format for reporting changes
>  - fix SPDX header format
> 
> v3:
>  - refreshed commit message
>  - changed format SPDX string
>  - removed license text
>  - replace last_test assignment when null by two ternary operators
>  - added function descriptions following example found elsewhere in
>    the code
>  - added igt_assert to catch failures to realloc()
> 
> v2:
>  - add lib/tests/igt_facts.c for basic unit testing
>  - bugfix: do not report a new gpu when the driver changes the gpu name
>  - bugfix: do not report the pci_id twice on the gpu name
> 
>  lib/igt_facts.c       | 755 ++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_facts.h       |  47 +++
>  lib/meson.build       |   1 +
>  lib/tests/igt_facts.c |  15 +
>  lib/tests/meson.build |   1 +
>  runner/executor.c     |  10 +
>  tools/lsfacts.c       |  25 ++
>  tools/meson.build     |   1 +
>  8 files changed, 855 insertions(+)
>  create mode 100644 lib/igt_facts.c
>  create mode 100644 lib/igt_facts.h
>  create mode 100644 lib/tests/igt_facts.c
>  create mode 100644 tools/lsfacts.c
> 
> diff --git a/lib/igt_facts.c b/lib/igt_facts.c
> new file mode 100644
> index 000000000..4749d3417
> --- /dev/null
> +++ b/lib/igt_facts.c
> @@ -0,0 +1,755 @@
> +// SPDX-License-Identifier: MIT
> +// Copyright © 2024 Intel Corporation
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
> +	// Assert that there is one element in the linked list
> +	igt_assert_eq(igt_list_length(head), 1);
> +
> +	// Assert that the element in the linked list is the one we added
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
> +	// Assert that there are two elements in the linked list
> +	igt_assert_eq(igt_list_length(head), 2);
> +
> +	// Assert that the two updated elements are present
> +	fact = igt_facts_list_get(name1, head);
> +	igt_assert(fact != NULL);
> +	igt_assert(fact->present == true);
> +
> +	fact = igt_facts_list_get(name2, head);
> +	igt_assert(fact != NULL);
> +	igt_assert(fact->present == true);
> +
> +	// Assert that the third element was deleted
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
> index 000000000..11eeae52a
> --- /dev/null
> +++ b/lib/igt_facts.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <stdbool.h>
> +
> +#include "igt_list.h"
> +
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
> +const char *igt_fact_kmod_list[] = {
> +	"amdgpu",
> +	"i915",
> +	"nouveau",
> +	"radeon",
> +	"xe",
> +	"\0"
> +};
> +
> +const char *kmod_fact     = "kernel.kmod_is_loaded"; /* true or false */
> +const char *ktaint_fact   = "kernel.is_tainted"; /* taint name: taint_warn */
> +const char *pci_gpu_fact  = "hardware.pci.gpu_at_addr"; /* id vendor model */
> +const char *drm_card_fact = "hardware.pci.drm_card_at_addr"; /* cardX */
> +
> +void igt_facts_lists_init(void);
> +void igt_facts(const char *last_test);
> +bool igt_facts_are_all_lists_empty(void);
> +void igt_facts_test(void); /* For unit testing only */
> diff --git a/lib/meson.build b/lib/meson.build
> index c3556a921..c44ca2b5a 100644
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
> index 000000000..7fa9d0f22
> --- /dev/null
> +++ b/lib/tests/igt_facts.c
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: MIT
> +// Copyright © 2024 Intel Corporation
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
> diff --git a/runner/executor.c b/runner/executor.c
> index ac73e1dde..d1eca3c05 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -30,6 +30,7 @@
>  
>  #include "igt_aux.h"
>  #include "igt_core.h"
> +#include "igt_facts.h"
>  #include "igt_taints.h"
>  #include "igt_vec.h"
>  #include "executor.h"
> @@ -2306,6 +2307,9 @@ bool execute(struct execute_state *state,
>  	sigset_t sigmask;
>  	double time_spent = 0.0;
>  	bool status = true;
> +	char *last_test = NULL;
> +
> +	igt_facts_lists_init();
>  
>  	if (state->dry) {
>  		outf("Dry run, not executing. Invoke igt_resume if you want to execute.\n");
> @@ -2438,6 +2442,10 @@ bool execute(struct execute_state *state,
>  		int result;
>  		bool already_written = false;
>  
> +		/* Calls before running each test */
> +		igt_facts(last_test);
> +		last_test = entry_display_name(&job_list->entries[state->next]);
> +
>  		if (should_die_because_signal(sigfd)) {
>  			status = false;
>  			goto end;
> @@ -2526,6 +2534,8 @@ bool execute(struct execute_state *state,
>  			return execute(state, settings, job_list);
>  		}
>  	}
> +	/* Last call to collect facts after the last test runs */
> +	igt_facts(last_test);
>  
>  	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
>  		dprintf(timefd, "%f\n", timeofday_double());
> diff --git a/tools/lsfacts.c b/tools/lsfacts.c
> new file mode 100644
> index 000000000..10dee0317
> --- /dev/null
> +++ b/tools/lsfacts.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: MIT
> +// Copyright © 2024 Intel Corporation
> +
> +#include "igt.h"
> +#include "igt_facts.h"
> +
> +/**
> + * SECTION:lsfacts
> + * @short_description: lsfacts
> + * @title: lsfacts
> + * @include: lsfacts.c
> + *
> + * # lsfacts
> + *
> + * Scan for igt-facts and print them on screen. Indicate if no facts are found.
> + */
> +int main(int argc, char *argv[])
> +{
> +	igt_facts_lists_init();
> +
> +	igt_facts("lsfacts");
> +
> +	if (igt_facts_are_all_lists_empty())
> +		igt_info("No facts found...\n");
> +}
> diff --git a/tools/meson.build b/tools/meson.build
> index 48c9a4b50..ff1b0ef90 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -42,6 +42,7 @@ tools_progs = [
>  	'intel_gem_info',
>  	'intel_gvtg_test',
>  	'dpcd_reg',
> +	'lsfacts',
>  	'lsgpu',
>  	'power',
>  ]
> -- 
> 2.34.1
> 
