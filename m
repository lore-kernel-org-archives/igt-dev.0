Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C59C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 08:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C40810E7FE;
	Wed, 12 Feb 2025 08:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G32MJaEc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9085410E802
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739349405; x=1770885405;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1XCCvTgJrncBQPSXs1kq90IXTT6AffO4YUGvg+lKHMw=;
 b=G32MJaEc6K1jM0Lk2laJytdqyvMuNKh45RUmC4eckwdvwlm1Fiar6i9s
 fSwaZThPGRWbY+nQ/hRhT/4WMRvKg04z7ykR+Kw2AwqksVXbb3Czqr/SI
 Vsdcs9QkVmMc5x89aLDCx+ZeoGFI++ODVDxhFwFDxsSsm882wKQG4bYa2
 c9h9JqO6lMKB+9nqSfnHC5nFxAraMAWuJR9CZsmBEhUjgXg/2eToIc717
 wl9fZ1vN8Fj0tDHpr2soLUEFeA1Bhx0utIASnJFd3v8q7AdT5ws/E/YGg
 eOj/AnJQE3Y1uFyJk6s23XYyL0dOwxZt6RCzHcl/vXPTCrpjjh90j4DKg A==;
X-CSE-ConnectionGUID: qeNIM5dLSE+FSrKYcHedFw==
X-CSE-MsgGUID: QLt6UXPXR5ir62Sm74wGgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39855789"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="39855789"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 00:36:45 -0800
X-CSE-ConnectionGUID: vry9f1YHTse4Wvonc+7TCQ==
X-CSE-MsgGUID: iObTAJ6HTsyEA8nobbUvyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="117774645"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.137])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 00:36:43 -0800
Date: Wed, 12 Feb 2025 09:36:40 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Message-ID: <20250212083614.w6nmqvkblab3ha4c@zkempczy-mobl2>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-2-peter.senna@linux.intel.com>
 <20250131123454.ilhzogs6a2w7s3on@kamilkon-desk.igk.intel.com>
 <17fe9952-7b2e-46fd-af1f-cd7cbea2cebd@linux.intel.com>
 <20250211161734.nm6dsq3ahhcn7hvz@zkempczy-mobl2>
 <5f9f0b38-343b-4b1a-b5c7-ad1706fa2ddd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f9f0b38-343b-4b1a-b5c7-ad1706fa2ddd@linux.intel.com>
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

On Tue, Feb 11, 2025 at 08:12:16PM +0100, Peter Senna Tschudin wrote:
> Hi Zbigniew,
> 
> Thank you for your comments, please see my answers below.
> 
> On 11.02.2025 17:17, Zbigniew Kempczyński wrote:
> > On Mon, Feb 03, 2025 at 10:23:00AM +0100, Peter Senna Tschudin wrote:
> >> Hi Kamil,
> >>
> >> Thank you for your review. Please see below.
> >>
> >> On 31.01.2025 13:34, Kamil Konieczny wrote:
> >>
> >> [...]
> >>
> >>>> +#include <stdio.h>
> >>>> +#include <string.h>
> >>>> +#include <unistd.h>
> >>>> +#include <fcntl.h>
> >>>> +#include <errno.h>
> >>>
> >>> Sort this alphabetically with exception of unistd.h - this
> >>> header could be first.
> >>
> >> That is picky, but ok.
> >>
> >>
> >>>
> >>>> +
> >>>> +#include "igt_core.h"
> >>>> +#include "igt_kmemleak.h"
> >>>> +
> >>>> +/* We can change the path for unit testing, see igt_kmemleak_init() */
> >>>> +static char igt_kmemleak_file[256] = "/sys/kernel/debug/kmemleak";
> >>>> +
> >>>> +#define MAX_WRITE_RETRIES 5
> >>>> +/**
> >>>> + * igt_kmemleak_write - Writes the buffer to the file descriptor retrying when
> >>>> + * possible.
> >>>> + * @fd: The file descriptor to write to.
> >>>> + * @buf: Pointer to the data to write.
> >>>> + * @count: Total number of bytes to write.
> >>>> + *
> >>>> + * Returns the total number of bytes written on success, or -1 on failure.
> >>>> + */
> >>>> +static bool igt_kmemleak_write(int fd, const void *buf, size_t count)
> >>>> +{
> >>>> +	const char *ptr = buf;
> >>>> +	size_t remaining = count;
> >>>> +	ssize_t written;
> >>>> +	int retries = 0;
> >>>> +
> >>>> +	while (remaining > 0) {
> >>>> +		written = write(fd, ptr, remaining);
> >>>> +		if (written > 0) {
> >>>> +			ptr += written;
> >>>> +			remaining -= written;
> >>>> +		} else if (written == -1) {
> >>>> +			if (errno == EINTR || errno == EAGAIN) {
> >>>> +				/* Retry for recoverable errors */
> >>>> +				if (++retries > MAX_WRITE_RETRIES) {
> >>>> +					igt_warn("igt_write: Exceeded retry limit\n");
> >>>
> >>> Do not use test prints in lib, especially those used by runner.
> >>
> >> Oh, I will. kmemleak is about writing to disk. If that fails, I will tell the user.
> >> Why does this restriction applies only to me? See:
> >>
> >> ---
> >> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools/lib$ git grep igt_warn|wc -l
> >> 164
> >> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools/lib$ cd ..
> >> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep igt_warn|wc -l
> >> 324
> >> ---
> >>
> >> About 50% of all references to igt_warn are in lib, what is the problem with my code?
> > 
> > I'm looking at the code and I have impression this should be part of
> > the runner, not igt library. Do I understand correctly that your
> > code will be used by the runner only and not by the tests?
> 
> It is difficult to know for now. We have one test that will use the lib
> as is: `tests/amdgpu/amd_mem_leak.c`. But that is not the main potential
> use case.
> 
> As I describe in the cover letter, transient leaks are kind of tricky,
> and we may require to request a scan from a test itself for better
> coverage. So in short I honestly do not know if we will have test
> integration in the future or not.

Fundamental question is - where do you want to scan/clear - on the runner
level or on the test? What will happen if you start to clear-scan/clear
both from runner (-k) and from the test itself. I've intentionally
added clear first to limit catched leaks to period where test was
executed.

On the runner level we would collect for all tests, on the test level
I imagine command line argument passed to the test like -k which would
enable the scan on the very beginning. But this would require to rewrite
all tests which are using pure main() instead of igt_main.*().
If really there's leak and someone wants to catch it, he can always
simply wrap around script execution by kmemleak clear-scan/clear.

Resume - I would stick to the runner level, I see no judgement to change
igt_core / tests to use this library directly.

> 
> > 
> > Regarding your above question, I think runner should use as much as
> > minimal from lib/ directory, because this is collection of functions
> > designed for tests, not for runner. I think generic code like data
> > structures (lists) are fine, but not the others. Imagine you'll
> > incidentally try to use igt_require() - follow the call and see
> > the pitfall there.
> 
> Currently the list of lib includes in the runner directory is not
> small (I used a dumb regex that looks for includes starting with igt_):
> 
> #include "igt_aux.h"
> #include "igt_core.h"
> #include "igt_facts.h"
> #include "igt_hook.h"
> #include "igt_list.h"
> #include "igt_taints.h"
> #include "igt_vec.h"
> 
> 
> > 
> > So if my understanding is correct and this code should be part of the
> > runner only your test might be moved to the runner_tests.c.
> 
> It is difficult to know at this stage. At least the amd test I mentioned
> earlier will use it.

I've explored runner code even if it is not in the center of my
interests. I've seen there're few places where it is tainted by igt
library code which might call logging from igt domain like igt_warn()
[igt_gettime()], or igt_assert() [igt_vec_elem()]. I've experimented
how runner code behaves with those calls, igt_warn() just logs but
output format differs than executor.c __logf__(). I think we should
be consistent in this case. Asserting __igt_fail_assert() unfortunately
uses igt logging but if we ever assert in the runner this will have
fatal consequences. IGT library contains a lot of asserts, so functions
from them should be meticulously reviewed before using in the runner.

--
Zbigniew

> 
> > 
> > BTW please rebase on top of current master, there were changes in
> > the runner/settings.c file that affects this series.
> 
> As soon as I am confident this will be merged, I surely will.
> 
> Thanks!
> 
> > 
> > --
> > Zbigniew
> > 
> >>
> >>
> >>>
> >>>> +					return false;
> >>>> +				}
> >>>> +				continue;
> >>>> +			} else {
> >>>> +				/* Log unrecoverable error */
> >>>> +				igt_warn("igt_write: unrecoverable write error");
> >>>
> >>> Same here.
> >> We should not remove this one.
> >>
> >>>
> >>>> +				return false;
> >>>> +			}
> >>>> +		} else if (written == 0) {
> >>>> +			if (++retries > MAX_WRITE_RETRIES) {
> >>>> +				igt_warn("igt_write: Exceeded retry limit\n");
> >>>
> >>> Same here.
> >> We should not remove this one.
> >>
> >> [...]
> >>
> >>>> +	FILE *fp;
> >>>
> >>> Why FILE* and fopen? Could you just use open/read?
> >>
> >> Why not?
> >>
> >> ---
> >> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep fopen|wc -l
> >> 97
> >> ---
> >>
> >>
> >> [...]
> >>
> >>>> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file)
> >>>> +{
> >>>> +	FILE *fp;
> >>>
> >>> Same here, open/read.
> >>
> >> Same here, why not?
> >> ---
> >> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep fopen|wc -l
> >> 97
> >> ---
> >>
> >> [...]
> >>
> >>>> +#define KMEMLEAKRESFILENAME "kmemleak.txt"
> >>>
> >>> imho better: IGT_KMEMLEAK_RESFILENAME
> >>
> >> It reads better indeed. Thanks.
> >>
> >> [...]
> 
