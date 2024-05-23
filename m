Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944E4C25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 09:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD7810E175;
	Thu, 23 May 2024 09:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPfpvDZa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D3210E148
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716455412; x=1747991412;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Ew8uzo/GgYr/DzbzbBRlXCteH6wIgVRBSWuP2G9W6Tw=;
 b=RPfpvDZalVqzIegKY2ARjbWhfB6jQzHkEOO2foy2XC0B3YtgKYfrimZ5
 hRbLttRRwpQaR4vHK8TM8l79pdbBsnHkLPxeozuHuUA+2hmaZoJs3BXMt
 DYRsQB3xrJbGh4oPqmEoqOS5Mqc2WXv3Sl20wQoMJcyD3jRcXTRv9LvfO
 ao+xAeX04aSWCH2PUIie8xTEk3jYGsH8Q8CL5b5ec0VEfoRbQWhAvVshP
 aWF3b0DJ4xU7e5j3Kul/WLf5eHXfuH8VRpBehy6QTAE5pB5ab/llxRrhn
 FQSbQXy7fBvphk4HiXG2mTmWAUNhdK4+x87tv+tWh+jL2ADqpmxoaBHWf A==;
X-CSE-ConnectionGUID: SwG173J0STSct2bnLCeXjg==
X-CSE-MsgGUID: FftCcxvFRMitGhUeNIIZ8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12695380"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="12695380"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 02:10:11 -0700
X-CSE-ConnectionGUID: rkU8xaSUTqamMSgfkPbWBQ==
X-CSE-MsgGUID: STiPkd5DQDGcW4R2VWvLyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="37997040"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 02:10:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to
 detect Intel GPUs from their PCI IDs
In-Reply-To: <20240523103558.42876c98@maurocar-mobl2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com> <875xv6q8ob.fsf@intel.com>
 <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
 <87r0dtouhu.fsf@intel.com> <20240523103558.42876c98@maurocar-mobl2>
Date: Thu, 23 May 2024 12:10:05 +0300
Message-ID: <87le40q4gi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 23 May 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> On Thu, 23 May 2024 10:30:37 +0300
> Jani Nikula <jani.nikula@intel.com> wrote:
>
>> On Wed, 22 May 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
>> > Looks like a good idea but this is also dependancy, btw  
>> 
>> [snip]
>> 
>> > But this one is creating one more dependancy, one should have
>> > modules compiled in current running kernel.  
>> 
>> Reading the comments about dependencies, I think this needs a different
>> perspective.
>> 
>> What is the target audience of the tool? What are they expected to have
>> around? What is the easiest for them to install?
>
> The target audience for the submitted changeset is to provide a way for
> IGT developers to generate a script to detect the presence and the GPU
> model for Device Under Test (DUT) machines.
>
> It was written to be generic enough to use different directories for Xe
> and for i915 (or the same one). So, it should work properly when different
> versions of the drivers would be used, during driver's development.
>
> On other words, the way it is, this is not focused on the end user. 
>
> The way it works is that a C file read the i915 and Xe macros, creating
> a PCI ID database, stored as hash(dict):
>
> 	my %intel_pci_id = (
> 		"8086:46d0" => "ADLN",
> 		"8086:46d1" => "ADLN",
> 		"8086:46d2" => "ADLN",
> 		...
> 	)
> 	...
> 	my %intel_pci_id_alt_name = (
> 		# AML_CFL_GT2 alternative names
> 		"8086:87ca" => "CFL",
>
> 		# AML_KBL_GT2 alternative names
> 		"8086:591c" => "KBL",
> 		"8086:87c0" => "KBL",
> 		...
> 	)
>
> 	Typically, most GPUs have two entries:
>
> 	$ grep 8086:9b41 ./intel_detect_gpu.pl
> 		"8086:9b41" => "CFL",
> 		"8086:9b41" => "CML_U_GT2",
>
> 	The first one is the generic name, the second one contains
> 	an alternate name, with has additional GPU version details
> 	(in this case, CML-U GT2). All of that obtained from the
> 	driver's source code.
>
> The generated script itself doesn't require anything other than lspci to
> run, as what the script does, on its 35 lines of code (not including the
> PCI ID database), is:
>
> 	1. run lspci -nm
>
> 	2. If the PCI ID device is at the database, it prints:
>
> 		print "Detected GPU PCI device: $id$subtype, PCI ID: $pci_id\n";
>
> 	   For the above example, the output is:
>
> 		Detected GPU PCI device: CFL (CML_U_GT2), PCI ID: 8086:9b41
>
> 	3. If multiple Intel GPUs are found, it prints a warning, as DUT
> 	   tests may require an extra parameter to use the right GPU:
>
> 		Warning: More than one Intel GPUs detected
>
> 	4. if no Intel GPU is found, it will print:
>
> 		Warning: No Intel GPUs detected

The way I see it, intel_device_info.c and igt_device_scan.c have all the
building blocks necessary to accomplish this. As long as
intel_device_match[] is kept up-to-date, which naturally will be, it
needs no further maintenance. It could be added to lsgpu as an option.

>> lspci and modinfo are trivial to install, and most people have them
>> installed already. modinfo does not require the modules to be probed,
>> you can also point it at the .ko under /usr/lib/modules. For a user,
>> this gives information about the modules they actually have on their
>> system, which may be different from kernel or igt sources.
>
> Once generated, intel_detect_gpu.pl would be trivial to install and
> to be used, as the only requirements are to have perl and pci-tools
> (due to lspci dependency) installed.
>
>> OTOH most people won't have kernel or igt sources available. (Let alone
>> specific versions of the source, which match the expectations of the
>> patch at hand.) Indeed, you can install igt via the distro package
>> manager, with no need to check out the sources.
>
> If IGT maintainers think it is worth targeting end users in the future,
> the best is for them to periodically generate the script (for example,
> when releasing a new IGT version), adding it to scripts/ and adding a
> target at Meson to install it under ${installprefix}/bin directory.

The best is what I described above, not adding Rube Goldberg machines
that require constant attention.

BR,
Jani.


>
> Regards,
> Mauro

-- 
Jani Nikula, Intel
