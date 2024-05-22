Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB3CC25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 14:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40D610F5ED;
	Wed, 22 May 2024 14:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvMKd609";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1671510F5ED
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 14:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716389192; x=1747925192;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3itzLMEhmsQwrtpmc8UysRVRja63+2WjsS4KaAvhbfg=;
 b=KvMKd609YHaMNWqG+YngKDH0f/ktVoewUTn7L+pr0Biq+rFMpm6ifCAj
 N1jjY/e1ePwKsBi4BGzxAEDJXyxgEQmcc5v9TcwXUud3L2E+4+YPrprvZ
 JzLnNNscOoYScS6D0FunKx9McvXEdRuUcQsowKoJVr3IY0GfPIbassHN+
 qHoEkOAIZpaHSoE1VzR++FAINXBR8cDOE1Sl0b21qgdLTjX68op4xOcqS
 J9djwe53nytuvO00cB+VBRWOYslu7s0gSPYAqJX1KX0rhbvFFDTZBRPYI
 lrG1klbKmVLG41Hggc3po2XM3o97jqw2SYhtkCR11Vuq0WNRPVQZUfSkR w==;
X-CSE-ConnectionGUID: W0xvAax8SJ6JMq+FvXF0Kg==
X-CSE-MsgGUID: yGJ2jmX0TRO5TTaolc7oOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="23260790"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="23260790"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 07:46:31 -0700
X-CSE-ConnectionGUID: QdUwCVOYSPeliq1PfIIf9g==
X-CSE-MsgGUID: 6N2LS9GDR0+bOHNMrZ75BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33429994"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 07:46:30 -0700
Date: Wed, 22 May 2024 16:46:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 kamil.konieczny@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to detect
 Intel GPUs from their PCI IDs
Message-ID: <20240522144627.tdiadqyfgk67ox55@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 kamil.konieczny@intel.com, katarzyna.piecielska@intel.com
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com> <875xv6q8ob.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875xv6q8ob.fsf@intel.com>
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
On 2024-05-22 at 16:26:44 +0300, Jani Nikula wrote:
> On Wed, 22 May 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Wed, 22 May 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> >> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>
> >> Such tool parses the Kernel drivers for both i915 and Xe and
> >> generates a script that helps detecting Intel GPU models.
> >
> > I acknowledge the usefulness of such a tool, but to be brutally honest,
> > this implementation is horrible in so many levels.
> >
> > IGT uses meson and avoids perl.

imho this could also be a python script.

> >
> > This has a makefile with perl to generate a header that's included in a
> > C program that is built and executed to generate a perl script that's
> > then the tool, and the generated perl script runs lspci(8).
> >
> > I think there's really only one reasonable way to implement this in the
> > IGT context, and that's pure C, leveraging all the stuff in IGT, using
> > the PCI IDs listed in the IGT repo.
> >
> > Or you can turn this into a separate pet project, because what you have
> > here does not fit IGT.
> >
> > The i915_pciids.h parsing below is already stale, and you really can't
> > expect to get this merged and be kept up-to-date by folks updating
> > i915_pciids.h. IMO it's not maintainable.

This is for making a new script, after generation there will be
standalone program: intel_detect_gpu.pl and imho igt is missing
a tool like lsgpu which will work _without_ kmd gpu driver loaded,
simple enough so one can just run it.

> 
> An alternative is a pure bash or Python script to run something like:
> 
> 	lspci -d 8086::0300 -nn
> 

Looks like a good idea but this is also dependancy, btw
from man:
-nn    Show PCI vendor and device codes as both numbers and names.

imho we should not depend on names from lspci.
More from man:

-n     Show PCI vendor and device codes as numbers instead of looking them up in the PCI ID list.
-m     Dump PCI device data in a backward-compatible machine readable form.

> and annotate/filter the results based on the PCI IDs from:
> 
> 	modinfo -F alias i915
> 	modinfo -F alias xe

But this one is creating one more dependancy, one should have
modules compiled in current running kernel.

Regards,
Kamil

> 
> You get the fancy marketing names directly from lspci, supported kernel
> modules from modinfo, available on the system, with zero dependency on
> PCI ID macros or names in source code.
> 
> That's like a 100 lines of script that should need virtually zero
> maintenance.
> 
> Additionally, the script could match the modinfo PCI IDs against
> /usr/share/misc/pci.ids (see man pci.ds) to show the marketing names.
> 
> 
> BR,
> Jani.
> 
> -- 
> Jani Nikula, Intel
