Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C097C25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 17:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA22B10F14E;
	Thu, 23 May 2024 17:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjHdjIM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F8A10F14E
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 17:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716485488; x=1748021488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vXr094dE5LgaraMM7tswMk95Zz76Wxu/B5VQAUtbXMY=;
 b=CjHdjIM07EnSW2qsp21R9UV9s/dR+6V/+OwTLp/q1vmSsqr4gdTfsHP2
 M9qs0w6H71SiLpII9YeNpj58/UQFwoWrC1VpBJop0i8KzFLP4T4qi5lQq
 w2B3xXm0ObYGD2CHXbXJgcLrhw9O+nJWT3h5sFLrICQ0BmQjHveFlxmCF
 lQYabB62LmPEAlSSlJO309Yz8/nLMSqsmFxsXKBwVbzjSbj0uXnVnUlFH
 ihqDejiN5e4Ctoe/4F2x7DRenmwfOEkqbhj+ABGiZ3FMwNx0HvFZ9rCxs
 6cmx3iGqDQoStADiXb+8i8x0k/R9e5CSYreJZnqLrHNQ1iKZfg/vBrbzG A==;
X-CSE-ConnectionGUID: 0hab2RFkTO2T9408yYFaBA==
X-CSE-MsgGUID: uQrf+4j4QBuB4cPi4X0Lqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12699015"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12699015"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:31:27 -0700
X-CSE-ConnectionGUID: KNAi/tlqS6iUv7uuBqkUeQ==
X-CSE-MsgGUID: Mgpb5MLeSJ2i28CXHEzfMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33805515"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 10:31:26 -0700
Date: Thu, 23 May 2024 19:31:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 kamil.konieczny@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to detect
 Intel GPUs from their PCI IDs
Message-ID: <20240523173123.tu6rghsgsqkptrmm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 kamil.konieczny@intel.com, katarzyna.piecielska@intel.com
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com> <875xv6q8ob.fsf@intel.com>
 <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
 <87r0dtouhu.fsf@intel.com> <20240523103558.42876c98@maurocar-mobl2>
 <87le40q4gi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87le40q4gi.fsf@intel.com>
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

Hi Jani,
On 2024-05-23 at 12:10:05 +0300, Jani Nikula wrote:
> On Thu, 23 May 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> > On Thu, 23 May 2024 10:30:37 +0300
> > Jani Nikula <jani.nikula@intel.com> wrote:
> >
> >> On Wed, 22 May 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> >> > Looks like a good idea but this is also dependancy, btw  
> >> 
> >> [snip]
> >> 
> >> > But this one is creating one more dependancy, one should have
> >> > modules compiled in current running kernel.  
> >> 
> >> Reading the comments about dependencies, I think this needs a different
> >> perspective.
> >> 
> >> What is the target audience of the tool? What are they expected to have
> >> around? What is the easiest for them to install?
> >
> > The target audience for the submitted changeset is to provide a way for
> > IGT developers to generate a script to detect the presence and the GPU
> > model for Device Under Test (DUT) machines.
> >
> > It was written to be generic enough to use different directories for Xe
> > and for i915 (or the same one). So, it should work properly when different
> > versions of the drivers would be used, during driver's development.
> >
> > On other words, the way it is, this is not focused on the end user. 
> >
> > The way it works is that a C file read the i915 and Xe macros, creating
> > a PCI ID database, stored as hash(dict):
> >
> > 	my %intel_pci_id = (
> > 		"8086:46d0" => "ADLN",
> > 		"8086:46d1" => "ADLN",
> > 		"8086:46d2" => "ADLN",
> > 		...
> > 	)
> > 	...
> > 	my %intel_pci_id_alt_name = (
> > 		# AML_CFL_GT2 alternative names
> > 		"8086:87ca" => "CFL",
> >
> > 		# AML_KBL_GT2 alternative names
> > 		"8086:591c" => "KBL",
> > 		"8086:87c0" => "KBL",
> > 		...
> > 	)
> >
> > 	Typically, most GPUs have two entries:
> >
> > 	$ grep 8086:9b41 ./intel_detect_gpu.pl
> > 		"8086:9b41" => "CFL",
> > 		"8086:9b41" => "CML_U_GT2",
> >
> > 	The first one is the generic name, the second one contains
> > 	an alternate name, with has additional GPU version details
> > 	(in this case, CML-U GT2). All of that obtained from the
> > 	driver's source code.
> >
> > The generated script itself doesn't require anything other than lspci to
> > run, as what the script does, on its 35 lines of code (not including the
> > PCI ID database), is:
> >
> > 	1. run lspci -nm
> >
> > 	2. If the PCI ID device is at the database, it prints:
> >
> > 		print "Detected GPU PCI device: $id$subtype, PCI ID: $pci_id\n";
> >
> > 	   For the above example, the output is:
> >
> > 		Detected GPU PCI device: CFL (CML_U_GT2), PCI ID: 8086:9b41
> >
> > 	3. If multiple Intel GPUs are found, it prints a warning, as DUT
> > 	   tests may require an extra parameter to use the right GPU:
> >
> > 		Warning: More than one Intel GPUs detected
> >
> > 	4. if no Intel GPU is found, it will print:
> >
> > 		Warning: No Intel GPUs detected
> 
> The way I see it, intel_device_info.c and igt_device_scan.c have all the
> building blocks necessary to accomplish this. As long as
> intel_device_match[] is kept up-to-date, which naturally will be, it
> needs no further maintenance. It could be added to lsgpu as an option.
> 

Yes it would be helpfull.

> >> lspci and modinfo are trivial to install, and most people have them
> >> installed already. modinfo does not require the modules to be probed,
> >> you can also point it at the .ko under /usr/lib/modules. For a user,
> >> this gives information about the modules they actually have on their
> >> system, which may be different from kernel or igt sources.
> >
> > Once generated, intel_detect_gpu.pl would be trivial to install and
> > to be used, as the only requirements are to have perl and pci-tools
> > (due to lspci dependency) installed.
> >
> >> OTOH most people won't have kernel or igt sources available. (Let alone
> >> specific versions of the source, which match the expectations of the
> >> patch at hand.) Indeed, you can install igt via the distro package
> >> manager, with no need to check out the sources.
> >
> > If IGT maintainers think it is worth targeting end users in the future,
> > the best is for them to periodically generate the script (for example,
> > when releasing a new IGT version), adding it to scripts/ and adding a
> > target at Meson to install it under ${installprefix}/bin directory.
> 
> The best is what I described above, not adding Rube Goldberg machines
> that require constant attention.
> 
> BR,
> Jani.

Maybe this should/may be added to scripts?
I do find it usefull to have a little script checks,
without much dependancy on other libs/tools. I would
also want to have a way to semi-automatically update
it later on, where new devices will be added.

Regards,
Kamil

> 
> 
> >
> > Regards,
> > Mauro
> 
> -- 
> Jani Nikula, Intel
