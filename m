Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05C9C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 14:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5870D10E8C2;
	Wed, 12 Feb 2025 14:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTwpz2i7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B4C10E8C2
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739370261; x=1770906261;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pBsSUxfaCELOKZd5s5ors1LFAOwEl9flJPfq/FqwUZA=;
 b=fTwpz2i7cYLOF7VOdANQ0P9YmbFdZvhQ9TF7StiNCwJta4iKnF539GPH
 QR7e8uN2md8WQRC6jNeuAgFeVRl7/0tQF68nru4kFO9sRevNaZu3s2580
 KLH4flsAuSfSdgnCY0A7PNZvEssFOIjZD708sjT1OjDN8E6V8HLi4Tes2
 ltXO/27royJdtysWZZ+F3PJF/wPYv8u1mg/LaKmYs0zRyq0rdTqBdRvt+
 unglh4hv2qj5YoyyRuGRMYavRHXZ620GcDmQuwDluTR0T1TwxA3U6ms+9
 f5VlXc//JTRqOzg5ryFSEhssW4mQ9pa0A8LsPa/BJoJJzkkqtjQDgtmHQ Q==;
X-CSE-ConnectionGUID: xK58RvMwTKGSmDo8AWhibw==
X-CSE-MsgGUID: iXWj2WM4R72+k9aO+TikTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40148582"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40148582"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:24:21 -0800
X-CSE-ConnectionGUID: 5a/5OMy8TdapJNWWAnenuQ==
X-CSE-MsgGUID: GF49qn8gQCeB1eNbMeX4Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117762507"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 06:24:19 -0800
Date: Wed, 12 Feb 2025 15:24:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v4 2/2] runner/executor: Integrate igt_kmemleak scans
Message-ID: <20250212142416.tmzmgwu5mtqo7fxm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-3-peter.senna@linux.intel.com>
 <20250131125018.daqboesdcfuvsqrw@kamilkon-desk.igk.intel.com>
 <f766e3af-cdc2-4e9f-a672-c323c19298b5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f766e3af-cdc2-4e9f-a672-c323c19298b5@linux.intel.com>
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
On 2025-02-03 at 10:10:53 +0100, Peter Senna Tschudin wrote:
> Hi Kamil,
> 
> Thank you for the review.
> 
> [...]
> 
> >>  		igt_facts_lists_init();
> >>  
> >> +	if (settings->kmemleak)
> >> +		if (!igt_kmemleak_init(NULL)) {
> >> +			errf("Failed to initialize kmemleak. Is kernel support enabled?\n");
> >> +			errf("Disabling kmemleak on igt_runner and continuing...\n");
> > 
> > Make it one errf() call, split string if needed.
> chekcpatch does not like multi-line strings. Can you show me the code
> you want me to use here that satisfies you and checkpatch at the same time?
> 

It is a tool and it do happen when developer could ignore it,
you have one example here and other is for drm structs which
use camel case names.

> 
> [...]
> > 
> >> +			settings->kmemleak = settings->kmemleak_each = false;
> > 
> > Avoid this, write two assinments here.
> 
> I personally find this very elegant, but sure, I will make the change.
> 
> [...]
> 
> >> @@ -718,6 +723,7 @@ igt_main
> >>  	igt_subtest("parse-clears-old-data") {
> >>  		const char *argv[] = { "runner",
> >>  				       "-n", "foo",
> >> +				       "--overwrite",
> > 
> > Do not make unrelated changes, add only kmemleak.
> > You also didn't write about this change in description, if you
> > think it is a fix it should go in separate patch, not here.
> 
> These are not unrelated. First as this is unit testing, this has no
> downstream effects. Second, I am adding --overwrite to grow the argv
> array. The reason for that is to be able to test the new argument.

Well, I do no understand why are you doing this in this patch?
When you added facts you change only small fragment but now it
looks like an unneccecery big change. Please make this change
small and consider adding all that bigger unrelated changes
in separate cleanup patch after this one.

Regards,
Kamil

> 
> As I had explained to Jonathan Cavitt in a previous email, the alternative
> to adding an extra option would be to change how the entire file allocates
> argv[] which felt like an overkill. If adding an extra option that has no
> downstream effect is unacceptable, please let me know how you want me to
> grow the array with an example.
> 
> > 
> >>  				       "--dry-run",
> >>  				       "--allow-non-root",
> >>  				       "test-root-dir",
> >> @@ -727,21 +733,29 @@ igt_main
> >>  		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
> >>  
> >>  		igt_assert_eqstr(settings->name, "foo");
> >> +		igt_assert(settings->overwrite);
> > 
> > Same here, unrelated.
> Updating the unit testing to take overwrite into account.
> 
> > 
> >>  		igt_assert(settings->dry_run);
> >>  		igt_assert(!settings->test_list);
> >>  		igt_assert(!settings->facts);
> >> +		igt_assert(!settings->kmemleak);
> >>  		igt_assert(!settings->sync);
> >>  
> >>  		argv[1] = "--test-list";
> >> +		argv[2] = "foo"; /* Unchanged */
> > 
> > Same here, unrelated.
> This is unchanged as the comment indicates. It is here only for documentation.
> It was defined a few lines before: const char *argv[] = { "runner", "-n", "foo",
> 
> > 
> >>  		argv[3] = "--facts";
> >> -		argv[4] = "--sync";
> > 
> > Same here, unrelated.
> Just read the next two lines please.
> 
> > 
> >> +		argv[4] = "--kmemleak";
> >> +		argv[5] = "--sync";
> > 
> > Same here, unrelated.
> Just read the previous two lines please.
> 
> > 
> >> +		argv[6] = "test-root-dir"; /* Unchanged */
> > 
> > Same here, unrelated.
> Same explanation as 'foo'. No changes.
> > 
> >> +		argv[7] = "results-path"; /* Unchanged */
> > 
> > Same here, unrelated.
> Same explanation as 'foo'. No changes.
> 
> > 
> >>  
> >>  		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
> >>  
> >>  		igt_assert_eqstr(settings->name, "results-path");
> >>  		igt_assert(!settings->dry_run);
> >> +		igt_assert(!settings->overwrite);
> > 
> > Same here, unrelated.
> 
> Same as before.
> 
> [...]
> 
> >>  	settings->dmesg_warn_level = -1;
> >>  	settings->prune_mode = -1;
> >>  
> >> -	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:L",
> >> +	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:Lk::",
> > 
> > Why there are two colons at end? Also imho 'k' should be placed after 'f'
> > like below:
> 
> From Getopt documentation*: If an option character is followed by two colons
> (‘::’), its argument is optional;
> 
> > 
> > 	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fk:sl:omb:L",
> 
> This is wrong as it is missing one ':'. I will fix the order.
> 
> > 
> > especially that you add its code after OPT_FACTS below.
> > 
> >>  				long_options, NULL)) != -1) {
> >>  		switch (c) {
> >>  		case OPT_VERSION:
> >> @@ -742,6 +754,19 @@ bool parse_options(int argc, char **argv,
> >>  		case OPT_FACTS:
> >>  			settings->facts = true;
> >>  			break;
> >> +		case OPT_KMEMLEAK:
> >> +			settings->kmemleak = true;
> >> +			if (optarg) {
> >> +				if (strcmp(optarg, "once") == 0)
> >> +					settings->kmemleak_each = false;
> >> +				else if (strcmp(optarg, "each") == 0)
> >> +					settings->kmemleak_each = true;
> >> +				else {
> >> +					usage(stderr, "Invalid kmemleak option");
> >> +					goto error;
> >> +				}
> > 
> > Use braces here: if () { ... } else if (...) { ... } else { ... }
> 
> Sure
> 
> [...]
> 
> * - https://www.gnu.org/software/libc/manual/html_node/Using-Getopt.html
