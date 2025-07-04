Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C2DC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 11:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8800E10E0F3;
	Fri,  4 Jul 2025 11:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRzck8cV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CE810E0F3
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751629003; x=1783165003;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JXN2D8dmiTjhrXkPLkBYB2bwKJUWjd42a9kHqBNswM4=;
 b=hRzck8cV3wjmsSU1ZNWp1Wp6Ty3T21I1OUU4f46EZIiJqwEZOlxyXNJY
 CnSSN3DtPF62WwI09D3/T7iaT6kcIZFoJZtYdJF7EKBxM/D4YDB3x2v5H
 vcYmgads8dn/HcTy+iMNVft0h0+eEZAI+zmkYqQaP4vChpfLvIJtiLW2G
 FkYXwmQec4O+N3bPLzrh/+zGQkOqqj4KcDNu3anCO/g1dyivUKB9z/qN+
 Ie5AtAx+sqxjoHilHakTkYFB5NCxhfucY9SjOm5/aW279YoX2SFhMu1ND
 DTlzOxKEZvEsHoTMoiNJnhAaOf+BgmjvatYoXcBFmN6PY1q7pjKL2X0jt Q==;
X-CSE-ConnectionGUID: 3tffY6BZTmCiyemEtmNcKg==
X-CSE-MsgGUID: Rwfm3SKNSYuTSt1YYryrNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65415946"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="65415946"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 04:36:42 -0700
X-CSE-ConnectionGUID: KBjR+qqJRCG7EBsz5ZdFCw==
X-CSE-MsgGUID: F/Z3T4bpThG/RGdIn35lDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="159180907"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 04:36:40 -0700
Date: Fri, 4 Jul 2025 13:36:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, michal.wajdeczko@intel.com,
 marcin.bernatowicz@intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, ewelina.musial@intel.com
Subject: Re: [PATCH v3 resend i-g-t 3/6] tests: Add core_debugfs_heads_power
Message-ID: <20250704113637.xbufl3ydwur46zpf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, michal.wajdeczko@intel.com,
 marcin.bernatowicz@intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, ewelina.musial@intel.com
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
 <20250616074240.45818-4-peter.senna@linux.intel.com>
 <aGbqZTPOpf79Xxx7@intel.com>
 <bb7e190c-203e-41f5-a367-baf5a0acf4ca@linux.intel.com>
 <830d9413-7f7c-47cc-9473-50a59e4ccd79@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <830d9413-7f7c-47cc-9473-50a59e4ccd79@intel.com>
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

Hi Karthik,
On 2025-07-04 at 15:31:02 +0530, Karthik B S wrote:
> Hi,
> 
> On 7/4/2025 1:36 PM, Peter Senna Tschudin wrote:
> > 
> > On 7/3/2025 10:39 PM, Rodrigo Vivi wrote:
> > > On Mon, Jun 16, 2025 at 09:42:35AM +0200, Peter Senna Tschudin wrote:
> > > > Introduce core_debugfs_heads_power that is expected to work with any
> > > > GPU, not limited to i915 and Xe. The test powers off all available
> > > > heads before reading debugfs files, and then powers on all heads
> > > > before reading the files again.
> > > > 
> > > > Cc: Karthik B S <karthik.b.s@intel.com>
> > > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > > Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> > > > Cc: Swati Sharma <swati2.sharma@intel.com>
> > > > Cc: michal.wajdeczko@intel.com
> > > > Cc: marcin.bernatowicz@intel.com
> > > > Cc: kamil.konieczny@linux.intel.com
> > > > Cc: katarzyna.piecielska@intel.com
> > > > Cc: zbigniew.kempczynski@intel.com
> > > > Cc: ewelina.musial@intel.com
> > > > Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > > > ---
> > > > v3:
> > > >   - renamed the test
> > > >   - Removed reference to sysfs from comments  (thanks Kamil)
> > > >   - Updated description to match the display part (thanks Kamil)
> > > >   - Moved from "display" to "heads". Our CI uses "headless" to refer
> > > >     to a DUT without display and it is shorter
> > > >   - renamed subtests for shorter names (thanks Kamil)
> > > >   - fixed comments style (thanks Kamil)
> > > >   - updated CC list
> > > >   - changed the order to test first with all heads off then with all heads on
> > > >     to prevent the need from powering on the heads at the end of the test
> > > >     (thanks Kamil)
> > > >   - removed snprintf from test names (thanks Kamil)
> > > >   - removed subtest group (thanks Kamil)
> > > >   - deleted kms_tests() and moved the code to igt_main (thanks Kamil)
> > > > 
> > > > v2:
> > > >   - changed style of comparison to NULL
> > > >   - moved to a separate patch
> > > > 
> > > >   tests/core_debugfs_heads_power.c | 156 +++++++++++++++++++++++++++++++
> > > >   tests/meson.build                |   1 +
> > > >   2 files changed, 157 insertions(+)
> > > >   create mode 100644 tests/core_debugfs_heads_power.c
> > > > 
> > > > diff --git a/tests/core_debugfs_heads_power.c b/tests/core_debugfs_heads_power.c
> > > > new file mode 100644
> > > > index 000000000..1813986d8
> > > > --- /dev/null
> > > > +++ b/tests/core_debugfs_heads_power.c
> > > > @@ -0,0 +1,156 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#include "igt.h"
> > > > +#include "igt_debugfs.h"
> > > > +#include "igt_dir.h"
> > > > +
> > > > +/**
> > > > + * TEST: debugfs heads power test
> > > Could we please use display instead of heads here?
> > >  From display folks perspective heads might be indeed more clear because we will
> > > only use display if any 'head' is attached, but from folks outside of display
> > > world, heads will be a confusing term to be in the name of the test.
> > > 
> > > Or perhaps we name kms_debugfs
> > My first name proposal was core_debugfs_display_on_off. This is
> > informative because it makes it explicit that this runs the test with
> > display on and with the display off. This name is also a good contrast
> > with the other test core_debugfs. Removing the on_off suffix makes the
> > name less informative.
> > 
> > Problem is that core_debugfs_display_on_off is a large name. So using
> > heads instead of display was an attempt to make the name shorter, but no
> > one liked it. We are waiting the KMS team to decide on which name they want.
> I would vote for kms_debugfs as this would be also consistent with the
> existing display tests. I'm also okay with 'core_debugfs_display' if we
> can't have kms_debugfs.

Imho kms_debugfs is good, also shorter.

> > 
> > 
> > 
> > 
> > > > + * Description: Read entries from debugfs with all heads on and with all heads
> > > > + *		off.

Karthik, could you help us with this description here?
Why we need this test, as I guess core_debugfs is not enough,
but why?  Do we need any improvement in testing this?

It could be added as is now as this how it was in Intel tests,
with a note about TODO.

Regards,
Kamil

> > > > + * Category: Core
> > > > + * Mega feature: General Core features
> > > > + * Sub-category: uapi
> > > > + * Functionality: debugfs
> > > > + * Feature: core
> > > > + * Test category: uapi
> > > > + *
> > > > + * SUBTEST: off-read-all
> > > > + * Description: Read all debugfs entries with heads off.
> > > > + *
> > > > + * SUBTEST: on-read-all
> > > > + * Description: Read all debugfs entries with heads on.
> > > > + */

...cut...

