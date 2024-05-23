Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDC1C25B79
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 08:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A5210E066;
	Thu, 23 May 2024 08:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HX/2pUm/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493CB10E066
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 08:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716453409; x=1747989409;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tc+zcbvoToBwiJfMiGXgW+y2X4uil1kcjJVzdk34w3U=;
 b=HX/2pUm/1jDsttEeH1Ub1o7oMDGSn86eNRvWEbNc5iUUtfIVdmYMREF4
 OMZRRMqqv5wMu3En8bOLnGptrwpVCHjYUzIfiDe63IttlnPwkGyWEvylP
 EK5KTC6UcF2GLFBnM4JN2TOac2VO50GpwzbNh7ju9bAfluahLRb7XdZc8
 vx/hJsrg0Sx0xOM2ID/ba36RxcK2ZukwGmwHekMoFI428vULr7cBwjS6e
 1+NkimUuvj0cqwjblNqm0wehnz0DlnEhXq6pvV64RTNeOInFgTsqAfgPc
 rVNdBykrh2AfzlaJVgD5rvVjYayqKBhddZGqglqHoVcnztlaz1rZgjRI3 A==;
X-CSE-ConnectionGUID: eMH7mq1ARhWAzY4htCWMVw==
X-CSE-MsgGUID: swYXaCRxRBi9x4MQKIEfKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="11658350"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="11658350"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 01:36:48 -0700
X-CSE-ConnectionGUID: wfN7HfnVRG+vP8oPvZOmSw==
X-CSE-MsgGUID: T3Mt3jC7SbWjCpc5AI4rlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="33578685"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 01:36:48 -0700
Received: from maurocar-mobl2 (unknown [10.245.245.203])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B9AF220BF42F;
 Thu, 23 May 2024 01:36:46 -0700 (PDT)
Date: Thu, 23 May 2024 10:36:44 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to
 detect Intel GPUs from their PCI IDs
Message-ID: <20240523103558.42876c98@maurocar-mobl2>
In-Reply-To: <87r0dtouhu.fsf@intel.com>
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com> <875xv6q8ob.fsf@intel.com>
 <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
 <87r0dtouhu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 23 May 2024 10:30:37 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

> On Wed, 22 May 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > Looks like a good idea but this is also dependancy, btw  
> 
> [snip]
> 
> > But this one is creating one more dependancy, one should have
> > modules compiled in current running kernel.  
> 
> Reading the comments about dependencies, I think this needs a different
> perspective.
> 
> What is the target audience of the tool? What are they expected to have
> around? What is the easiest for them to install?

The target audience for the submitted changeset is to provide a way for
IGT developers to generate a script to detect the presence and the GPU
model for Device Under Test (DUT) machines.

It was written to be generic enough to use different directories for Xe
and for i915 (or the same one). So, it should work properly when different
versions of the drivers would be used, during driver's development.

On other words, the way it is, this is not focused on the end user. 

The way it works is that a C file read the i915 and Xe macros, creating
a PCI ID database, stored as hash(dict):

	my %intel_pci_id = (
		"8086:46d0" => "ADLN",
		"8086:46d1" => "ADLN",
		"8086:46d2" => "ADLN",
		...
	)
	...
	my %intel_pci_id_alt_name = (
		# AML_CFL_GT2 alternative names
		"8086:87ca" => "CFL",

		# AML_KBL_GT2 alternative names
		"8086:591c" => "KBL",
		"8086:87c0" => "KBL",
		...
	)

	Typically, most GPUs have two entries:

	$ grep 8086:9b41 ./intel_detect_gpu.pl
		"8086:9b41" => "CFL",
		"8086:9b41" => "CML_U_GT2",

	The first one is the generic name, the second one contains
	an alternate name, with has additional GPU version details
	(in this case, CML-U GT2). All of that obtained from the
	driver's source code.

The generated script itself doesn't require anything other than lspci to
run, as what the script does, on its 35 lines of code (not including the
PCI ID database), is:

	1. run lspci -nm

	2. If the PCI ID device is at the database, it prints:

		print "Detected GPU PCI device: $id$subtype, PCI ID: $pci_id\n";

	   For the above example, the output is:

		Detected GPU PCI device: CFL (CML_U_GT2), PCI ID: 8086:9b41

	3. If multiple Intel GPUs are found, it prints a warning, as DUT
	   tests may require an extra parameter to use the right GPU:

		Warning: More than one Intel GPUs detected

	4. if no Intel GPU is found, it will print:

		Warning: No Intel GPUs detected

> lspci and modinfo are trivial to install, and most people have them
> installed already. modinfo does not require the modules to be probed,
> you can also point it at the .ko under /usr/lib/modules. For a user,
> this gives information about the modules they actually have on their
> system, which may be different from kernel or igt sources.

Once generated, intel_detect_gpu.pl would be trivial to install and
to be used, as the only requirements are to have perl and pci-tools
(due to lspci dependency) installed.

> OTOH most people won't have kernel or igt sources available. (Let alone
> specific versions of the source, which match the expectations of the
> patch at hand.) Indeed, you can install igt via the distro package
> manager, with no need to check out the sources.

If IGT maintainers think it is worth targeting end users in the future,
the best is for them to periodically generate the script (for example,
when releasing a new IGT version), adding it to scripts/ and adding a
target at Meson to install it under ${installprefix}/bin directory.

Regards,
Mauro
