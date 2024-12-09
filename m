Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2135AE7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 17:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51E889F35;
	Mon,  9 Dec 2024 17:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMW7dKh7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1C589F35
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 17:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733764567; x=1765300567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2SXmYTXMH7CtZzepCedZ3lWpS10xp1V8jwHhs+spFOw=;
 b=YMW7dKh7GkWe5kHw0kpyUymll31DIcu5bPEza4IdrWZy7uLS1xHFdZs8
 SCYtVsQSg6tAA0Exu/74HFOFCHjEEMAYibj3pTKb0w+uOpLzjRD6xLonc
 jGVE2C9bc7yPPp/yA0Ph4Q1dFToFGvU4f4td5PQodRXUgH3YcFKWVy6aA
 HCnouO9seUKyME5awY7UWXizslYmJIIjZFUcX/8mJB2Vg973dDijVEJlz
 0O31x5yl7QpQcDvJqcIggdRldOhWhuIHrL8GSA3J9fmLJPvWUP8ptUC6F
 egr+LdTy2eTcFF/dX7YFmkeC4OI1Pm0Zw3pGT+uIaXcVGj3A2pVIp4oy4 Q==;
X-CSE-ConnectionGUID: 0GWf+Uy6TeqQ9jPsylNUkA==
X-CSE-MsgGUID: MlebZs3/Sp21cqm020v3rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33965285"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="33965285"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 09:16:06 -0800
X-CSE-ConnectionGUID: XEz9xjA6T2iTDiBBKrNXbQ==
X-CSE-MsgGUID: RCpZOcrBRZaLVrwGWFhEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95611642"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 09:16:02 -0800
Date: Mon, 9 Dec 2024 18:16:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 luciano.coelho@intel.com, nirmoy.das@intel.com,
 stuart.summers@intel.com, himal.prasad.ghimiray@intel.com,
 dominik.karol.piatkowski@intel.com, katarzyna.piecielska@intel.com,
 Leo Li <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Choi <nicholas.choi@amd.com>, George Zhang <george.zhang@amd.com>
Subject: Re: [PATCH i-g-t v11] igt-runner fact checking
Message-ID: <20241209171600.jintkjoqdtvbwqag@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 luciano.coelho@intel.com, nirmoy.das@intel.com,
 stuart.summers@intel.com, himal.prasad.ghimiray@intel.com,
 dominik.karol.piatkowski@intel.com, katarzyna.piecielska@intel.com,
 Leo Li <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Choi <nicholas.choi@amd.com>,
 George Zhang <george.zhang@amd.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <b2da3859-8450-465d-b62d-7ddef7698f0d@linux.intel.com>
 <20241209105335.a533h5gwjiq6rsfj@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241209105335.a533h5gwjiq6rsfj@zkempczy-mobl2>
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

Hi Zbigniew,
On 2024-12-09 at 11:53:35 +0100, Zbigniew Kempczyński wrote:
> On Thu, Dec 05, 2024 at 11:51:43AM +0100, Peter Senna Tschudin wrote:
> > When using igt-runner, collect facts before each test and after the
> > last test, and report when facts change. The facts are:
> >  - GPUs on PCI bus: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e20b Intel Battlemage (Gen20)
> >  - Associations between PCI GPU and DRM card: hardware.pci.drm_card_at_addr.0000:03:00.0: card1
> >  - Kernel taints: kernel.is_tainted.taint_warn: true
> >  - GPU kernel modules loaded: kernel.kmod_is_loaded.i915: true
> > 
> > This change imposes little execution overhead and adds just a few
> > lines of logging. The facts will be printed on normal igt-runner
> > output. Here is a real example from our CI shwoing
> > hotreplug-lateclose changing the DRM card number and tainting the
> > kernel on the abort path:
> > 
> >  [245.316207] [056/121] (816s left) core_hotunplug (hotreplug-lateclose)
> >  [245.383596] Starting subtest: hotreplug-lateclose
> >  [249.843361] Aborting: Lockdep not active
> >  [249.858249] [FACT core_hotunplug (hotreplug-lateclose)] changed: hardware.pci.drm_card_at_addr.0000:00:02.0: card0 -> card1
> >  [249.858392] [FACT core_hotunplug (hotreplug-lateclose)] new: kernel.is_tainted.taint_die: true
> >  [249.859075] Closing watchdogs
> > 
> > CC: Ryszard Knop <ryszard.knop@intel.com>
> > CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > CC: Lucas De Marchi <lucas.demarchi@intel.com>
> > CC: luciano.coelho@intel.com
> > CC: nirmoy.das@intel.com
> > CC: stuart.summers@intel.com
> > CC: himal.prasad.ghimiray@intel.com
> > CC: dominik.karol.piatkowski@intel.com
> > CC: katarzyna.piecielska@intel.com
> > Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> 
> According to our offline discussion today according acceptance criteria
> from my pov:
> 
> - split patch to library, tool and test part (3 commits + cover letter)
> - add switch (set it to disabled by default) to enable the facts collection
>   by CI, it can selectively enable your feature and this will give the
>   time to warm up. I have in my mind how long I've been working on bug
>   in udev scanning race (commit: a23e8aed0b54018339647d0817267431bd2b7075)
> - get r-b from CI folks (+Ryszard in cc). According to my request they
>   will need to enable using facts in CI. I don't know is any other
>   vendor interested with using facts (I guess on embedded likely not)
>   because there was no feedback from them, but I assume we don't want
>   to break their CI if there will be any issue with facts. I prefer
>   to be polite in meaning - "there's new code, it's hard to say it
>   is bug free, so we're allow you to enable this if you want. In the
>   meantime we'll be using this in our CI so that's will give the time
>   to warm it up". I have no such resistance in tests, sometimes in library
>   because there's more samples which might catch this on premerge. For
>   runner there's only one sample per machine (unless it will reboot)
>   but this is too small set to me. Selective enabling will give us
>   more samples in the some time period in which at least we won't break
>   other vendors CI.
> - there's minor issue I'm asking people when I'm doing review for them
>   - use /* */ comments instead of //.

The only exception is SPDX line to make checkpatch.pl happy.

> 
> Ping me when you'll address all of my requests.
> 
> --
> Zbigniew
> 

From this ("commit 268845156b299ac61e68dc52c104bbd79f929f79")
it looks like amdgpu devs are using igt_runner so adding them
to Cc, so they could also join a discussion for igt_runner
to collect facts and watch which ones are changing
(and which one we are missing if any?)

Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Nicholas Choi <nicholas.choi@amd.com>
Cc: George Zhang <george.zhang@amd.com>

Btw sorry for late notify.

Regards,
Kamil

> > ---
> > v11:
> >  - fix typo
> > 
> > v10:
> >  - fix memory leaks from asprintf (Thank you Dominik Karol!)
> >  - fix comments for consistency (Thank you Dominik Karol!)
> > 
> > v9:
> >  - do not report new hardware when loading/unloading kmod changes the
> >    string of the GPU name. I accidentally reintroduced this issue
> >    when refactoring to use linked lists.
> >  - add tools/lsfacts: 9 lines of code that print either the facts or
> >    that no facts were found.
> >  - fix code comments describing functions
> >  - fix white space issues
> > 
> > v8:
> >  - fix white space issues
> > 
> > v7:
> >  - refactor to use linked lists provided by igt_lists
> >  - Added function arguments to code comments
> >  - updated commit message
> > 
> > v6:
> >  - sort includes in igt_facts.c alphabetically
> >  - add facts for kernel taints using igt_kernel_tainted() and
> >    igt_explain_taints()
> > 
> > v5:
> >  - fix the broken patch format from v4
> > 
> > v4:
> >  - fix a bug on delete_fact()
> >  - drop glib and calls to g_ functions
> >  - change commit message to indicate that report only on fact changes
> >  - use consistent format for reporting changes
> >  - fix SPDX header format
> > 
> > v3:
> >  - refreshed commit message
> >  - changed format SPDX string
> >  - removed license text
> >  - replace last_test assignment when null by two ternary operators
> >  - added function descriptions following example found elsewhere in
> >    the code
> >  - added igt_assert to catch failures to realloc()
> > 
> > v2:
> >  - add lib/tests/igt_facts.c for basic unit testing
> >  - bugfix: do not report a new gpu when the driver changes the gpu name
> >  - bugfix: do not report the pci_id twice on the gpu name
> > 
> >  lib/igt_facts.c       | 755 ++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_facts.h       |  47 +++
> >  lib/meson.build       |   1 +
> >  lib/tests/igt_facts.c |  15 +
> >  lib/tests/meson.build |   1 +
> >  runner/executor.c     |  10 +
> >  tools/lsfacts.c       |  25 ++
> >  tools/meson.build     |   1 +
> >  8 files changed, 855 insertions(+)
> >  create mode 100644 lib/igt_facts.c
> >  create mode 100644 lib/igt_facts.h
> >  create mode 100644 lib/tests/igt_facts.c
> >  create mode 100644 tools/lsfacts.c
> > 

...cut...

