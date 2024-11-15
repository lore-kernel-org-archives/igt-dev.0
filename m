Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAA4D637CE
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 14:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C200510E0DE;
	Fri, 15 Nov 2024 14:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNhwhmFj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1379710E0DE
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 14:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731679368; x=1763215368;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Fn0WggAHW+c0jhGC9e7DFjOnhkt3un0cPiviCYNbkJk=;
 b=iNhwhmFjMOnNUQkiGoS4jcFAJEtA74x5Kt3mxR0bUAx0qt2wZd3mlrg8
 2w1/1LA1SRhXWg61XwhS8sOv+eiJm5eeFbWSJhy/nh4JWZm84R3gf/juU
 l/W1JfxgudQE/A1uw9qPDrtsIj9pOeNys3omuxLMgIGTAexOEAQ2PKMab
 zVf6iCTOqDRW+5XkxY2NEs7cIsspbjmxPKmpodHd/UTxSLURZ6jRqydsZ
 v8ILFJVMqDDjvFOeQiYs55qlIRdBqPbqr23z7e81Ub2wikMRgoz71o/H+
 Oe86VgouedJGGVbdksPzrF+sDG61goM5tYNYcLHqs0BcfKFNE1oJgIvz1 w==;
X-CSE-ConnectionGUID: epITAykwRlm7FjOjzdMpsw==
X-CSE-MsgGUID: x+7AuDjnSraByENOuxpH/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="57101578"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="57101578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:02:48 -0800
X-CSE-ConnectionGUID: rDlAiSy/RU+2bhlvxKD3ow==
X-CSE-MsgGUID: seCR5GJzSE6UI8pFUwhyCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="93650354"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 06:02:47 -0800
Date: Fri, 15 Nov 2024 15:02:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2] tests/intel/xe_fault_injection: Ignore expected errors
Message-ID: <20241115140243.sp72xvmr5nnpkwtc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241107195959.98509-1-jonathan.cavitt@intel.com>
 <20241108155824.deuiikqqcvog32ms@kamilkon-desk.igk.intel.com>
 <df0baea0-7dd3-414c-81fc-c163a5efe6bb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <df0baea0-7dd3-414c-81fc-c163a5efe6bb@intel.com>
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

Hi Dong,,
On 2024-11-12 at 12:58:55 -0500, Dong, Zhanjun wrote:
> 
> 
> On 2024-11-08 10:58 a.m., Kamil Konieczny wrote:
> > Hi Jonathan,
> > On 2024-11-07 at 19:59:59 +0000, Jonathan Cavitt wrote:
> > > The following errors can be observed when running the xe_fault_injection
> > > subtests:
> > > 
> > > [drm] *ERROR* GT0: GuC init failed with -ENOMEM
> > > [drm] *ERROR* GT0: Failed to initialize uC (-ENOMEM)
> > > probe with driver xe failed with error -12
> > > 
> > > Add these messages to the dmesg ignore regex to the applicable tests
> > > (specifically, all tests for the last error, and all tests that target
> > > GuC subsystems for the first two errors).
> > > 
> > > v2:
> > > - Fix and merge regex (Kamil)
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > CC: Francois Dugast <francois.dugast@intel.com>
> > > CC: Lucas De Marchi <lucas.demarchi@intel.com>
> > > CC: Matthew Brost <matthew.brost@intel.com>
> > > CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > >   tests/intel/xe_fault_injection.c | 25 +++++++++++++++++++++++++
> > >   1 file changed, 25 insertions(+)
> > > 
> > > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> > > index d1c8b25307..8b181808ed 100644
> > > --- a/tests/intel/xe_fault_injection.c
> > > +++ b/tests/intel/xe_fault_injection.c
> > > @@ -30,6 +30,30 @@ enum injection_list_action {
> > >   	INJECTION_LIST_REMOVE,
> > >   };
> > > +static bool function_is_part_of_guc(char function_name[])
> > > +{
> > > +	return strstr(function_name, "_guc_") != NULL ||
> > > +	       strstr(function_name, "_uc_") != NULL ||
> > > +	       strstr(function_name, "_wopcm_") != NULL;
> > > +}
> > > +
> > > +static void ignore_faults_in_dmesg(char function_name[])
> > > +{
> > > +	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
> > > +	char regex[1024] = "probe with driver xe failed with error -12";
> > > +
> > > +	/*
> > > +	 * If GuC module fault is injected, GuC is expected to fail,
> > > +	 * so also ignore GuC init failures in igt_runner.
> > > +	 */
> > > +	if (function_is_part_of_guc(function_name)) {
> > > +		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> > > +		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> I see "." matches left parenthesis, why don't have another "." match for
> right parenthesis? I mean it looks strange when compare regex string:
>    "GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM"
> vs
>               "GT0: Failed to initialize uC (-ENOMEM)"

Because using '(' in regex is tricky, also if we ignore last char
we could as well improve regex and just do not require it.

Regards,
Kamil

> 
> Regards,
> Zhanjun Dong
> > 
> > This could be one call to strcat, but it is not a blocker.
> > 
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > > +	}
> > > +
> > > +	igt_emit_ignore_dmesg_regex(regex);
> > > +}
> > > +
> > >   /*
> > >    * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
> > >    */
> > > @@ -175,6 +199,7 @@ igt_main
> > >   			if (regexec(&regex, line, 2, pmatch, 0) == 0) {
> > >   				strcpy(function_name, line);
> > >   				function_name[pmatch[1].rm_eo - 1] = '\0';
> > > +				ignore_faults_in_dmesg(function_name);
> > >   				igt_dynamic_f("function-%s", function_name)
> > >   					inject_fault_try_bind(fd, pci_slot, function_name);
> > >   			}
> > > -- 
> > > 2.43.0
> > > 
> 
