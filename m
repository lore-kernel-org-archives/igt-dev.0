Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC2EC0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 16:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD6889143;
	Tue, 11 Feb 2025 16:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6SfdwUY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DCA10E700
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 16:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739290659; x=1770826659;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ydu3KnMXNXhJYmU7jU/FpYRPob/1ZGbwz2T+k6hqosc=;
 b=S6SfdwUYFyR64kzLCkyUlLcmwL15vGWThOfVTJhPoDQE1wJuwhwg1xB8
 /T7p4XMaPW4cJ8mOKoxN6RFUuA/ppeRnMctbXI5T97+bGvHGbpQRSqOdA
 JXjVTJfCbsK25+Ccxs6686Qni8g95p8A5hRy2UNzeCVvdHtOe0jx51T3+
 Nc87ttCEv/gms4PgTWfQzmxWPJumOU8iIkfEEJC6OOxZ0E4DJIofms60y
 acOivFAtfwuvreIzQiCGhsZtPZgHKYET7Dx/7R+m1/w6+O/TfmPyF+jSM
 wxAl6P8kLdnbhOBbKydUoKYM+FXMQd2R3wWopSjBX+xAKSmJfhXWUJVGh Q==;
X-CSE-ConnectionGUID: 9JTbU1+hT5WslvDCk45Miw==
X-CSE-MsgGUID: uceHLwjQSIaxIktfynj/Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43576205"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="43576205"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:17:39 -0800
X-CSE-ConnectionGUID: TqypE/gFRVCeT2/uE3oMQQ==
X-CSE-MsgGUID: H9rCrNBKS1u8Toiog96ZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117172213"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:17:37 -0800
Date: Tue, 11 Feb 2025 17:17:34 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Message-ID: <20250211161734.nm6dsq3ahhcn7hvz@zkempczy-mobl2>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-2-peter.senna@linux.intel.com>
 <20250131123454.ilhzogs6a2w7s3on@kamilkon-desk.igk.intel.com>
 <17fe9952-7b2e-46fd-af1f-cd7cbea2cebd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17fe9952-7b2e-46fd-af1f-cd7cbea2cebd@linux.intel.com>
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

On Mon, Feb 03, 2025 at 10:23:00AM +0100, Peter Senna Tschudin wrote:
> Hi Kamil,
> 
> Thank you for your review. Please see below.
> 
> On 31.01.2025 13:34, Kamil Konieczny wrote:
> 
> [...]
> 
> >> +#include <stdio.h>
> >> +#include <string.h>
> >> +#include <unistd.h>
> >> +#include <fcntl.h>
> >> +#include <errno.h>
> > 
> > Sort this alphabetically with exception of unistd.h - this
> > header could be first.
> 
> That is picky, but ok.
> 
> 
> > 
> >> +
> >> +#include "igt_core.h"
> >> +#include "igt_kmemleak.h"
> >> +
> >> +/* We can change the path for unit testing, see igt_kmemleak_init() */
> >> +static char igt_kmemleak_file[256] = "/sys/kernel/debug/kmemleak";
> >> +
> >> +#define MAX_WRITE_RETRIES 5
> >> +/**
> >> + * igt_kmemleak_write - Writes the buffer to the file descriptor retrying when
> >> + * possible.
> >> + * @fd: The file descriptor to write to.
> >> + * @buf: Pointer to the data to write.
> >> + * @count: Total number of bytes to write.
> >> + *
> >> + * Returns the total number of bytes written on success, or -1 on failure.
> >> + */
> >> +static bool igt_kmemleak_write(int fd, const void *buf, size_t count)
> >> +{
> >> +	const char *ptr = buf;
> >> +	size_t remaining = count;
> >> +	ssize_t written;
> >> +	int retries = 0;
> >> +
> >> +	while (remaining > 0) {
> >> +		written = write(fd, ptr, remaining);
> >> +		if (written > 0) {
> >> +			ptr += written;
> >> +			remaining -= written;
> >> +		} else if (written == -1) {
> >> +			if (errno == EINTR || errno == EAGAIN) {
> >> +				/* Retry for recoverable errors */
> >> +				if (++retries > MAX_WRITE_RETRIES) {
> >> +					igt_warn("igt_write: Exceeded retry limit\n");
> > 
> > Do not use test prints in lib, especially those used by runner.
> 
> Oh, I will. kmemleak is about writing to disk. If that fails, I will tell the user.
> Why does this restriction applies only to me? See:
> 
> ---
> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools/lib$ git grep igt_warn|wc -l
> 164
> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools/lib$ cd ..
> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep igt_warn|wc -l
> 324
> ---
> 
> About 50% of all references to igt_warn are in lib, what is the problem with my code?

I'm looking at the code and I have impression this should be part of
the runner, not igt library. Do I understand correctly that your
code will be used by the runner only and not by the tests?

Regarding your above question, I think runner should use as much as
minimal from lib/ directory, because this is collection of functions
designed for tests, not for runner. I think generic code like data
structures (lists) are fine, but not the others. Imagine you'll
incidentally try to use igt_require() - follow the call and see
the pitfall there.

So if my understanding is correct and this code should be part of the
runner only your test might be moved to the runner_tests.c.

BTW please rebase on top of current master, there were changes in
the runner/settings.c file that affects this series.

--
Zbigniew

> 
> 
> > 
> >> +					return false;
> >> +				}
> >> +				continue;
> >> +			} else {
> >> +				/* Log unrecoverable error */
> >> +				igt_warn("igt_write: unrecoverable write error");
> > 
> > Same here.
> We should not remove this one.
> 
> > 
> >> +				return false;
> >> +			}
> >> +		} else if (written == 0) {
> >> +			if (++retries > MAX_WRITE_RETRIES) {
> >> +				igt_warn("igt_write: Exceeded retry limit\n");
> > 
> > Same here.
> We should not remove this one.
> 
> [...]
> 
> >> +	FILE *fp;
> > 
> > Why FILE* and fopen? Could you just use open/read?
> 
> Why not?
> 
> ---
> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep fopen|wc -l
> 97
> ---
> 
> 
> [...]
> 
> >> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file)
> >> +{
> >> +	FILE *fp;
> > 
> > Same here, open/read.
> 
> Same here, why not?
> ---
> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep fopen|wc -l
> 97
> ---
> 
> [...]
> 
> >> +#define KMEMLEAKRESFILENAME "kmemleak.txt"
> > 
> > imho better: IGT_KMEMLEAK_RESFILENAME
> 
> It reads better indeed. Thanks.
> 
> [...]
