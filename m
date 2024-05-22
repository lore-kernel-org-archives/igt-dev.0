Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F574C25B7A
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 13:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D3110F596;
	Wed, 22 May 2024 13:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iw1NMh5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F8E10F596
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716384410; x=1747920410;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=od0dy410BV8RaKMA87N+lfsukah0IVnDqxwd3A4dyqE=;
 b=Iw1NMh5O6npQANOWk+XbmyMX0U2e2rvdfDC5yIW6ZlHwY8S2fQ1oug24
 ip/k+uh17Ax2BwHFc8HYy/Cyk4Sd2W9Qh7OQ0AworS6cJUnowPwgOVYYC
 9UghkSZ4B3cCvGBRLH6bHuFdMxC9KkGNtP/QXRRkCwcLv0nPOZVcQ8G5T
 ZBkMxhLvJYlR0WDux3Zp97khIVEkSd7nES3SGbPlyAiVBqm2bc1tVq4wj
 duoRU4kCNNtGs5yfzQ8BezRiFXXqwULJ9jFEcjwTClC8fVNB+684Dhaw3
 A9zBwu5seWfJWGZHKDh7K9ELwRITtz/sUwKmm0/2WQ7fMmKj9B8ioewI4 Q==;
X-CSE-ConnectionGUID: /sgOg2cKSkGXcWbIbUxv/w==
X-CSE-MsgGUID: lF9xW5FESSWCkwOZRp0ZMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="35144902"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="35144902"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 06:26:49 -0700
X-CSE-ConnectionGUID: h2Fxk+tDRwCswYLR11Ycfg==
X-CSE-MsgGUID: vgAtKmqPStq+mi2acTpBlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="33161358"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 06:26:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to
 detect Intel GPUs from their PCI IDs
In-Reply-To: <87a5kiqa6l.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
 <87a5kiqa6l.fsf@intel.com>
Date: Wed, 22 May 2024 16:26:44 +0300
Message-ID: <875xv6q8ob.fsf@intel.com>
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

On Wed, 22 May 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> On Wed, 22 May 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
>> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>>
>> Such tool parses the Kernel drivers for both i915 and Xe and
>> generates a script that helps detecting Intel GPU models.
>
> I acknowledge the usefulness of such a tool, but to be brutally honest,
> this implementation is horrible in so many levels.
>
> IGT uses meson and avoids perl.
>
> This has a makefile with perl to generate a header that's included in a
> C program that is built and executed to generate a perl script that's
> then the tool, and the generated perl script runs lspci(8).
>
> I think there's really only one reasonable way to implement this in the
> IGT context, and that's pure C, leveraging all the stuff in IGT, using
> the PCI IDs listed in the IGT repo.
>
> Or you can turn this into a separate pet project, because what you have
> here does not fit IGT.
>
> The i915_pciids.h parsing below is already stale, and you really can't
> expect to get this merged and be kept up-to-date by folks updating
> i915_pciids.h. IMO it's not maintainable.

An alternative is a pure bash or Python script to run something like:

	lspci -d 8086::0300 -nn

and annotate/filter the results based on the PCI IDs from:

	modinfo -F alias i915
	modinfo -F alias xe

You get the fancy marketing names directly from lspci, supported kernel
modules from modinfo, available on the system, with zero dependency on
PCI ID macros or names in source code.

That's like a 100 lines of script that should need virtually zero
maintenance.

Additionally, the script could match the modinfo PCI IDs against
/usr/share/misc/pci.ids (see man pci.ds) to show the marketing names.


BR,
Jani.

-- 
Jani Nikula, Intel
