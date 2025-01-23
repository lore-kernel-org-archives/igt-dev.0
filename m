Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF095C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 06:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E57610E3D4;
	Thu, 23 Jan 2025 06:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFyrxYXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BF010E08E
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 06:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737614642; x=1769150642;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iMxM/+x5Pm1TEwfsMkv3zIm77WXd28/PhgP5x5u23io=;
 b=NFyrxYXIzmv2D/NvKXcU0lvk6nnbf5o1ql/3zOdzKVQz4XvPER8Qp8ZB
 X1TZ36anHIGuITO1DH8xw+wa0Zcc2G0HabhKzLHAcN0dEz2oDt6cbxbaK
 4beW+ZbjV2nyfDZgWQsPW1bSvvmLP5JNHUHnItWEB3K5xxD8joTsPjWQ3
 gtfivPRwaygWJDrvVFBshCenHyYoVwLQWy1BwBo2bHBLDb/WGl5oeFi+Y
 W6q8mg9DS31AqZZXsLdR4fNHmIfDww3WgBw/LZpsYgyoCtc1nGEKkEgKl
 y+JOXXqph4DLfRO5BPTMF7BKnlmHvIfkIzsNc/HQxKoaI7hLf3Ib6jgtM A==;
X-CSE-ConnectionGUID: K1UaUhPfQZK+EaTpnv56rg==
X-CSE-MsgGUID: HHRmR+OnT3Gc9gDcJttRDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="60571158"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="60571158"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:44:02 -0800
X-CSE-ConnectionGUID: 8gRahwzfQfui2EyxS/0fdw==
X-CSE-MsgGUID: 5PnkigBOSsqPkywFYATHuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144615169"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:44:01 -0800
Date: Thu, 23 Jan 2025 00:43:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>, 
 igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
Message-ID: <vvmcb5hwgdibtiovxw4sey3uwhk4dp6ixltocncow3qdasilyf@f37q44pja6xb>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
 <173754961509.5500.8834900644999128777@intel.com>
 <e740cbcf-7794-4b2f-866b-49c265f701b1@linux.intel.com>
 <173757039426.5500.1181401747974476563@intel.com>
 <8b23c314-4a4b-4583-8cb1-1efc20ff8ca3@linux.intel.com>
 <173757213461.5500.236986883013364364@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <173757213461.5500.236986883013364364@intel.com>
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

On Wed, Jan 22, 2025 at 03:55:34PM -0300, Gustavo Sousa wrote:
>Quoting Peter Senna Tschudin (2025-01-22 15:35:30-03:00)
>>
>>
>>On 22.01.2025 19:26, Gustavo Sousa wrote:
>>> Quoting Peter Senna Tschudin (2025-01-22 15:16:59-03:00)
>>>>
>>>>
>>>> On 22.01.2025 13:40, Gustavo Sousa wrote:
>>>>> Quoting Lucas De Marchi (2025-01-21 19:57:32-03:00)
>>>>>> Serialize the command line to metadata.txt. The expected format in the
>>>>>> metadata.txt is like below:
>>>>>>
>>>>>>        cmdline.argc : 6
>>>>>>        cmdline.argv[0] : ./build/runner/igt_runner
>>>>>>        cmdline.argv[1] : -o
>>>>>>        cmdline.argv[2] : --test-list
>>>>>>        cmdline.argv[3] : /tmp/testlist.txt
>>>>>>        cmdline.argv[4] : build/tests/
>>>>>>        cmdline.argv[5] : /tmp/results
>>>>>
>>>>> One limitation here is that we would run into problems if one of the
>>>>> arguments contains a newline character. We need to have a proper way of
>>>>> handling that.
>>>>
>>>> I tested this by adding -t '(?m)\b\w*exec\w*\b\n', is that what you mean?
>>>
>>> If you are using bash, I'm afraid '\n' in '(?m)\b\w*exec\w*\b\n' is not
>>> turned into a real newline character. Something like $'foo\nbar'
>>> would.
>>>
>>> Example:
>>>
>>>   $ echo 'foo\nbar'
>>>   foo\nbar
>>>
>>>   $ echo $'foo\nbar'
>>>   foo
>>>   bar
>>
>>No no, I am looking for an example that I can pass to igt_runner.

sudo ./build/runner/igt_runner -e FOO='this is a
very
weird
env
var
with 
newlines' -o --test-list /tmp/testlist.txt build/tests/ /tmp/results

it crashes for me when generating the json with:

Program received signal SIGSEGV, Segmentation fault.
__strlen_avx2 () at ../sysdeps/x86_64/multiarch/strlen-avx2.S:76
warning: 76     ../sysdeps/x86_64/multiarch/strlen-avx2.S: No such file or directory
(gdb) bt
#0  __strlen_avx2 () at ../sysdeps/x86_64/multiarch/strlen-avx2.S:76
#1  0x00007ffff7cfcd95 in json_object_new_string () from /lib/x86_64-linux-gnu/libjson-c.so.5
#2  0x00005555555659a5 in generate_results_json (dirfd=dirfd@entry=3) at ../runner/resultgen.c:2324
#3  0x0000555555567e81 in generate_results (dirfd=3) at ../runner/resultgen.c:2408
#4  0x0000555555567ff3 in generate_results_path (resultspath=<optimized out>) at ../runner/resultgen.c:2447
#5  0x00005555555593d2 in main (argc=<optimized out>, argv=0x7fffffffe3c8) at ../runner/runner.c:48


metadata.txt:
cmdline.argv[2] : FOO=this is a
very
weirld
env
var
with 
newlines
cmdline.argv[3] : -o
cmdline.argv[4] : --test-list
cmdline.argv[5] : /tmp/testlist.txt
cmdline.argv[6] : build/tests/
cmdline.argv[7] : /tmp/results

>
>Perhaps that would be possible for --hook and --env, since the user is
>free to pass anything there, so I would prefer that we are prepared for
>that.
>
>> If there
>>is no way to pass a newline character to igt_runner, then there is no
>>problem. :-) At least not a blocker for this patch, and we can create a
>>Jira for improving special character handling.
>
>If the majority thinks not supporting newlines right now is okay, then
>I won't object. :-)

well... we should at least no crash :)

thanks
Lucas De Marchi

>
>--
>Gustavo Sousa
