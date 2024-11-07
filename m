Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212D0D5AE6C
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 06:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD51D10E255;
	Thu,  7 Nov 2024 06:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8F6HsKI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C341910E255
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 06:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730962631; x=1762498631;
 h=message-id:date:mime-version:from:subject:in-reply-to:to:
 cc:content-transfer-encoding;
 bh=RBmClwvUGenxcOAXhyPsjzoQu5a+Y8rLkdT1FxgWsXk=;
 b=l8F6HsKI6RYJkT8i7osjKlsTSYmJvWmmRo7nE5h5fx3A10RWeu1IO2jE
 CGTRvJKcNksp6mgx+Dkj4qfWSMKyGTK1RAnpYgk7nENK6Jv+GjFQeGKUK
 gUG9mRjwu/LfdQu5RWlclu9boGeYnjOQjIvkKMHudTXTANITTMssMORBo
 gpwBCC9YiTt6pIZfWK/YHSgVN/xWfKXOXFN4ZbO5H+QRtr2X5x2QDMy+M
 aZbOfR70jnEeBaigIkVKY7/Aeoe3x/BOm7AoAdJXxq6evRwa1S1cLbWLu
 wnqK6DDlJM6gl6MXhoRIkUqXPZnidLCnB5T54Ty0ddQ4uKavm9dxkVhL8 w==;
X-CSE-ConnectionGUID: K3VSsFFRSVK7sW9XlrMA4Q==
X-CSE-MsgGUID: 2Z2nohSgSR2SicDaIaE/QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="48308190"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="48308190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 22:57:11 -0800
X-CSE-ConnectionGUID: Mki2N8wFQQqxPTCiNXqiFA==
X-CSE-MsgGUID: xq9O0ZELQPWTk39nyMIylA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="115772582"
Received: from ogreene-mobl1.amr.corp.intel.com (HELO [10.213.195.176])
 ([10.213.195.176])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 22:57:09 -0800
Message-ID: <0ef870a2-13ff-4984-bd2b-99be32626043@linux.intel.com>
Date: Thu, 7 Nov 2024 07:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t v3] igt-runner fact checking
Content-Language: en-US
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, luciano.coelho@intel.com
Content-Type: text/plain; charset=UTF-8
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

When using igt-runner, collect and report facts before each test and after the
last test:
 - GPUs on PCI bus: hardware.pci.gpu_at_addr.0000:03:00.0 = 8086:e20b Intel Battlemage (Gen20)
 - Associations between PCI GPU and DRM card: hardware.pci.drm_card_at_addr.0000:03:00.0 = card1
 - GPU kernel modules loaded: kernel.kmod_is_loaded.i915 = true

This change imposes little execution overhead and adds just a few lines of
logging. The facts will be printed on normal igt-runner output. Here is a real
example from our CI showing a problem: the test 'fbdev (eof)' loaded the amdgpu
module:

 [39.203551] Initializing watchdogs
 [39.203618]   /dev/watchdog0
 [39.214492] [FACT before any test] new hardware.pci.gpu_at_addr.0000:00:02.0 = 8086:7d55 Intel Meteorlake (Gen12) Meteor Lake-P [Intel Arc Graphics]
 [39.220845] [001/161] (960s left) i915_module_load (load)
 [39.288581] Starting subtest: load
 [41.638363] Subtest load: SUCCESS (2.350s)
 [41.667936] [FACT i915_module_load (load)] new hardware.pci.drm_card_at_addr.0000:00:02.0 = card0
 [41.668109] [FACT i915_module_load (load)] new kernel.kmod_is_loaded.i915 = true
 [41.674193] [002/161] (958s left) core_auth (basic-auth)
 ...
 [43.616975] [006/161] (956s left) fbdev (eof)
 [43.998204] Subtest eof: SKIP (0.000s)
 [44.023783] [FACT fbdev (eof)] new kernel.kmod_is_loaded.amdgpu = true

v3:
 - refreshed commit message
 - changed format SPDX string
 - removed license text
 - replace last_test assignment when null by two ternary operators
 - added function descriptions following example found elsewhere in the code
 - added igt_assert to catch failures to realloc()

v2:
 - add lib/tests/igt_facts.c for basic unit testing
 - bugfix: do not report a new gpu when the driver changes the gpu name
 - bugfix: do not report the pci_id twice on the gpu name

CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: luciano.coelho@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_facts.c       | 661 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_facts.h       |  33 +++
 lib/meson.build       |   1 +
 lib/tests/igt_facts.c |  16 +
 lib/tests/meson.build |   1 +
 runner/executor.c     |   9 +
 6 files changed, 721 insertions(+)
 create mode 100644 lib/igt_facts.c
 create mode 100644 lib/igt_facts.h
 create mode 100644 lib/tests/igt_facts.c

diff --git a/lib/igt_facts.c b/lib/igt_facts.c
new file mode 100644
index 000000000..65d54e30e
--- /dev/null
+++ b/lib/igt_facts.c
@@ -0,0 +1,661 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright © 2024 Intel Corporation */
+
+#include <stdio.h>
+#include <glib.h>
+
+#include <libudev.h>
+#include "igt_core.h"
+#include "igt_kmod.h"
+#include "igt_facts.h"
+#include "igt_device_scan.h"
+
+
+/**
+ * report_fact_change: prints changes using igt_info()
+ *
+ * Reports facts that are new, changed and deleted.
+ *
+ * Returns: void
+ */
+#define FACT_BEFORE_ANY_TEST "before any test"
+static void report_fact_change(igt_fact *fact, const char *new_value,
+			       const char *last_test, bool delete)
+{
+	struct timespec uptime_ts;
+	char *uptime = NULL;
+	bool changed = false;
+
+	if (clock_gettime(CLOCK_BOOTTIME, &uptime_ts) != 0)
+		return;
+
+	uptime = g_strdup_printf("%ld.%06ld",
+				 uptime_ts.tv_sec,
+				 uptime_ts.tv_nsec / 1000);
+
+	/* If delete is true, the fact was deleted */
+	if (delete) {
+		igt_info("[%s] [FACT %s] deleted %s = %s\n",
+			 uptime,
+			 last_test ? last_test : FACT_BEFORE_ANY_TEST,
+			 fact->name,
+			 fact->value);
+		return;
+	}
+
+	/* If new_value is NULL, it is a new fact */
+	if (new_value == NULL) {
+		igt_info("[%s] [FACT %s] new %s = %s\n",
+			 uptime,
+			 last_test ? last_test : FACT_BEFORE_ANY_TEST,
+			 fact->name,
+			 fact->value);
+		return;
+	}
+
+	/* Check if the value changed
+	 *
+	 * There is a corner case because the gpu driver can change the human
+	 * readeable strings. If the fact->name contains pci_gpu_fact, compare
+	 * just the first nine characters (pci_id).
+	 */
+	if (strstr(fact->name, pci_gpu_fact) != NULL) {
+		if (strncmp(fact->value, new_value, 9) != 0)
+			changed = true;
+	} else if (strcmp(fact->value, new_value) != 0)
+		changed = true;
+
+	if (changed) {
+		igt_info("[%s] [FACT %s] changed %s: %s -> %s\n",
+			 uptime, last_test, fact->name, fact->value, new_value);
+		changed = false;
+	}
+
+	g_free(uptime);
+}
+
+/**
+ * get_fact: Returns a fact from the list by name.
+ *
+ * Iterates over the list of facts and returns the first one with the same name.
+ * If no fact is found, returns NULL.
+ *
+ * Returns: igt_fact* or NULL
+ */
+static igt_fact *get_fact(igt_fact_list *list, const char *name)
+{
+	if (!list || list->facts == NULL || list->num_facts == 0)
+		return NULL;
+
+	for (int i = 0; i < list->num_facts; i++) {
+		if (list->facts[i].name == NULL)
+			continue;
+
+		if (strcmp(list->facts[i].name, name) == 0)
+			return &list->facts[i];
+	}
+	return NULL;
+}
+
+/**
+ * delete_fact: Deletes a fact from the list by name.
+ *
+ * Iterates over the list of facts and deletes the first one with the same name.
+ * Returns true if the fact was deleted, false otherwise.
+ *
+ * Returns: bool idicating if the fact was deleted
+ */
+static bool delete_fact(igt_fact_list *list, const char *name, const char *last_test)
+{
+	igt_fact *fact = NULL;
+	int i;
+
+	fact = get_fact(list, name);
+	if (fact == NULL)
+		return false;
+
+	/* Report the deletion */
+	report_fact_change(fact, NULL, last_test, true);
+
+	/* Move all facts after the one to be deleted one step back */
+	for (i = 0; i < list->num_facts; i++) {
+		if (strcmp(list->facts[i].name, name) == 0) {
+			g_free(list->facts[i].name);
+			g_free(list->facts[i].value);
+
+			for (int j = i; j < list->num_facts - 1; j++)
+				list->facts[j] = list->facts[j + 1];
+			break;
+		}
+	}
+	list->num_facts--;
+
+	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
+	igt_assert(list->facts != NULL);
+
+	return true;
+}
+
+/**
+ * set_fact: Adds a fact to the list.
+ *
+ * This is intended for the "new_list" that is created for being merged with the
+ * "list". It adds a new fact to the list. If the fact already exists, it
+ * returns false.
+ *
+ * Returns: bool indicating if the fact was added
+ */
+static bool set_fact(igt_fact_list *list, const char *name,
+		     const char *value, const char *last_test)
+{
+	igt_fact *fact = NULL;
+
+	/* Check that name and value are not null */
+	if (name == NULL || value == NULL)
+		return false;
+
+	fact = get_fact(list, name);
+	if (fact != NULL)
+		return false; /* Should not happen */
+
+	/* Add a new fact */
+	list->num_facts++;
+
+	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
+	igt_assert(list->facts != NULL);
+
+	list->facts[list->num_facts - 1].name = g_strdup(name);
+	list->facts[list->num_facts - 1].value = g_strdup(value);
+
+	if (last_test)
+		list->facts[list->num_facts - 1].last_test = g_strdup(last_test);
+	else
+		list->facts[list->num_facts - 1].last_test = NULL;
+
+	return true;
+}
+
+/**
+ * update_list: Updates the main list with new or different facts
+ *
+ * This function is used to update the main list with new or different facts. It
+ * differs from set_fact because by calling report_fact_change() as this is
+ * changing the actual fact list.
+ *
+ * Returns: bool indicating if the list was changed
+ */
+static bool update_list(igt_fact_list *list, const char *name,
+			const char *value, const char *last_test)
+{
+	igt_fact *fact = NULL;
+
+	/* Check that name and value are not null */
+	if (name == NULL || value == NULL)
+		return false;
+
+	fact = get_fact(list, name);
+	if (fact != NULL) {
+		/* Return false if fact->value equals value */
+		if (strcmp(fact->value, value) == 0)
+			return false; /* Not changed */
+
+		report_fact_change(fact, value, last_test, false);
+
+		/* Update the value */
+		fact->value = g_strdup(value);
+		return true;
+	}
+
+	/* Add a new fact */
+	list->num_facts++;
+
+	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
+	igt_assert(list->facts != NULL);
+
+	list->facts[list->num_facts - 1].name = g_strdup(name);
+	list->facts[list->num_facts - 1].value = g_strdup(value);
+
+	/* Report new fact */
+	report_fact_change(&list->facts[list->num_facts - 1], NULL,
+					   last_test, false);
+
+	return true;
+}
+
+/**
+ * merge_facts: Merges two lists of facts
+ *
+ * This function merges two lists of facts. It filters the facts by fact_group
+ * and deletes the ones that are not present in the new_list. It also updates
+ * the facts that are present in both lists.
+ *
+ * As an example if fact_group is "pci_gpu", we can delete the fact
+ * hardware.pci.gpu_at.0000:00:02.0 if it doesn't exist in new_list.
+ *
+ * Returns: void
+ */
+static void merge_facts(igt_fact_list *list, igt_fact_list *new_list,
+			const char *fact_group, const char *last_test)
+{
+	/* Filter by fact_group and delete facts that exist on list
+	 * but not on new_list
+	 */
+	for (int i = 0; i < list->num_facts; i++) {
+		if (strstr(list->facts[i].name, fact_group) == NULL)
+			continue;
+		if (get_fact(new_list, list->facts[i].name) == NULL)
+			delete_fact(list, list->facts[i].name, last_test);
+	}
+
+	/* Add and update facts from new_list to list */
+	for (int i = 0; i < new_list->num_facts; i++) {
+		if (strstr(new_list->facts[i].name, fact_group) == NULL)
+			continue; /* Should never happen */
+		update_list(list, new_list->facts[i].name,
+			    new_list->facts[i].value,
+			    new_list->facts[i].last_test);
+	}
+}
+
+/**
+ * scan_pci_for_gpus: scans the pci bus for gpus using udev
+ *
+ * This function scans the pci bus for gpus using udev. It creates a new list
+ * of facts with the pci_gpu_fact fact_group and merges it with the list of
+ * facts passed as argument.
+ *
+ * Returns: void
+ */
+static void scan_pci_for_gpus(igt_fact_list *list, const char *last_test)
+{
+	struct udev *udev = NULL;
+	struct udev_enumerate *enumerate = NULL;
+	struct udev_list_entry *devices, *dev_list_entry;
+	struct igt_device_card card;
+	char pcistr[10];
+	int ret;
+	char *factname = NULL;
+	char *factvalue = NULL;
+	igt_fact_list new_list = {0};
+
+	udev = udev_new();
+	if (!udev) {
+		igt_warn("Failed to create udev context\n");
+		return;
+	}
+
+	enumerate = udev_enumerate_new(udev);
+	if (!enumerate) {
+		igt_warn("Failed to create udev enumerate\n");
+		udev_unref(udev);
+		return;
+	}
+
+	ret = udev_enumerate_add_match_subsystem(enumerate, "pci");
+	if (ret < 0)
+		goto out;
+
+	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "30000");
+	if (ret < 0)
+		goto out;
+
+	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "38000");
+	if (ret < 0)
+		goto out;
+
+	ret = udev_enumerate_scan_devices(enumerate);
+	if (ret < 0)
+		goto out;
+
+	devices = udev_enumerate_get_list_entry(enumerate);
+	if (!devices)
+		goto out;
+
+	udev_list_entry_foreach(dev_list_entry, devices) {
+		const char *path;
+		struct udev_device *udev_dev;
+		struct udev_list_entry *entry;
+		char *model = NULL;
+		char *codename = NULL;
+
+		path = udev_list_entry_get_name(dev_list_entry);
+		udev_dev = udev_device_new_from_syspath(udev, path);
+		if (!udev_dev)
+			continue;
+
+		/* Strip path to only the content after the last / */
+		path = strrchr(path, '/');
+		if (path)
+			path++;
+		else
+			path = "unknown";
+
+		strcpy(card.pci_slot_name, "-");
+
+		entry = udev_device_get_properties_list_entry(udev_dev);
+		while (entry) {
+			const char *name = udev_list_entry_get_name(entry);
+			const char *value = udev_list_entry_get_value(entry);
+
+			entry = udev_list_entry_get_next(entry);
+			if (!strcmp(name, "ID_MODEL_FROM_DATABASE"))
+				model = g_strdup(value);
+			else if (!strcmp(name, "PCI_ID"))
+				igt_assert_eq(sscanf(value, "%hx:%hx",
+						     &card.pci_vendor, &card.pci_device), 2);
+		}
+		snprintf(pcistr, sizeof(pcistr), "%04x:%04x",
+			 card.pci_vendor, card.pci_device);
+		codename = igt_device_get_pretty_name(&card, false);
+
+		/* Set codename to null if it is the same string as pci_id */
+		if (codename && strcmp(pcistr, codename) == 0) {
+			free(codename);
+			codename = NULL;
+		}
+
+		factname = g_strdup_printf("%s.%s", pci_gpu_fact, path);
+		factvalue = g_strdup_printf("%s %s %s",
+					    pcistr,
+					    codename ? codename : "",
+					    model ? model : "");
+
+		/* Strip whitespaces from factvalue */
+		factvalue = g_strstrip(factvalue);
+
+		set_fact(&new_list, factname, factvalue, last_test);
+
+		free(codename);
+		free(model);
+		udev_device_unref(udev_dev);
+	}
+	merge_facts(list, &new_list, pci_gpu_fact, last_test);
+
+out:
+	udev_enumerate_unref(enumerate);
+	udev_unref(udev);
+}
+
+/**
+ * scan_pci_drm_cards: scans the pci bus for drm cards using udev
+ *
+ * This function scans the pci bus for drm cards using udev. It creates a new
+ * list of facts with the drm_card_fact fact_group and merges it with the list
+ * of facts passed as argument.
+ *
+ * Returns: void
+ */
+static void scan_pci_drm_cards(igt_fact_list *list, const char *last_test)
+{
+	struct udev *udev = NULL;
+	struct udev_enumerate *enumerate = NULL;
+	struct udev_list_entry *devices, *dev_list_entry;
+	int ret;
+	char *factname = NULL;
+	char *factvalue = NULL;
+	igt_fact_list new_list = {0};
+
+	udev = udev_new();
+	if (!udev)
+		return;
+
+	enumerate = udev_enumerate_new(udev);
+	if (!enumerate) {
+		udev_unref(udev);
+		return;
+	}
+
+	ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
+	if (ret < 0)
+		goto out;
+
+	ret = udev_enumerate_scan_devices(enumerate);
+	if (ret < 0)
+		goto out;
+
+	devices = udev_enumerate_get_list_entry(enumerate);
+	if (!devices)
+		goto out;
+
+	ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
+	if (ret < 0)
+		goto out;
+
+	ret = udev_enumerate_scan_devices(enumerate);
+	if (ret < 0)
+		goto out;
+
+	devices = udev_enumerate_get_list_entry(enumerate);
+	if (!devices)
+		goto out;
+
+	udev_list_entry_foreach(dev_list_entry, devices) {
+		const char *path;
+		struct udev_device *drm_dev, *pci_dev;
+		const char *drm_name, *pci_addr;
+
+		path = udev_list_entry_get_name(dev_list_entry);
+		drm_dev = udev_device_new_from_syspath(udev, path);
+		if (!drm_dev)
+			continue;
+
+		drm_name = udev_device_get_sysname(drm_dev);
+		/* Filter the device by name. Want devices such as card0 and card1.
+		 * If the device has '-' in the name, contine
+		 */
+		if (strncmp(drm_name, "card", 4) != 0 || strchr(drm_name, '-') != NULL) {
+			udev_device_unref(drm_dev);
+			continue;
+		}
+
+		/* Get the pci address of the gpu associated with the drm_dev*/
+		pci_dev = udev_device_get_parent_with_subsystem_devtype(drm_dev, "pci", NULL);
+		if (pci_dev) {
+			pci_addr = udev_device_get_sysattr_value(pci_dev, "address");
+			if (!pci_addr)
+				pci_addr = udev_device_get_sysname(pci_dev);
+		} else {
+			/* Some GPUs are platform devices. Ignore them. */
+			pci_addr = NULL;
+			udev_device_unref(drm_dev);
+			continue;
+		}
+
+		factname = g_strdup_printf("%s.%s", drm_card_fact, pci_addr);
+		factvalue = g_strdup_printf("%s", drm_name);
+		set_fact(&new_list, factname, factvalue, last_test);
+
+		udev_device_unref(drm_dev);
+	}
+	if (new_list.num_facts > 0)
+		merge_facts(list, &new_list, drm_card_fact, last_test);
+
+out:
+	udev_enumerate_unref(enumerate);
+	udev_unref(udev);
+}
+
+/**
+ * scan_kernel_loaded_kmods: scans for loaded kmods using igt_fact_kmod_list
+ * and igt_kmod_is_loaded()
+ *
+ * This function scans for loaded kmods using igt_fact_kmod_list and
+ * igt_kmod_is_loaded(). It creates a new list of facts with the kmod_fact
+ * fact_group and merges it with the list of facts passed as argument.
+ *
+ * Returns: void
+ */
+static void scan_kernel_loaded_kmods(igt_fact_list *list, const char *last_test)
+{
+	char *name = NULL;
+	igt_fact_list new_list = {0};
+
+	/* Iterate over igt_fact_kmod_list[] until the element contains "\0" */
+	for (int i = 0; strcmp(igt_fact_kmod_list[i], "\0") != 0; i++) {
+		name = g_strdup_printf("%s.%s", kmod_fact, igt_fact_kmod_list[i]);
+		if (igt_kmod_is_loaded(igt_fact_kmod_list[i]))
+			set_fact(&new_list, name, "true", last_test);
+
+		g_free(name);
+	}
+	merge_facts(list, &new_list, kmod_fact, last_test);
+}
+
+/**
+ * igt_facts: the main public function for igt_facts
+ *
+ * Call this function where you want to gather and report facts.
+ *
+ * Returns: void
+ */
+void igt_facts(igt_fact_list *list, const char *last_test)
+{
+	scan_pci_for_gpus(list, last_test);
+	scan_pci_drm_cards(list, last_test);
+	scan_kernel_loaded_kmods(list, last_test);
+
+	/* Flush stdout and stderr */
+	fflush(stdout);
+	fflush(stderr);
+}
+
+/**
+ * print_all_facts: prints all facts in the list
+ *
+ * This function prints all facts in the list.
+ *
+ * Returns: void
+ */
+void print_all_facts(igt_fact_list *list)
+{
+	igt_info("Number of facts: %d\n", list->num_facts);
+	for (int i = 0; i < list->num_facts; i++)
+		igt_info(" - %s: %s\n", list->facts[i].name, list->facts[i].value);
+}
+
+
+/*
+ * Testing
+ *
+ * Defined here so that we can keep most of the functions static
+ *
+ */
+
+/**
+ * igt_facts_test_pci_gpu: Tests set_fact and merge_facts for a pci gpu
+ *
+ * Returns: void
+ */
+static void igt_facts_test_pci_gpu(igt_fact_list *list,
+				   const char *last_test,
+				   int index)
+{
+	igt_fact_list new_list = {0};
+
+	set_fact(&new_list, /* fact list */
+		 "hardware.pci.gpu_at_addr.0000:00:02.0",
+		 "8086:64a0 Intel Lunarlake (Gen20)",
+		 last_test);
+
+	igt_assert_eq(new_list.num_facts, 1);
+	igt_assert_eq(strcmp(new_list.facts[0].name,
+		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
+	igt_assert_eq(strcmp(new_list.facts[0].value,
+		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
+	igt_assert(new_list.facts[0].last_test == NULL);
+
+	merge_facts(list, &new_list, pci_gpu_fact, last_test);
+	igt_assert_eq(list->num_facts, index + 1);
+	igt_assert_eq(strcmp(list->facts[index].name,
+		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
+	igt_assert_eq(strcmp(list->facts[index].value,
+		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
+
+}
+
+/**
+ * igt_facts_test_i915_kmod: Tests set_fact and merge_facts for the i915 kmod
+ *
+ * Returns: void
+ */
+static void igt_facts_test_i915_kmod(igt_fact_list *list,
+				     const char *last_test,
+				     int index)
+{
+	igt_fact_list new_list = {0};
+
+	set_fact(&new_list,
+		 "kernel.kmod_is_loaded.i915",
+		 "true",
+		 last_test);
+
+	igt_assert_eq(new_list.num_facts, 1);
+	igt_assert_eq(strcmp(new_list.facts[0].name,
+		      "kernel.kmod_is_loaded.i915"), 0);
+	igt_assert_eq(strcmp(new_list.facts[0].value, "true"), 0);
+	igt_assert(new_list.facts[0].last_test == NULL);
+
+	merge_facts(list, &new_list, kmod_fact, last_test);
+	igt_assert_eq(list->num_facts, index + 1);
+	igt_assert_eq(strcmp(list->facts[index].name,
+		      "kernel.kmod_is_loaded.i915"), 0);
+	igt_assert_eq(strcmp(list->facts[index].value, "true"), 0);
+}
+
+/**
+ * igt_facts_test_delete_facts: Tests delete_fact in different scenarios
+ *
+ * Returns: void
+ */
+static void igt_facts_test_delete_fact(igt_fact_list *list,
+				       const char *last_test)
+{
+	igt_info("Testing delete_fact()\n");
+
+	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
+	igt_assert_eq(list->num_facts, 1);
+	igt_assert_eq(strcmp(list->facts[0].name,
+		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
+	igt_assert_eq(strcmp(list->facts[0].value,
+		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
+
+	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
+	igt_assert_eq(list->num_facts, 0);
+
+	/* Test delete on an empty list */
+	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
+	igt_assert_eq(list->num_facts, 0);
+
+	/* Test delete on reverse order */
+	igt_facts_test_pci_gpu(list, NULL, 0);
+	igt_facts_test_i915_kmod(list, NULL, 1);
+	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
+	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
+	igt_assert_eq(list->num_facts, 0);
+
+	/* List is empty from now on*/
+	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
+	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
+	igt_assert_eq(list->num_facts, 0);
+}
+
+/**
+ * igt_facts_test: Main function for testing the igt_facts module
+ *
+ * Returns: bool indicating if the tests passed
+ */
+bool igt_facts_test(void)
+{
+	igt_fact_list fact_list = {0};
+
+	/* Test set_fact for the pci gpu */
+	igt_info("Testing set_fact()\n");
+	igt_facts_test_pci_gpu(&fact_list, NULL, 0);
+	igt_facts_test_i915_kmod(&fact_list, NULL, 1);
+
+	/* Test delete_fact */
+	igt_facts_test_delete_fact(&fact_list, NULL);
+
+	return true;
+}
diff --git a/lib/igt_facts.h b/lib/igt_facts.h
new file mode 100644
index 000000000..c943aa602
--- /dev/null
+++ b/lib/igt_facts.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright © 2024 Intel Corporation */
+
+#include <stdbool.h>
+
+typedef struct {
+	char *name;
+	char *value;
+	char *last_test;
+} igt_fact;
+
+typedef struct {
+	igt_fact *facts;
+	int num_facts;
+} igt_fact_list;
+
+const char *igt_fact_kmod_list[] = {
+	"amdgpu",
+	"i915",
+	"nouveau",
+	"radeon",
+	"xe",
+	"\0"
+};
+
+const char *kmod_fact     = "kernel.kmod_is_loaded"; /* true or false */
+const char *pci_gpu_fact  = "hardware.pci.gpu_at_addr"; /* id vendor model */
+const char *drm_card_fact = "hardware.pci.drm_card_at_addr"; /* cardX */
+
+void igt_facts(igt_fact_list *list, const char *last_test);
+void print_all_facts(igt_fact_list *list);
+bool igt_facts_test(void); /* For unit testing only */
diff --git a/lib/meson.build b/lib/meson.build
index c3556a921..c44ca2b5a 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -18,6 +18,7 @@ lib_sources = [
 	'i915/i915_crc.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
+	'igt_facts.c',
 	'igt_crc.c',
 	'igt_debugfs.c',
 	'igt_device.c',
diff --git a/lib/tests/igt_facts.c b/lib/tests/igt_facts.c
new file mode 100644
index 000000000..0635d6b07
--- /dev/null
+++ b/lib/tests/igt_facts.c
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright © 2024 Intel Corporation */
+
+#include <stdbool.h>
+
+#include "igt_core.h"
+#include "igt_facts.h"
+
+/* Tests are not defined here so we can keep most of the functions static */
+
+igt_simple_main
+{
+	igt_info("Running igt_facts_test\n");
+	igt_assert(igt_facts_test() == true);
+}
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index df8092638..1ce19f63c 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -8,6 +8,7 @@ lib_tests = [
 	'igt_dynamic_subtests',
 	'igt_edid',
 	'igt_exit_handler',
+	'igt_facts',
 	'igt_fork',
 	'igt_fork_helper',
 	'igt_hook',
diff --git a/runner/executor.c b/runner/executor.c
index ac73e1dde..6ff252174 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -35,6 +35,7 @@
 #include "executor.h"
 #include "output_strings.h"
 #include "runnercomms.h"
+#include "igt_facts.h"
 
 #define KMSG_HEADER "[IGT] "
 #define KMSG_WARN 4
@@ -2306,6 +2307,8 @@ bool execute(struct execute_state *state,
 	sigset_t sigmask;
 	double time_spent = 0.0;
 	bool status = true;
+	igt_fact_list fact_list = {0};
+	char *last_test = NULL;
 
 	if (state->dry) {
 		outf("Dry run, not executing. Invoke igt_resume if you want to execute.\n");
@@ -2438,6 +2441,10 @@ bool execute(struct execute_state *state,
 		int result;
 		bool already_written = false;
 
+		/* Calls before running each test */
+		igt_facts(&fact_list, last_test);
+		last_test = entry_display_name(&job_list->entries[state->next]);
+
 		if (should_die_because_signal(sigfd)) {
 			status = false;
 			goto end;
@@ -2526,6 +2533,8 @@ bool execute(struct execute_state *state,
 			return execute(state, settings, job_list);
 		}
 	}
+	/* Last call to collect facts after the last test runs */
+	igt_facts(&fact_list, last_test);
 
 	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
 		dprintf(timefd, "%f\n", timeofday_double());
-- 
2.34.1

