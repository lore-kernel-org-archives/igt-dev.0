Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88C2E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 16:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6908510F131;
	Fri,  6 Dec 2024 16:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbOOJVW6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A59410F131
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 16:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733503635; x=1765039635;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Fp3k/wj+3yr/WnSa0n5QhVqSHH8tYrG5s1rb0yqpUkQ=;
 b=BbOOJVW6XMUUoYT8borrhwUr43cVhOIGrC4vQQTCAm0fjD3zdaTXLzrd
 kQpfvlYcQd62q2CJw3xT/iOHe7lotzGORl+3MCbmAiXkcUWqfBpnCdWi2
 PyJKoX0HD6WBbRstGdLOswdyXJBf4o48BI1+Gk5xOYMVOH26gQQzLCJcX
 gygdD7BNtIzw6kb0JoW8+TO9X9al/V6p4oWPyA/3GQNCFXyeM9WIEGPLH
 pO2l9V8pT4iUpB7iWDi+KaEINJ3iIPvn9eSFCY6vDXzqxkosSgKaaGGtC
 uATC8GbG+Q2KQTtelCI2LWcyFnAcQqUX7pBKtvHl3R9Gyzl1BiDHFqQAw g==;
X-CSE-ConnectionGUID: 8YHAx9cSSMO13RMdkNvlLg==
X-CSE-MsgGUID: 0ORiwSD0Ta+tcTOWhl6A/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="44332831"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="44332831"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 08:47:14 -0800
X-CSE-ConnectionGUID: GHo/Bd9GR6qsHgSY4XZ1mg==
X-CSE-MsgGUID: KN0d0BsdTymotmVUb8pw3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="94911900"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 08:47:09 -0800
Date: Fri, 6 Dec 2024 17:46:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 luciano.coelho@intel.com, nirmoy.das@intel.com,
 stuart.summers@intel.com, himal.prasad.ghimiray@intel.com,
 dominik.karol.piatkowski@intel.com, katarzyna.piecielska@intel.com,
 Petri Latvala <adrinael@adrinael.net>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>, Melissa Wen <mwen@igalia.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH i-g-t v10] igt-runner fact checking
Message-ID: <20241206164654.nqzmzcilagwvuug6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 luciano.coelho@intel.com, nirmoy.das@intel.com,
 stuart.summers@intel.com, himal.prasad.ghimiray@intel.com,
 dominik.karol.piatkowski@intel.com, katarzyna.piecielska@intel.com,
 Petri Latvala <adrinael@adrinael.net>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>,
 Melissa Wen <mwen@igalia.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <b909e2ca-f713-45e1-997d-6871e136a076@linux.intel.com>
 <20241206114250.h53jleknj4kgrpri@kamilkon-desk.igk.intel.com>
 <1ee3fa1d-144a-49f5-8bf3-4fa00929894b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ee3fa1d-144a-49f5-8bf3-4fa00929894b@linux.intel.com>
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
On 2024-12-06 at 14:16:27 +0100, Peter Senna Tschudin wrote:
> Hi Kamil,
> 
> Thank you for your comments. I appreciate the opportunity to clarify and address
> your concerns.
> 
> On 06.12.2024 12:42, Kamil Konieczny wrote:
> > Hi Peter,
> > On 2024-12-05 at 05:54:26 +0100, Peter Senna Tschudin wrote:
> > 
> > overall looks good, I have few nits, see below.
> 
> Thank you! Our CI tested it thoroughly, it creates value, and  it works well.
> It is time to merge it.
> 
> > 
> > As for subject, it usally informs what changed, so "igt-runner fact checking"
> > is a little misleading. Please see my ask about that below.
> 
> Please explain what is misleading about the subject. It looks good to me.
> 

Subject suggest that this is a change only for runner, while it
also adds a tool lsfacts.

> > 
> >> When using igt-runner, collect facts before each test and after the

s/igt-runner/igt_runner/

> >> last test, and report when facts change. The facts are:

Add newline here.

> >>  - GPUs on PCI bus: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e20b Intel Battlemage (Gen20)
> >>  - Associations between PCI GPU and DRM card: hardware.pci.drm_card_at_addr.0000:03:00.0: card1
> >>  - Kernel taints: kernel.is_tainted.taint_warn: true
> >>  - GPU kernel modules loaded: kernel.kmod_is_loaded.i915: true

imho here it should be general description what it will print, like:

- GPUs on PCI bus: 'hardware PCI bus' 'GPU name'
- Associations between PCI GPU and DRM card: 'PCI bus': 'card number'
- Kernel taints: 'true' or 'false'
- GPU kernel modules loaded: 'driver name'

and then you could provide an example.

> >>
> >> This change imposes little execution overhead and adds just a few
> > 
> > imho 'little overhead' is beause facts are only four but I agree
> > we could change implementation when its number grows.
> 
> Little overhead is because of how I implemented the code. The execution
> is efficient and produces as little text output as possible.
> 
> > 
> >> lines of logging. The facts will be printed on normal igt-runner
> >> output. Here is a real example from our CI showing
> >> hotreplug-lateclose changing the DRM card number and tainting the
> >> kernel on the abort path:
> >>
> >>  [245.316207] [056/121] (816s left) core_hotunplug (hotreplug-lateclose)
> >>  [245.383596] Starting subtest: hotreplug-lateclose
> >>  [249.843361] Aborting: Lockdep not active
> >>  [249.858249] [FACT core_hotunplug (hotreplug-lateclose)] changed: hardware.pci.drm_card_at_addr.0000:00:02.0: card0 -> card1
> >>  [249.858392] [FACT core_hotunplug (hotreplug-lateclose)] new: kernel.is_tainted.taint_die: true
> >>  [249.859075] Closing watchdogs

Where is a note about adding new tool? Patch should describe
all changes. I would prefer to see such note at beginning of
description. Btw splitting this into few functional patches
will gain that naturally.

> >>
> >> CC: Ryszard Knop <ryszard.knop@intel.com>
> >> CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> >> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> >> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> >> CC: luciano.coelho@intel.com
> >> CC: nirmoy.das@intel.com
> >> CC: stuart.summers@intel.com
> >> CC: himal.prasad.ghimiray@intel.com
> >> CC: dominik.karol.piatkowski@intel.com
> >> CC: katarzyna.piecielska@intel.com
> > 
> > +cc Petri + kms devs
> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> > Cc: Swati Sharma <swati2.sharma@intel.com>
> > Cc: Jani Saarinen <jani.saarinen@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > 
> > +other gpu devs
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Helen Koike <helen.koike@collabora.com>
> > 
> > +drm ci dev
> > Cc: Melissa Wen <mwen@igalia.com>
> > Cc: Maíra Canal <mcanal@igalia.com>
> 
> That is a lot of people to CC, but ok.
> 

Well I do not know if it will help other igt_runner users,
so it is better to ask.

> > 
> >> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> >> ---
> >> Re-sending as the mailing list server rejected the message
> >> yesterday due to a probably full disk...
> >>
> >> v10:
> >>  - fix memory leaks from asprintf (Thank you Dominik Karol!)
> >>  - fix comments for consistency (Thank you Dominik Karol!)
> >>
> >> v9:
> >>  - do not report new hardware when loading/unloading kmod changes
> >>    the string of the GPU name. I accidentally reintroduced this
> >>    issue when refactoring to use linked lists.
> >>  - add tools/lsfacts: 9 lines of code that print either the facts
> >>    or that no facts were found.
> >>  - fix code comments describing functions
> >>  - fix white space issues
> >>
> >> v8:
> >>  - fix white space issues
> >>
> >> v7:
> >>  - refactor to use linked lists provided by igt_lists
> >>  - Added function arguments to code comments
> >>  - updated commit message
> >>
> >> v6:
> >>  - sort includes in igt_facts.c alphabetically
> >>  - add facts for kernel taints using igt_kernel_tainted() and
> >>    igt_explain_taints()
> >>
> >> v5:
> >>  - fix the broken patch format from v4
> >>
> >> v4:
> >>  - fix a bug on delete_fact()
> >>  - drop glib and calls to g_ functions
> >>  - change commit message to indicate that report only on fact changes
> >>  - use consistent format for reporting changes
> >>  - fix SPDX header format
> >>
> >> v3:
> >>  - refreshed commit message
> >>  - changed format SPDX string
> >>  - removed license text
> >>  - replace last_test assignment when null by two ternary operators
> >>  - added function descriptions following example found elsewhere in
> >>    the code
> >>  - added igt_assert to catch failures to realloc()
> >>
> >> v2:
> >>  - add lib/tests/igt_facts.c for basic unit testing
> >>  - bugfix: do not report a new gpu when the driver changes the gpu name
> >>  - bugfix: do not report the pci_id twice on the gpu name
> >>
> >>  lib/igt_facts.c       | 755 ++++++++++++++++++++++++++++++++++++++++++
> >>  lib/igt_facts.h       |  47 +++
> >>  lib/meson.build       |   1 +
> >>  lib/tests/igt_facts.c |  15 +
> >>  lib/tests/meson.build |   1 +
> > 
> > Please split your patchset into three, add above files to
> > first patch:
> > 
> > [PATCH i-g-t v11 1/3] lib/igt_facts: add fact checking lib
> > 
> >>  runner/executor.c     |  10 +
> > 
> > [PATCH i-g-t v11 2/3] runner/executor: Check facts at tests run
> > 
> >>  tools/lsfacts.c       |  25 ++
> >>  tools/meson.build     |   1 +
> > 
> > [PATCH i-g-t v11 3/3] tools/lsfacts: Add facts listing tool
> > 
> > and it all with cover letter.
> 
> No. Why would I do that? Both the change to runner/executor.c and
> the new tool are very small, not justifying a separate patch. They
> also match well in functionality also not justifying a different
> patch. What gain are you trying to achieve here? I really like a
> single patch in this case.
> 

You could split it in other ways, first adding lib and tool lsfacts,
then small patch change in runner/executor.c

It is also about a risk, change in igt_runner is a main risk and in
case we need a revert, I would prefer to revert small patch, one
from 2 or 3 rather than one big that added all. Additional gain is
more clear git log history.

> > 
> >>  8 files changed, 855 insertions(+)
> >>  create mode 100644 lib/igt_facts.c
> >>  create mode 100644 lib/igt_facts.h
> >>  create mode 100644 lib/tests/igt_facts.c
> >>  create mode 100644 tools/lsfacts.c
> >>
> >> diff --git a/lib/igt_facts.c b/lib/igt_facts.c
> >> new file mode 100644
> >> index 000000000..4749d3417
> >> --- /dev/null
> >> +++ b/lib/igt_facts.c
> >> @@ -0,0 +1,755 @@
> >> +// SPDX-License-Identifier: MIT
> >> +// Copyright © 2024 Intel Corporation
> > 
> > Copyright is usally formatted in C-comment style /* comment */
> > to allow extending it (or adding Author: fields, etc) See other
> > C files for example tests/device_reset.c
> > So here:
> > 
> > /*
> >  * Copyright © 2024 Intel Corporation
> >  */
> > 
> > Do the same in other new files.
> 
> No sorry, this is because of you asked me to please kernel's
> checkpatch.pl. I am not sending another revision for this nit
> that changes the comment style. Have you seen how the comment
> style varies in our code base, including recent commits? Why
> being so picky with my patch?
> 

I try to look into new patches but I cannot take care of every one.
checkpatch.pl checks SPDX line, while 'Copyright' is in separate
comment. Check for yourself:

grep Copyright lib/*c
grep Copyright lib/*h

None of it has '//' as a starting comment.
And I checked my replay to your v1, I asked about dropping text
_after_ Copyright, I did not wrote any about using '//' for it.

> That being said, if you want to implement these changes yourself
> please go for it.

Well, no. I just skimmed over your changes and see there is
list of gpu drivers there:

+const char *igt_fact_kmod_list[] = {
	+	"amdgpu",
	+	"i915",
	+	"nouveau",
	+	"radeon",
	+	"xe",
	+	"\0"
	+};

It should be in sync with lib/drmtest.c

} modules[] = {
        { DRIVER_AMDGPU, "amdgpu" },
        { DRIVER_INTEL, "i915", modprobe_i915 },
        { DRIVER_MSM, "msm" },
        { DRIVER_PANFROST, "panfrost" },
        { DRIVER_V3D, "v3d" },
        { DRIVER_VC4, "vc4" },
        { DRIVER_VGEM, "vgem" },
        { DRIVER_VMWGFX, "vmwgfx" },
        { DRIVER_XE, "xe" },
        {}

or at least add a comment why it is not.

Regards,
Kamil

> 
> Thank you,
> 
> Peter
> 
> > 
> > Regards,
> > Kamil
> > 
> >> +
> >> +#include <ctype.h>
> >> +#include <libudev.h>
> >> +#include <stdio.h>
> >> +#include <sys/time.h>
> >> +#include <time.h>
> >> +
> >> +#include "igt_core.h"
> >> +#include "igt_device_scan.h"
> >> +#include "igt_facts.h"
> >> +#include "igt_kmod.h"
> >> +#include "igt_list.h"
> >> +#include "igt_taints.h"
> >> +
> >> +static struct igt_list_head igt_facts_list_drm_card_head;
> >> +static struct igt_list_head igt_facts_list_kmod_head;
> >> +static struct igt_list_head igt_facts_list_ktaint_head;
> >> +static struct igt_list_head igt_facts_list_pci_gpu_head;
> >> +
> >> +
> >> +/**
> >> + * igt_facts_lists_init:
> >> + *
> >> + * Initialize igt_facts linked lists.
> >> + *
> >> + * Returns: void
> >> + */
> >> +void igt_facts_lists_init(void)
> >> +{
> >> +	IGT_INIT_LIST_HEAD(&igt_facts_list_drm_card_head);
> >> +	IGT_INIT_LIST_HEAD(&igt_facts_list_kmod_head);
> >> +	IGT_INIT_LIST_HEAD(&igt_facts_list_ktaint_head);
> >> +	IGT_INIT_LIST_HEAD(&igt_facts_list_pci_gpu_head);
> >> +}
> >> +
> >> +
> >> +/**
> >> + * igt_facts_log:
> >> + * @last_test: name of the test that triggered the fact
> >> + * @name: name of the fact
> >> + * @new_value: new value of the fact
> >> + * @old_value: old value of the fact
> >> + *
> >> + * Reports fact changes:
> >> + * - new fact: if old_value is NULL and new_value is not NULL
> >> + * - deleted fact: if new_value is NULL and old_value is not NULL
> >> + * - changed fact: if new_value is different from old_value
> >> + *
> >> + * Returns: void
> >> + */
> >> +static void igt_facts_log(const char *last_test, const char *name,
> >> +			  const char *new_value, const char *old_value)
> >> +{
> > 
> > ...cut...
> > 
> >> -- 
> >> 2.34.1
> >>
> 
