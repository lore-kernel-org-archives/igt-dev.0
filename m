Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7DCC282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 10:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE6510E206;
	Mon, 10 Mar 2025 10:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3DXP5Kh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D717510E206
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 10:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741603061; x=1773139061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mOzZoEnQBNtBbDT+UkfkGix1/caAJm8Zqwk71tJA/yM=;
 b=I3DXP5KhYMjsSgvwyy4M2L3xf4ngxmiN3iK5W/auyR4lY2TvN40XAaeI
 kt0LLKkx5mxW+Efcx9tQEwar3ea+7zqON9UlV88pEiIsa3Xt6pP80Roeu
 Pf/my5wBGDP3sloBGp07d6OwPMjY/Arzy7v+XaSterqYu3/jfIpX1tvq9
 hszGZ28MpGSqH3Nsb602AD6Jh+fZY6PMP7v7OK/oqLgNgk63IcRhQddyW
 HYYMdKK/jdWh7pnK3QwlKHd+xEFKXCHl9jon08iqGtUrlhf0U6iLv4gGz
 +frbCtMbp/LrlfOWa8DtzRqPasZDEe7D/aXR/CFVWkryoX7jQRfzMDgzV Q==;
X-CSE-ConnectionGUID: rXne6kmMQTqhdEMlEZ7d8w==
X-CSE-MsgGUID: Wkze+EacQnW0m+2mRw1i5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53234399"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="53234399"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 03:37:40 -0700
X-CSE-ConnectionGUID: rx3nsJpHTSWkoSSWOCnNTg==
X-CSE-MsgGUID: v7/nEpqiTFKG4baWLvGwqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="150907135"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 03:37:37 -0700
Date: Mon, 10 Mar 2025 11:37:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v8 i-g-t 1/3] runner/kmemleak: library to interact with
 kmemleak
Message-ID: <20250310103727.c76dxrozee6apjdr@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
 <20250307093426.90479-2-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307093426.90479-2-peter.senna@linux.intel.com>
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
On 2025-03-07 at 10:34:24 +0100, Peter Senna Tschudin wrote:
> Adds a simple library for interacting with kmemleak and add
> unit testing for the library. There are two modes intended to
> integrate with igt_runner:
>  - once: collect kmemleaks after all test completed
>  - each: collect kmemleaks after eachb test completes
> 
> Cc: vitaly.prosyak@amd.com
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
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> 
> v8:
>  - Update commit messages
>  - Fix new line and documentation issues
>  - Use fd instead of fp
>  - Use open() and close() instead of fopen() and fclose()
>  - Update error checking from (!fd) to (fd < 0)
>  - Add error check for lseek()
>  - Rename to KMEMLEAK_RESFILENAME
>  - Increase buf size to 16KB to speedup copy
>  - Rename the ifndef guard to RUNNER_KMEMLEAK_H
> 
> v6:
>  - Update copyright year to 2025
>  - Fix indentation issues caused by renaming igt_kmemleak* to runner_kmemleak*
> 
> v5:
>  - move the code from lib/ to runner/
>  - rename igt_* to runner_*
>  - replace calls to igt_info() with calls to fprintf(stderr, ...)
>  - #includes on kmemleak.c:
>    - remove #include "igt_core.h"
>    - sort includes aplhabetically
>  - fix one ident error
> 
> v4:
>  - Cleaned-up CC list
>  - Fixed Reviewed-by tag
>  - Reintroduced ',' after "results-path". It was removed by accident
>  - Changed unit testing for calling igt_kmemleak() with and without sync.
> 
> v3:
>  - Removed '>' from the end of one of the email addresses in the cc list
>  - Removed email addresses that no longer exist
> 
> v2:
>  - Pass igt_kmemleak_sync as a function variable to igt_kmemleak instead of
>    keeping it stored as a global variable
>  - igt_kmemleak_found_leaks(): Remove call to fseek() after close()
>  - igt_kmemleak_write(): Increase retry counter when writing 0 bytes
>  - igt_kmemleak_write(): change type to bool
>  - Unit Testing: Move the call to igt_kmemleak_init() to a fixture.
>  - igt_kmemleak_append_to(): Add brackets to the if statement for improved
>    readability
> 
>  runner/kmemleak.c             | 277 ++++++++++++++++++++++++++++++++++
>  runner/kmemleak.h             |  16 ++
>  runner/meson.build            |   9 ++
>  runner/runner_kmemleak_test.c | 267 ++++++++++++++++++++++++++++++++
>  4 files changed, 569 insertions(+)
>  create mode 100644 runner/kmemleak.c
>  create mode 100644 runner/kmemleak.h
>  create mode 100644 runner/runner_kmemleak_test.c
> 
> diff --git a/runner/kmemleak.c b/runner/kmemleak.c
> new file mode 100644
> index 000000000..c6d2d592b
> --- /dev/null
> +++ b/runner/kmemleak.c
> @@ -0,0 +1,277 @@
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
> +
> +/**
> + * runner_kmemleak_write: Writes the buffer to the file descriptor retrying when
> + * possible.
> + * @fd: The file descriptor to write to.
> + * @buf: Pointer to the data to write.
> + * @count: Total number of bytes to write.
> + *
> + * Writes the buffer to the file descriptor retrying when possible.
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
> +	int fd;
> +	bool res;
> +
> +	fd = open(runner_kmemleak_file, O_RDWR);
> +	if (fd < 0)
> +		return false;
> +
> +	res = runner_kmemleak_write(fd, cmd, strlen(cmd));
> +	close(fd);
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
> +	int fd;
> +	char buf[1];
> +	size_t rlen;
> +
> +	fd = open(runner_kmemleak_file, O_RDONLY);
> +	if (fd < 0)
> +		return false;
> +
> +	rlen = read(fd, buf, 1);
> +
> +	if (rlen == 1)
> +		lseek(fd, 0, SEEK_SET);
> +
> +	close(fd);
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
> + * @kmemleak_each: if true we scan after each test
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
> +	char buf[16384];
> +	size_t rlen;
> +
> +	kmemleakfd = open(runner_kmemleak_file, O_RDONLY);
> +	if (kmemleakfd < 0)
> +		return false;
> +
> +	/* Seek back to first byte */
> +	if (lseek(kmemleakfd, 0, SEEK_SET) == (off_t)-1) {
> +		close(kmemleakfd);
> +		return false;
> +	}
> +
> +	/* Open text file to append */
> +	resfilefd = openat(resdirfd, KMEMLEAK_RESFILENAME,
> +			   O_RDWR | O_CREAT | O_APPEND, 0666);
> +	if (resfilefd < 0) {
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
> +			close(resfilefd);
> +			close(kmemleakfd);
> +			return false;
> +		}
> +		if (sync)
> +			fsync(resfilefd);
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
> +	int fd;
> +
> +	if (unit_test_kmemleak_file)
> +		snprintf(runner_kmemleak_file,
> +			 sizeof(runner_kmemleak_file),
> +			 "%s",
> +			 unit_test_kmemleak_file);
> +
> +	fd = open(runner_kmemleak_file, O_RDONLY);
> +	if (fd < 0)
> +		return false;
> +
> +	close(fd);
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
> index 000000000..65c6f596d
> --- /dev/null
> +++ b/runner/kmemleak.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef RUNNER_KMEMLEAK_H
> +#define RUNNER_KMEMLEAK_H
> +
> +#include <stdbool.h>
> +
> +bool runner_kmemleak_init(const char *unit_test_kmemleak_file);
> +bool runner_kmemleak(const char *last_test, int resdirfd,
> +		     bool kmemleak_each, bool sync);
> +
> +#define KMEMLEAK_RESFILENAME "kmemleak.txt"
> +
> +#endif /* RUNNER_KMEMLEAK_H */
> diff --git a/runner/meson.build b/runner/meson.build
> index c62303ce3..ca27e69c5 100644
> --- a/runner/meson.build
> +++ b/runner/meson.build
> @@ -3,6 +3,7 @@ build_runner = get_option('runner')
>  runnerlib_sources = [ 'settings.c',
>  		      'job_list.c',
>  		      'executor.c',
> +		      'kmemleak.c',
>  		      'resultgen.c',
>  		      lib_version,
>  		    ]
> @@ -13,6 +14,7 @@ results_sources = [ 'results.c' ]
>  decoder_sources = [ 'decoder.c' ]
>  runner_test_sources = [ 'runner_tests.c' ]
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
> index 000000000..ae3ebe113
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
> +		unlinkat(resdirfd, KMEMLEAK_RESFILENAME, 0);
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
> +		unlinkat(resdirfd, KMEMLEAK_RESFILENAME, 0);
> +}
> -- 
> 2.34.1
> 
