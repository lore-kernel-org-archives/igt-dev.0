Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A76D62060
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 10:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928E410E604;
	Tue, 19 Nov 2024 10:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPacW0of";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E8910E604
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732010840; x=1763546840;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NKKhYaI4EhpA1Vv7qrPdtpwByHBvPiPiUH0pblTD8Qg=;
 b=fPacW0ofvIWCNLhKBtLJlQRq9O+gAPsaYVucitnY8PwyTU+WKClI/mJP
 8iEOzBFBi9etUnaBwtmy7UxuS2ZVXXLBXkuzmPHAN3OIa32e0EMZyIN70
 olZN7RSskJV7GHNa18aDPziTlKfBH3IxiOnXXog+ovSoR+Eepj+Ah0U0T
 6WRTECq5XmnILpZr9frkz20PjysW7Gd0w/gTH7moQK5ShUngpJTfBe/JR
 O5QUs1rW6pt7AeCbE5lE9OdcOq1jFkJsovBlXJIs6/Obt9FwjzUtMdyvo
 oeE9BmShkeREZU+ZQ5KWU52e4PXDMrCSvyPMdx6kP+eEw4Ji2ikxmjdMT Q==;
X-CSE-ConnectionGUID: 4nfxL4TqTKi9L1PuG+gDvw==
X-CSE-MsgGUID: vz2kqUoBSVy7+dOFABQlVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="49537712"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="49537712"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:07:19 -0800
X-CSE-ConnectionGUID: 2JNk1pchSyq+c/QKAzse/g==
X-CSE-MsgGUID: lIY6BnoMR9KPpTr3+lokWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="90312609"
Received: from jjwhelan-mobl3.ger.corp.intel.com (HELO [10.213.197.40])
 ([10.213.197.40])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:07:17 -0800
Message-ID: <ae7b998d-6675-480e-9ce6-c822208b5009@linux.intel.com>
Date: Tue, 19 Nov 2024 11:07:14 +0100
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
 <6ed12243-172d-433a-a203-4176be7ee53c@linux.intel.com>
 <51b9e5c77447517a40da09cc38222ef719801bb3.camel@coelho.fi>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <51b9e5c77447517a40da09cc38222ef719801bb3.camel@coelho.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 19.11.2024 09:19, Luca Coelho wrote:
> On Mon, 2024-11-18 at 17:03 +0100, Peter Senna Tschudin wrote:
>>
>> On 18.11.2024 14:07, Luca Coelho wrote:
>> [...]
>>>> +
>>>> +/**
>>>> + * report_fact_change: prints changes using igt_info()
>>>> + *
>>>> + * Reports facts that are new, changed and deleted.
>>>> + *
>>>> + * Returns: void
>>>> + */
>>>
>>> If you are planning to create docs from this (which I assume you do,
>>> because of the "/**"), you should add descriptions to all function
>>> arguments, otherwise you'll get warnings, I think.
>>
>> Thank you for the heads up. I will double check.
>>
>>>
>>>
>>>> +static void report_fact_change(igt_fact *fact, const char *new_value,
>>>> +			       const char *last_test, bool delete)
>>>
>>> I think you don't need this function.  If you take away all the
>>> boilerplate and the checks to see who is actually calling the function
>>> (i.e. if it is new, update, delete...), all that remains is an
>>> igt_info() call.  It seems to me that you are checking things which you
>>> already knew again inside this function.
>>
>> No no, this is absolutely needed. I am not concerned with additional
>> function calls at this scale as we can comfortably afford them.
> 
> I have to disagree with "absolutely needed".  How can a new feature
> implementation _require_ a specific function to exist?
> 
> 
>> The reason why this is a separated function is because logging is the
>> most important function of the patch, and I want to make sure it is in a
>> single function. It is a desing choice that I am happy with.
> 
> Sure, I get that.  But I don't see how adding a lot of boiler plate and
> redundant code can help.

Hi, and thank you for taking the time. Please show me what you have in
mind here. How can we have all logging in a separate function with code
that you are happy with?


> 
> This all-important function is static and hidden well inside the code,
> being called by the list functions (also static), which in turn are
> called by other static functions until finally reaching igt_facts(),
> which is the one that is exported.

I get you weight priorities differently, but you really did not offer me
what is the benefit is of getting rid of the logging function. When I
made the decision I had ease of change in mind. I wanted to make sure to
make it as simple as possible to change the logging. The reason being
that we may need to do stuff like creating files to save the logs in the
future. So this is the benefit we get from having a separate logging
function: making it easy to change _how_ we log, and _what_ we log.

What do we get by doing it your way?

> 
> 
>>>> +{
>>>> +	struct timespec uptime_ts;
>>>> +	char *uptime = NULL;
>>>> +	bool changed = false;
>>>> +	const char *before_tests   = "before any test";
>>>> +
>>>> +	if (clock_gettime(CLOCK_BOOTTIME, &uptime_ts) != 0)
>>>> +		return;
>>>> +
>>>> +	asprintf(&uptime,
>>>> +		 "%ld.%06ld",
>>>> +		 uptime_ts.tv_sec,
>>>> +		 uptime_ts.tv_nsec / 1000);
>>>> +
>>>> +	/* If delete is true, the fact was deleted */
>>>> +	if (delete) {
>>>> +		igt_info("[%s] [FACT %s] deleted: %s: %s\n",
>>>> +			 uptime,
>>>> +			 last_test ? last_test : before_tests,
>>>> +			 fact->name,
>>>> +			 fact->value);
>>>> +		return;
>>>> +	}
>>>
>>> For example here, only the deletion code calls this function with
>>> delete == true, so it could just as well print the info by itself.
>>>
>>> Same thing for the subsequent blocks.
>>
>> Oh yeah!
>>
>>
>>>
>>>
>>>> +
>>>> +	/* If new_value is NULL, it is a new fact */
>>>> +	if (new_value == NULL) {
>>>> +		igt_info("[%s] [FACT %s] new: %s: %s\n",
>>>> +			 uptime,
>>>> +			 last_test ? last_test : before_tests,
>>>> +			 fact->name,
>>>> +			 fact->value);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	/* Check if the value changed
>>>> +	 *
>>>> +	 * There is a corner case because the gpu driver can change the human
>>>> +	 * readeable strings. If the fact->name contains pci_gpu_fact, compare
>>>> +	 * just the first nine characters (pci_id).
>>>> +	 */
>>>> +	if (strstr(fact->name, pci_gpu_fact) != NULL) {
>>>> +		if (strncmp(fact->value, new_value, 9) != 0)
>>>> +			changed = true;
>>>> +	} else if (strcmp(fact->value, new_value) != 0)
>>>> +		changed = true;
>>>
>>> And this, the only actual logic in this function is better done when
>>> you get this information.
>>
>> Having a separate function for logging is a design decision. Feel free
>> to propose concrete changes that keep it as a separate function.
> 
> This is not related to logging in itself.  According to what I
> understood from your comment, this was because the _input_ can change
> the later part of the string without this being a significant fact
> change.  I thought it would be better to keep this check in the part of
> the code that actually knows what this string is, namely, the function
> that reads it from the kernel.
> 
> Now that I think about it again, I think I understand your view.  It's
> probably because you want to make this decision (to log or not to log)
> here.  So this is fine.

Thanks

> 
> 
>>>> +
>>>> +	if (changed) {
>>>> +		igt_info("[%s] [FACT %s] changed: %s: %s -> %s\n",
>>>> +			 uptime,
>>>> +			 last_test,
>>>> +			 fact->name,
>>>> +			 fact->value,
>>>> +			 new_value);
>>>> +		changed = false;
>>>> +	}
>>>> +	free(uptime);
>>>> +}
>>>> +
>>>> +/**
>>>> + * get_fact: Returns a fact from the list by name.
>>>> + *
>>>> + * Iterates over the list of facts and returns the first one with the same name.
>>>> + * If no fact is found, returns NULL.
>>>> + *
>>>> + * Returns: igt_fact* or NULL
>>>> + */
>>>> +static igt_fact *get_fact(igt_fact_list *list, const char *name)
>>>> +{
>>>> +	if (!list || list->facts == NULL || list->num_facts == 0)
>>>> +		return NULL;
>>>
>>> AFAICT list->facts == NULL and list->num_facts == 0 are redundant here,
>>> right? It should not happen.  And if you did lose track of the
>>> num_facts you actually had in the list (regardless of whether it's
>>> zero), you would be in trouble in other places too.
>>
>> For me, redundancy is not a problem. Again, this was a design decision.
>> I am in no way trying to minimize the number of comparisons or optimize
>> to the level you are mentioning.
> 
> Redundancy is not a problem per se, if it's deemed important for
> readability, performance etc.  I don't think it is, in this case.
> 
> 
>> For me it is more important to catch errors here, to increase chances of
>> preventing weird behaviors downdstream. I am very happy to pay the very
>> small price of redundant checks.
> 
> You're hiding errors here.  If list->facts is not NULL, but list-
>> num_facts == 0, you'll simply return, as if there were nothing in the
> list, when in fact the list is broken.  The weird behavior could still
> happen elsewhere, for instance, in the merge_facts() function you have
> this:
> 
> 	for (int i = 0; i < list->num_facts; i++) {
> 		if (strstr(list->facts[i].name, fact_group) == NULL)
> 			continue;
> 
> You are assuming list->facts is not NULL based on list->num_facts being
> greater than zero.

Thank you for that. I will make sure to extend the unit testing to cover
the case you described:
 list->facts is not NULL
 list->num_facts == 0

> 
> 
>>>> +	for (int i = 0; i < list->num_facts; i++) {
>>>> +		if (list->facts[i].name == NULL)
>>>> +			continue;
>>>> +
>>>> +		if (strcmp(list->facts[i].name, name) == 0)
>>>> +			return &list->facts[i];
>>>> +	}
>>>> +	return NULL;
>>>> +}
>>>> +
>>>> +/**
>>>> + * delete_fact: Deletes a fact from the list by name.
>>>> + *
>>>> + * Iterates over the list of facts and deletes the first one with the same name.
>>>> + * Returns true if the fact was deleted, false otherwise.
>>>> + *
>>>> + * Returns: bool idicating if the fact was deleted
>>>> + */
>>>> +static bool delete_fact(igt_fact_list *list, const char *name, const char *last_test)
>>>> +{
>>>> +	igt_fact *fact = NULL;
>>>> +	int i;
>>>> +
>>>> +	if (!list || !name || list->facts == NULL || list->num_facts == 0)
>>>> +		return false;
>>>> +
>>>> +	fact = get_fact(list, name);
>>>> +	if (fact == NULL)
>>>> +		return false;
>>>> +
>>>> +	/* Report the deletion */
>>>> +	report_fact_change(fact, NULL, last_test, true);
>>>> +
>>>> +	/* Move all facts after the one to be deleted one step back */
>>>> +	for (i = 0; i < list->num_facts; i++) {
>>>> +		if (strcmp(list->facts[i].name, name) == 0) {
>>>> +			free(list->facts[i].name);
>>>> +			free(list->facts[i].value);
>>>> +
>>>> +			for (int j = i; j < list->num_facts - 1; j++)
>>>> +				list->facts[j] = list->facts[j + 1];
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +	list->num_facts--;
>>>> +
>>>> +	if (list->num_facts == 0) {
>>>> +		free(list->facts);
>>>> +		list->facts = NULL;
>>>> +	} else {
>>>> +		list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
>>>> +		igt_assert(list->facts != NULL);
>>>> +	}
>>>> +
>>>> +	return true;
>>>> +}
>>>> +
>>>> +/**
>>>> + * set_fact: Adds a fact to the list.
>>>> + *
>>>> + * This is intended for the "new_list" that is created for being merged with the
>>>> + * "list". It adds a new fact to the list. If the fact already exists, it
>>>> + * returns false.
>>>> + *
>>>> + * Returns: bool indicating if the fact was added
>>>> + */
>>>> +static bool set_fact(igt_fact_list *list, const char *name,
>>>> +		     const char *value, const char *last_test)
>>>> +{
>>>> +	igt_fact *fact = NULL;
>>>> +
>>>> +	/* Check that name and value are not null */
>>>> +	if (name == NULL || value == NULL)
>>>> +		return false;
>>>> +
>>>> +	fact = get_fact(list, name);
>>>> +	if (fact != NULL)
>>>> +		return false; /* Should not happen */
>>>> +
>>>> +	/* Add a new fact */
>>>> +	list->num_facts++;
>>>> +
>>>> +	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
>>>> +	igt_assert(list->facts != NULL);
>>>> +
>>>> +	list->facts[list->num_facts - 1].name = strdup(name);
>>>> +	list->facts[list->num_facts - 1].value = strdup(value);
>>>> +
>>>> +	if (last_test)
>>>> +		list->facts[list->num_facts - 1].last_test = strdup(last_test);
>>>> +	else
>>>> +		list->facts[list->num_facts - 1].last_test = NULL;
>>>> +
>>>> +	return true;
>>>> +}
>>>> +
>>>> +/**
>>>> + * update_list: Updates the main list with new or different facts
>>>> + *
>>>> + * This function is used to update the main list with new or different facts. It
>>>> + * differs from set_fact because by calling report_fact_change() as this is
>>>> + * changing the actual fact list.
>>>
>>> Again, I think you should know this at the caller side (and you do), so
>>> if you just print instead of having the report_fact_change() function,
>>> you can use a single function for add and update.
>>
>> Just acking that I did read this one as well.
>>
>>>
>>>
>>>> + *
>>>> + * Returns: bool indicating if the list was changed
>>>> + */
>>>> +static bool update_list(igt_fact_list *list, const char *name,
>>>> +			const char *value, const char *last_test)
>>>> +{
>>>> +	igt_fact *fact = NULL;
>>>> +
>>>> +	/* Check that name and value are not null */
>>>> +	if (name == NULL || value == NULL)
>>>> +		return false;
>>>> +
>>>> +	fact = get_fact(list, name);
>>>> +	if (fact != NULL) {
>>>> +		/* Return false if fact->value equals value */
>>>> +		if (strcmp(fact->value, value) == 0)
>>>> +			return false; /* Not changed */
>>>> +
>>>> +		report_fact_change(fact, value, last_test, false);
>>>> +
>>>> +		/* Update the value */
>>>> +		fact->value = strdup(value);
>>>> +		return true;
>>>> +	}
>>>> +
>>>> +	/* Add a new fact */
>>>> +	list->num_facts++;
>>>> +
>>>> +	list->facts = realloc(list->facts, list->num_facts * sizeof(igt_fact));
>>>> +	igt_assert(list->facts != NULL);
>>>> +
>>>> +	list->facts[list->num_facts - 1].name = strdup(name);
>>>> +	list->facts[list->num_facts - 1].value = strdup(value);
>>>> +
>>>> +	/* Report new fact */
>>>> +	report_fact_change(&list->facts[list->num_facts - 1], NULL,
>>>> +					   last_test, false);
>>>> +
>>>> +	return true;
>>>> +}
>>>> +
>>>> +/**
>>>> + * merge_facts: Merges two lists of facts
>>>> + *
>>>> + * This function merges two lists of facts. It filters the facts by fact_group
>>>> + * and deletes the ones that are not present in the new_list. It also updates
>>>> + * the facts that are present in both lists.
>>>> + *
>>>> + * As an example if fact_group is "pci_gpu", we can delete the fact
>>>> + * hardware.pci.gpu_at.0000:00:02.0 if it doesn't exist in new_list.
>>>> + *
>>>> + * Returns: void
>>>> + */
>>>> +static void merge_facts(igt_fact_list *list, igt_fact_list *new_list,
>>>> +			const char *fact_group, const char *last_test)
>>>> +{
>>>> +	/* Filter by fact_group and delete facts that exist on list
>>>> +	 * but not on new_list
>>>> +	 */
>>>> +	for (int i = 0; i < list->num_facts; i++) {
>>>> +		if (strstr(list->facts[i].name, fact_group) == NULL)
>>>> +			continue;
>>>> +		if (get_fact(new_list, list->facts[i].name) == NULL)
>>>> +			delete_fact(list, list->facts[i].name, last_test);
>>>> +	}
>>>> +
>>>> +	/* Add and update facts from new_list to list */
>>>> +	for (int i = 0; i < new_list->num_facts; i++) {
>>>> +		if (strstr(new_list->facts[i].name, fact_group) == NULL)
>>>> +			continue; /* Should never happen */
> 
> This is another case of hiding errors.  If this shouldn't happen, but
> does, you should make it very visible, maybe even an igt_assert? Now
> you're just ignoring it and could hide an actual problem in the test's
> target code, by not detecting it due to a bug in the test code that
> goes unnoticed.

Yes, thank you for that too!

> 
> 
>>>> +		update_list(list, new_list->facts[i].name,
>>>> +			    new_list->facts[i].value,
>>>> +			    new_list->facts[i].last_test);
>>>> +	}
>>>> +}
>>>
>>> Can't you just grow the list instead of creating new ones and then
>>> merging?
>>
>> Please show me the code you have in mind.
> 
> I've seen and implemented so many lists before that this just seems a
> lot of complexity for such a simple, single-user list.  I don't even
> understand why you need the executor to know the list... Is there going
> to be more than one user using fact lists in the same thread? I'm not
> saying that you should, but it _could_ even be a global in the facts.c
> code that gets initialized internally when the executor calls.
> 
> In fact, you could even just have a global fixed-size array for it. 
> Since resources are not much of a concern, you could make it large
> enough so that it would never, in practice, overflow.  And if it did,
> just warn, crop it and keep going.  Much simpler.
> 
> 
>>> This makes me start thinking... it would be so much easier to make all
>>> this in python.  Would it be possible to glue a python script to igt-
>>> runner (or whoever calls it) and get the data from dmesg, lsmod etc.?
>>> Or otherwise aren't there any libraries already used by IGT that
>>> include list handling?
>>
>> Absolutely no python here. Never! :-)
> 
> Oh, well.  Can't really argue against dogmas...

Wow, that was a low punch. This code is going to run about 1M times /
day in our CI. There is history that precedes me working on IGT of
issues created by trying to mix c and python in igt. The reasons for not
trying python again are runtime overhead and the history of such
attempts in igt that just made a bunch of people and our CI very upset.

[...]

Thanks, I will update and resend.
