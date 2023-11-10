Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EB310E6A0
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 06:53:01 +0000 (UTC)
Message-ID: <f89fa22f-3f7a-4939-e836-cfb37ba9e36c@collabora.com>
Date: Fri, 10 Nov 2023 12:22:54 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 daniels@collabora.com, igt-dev@lists.freedesktop.org
References: <20231110040647.630223-1-vignesh.raman@collabora.com>
 <905fb4ec-5d8a-73df-2841-a0affe98768f@intel.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <905fb4ec-5d8a-73df-2841-a0affe98768f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v4] lib/igt_kms: Fix memory corruption
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: helen.koike@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanu,

On 10/11/23 11:36, Modem, Bhanuprakash wrote:
>> ---
>>   lib/igt_kms.c                   |  6 +++++-
>>   lib/igt_kms.h                   | 20 +++++++++++++++++++-
>>   tests/intel-ci/blacklist.txt    | 10 +++++++++-
>>   tests/intel-ci/xe.blocklist.txt |  6 +++---
>>   tests/intel/kms_ccs.c           | 24 ++++++++++++++++++++++++
>>   tests/kms_bw.c                  |  2 +-
> 
> Probably, you need to split this patch into 3.
> 
> 1- lib
> 2- tests
> 3- intel-ci

Sure, will split the changes into 3 commits.

>> @@ -2770,6 +2770,10 @@ void igt_display_require(igt_display_t 
>> *display, int drm_fd)
>>       }
>>   #endif
>> +    igt_assert_f(resources->count_crtcs <= IGT_MAX_PIPES,
> --------^
> Could be igt_require_f()?
> 
> IMHO, we need to skip the test instead of fail. Since it is a basic 
> requirement to fill display struct.

Okay, will skip the test. I was going through the failures mentioned in
https://patchwork.freedesktop.org/series/125599/

Are these known issues?

>> --- a/tests/intel-ci/blacklist.txt
>> +++ b/tests/intel-ci/blacklist.txt
>> @@ -117,12 +117,20 @@ igt@gem_ctx_isolation@.*-s4
>>   ###############################################
>>   igt@i915_suspend@shrink
>>   ###############################################
>> -# pipe-e, pipe-f, pipe-g, pipe-h no current HW support
>> +# pipe-e, pipe-f, pipe-g, pipe-h, pipe-i, pipe-j, pipe-k, pipe-l, 
>> pipe-m, pipe-n, pipe-o, pipe-p no current HW support
>>   ###############################################
>>   igt@.*@.*pipe-e($|-.*)
>>   igt@.*@.*pipe-f($|-.*)
>>   igt@.*@.*pipe-g($|-.*)
>>   igt@.*@.*pipe-h($|-.*)
>> +igt@.*@.*pipe-i($|-.*)
>> +igt@.*@.*pipe-j($|-.*)
>> +igt@.*@.*pipe-k($|-.*)
>> +igt@.*@.*pipe-l($|-.*)
>> +igt@.*@.*pipe-m($|-.*)
>> +igt@.*@.*pipe-n($|-.*)
>> +igt@.*@.*pipe-o($|-.*)
>> +igt@.*@.*pipe-p($|-.*)
> 
> Shall we simplify the regex as below?
> 
> igt@.*@.*pipe-[e-pE-P]($|-.*)

Yes, this looks good.

> 
>>   ###############################################
>>   # Temporary workarounds for CI-impacting bugs
>> diff --git a/tests/intel-ci/xe.blocklist.txt 
>> b/tests/intel-ci/xe.blocklist.txt
>> index 135ab18a3..bec6ee23b 100644
>> --- a/tests/intel-ci/xe.blocklist.txt
>> +++ b/tests/intel-ci/xe.blocklist.txt
>> @@ -44,11 +44,11 @@ igt@syncobj_.*
>>   igt@template
>>   igt@tools_test
>>   ##################################################################
>> -# KMS: Pipe E, F, G and H are not available on Intel hardware,
>> +# KMS: Pipe E, F, G, H, I, J, K, L, M, N, O and P are not available 
>> on Intel hardware,
>>   # hence can't use more than 4 displays.
>>   ##################################################################
>> -igt@.*@.*pipe-(e|f|g|h).*
>> -igt@kms_bw@.*-(5|6|7|8)-displays-.*
>> +igt@.*@.*pipe-(e|f|g|h|i|j|k|l|m|n|o|p).*
>> +igt@kms_bw@.*-(5|6|7|8|9|10|11|12|13|14|15|16)-displays-.*
> 
> igt@.*@.*pipe-[e-pE-P].*
> igt@kms_bw@.*-([5-9]|1[0-6])-displays-.*
> 
> I used to validate my regex at https://regex101.com/
> 
> You can get my R-b after addressing above comments.

Thank you.

Regards,
Vignesh
