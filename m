Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95B3C5B543
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 17:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBB410E833;
	Fri, 30 May 2025 17:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIGjdEKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6071210E833
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748626780; x=1780162780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UzTc5OtIZ/hnK12Ag8n4BtbbyhgqnI3MF5LvAtJRSf4=;
 b=QIGjdEKDrzKASkWTzoUFJEFYFmpTvWOIG4bqGvIqpEb5JRWJAsbuIjc0
 h3ep1qOylhODyCbOifF5bkL682bSkNvR/v5Bp7bSic8mhgprkjn9/ZTkY
 wDmyL0vZLbMVimJXFtnUpB+ZrXwOdZjCKaKZV4Jz662gQXwpStrOBy7rF
 fzY0Ep8FSWr8vxJzBfUUnO54DfwwPtJucLkN1P+A4L1XVy28KDVD5PecW
 lD7LfJEZkm5hYQ6jWHew6EDHfS4jlCA7RtHpq7iRhnQXzYEwCvYqh9M8i
 U9m+n46G/TyVExGbhgufJzEDsharkWUOoDXqXxhHb/qA0cu7mpP8VmYQH g==;
X-CSE-ConnectionGUID: L5z24ZnmRxaOANtvdi2qrA==
X-CSE-MsgGUID: 9fNl1HOfRC+uUgslp3gZ5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="38357005"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="38357005"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 10:39:40 -0700
X-CSE-ConnectionGUID: 5vUCpldpSIWP5rU+vUdaNA==
X-CSE-MsgGUID: opgoAYEFTeehjuzmWclgmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="149078523"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 10:39:38 -0700
Date: Fri, 30 May 2025 19:39:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "Dugast, Francois" <francois.dugast@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Message-ID: <20250530173936.w2g7pblwx6fh73o3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "Dugast, Francois" <francois.dugast@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
 <bafb3f48-e1bb-4ed4-8419-dd5e85875795@intel.com>
 <CH0PR11MB54442A56220EDDF9DB18A52DE566A@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54442A56220EDDF9DB18A52DE566A@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi Cavitt,,
On 2025-05-29 at 21:48:32 +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com> 
> Sent: Thursday, May 29, 2025 1:14 PM
> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-dev@lists.freedesktop.org; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> Cc: Dugast, Francois <francois.dugast@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>
> Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors while injecting fault
> > On 29.05.2025 15:31, Satyanarayana K V P wrote:
> > > Currently, numerous fault messages have been included in the dmesg ignore list,
> > > and this list continues to expand. Each time a new fault injection point is
> > > introduced or a new feature is activated, additional fault messages appear,
> > > making it cumbersome to manage the dmesg ignore list.
> > > 
> > > This new patch automatically ignores all error messages from dmesg, eliminating
> > > the need to add or maintain a dmesg ignore message list.
> > > 
> > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > ---

+cc Rodrigo

> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >  tests/intel/xe_fault_injection.c | 35 +++++++-------------------------
> > >  1 file changed, 7 insertions(+), 28 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> > > index f9bd5c761..0dffbe5da 100644
> > > --- a/tests/intel/xe_fault_injection.c
> > > +++ b/tests/intel/xe_fault_injection.c
> > > @@ -64,30 +64,9 @@ static int fail_function_open(void)
> > >  	return debugfs_fail_function_dir_fd;
> > >  }
> > >  
> > > -static bool function_is_part_of_guc(const char function_name[])
> > > +static void ignore_faults_in_dmesg(void)
> > >  {
> > > -	return strstr(function_name, "_guc_") != NULL ||
> > > -	       strstr(function_name, "_uc_") != NULL ||
> > > -	       strstr(function_name, "_wopcm_") != NULL;
> > > -}
> > > -
> > > -static void ignore_faults_in_dmesg(const char function_name[])
> > > -{
> > > -	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
> > > -	char regex[1024] = "probe with driver xe failed with error -12";
> > > -
> > > -	/*
> > > -	 * If GuC module fault is injected, GuC is expected to fail,
> > > -	 * so also ignore GuC init failures in igt_runner.
> > > -	 */
> > > -	if (function_is_part_of_guc(function_name)) {
> > > -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> > > -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> > > -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
> > > -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
> > > -	}
> > > -
> > > -	igt_emit_ignore_dmesg_regex(regex);
> > > +	igt_emit_ignore_dmesg_regex(".*");
> > 
> > that will filter out all messages, no?
> > 
> > maybe we should look for KERN_ERR level messages
> > 
> > if IGT can't filter by level then at least look for our errors:
> > 
> > 	xe 0000:00:02.0 [drm] *ERROR*
> > 	xe ... [drm] *ERROR*
> > 	[drm] *ERROR*
> > 	*ERROR*
> 
> The regex for that would probably look something like:
> 
> igt_emit_ignore_dmesg_regex("^((?!ERROR).)*$");
> 
> The above regex should filter out all CI warnings that don't contain errors.
> 
> > 
> > and we want to catch/report all warn/WARN/BUG without just relying on
> > taint (and WARN will also catch our xe_asserts)
> 
> If you also want to catch WARNs and BUGs, then the filter would look
> more like:
> 
> igt_emit_ignore_dmesg_regex("^((?!ERROR|WARN|BUG).)*$");
> 
> Would either of these be more amenable, Michal?
> -Jonathan Cavitt
> 
> > 
> > 
