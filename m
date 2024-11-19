Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70660D60074
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 08:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307EC10E5EA;
	Tue, 19 Nov 2024 08:19:48 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E18510E5F1
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 08:19:46 +0000 (UTC)
Received: from 91-155-254-6.elisa-laajakaista.fi ([91.155.254.6]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1tDJSX-0000000202i-2nx9; Tue, 19 Nov 2024 10:19:43 +0200
Message-ID: <51b9e5c77447517a40da09cc38222ef719801bb3.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Ryszard Knop <ryszard.knop@intel.com>, Janusz Krzysztofik	
 <janusz.krzysztofik@linux.intel.com>, Zbigniew =?UTF-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, 	luciano.coelho@intel.com
Date: Tue, 19 Nov 2024 10:19:39 +0200
In-Reply-To: <6ed12243-172d-433a-a203-4176be7ee53c@linux.intel.com>
References: <384b983e-b1f5-4266-aa14-5739397bc7a1@linux.intel.com>
 <b7299a2dc50db417a360d702c660ec57b8733f34.camel@coelho.fi>
 <6ed12243-172d-433a-a203-4176be7ee53c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v6] igt-runner fact checking
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

On Mon, 2024-11-18 at 17:03 +0100, Peter Senna Tschudin wrote:
>=20
> On 18.11.2024 14:07, Luca Coelho wrote:
> [...]
> > > +
> > > +/**
> > > + * report_fact_change: prints changes using igt_info()
> > > + *
> > > + * Reports facts that are new, changed and deleted.
> > > + *
> > > + * Returns: void
> > > + */
> >=20
> > If you are planning to create docs from this (which I assume you do,
> > because of the "/**"), you should add descriptions to all function
> > arguments, otherwise you'll get warnings, I think.
>=20
> Thank you for the heads up. I will double check.
>=20
> >=20
> >=20
> > > +static void report_fact_change(igt_fact *fact, const char *new_value=
,
> > > +			       const char *last_test, bool delete)
> >=20
> > I think you don't need this function.  If you take away all the
> > boilerplate and the checks to see who is actually calling the function
> > (i.e. if it is new, update, delete...), all that remains is an
> > igt_info() call.  It seems to me that you are checking things which you
> > already knew again inside this function.
>=20
> No no, this is absolutely needed. I am not concerned with additional
> function calls at this scale as we can comfortably afford them.

I have to disagree with "absolutely needed".  How can a new feature
implementation _require_ a specific function to exist?


> The reason why this is a separated function is because logging is the
> most important function of the patch, and I want to make sure it is in a
> single function. It is a desing choice that I am happy with.

Sure, I get that.  But I don't see how adding a lot of boiler plate and
redundant code can help.

This all-important function is static and hidden well inside the code,
being called by the list functions (also static), which in turn are
called by other static functions until finally reaching igt_facts(),
which is the one that is exported.


> > > +{
> > > +	struct timespec uptime_ts;
> > > +	char *uptime =3D NULL;
> > > +	bool changed =3D false;
> > > +	const char *before_tests   =3D "before any test";
> > > +
> > > +	if (clock_gettime(CLOCK_BOOTTIME, &uptime_ts) !=3D 0)
> > > +		return;
> > > +
> > > +	asprintf(&uptime,
> > > +		 "%ld.%06ld",
> > > +		 uptime_ts.tv_sec,
> > > +		 uptime_ts.tv_nsec / 1000);
> > > +
> > > +	/* If delete is true, the fact was deleted */
> > > +	if (delete) {
> > > +		igt_info("[%s] [FACT %s] deleted: %s: %s\n",
> > > +			 uptime,
> > > +			 last_test ? last_test : before_tests,
> > > +			 fact->name,
> > > +			 fact->value);
> > > +		return;
> > > +	}
> >=20
> > For example here, only the deletion code calls this function with
> > delete =3D=3D true, so it could just as well print the info by itself.
> >=20
> > Same thing for the subsequent blocks.
>=20
> Oh yeah!
>=20
>=20
> >=20
> >=20
> > > +
> > > +	/* If new_value is NULL, it is a new fact */
> > > +	if (new_value =3D=3D NULL) {
> > > +		igt_info("[%s] [FACT %s] new: %s: %s\n",
> > > +			 uptime,
> > > +			 last_test ? last_test : before_tests,
> > > +			 fact->name,
> > > +			 fact->value);
> > > +		return;
> > > +	}
> > > +
> > > +	/* Check if the value changed
> > > +	 *
> > > +	 * There is a corner case because the gpu driver can change the hum=
an
> > > +	 * readeable strings. If the fact->name contains pci_gpu_fact, comp=
are
> > > +	 * just the first nine characters (pci_id).
> > > +	 */
> > > +	if (strstr(fact->name, pci_gpu_fact) !=3D NULL) {
> > > +		if (strncmp(fact->value, new_value, 9) !=3D 0)
> > > +			changed =3D true;
> > > +	} else if (strcmp(fact->value, new_value) !=3D 0)
> > > +		changed =3D true;
> >=20
> > And this, the only actual logic in this function is better done when
> > you get this information.
>=20
> Having a separate function for logging is a design decision. Feel free
> to propose concrete changes that keep it as a separate function.

This is not related to logging in itself.  According to what I
understood from your comment, this was because the _input_ can change
the later part of the string without this being a significant fact
change.  I thought it would be better to keep this check in the part of
the code that actually knows what this string is, namely, the function
that reads it from the kernel.

Now that I think about it again, I think I understand your view.  It's
probably because you want to make this decision (to log or not to log)
here.  So this is fine.


> > > +
> > > +	if (changed) {
> > > +		igt_info("[%s] [FACT %s] changed: %s: %s -> %s\n",
> > > +			 uptime,
> > > +			 last_test,
> > > +			 fact->name,
> > > +			 fact->value,
> > > +			 new_value);
> > > +		changed =3D false;
> > > +	}
> > > +	free(uptime);
> > > +}
> > > +
> > > +/**
> > > + * get_fact: Returns a fact from the list by name.
> > > + *
> > > + * Iterates over the list of facts and returns the first one with th=
e same name.
> > > + * If no fact is found, returns NULL.
> > > + *
> > > + * Returns: igt_fact* or NULL
> > > + */
> > > +static igt_fact *get_fact(igt_fact_list *list, const char *name)
> > > +{
> > > +	if (!list || list->facts =3D=3D NULL || list->num_facts =3D=3D 0)
> > > +		return NULL;
> >=20
> > AFAICT list->facts =3D=3D NULL and list->num_facts =3D=3D 0 are redunda=
nt here,
> > right? It should not happen.  And if you did lose track of the
> > num_facts you actually had in the list (regardless of whether it's
> > zero), you would be in trouble in other places too.
>=20
> For me, redundancy is not a problem. Again, this was a design decision.
> I am in no way trying to minimize the number of comparisons or optimize
> to the level you are mentioning.

Redundancy is not a problem per se, if it's deemed important for
readability, performance etc.  I don't think it is, in this case.


> For me it is more important to catch errors here, to increase chances of
> preventing weird behaviors downdstream. I am very happy to pay the very
> small price of redundant checks.

You're hiding errors here.  If list->facts is not NULL, but list-
>num_facts =3D=3D 0, you'll simply return, as if there were nothing in the
list, when in fact the list is broken.  The weird behavior could still
happen elsewhere, for instance, in the merge_facts() function you have
this:

	for (int i =3D 0; i < list->num_facts; i++) {
		if (strstr(list->facts[i].name, fact_group) =3D=3D NULL)
			continue;

You are assuming list->facts is not NULL based on list->num_facts being
greater than zero.


> > > +	for (int i =3D 0; i < list->num_facts; i++) {
> > > +		if (list->facts[i].name =3D=3D NULL)
> > > +			continue;
> > > +
> > > +		if (strcmp(list->facts[i].name, name) =3D=3D 0)
> > > +			return &list->facts[i];
> > > +	}
> > > +	return NULL;
> > > +}
> > > +
> > > +/**
> > > + * delete_fact: Deletes a fact from the list by name.
> > > + *
> > > + * Iterates over the list of facts and deletes the first one with th=
e same name.
> > > + * Returns true if the fact was deleted, false otherwise.
> > > + *
> > > + * Returns: bool idicating if the fact was deleted
> > > + */
> > > +static bool delete_fact(igt_fact_list *list, const char *name, const=
 char *last_test)
> > > +{
> > > +	igt_fact *fact =3D NULL;
> > > +	int i;
> > > +
> > > +	if (!list || !name || list->facts =3D=3D NULL || list->num_facts =
=3D=3D 0)
> > > +		return false;
> > > +
> > > +	fact =3D get_fact(list, name);
> > > +	if (fact =3D=3D NULL)
> > > +		return false;
> > > +
> > > +	/* Report the deletion */
> > > +	report_fact_change(fact, NULL, last_test, true);
> > > +
> > > +	/* Move all facts after the one to be deleted one step back */
> > > +	for (i =3D 0; i < list->num_facts; i++) {
> > > +		if (strcmp(list->facts[i].name, name) =3D=3D 0) {
> > > +			free(list->facts[i].name);
> > > +			free(list->facts[i].value);
> > > +
> > > +			for (int j =3D i; j < list->num_facts - 1; j++)
> > > +				list->facts[j] =3D list->facts[j + 1];
> > > +			break;
> > > +		}
> > > +	}
> > > +	list->num_facts--;
> > > +
> > > +	if (list->num_facts =3D=3D 0) {
> > > +		free(list->facts);
> > > +		list->facts =3D NULL;
> > > +	} else {
> > > +		list->facts =3D realloc(list->facts, list->num_facts * sizeof(igt_=
fact));
> > > +		igt_assert(list->facts !=3D NULL);
> > > +	}
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +/**
> > > + * set_fact: Adds a fact to the list.
> > > + *
> > > + * This is intended for the "new_list" that is created for being mer=
ged with the
> > > + * "list". It adds a new fact to the list. If the fact already exist=
s, it
> > > + * returns false.
> > > + *
> > > + * Returns: bool indicating if the fact was added
> > > + */
> > > +static bool set_fact(igt_fact_list *list, const char *name,
> > > +		     const char *value, const char *last_test)
> > > +{
> > > +	igt_fact *fact =3D NULL;
> > > +
> > > +	/* Check that name and value are not null */
> > > +	if (name =3D=3D NULL || value =3D=3D NULL)
> > > +		return false;
> > > +
> > > +	fact =3D get_fact(list, name);
> > > +	if (fact !=3D NULL)
> > > +		return false; /* Should not happen */
> > > +
> > > +	/* Add a new fact */
> > > +	list->num_facts++;
> > > +
> > > +	list->facts =3D realloc(list->facts, list->num_facts * sizeof(igt_f=
act));
> > > +	igt_assert(list->facts !=3D NULL);
> > > +
> > > +	list->facts[list->num_facts - 1].name =3D strdup(name);
> > > +	list->facts[list->num_facts - 1].value =3D strdup(value);
> > > +
> > > +	if (last_test)
> > > +		list->facts[list->num_facts - 1].last_test =3D strdup(last_test);
> > > +	else
> > > +		list->facts[list->num_facts - 1].last_test =3D NULL;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +/**
> > > + * update_list: Updates the main list with new or different facts
> > > + *
> > > + * This function is used to update the main list with new or differe=
nt facts. It
> > > + * differs from set_fact because by calling report_fact_change() as =
this is
> > > + * changing the actual fact list.
> >=20
> > Again, I think you should know this at the caller side (and you do), so
> > if you just print instead of having the report_fact_change() function,
> > you can use a single function for add and update.
>=20
> Just acking that I did read this one as well.
>=20
> >=20
> >=20
> > > + *
> > > + * Returns: bool indicating if the list was changed
> > > + */
> > > +static bool update_list(igt_fact_list *list, const char *name,
> > > +			const char *value, const char *last_test)
> > > +{
> > > +	igt_fact *fact =3D NULL;
> > > +
> > > +	/* Check that name and value are not null */
> > > +	if (name =3D=3D NULL || value =3D=3D NULL)
> > > +		return false;
> > > +
> > > +	fact =3D get_fact(list, name);
> > > +	if (fact !=3D NULL) {
> > > +		/* Return false if fact->value equals value */
> > > +		if (strcmp(fact->value, value) =3D=3D 0)
> > > +			return false; /* Not changed */
> > > +
> > > +		report_fact_change(fact, value, last_test, false);
> > > +
> > > +		/* Update the value */
> > > +		fact->value =3D strdup(value);
> > > +		return true;
> > > +	}
> > > +
> > > +	/* Add a new fact */
> > > +	list->num_facts++;
> > > +
> > > +	list->facts =3D realloc(list->facts, list->num_facts * sizeof(igt_f=
act));
> > > +	igt_assert(list->facts !=3D NULL);
> > > +
> > > +	list->facts[list->num_facts - 1].name =3D strdup(name);
> > > +	list->facts[list->num_facts - 1].value =3D strdup(value);
> > > +
> > > +	/* Report new fact */
> > > +	report_fact_change(&list->facts[list->num_facts - 1], NULL,
> > > +					   last_test, false);
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +/**
> > > + * merge_facts: Merges two lists of facts
> > > + *
> > > + * This function merges two lists of facts. It filters the facts by =
fact_group
> > > + * and deletes the ones that are not present in the new_list. It als=
o updates
> > > + * the facts that are present in both lists.
> > > + *
> > > + * As an example if fact_group is "pci_gpu", we can delete the fact
> > > + * hardware.pci.gpu_at.0000:00:02.0 if it doesn't exist in new_list.
> > > + *
> > > + * Returns: void
> > > + */
> > > +static void merge_facts(igt_fact_list *list, igt_fact_list *new_list=
,
> > > +			const char *fact_group, const char *last_test)
> > > +{
> > > +	/* Filter by fact_group and delete facts that exist on list
> > > +	 * but not on new_list
> > > +	 */
> > > +	for (int i =3D 0; i < list->num_facts; i++) {
> > > +		if (strstr(list->facts[i].name, fact_group) =3D=3D NULL)
> > > +			continue;
> > > +		if (get_fact(new_list, list->facts[i].name) =3D=3D NULL)
> > > +			delete_fact(list, list->facts[i].name, last_test);
> > > +	}
> > > +
> > > +	/* Add and update facts from new_list to list */
> > > +	for (int i =3D 0; i < new_list->num_facts; i++) {
> > > +		if (strstr(new_list->facts[i].name, fact_group) =3D=3D NULL)
> > > +			continue; /* Should never happen */

This is another case of hiding errors.  If this shouldn't happen, but
does, you should make it very visible, maybe even an igt_assert? Now
you're just ignoring it and could hide an actual problem in the test's
target code, by not detecting it due to a bug in the test code that
goes unnoticed.


> > > +		update_list(list, new_list->facts[i].name,
> > > +			    new_list->facts[i].value,
> > > +			    new_list->facts[i].last_test);
> > > +	}
> > > +}
> >=20
> > Can't you just grow the list instead of creating new ones and then
> > merging?
>=20
> Please show me the code you have in mind.

I've seen and implemented so many lists before that this just seems a
lot of complexity for such a simple, single-user list.  I don't even
understand why you need the executor to know the list... Is there going
to be more than one user using fact lists in the same thread? I'm not
saying that you should, but it _could_ even be a global in the facts.c
code that gets initialized internally when the executor calls.

In fact, you could even just have a global fixed-size array for it.=20
Since resources are not much of a concern, you could make it large
enough so that it would never, in practice, overflow.  And if it did,
just warn, crop it and keep going.  Much simpler.


> > This makes me start thinking... it would be so much easier to make all
> > this in python.  Would it be possible to glue a python script to igt-
> > runner (or whoever calls it) and get the data from dmesg, lsmod etc.?
> > Or otherwise aren't there any libraries already used by IGT that
> > include list handling?
>=20
> Absolutely no python here. Never! :-)

Oh, well.  Can't really argue against dogmas...


> > I didn't finish reviewing the rest of this patch yet.  My current
> > comment may pivot the way you're implementing this completely, so
> > better wait for your reply. :)
>=20
> I really appreciate you taking the time! Please continue.

You're welcome! I'll trying to keep going.

--
Cheers,
Luca.


> > > +
> > > +/**
> > > + * scan_pci_for_gpus: scans the pci bus for gpus using udev
> > > + *
> > > + * This function scans the pci bus for gpus using udev. It creates a=
 new list
> > > + * of facts with the pci_gpu_fact fact_group and merges it with the =
list of
> > > + * facts passed as argument.
> > > + *
> > > + * Returns: void
> > > + */
> > > +static void scan_pci_for_gpus(igt_fact_list *list, const char *last_=
test)
> > > +{
> > > +	struct udev *udev =3D NULL;
> > > +	struct udev_enumerate *enumerate =3D NULL;
> > > +	struct udev_list_entry *devices, *dev_list_entry;
> > > +	struct igt_device_card card;
> > > +	char pcistr[10];
> > > +	int ret;
> > > +	char *factname =3D NULL;
> > > +	char *factvalue =3D NULL;
> > > +	igt_fact_list new_list =3D {0};
> > > +
> > > +	udev =3D udev_new();
> > > +	if (!udev) {
> > > +		igt_warn("Failed to create udev context\n");
> > > +		return;
> > > +	}
> > > +
> > > +	enumerate =3D udev_enumerate_new(udev);
> > > +	if (!enumerate) {
> > > +		igt_warn("Failed to create udev enumerate\n");
> > > +		udev_unref(udev);
> > > +		return;
> > > +	}
> > > +
> > > +	ret =3D udev_enumerate_add_match_subsystem(enumerate, "pci");
> > > +	if (ret < 0)
> > > +		goto out;
> > > +
> > > +	ret =3D udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "=
30000");
> > > +	if (ret < 0)
> > > +		goto out;
> > > +
> > > +	ret =3D udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "=
38000");
> > > +	if (ret < 0)
> > > +		goto out;
> > > +
> > > +	ret =3D udev_enumerate_scan_devices(enumerate);
> > > +	if (ret < 0)
> > > +		goto out;
> > > +
> > > +	devices =3D udev_enumerate_get_list_entry(enumerate);
> > > +	if (!devices)
> > > +		goto out;
> > > +
> > > +	udev_list_entry_foreach(dev_list_entry, devices) {
> > > +		const char *path;
> > > +		struct udev_device *udev_dev;
> > > +		struct udev_list_entry *entry;
> > > +		char *model =3D NULL;
> > > +		char *codename =3D NULL;
> > > +
> > > +		path =3D udev_list_entry_get_name(dev_list_entry);
> > > +		udev_dev =3D udev_device_new_from_syspath(udev, path);
> > > +		if (!udev_dev)
> > > +			continue;
> > > +
> > > +		/* Strip path to only the content after the last / */
> > > +		path =3D strrchr(path, '/');
> > > +		if (path)
> > > +			path++;
> > > +		else
> > > +			path =3D "unknown";
> > > +
> > > +		strcpy(card.pci_slot_name, "-");
> > > +
> > > +		entry =3D udev_device_get_properties_list_entry(udev_dev);
> > > +		while (entry) {
> > > +			const char *name =3D udev_list_entry_get_name(entry);
> > > +			const char *value =3D udev_list_entry_get_value(entry);
> > > +
> > > +			entry =3D udev_list_entry_get_next(entry);
> > > +			if (!strcmp(name, "ID_MODEL_FROM_DATABASE"))
> > > +				model =3D strdup(value);
> > > +			else if (!strcmp(name, "PCI_ID"))
> > > +				igt_assert_eq(sscanf(value, "%hx:%hx",
> > > +						     &card.pci_vendor, &card.pci_device), 2);
> > > +		}
> > > +		snprintf(pcistr, sizeof(pcistr), "%04x:%04x",
> > > +			 card.pci_vendor, card.pci_device);
> > > +		codename =3D igt_device_get_pretty_name(&card, false);
> > > +
> > > +		/* Set codename to null if it is the same string as pci_id */
> > > +		if (codename && strcmp(pcistr, codename) =3D=3D 0) {
> > > +			free(codename);
> > > +			codename =3D NULL;
> > > +		}
> > > +		asprintf(&factname, "%s.%s", pci_gpu_fact, path);
> > > +		asprintf(&factvalue,
> > > +			"%s %s %s",
> > > +			pcistr,
> > > +			codename ? codename : "",
> > > +			model ? model : "");
> > > +
> > > +		set_fact(&new_list, factname, factvalue, last_test);
> > > +
> > > +		free(codename);
> > > +		free(model);
> > > +		udev_device_unref(udev_dev);
> > > +	}
> > > +	merge_facts(list, &new_list, pci_gpu_fact, last_test);
> > > +
> > > +out:
> > > +	udev_enumerate_unref(enumerate);
> > > +	udev_unref(udev);
> > > +}
> > > +
> > > +/**
> > > + * scan_pci_drm_cards: scans the pci bus for drm cards using udev
> > > + *
> > > + * This function scans the pci bus for drm cards using udev. It crea=
tes a new
> > > + * list of facts with the drm_card_fact fact_group and merges it wit=
h the list
> > > + * of facts passed as argument.
> > > + *
> > > + * Returns: void
> > > + */
> > > +static void scan_pci_drm_cards(igt_fact_list *list, const char *last=
_test)
> > > +{
> > > +	struct udev *udev =3D NULL;
> > > +	struct udev_enumerate *enumerate =3D NULL;
> > > +	struct udev_list_entry *devices, *dev_list_entry;
> > > +	int ret;
> > > +	char *factname =3D NULL;
> > > +	char *factvalue =3D NULL;
> > > +	igt_fact_list new_list =3D {0};
> > > +
> > > +	udev =3D udev_new();
> > > +	if (!udev)
> > > +		return;
> > > +
> > > +	enumerate =3D udev_enumerate_new(udev);
> > > +	if (!enumerate) {
> > > +		udev_unref(udev);
> > > +		return;
> > > +	}
> > > +
> > > +	ret =3D udev_enumerate_add_match_subsystem(enumerate, "drm");
> > > +	if (ret < 0)
> > > +		goto out;
> > > +
> > > +	ret =3D udev_enumerate_scan_devices(enumerate);
> > > +	if (ret < 0)
> > > +		goto out;
> > > +
> > > +	devices =3D udev_enumerate_get_list_entry(enumerate);
> > > +	if (!devices)
> > > +		goto out;
> > > +
> > > +	ret =3D udev_enumerate_add_match_subsystem(enumerate, "drm");
> > > +	if (ret < 0)
> > > +		goto out;
> > > +
> > > +	ret =3D udev_enumerate_scan_devices(enumerate);
> > > +	if (ret < 0)
> > > +		goto out;
> > > +
> > > +	devices =3D udev_enumerate_get_list_entry(enumerate);
> > > +	if (!devices)
> > > +		goto out;
> > > +
> > > +	udev_list_entry_foreach(dev_list_entry, devices) {
> > > +		const char *path;
> > > +		struct udev_device *drm_dev, *pci_dev;
> > > +		const char *drm_name, *pci_addr;
> > > +
> > > +		path =3D udev_list_entry_get_name(dev_list_entry);
> > > +		drm_dev =3D udev_device_new_from_syspath(udev, path);
> > > +		if (!drm_dev)
> > > +			continue;
> > > +
> > > +		drm_name =3D udev_device_get_sysname(drm_dev);
> > > +		/* Filter the device by name. Want devices such as card0 and card1=
.
> > > +		 * If the device has '-' in the name, contine
> > > +		 */
> > > +		if (strncmp(drm_name, "card", 4) !=3D 0 || strchr(drm_name, '-') !=
=3D NULL) {
> > > +			udev_device_unref(drm_dev);
> > > +			continue;
> > > +		}
> > > +
> > > +		/* Get the pci address of the gpu associated with the drm_dev*/
> > > +		pci_dev =3D udev_device_get_parent_with_subsystem_devtype(drm_dev,=
 "pci", NULL);
> > > +		if (pci_dev) {
> > > +			pci_addr =3D udev_device_get_sysattr_value(pci_dev, "address");
> > > +			if (!pci_addr)
> > > +				pci_addr =3D udev_device_get_sysname(pci_dev);
> > > +		} else {
> > > +			/* Some GPUs are platform devices. Ignore them. */
> > > +			pci_addr =3D NULL;
> > > +			udev_device_unref(drm_dev);
> > > +			continue;
> > > +		}
> > > +		asprintf(&factname, "%s.%s", drm_card_fact, pci_addr);
> > > +		asprintf(&factvalue, "%s", drm_name);
> > > +		set_fact(&new_list, factname, factvalue, last_test);
> > > +
> > > +		udev_device_unref(drm_dev);
> > > +	}
> > > +	if (new_list.num_facts > 0)
> > > +		merge_facts(list, &new_list, drm_card_fact, last_test);
> > > +
> > > +out:
> > > +	udev_enumerate_unref(enumerate);
> > > +	udev_unref(udev);
> > > +}
> > > +
> > > +/**
> > > + * scan_kernel_tainted: scans for kernel taints using existing igt i=
nfra
> > > + *
> > > + * This function scans for kernel taints using igt_kernel_tainted() =
and
> > > + * igt_explain_taints(). It will cut off the explanation keeping onl=
y the
> > > + * taint name.
> > > + *
> > > + * Returns: void
> > > + */
> > > +static void scan_kernel_tainted(igt_fact_list *list, const char *las=
t_test)
> > > +{
> > > +	unsigned long taints =3D 0;
> > > +	const char *reason =3D NULL;
> > > +	char *taint_name =3D NULL;
> > > +	char *fact_name =3D NULL;
> > > +	igt_fact_list new_list =3D {0};
> > > +
> > > +	taints =3D igt_kernel_tainted(&taints);
> > > +	/* For testing, set all bits to 1
> > > +	 * taints =3D 0xFFFFFFFF;
> > > +	 */
> > > +
> > > +	while ((reason =3D igt_explain_taints(&taints)) !=3D NULL) {
> > > +		/* Cut at the ':' to get only the taint name */
> > > +		taint_name =3D strtok(strdup(reason), ":");
> > > +		if (!taint_name)
> > > +			continue;
> > > +
> > > +		/* Lowercase taint_name */
> > > +		for (int i =3D 0; taint_name[i]; i++)
> > > +			taint_name[i] =3D tolower(taint_name[i]);
> > > +
> > > +		asprintf(&fact_name, "%s.%s", ktaint_fact, taint_name);
> > > +		set_fact(&new_list, fact_name, "true", last_test);
> > > +
> > > +		free(taint_name);
> > > +		free(fact_name);
> > > +	}
> > > +
> > > +	merge_facts(list, &new_list, ktaint_fact, last_test);
> > > +}
> > > +
> > > +
> > > +/**
> > > + * scan_kernel_loaded_kmods: scans for loaded kmods using igt_fact_k=
mod_list
> > > + * and igt_kmod_is_loaded()
> > > + *
> > > + * This function scans for loaded kmods using igt_fact_kmod_list and
> > > + * igt_kmod_is_loaded(). It creates a new list of facts with the kmo=
d_fact
> > > + * fact_group and merges it with the list of facts passed as argumen=
t.
> > > + *
> > > + * Returns: void
> > > + */
> > > +static void scan_kernel_loaded_kmods(igt_fact_list *list, const char=
 *last_test)
> > > +{
> > > +	char *name =3D NULL;
> > > +	igt_fact_list new_list =3D {0};
> > > +
> > > +	/* Iterate over igt_fact_kmod_list[] until the element contains "\0=
" */
> > > +	for (int i =3D 0; strcmp(igt_fact_kmod_list[i], "\0") !=3D 0; i++) =
{
> > > +		asprintf(&name, "%s.%s", kmod_fact, igt_fact_kmod_list[i]);
> > > +		if (igt_kmod_is_loaded(igt_fact_kmod_list[i]))
> > > +			set_fact(&new_list, name, "true", last_test);
> > > +
> > > +		free(name);
> > > +	}
> > > +	merge_facts(list, &new_list, kmod_fact, last_test);
> > > +}
> > > +
> > > +/**
> > > + * igt_facts: the main public function for igt_facts
> > > + *
> > > + * Call this function where you want to gather and report facts.
> > > + *
> > > + * Returns: void
> > > + */
> > > +void igt_facts(igt_fact_list *list, const char *last_test)
> > > +{
> > > +	scan_pci_for_gpus(list, last_test);
> > > +	scan_pci_drm_cards(list, last_test);
> > > +	scan_kernel_tainted(list, last_test);
> > > +	scan_kernel_loaded_kmods(list, last_test);
> > > +
> > > +	/* Flush stdout and stderr */
> > > +	fflush(stdout);
> > > +	fflush(stderr);
> > > +}
> > > +
> > > +/**
> > > + * print_all_facts: prints all facts in the list
> > > + *
> > > + * This function prints all facts in the list.
> > > + *
> > > + * Returns: void
> > > + */
> > > +void print_all_facts(igt_fact_list *list)
> > > +{
> > > +	igt_info("Number of facts: %d\n", list->num_facts);
> > > +	for (int i =3D 0; i < list->num_facts; i++)
> > > +		igt_info(" - %s: %s\n", list->facts[i].name, list->facts[i].value)=
;
> > > +}
> > > +
> > > +
> > > +/*
> > > + * Testing
> > > + *
> > > + * Defined here so that we can keep most of the functions static
> > > + *
> > > + */
> > > +
> > > +/**
> > > + * igt_facts_test_pci_gpu: Tests set_fact and merge_facts for a pci =
gpu
> > > + *
> > > + * Returns: void
> > > + */
> > > +static void igt_facts_test_pci_gpu(igt_fact_list *list,
> > > +				   const char *last_test,
> > > +				   int index)
> > > +{
> > > +	igt_fact_list new_list =3D {0};
> > > +
> > > +	set_fact(&new_list, /* fact list */
> > > +		 "hardware.pci.gpu_at_addr.0000:00:02.0",
> > > +		 "8086:64a0 Intel Lunarlake (Gen20)",
> > > +		 last_test);
> > > +
> > > +	igt_assert_eq(new_list.num_facts, 1);
> > > +	igt_assert_eq(strcmp(new_list.facts[0].name,
> > > +		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
> > > +	igt_assert_eq(strcmp(new_list.facts[0].value,
> > > +		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
> > > +	igt_assert(new_list.facts[0].last_test =3D=3D NULL);
> > > +
> > > +	merge_facts(list, &new_list, pci_gpu_fact, last_test);
> > > +	igt_assert_eq(list->num_facts, index + 1);
> > > +	igt_assert_eq(strcmp(list->facts[index].name,
> > > +		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
> > > +	igt_assert_eq(strcmp(list->facts[index].value,
> > > +		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
> > > +
> > > +}
> > > +
> > > +/**
> > > + * igt_facts_test_i915_kmod: Tests set_fact and merge_facts for the =
i915 kmod
> > > + *
> > > + * Returns: void
> > > + */
> > > +static void igt_facts_test_i915_kmod(igt_fact_list *list,
> > > +				     const char *last_test,
> > > +				     int index)
> > > +{
> > > +	igt_fact_list new_list =3D {0};
> > > +
> > > +	set_fact(&new_list,
> > > +		 "kernel.kmod_is_loaded.i915",
> > > +		 "true",
> > > +		 last_test);
> > > +
> > > +	igt_assert_eq(new_list.num_facts, 1);
> > > +	igt_assert_eq(strcmp(new_list.facts[0].name,
> > > +		      "kernel.kmod_is_loaded.i915"), 0);
> > > +	igt_assert_eq(strcmp(new_list.facts[0].value, "true"), 0);
> > > +	igt_assert(new_list.facts[0].last_test =3D=3D NULL);
> > > +
> > > +	merge_facts(list, &new_list, kmod_fact, last_test);
> > > +	igt_assert_eq(list->num_facts, index + 1);
> > > +	igt_assert_eq(strcmp(list->facts[index].name,
> > > +		      "kernel.kmod_is_loaded.i915"), 0);
> > > +	igt_assert_eq(strcmp(list->facts[index].value, "true"), 0);
> > > +}
> > > +
> > > +/**
> > > + * igt_facts_test_delete_facts: Tests delete_fact in different scena=
rios
> > > + *
> > > + * Returns: void
> > > + */
> > > +static void igt_facts_test_delete_fact(igt_fact_list *list,
> > > +				       const char *last_test)
> > > +{
> > > +	igt_info("Testing delete_fact()\n");
> > > +
> > > +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
> > > +	igt_assert_eq(list->num_facts, 1);
> > > +	igt_assert_eq(strcmp(list->facts[0].name,
> > > +		      "hardware.pci.gpu_at_addr.0000:00:02.0"), 0);
> > > +	igt_assert_eq(strcmp(list->facts[0].value,
> > > +		      "8086:64a0 Intel Lunarlake (Gen20)"), 0);
> > > +
> > > +	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
> > > +	igt_assert_eq(list->num_facts, 0);
> > > +
> > > +	/* Test delete on an empty list */
> > > +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
> > > +	igt_assert_eq(list->num_facts, 0);
> > > +
> > > +	/* Test delete on reverse order */
> > > +	igt_facts_test_pci_gpu(list, NULL, 0);
> > > +	igt_facts_test_i915_kmod(list, NULL, 1);
> > > +	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
> > > +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
> > > +	igt_assert_eq(list->num_facts, 0);
> > > +
> > > +	/* List is empty from now on*/
> > > +	delete_fact(list, "hardware.pci.gpu_at_addr.0000:00:02.0", NULL);
> > > +	delete_fact(list, "kernel.kmod_is_loaded.i915", NULL);
> > > +	igt_assert_eq(list->num_facts, 0);
> > > +}
> > > +
> > > +/**
> > > + * igt_facts_test: Main function for testing the igt_facts module
> > > + *
> > > + * Returns: bool indicating if the tests passed
> > > + */
> > > +bool igt_facts_test(void)
> > > +{
> > > +	igt_fact_list fact_list =3D {0};
> > > +
> > > +	/* Test set_fact for the pci gpu */
> > > +	igt_info("Testing set_fact()\n");
> > > +	igt_facts_test_pci_gpu(&fact_list, NULL, 0);
> > > +	igt_facts_test_i915_kmod(&fact_list, NULL, 1);
> > > +
> > > +	/* Test delete_fact */
> > > +	igt_facts_test_delete_fact(&fact_list, NULL);
> > > +
> > > +	return true;
> > > +}
> > > diff --git a/lib/igt_facts.h b/lib/igt_facts.h
> > > new file mode 100644
> > > index 000000000..e3c2c77eb
> > > --- /dev/null
> > > +++ b/lib/igt_facts.h
> > > @@ -0,0 +1,34 @@
> > > +/* SPDX-License-Identifier: MIT
> > > + * Copyright =C2=A9 2024 Intel Corporation
> > > + */
> > > +
> > > +#include <stdbool.h>
> > > +
> > > +typedef struct {
> > > +	char *name;
> > > +	char *value;
> > > +	char *last_test;
> > > +} igt_fact;
> > > +
> > > +typedef struct {
> > > +	igt_fact *facts;
> > > +	int num_facts;
> > > +} igt_fact_list;
> > > +
> > > +const char *igt_fact_kmod_list[] =3D {
> > > +	"amdgpu",
> > > +	"i915",
> > > +	"nouveau",
> > > +	"radeon",
> > > +	"xe",
> > > +	"\0"
> > > +};
> > > +
> > > +const char *kmod_fact     =3D "kernel.kmod_is_loaded"; /* true or fa=
lse */
> > > +const char *ktaint_fact   =3D "kernel.is_tainted"; /* taint name: ta=
int_warn */
> > > +const char *pci_gpu_fact  =3D "hardware.pci.gpu_at_addr"; /* id vend=
or model */
> > > +const char *drm_card_fact =3D "hardware.pci.drm_card_at_addr"; /* ca=
rdX */
> > > +
> > > +void igt_facts(igt_fact_list *list, const char *last_test);
> > > +void print_all_facts(igt_fact_list *list);
> > > +bool igt_facts_test(void); /* For unit testing only */
> > > diff --git a/lib/meson.build b/lib/meson.build
> > > index c3556a921..c44ca2b5a 100644
> > > --- a/lib/meson.build
> > > +++ b/lib/meson.build
> > > @@ -18,6 +18,7 @@ lib_sources =3D [
> > >  	'i915/i915_crc.c',
> > >  	'igt_collection.c',
> > >  	'igt_color_encoding.c',
> > > +	'igt_facts.c',
> > >  	'igt_crc.c',
> > >  	'igt_debugfs.c',
> > >  	'igt_device.c',
> > > diff --git a/lib/tests/igt_facts.c b/lib/tests/igt_facts.c
> > > new file mode 100644
> > > index 000000000..4b1c8a80c
> > > --- /dev/null
> > > +++ b/lib/tests/igt_facts.c
> > > @@ -0,0 +1,15 @@
> > > +// SPDX-License-Identifier: MIT
> > > +// Copyright =C2=A9 2024 Intel Corporation
> > > +
> > > +#include <stdbool.h>
> > > +
> > > +#include "igt_core.h"
> > > +#include "igt_facts.h"
> > > +
> > > +/* Tests are not defined here so we can keep most of the functions s=
tatic */
> > > +
> > > +igt_simple_main
> > > +{
> > > +	igt_info("Running igt_facts_test\n");
> > > +	igt_assert(igt_facts_test() =3D=3D true);
> > > +}
> > > diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> > > index df8092638..1ce19f63c 100644
> > > --- a/lib/tests/meson.build
> > > +++ b/lib/tests/meson.build
> > > @@ -8,6 +8,7 @@ lib_tests =3D [
> > >  	'igt_dynamic_subtests',
> > >  	'igt_edid',
> > >  	'igt_exit_handler',
> > > +	'igt_facts',
> > >  	'igt_fork',
> > >  	'igt_fork_helper',
> > >  	'igt_hook',
> > > diff --git a/runner/executor.c b/runner/executor.c
> > > index ac73e1dde..6ff252174 100644
> > > --- a/runner/executor.c
> > > +++ b/runner/executor.c
> > > @@ -35,6 +35,7 @@
> > >  #include "executor.h"
> > >  #include "output_strings.h"
> > >  #include "runnercomms.h"
> > > +#include "igt_facts.h"
> > > =20
> > >  #define KMSG_HEADER "[IGT] "
> > >  #define KMSG_WARN 4
> > > @@ -2306,6 +2307,8 @@ bool execute(struct execute_state *state,
> > >  	sigset_t sigmask;
> > >  	double time_spent =3D 0.0;
> > >  	bool status =3D true;
> > > +	igt_fact_list fact_list =3D {0};
> > > +	char *last_test =3D NULL;
> > > =20
> > >  	if (state->dry) {
> > >  		outf("Dry run, not executing. Invoke igt_resume if you want to exe=
cute.\n");
> > > @@ -2438,6 +2441,10 @@ bool execute(struct execute_state *state,
> > >  		int result;
> > >  		bool already_written =3D false;
> > > =20
> > > +		/* Calls before running each test */
> > > +		igt_facts(&fact_list, last_test);
> > > +		last_test =3D entry_display_name(&job_list->entries[state->next]);
> > > +
> > >  		if (should_die_because_signal(sigfd)) {
> > >  			status =3D false;
> > >  			goto end;
> > > @@ -2526,6 +2533,8 @@ bool execute(struct execute_state *state,
> > >  			return execute(state, settings, job_list);
> > >  		}
> > >  	}
> > > +	/* Last call to collect facts after the last test runs */
> > > +	igt_facts(&fact_list, last_test);
> > > =20
> > >  	if ((timefd =3D openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY =
| O_EXCL, 0666)) >=3D 0) {
> > >  		dprintf(timefd, "%f\n", timeofday_double());
>=20

