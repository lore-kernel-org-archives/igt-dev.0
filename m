Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6B1C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 16:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB93F10E90B;
	Thu, 15 May 2025 16:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbA//cHN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D9810E90B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747327217; x=1778863217;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lMtN8hsR4w1T9+Gdo0j8qqQYVFM84P5jM0O1/0nZfhg=;
 b=bbA//cHNJhC/lupm1IF4a20Ae3PXsie66hYyUtQJeCThlEhDvkXjCSK4
 p3am5jm8mBUkMW/ufe1/9LO7Gok5MFnVbDbVnjzctRF98cMj5Mzje5hWW
 phYHtCyUmF0GUO0grBsjM482b/p47XkI+hjOE/n13B+VOFdj+jB/hVCii
 a9FRKejKWreE4UsYLkvmj1t4cJkKVhZ/n6/Q8cilrPCjEyI+xZcVx/+cr
 XtZ8dC66m8CBLzPz5EkzRacA1erN45XqN0l45LHSBbL2qwsROz8eBa5AZ
 a0OI7HpVgtzYV71KWieBoUNRD5An6hN5ftheXu8pVH3QbfMuY7vSYXl7a A==;
X-CSE-ConnectionGUID: 5UmsG0sBRa6sJIG2zcqifA==
X-CSE-MsgGUID: BBvdITLNR2i7qx8XSP3Fjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49206519"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="49206519"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 09:40:15 -0700
X-CSE-ConnectionGUID: 9TPFa9BbS/mC3rDzPaGQEQ==
X-CSE-MsgGUID: UeCPMa7dTd+bR7SKtmGclw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="169497150"
Received: from amiron-mobl1.ger.corp.intel.com (HELO [10.245.81.154])
 ([10.245.81.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 09:40:11 -0700
Message-ID: <21e8b10e-f47e-455f-b6be-306e7eb2eb33@linux.intel.com>
Date: Thu, 15 May 2025 18:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC i-g-t 2/5] lib/igt_dir_explorer: Add function to recursively
 read all files in a directory
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 himanshu.girotra@intel.com, aditya.chauhan@intel.com,
 pravalika.gurram@intel.com, sai.gowtham.ch@intel.com,
 ramadevi.gandi@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
 <20250514175140.115033-3-peter.senna@linux.intel.com>
 <ogha6otctbafhcqe5pokhjszogz6rzm2h7cdpxjssvvpiyf5md@xygjmjrvzcgd>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <ogha6otctbafhcqe5pokhjszogz6rzm2h7cdpxjssvvpiyf5md@xygjmjrvzcgd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 5/15/2025 10:51 AM, Zbigniew Kempczyński wrote:
> On Wed, May 14, 2025 at 07:51:34PM +0200, Peter Senna Tschudin wrote:
>> Introduces igt_dir_explorer_read_and_discard_all(), a function that
>> performs a recursive scan of all files within a directory. Each file is
>> read, and its content is discarded.
>>
>> This functionality is utilized in the following tests:
>> - core_debugfs
>> - core_debugfs_display_on_off
>> - core_sysfs
>>
>> This addition enhances the ability to efficiently handle directory
>> traversal and file processing in tests.
>>
>> Cc: marcin.bernatowicz@intel.com
>> Cc: himanshu.girotra@intel.com
>> Cc: aditya.chauhan@intel.com
>> Cc: pravalika.gurram@intel.com
>> Cc: sai.gowtham.ch@intel.com
>> Cc: ramadevi.gandi@intel.com
>> Cc: lucas.demarchi@intel.com
>> Cc: rodrigo.vivi@intel.com
>> Cc: kamil.konieczny@linux.intel.com
>> Cc: katarzyna.piecielska@intel.com
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>>  lib/igt_dir_explorer.c | 72 ++++++++++++++++++++++++++++++++++++++++++
>>  lib/igt_dir_explorer.h | 10 ++++++
>>  lib/meson.build        |  1 +
>>  3 files changed, 83 insertions(+)
>>  create mode 100644 lib/igt_dir_explorer.c
>>  create mode 100644 lib/igt_dir_explorer.h
>>
>> diff --git a/lib/igt_dir_explorer.c b/lib/igt_dir_explorer.c
>> new file mode 100644
>> index 000000000..d47e08535
>> --- /dev/null
>> +++ b/lib/igt_dir_explorer.c
>> @@ -0,0 +1,72 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <dirent.h>
>> +#include <fcntl.h>
>> +
>> +#include "igt.h"
>> +#include "igt_dir_explorer.h"
>> +
>> +void igt_dir_explorer_read_and_discard_all(int path_fd, int indent)
> 
> Just loose thought - if you're doing recursive directory traversal,
> wouldn't be better to pass function (kind of callback) which would be
> called for each file/dir entry? I mean single traversal code, and
> multiple callbacks for different use cases.
What about?

/* Callback function type for processing files. I guess we should make
 * it blocking. Wait for the function to return before starting the next
 * file.
 */
typedef int (*igt_dir_exp_file_callback)(int filefd);

/* reading order */
typedef enum {
    SCAN_ORDER_SEQUENTIAL,
    SCAN_ORDER_RANDOM
} igt_dir_exp_scan_order_t;

/* Struct to hold the library interface */
typedef struct {
    int dirfd;                          /* File descriptor of the directory to scan */
    igt_dir_exp_file_callback callback; /* Callback function for file operations. If null defaults
                                         * to read and discard */
    const char *include_pattern;        /* Pattern to match files to include (glob or regex) */
    const char *exclude_pattern;        /* Pattern to match files to exclude (glob or regex) */
    uint32_t concurrency;               /* Number of threads, default is 1 */
    size_t max_depth;                   /* Maximum directory depth to scan. -1 no limit */
    size_t max_files;                   /* Maximum number of files to process.  -1 no limit */
    size_t max_bytes;                   /* Maximum bytes to read on each file. -1 no limit */
    scan_order_t reading_order;         /* Reading order (sequential or random) */
} igt_dir_exp_file_scan_config_t;

/* Function prototype for the library function */
int igt_dir_exp_scan_directory(const igt_dir_exp_file_scan_config_t *config);

