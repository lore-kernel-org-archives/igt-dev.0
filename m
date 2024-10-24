Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113A0D0BB5B
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 04:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA1310E0C7;
	Thu, 24 Oct 2024 04:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAkyow8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B195B10E0C7
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 04:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729744992; x=1761280992;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kVTycZ8PiAt6lwF0vSgy5A/6PZ9Hwh4JAWvxLpd8VGs=;
 b=DAkyow8QLkp49xStbXTaOL21ogSViK2+WgBK95Hb5JuOcNTt4zzxunY4
 7gx01tO/Gozq71DwvK9lkI8kOQWDL44Av1tb48uSvqNU9FUCAu0SsxiG3
 2iSM7haGbErAaV4Z6BUPhz9kjCm+BQ40ZY1QzOHrSN9dZEMIBxxjTQ9bq
 xASjvvJYoOnH60ezVT4GkJA/hJLJSSZ9vVUrHHWDCk3zFlrZtaAFQ/AXR
 mOWTeNGyCw+dSIe46zyOyeqFUj5llXvApCK8zUPbp9nvprix3ruUKOZRb
 MqJOb+ih/g3xzv4eSl44rtLoWVfD7xfH3X42Clz1IeTE08C/+kIu3Fx3d w==;
X-CSE-ConnectionGUID: WIuOMWXHR6+Ej5ceDZPnpg==
X-CSE-MsgGUID: sjouLUIDStaSlrQr8v75JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39971216"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="39971216"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 21:43:11 -0700
X-CSE-ConnectionGUID: uQz8cyykQ9mme8R0XszmXQ==
X-CSE-MsgGUID: Mk6PeOorSkW2YMu5F+hyoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="117944459"
Received: from psweeney-mobl1.ger.corp.intel.com (HELO [10.213.203.238])
 ([10.213.203.238])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 21:43:09 -0700
Message-ID: <05775701-216d-47b8-b346-9a6bb91a0686@linux.intel.com>
Date: Thu, 24 Oct 2024 06:43:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 0/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20241022163324.383145-1-zhanjun.dong@intel.com>
 <e51c2ddf-bc6b-4daf-baf7-88b436704195@intel.com>
 <27e21d1c-bdf3-46c3-b813-be0ce3973df9@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <27e21d1c-bdf3-46c3-b813-be0ce3973df9@intel.com>
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

Dear Zhanjun Dong,

I tested bypassing the "Capture_source" field check on another Lunar Lake DUT:

$ sudo ./build/tests/xe_exec_capture
IGT-Version: 1.29-g5b8f06461 (x86_64) (Linux: 6.12.0-rc3-xe x86_64)
Using IGT_SRANDOM=1729744714 for randomisation
Opened device: /dev/dri/card0
Starting subtest: reset
Subtest reset: SUCCESS (34.455s)

Let me know how I can help you further.

Peter



On 23.10.2024 16:13, Dong, Zhanjun wrote:
> Dear Peter,
> 
> Thanks for testing the patch.
> Yes, the failure is due to I add "Capture_source" field check since v3.
> It actually find out a bug in my kmd code. Solution/Jira is working in progress.
> 
> If you want to skip this failure to continue the run, you can comment out this line like:
> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
> index 3a8fa68f2..5fb50fe9a 100644
> --- a/tests/intel/xe_exec_capture.c
> +++ b/tests/intel/xe_exec_capture.c
> @@ -280,7 +280,7 @@ static void check_item_str(regex_t *regex, char **lines, const char *tag, const
> 
>  static void check_capture_out(regex_t *regex, char **lines)
>  {
> -       check_item_str(regex, lines, "Capture_source", "GuC");
> +       //check_item_str(regex, lines, "Capture_source", "GuC");
>         check_item_u64(regex, lines, "ACTHD", BASE_ADDRESS,
>                        BASE_ADDRESS + BATCH_DW_COUNT * sizeof(uint32_t));
>         check_item_u64(regex, lines, "RING_BBADDR", BASE_ADDRESS,
> 
> Regards,
> Zhanjun Dong
> 
> On 2024-10-23 1:18 a.m., Peter Senna Tschudin wrote:
>> Dear Zhanjun Dong,
>>
>> Thank you! I hit a failure while testing you code on a Lunar Lake machine:
>>
>>   (xe_exec_capture:2227) CRITICAL: Expected value:GuC, received:Manual
>>
>> Am I doing anything wrong? Here is the full output:
>>
>> $ sudo ./build/tests/xe_exec_capture
>> IGT-Version: 1.29-g210f35b54 (x86_64) (Linux: 6.12.0-rc2-xe x86_64)
>> Using IGT_SRANDOM=1729660344 for randomisation
>> Opened device: /dev/dri/card0
>> Starting subtest: reset
>> (xe_exec_capture:2227) CRITICAL: Test assertion failure function check_item_str, file ../tests/intel/xe_exec_capture.c:278:
>> (xe_exec_capture:2227) CRITICAL: Failed assertion: !strcmp(output, target)
>> (xe_exec_capture:2227) CRITICAL: Expected value:GuC, received:Manual
>> Stack trace:
>>    #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>    #1 [test_card+0x7dc]
>>    #2 ../tests/intel/xe_exec_capture.c:341 __igt_unique____real_main334()
>>    #3 ../tests/intel/xe_exec_capture.c:334 main()
>>    #4 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
>>    #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>    #6 [_start+0x25]
>> Subtest reset failed.
>> **** DEBUG ****
>> (xe_exec_capture:2227) igt_device_scan-DEBUG: Found 1 GPUs for vendor: intel
>> (xe_exec_capture:2227) DEBUG: Test requirement passed: xe > 0
>> (xe_exec_capture:2227) DEBUG: Running on engine class: 0 instance: 0
>> (xe_exec_capture:2227) DEBUG: Devcoredump found: /sys/class/drm/card0/device/devcoredump/data
>> (xe_exec_capture:2227) DEBUG: Compare Capture_source: Manual vs GuC
>> (xe_exec_capture:2227) CRITICAL: Test assertion failure function check_item_str, file ../tests/intel/xe_exec_capture.c:278:
>> (xe_exec_capture:2227) CRITICAL: Failed assertion: !strcmp(output, target)
>> (xe_exec_capture:2227) CRITICAL: Expected value:GuC, received:Manual
>> (xe_exec_capture:2227) igt_core-INFO: Stack trace:
>> (xe_exec_capture:2227) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>> (xe_exec_capture:2227) igt_core-INFO:   #1 [test_card+0x7dc]
>> (xe_exec_capture:2227) igt_core-INFO:   #2 ../tests/intel/xe_exec_capture.c:341 __igt_unique____real_main334()
>> (xe_exec_capture:2227) igt_core-INFO:   #3 ../tests/intel/xe_exec_capture.c:334 main()
>> (xe_exec_capture:2227) igt_core-INFO:   #4 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
>> (xe_exec_capture:2227) igt_core-INFO:   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>> (xe_exec_capture:2227) igt_core-INFO:   #6 [_start+0x25]
>> ****  END  ****
>> Subtest reset: FAIL (5.963s)
>>
>> Thanks!
>>
>>
>> On 22.10.2024 18:33, Zhanjun Dong wrote:
>>> Test with GuC reset, check if devcoredump register dump is within the
>>> range.
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> Cc: Peter Senna Tschudin <peter.senna@intel.com>
>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>
>>> Changes from prior revs:
>>>   v4:-  Support runs on multiple GPU
>>>         Load all devcoredump content to buffer
>>>         Alloc line buffer dynamic vs static global memory
>>>         Changed to igt_assert_f to provide more info if failed
>>>   v3:-  Remove call to bash and awk
>>>         Add regular express parse
>>>         Detect devcoredump through card index
>>>         Add devcoredump removal check
>>>   v2:-  Fix CI.build error
>>>         Add multiple GPU card support
>>>
>>> Zhanjun Dong (1):
>>>    tests/intel/xe_exec_capture: Add xe_exec_capture test
>>>
>>>   tests/intel/xe_exec_capture.c | 365 ++++++++++++++++++++++++++++++++++
>>>   tests/meson.build             |   1 +
>>>   2 files changed, 366 insertions(+)
>>>   create mode 100644 tests/intel/xe_exec_capture.c
>>>
>>
> 

