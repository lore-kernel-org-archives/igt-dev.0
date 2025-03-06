Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4FEC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 12:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30AB10E1D7;
	Thu,  6 Mar 2025 12:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ll3x/nFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3821210E1BD
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741262541; x=1772798541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6sp9vzVK0rgZh4XWV2UIoC4HRCoX2oWIZE4W4Ugbhhk=;
 b=ll3x/nFYiO/DaawP5/7TI4YPknMaxJc86YkbGlKQmORcHeCR12ipPm09
 r7mXQMc18CvJ4ZalDMA1T+Q0KzXjXLLJa4a+TIq7MnYe/+wQGh40kFX0U
 ZxL17WpE3jFGq9dylmsAkj4IBYRBVd1jN+aw2BWjAbajd71SFvdZJ63sM
 85Szh9fasCiji5z/+/C81vsZ0njoEGt/QfPSr551lHDesq6YBlb5fJMFn
 Q20I09HG4NeOhVRutZvkCesqOSAXo750lvcgj5Rj3bxr796uTvj/SKl1X
 Gq+KwaQWVbisfXiL+jSS2ygIIX6nsiLrYI8rwMjDbW0qvyNDH9ZNC6kHx g==;
X-CSE-ConnectionGUID: 24mf1mCmQNCjfLBXL7y4FQ==
X-CSE-MsgGUID: f/Otug66QN61+pl/AKuJAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45072040"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="45072040"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 04:02:20 -0800
X-CSE-ConnectionGUID: tQt8pbhuRVC1V8Cgl7AAfA==
X-CSE-MsgGUID: KW2sKZULQzqnIUHW4jw5JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="118813852"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 04:02:17 -0800
Date: Thu, 6 Mar 2025 13:02:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, christian.koenig@amd.com,
 alexander.deucher@amd.com, jesse.zhang@amd.com,
 harry.wentland@amd.com, zbigniew.kempczynski@intel.com,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v7 i-g-t 1/3] runner/kmemleak: library to interact with
 kmemleak
Message-ID: <20250306120214.n4fbv4b654ij6jpq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, christian.koenig@amd.com,
 alexander.deucher@amd.com, jesse.zhang@amd.com,
 harry.wentland@amd.com, zbigniew.kempczynski@intel.com,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250227101853.361504-1-peter.senna@linux.intel.com>
 <20250227101853.361504-2-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250227101853.361504-2-peter.senna@linux.intel.com>
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
On 2025-02-27 at 11:18:51 +0100, Peter Senna Tschudin wrote:
> Adds a simple library for interacting with kmemleak and add
> unit testing for the library. There are two modes intended to
> integrate with igt_runner:
> - once: collect kmemleaks after all test completed
> - each: collect kmemleaks after eachb test completes
> 
> To use the library include "kmemleak.h", call runner_kmemleak_init()
> to check if kmemleak is enabled and finally call runner_kmemleak()
> to collect kmemleaks. runner_kmemleak() expect the following
> arguments:
>   - const char *last_test: Name of the last lest or NULL
>   - int resdirfd: file descriptor of the results directory
>   - bool kmemleak_each: Are we scanning once or scanning after
>     each test?
>   - bool sync: sync after each write?

Imho this second paragraph should be removed from description,
it should be enough to describe this in C source.

> 
> Cc: christian.koenig@amd.com
> Cc: alexander.deucher@amd.com
> Cc: jesse.zhang@amd.com
> Cc: harry.wentland@amd.com
> Cc: zbigniew.kempczynski@intel.com
> Cc: kamil.konieczny@linux.intel.com
> Cc: ryszard.knop@intel.com
> Cc: lucas.demarchi@intel.com
> Cc: katarzyna.piecielska@intel.com
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---

This is version 7 of your patch but I do not see here (or above
Cc addresses) any revision history, please write that also here

>  runner/kmemleak.c             | 273 ++++++++++++++++++++++++++++++++++
>  runner/kmemleak.h             |  16 ++
>  runner/meson.build            |  11 +-
>  runner/runner_kmemleak_test.c | 267 +++++++++++++++++++++++++++++++++
>  4 files changed, 566 insertions(+), 1 deletion(-)
>  create mode 100644 runner/kmemleak.c
>  create mode 100644 runner/kmemleak.h
>  create mode 100644 runner/runner_kmemleak_test.c
> 
> diff --git a/runner/kmemleak.c b/runner/kmemleak.c
> new file mode 100644
> index 000000000..496d4bbb4
> --- /dev/null
> +++ b/runner/kmemleak.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <unistd.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <string.h>
> +
> +#include "kmemleak.h"
> +
> +/* We can change the path for unit testing, see runner_kmemleak_init() */
> +static char runner_kmemleak_file[256] = "/sys/kernel/debug/kmemleak";
> +
> +#define MAX_WRITE_RETRIES 5

Add newline here.

> +/**
> + * runner_kmemleak_write - Writes the buffer to the file descriptor retrying when

s/ - /: /
Also description should follow after parameters, so here:

 * runner_kmemleak_write:

> + * possible.
> + * @fd: The file descriptor to write to.
> + * @buf: Pointer to the data to write.
> + * @count: Total number of bytes to write.

 *
 * Writes the buffer to the file descriptor retrying when
 * possible.

> + *
> + * Returns the total number of bytes written on success, or -1 on failure.
> + */
> +static bool runner_kmemleak_write(int fd, const void *buf, size_t count)
> +{
> +	const char *ptr = buf;
> +	size_t remaining = count;
> +	ssize_t written;
> +	int retries = 0;
> +
> +	while (remaining > 0) {
> +		written = write(fd, ptr, remaining);
> +		if (written > 0) {
> +			ptr += written;
> +			remaining -= written;
> +		} else if (written == -1) {
> +			if (errno == EINTR || errno == EAGAIN) {
> +				/* Retry for recoverable errors */
> +				if (++retries > MAX_WRITE_RETRIES) {
> +					fprintf(stderr, "%s: Exceeded retry limit\n", __func__);
> +					return false;
> +				}
> +				continue;
> +			} else {
> +				/* Log unrecoverable error */
> +				fprintf(stderr, "%s: unrecoverable write error\n", __func__);
> +				return false;
> +			}
> +		} else if (written == 0) {
> +			if (++retries > MAX_WRITE_RETRIES) {
> +				fprintf(stderr, "%s: Exceeded retry limit\n", __func__);

If there are write errors I do not think any console
output will be saved... but ok, it could stay here.

> +				return false;
> +			}
> +		}
> +	}
> +	return true;
> +}
> +
> +/**
> + * runner_kmemleak_cmd:
> + * @cmd: command to send to kmemleak
> + *
> + * Send a command to kmemleak.
> + *
> + * Returns: true if sending the command was successful, false otherwise.
> + */
> +static bool runner_kmemleak_cmd(const char *cmd)
> +{
> +	int fp;

s/fp/fd/
Do it also in following lines in this function.

> +	bool res;
> +
> +	fp = open(runner_kmemleak_file, O_RDWR);
> +	if (!fp)

s/!fp/fd == -1/

> +		return false;
> +
> +	res = runner_kmemleak_write(fp, cmd, strlen(cmd));
> +	close(fp);
> +
> +	return res;
> +}
> +
> +/**
> + * runner_kmemleak_clear:
> + *
> + * Trigger an immediate clear on kmemleak.
> + *
> + * Returns: true if sending the command to clear was successful, false
> + * otherwise.
> + */
> +static bool runner_kmemleak_clear(void)
> +{
> +	return runner_kmemleak_cmd("clear");
> +}
> +
> +/**
> + * runner_kmemleak_found_leaks:
> + *
> + * Check if kmemleak found any leaks by trying to read one byte from the
> + * kmemleak file.
> + *
> + * Returns: true if kmemleak found any leaks, false otherwise.
> + */
> +static bool runner_kmemleak_found_leaks(void)
> +{
> +	FILE *fp;

Please use fd here.

> +	char buf[1];
> +	size_t rlen;
> +
> +	fp = fopen(runner_kmemleak_file, "r");

Please use open() here and later read() and close().

> +	if (!fp)
> +		return false;
> +
> +	rlen = fread(buf, 1, 1, fp);
> +
> +	if (rlen == 1)
> +		lseek(fileno(fp), 0, SEEK_SET);
> +
> +	fclose(fp);
> +
> +	return rlen == 1;
> +}
> +
> +/**
> + * runner_kmemleak_scan:
> + *
> + * Trigger an immediate scan on kmemleak.
> + *
> + * Returns: true if leaks are found. False on failure and when no leaks are
> + * found.
> + */
> +static bool runner_kmemleak_scan(void)
> +{
> +	if (!runner_kmemleak_cmd("scan"))
> +		return false;
> +
> +	/* kmemleak documentation states that "the memory scanning is only
> +	 * performed when the /sys/kernel/debug/kmemleak file is read." Read
> +	 * a byte to trigger the scan now.
> +	 */
> +	return runner_kmemleak_found_leaks();
> +}
> +
> +/**
> + * runner_kmemleak_append_to:
> + * @last_test: last test name to append to the file
> + * @resdirfd: file descriptor of the results directory
> + * @kmemleak_each: Are we scanning once or scanning after each test?

Instead of question just write: if true we scan after each tests
More on this bool parameter later.

> + * @sync: sync the kmemleak file often
> + *
> + * Append the kmemleak file to the result file adding a header indicating if
> + * the leaks are for all tests or for a single one.
> + *
> + * Returns: true if appending to the file was successful, false otherwise.
> + */
> +static bool runner_kmemleak_append_to(const char *last_test, int resdirfd,
> +				      bool kmemleak_each, bool sync)
> +{
> +	const char *before = "kmemleaks found before running any test\n\n";
> +	const char *once = "kmemleaks found after running all tests\n";
> +	int kmemleakfd, resfilefd;
> +	char buf[4096];
> +	size_t rlen;
> +
> +	kmemleakfd = open(runner_kmemleak_file, O_RDONLY);
> +	if (kmemleakfd < 0)
> +		return false;
> +
> +	/* Seek back to first byte */
> +	lseek(kmemleakfd, 0, SEEK_SET);

Check for error here.

> +
> +	/* Open text file to append */
> +	resfilefd = openat(resdirfd, KMEMLEAKRESFILENAME,

This is hard to read: KMEMLEAKRESFILENAME
imho this should be: KMEMLEAK_RES_FILENAME or
KMEMLEAK_RESFILENAME

> +			   O_RDWR | O_CREAT | O_APPEND, 0666);
> +	if (!resfilefd) {

s/!resfilefd/resfilefd == -1/

> +		close(kmemleakfd);
> +		return false;
> +	}
> +
> +	/* This is the header added before the content of the kmemleak file */
> +	if (kmemleak_each) {
> +		if (!last_test) {
> +			runner_kmemleak_write(resfilefd, before, strlen(before));
> +		} else {
> +			/* Write \n\n last_test \n to buf */
> +			snprintf(buf, sizeof(buf),
> +				 "\n\nkmemleaks found after running %s:\n",
> +				 last_test);

Check for error or use helper var:
			len = snprintf(buf, sizeof(buf) -1, ...
			buf[len] = 0;

> +
> +			runner_kmemleak_write(resfilefd, buf, strlen(buf));
> +			memset(buf, 0, sizeof(buf));
> +		}
> +	} else {
> +		runner_kmemleak_write(resfilefd, once, strlen(once));
> +	}
> +
> +	if (sync)
> +		fsync(resfilefd);
> +
> +	while ((rlen = read(kmemleakfd, buf, sizeof(buf))) > 0) {
> +		if (!runner_kmemleak_write(resfilefd, buf, rlen)) {

Is this copy file? In that case why not increase buf to 16KB?

> +			close(resfilefd);
> +			close(kmemleakfd);
> +			return false;
> +		}
> +		if (sync)
> +			fsync(resfilefd);

Why sync at every 4KB write? imho this only slows down copying.
It can stay if you think it helps.

> +	}
> +
> +	close(resfilefd);
> +	close(kmemleakfd);
> +
> +	return true;
> +}
> +
> +/**
> + * runner_kmemleak_init:
> + * @unit_test_kmemleak_file: path to kmemleak file for unit testing
> + *
> + * Check if kmemleak is enabled in the kernel, if debugfs is mounted and
> + * if kmemleak file is present and readable.
> + *
> + * Returns: true if kmemleak is enabled, false otherwise.
> + */
> +bool runner_kmemleak_init(const char *unit_test_kmemleak_file)
> +{
> +	FILE *fp;
> +
> +	if (unit_test_kmemleak_file)
> +		snprintf(runner_kmemleak_file,
> +			 sizeof(runner_kmemleak_file),
> +			 "%s",
> +			 unit_test_kmemleak_file);
> +
> +	fp = fopen(runner_kmemleak_file, "r");

Use open() here.
	fd = open(runner_kmemleak_file, O_RDONLY);

> +	if (!fp)

	if (fd == -1)


> +		return false;
> +
> +	fclose(fp);

close(fd);

> +
> +	return true;
> +}
> +
> +/**
> + * runner_kmemleak:
> + * @last_test: last test name to append to the file
> + * @resdirfd: file descriptor of the results directory
> + * @kmemleak_each: Are we scanning once or scanning after each test?
> + * @sync: sync the kmemleak file often
> + *
> + * This is the main function that should be called when integrating runner_kmemleak
> + * into igt_runner or elsewhere. There are two flows:
> + *  - run once: runs only once after all tests are completed
> + *  - run for each test: runs after every test
> + *
> + * Returns: true on success, false otherwise.
> + */
> +bool runner_kmemleak(const char *last_test, int resdirfd, bool kmemleak_each,
> +		     bool sync)
> +{

Using bool here for kmemleak_each imho should be replaces by two functions:

runner_kmemleak_once(const char *last_test, int resdirfd, bool sync)
runner_kmemleak_each(const char *last_test, int resdirfd, bool sync)

Up to you, it could be done after this will get merged.

> +	/* Scan to collect results */
> +	if (runner_kmemleak_scan())
> +		if (!runner_kmemleak_append_to(last_test, resdirfd,
> +					       kmemleak_each, sync))
> +			return false;
> +
> +	if (kmemleak_each)
> +		runner_kmemleak_clear();
> +
> +	return true;
> +}
> diff --git a/runner/kmemleak.h b/runner/kmemleak.h
> new file mode 100644
> index 000000000..694114109
> --- /dev/null
> +++ b/runner/kmemleak.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef runner_kmemleak_H
> +#define runner_kmemleak_H

Why small letters? Follow other header files:

#ifndef RUNNER_KMEMLEAK_H
#define RUNNER_KMEMLEAK_H

> +
> +#include <stdbool.h>
> +
> +bool runner_kmemleak_init(const char *unit_test_kmemleak_file);
> +bool runner_kmemleak(const char *last_test, int resdirfd,
> +		     bool kmemleak_each, bool sync);
> +
> +#define KMEMLEAKRESFILENAME "kmemleak.txt"

This is hard to read: KMEMLEAKRESFILENAME
please change it.

> +
> +#endif /* runner_kmemleak_H */
> diff --git a/runner/meson.build b/runner/meson.build
> index c62303ce3..765cae39f 100644
> --- a/runner/meson.build
> +++ b/runner/meson.build
> @@ -4,6 +4,7 @@ runnerlib_sources = [ 'settings.c',
>  		      'job_list.c',
>  		      'executor.c',
>  		      'resultgen.c',
> +		      'kmemleak.c',

Move after executor.c to keep alphabetical order.

>  		      lib_version,
>  		    ]
>  
> @@ -11,8 +12,9 @@ runner_sources = [ 'runner.c' ]
>  resume_sources = [ 'resume.c' ]
>  results_sources = [ 'results.c' ]
>  decoder_sources = [ 'decoder.c' ]
> -runner_test_sources = [ 'runner_tests.c' ]
> +runner_test_sources = [ 'runner_tests.c']

Unrelated change, remove it.

Rest looks ok.

Regards,
Kamil

>  runner_json_test_sources = [ 'runner_json_tests.c' ]
> +runner_kmemleak_test_sources = [ 'runner_kmemleak_test.c' ]
>  
>  jsonc = dependency('json-c', required: build_runner)
>  runner_deps = [jsonc, glib]
> @@ -74,6 +76,13 @@ if jsonc.found() and build_tests
>  				      dependencies : [igt_deps, jsonc])
>  	test('runner_json', runner_json_test, timeout : 300)
>  
> +	runner_kmemleak_test = executable('runner_kmemleak_test',
> +				 runner_kmemleak_test_sources,
> +				 link_with : runnerlib,
> +				 install : false,
> +				 dependencies : [igt_deps])
> +	test('runner_kmemleak', runner_kmemleak_test, timeout : 300)
> +
>  	build_info += 'Build test runner: true'
>  	if liboping.found()
>  		build_info += 'Build test runner with oping: true'
> diff --git a/runner/runner_kmemleak_test.c b/runner/runner_kmemleak_test.c
> new file mode 100644
> index 000000000..5187e0e61
> --- /dev/null
> +++ b/runner/runner_kmemleak_test.c
> @@ -0,0 +1,267 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <ctype.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <zlib.h>
> +
> +#include "igt.h"
> +#include "kmemleak.h"
> +
> +const char *kmemleak_file_example =
> +"unreferenced object 0xffff888102a2e638 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   00 00 00 00 00 00 00 00 0d 01 a2 00 00 00 00 00  ................\n"
> +"   f0 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc 2df71a7e):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2ed18 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   38 e6 a2 02 81 88 ff ff 0d 11 2d 00 00 00 00 00  8.........-.....\n"
> +"   f2 7c 03 00 00 c9 ff ff 58 ea a2 02 81 88 ff ff  .|......X.......\n"
> +" backtrace (crc ec2a8bdc):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2ea58 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   38 e6 a2 02 81 88 ff ff 0d 01 a0 00 00 00 00 00  8...............\n"
> +"   f6 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc f911c0d1):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e428 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   58 ea a2 02 81 88 ff ff 0d 01 35 00 00 00 00 00  X.........5.....\n"
> +"   fc 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............\n"
> +" backtrace (crc cb8aaffd):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e008 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   28 e4 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  (.........-.....\n"
> +"   fc 7c 03 00 00 c9 ff ff c8 e2 a2 02 81 88 ff ff  .|..............\n"
> +" backtrace (crc 7f883e78):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2b9e5>] acpi_ps_get_next_namepath+0x1f5/0x390\n"
> +"   [<ffffffff81c2cc15>] acpi_ps_parse_loop+0x4a5/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e2c8 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   28 e4 a2 02 81 88 ff ff 0d 01 73 00 00 00 00 00  (.........s.....\n"
> +"   00 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc 338c016):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e378 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   c8 e2 a2 02 81 88 ff ff 0d 01 0d 00 00 00 00 00  ................\n"
> +"   01 7d 03 00 00 c9 ff ff 98 e7 a2 02 81 88 ff ff  .}..............\n"
> +" backtrace (crc 665fb8a7):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e798 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   7c8 e2 a2 02 81 88 ff ff 0d 01 98 00 00 00 00 00  ................\n"
> +"   1b 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc b7a23a1c):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
> +"unreferenced object 0xffff888102a2e0b8 (size 80):\n"
> +" comm \"swapper/0\", pid 1, jiffies 4294672730\n"
> +" hex dump (first 32 bytes):\n"
> +"   98 e7 a2 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  ..........-.....\n"
> +"   1c 7d 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .}..............\n"
> +" backtrace (crc 14d67a9c):\n"
> +"   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80\n"
> +"   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370\n"
> +"   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0\n"
> +"   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400\n"
> +"   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60\n"
> +"   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0\n"
> +"   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380\n"
> +"   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0\n"
> +"   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490\n"
> +"   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70\n"
> +"   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0\n"
> +"   [<ffffffff83867799>] acpi_scan_init+0x119/0x290\n"
> +"   [<ffffffff8386711a>] acpi_init+0x23a/0x590\n"
> +"   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0\n"
> +"   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680\n"
> +"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170\n";
> +
> +static const char *runner_kmemleak_unit_testing_resdir = "/tmp";
> +
> +igt_main
> +{
> +	char unit_testing_kmemleak_filepath[256] = "/tmp/runner_kmemleak_test_XXXXXX";
> +	int written_bytes;
> +	int resdirfd;
> +	int fd;
> +
> +	igt_fixture {
> +		/* resdirfd is used by runner_kmemleak() to store results */
> +		igt_assert(resdirfd = open(runner_kmemleak_unit_testing_resdir,
> +					   O_DIRECTORY | O_RDONLY));
> +
> +		/* Try to delete results file in case of leftovers,
> +		 * ignoring errors as the file may not exist
> +		 */
> +		unlinkat(resdirfd, KMEMLEAKRESFILENAME, 0);
> +
> +		/* Creating a fake kmemleak file for unit testing */
> +		fd = mkstemp(unit_testing_kmemleak_filepath);
> +		igt_assert(fd >= 0);
> +
> +		written_bytes = write(fd, kmemleak_file_example,
> +				      strlen(kmemleak_file_example));
> +		igt_assert_eq(written_bytes, strlen(kmemleak_file_example));
> +
> +		close(fd);
> +
> +		/* Initializing runner_kmemleak with a fake kmemleak file
> +		 * for unit testing
> +		 */
> +		igt_assert(runner_kmemleak_init(unit_testing_kmemleak_filepath));
> +	}
> +
> +	igt_subtest_group {
> +		igt_subtest("test_runner_kmemleak_once")
> +			igt_assert(runner_kmemleak(NULL, resdirfd, false, true));
> +
> +		igt_subtest("test_runner_kmemleak_each") {
> +			igt_assert(runner_kmemleak("test_name_1", resdirfd,
> +						   true, false));
> +			igt_assert(runner_kmemleak("test_name_2", resdirfd,
> +						   true, true));
> +			igt_assert(runner_kmemleak("test_name_3", resdirfd,
> +						   true, false));
> +		}
> +		igt_fixture {
> +			close(resdirfd);
> +		}
> +	}
> +	igt_fixture
> +		unlinkat(resdirfd, KMEMLEAKRESFILENAME, 0);
> +}
> -- 
> 2.34.1
> 
