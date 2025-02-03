Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA2CC02192
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 09:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27DA10E2BE;
	Mon,  3 Feb 2025 09:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzhOp1cC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100A210E2BE
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738573859; x=1770109859;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Jqgx9Mu9FeZWNYh41IEUJTs2CX5ZOsfmLf5CmwZU/UY=;
 b=mzhOp1cCDtGjhPzBUgChO5Yy58pZNvqhAQ0sVO90HeZeZ1Fr16InJHac
 NgVXZdp3NKkMib7oPPbYvPcePrCMeg3t6u0J7KUhch20tcHzxwsjfHYyg
 cxAymlIhQCVG/V2JHFFtppyNERTdsIjoCStEJQJMCJMIc20l5FPbD1hGG
 iux5w9N0lXgJVNddtIo4CZ7XJBSDgA45uXlgpw7aR7f7IgV5d3qquLmFI
 0rcfyRjz7qDWmVUgOxbxBVa/ua3YUBPNtRZqrzDqLcRf7U5XQa4mAtPFH
 0RouMFQHhwtCHGf2AGFo+JnagQag+wfnkTn/jDwdlVG4Z/7h9CWeNUlgp w==;
X-CSE-ConnectionGUID: Qx7JW+mTTg2ax6fdrmAZ7A==
X-CSE-MsgGUID: nBGasH+VT5m85/sK1rqzcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39199068"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="39199068"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:10:58 -0800
X-CSE-ConnectionGUID: eCPaf9ccQhWLaPKcNjSjTw==
X-CSE-MsgGUID: IcvO9QsWQDOF4Q+0O/2nlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114255007"
Received: from nwochtma-mobl.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:10:56 -0800
Message-ID: <f766e3af-cdc2-4e9f-a672-c323c19298b5@linux.intel.com>
Date: Mon, 3 Feb 2025 10:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] runner/executor: Integrate igt_kmemleak scans
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-3-peter.senna@linux.intel.com>
 <20250131125018.daqboesdcfuvsqrw@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250131125018.daqboesdcfuvsqrw@kamilkon-desk.igk.intel.com>
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

Hi Kamil,

Thank you for the review.

[...]

>>  		igt_facts_lists_init();
>>  
>> +	if (settings->kmemleak)
>> +		if (!igt_kmemleak_init(NULL)) {
>> +			errf("Failed to initialize kmemleak. Is kernel support enabled?\n");
>> +			errf("Disabling kmemleak on igt_runner and continuing...\n");
> 
> Make it one errf() call, split string if needed.
chekcpatch does not like multi-line strings. Can you show me the code
you want me to use here that satisfies you and checkpatch at the same time?


[...]
> 
>> +			settings->kmemleak = settings->kmemleak_each = false;
> 
> Avoid this, write two assinments here.

I personally find this very elegant, but sure, I will make the change.

[...]

>> @@ -718,6 +723,7 @@ igt_main
>>  	igt_subtest("parse-clears-old-data") {
>>  		const char *argv[] = { "runner",
>>  				       "-n", "foo",
>> +				       "--overwrite",
> 
> Do not make unrelated changes, add only kmemleak.
> You also didn't write about this change in description, if you
> think it is a fix it should go in separate patch, not here.

These are not unrelated. First as this is unit testing, this has no
downstream effects. Second, I am adding --overwrite to grow the argv
array. The reason for that is to be able to test the new argument.

As I had explained to Jonathan Cavitt in a previous email, the alternative
to adding an extra option would be to change how the entire file allocates
argv[] which felt like an overkill. If adding an extra option that has no
downstream effect is unacceptable, please let me know how you want me to
grow the array with an example.

> 
>>  				       "--dry-run",
>>  				       "--allow-non-root",
>>  				       "test-root-dir",
>> @@ -727,21 +733,29 @@ igt_main
>>  		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
>>  
>>  		igt_assert_eqstr(settings->name, "foo");
>> +		igt_assert(settings->overwrite);
> 
> Same here, unrelated.
Updating the unit testing to take overwrite into account.

> 
>>  		igt_assert(settings->dry_run);
>>  		igt_assert(!settings->test_list);
>>  		igt_assert(!settings->facts);
>> +		igt_assert(!settings->kmemleak);
>>  		igt_assert(!settings->sync);
>>  
>>  		argv[1] = "--test-list";
>> +		argv[2] = "foo"; /* Unchanged */
> 
> Same here, unrelated.
This is unchanged as the comment indicates. It is here only for documentation.
It was defined a few lines before: const char *argv[] = { "runner", "-n", "foo",

> 
>>  		argv[3] = "--facts";
>> -		argv[4] = "--sync";
> 
> Same here, unrelated.
Just read the next two lines please.

> 
>> +		argv[4] = "--kmemleak";
>> +		argv[5] = "--sync";
> 
> Same here, unrelated.
Just read the previous two lines please.

> 
>> +		argv[6] = "test-root-dir"; /* Unchanged */
> 
> Same here, unrelated.
Same explanation as 'foo'. No changes.
> 
>> +		argv[7] = "results-path"; /* Unchanged */
> 
> Same here, unrelated.
Same explanation as 'foo'. No changes.

> 
>>  
>>  		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
>>  
>>  		igt_assert_eqstr(settings->name, "results-path");
>>  		igt_assert(!settings->dry_run);
>> +		igt_assert(!settings->overwrite);
> 
> Same here, unrelated.

Same as before.

[...]

>>  	settings->dmesg_warn_level = -1;
>>  	settings->prune_mode = -1;
>>  
>> -	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:L",
>> +	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:Lk::",
> 
> Why there are two colons at end? Also imho 'k' should be placed after 'f'
> like below:

From Getopt documentation*: If an option character is followed by two colons
(‘::’), its argument is optional;

> 
> 	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fk:sl:omb:L",

This is wrong as it is missing one ':'. I will fix the order.

> 
> especially that you add its code after OPT_FACTS below.
> 
>>  				long_options, NULL)) != -1) {
>>  		switch (c) {
>>  		case OPT_VERSION:
>> @@ -742,6 +754,19 @@ bool parse_options(int argc, char **argv,
>>  		case OPT_FACTS:
>>  			settings->facts = true;
>>  			break;
>> +		case OPT_KMEMLEAK:
>> +			settings->kmemleak = true;
>> +			if (optarg) {
>> +				if (strcmp(optarg, "once") == 0)
>> +					settings->kmemleak_each = false;
>> +				else if (strcmp(optarg, "each") == 0)
>> +					settings->kmemleak_each = true;
>> +				else {
>> +					usage(stderr, "Invalid kmemleak option");
>> +					goto error;
>> +				}
> 
> Use braces here: if () { ... } else if (...) { ... } else { ... }

Sure

[...]

* - https://www.gnu.org/software/libc/manual/html_node/Using-Getopt.html
