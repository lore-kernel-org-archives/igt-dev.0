Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C2CC02193
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 09:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6648210E034;
	Mon,  3 Feb 2025 09:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMQrGzmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2DB10E034
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 09:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738574064; x=1770110064;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=zM0UosEn4YtTCYxwd69p6CjHkvuZXsxr6ePghphrrD8=;
 b=PMQrGzmIe4QAv8aako/9SV+F3wTikS38dQVVcr8J07OvQRoiAOmsO8/N
 T2RfEUkEmnuGuY1jODHHg1tqkkMD/0uSbqsv6YOXBum5Jzo18+4/XyIdY
 zfbgVVRaPabq0Q3ZNbXcHfjQzpVtxTRSuVJezXTtL1OiaitbA009cWcHO
 IBXevZ7O5En/mZ/JO3sG2vV9KhLjsD0xWT7sFr6he7HfNnNImXLRE0hDb
 zx/vTZhbKWfduc/KzBc+rtQSPuh8iBV9wlQB0XOVl+VXUfex93yHBkEEY
 CpDgi6LumMRSMp0jDXS8Jv1nlVGkOJcsPIq06oyH7lFKRzwfvwv/06ogu Q==;
X-CSE-ConnectionGUID: yHesuCeOSYGf50HU0UGThw==
X-CSE-MsgGUID: Lr7ybfqlSXaM+0H57CzKpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38964018"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="38964018"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:14:24 -0800
X-CSE-ConnectionGUID: ttVvbP03RJmzw+sSkZll4w==
X-CSE-MsgGUID: tElHx4y6SvCwsKlhtN3duw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110183294"
Received: from nwochtma-mobl.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:14:22 -0800
Message-ID: <e433618c-2571-48e0-a120-2016246ae367@linux.intel.com>
Date: Mon, 3 Feb 2025 10:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-2-peter.senna@linux.intel.com>
 <20250131123845.ng5b2cbzyqfulm5o@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250131123845.ng5b2cbzyqfulm5o@kamilkon-desk.igk.intel.com>
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

Hi Kamil,

Thank you, please see my comments.

On 31.01.2025 13:38, Kamil Konieczny wrote:
> Hi Peter,
> On 2025-01-28 at 16:15:36 +0100, Peter Senna Tschudin wrote:
> 
> sorry one more nit, found by checkpatch, see below.
> 
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
>>   - bool sync: sync after each write?
>>
>> CC: ryszard.knop@intel.com
>> CC: lucas.demarchi@intel.com
>> CC: katarzyna.piecielska@intel.com
>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>>  lib/igt_kmemleak.c       | 274 +++++++++++++++++++++++++++++++++++++++
>>  lib/igt_kmemleak.h       |  16 +++
>>  lib/meson.build          |   1 +
>>  lib/tests/igt_kmemleak.c | 267 ++++++++++++++++++++++++++++++++++++++
>>  lib/tests/meson.build    |   1 +
>>  5 files changed, 559 insertions(+)
>>  create mode 100644 lib/igt_kmemleak.c
>>  create mode 100644 lib/igt_kmemleak.h
>>  create mode 100644 lib/tests/igt_kmemleak.c
>>
> 
> ...cut...
> 
>> +
>> +static const char *igt_kmemleak_unit_testing_resdir = "/tmp";
>> +
>> +igt_main
>> +{
>> +	char unit_testing_kmemleak_filepath[256] = "/tmp/igt_kmemleak_test_XXXXXX";
>> +	int written_bytes;
>> +	int resdirfd;
>> +	int fd;
>> +
>> +	igt_fixture {
>> +		/* resdirfd is used by igt_kmemleak() to store results */
>> +		igt_assert(resdirfd = open(igt_kmemleak_unit_testing_resdir,
>> +					   O_DIRECTORY | O_RDONLY));
>> +
>> +		/* Try to delete results file in case of leftovers,
>> +		 * ignoring errors as the file may not exist
>> +		 */
>> +		unlinkat(resdirfd, KMEMLEAKRESFILENAME, 0);
>> +
>> +		/* Creating a fake kmemleak file for unit testing */
>> +		fd = mkstemp(unit_testing_kmemleak_filepath);
>> +		igt_assert(fd >= 0);
>> +
>> +		written_bytes = write(fd, kmemleak_file_example,
>> +				strlen(kmemleak_file_example));
> 
> Align here or just write this in one line:
> 		written_bytes = write(fd, kmemleak_file_example, strlen(kmemleak_file_example));
> or
> 		written_bytes = write(fd, kmemleak_file_example,
> 				      strlen(kmemleak_file_example));

Good catch, curious why my checkpatch did not catch this one:

---
psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ ../linux/scripts/checkpatch.pl 0001-lib-igt_kmemleak-library-to-interact-with-kmemleak.patch
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#39:
new file mode 100644

WARNING: quoted string split across lines
#394: FILE: lib/tests/igt_kmemleak.c:37:
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2ed18 (size 80):\n"

WARNING: quoted string split across lines
#416: FILE: lib/tests/igt_kmemleak.c:59:
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2ea58 (size 80):\n"

WARNING: quoted string split across lines
#438: FILE: lib/tests/igt_kmemleak.c:81:
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e428 (size 80):\n"

WARNING: quoted string split across lines
#460: FILE: lib/tests/igt_kmemleak.c:103:
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e008 (size 80):\n"

WARNING: quoted string split across lines
#482: FILE: lib/tests/igt_kmemleak.c:125:
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e2c8 (size 80):\n"

WARNING: quoted string split across lines
#504: FILE: lib/tests/igt_kmemleak.c:147:
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e378 (size 80):\n"

WARNING: quoted string split across lines
#526: FILE: lib/tests/igt_kmemleak.c:169:
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e798 (size 80):\n"

WARNING: quoted string split across lines
#548: FILE: lib/tests/igt_kmemleak.c:191:
+"   [<ffffffff824ca53b>] kernel_init+0x1b/0x170"
+"unreferenced object 0xffff888102a2e0b8 (size 80):\n"

total: 0 errors, 9 warnings, 571 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

0001-lib-igt_kmemleak-library-to-interact-with-kmemleak.patch has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.
---



> 
> Regards,
> Kamil
> 
> ...cut...

