Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0945CCF9F0
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 20:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C5D10EA12;
	Thu, 30 Oct 2025 20:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3+tmyze";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5F410EA12
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 20:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761854531; x=1793390531;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=bqlENRJy5oeJU7swrWyCVkbcZSn+Mr7mRSsyTVIDyYs=;
 b=K3+tmyzej1wQMSjFJaYbt+U+XmdR5EH/Lu1ztu1jmyPT/tBN9JpZ0VVc
 gDIRyWvwLWRkiXWh055lv/3uV1M9gT+/+F95nTXJK/7EI2Rs/iQ1qwDj2
 MfQ8nFZ8mqnGf9pBRjw9zFd9+pzdQK5uF0s4TaGBuxmWOFalvFwbyCoCW
 BmfHNJc6Mqt9m9Vt4MmvDKI9Sunf4mPc8NzW6uy8UfAAUBqoaJpc5AWAp
 MSISi2V1JQP9YZTnVJ4/SobWPECtg2XgaPMeRM+7oKxlVzuUWfPnJFld5
 ZVG4h8/vau4AAyhJECd1X9JagkZGqLJQZyt5yqLsNKaIHXe/PDq+pmhJQ w==;
X-CSE-ConnectionGUID: q9hbz1QiSkyL3CaV3tOvEg==
X-CSE-MsgGUID: /9fcuFjzTy6Ism0Ejvi7kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63920122"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63920122"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:02:11 -0700
X-CSE-ConnectionGUID: GGpUlZvMSSy2SJ8xkCRhAg==
X-CSE-MsgGUID: T4PHIAg3Ri+3PrGBQsNItQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="190391661"
Received: from unknown (HELO [10.241.240.140]) ([10.241.240.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:02:11 -0700
Message-ID: <5a23aefb-a9a5-4143-839a-18cbb95d9098@linux.intel.com>
Date: Thu, 30 Oct 2025 13:02:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_atomic_transition: Fix dynamic subtest
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, igt-dev@lists.freedesktop.org
References: <20251030191558.206251-1-ngai-mint.kwan@linux.intel.com>
 <176185283180.3303.10612741209970133886@intel.com>
 <d33f4816-d441-4fc5-a1dc-8f636b8858e9@linux.intel.com>
Content-Language: en-US
In-Reply-To: <d33f4816-d441-4fc5-a1dc-8f636b8858e9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 2025-10-30 13:00, Ngai-Mint Kwan wrote:
> Hi Gustavo,
>
> On 2025-10-30 12:33, Gustavo Sousa wrote:
>> Quoting Ngai-Mint Kwan (2025-10-30 16:15:50-03:00)
>>> Fix Segmentation Fault when calling igt_pipe_crc_free() due to 
>>> double-freeing a
>>> dangling pointer.
>>>
>>> This occurs when a system connected to multiple displays executes a 
>>> test with
>>> "1x-outputs" dynamic subtest.
>>>
>>> Example:
>>> kms_atomic_transition --run-subtest modeset-transition 
>>> --dynamic-subtest 1x-outputs
>>>
>>> v2:
>>> - Move test cleanup inside run_modeset_tests().
>>>
>>> Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
>>> ---
>>> tests/kms_atomic_transition.c | 25 +++++++++++++------------
>>> 1 file changed, 13 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/tests/kms_atomic_transition.c 
>>> b/tests/kms_atomic_transition.c
>>> index e1387bd89..419afe4dd 100644
>>> --- a/tests/kms_atomic_transition.c
>>> +++ b/tests/kms_atomic_transition.c
>>> @@ -899,6 +899,7 @@ static void run_modeset_tests(data_t *data, int 
>>> howmany, bool nonblocking, bool
>>>          unsigned iter_max;
>>>          igt_output_t *output;
>>>          uint16_t width = 0, height = 0;
>>> +        enum pipe pipe_enum;
>> Nit: I would have just gone with 'enum pipe pipe', which seems to be 
>> the most
>> common way of doing it (according to
>>
>>      git grep -oh 'enum pipe \w\+' | sort | uniq -c | sort -g
>>
>> ).
>>
>> The change itself looks logically right, so:
>>
>> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> That would have been my first choice too!
> Unfortunately, the following warning appears on compile:
>
> ../tests/kms_atomic_transition.c: In function ‘run_modeset_tests’:
> ../tests/kms_atomic_transition.c:921:29: warning: declaration of 
> ‘pipe’ shadows a previous local [-Wshadow]
>   921 |                 igt_pipe_t *pipe = &data->display.pipes[i];
>       |                             ^~~~
> ../tests/kms_atomic_transition.c:902:19: note: shadowed declaration is 
> here
>   902 |         enum pipe pipe;
>       |                   ^~~~
>
> This is why I settled with "enum_pipe", but I am open to other 
> suggestions.
Correction: "pipe_enum"

Kwan
>
> Kwan
>>
>>> retry:
>>>          unset_output_pipe(&data->display);
>>> @@ -1033,6 +1034,18 @@ retry:
>>>                          }
>>>                  }
>>>          }
>>> +
>>> +        /* Cleanup */
>>> +        unset_output_pipe(&data->display);
>>> +        igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>> +
>>> +        if (is_intel_device(data->drm_fd)) {
>>> +                for_each_pipe(&data->display, pipe_enum)
>>> + igt_pipe_crc_free(data->pipe_crcs[pipe_enum]);
>>> +        }
>>> +
>>> +        igt_remove_fb(data->drm_fd, &data->fbs[0]);
>>> +        igt_remove_fb(data->drm_fd, &data->fbs[1]);
>>> }
>>>
>>> static void run_modeset_transition(data_t *data, int 
>>> requested_outputs, bool nonblocking, bool fencing)
>>> @@ -1067,18 +1080,6 @@ static void run_modeset_transition(data_t 
>>> *data, int requested_outputs, bool non
>>>
>>>          igt_dynamic_f("%ix-outputs", requested_outputs)
>>>                  run_modeset_tests(data, requested_outputs, 
>>> nonblocking, fencing);
>>> -
>>> -        /* Cleanup */
>>> -        unset_output_pipe(&data->display);
>>> -        igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>> -
>>> -        if (is_intel_device(data->drm_fd)) {
>>> -                for_each_pipe(&data->display, pipe)
>>> - igt_pipe_crc_free(data->pipe_crcs[pipe]);
>>> -        }
>>> -
>>> -        igt_remove_fb(data->drm_fd, &data->fbs[0]);
>>> -        igt_remove_fb(data->drm_fd, &data->fbs[1]);
>>> }
>>>
>>> static bool pipe_output_combo_valid(igt_display_t *display,
>>> -- 
>>> 2.43.0
>>>
>

