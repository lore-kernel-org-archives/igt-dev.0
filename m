Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C48C02193
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 09:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B2910E2BE;
	Mon,  3 Feb 2025 09:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="csLl9a5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1A410E2BE
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738574585; x=1770110585;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=mv5L2QjFOtqemfX6+jPO/wYklEoyQLG5grht61AOD/Y=;
 b=csLl9a5L9bVH8V4OFugygugju+8Ios0pHx4/tM6NK7Hq+MlbQvGyuKmP
 RIAGnzglkUblfEqhf3Sq7stu9rqpn+8e0qd1Gc41TMfdjIok89fWfvcen
 oTwu/bI+kYBFdOjTXnObnkhsjBepk3tlgfektC1KSFWBAyPEzNCb51MP+
 CfAKLAKIHjeemEFAatt0kJ5kIoy8chzVnZClemMt28OfrUbb0r0vIZX23
 b39LOLWW1mijcfjGTnR9jZLhZQ6VT+qb5eC7ebWb495z76pL1MfUuvkjF
 LuRFNEhbbYxA8D5Knh3gEbu6USLvrVaVVwjgisNmh+FOAQKr3F0cAqBVR g==;
X-CSE-ConnectionGUID: awRze0EkSOG+TeWCyfxx9A==
X-CSE-MsgGUID: 2Z6kYJ+1TamGwbutOSU71A==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="42715499"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="42715499"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:23:05 -0800
X-CSE-ConnectionGUID: p2ztwJWQQwOLDXZw5ZOsAw==
X-CSE-MsgGUID: BPrp8PUDRcaMCP4WNOggkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110814676"
Received: from nwochtma-mobl.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:23:02 -0800
Message-ID: <17fe9952-7b2e-46fd-af1f-cd7cbea2cebd@linux.intel.com>
Date: Mon, 3 Feb 2025 10:23:00 +0100
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
 <20250131123454.ilhzogs6a2w7s3on@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250131123454.ilhzogs6a2w7s3on@kamilkon-desk.igk.intel.com>
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

Thank you for your review. Please see below.

On 31.01.2025 13:34, Kamil Konieczny wrote:

[...]

>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +#include <fcntl.h>
>> +#include <errno.h>
> 
> Sort this alphabetically with exception of unistd.h - this
> header could be first.

That is picky, but ok.


> 
>> +
>> +#include "igt_core.h"
>> +#include "igt_kmemleak.h"
>> +
>> +/* We can change the path for unit testing, see igt_kmemleak_init() */
>> +static char igt_kmemleak_file[256] = "/sys/kernel/debug/kmemleak";
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
>> +static bool igt_kmemleak_write(int fd, const void *buf, size_t count)
>> +{
>> +	const char *ptr = buf;
>> +	size_t remaining = count;
>> +	ssize_t written;
>> +	int retries = 0;
>> +
>> +	while (remaining > 0) {
>> +		written = write(fd, ptr, remaining);
>> +		if (written > 0) {
>> +			ptr += written;
>> +			remaining -= written;
>> +		} else if (written == -1) {
>> +			if (errno == EINTR || errno == EAGAIN) {
>> +				/* Retry for recoverable errors */
>> +				if (++retries > MAX_WRITE_RETRIES) {
>> +					igt_warn("igt_write: Exceeded retry limit\n");
> 
> Do not use test prints in lib, especially those used by runner.

Oh, I will. kmemleak is about writing to disk. If that fails, I will tell the user.
Why does this restriction applies only to me? See:

---
psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools/lib$ git grep igt_warn|wc -l
164
psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools/lib$ cd ..
psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep igt_warn|wc -l
324
---

About 50% of all references to igt_warn are in lib, what is the problem with my code?


> 
>> +					return false;
>> +				}
>> +				continue;
>> +			} else {
>> +				/* Log unrecoverable error */
>> +				igt_warn("igt_write: unrecoverable write error");
> 
> Same here.
We should not remove this one.

> 
>> +				return false;
>> +			}
>> +		} else if (written == 0) {
>> +			if (++retries > MAX_WRITE_RETRIES) {
>> +				igt_warn("igt_write: Exceeded retry limit\n");
> 
> Same here.
We should not remove this one.

[...]

>> +	FILE *fp;
> 
> Why FILE* and fopen? Could you just use open/read?

Why not?

---
psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep fopen|wc -l
97
---


[...]

>> +bool igt_kmemleak_init(const char *unit_test_kmemleak_file)
>> +{
>> +	FILE *fp;
> 
> Same here, open/read.

Same here, why not?
---
psennats@friendship7-home:~/UPSTREAM/igt-gpu-tools$ git grep fopen|wc -l
97
---

[...]

>> +#define KMEMLEAKRESFILENAME "kmemleak.txt"
> 
> imho better: IGT_KMEMLEAK_RESFILENAME

It reads better indeed. Thanks.

[...]
