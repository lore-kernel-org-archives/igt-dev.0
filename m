Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A13EC02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 13:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CF910E887;
	Wed, 12 Feb 2025 13:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2pRNW7C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B84410E887
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739365970; x=1770901970;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PvK4mfX7eR5DqoS4R83p8wTP83DQjrd6MsXDhlvw46U=;
 b=f2pRNW7C0lre4PzrTijttklHryDMAiU0WkA75dlnDPvm4hJNWoxBq2YT
 OBFX2e+Gpmk31jDvdtVg05kpcjkfKWbCHq/SV6rBtwqZZT5EM6F9JMDQK
 mcJgd4VtRLYkLRzjnxNUPZDk4U5RH5Fv7wi9Lxk1pKbtHPY2BK/z80zXu
 OSthQQMZsfpLzTk82qqf2cr++v2vjHxOTZMVzDgm3HhNls0NSq30agJxg
 1QZ8ghanVzzemqLuNYnMPymoy/FQ9qpQnhrDJkIzllthuZpWXTK84uIge
 zoa8m+SOVxxyEwWeHyzR0nldzMX9tIxfdfrqTWOmufdUghvxwqBH2ElsT Q==;
X-CSE-ConnectionGUID: cmlV12w6RsmXGaSWG/xJYg==
X-CSE-MsgGUID: VXKO4vvzRLyKAPTG3wmZZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40141469"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40141469"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:12:50 -0800
X-CSE-ConnectionGUID: onMYbP/hRLW1cbyRth20sg==
X-CSE-MsgGUID: Q+PeX3tPQkuJ/NNsRIoa2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="117908346"
Received: from fzwolins-mobl.ger.corp.intel.com (HELO [10.246.0.226])
 ([10.246.0.226])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:12:47 -0800
Message-ID: <af2caad1-7daf-4ffb-8e04-fe6b69f9f233@linux.intel.com>
Date: Wed, 12 Feb 2025 14:12:44 +0100
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
 <5f9f0b38-343b-4b1a-b5c7-ad1706fa2ddd@linux.intel.com>
 <20250212083614.w6nmqvkblab3ha4c@zkempczy-mobl2>
 <5bbb923f-e81a-4c54-b1f7-10e6d8561369@linux.intel.com>
 <20250212100157.zgzmorbk7rd3ogd3@zkempczy-mobl2>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250212100157.zgzmorbk7rd3ogd3@zkempczy-mobl2>
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



On 12.02.2025 11:01, Zbigniew Kempczyński wrote:
> On Wed, Feb 12, 2025 at 10:18:17AM +0100, Peter Senna Tschudin wrote:
>>
>>
>> On 12.02.2025 09:36, Zbigniew Kempczyński wrote:
>>> On Tue, Feb 11, 2025 at 08:12:16PM +0100, Peter Senna Tschudin wrote:
>>>> Hi Zbigniew,
>>>>
>>>> Thank you for your comments, please see my answers below.
>>>>
>>>> On 11.02.2025 17:17, Zbigniew Kempczyński wrote:
>>>>> On Mon, Feb 03, 2025 at 10:23:00AM +0100, Peter Senna Tschudin wrote:
>>>>>> Hi Kamil,
>>>>>>
>>>>>> Thank you for your review. Please see below.
>>>>>>
>>>>>> On 31.01.2025 13:34, Kamil Konieczny wrote:
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>> +#include <stdio.h>
>>>>>>>> +#include <string.h>
>>>>>>>> +#include <unistd.h>
>>>>>>>> +#include <fcntl.h>
>>>>>>>> +#include <errno.h>
>>>>>>>
>>>>>>> Sort this alphabetically with exception of unistd.h - this
>>>>>>> header could be first.
>>>>>>
>>>>>> That is picky, but ok.
>>>>>>
>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>> +#include "igt_core.h"
>>>>>>>> +#include "igt_kmemleak.h"
>>>>>>>> +
>>>>>>>> +/* We can change the path for unit testing, see igt_kmemleak_init() */
>>>>>>>> +static char igt_kmemleak_file[256] = "/sys/kernel/debug/kmemleak";
>>>>>>>> +
>>>>>>>> +#define MAX_WRITE_RETRIES 5
>>>>>>>> +/**
>>>>>>>> + * igt_kmemleak_write - Writes the buffer to the file descriptor retrying when
>>>>>>>> + * possible.
>>>>>>>> + * @fd: The file descriptor to write to.
>>>>>>>> + * @buf: Pointer to the data to write.
>>>>>>>> + * @count: Total number of bytes to write.
>>>>>>>> + *
>>>>>>>> + * Returns the total number of bytes written on success, or -1 on failure.
>>>>>>>> + */
>>>>>>>> +static bool igt_kmemleak_write(int fd, const void *buf, size_t count)
>>>>>>>> +{
>>>>>>>> +	const char *ptr = buf;
>>>>>>>> +	size_t remaining = count;
>>>>>>>> +	ssize_t written;
>>>>>>>> +	int retries = 0;
>>>>>>>> +
>>>>>>>> +	while (remaining > 0) {
>>>>>>>> +		written = write(fd, ptr, remaining);
>>>>>>>> +		if (written > 0) {
>>>>>>>> +			ptr += written;
>>>>>>>> +			remaining -= written;
>>>>>>>> +		} else if (written == -1) {
>>>>>>>> +			if (errno == EINTR || errno == EAGAIN) {
>>>>>>>> +				/* Retry for recoverable errors */
>>>>>>>> +				if (++retries > MAX_WRITE_RETRIES) {
>>>>>>>> +					igt_warn("igt_write: Exceeded retry limit\n");
>>>>>>>
>>>>>>> Do not use test prints in lib, especially those used by runner.
>>>>>>
>>>>>> Oh, I will. kmemleak is about writing to disk. If that fails, I will tell the user.
>>>>>> Why does this restriction applies only to me? See:
>>>>>>
>>>>>> ---
>>>>>> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools/lib$ git grep igt_warn|wc -l
>>>>>> 164
>>>>>> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools/lib$ cd ..
>>>>>> psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep igt_warn|wc -l
>>>>>> 324
>>>>>> ---
>>>>>>
>>>>>> About 50% of all references to igt_warn are in lib, what is the problem with my code?
>>>>>
>>>>> I'm looking at the code and I have impression this should be part of
>>>>> the runner, not igt library. Do I understand correctly that your
>>>>> code will be used by the runner only and not by the tests?
>>>>
>>>> It is difficult to know for now. We have one test that will use the lib
>>>> as is: `tests/amdgpu/amd_mem_leak.c`. But that is not the main potential
>>>> use case.
>>>>
>>>> As I describe in the cover letter, transient leaks are kind of tricky,
>>>> and we may require to request a scan from a test itself for better
>>>> coverage. So in short I honestly do not know if we will have test
>>>> integration in the future or not.
>>>
>>> Fundamental question is - where do you want to scan/clear - on the runner
>>> level or on the test? What will happen if you start to clear-scan/clear
>>> both from runner (-k) and from the test itself. I've intentionally
>>> added clear first to limit catched leaks to period where test was
>>> executed.
>>
>> I do not know know. There may be uses for both. Currently I went for the
>> runner for two reasons: it is simple, and produced good results.
>>
>> However for transient leaks the key seems to be timing and then igt_runner
>> does not offer enough granularity. We may need clears and scans at very
>> specific places in the code.
>>
>> My goal is to have CI experiment with kmemleak on igt_runner, collect
>> developer feedback, and then decide if the next step of trying to figure
>> it out how to have a more granular test-level scan makes sense and if is
>> suitable for our use case.
>>
>> Detecting transient leaks is an open problem.
>>
>>>
>>> On the runner level we would collect for all tests, on the test level
>>> I imagine command line argument passed to the test like -k which would
>>> enable the scan on the very beginning. But this would require to rewrite
>>> all tests which are using pure main() instead of igt_main.*().
>>> If really there's leak and someone wants to catch it, he can always
>>> simply wrap around script execution by kmemleak clear-scan/clear.
>>
>> Currently we have -keach and -konce with -keach scanning between each test.
>> As I said, this produces results, but is not effective for transient leaks.
>>
>> Again, I do not know. If the initial evaluation indicates that there may be
>> a benefit on extending the tests to trigger kmemleak scans, I see no reason
>> for not doing it.
>>
>>
>>>
>>> Resume - I would stick to the runner level, I see no judgement to change
>>> igt_core / tests to use this library directly.
>>
>> Resume: I prefer to wait until the initial feedback from CI and developers.
>> I will be happy to move this to runner later if we decide to not walk the
>> unknown road of trying to catch as many transient leaks as we can.
>>
>> That being said, let me know how to move forward.
> 
> Question is to CI folks, for me this scan should be executed as
> dedicated CI run with kmemleak on. And I repeat - I don't see reason
> we should add this support to the tests, as few line script which
> wraps around test by kmemleak clear/scan is enough. We already have
> scripts directory so it is good place for such wrapper.

So I am moving the code to the runner directory, and using printf() instead
of igt_warn(). Any other request for the series?

[...]

