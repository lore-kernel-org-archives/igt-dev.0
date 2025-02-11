Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E68C0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 19:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275EF10E213;
	Tue, 11 Feb 2025 19:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWV5y+On";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128B910E213
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739301142; x=1770837142;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=s+f0TxdanvVHV2aDM6Mt6gelhk295iIP8ZoyUMSW25c=;
 b=EWV5y+OnA4Gs1WuzG3lbB4nDBTCsxeCaYQyTVcQguEURDajRZXTuHEm8
 sPIBP9pfj3At1COjMvpHkGGHPmdokJBm32MPQleEX76NrvGShkA2FYdVN
 FhyhQGkbiigK+dfNyGXWAh6ea+pZLuZBBYh9aiUK2LtDBtTj30796qu7P
 MdO+ljlQ8V0+zjImFWCBYvWX5ZAmA7QMqk3YZL93YC9712+hS8Rmfmt4z
 J2bKNFS2OiwmkmzVmACHnoJN1VZGCc2EwUtcimp63bpZSf4U8FUYsqqiQ
 BxN3nX8r8KWODwzrGhfze3SaZ3XUfqdur35xRrFI/UV8WidG0mnBuTCU8 w==;
X-CSE-ConnectionGUID: GlNGBa7uSUSPKfKrz+TsAQ==
X-CSE-MsgGUID: sEAe3QAjShmfqAEdjTZLCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57347986"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="57347986"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 11:12:22 -0800
X-CSE-ConnectionGUID: ZvAD385QQJWb0pBOx0OENg==
X-CSE-MsgGUID: kw+P8jqsRzemI2gSBUTKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="112562600"
Received: from pnass-mobl.ger.corp.intel.com (HELO [10.245.112.60])
 ([10.245.112.60])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 11:12:19 -0800
Message-ID: <5f9f0b38-343b-4b1a-b5c7-ad1706fa2ddd@linux.intel.com>
Date: Tue, 11 Feb 2025 20:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-2-peter.senna@linux.intel.com>
 <20250131123454.ilhzogs6a2w7s3on@kamilkon-desk.igk.intel.com>
 <17fe9952-7b2e-46fd-af1f-cd7cbea2cebd@linux.intel.com>
 <20250211161734.nm6dsq3ahhcn7hvz@zkempczy-mobl2>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250211161734.nm6dsq3ahhcn7hvz@zkempczy-mobl2>
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

Hi Zbigniew,

Thank you for your comments, please see my answers below.

On 11.02.2025 17:17, Zbigniew Kempczyński wrote:
> On Mon, Feb 03, 2025 at 10:23:00AM +0100, Peter Senna Tschudin wrote:
>> Hi Kamil,
>>
>> Thank you for your review. Please see below.
>>
>> On 31.01.2025 13:34, Kamil Konieczny wrote:
>>
>> [...]
>>
>>>> +#include <stdio.h>
>>>> +#include <string.h>
>>>> +#include <unistd.h>
>>>> +#include <fcntl.h>
>>>> +#include <errno.h>
>>>
>>> Sort this alphabetically with exception of unistd.h - this
>>> header could be first.
>>
>> That is picky, but ok.
>>
>>
>>>
>>>> +
>>>> +#include "igt_core.h"
>>>> +#include "igt_kmemleak.h"
>>>> +
>>>> +/* We can change the path for unit testing, see igt_kmemleak_init() */
>>>> +static char igt_kmemleak_file[256] = "/sys/kernel/debug/kmemleak";
>>>> +
>>>> +#define MAX_WRITE_RETRIES 5
>>>> +/**
>>>> + * igt_kmemleak_write - Writes the buffer to the file descriptor retrying when
>>>> + * possible.
>>>> + * @fd: The file descriptor to write to.
>>>> + * @buf: Pointer to the data to write.
>>>> + * @count: Total number of bytes to write.
>>>> + *
>>>> + * Returns the total number of bytes written on success, or -1 on failure.
>>>> + */
>>>> +static bool igt_kmemleak_write(int fd, const void *buf, size_t count)
>>>> +{
>>>> +	const char *ptr = buf;
>>>> +	size_t remaining = count;
>>>> +	ssize_t written;
>>>> +	int retries = 0;
>>>> +
>>>> +	while (remaining > 0) {
>>>> +		written = write(fd, ptr, remaining);
>>>> +		if (written > 0) {
>>>> +			ptr += written;
>>>> +			remaining -= written;
>>>> +		} else if (written == -1) {
>>>> +			if (errno == EINTR || errno == EAGAIN) {
>>>> +				/* Retry for recoverable errors */
>>>> +				if (++retries > MAX_WRITE_RETRIES) {
>>>> +					igt_warn("igt_write: Exceeded retry limit\n");
>>>
>>> Do not use test prints in lib, especially those used by runner.
>>
>> Oh, I will. kmemleak is about writing to disk. If that fails, I will tell the user.
>> Why does this restriction applies only to me? See:
>>
>> ---
>> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools/lib$ git grep igt_warn|wc -l
>> 164
>> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools/lib$ cd ..
>> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep igt_warn|wc -l
>> 324
>> ---
>>
>> About 50% of all references to igt_warn are in lib, what is the problem with my code?
> 
> I'm looking at the code and I have impression this should be part of
> the runner, not igt library. Do I understand correctly that your
> code will be used by the runner only and not by the tests?

It is difficult to know for now. We have one test that will use the lib
as is: `tests/amdgpu/amd_mem_leak.c`. But that is not the main potential
use case.

As I describe in the cover letter, transient leaks are kind of tricky,
and we may require to request a scan from a test itself for better
coverage. So in short I honestly do not know if we will have test
integration in the future or not.

> 
> Regarding your above question, I think runner should use as much as
> minimal from lib/ directory, because this is collection of functions
> designed for tests, not for runner. I think generic code like data
> structures (lists) are fine, but not the others. Imagine you'll
> incidentally try to use igt_require() - follow the call and see
> the pitfall there.

Currently the list of lib includes in the runner directory is not
small (I used a dumb regex that looks for includes starting with igt_):

#include "igt_aux.h"
#include "igt_core.h"
#include "igt_facts.h"
#include "igt_hook.h"
#include "igt_list.h"
#include "igt_taints.h"
#include "igt_vec.h"


> 
> So if my understanding is correct and this code should be part of the
> runner only your test might be moved to the runner_tests.c.

It is difficult to know at this stage. At least the amd test I mentioned
earlier will use it.

> 
> BTW please rebase on top of current master, there were changes in
> the runner/settings.c file that affects this series.

As soon as I am confident this will be merged, I surely will.

Thanks!

> 
> --
> Zbigniew
> 
>>
>>
>>>
>>>> +					return false;
>>>> +				}
>>>> +				continue;
>>>> +			} else {
>>>> +				/* Log unrecoverable error */
>>>> +				igt_warn("igt_write: unrecoverable write error");
>>>
>>> Same here.
>> We should not remove this one.
>>
>>>
>>>> +				return false;
>>>> +			}
>>>> +		} else if (written == 0) {
>>>> +			if (++retries > MAX_WRITE_RETRIES) {
>>>> +				igt_warn("igt_write: Exceeded retry limit\n");
>>>
>>> Same here.
>> We should not remove this one.
>>
>> [...]
>>
>>>> +	FILE *fp;
>>>
>>> Why FILE* and fopen? Could you just use open/read?
>>
>> Why not?
>>
>> ---
>> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep fopen|wc -l
>> 97
>> ---
>>
>>
>> [...]
>>
>>>> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file)
>>>> +{
>>>> +	FILE *fp;
>>>
>>> Same here, open/read.
>>
>> Same here, why not?
>> ---
>> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep fopen|wc -l
>> 97
>> ---
>>
>> [...]
>>
>>>> +#define KMEMLEAKRESFILENAME "kmemleak.txt"
>>>
>>> imho better: IGT_KMEMLEAK_RESFILENAME
>>
>> It reads better indeed. Thanks.
>>
>> [...]

