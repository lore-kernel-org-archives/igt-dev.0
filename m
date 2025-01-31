Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C16C0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 12:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F11E10E165;
	Fri, 31 Jan 2025 12:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9G4Xbfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0795010E165
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 12:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738325797; x=1769861797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c/TTqFr5C6qeCmno4gPaN+JBcB0Mp8hjBvUvjH8jmk8=;
 b=n9G4XbfuSEfEiraIySZEvvkBAky6IqznfoMcmpk6ySQM8U02aBxtQ5Cz
 RV2RcrQDVTLYO66nHKW0OtP21I7vlTNV/LWEwnQKa7SKzqxQ3k+eOlJJQ
 NL+UZRNUTPXJB8JZUcQCg708ODQv7cvxnbRViU+a2N2Q1AeeRCE1swN+C
 arxfYebjafXnWaY5So0CJyEW+D2wpqAEenMf6S+tH9iUy2ZKH8WwyK+Xv
 Y57YhPpoZPn8zpMDtQu23XWjneE882rApiP3VNJtW3HXVc9nCT3oEKJOu
 gMgACJzAbxyO8W/ZqsHMeOhi299a+CtImppJfOSKdtCPxLIKvyTf4S5ML A==;
X-CSE-ConnectionGUID: r5IQ0sjyQCeQqBWlhlfdTg==
X-CSE-MsgGUID: qDjn9Hf9TR+t9fyxd5aiDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38773956"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="38773956"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 04:16:36 -0800
X-CSE-ConnectionGUID: sqYBWmlJSGSNGHKeUvMwbg==
X-CSE-MsgGUID: DN9KMuAPQayeUgyzMDyyfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114217492"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 04:16:33 -0800
Date: Fri, 31 Jan 2025 13:16:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v3 10/10] runner/resultgen: Add cmdline to
 results.json
Message-ID: <20250131121619.wkjj4isz2cjdjilf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-11-lucas.demarchi@intel.com>
 <20250130190055.qn4xxd4y4za6ehuz@kamilkon-desk.igk.intel.com>
 <nhqlawqsr7kwrsuvwtxq5s6yafbcmtawotaxarp3amng5dospx@n6i3bf7zp7jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <nhqlawqsr7kwrsuvwtxq5s6yafbcmtawotaxarp3amng5dospx@n6i3bf7zp7jp>
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

Hi Lucas,
On 2025-01-30 at 13:17:11 -0600, Lucas De Marchi wrote:
> On Thu, Jan 30, 2025 at 08:00:55PM +0100, Kamil Konieczny wrote:
> > Hi Lucas,
> > On 2025-01-30 at 09:21:49 -0800, Lucas De Marchi wrote:
> > > For easier repro scenarios, add the cmdline to the json: one can see the
> > > exact command executed to try to reproduce a CI failure without needing
> > > extra files.
> > > 
> > > Adding cmdline to the results.json doesn't need a version upgrade:
> > > piglit can still parse the file.
> > 
> > Why not just printing this into stdout before executing test loop?
> > The same way which is already used by igt_facts, so it will go
> > into runnerNN.txt log and will not be duplicated in each and every
> > results.json
> 
> igt_facts print things that is happening between the tests. It's
> monitoring the execution.
> 
> I don't understand the push back here when we already add things
> like version, uname, execution time, etc. You could use the same argument and say "look at the runner.log"
> to see the execution time.
> 
> I want to be able to see things rendered in the final html at
> https://intel-gfx-ci.01.org/tree/intel-xe/bat-all.html,
> make things discoverable and also be able to download the .json, process
> it and come up with the answer to "what do I have to do to reproduce
> this error locally?".  A script `repro-igt.py <results.json|url>` would
> be very handy and made possible with improvements like this.
> It's a huge benefit for reproducing and fixing bugs. I don't think the
> extra few bytes really matter.
> 

Well, what I wrote is not a blocker, I get your point so

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> > 
> > Adding also Ewelina to Cc
> > Cc: Ewelina Musial <ewelina.musial@intel.com>
> > 
> > Digression: for repro it could be helpfull to have also git logs
> > and kernel config but this also is one-time info for whole
> > bat/shard run, so again no need to duplicate in every results.
> 
> they are already there
> 
> IGT-Version: 1.30-gfafef52e0 (x86_64) (Linux: 6.13.0-xe+ x86_64)
> 		   ^^^^^^^^^

IGT is there but not the kernel :( But that is for another discussion.

Regards,
Kamil

> 
> The kernel one is not since we stopped appending the version,
> but it would be good to bring it back.
> 
> Lucas De Marchi
> 
> > 
> > Regards,
> > Kamil
> > 
> > > 
> > > Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > > Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > ...cut...
> > 
> > > index a2b79da9e..2c483fdf5 100644
> > > --- a/runner/json_tests_data/warnings/reference.json
> > > +++ b/runner/json_tests_data/warnings/reference.json
> > > @@ -3,6 +3,7 @@
> > >    "results_version":10,
> > >    "name":"normal-run",
> > >    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
> > > +  "cmdline":[],
> > >    "time_elapsed":{
> > >      "__type__":"TimeAttribute",
> > >      "start":1539953735.1110389,
> > > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > > index 87847bf5b..0d3a569cf 100644
> > > --- a/runner/resultgen.c
> > > +++ b/runner/resultgen.c
> > > @@ -2281,7 +2281,7 @@ struct json_object *generate_results_json(int dirfd)
> > >  {
> > >  	struct settings settings;
> > >  	struct job_list job_list;
> > > -	struct json_object *obj, *elapsed;
> > > +	struct json_object *obj, *elapsed, *arr;
> > >  	struct results results;
> > >  	int testdirfd, fd;
> > >  	size_t i;
> > > @@ -2319,6 +2319,11 @@ struct json_object *generate_results_json(int dirfd)
> > >  		close(fd);
> > >  	}
> > > 
> > > +	arr = json_object_new_array();
> > > +	for (i = 0; i < settings.cmdline.argc; i++)
> > > +		json_object_array_add(arr, json_object_new_string(settings.cmdline.argv[i]));
> > > +	json_object_object_add(obj, "cmdline", arr);
> > > +
> > >  	elapsed = json_object_new_object();
> > >  	json_object_object_add(elapsed, "__type__", json_object_new_string("TimeAttribute"));
> > >  	if ((fd = openat(dirfd, "starttime.txt", O_RDONLY)) >= 0) {
> > > --
> > > 2.48.0
> > > 
