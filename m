Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB42D49207
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 16:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2B310E163;
	Mon, 18 Nov 2024 16:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GXtpBHV4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266B610E163
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731945805; x=1763481805;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SLJ8L6Nx/emv7W55LJjykZ6LC1wFH1TkqHdE4Ykp1DA=;
 b=GXtpBHV4NBmsKgrId6armWvZVF67m9HeK+UHLl5hQTmtxvVY7BDidXj0
 QAmoGJFk0I3eNhW1sIFKhjZi7+jdwlGVtsvX7hJmf8nCYdyP8BARePXQH
 M+jHV6FpO7kSKkiRwjF1mMKqN36AH7xZaf13O/5ou7DEcStUfaXwHhhXQ
 jnazlXNxxsXkTa6dusSEbnHLKEbcGHjchuUNOM7TI+BusWKbkfOoRm94H
 j19DpsRa0HBeGZrIFqgfBiHZ8cCArNmg1c8JL8bA9sm15sZnSTD1GI0rt
 jDH+TwivrkZQYbpp/l0T8MKwHCB8vO8X7j79fJYBYodhrtz1zcvrXTzR5 g==;
X-CSE-ConnectionGUID: iyiINB8lTKuxChe9p5nZ1Q==
X-CSE-MsgGUID: d7LgCKIfQY+kfeDl29Jesw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31848043"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="31848043"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 08:03:24 -0800
X-CSE-ConnectionGUID: HRYVv9puQqKqBqEBBK5fYw==
X-CSE-MsgGUID: K28EojweToe6S4k2rA7ntQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89282871"
Received: from amcdermo-mobl1.ger.corp.intel.com (HELO [10.213.196.189])
 ([10.213.196.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 08:03:22 -0800
Message-ID: <6ed12243-172d-433a-a203-4176be7ee53c@linux.intel.com>
Date: Mon, 18 Nov 2024 17:03:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6] igt-runner fact checking
To: Luca Coelho <luca@coelho.fi>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Ryszard Knop <ryszard.knop@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, luciano.coelho@intel.com
References: <384b983e-b1f5-4266-aa14-5739397bc7a1@linux.intel.com>
 <b7299a2dc50db417a360d702c660ec57b8733f34.camel@coelho.fi>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <b7299a2dc50db417a360d702c660ec57b8733f34.camel@coelho.fi>
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



On 18.11.2024 14:07, Luca Coelho wrote:
[...]
>> +
>> +/**
>> + * report_fact_change: prints changes using igt_info()
>> + *
>> + * Reports facts that are new, changed and deleted.
>> + *
>> + * Returns: void
>> + */
> 
> If you are planning to create docs from this (which I assume you do,
> because of the "/**"), you should add descriptions to all function
> arguments, otherwise you'll get warnings, I think.

Thank you for the heads up. I will double check.

> 
> 
>> +static void report_fact_change(igt_fact *fact, const char *new_value,
>> +			       const char *last_test, bool delete)
> 
> I think you don't need this function.  If you take away all the
> boilerplate and the checks to see who is actually calling the function
> (i.e. if it is new, update, delete...), all that remains is an
> igt_info() call.  It seems to me that you are checking things which you
> already knew again inside this function.

No no, this is absolutely needed. I am not concerned with additional
function calls at this scale as we can comfortably afford them.

The reason why this is a separated function is because logging is the
most important function of the patch, and I want to make sure it is in a
single function. It is a desing choice that I am happy with.

> 
> 
>> +{
>> +	struct timespec uptime_ts;
>> +	char *uptime = NULL;
>> +	bool changed = false;
>> +	const char *before_tests   = "before any test";
>> +
>> +	if (clock_gettime(CLOCK_BOOTTIME, &uptime_ts) != 0)
>> +		return;
>> +
>> +	asprintf(&uptime,
>> +		 "%ld.%06ld",
>> +		 uptime_ts.tv_sec,
>> +		 uptime_ts.tv_nsec / 1000);
>> +
>> +	/* If delete is true, the fact was deleted */
>> +	if (delete) {
>> +		igt_info("[%s] [FACT %s] deleted: %s: %s\n",
>> +			 uptime,
>> +			 last_test ? last_test : before_tests,
>> +			 fact->name,
>> +			 fact->value);
>> +		return;
>> +	}
> 
> For example here, only the deletion code calls this function with
> delete == true, so it could just as well print the info by itself.
> 
> Same thing for the subsequent blocks.

Oh yeah!


> 
> 
>> +
>> +	/* If new_value is NULL, it is a new fact */
>> +	if (new_value == NULL) {
>> +		igt_info("[%s] [FACT %s] new: %s: %s\n",
>> +			 uptime,
>> +			 last_test ? last_test : before_tests,
>> +			 fact->name,
>> +			 fact->value);
>> +		return;
>> +	}
>> +
>> +	/* Check if the value changed
>> +	 *
>> +	 * There is a corner case because the gpu driver can change the human
>> +	 * readeable strings. If the fact->name contains pci_gpu_fact, compare
>> +	 * just the first nine characters (pci_id).
>> +	 */
>> +	if (strstr(fact->name, pci_gpu_fact) != NULL) {
>> +		if (strncmp(fact->value, new_value, 9) != 0)
>> +			changed = true;
>> +	} else if (strcmp(fact->value, new_value) != 0)
>> +		changed = true;
> 
> And this, the only actual logic in this function is better done when
> you get this information.

Having a separate function for logging is a design decision. Feel free
to propose concrete changes that keep it as a separate function.

> 
> 
>> +
>> +	if (changed) {
>> +		igt_info("[%s] [FACT %s] changed: %s: %s -> %s\n",
>> +			 uptime,
>> +			 last_test,
>> +			 fact->name,
>> +			 fact->value,
>> +			 new_value);
>> +		changed = false;
>> +	}
>> +	free(uptime);
>> +}
>> +
>> +/**
>> + * get_fact: Returns a fact from the list by name.
>> + *
>> + * Iterates over the list of facts and returns the first one with the same name.
>> + * If no fact is found, returns NULL.
>> + *
>> + * Returns: igt_fact* or NULL
>> + */
>> +static igt_fact *get_fact(igt_fact_list *list, const char *name)
>> +{
>> +	if (!list || list->facts == NULL || list->num_facts == 0)
>> +		return NULL;
> 
> AFAICT list->facts == NULL and list->num_facts == 0 are redundant here,
> right? It should not happen.  And if you did lose track of the
> num_facts you actually had in the list (regardless of whether it's
> zero), you would be in trouble in other places too.

For me, redundancy is not a problem. Again, this was a design decision.
I am in no way trying to minimize the number of comparisons or optimize
to the level you are mentioning.

For me it is more important to catch errors here, to increase chances of
preventing weird behaviors downdstream. I am very happy to pay the very
small price of redundant checks.

> 
> 
> 
>> +
>> +	for (int i = 0; i < list->num_facts; i++) {
>> +		if (list->facts[i].name == NULL)
>> +			continue;
>> +
>> +		if (strcmp(list->facts[i].name, name) == 0)
>> +			return &list->facts[i];
>> +	}
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * delete_fact: Deletes a fact from the list by name.
>> + *
>> + * Iterates over the list of facts and deletes the first one with the same name.
>> + * Returns true if the fact was deleted, false otherwise.
>> + *
>> + * Returns: bool idicating if the fact was deleted
>> + */
>> +static bool delete_fact(igt_fact_list *list, const char *name, const char *last_test)
>> +{
>> +	igt_fact *fact = NULL;
>> +	int i;
>> +
>> +	if (!list || !name || list->facts == NULL || list->num_facts == 0)
>> +		return false;
>> +
>> +	fact = get_fact(list, name);
>> +	if (fact == NULL)
>> +		return false;
>> +
>> +	/* Report the deletion */
>> +	report_fact_change(fact, NULL, last_test, true);
>> +
>> +	/* Move all facts after the one to be deleted one step back */
>> +	for (i = 0; i < list->num_facts; i++) {
>> +		if (strcmp(list->facts[i].name, name) == 0) {
>> +			free(list->facts[i].name);
>> +			free(list->facts[i].value);
>> +
>> +			for (int j = i; j < list->num_facts - 1; j++)
>> +				list->facts[j] = list->facts[j + 1];
>> +			break;
>> +		}
>> +	}
>> +	list->num_facts--;
>> +
>> +	if (list->num_facts == 0) {
>> +		free(list->facts);
>> +		list->facts = NULL;
>> +	} else {
>> +		list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
>> +		igt_assert(list->facts != NULL);
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * set_fact: Adds a fact to the list.
>> + *
>> + * This is intended for the "new_list" that is created for being merged with the
>> + * "list". It adds a new fact to the list. If the fact already exists, it
>> + * returns false.
>> + *
>> + * Returns: bool indicating if the fact was added
>> + */
>> +static bool set_fact(igt_fact_list *list, const char *name,
>> +		     const char *value, const char *last_test)
>> +{
>> +	igt_fact *fact = NULL;
>> +
>> +	/* Check that name and value are not null */
>> +	if (name == NULL || value == NULL)
>> +		return false;
>> +
>> +	fact = get_fact(list, name);
>> +	if (fact != NULL)
>> +		return false; /* Should not happen */
>> +
>> +	/* Add a new fact */
>> +	list->num_facts++;
>> +
>> +	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
>> +	igt_assert(list->facts != NULL);
>> +
>> +	list->facts[list->num_facts - 1].name = strdup(name);
>> +	list->facts[list->num_facts - 1].value = strdup(value);
>> +
>> +	if (last_test)
>> +		list->facts[list->num_facts - 1].last_test = strdup(last_test);
>> +	else
>> +		list->facts[list->num_facts - 1].last_test = NULL;
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * update_list: Updates the main list with new or different facts
>> + *
>> + * This function is used to update the main list with new or different facts. It
>> + * differs from set_fact because by calling report_fact_change() as this is
>> + * changing the actual fact list.
> 
> Again, I think you should know this at the caller side (and you do), so
> if you just print instead of having the report_fact_change() function,
> you can use a single function for add and update.

Just acking that I did read this one as well.

> 
> 
>> + *
>> + * Returns: bool indicating if the list was changed
>> + */
>> +static bool update_list(igt_fact_list *list, const char *name,
>> +			const char *value, const char *last_test)
>> +{
>> +	igt_fact *fact = NULL;
>> +
>> +	/* Check that name and value are not null */
>> +	if (name == NULL || value == NULL)
>> +		return false;
>> +
>> +	fact = get_fact(list, name);
>> +	if (fact != NULL) {
>> +		/* Return false if fact->value equals value */
>> +		if (strcmp(fact->value, value) == 0)
>> +			return false; /* Not changed */
>> +
>> +		report_fact_change(fact, value, last_test, false);
>> +
>> +		/* Update the value */
>> +		fact->value = strdup(value);
>> +		return true;
>> +	}
>> +
>> +	/* Add a new fact */
>> +	list->num_facts++;
>> +
>> +	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
>> +	igt_assert(list->facts != NULL);
>> +
>> +	list->facts[list->num_facts - 1].name = strdup(name);
>> +	list->facts[list->num_facts - 1].value = strdup(value);
>> +
>> +	/* Report new fact */
>> +	report_fact_change(&list->facts[list->num_facts - 1], NULL,
>> +					   last_test, false);
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * merge_facts: Merges two lists of facts
>> + *
>> + * This function merges two lists of facts. It filters the facts by fact_group
>> + * and deletes the ones that are not present in the new_list. It also updates
>> + * the facts that are present in both lists.
>> + *
>> + * As an example if fact_group is "pci_gpu", we can delete the fact
>> + * hardware.pci.gpu_at.0000:00:02.0 if it doesn't exist in new_list.
>> + *
>> + * Returns: void
>> + */
>> +static void merge_facts(igt_fact_list *list, igt_fact_list *new_list,
>> +			const char *fact_group, const char *last_test)
>> +{
>> +	/* Filter by fact_group and delete facts that exist on list
>> +	 * but not on new_list
>> +	 */
>> +	for (int i = 0; i < list->num_facts; i++) {
>> +		if (strstr(list->facts[i].name, fact_group) == NULL)
>> +			continue;
>> +		if (get_fact(new_list, list->facts[i].name) == NULL)
>> +			delete_fact(list, list->facts[i].name, last_test);
>> +	}
>> +
>> +	/* Add and update facts from new_list to list */
>> +	for (int i = 0; i < new_list->num_facts; i++) {
>> +		if (strstr(new_list->facts[i].name, fact_group) == NULL)
>> +			continue; /* Should never happen */
>> +		update_list(list, new_list->facts[i].name,
>> +			    new_list->facts[i].value,
>> +			    new_list->facts[i].last_test);
>> +	}
>> +}
> 
> Can't you just grow the list instead of creating new ones and then
> merging?

Please show me the code you have in mind.

> 
> This makes me start thinking... it would be so much easier to make all
> this in python.  Would it be possible to glue a python script to igt-
> runner (or whoever calls it) and get the data from dmesg, lsmod etc.?
> Or otherwise aren't there any libraries already used by IGT that
> include list handling?

Absolutely no python here. Never! :-)


> 
> I didn't finish reviewing the rest of this patch yet.  My current
> comment may pivot the way you're implementing this completely, so
> better wait for your reply. :)

I really appreciate you taking the time! Please continue.

> 
> --
> Cheers,
> Luca.
> 
> 
>> +
>> +/**
>> + * scan_pci_for_gpus: scans the pci bus for gpus using udev
>> + *
>> + * This function scans the pci bus for gpus using udev. It creates a new list
>> + * of facts with the pci_gpu_fact fact_group and merges it with the list of
>> + * facts passed as argument.
>> + *
>> + * Returns: void
>> + */
>> +static void scan_pci_for_gpus(igt_fact_list *list, const char *last_test)
>> +{
>> +	struct udev *udev = NULL;
>> +	struct udev_enumerate *enumerate = NULL;
>> +	struct udev_list_entry *devices, *dev_list_entry;
>> +	struct igt_device_card card;
>> +	char pcistr[10];
>> +	int ret;
>> +	char *factname = NULL;
>> +	char *factvalue = NULL;
>> +	igt_fact_list new_list = {0};
>> +
>> +	udev = udev_new();
>> +	if (!udev) {
>> +		igt_warn("Failed to create udev context\n");
>> +		return;
>> +	}
>> +
>> +	enumerate = udev_enumerate_new(udev);
>> +	if (!enumerate) {
>> +		igt_warn("Failed to create udev enumerate\n");
>> +		udev_unref(udev);
>> +		return;
>> +	}
>> +
>> +	ret = udev_enumerate_add_match_subsystem(enumerate, "pci");
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "30000");
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "38000");
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	ret = udev_enumerate_scan_devices(enumerate);
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	devices = udev_enumerate_get_list_entry(enumerate);
>> +	if (!devices)
>> +		goto out;
>> +
>> +	udev_list_entry_foreach(dev_list_entry, devices) {
>> +		const char *path;
>> +		struct udev_device *udev_dev;
>> +		struct udev_list_entry *entry;
>> +		char *model = NULL;
>> +		char *codename = NULL;
>> +
>> +		path = udev_list_entry_get_name(dev_list_entry);
>> +		udev_dev = udev_device_new_from_syspath(udev, path);
>> +		if (!udev_dev)
>> +			continue;
>> +
>> +		/* Strip path to only the content after the last / */
>> +		path = strrchr(path, '/');
>> +		if (path)
>> +			path++;
>> +		else
>> +			path = "unknown";
>> +
>> +		strcpy(card.pci_slot_name, "-");
>> +
>> +		entry = udev_device_get_properties_list_entry(udev_dev);
>> +		while (entry) {
>> +			const char *name = udev_list_entry_get_name(entry);
>> +			const char *value = udev_list_entry_get_value(entry);
>> +
>> +			entry = udev_list_entry_get_next(entry);
>> +			if (!strcmp(name, "ID_MODEL_FROM_DATABASE"))
>> +				model = strdup(value);
>> +			else if (!strcmp(name, "PCI_ID"))
>> +				igt_assert_eq(sscanf(value, "%hx:%hx",
>> +						     &card.pci_vendor, &card.pci_device), 2);
>> +		}
>> +		snprintf(pcistr, sizeof(pcistr), "%04x:%04x",
>> +			 card.pci_vendor, card.pci_device);
>> +		codename = igt_device_get_pretty_name(&card, false);
>> +
>> +		/* Set codename to null if it is the same string as pci_id */
>> +		if (codename && strcmp(pcistr, codename) == 0) {
>> +			free(codename);
>> +			codename = NULL;
>> +		}
>> +		asprintf(&factname, "%s.%s", pci_gpu_fact, path);
>> +		asprintf(&factvalue,
>> +			"%s %s %s",
>> +			pcistr,
>> +			codename ? codename : "",
>> +			model ? model : "");
>> +
>> +		set_fact(&new_list, factname, factvalue, last_test);
>> +
>> +		free(codename);
>> +		free(model);
>> +		udev_device_unref(udev_dev);
>> +	}
>> +	merge_facts(list, &new_list, pci_gpu_fact, last_test);
>> +
>> +out:
>> +	udev_enumerate_unref(enumerate);
>> +	udev_unref(udev);
>> +}
>> +
>> +/**
>> + * scan_pci_drm_cards: scans the pci bus for drm cards using udev
>> + *
>> + * This function scans the pci bus for drm cards using udev. It creates a new
>> + * list of facts with the drm_card_fact fact_group and merges it with the list
>> + * of facts passed as argument.
>> + *
>> + * Returns: void
>> + */
>> +static void scan_pci_drm_cards(igt_fact_list *list, const char *last_test)
>> +{
>> +	struct udev *udev = NULL;
>> +	struct udev_enumerate *enumerate = NULL;
>> +	struct udev_list_entry *devices, *dev_list_entry;
>> +	int ret;
>> +	char *factname = NULL;
>> +	char *factvalue = NULL;
>> +	igt_fact_list new_list = {0};
>> +
>> +	udev = udev_new();
>> +	if (!udev)
>> +		return;
>> +
>> +	enumerate = udev_enumerate_new(udev);
>> +	if (!enumerate) {
>> +		udev_unref(udev);
>> +		return;
>> +	}
>> +
>> +	ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	ret = udev_enumerate_scan_devices(enumerate);
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	devices = udev_enumerate_get_list_entry(enumerate);
>> +	if (!devices)
>> +		goto out;
>> +
>> +	ret = udev_enumerate_add_match_subsystem(enumerate, "drm");
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	ret = udev_enumerate_scan_devices(enumerate);
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	devices = udev_enumerate_get_list_entry(enumerate);
>> +	if (!devices)
>> +		goto out;
>> +
>> +	udev_list_entry_foreach(dev_list_entry, devices) {
>> +		const char *path;
>> +		struct udev_device *drm_dev, *pci_dev;
>> +		const char *drm_name, *pci_addr;
>> +
>> +		path = udev_list_entry_get_name(dev_list_entry);
>> +		drm_dev = udev_device_new_from_syspath(udev, path);
>> +		if (!drm_dev)
>> +			continue;
>> +
>> +		drm_name = udev_device_get_sysname(drm_dev);
>> +		/* Filter the device by name. Want devices such as card0 and card1.
>> +		 * If the device has '-' in the name, contine
>> +		 */
>> +		if (strncmp(drm_name, "card", 4) != 0 || strchr(drm_name, '-') != NULL) {
>> +			udev_device_unref(drm_dev);
>> +			continue;
>> +		}
>> +
>> +		/* Get the pci address of the gpu associated with the drm_dev*/
>> +		pci_dev = udev_device_get_parent_with_subsystem_devtype(drm_dev, "pci", NULL);
>> +		if (pci_dev) {
>> +			pci_addr = udev_device_get_sysattr_value(pci_dev, "address");
>> +			if (!pci_addr)
>> +				pci_addr = udev_device_get_sysname(pci_dev);
>> +		} else {
>> +			/* Some GPUs are platform devices. Ignore them. */
>> +			pci_addr = NULL;
>> +			udev_device_unref(drm_dev);
>> +			continue;
>> +		}
>> +		asprintf(&factname, "%s.%s", drm_card_fact, pci_addr);
>> +		asprintf(&factvalue, "%s", drm_name);
>> +		set_fact(&new_list, factname, factvalue, last_test);
>> +
>> +		udev_device_unref(drm_dev);
>> +	}
>> +	if (new_list.num_facts > 0)
>> +		merge_facts(list, &new_list, drm_card_fact, last_test);
>> +
>> +out:
>> +	udev_enumerate_unref(enumerate);
>> +	udev_unref(udev);
>> +}
>> +
>> +/**
>> + * scan_kernel_tainted: scans for kernel taints using existing igt infra
>> + *
>> + * This function scans for kernel taints using igt_kernel_tainted() and
>> + * igt_explain_taints(). It will cut off the explanation keeping only the
>> + * taint name.
>> + *
>> + * Returns: void
>> + */
>> +static void scan_kernel_tainted(igt_fact_list *list, const char *last_test)
>> +{
>> +	unsigned long taints = 0;
>> +	const char *reason = NULL;
>> +	char *taint_name = NULL;
>> +	char *fact_name = NULL;
>> +	igt_fact_list new_list = {0};
>> +
>> +	taints = igt_kernel_tainted(&taints);
>> +	/* For testing, set all bits to 1
>> +	 * taints = 0xFFFFFFFF;
>> +	 */
>> +
>> +	while ((reason = igt_explain_taints(&taints)) != NULL) {
>> +		/* Cut at the ':' to get only the taint name */
>> +		taint_name = strtok(strdup(reason), ":");
>> +		if (!taint_name)
>> +			continue;
>> +
>> +		/* Lowercase taint_name */
>> +		for (int i = 0; taint_name[i]; i++)
>> +			taint_name[i] = tolower(taint_name[i]);
>> +
>> +		asprintf(&fact_name, "%s.%s", ktaint_fact, taint_name);
>> +		set_fact(&new_list, fact_name, "true", last_test);
>> +
>> +		free(taint_name);
>> +		free(fact_name);
>> +	}
>> +
>> +	merge_facts(list, &new_list, ktaint_fact, last_test);
>> +}
>> +
>> +
>> +/**
>> + * scan_kernel_loaded_kmods: scans for loaded kmods using igt_fact_kmod_list
>> + * and igt_kmod_is_loaded()
>> + *
>> + * This function scans for loaded kmods using igt_fact_kmod_list and
>> + * igt_kmod_is_loaded(). It creates a new list of facts with the kmod_fact
>> + * fact_group and merges it with the list of facts passed as argument.
>> + *
>> + * Returns: void
>> + */
>> +static void scan_kernel_loaded_kmods(igt_fact_list *list, const char *last_test)
>> +{
>> +	char *name = NULL;
>> +	igt_fact_list new_list = {0};
>> +
>> +	/* Iterate over igt_fact_kmod_list[] until the element contains "\0" */
>> +	for (int i = 0; strcmp(igt_fact_kmod_list[i], "\0") != 0; i++) {
>> +		asprintf(&name, "%s.%s", kmod_fact, igt_fact_kmod_list[i]);
>> +		if (igt_kmod_is_loaded(igt_fact_kmod_list[i]))
>> +			set_fact(&new_list, name, "true", last_test);
>> +
>> +		free(name);
>> +	}
>> +	merge_facts(list, &new_list, kmod_fact, last_test);
>> +}
>> +
>> +/**
>> + * igt_facts: the main public function for igt_facts
>> + *
>> + * Call this function where you want to gather and report facts.
>> + *
>> + * Returns: void
>> + */
>> +void igt_facts(igt_fact_list *list, const char *last_test)
>> +{
>> +	scan_pci_for_gpus(list, last_test);
>> +	scan_pci_drm_cards(list, last_test);
>> +	scan_kernel_tainted(list, last_test);
>> +	scan_kernel_loaded_kmods(list, last_test);
>> +
>> +	/* Flush stdout and stderr */
>> +	fflush(stdout);
>> +	fflush(stderr);
>> +}
>> +
>> +/**
>> + * print_all_facts: prints all facts in the list
>> + *
>> + * This function prints all facts in the list.
>> + *
>> + * Returns: void
>> + */
>> +void print_all_facts(igt_fact_list *list)
>> +{
>> +	igt_info("Number of facts: %d\n", list->num_facts);
>> +	for (int i = 0; i < list->num_facts; i++)
>> +		igt_info(" - %s: %s\n", list->facts[i].name, list->facts[i].value);
>> +}
>> +
>> +
>> +/*
>> + * Testing
>> + *
>> + * Defined here so that we can keep most of the functions static
>> + *
>> + */
>> +
>> +/**
>> + * igt_facts_test_pci_gpu: Tests set_fact and merge_facts for a pci gpu
>> + *
>> + * Returns: void
>> + */
>> +static void igt_facts_test_pci_gpu(igt_fact_list *list,
>> +				   const char *last_test,
>> +				   int index)
>> +{
>> +	igt_fact_list new_list = {0};
>> +
>> +	set_fact(&new_list, /* fact list */
>> +		 "hardware.pci.gpu_at_addr.0000:00:02.0",
>> +		 "8086:64a0 Intel Lunarlake (Gen20)",
>> +		 last_test);
>> +
>> +	igt_assert_eq(new_list.num_facts, 1);
>> +	igt_assert_eq(strcmp(new_list.facts[0].name,
>> +		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
>> +	igt_assert_eq(strcmp(new_list.facts[0].value,
>> +		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
>> +	igt_assert(new_list.facts[0].last_test == NULL);
>> +
>> +	merge_facts(list, &new_list, pci_gpu_fact, last_test);
>> +	igt_assert_eq(list->num_facts, index + 1);
>> +	igt_assert_eq(strcmp(list->facts[index].name,
>> +		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
>> +	igt_assert_eq(strcmp(list->facts[index].value,
>> +		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
>> +
>> +}
>> +
>> +/**
>> + * igt_facts_test_i915_kmod: Tests set_fact and merge_facts for the i915 kmod
>> + *
>> + * Returns: void
>> + */
>> +static void igt_facts_test_i915_kmod(igt_fact_list *list,
>> +				     const char *last_test,
>> +				     int index)
>> +{
>> +	igt_fact_list new_list = {0};
>> +
>> +	set_fact(&new_list,
>> +		 "kernel.kmod_is_loaded.i915",
>> +		 "true",
>> +		 last_test);
>> +
>> +	igt_assert_eq(new_list.num_facts, 1);
>> +	igt_assert_eq(strcmp(new_list.facts[0].name,
>> +		      "kernel.kmod_is_loaded.i915"), 0);
>> +	igt_assert_eq(strcmp(new_list.facts[0].value, "true"), 0);
>> +	igt_assert(new_list.facts[0].last_test == NULL);
>> +
>> +	merge_facts(list, &new_list, kmod_fact, last_test);
>> +	igt_assert_eq(list->num_facts, index + 1);
>> +	igt_assert_eq(strcmp(list->facts[index].name,
>> +		      "kernel.kmod_is_loaded.i915"), 0);
>> +	igt_assert_eq(strcmp(list->facts[index].value, "true"), 0);
>> +}
>> +
>> +/**
>> + * igt_facts_test_delete_facts: Tests delete_fact in different scenarios
>> + *
>> + * Returns: void
>> + */
>> +static void igt_facts_test_delete_fact(igt_fact_list *list,
>> +				       const char *last_test)
>> +{
>> +	igt_info("Testing delete_fact()\n");
>> +
>> +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
>> +	igt_assert_eq(list->num_facts, 1);
>> +	igt_assert_eq(strcmp(list->facts[0].name,
>> +		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
>> +	igt_assert_eq(strcmp(list->facts[0].value,
>> +		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
>> +
>> +	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
>> +	igt_assert_eq(list->num_facts, 0);
>> +
>> +	/* Test delete on an empty list */
>> +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
>> +	igt_assert_eq(list->num_facts, 0);
>> +
>> +	/* Test delete on reverse order */
>> +	igt_facts_test_pci_gpu(list, NULL, 0);
>> +	igt_facts_test_i915_kmod(list, NULL, 1);
>> +	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
>> +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
>> +	igt_assert_eq(list->num_facts, 0);
>> +
>> +	/* List is empty from now on*/
>> +	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
>> +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
>> +	igt_assert_eq(list->num_facts, 0);
>> +}
>> +
>> +/**
>> + * igt_facts_test: Main function for testing the igt_facts module
>> + *
>> + * Returns: bool indicating if the tests passed
>> + */
>> +bool igt_facts_test(void)
>> +{
>> +	igt_fact_list fact_list = {0};
>> +
>> +	/* Test set_fact for the pci gpu */
>> +	igt_info("Testing set_fact()\n");
>> +	igt_facts_test_pci_gpu(&fact_list, NULL, 0);
>> +	igt_facts_test_i915_kmod(&fact_list, NULL, 1);
>> +
>> +	/* Test delete_fact */
>> +	igt_facts_test_delete_fact(&fact_list, NULL);
>> +
>> +	return true;
>> +}
>> diff --git a/lib/igt_facts.h b/lib/igt_facts.h
>> new file mode 100644
>> index 000000000..e3c2c77eb
>> --- /dev/null
>> +++ b/lib/igt_facts.h
>> @@ -0,0 +1,34 @@
>> +/* SPDX-License-Identifier: MIT
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <stdbool.h>
>> +
>> +typedef struct {
>> +	char *name;
>> +	char *value;
>> +	char *last_test;
>> +} igt_fact;
>> +
>> +typedef struct {
>> +	igt_fact *facts;
>> +	int num_facts;
>> +} igt_fact_list;
>> +
>> +const char *igt_fact_kmod_list[] = {
>> +	"amdgpu",
>> +	"i915",
>> +	"nouveau",
>> +	"radeon",
>> +	"xe",
>> +	"\0"
>> +};
>> +
>> +const char *kmod_fact     = "kernel.kmod_is_loaded"; /* true or false */
>> +const char *ktaint_fact   = "kernel.is_tainted"; /* taint name: taint_warn */
>> +const char *pci_gpu_fact  = "hardware.pci.gpu_at_addr"; /* id vendor model */
>> +const char *drm_card_fact = "hardware.pci.drm_card_at_addr"; /* cardX */
>> +
>> +void igt_facts(igt_fact_list *list, const char *last_test);
>> +void print_all_facts(igt_fact_list *list);
>> +bool igt_facts_test(void); /* For unit testing only */
>> diff --git a/lib/meson.build b/lib/meson.build
>> index c3556a921..c44ca2b5a 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -18,6 +18,7 @@ lib_sources = [
>>  	'i915/i915_crc.c',
>>  	'igt_collection.c',
>>  	'igt_color_encoding.c',
>> +	'igt_facts.c',
>>  	'igt_crc.c',
>>  	'igt_debugfs.c',
>>  	'igt_device.c',
>> diff --git a/lib/tests/igt_facts.c b/lib/tests/igt_facts.c
>> new file mode 100644
>> index 000000000..4b1c8a80c
>> --- /dev/null
>> +++ b/lib/tests/igt_facts.c
>> @@ -0,0 +1,15 @@
>> +// SPDX-License-Identifier: MIT
>> +// Copyright © 2024 Intel Corporation
>> +
>> +#include <stdbool.h>
>> +
>> +#include "igt_core.h"
>> +#include "igt_facts.h"
>> +
>> +/* Tests are not defined here so we can keep most of the functions static */
>> +
>> +igt_simple_main
>> +{
>> +	igt_info("Running igt_facts_test\n");
>> +	igt_assert(igt_facts_test() == true);
>> +}
>> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
>> index df8092638..1ce19f63c 100644
>> --- a/lib/tests/meson.build
>> +++ b/lib/tests/meson.build
>> @@ -8,6 +8,7 @@ lib_tests = [
>>  	'igt_dynamic_subtests',
>>  	'igt_edid',
>>  	'igt_exit_handler',
>> +	'igt_facts',
>>  	'igt_fork',
>>  	'igt_fork_helper',
>>  	'igt_hook',
>> diff --git a/runner/executor.c b/runner/executor.c
>> index ac73e1dde..6ff252174 100644
>> --- a/runner/executor.c
>> +++ b/runner/executor.c
>> @@ -35,6 +35,7 @@
>>  #include "executor.h"
>>  #include "output_strings.h"
>>  #include "runnercomms.h"
>> +#include "igt_facts.h"
>>  
>>  #define KMSG_HEADER "[IGT] "
>>  #define KMSG_WARN 4
>> @@ -2306,6 +2307,8 @@ bool execute(struct execute_state *state,
>>  	sigset_t sigmask;
>>  	double time_spent = 0.0;
>>  	bool status = true;
>> +	igt_fact_list fact_list = {0};
>> +	char *last_test = NULL;
>>  
>>  	if (state->dry) {
>>  		outf("Dry run, not executing. Invoke igt_resume if you want to execute.\n");
>> @@ -2438,6 +2441,10 @@ bool execute(struct execute_state *state,
>>  		int result;
>>  		bool already_written = false;
>>  
>> +		/* Calls before running each test */
>> +		igt_facts(&fact_list, last_test);
>> +		last_test = entry_display_name(&job_list->entries[state->next]);
>> +
>>  		if (should_die_because_signal(sigfd)) {
>>  			status = false;
>>  			goto end;
>> @@ -2526,6 +2533,8 @@ bool execute(struct execute_state *state,
>>  			return execute(state, settings, job_list);
>>  		}
>>  	}
>> +	/* Last call to collect facts after the last test runs */
>> +	igt_facts(&fact_list, last_test);
>>  
>>  	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
>>  		dprintf(timefd, "%f\n", timeofday_double());

