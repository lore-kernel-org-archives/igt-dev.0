Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AA8C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 14:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4603610E8C3;
	Wed, 12 Feb 2025 14:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ix/fDp8i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A13510E8C3
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739370389; x=1770906389;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VfDSfBlWy7yPoTbuEGQa1XfWdhItm46VtS/COu4YxfU=;
 b=Ix/fDp8iilrg8ZE5srp3GPACAAmVBPPenX36JYuNu09hUexpxrcCBM3b
 c08zoWFTal3IAcJ6f/PN903sY6W9iLovcd1nycSDE9ff0NmHp2bX6CLA3
 k5QYUXnYNM0SZKy3uw1ki9PyZwQdxnXtReAI92P1vyEPk3aDHgIGiMvjn
 kG0Yb4zlWAUpoeytSwV3pvuUDjR73eMcBPaZ6TsWdYUSPUJysJsPajqPp
 CAVlPbTG8EjS5sDc1bkR7GJCPAndQumv1c+ZE4rwXch6fOO1tM3xvDYp8
 xsE/MS23IyoEkSei10TAVrBOAjkWHUdDA5+lBH/QxpeFHXM4A7ggyhAmt Q==;
X-CSE-ConnectionGUID: D8ShBYorRnmt6Nn03em0gA==
X-CSE-MsgGUID: 9QBmiMr3S12g3Tp/uW9UKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="51014151"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="51014151"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:26:26 -0800
X-CSE-ConnectionGUID: yXc9qlTiT/+sFA7Etinfvw==
X-CSE-MsgGUID: 9y0bkbFuRpSNSS9xJuF6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150022197"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:26:24 -0800
Date: Wed, 12 Feb 2025 15:26:21 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Message-ID: <20250212142621.3af4sctgcwxriibx@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-2-peter.senna@linux.intel.com>
 <20250131123845.ng5b2cbzyqfulm5o@kamilkon-desk.igk.intel.com>
 <e433618c-2571-48e0-a120-2016246ae367@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e433618c-2571-48e0-a120-2016246ae367@linux.intel.com>
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
On 2025-02-03 at 10:14:19 +0100, Peter Senna Tschudin wrote:
> Hi Kamil,
> 
> Thank you, please see my comments.
> 
> On 31.01.2025 13:38, Kamil Konieczny wrote:
> > Hi Peter,
> > On 2025-01-28 at 16:15:36 +0100, Peter Senna Tschudin wrote:
> > 
> > sorry one more nit, found by checkpatch, see below.
> > 
> >> Adds a simple library for interacting with kmemleak and add
> >> unit testing for the library. There are two modes intended to
> >> integrate with igt_runner:
> >> - once: collect kmemleaks after all test completed
> >> - each: collect kmemleaks after eachb test completes
> >>
> >> To use the library include "igt_kmemleak.h", call
> >> igt_kmemleak_init(NULL) to check if kmemleak is enabled and finally
> >> call igt_kmemleak() to collect kmemleaks. igt_kmemleak() expect the
> >> following arguments:
> >>   - const char *last_test: Name of the last lest or NULL
> >>   - int resdirfd: file descriptor of the results directory
> >>   - bool kmemleak_each: Are we scanning once or scanning after
> >>     each test?
> >>   - bool sync: sync after each write?
> >>
> >> CC: ryszard.knop@intel.com
> >> CC: lucas.demarchi@intel.com
> >> CC: katarzyna.piecielska@intel.com
> >> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> >> ---
> >>  lib/igt_kmemleak.c       | 274 +++++++++++++++++++++++++++++++++++++++
> >>  lib/igt_kmemleak.h       |  16 +++
> >>  lib/meson.build          |   1 +
> >>  lib/tests/igt_kmemleak.c | 267 ++++++++++++++++++++++++++++++++++++++
> >>  lib/tests/meson.build    |   1 +
> >>  5 files changed, 559 insertions(+)
> >>  create mode 100644 lib/igt_kmemleak.c
> >>  create mode 100644 lib/igt_kmemleak.h
> >>  create mode 100644 lib/tests/igt_kmemleak.c
> >>
> > 
> > ...cut...
> > 
> >> +
> >> +static const char *igt_kmemleak_unit_testing_resdir = "/tmp";
> >> +
> >> +igt_main
> >> +{
> >> +	char unit_testing_kmemleak_filepath[256] = "/tmp/igt_kmemleak_test_XXXXXX";
> >> +	int written_bytes;
> >> +	int resdirfd;
> >> +	int fd;
> >> +
> >> +	igt_fixture {
> >> +		/* resdirfd is used by igt_kmemleak() to store results */
> >> +		igt_assert(resdirfd = open(igt_kmemleak_unit_testing_resdir,
> >> +					   O_DIRECTORY | O_RDONLY));
> >> +
> >> +		/* Try to delete results file in case of leftovers,
> >> +		 * ignoring errors as the file may not exist
> >> +		 */
> >> +		unlinkat(resdirfd, KMEMLEAKRESFILENAME, 0);
> >> +
> >> +		/* Creating a fake kmemleak file for unit testing */
> >> +		fd = mkstemp(unit_testing_kmemleak_filepath);
> >> +		igt_assert(fd >= 0);
> >> +
> >> +		written_bytes = write(fd, kmemleak_file_example,
> >> +				strlen(kmemleak_file_example));
> > 
> > Align here or just write this in one line:
> > 		written_bytes = write(fd, kmemleak_file_example, strlen(kmemleak_file_example));
> > or
> > 		written_bytes = write(fd, kmemleak_file_example,
> > 				      strlen(kmemleak_file_example));
> 
> Good catch, curious why my checkpatch did not catch this one:
> 
> ---
> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ ../linux/scripts/checkpatch.pl 0001-lib-igt_kmemleak-library-to-interact-with-kmemleak.patch
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #39:
> new file mode 100644
> 
> WARNING: quoted string split across lines
> #394: FILE: lib/tests/igt_kmemleak.c:37:
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2ed18 (size 80):\n"
> 

You could ignore this, checkpatch is not perfect.

Regards,
Kamil

[...]
> 
> WARNING: quoted string split across lines
> #526: FILE: lib/tests/igt_kmemleak.c:169:
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e798 (size 80):\n"
> 
> WARNING: quoted string split across lines
> #548: FILE: lib/tests/igt_kmemleak.c:191:
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e0b8 (size 80):\n"
> 
> total: 0 errors, 9 warnings, 571 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
> 
> 0001-lib-igt_kmemleak-library-to-interact-with-kmemleak.patch has style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
> ---
> 
> 
> 
> > 
> > Regards,
> > Kamil
> > 
> > ...cut...
> 
