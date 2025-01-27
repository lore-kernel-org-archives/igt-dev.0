Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32036C02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 11:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E122B10E2F0;
	Mon, 27 Jan 2025 11:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5G3tm4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922F310E2F0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737976787; x=1769512787;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zF4BVr+nIurAKsCc4uZGiFLyGqLv1jpDQsYFgFyf3H8=;
 b=k5G3tm4qKy0ZFhj3lqaNP1dg0OGoZsnFnM+frx3bAvVyxUAoz3Vx/hCf
 DySGorggBOkzmFcIL3KX65yZ/qMgnigSGiJEQWAnsJEQ3gB+/V3JXD/rB
 sG7v89gxsifG9Ldc+QDGxb0fj0TR7ft8lRzjEQgsN+ln8Ju+PPrrTXtbF
 ltWic8YkPoF+612ISTJcFzzvugGqkir83oURzqtsxdf8o6EAzH2mWkILm
 A7fdkaBUe3qovAQJrscX3rSzk4OBBaHjHCz5qAQnytd0wH37tqstkBd0E
 rBeZr925qQYnOML2qLhaiOd9eIISnOG4u78ngnGdfI4saEdN2OQwhEGtK w==;
X-CSE-ConnectionGUID: K4xMLIPHS2GDfn4ERepezw==
X-CSE-MsgGUID: V5xJeG8/R6uzjqc5jEozHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="26032417"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="26032417"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 03:19:46 -0800
X-CSE-ConnectionGUID: u3ryuZMgS7mEJd3y58FT3w==
X-CSE-MsgGUID: 4r7NzexbRuK6i22XhHI1rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112435172"
Received: from nwochtma-mobl.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 03:19:42 -0800
Message-ID: <5b250520-3043-4b0c-9555-b613d7f99ffa@linux.intel.com>
Date: Mon, 27 Jan 2025 12:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "stylon.wang@amd.com" <stylon.wang@amd.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "gregory.f.germano@intel.com" <gregory.f.germano@intel.com>,
 "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "Yu, Jianshui" <jianshui.yu@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <20250121112944.115491-2-peter.senna@linux.intel.com>
 <CH0PR11MB54448F91732885E4871ECEF2E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <CH0PR11MB54448F91732885E4871ECEF2E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Jonathan,

I sent v2 that took care of all but one of your comments here. Please see below.

On 22.01.2025 18:09, Cavitt, Jonathan wrote:
> I left some notes below, though there are only two required changes:
> 1. Move fclose in igt_kmemleak_found_leaks to after the conditional lseek to
>     avoid undefined behavior.

Thank you for that. Fixed on v2.

> 2. Pass igt_kmemleak_sync as a function variable to igt_kmemleak instead
>     of keeping it stored as a global variable initialized during igt_kmemelak_init.

Fixed on v2 as well.

> Once those are fixed:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> -----Original Message-----
> From: Peter Senna Tschudin <peter.senna@linux.intel.com> 
> Sent: Tuesday, January 21, 2025 3:30 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>; stylon.wang@amd.com; Rodrigo.Siqueira@amd.com; Gandi, Ramadevi <ramadevi.gandi@intel.com>; Knop, Ryszard <ryszard.knop@intel.com>; Lattannavar, Sameer <sameer.lattannavar@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Saarinen, Jani <jani.saarinen@intel.com>; Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; gregory.f.germano@intel.com; Taylor, Clinton A <clinton.a.taylor@intel.com>; Yu, Jianshui <jianshui.yu@intel.com>; Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Subject: [PATCH i-g-t 1/2] lib/igt_kmemleak: library to interact with kmemleak
>>
>> Adds a simple library for interacting with kmemleak and add
>> unit testing for the library. There are two modes intended to
>> integrate with igt_runner:
>> - once: collect kmemleaks after all test completed
>> - each: collect kmemleaks after eachb test completes
>>
>> To use the library include "igt_kmemleak.h", call
>> igt_kmemleak_init(NULL) to check if kmemleak is enabled and finally
>> call igt_kmemleak() to collect kmemleaks. igt_kmemleak() expect the
>> following arguments:
>>   - const char *last_test: Name of the last lest or NULL
>>   - int resdirfd: file descriptor of the results directory
>>   - bool kmemleak_each: Are we scanning once or scanning after
>>     each test?
>>
>> CC: stylon.wang@amd.com
>> CC: Rodrigo.Siqueira@amd.com>
>> CC: ramadevi.gandi@intel.com
>> CC: ryszard.knop@intel.com
>> CC: sameer.lattannavar@intel.com
>> CC: lucas.demarchi@intel.com
>> CC: jani.saarinen@intel.com
>> CC: katarzyna.piecielska@intel.com
>> CC: matthew.d.roper@intel.com
>> CC: gregory.f.germano@intel.com
>> CC: clinton.a.taylor@intel.com
>> CC: jianshui.yu@intel.com
>> CC: balasubramani.vivekanandan@intel.com
>> CC: jonathan.cavitt@intel.com
>>
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>>  lib/igt_kmemleak.c       | 268 +++++++++++++++++++++++++++++++++++++++
>>  lib/igt_kmemleak.h       |  15 +++
>>  lib/meson.build          |   1 +
>>  lib/tests/igt_kmemleak.c | 259 +++++++++++++++++++++++++++++++++++++
>>  lib/tests/meson.build    |   1 +
>>  5 files changed, 544 insertions(+)
>>  create mode 100644 lib/igt_kmemleak.c
>>  create mode 100644 lib/igt_kmemleak.h
>>  create mode 100644 lib/tests/igt_kmemleak.c
>>
>> diff --git a/lib/igt_kmemleak.c b/lib/igt_kmemleak.c
>> new file mode 100644
>> index 000000000..ff9543b58
>> --- /dev/null
>> +++ b/lib/igt_kmemleak.c
>> @@ -0,0 +1,268 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright (c) 2024 Intel Corporation
>> + */
>> +
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +#include <fcntl.h>
>> +#include <errno.h>
>> +
>> +#include "igt_core.h"
>> +#include "igt_kmemleak.h"
>> +
>> +/* We can change the path for unit testing, see igt_kmemleak_init() */
>> +static char igt_kmemleak_file[256] = "/sys/kernel/debug/kmemleak";
>> +static bool igt_kmemleak_sync;
> 
> This variable (igt_kmemleak_sync) seems to only be used in
> igt_kmemleak_append_to.  Does it need to be a global variable?
> 
> I think we could pass the sync value to igt_kmemleak instead of
> igt_kmemleak_init, and from there we'd pass the value directly to
> igt_kmemleak_append_to.
> 
>> +
>> +#define MAX_WRITE_RETRIES 5
>> +/**
>> + * igt_kmemleak_write - Writes the buffer to the file descriptor retrying when
>> + * possible.
>> + * @fd: The file descriptor to write to.
>> + * @buf: Pointer to the data to write.
>> + * @count: Total number of bytes to write.
>> + *
>> + * Returns the total number of bytes written on success, or -1 on failure.
>> + */
>> +static ssize_t igt_kmemleak_write(int fd, const void *buf, size_t count)
>> +{
>> +	const char *ptr = buf;
>> +	size_t remaining = count;
>> +	ssize_t written;
>> +	int retries = 0;
>> +
>> +	while (remaining > 0) {
>> +		written = write(fd, ptr, remaining);
>> +		if (written > 0) {
> 
> NIT:
> Debatably, this should be "if (written != -1)", though adding and subtracting
> zero from these pointers/values isn't the most helpful operation, so it's okay
> to skip the operation in that case.
> 
> I've also read that some older versions of IEEE standard use a return value of
> 0 as their error value, though perhaps that's a bit out of scope here.
> 
> There's also an argument to be made that a return value of 0 should
> increment the "retries" value.  However, I'll leave that up to your
> discretion.

Doing the retry logic for written == 0 on v2.

> 
>> +			ptr += written;
>> +			remaining -= written;
>> +		} else if (written == -1) {
>> +			if (errno == EINTR || errno == EAGAIN) {
>> +				/* Retry for recoverable errors */
>> +				if (++retries > MAX_WRITE_RETRIES) {
>> +					igt_warn("igt_write: Exceeded retry limit\n");
>> +					return -1;
>> +				}
>> +				continue;
>> +			} else {
>> +				/* Log unrecoverable error */
>> +				igt_warn("igt_write: unrecoverable write error");
>> +				return -1;
>> +			}
>> +		}
>> +	}
>> +	return count;
> 
> NIT:
> This function only has two return values: count and -1.
> Maybe we could return a Boolean here instead?

Converted to bool.

> 
>> +}
>> +
>> +/**
>> + * igt_kmemeak_cmd:
>> + * @cmd: command to send to kmemleak
>> + *
>> + * Send a command to kmemleak.
>> + *
>> + * Returns: true if sending the command was successful, false otherwise.
>> + */
>> +static bool igt_kmemleak_cmd(const char *cmd)
>> +{
>> +	int fp;
>> +	size_t wlen;
>> +	int cmdlen = strlen(cmd);
>> +
>> +	fp = open(igt_kmemleak_file, O_RDWR);
>> +	if (!fp)
>> +		return false;
>> +
>> +	wlen = igt_kmemleak_write(fp, cmd, cmdlen);
>> +	close(fp);
>> +
>> +	return wlen == cmdlen;
>> +}
>> +
>> +/**
>> + * igt_kmemeak_clear:
>> + *
>> + * Trigger an immediate clear on kmemleak.
>> + *
>> + * Returns: true if sending the command to clear was successful, false
>> + * otherwise.
>> + */
>> +static bool igt_kmemleak_clear(void)
>> +{
>> +	return igt_kmemleak_cmd("clear");
>> +}
>> +
>> +/**
>> + * igt_kmemeak_found_leaks:
>> + *
>> + * Check if kmemleak found any leaks by trying to read one byte from the
>> + * kmemleak file.
>> + *
>> + * Returns: true if kmemleak found any leaks, false otherwise.
>> + */
>> +static bool igt_kmemleak_found_leaks(void)
>> +{
>> +	FILE *fp;
>> +	char buf[1];
>> +	size_t rlen;
>> +
>> +	fp = fopen(igt_kmemleak_file, "r");
>> +	if (!fp)
>> +		return false;
>> +
>> +	rlen = fread(buf, 1, 1, fp);
>> +	fclose(fp);
>> +
>> +	if (rlen == 1)
>> +		lseek(fileno(fp), 0, SEEK_SET);
> 
> I don't think we should be calling fileno on a closed file stream, as I'm
> fairly certain the behavior there is undefined.  Please perform the above
> fclose after this 'if' block has been completed:
> """
> 	if (rlen == 1)
> 		lseek(fileno(fp), 0, SEEK_SET);
> 
> 	fclose(fp);
> """

Thank you for that, fixed on v2.

> 
>> +
>> +	return rlen == 1;
>> +}
>> +
>> +/**
>> + * igt_kmemeak_scan:
>> + *
>> + * Trigger an immediate scan on kmemleak.
>> + *
>> + * Returns: true if leaks are found. False on failure and when no leaks are
>> + * found.
>> + */
>> +static bool igt_kmemleak_scan(void)
>> +{
>> +	if (!igt_kmemleak_cmd("scan"))
>> +		return false;
>> +
>> +	/* kmemleak documentation states that "the memory scanning is only
>> +	 * performed when the /sys/kernel/debug/kmemleak file is read." Read
>> +	 * a byte to trigger the scan now.
>> +	 */
>> +	return igt_kmemleak_found_leaks();
>> +}
>> +
>> +/**
>> + * igt_kmemleak_append_to:
>> + * @last_test: last test name to append to the file
>> + * @resdirfd: file descriptor of the results directory
>> + * @kmemleak_each: Are we scanning once or scanning after each test?
>> + *
>> + * Append the kmemleak file to the result file adding a header indicating if
>> + * the leaks are for all tests or for a single one.
>> + *
>> + * Returns: true if appending to the file was successful, false otherwise.
>> + */
>> +static bool igt_kmemleak_append_to(const char *last_test, int resdirfd,
>> +				   bool kmemleak_each)
>> +{
>> +	const char *before = "kmemleaks found before running any test\n\n";
>> +	const char *once = "kmemleaks found after running all tests\n";
>> +	int kmemleakfd, resfilefd;
>> +	char buf[4096];
>> +	size_t rlen;
>> +
>> +	kmemleakfd = open(igt_kmemleak_file, O_RDONLY);
>> +	if (kmemleakfd < 0)
>> +		return false;
>> +
>> +	/* Seek back to first byte */
>> +	lseek(kmemleakfd, 0, SEEK_SET);
>> +
>> +	/* Open text file to append */
>> +	resfilefd = openat(resdirfd, KMEMLEAKRESFILENAME,
>> +			   O_RDWR | O_CREAT | O_APPEND, 0666);
>> +	if (!resfilefd) {
>> +		close(kmemleakfd);
>> +		return false;
>> +	}
>> +
>> +	/* This is the header added before the content of the kmemleak file */
>> +	if (kmemleak_each)
> 
> NIT:
> I think it would be better style to use brackets during this if statement.

Fixed on v2.

> 
>> +		if (!last_test)
>> +			igt_kmemleak_write(resfilefd, before, strlen(before));
>> +		else {
>> +			/* Write \n\n last_test \n to buf */
>> +			snprintf(buf, sizeof(buf),
>> +				 "\n\nkmemleaks found after running %s:\n",
>> +				 last_test);
>> +
>> +			igt_kmemleak_write(resfilefd, buf, strlen(buf));
>> +			memset(buf, 0, sizeof(buf));
>> +		}
>> +	else
>> +		igt_kmemleak_write(resfilefd, once, strlen(once));
>> +
>> +	if (igt_kmemleak_sync)
>> +		fsync(resfilefd);
>> +
>> +	while ((rlen = read(kmemleakfd, buf, sizeof(buf))) > 0) {
>> +		if (igt_kmemleak_write(resfilefd, buf, rlen) != rlen) {
>> +			close(resfilefd);
>> +			close(kmemleakfd);
>> +			return false;
>> +		}
>> +		if (igt_kmemleak_sync)
>> +			fsync(resfilefd);
>> +	}
>> +
>> +	close(resfilefd);
>> +	close(kmemleakfd);
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * igt_kmemeak_init:
>> + * @unit_test_kmemleak_file: path to kmemleak file for unit testing
>> + * @sync: sync the kmemleak file often
>> + *
>> + * Check if kmemleak is enabled in the kernel, if debugfs is mounted and
>> + * if kmemleak file is present and readable. Also sets the igt_kmemleak_sync.
>> + *
>> + * Returns: true if kmemleak is enabled, false otherwise.
>> + */
>> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file, bool sync)
>> +{
>> +	FILE *fp;
>> +
>> +	igt_kmemleak_sync = sync;
>> +
>> +	if (unit_test_kmemleak_file)
>> +		snprintf(igt_kmemleak_file,
>> +			 sizeof(igt_kmemleak_file),
>> +			 "%s",
>> +			 unit_test_kmemleak_file);
>> +
>> +	fp = fopen(igt_kmemleak_file, "r");
>> +	if (!fp)
>> +		return false;
>> +
>> +	fclose(fp);
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * igt_kmemleak:
>> + * @last_test: last test name to append to the file
>> + * @resdirfd: file descriptor of the results directory
>> + * @kmemleak_each: Are we scanning once or scanning after each test?
>> + *
>> + * This is the main function that should be called when integrating igt_kmemleak
>> + * into igt_runner or elsewhere. There are two flows:
>> + *  - run once: runs only once after all tests are completed
>> + *  - run for each test: runs after every test
>> + *
>> + * Returns: true on success, false otherwise.
>> + */
>> +bool igt_kmemleak(const char *last_test, int resdirfd, bool kmemleak_each)
> 
> NIT:
> Ideally, we'd want to get rid of the global igt_kmemleak_sync variable and add
> it as an option here.  This is partially what that would look like:
> 
> """
> static bool igt_kmemleak_append_to(const char *last_test, int resdirfd,
> 				   bool kmemleak_each, bool igt_kmemleak_sync)
> ...
> bool igt_kmemleak(const char *last_test, int resdirfd,
> 		bool kmemleak_each, bool sync)
> {
> 	/* Scan to collect results */
> 	if (igt_kmemleak_scan())
> 		if (!igt_kmemleak_append_to(last_test, resdirfd,
> 					kmemleak_each, sync))
> 			return false;
> 
> 	if (kmemleak_each)
> 		igt_kmemleak_clear();
> 
> 	return true;
> }
> """
> 
> However, that could cause some clutter here in the
> arguments list.  We might want to consider unifying kmemleak_each and
> igt_kmemleak_sync under a series of flags.  Say:
> 
> """
> #define KMEMLEAK_EACH	(1 << 0)
> #define KMEMLEAK_SYNC	(1 << 1)
> ...
> static bool igt_kmemleak_append_to(const char *last_test, int resdirfd, int flags)
> {
> ...
> 	/* This is the header added before the content of the kmemleak file */
> 	if (flags & KMEMLEAK_EACH) {
> 		if (!last_test)
> ...
> 	}
> 
> 	if (flags & KMEMLEAK_SYNC)
> 		fsync(resfilefd);
> ...
> 			return false;
> 		}
> 		if (flags & KMEMLEAK_SYNC)
> 			fsync(resfilefd);
> ...
> bool igt_kmemleak(const char *last_test, int resdirfd, int flags)
> {
> 	/* Scan to collect results */
> 	if (igt_kmemleak_scan())
> 		if (!igt_kmemleak_append_to(last_test, resdir, flags))
> 			return false;
> 
> 	if (flags & KMEMLEAK_EACH)
> 		igt_kmemleak_clear();
> 
> 	return true;
> }
> """
> 
> Though honestly, I think just adding an extra argument wouldn't be
> too bad.

I have opted for adding a new parameter for sync and got rid of the
global variable. I was temped for using flag, but lets wait for a 
third value before we go there.

> 
>> +{
>> +	/* Scan to collect results */
>> +	if (igt_kmemleak_scan())
> 
> NIT:
> Should this function also fail if igt_kmemleak_scan fails?  AFAICT,
> igt_kmemleak_scan fails in one of two cases:
> 
> 1. Error when sending command.  This should probably result in a failure
> because an error has occurred.
> 2. No leaks found.  Assuming we're expecting to find leaks, this should
> probably also constitute a failure.
> 
> Though in the case where only one of the two above causes issues, maybe
> we should add return values to igt_kmemleak_scan?  Perhaps 0 on success,
> -EBUSY for a write failure, and -EIO if no leaks are found?  I'm just choosing
> some arbitrary error values here; these aren't set in stone.

This is the one I did not act upon. First we do not want igt_runner to crash or
abort if something goes wrong with kmemleak. So we don't really need the extra
details about the error. Currently if the call to igt_kmemleak_init() fails, it
will disable kmemleaks on the runner. My take was that errors detected on
igt_kmemleak() would either mean that the system is in a really bad shape or
that something unimportant happend. Either way nothing to worry about.

Second, we actually expect that no mem leaks will be found on the vast majority
of calls. It took me hundreds of attempts to learn how to trigger one reliably,
and with xe tests it happens but not that often.

So I left this as is for now. Please let me know if any of this is nonsensical.

> 
>> +		if (!igt_kmemleak_append_to(last_test, resdirfd, kmemleak_each))
>> +			return false;
>> +
>> +	if (kmemleak_each)
>> +		igt_kmemleak_clear();
>> +
>> +	return true;
>> +}
>> diff --git a/lib/igt_kmemleak.h b/lib/igt_kmemleak.h
>> new file mode 100644
>> index 000000000..a3c142827
>> --- /dev/null
>> +++ b/lib/igt_kmemleak.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT
>> + * Copyright (c) 2024 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_KMEMLEAK_H
>> +#define IGT_KMEMLEAK_H
>> +
>> +#include <stdbool.h>
>> +
>> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file, bool sync);
>> +bool igt_kmemleak(const char *last_test, int resdirfd, bool kmemleak_each);
>> +
>> +#define KMEMLEAKRESFILENAME "kmemleak.txt"
>> +
>> +#endif /* IGT_KMEMLEAK_H */
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 9fffdd3c6..7959dcacb 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -97,6 +97,7 @@ lib_sources = [
>>  	'igt_dummyload.c',
>>  	'igt_store.c',
>>  	'uwildmat/uwildmat.c',
>> +	'igt_kmemleak.c',
>>  	'igt_kmod.c',
>>  	'igt_ktap.c',
>>  	'igt_panfrost.c',
>> diff --git a/lib/tests/igt_kmemleak.c b/lib/tests/igt_kmemleak.c
>> new file mode 100644
>> index 000000000..717ba2852
>> --- /dev/null
>> +++ b/lib/tests/igt_kmemleak.c
>> @@ -0,0 +1,259 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright (c) 2024 Intel Corporation
>> + */
>> +
>> +#include <ctype.h>
>> +#include <fcntl.h>
>> +#include <stdio.h>
>> +#include <zlib.h>
>> +
>> +#include "igt.h"
>> +#include "igt_kmemleak.h"
>> +
>> +const char *kmemleak_file_example =
>> +"unreferenced object 0xffff888102a2e638 (size 80):\n"
>> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
>> +" hex dump (first 32 bytes):\n"
>> +"   00 00 00 00 00 00 00 00 0d 01 a2 00 00 00 00 00  ................\n"
>> +"   f0 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
>> +" backtrace (crc 2df71a7e):\n"
>> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
>> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
>> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
>> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
>> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
>> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
>> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
>> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
>> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
>> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
>> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
>> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
>> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
>> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
>> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
>> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
>> +"unreferenced object 0xffff888102a2ed18 (size 80):\n"
>> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
>> +" hex dump (first 32 bytes):\n"
>> +"   38 e6 a2 02 81 88 ff ff 0d 11 2d 00 00 00 00 00  8.........-.....\n"
>> +"   f2 7c 03 00 00 c9 ff ff 58 ea a2 02 81 88 ff ff  .|......X.......\n"
>> +" backtrace (crc ec2a8bdc):\n"
>> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
>> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
>> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
>> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
>> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
>> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
>> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
>> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
>> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
>> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
>> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
>> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
>> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
>> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
>> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
>> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
>> +"unreferenced object 0xffff888102a2ea58 (size 80):\n"
>> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
>> +" hex dump (first 32 bytes):\n"
>> +"   38 e6 a2 02 81 88 ff ff 0d 01 a0 00 00 00 00 00  8...............\n"
>> +"   f6 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
>> +" backtrace (crc f911c0d1):\n"
>> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
>> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
>> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
>> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
>> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
>> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
>> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
>> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
>> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
>> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
>> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
>> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
>> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
>> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
>> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
>> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
>> +"unreferenced object 0xffff888102a2e428 (size 80):\n"
>> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
>> +" hex dump (first 32 bytes):\n"
>> +"   58 ea a2 02 81 88 ff ff 0d 01 35 00 00 00 00 00  X.........5.....\n"
>> +"   fc 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
>> +" backtrace (crc cb8aaffd):\n"
>> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
>> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
>> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
>> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
>> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
>> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
>> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
>> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
>> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
>> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
>> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
>> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
>> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
>> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
>> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
>> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
>> +"unreferenced object 0xffff888102a2e008 (size 80):\n"
>> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
>> +" hex dump (first 32 bytes):\n"
>> +"   28 e4 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  (.........-.....\n"
>> +"   fc 7c 03 00 00 c9 ff ff c8 e2 a2 02 81 88 ff ff  .|..............\n"
>> +" backtrace (crc 7f883e78):\n"
>> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
>> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
>> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
>> +"   [<ffffffff81c2b9e5>] acpi_ps_get_next_namepath+0x1f5/0x390\n"
>> +"   [<ffffffff81c2cc15>] acpi_ps_parse_loop+0x4a5/0xa60\n"
>> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
>> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
>> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
>> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
>> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
>> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
>> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
>> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
>> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
>> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
>> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
>> +"unreferenced object 0xffff888102a2e2c8 (size 80):\n"
>> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
>> +" hex dump (first 32 bytes):\n"
>> +"   28 e4 a2 02 81 88 ff ff 0d 01 73 00 00 00 00 00  (.........s.....\n"
>> +"   00 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
>> +" backtrace (crc 338c016):\n"
>> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
>> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
>> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
>> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
>> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
>> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
>> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
>> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
>> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
>> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
>> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
>> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
>> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
>> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
>> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
>> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
>> +"unreferenced object 0xffff888102a2e378 (size 80):\n"
>> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
>> +" hex dump (first 32 bytes):\n"
>> +"   c8 e2 a2 02 81 88 ff ff 0d 01 0d 00 00 00 00 00  ................\n"
>> +"   01 7d 03 00 00 c9 ff ff 98 e7 a2 02 81 88 ff ff  .}..............\n"
>> +" backtrace (crc 665fb8a7):\n"
>> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
>> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
>> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
>> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
>> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
>> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
>> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
>> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
>> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
>> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
>> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
>> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
>> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
>> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
>> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
>> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
>> +"unreferenced object 0xffff888102a2e798 (size 80):\n"
>> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
>> +" hex dump (first 32 bytes):\n"
>> +"   7c8 e2 a2 02 81 88 ff ff 0d 01 98 00 00 00 00 00  ................\n"
>> +"   1b 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
>> +" backtrace (crc b7a23a1c):\n"
>> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
>> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
>> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
>> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
>> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
>> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
>> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
>> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
>> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
>> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
>> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
>> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
>> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
>> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
>> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
>> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
>> +"unreferenced object 0xffff888102a2e0b8 (size 80):\n"
>> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
>> +" hex dump (first 32 bytes):\n"
>> +"   98 e7 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  ..........-.....\n"
>> +"   1c 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
>> +" backtrace (crc 14d67a9c):\n"
>> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
>> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
>> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
>> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
>> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
>> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
>> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
>> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
>> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
>> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
>> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
>> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
>> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
>> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
>> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
>> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170\n";
>> +
>> +static const char *igt_kmemleak_unit_testing_resdir = "/tmp";
>> +
>> +igt_main
>> +{
>> +	int resdirfd = 0;
>> +
>> +	igt_subtest_group {
>> +		igt_subtest("test_igt_kmemleak_init") {
>> +			char unit_testing_kmemleak_filepath[256] = "/tmp/igt_kmemleak_test_XXXXXX";
>> +			int written_bytes;
>> +			bool res;
>> +			int fd;
>> +
>> +			fd = mkstemp(unit_testing_kmemleak_filepath);
>> +			igt_assert(fd >= 0);
>> +
>> +			written_bytes = write(fd, kmemleak_file_example,
>> +					strlen(kmemleak_file_example));
>> +			igt_assert_eq(written_bytes, strlen(kmemleak_file_example));
>> +
>> +			close(fd);
>> +
>> +			res = igt_kmemleak_init(unit_testing_kmemleak_filepath, true);
>> +			igt_assert(res);
> 
> NIT:
> We can probably just do a direct assessment of the return value from
> igt_kmemleak_init instead of storing the result in an intermediary:
> """
> 			igt_assert(igt_kmemleak_init(unit_testing_kmemleak_filepath, true));
> """

Did that on v2.

> 
>> +		}
>> +		igt_fixture
>> +			igt_assert(resdirfd = open(igt_kmemleak_unit_testing_resdir,
>> +						   O_DIRECTORY | O_RDONLY));
>> +
>> +		igt_subtest("test_igt_kmemleak_once")
>> +			igt_assert(igt_kmemleak(NULL, resdirfd, false));
>> +
>> +		igt_fixture {
>> +			/* Delete the result file */
>> +			unlinkat(resdirfd, KMEMLEAKRESFILENAME, 0);
>> +		}
>> +		igt_subtest("test_igt_kmemleak_each") {
>> +			igt_assert(igt_kmemleak("test_name_1", resdirfd, true));
>> +			igt_assert(igt_kmemleak("test_name_2", resdirfd, true));
>> +			igt_assert(igt_kmemleak("test_name_3", resdirfd, true));
> 
> I'm suspecting the test_igt_kmemleak_once and test_igt_kmemleak_each
> subtests are relying on igt_kmemleak_init having run prior, if only because
> we set igt_kmemleak_sync during initialization.  So we either need to run
> igt_kmemleak_init as a part of the fixture, or start passing the sync
> parameter to igt_kmemleak instead.

The call to _init is in a fixture on v2.

Thank you Jonathan!

> -Jonathan Cavitt
> 
>> +		}
>> +		igt_fixture {
>> +			close(resdirfd);
>> +		}
>> +	}
>> +}
>> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
>> index 1ce19f63c..5c42408d5 100644
>> --- a/lib/tests/meson.build
>> +++ b/lib/tests/meson.build
>> @@ -16,6 +16,7 @@ lib_tests = [
>>          'igt_ktap_parser',
>>  	'igt_list_only',
>>  	'igt_invalid_subtest_name',
>> +	'igt_kmemleak',
>>  	'igt_nesting',
>>  	'igt_no_exit',
>>  	'igt_runnercomms_packets',
>> -- 
>> 2.34.1
>>
>>

