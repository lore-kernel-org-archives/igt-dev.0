Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2073.outbound.protection.outlook.com [40.107.212.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F3910E2B7
 for <igt-dev@lists.freedesktop.org>; Tue, 24 May 2022 16:01:09 +0000 (UTC)
Message-ID: <e4236c8c-714d-c83e-ab95-f6a46dde0aaa@amd.com>
Date: Tue, 24 May 2022 12:01:03 -0400
Content-Language: en-US
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Melissa Wen <mwen@igalia.com>
References: <20220520203531.14394-1-andrealmeid@igalia.com>
 <e9eb514c-5e31-2b8d-3285-58a809ce3352@amd.com>
 <DM4PR11MB6213B0E56163D8E40318D87FECD79@DM4PR11MB6213.namprd11.prod.outlook.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <DM4PR11MB6213B0E56163D8E40318D87FECD79@DM4PR11MB6213.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/2] tests/kms_async_flips: Expand
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Latvala, Petri" <petri.latvala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

I merged this patchset.

Thanks
Siqueira


On 2022-05-24 11:48, Vudum, Lakshminarayana wrote:
> I don't see any regression under this patch. So, no actions are taken.
> 
> Lakshmi.
> 
> -----Original Message-----
> From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
> Sent: Tuesday, May 24, 2022 6:14 AM
> To: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> Cc: kernel-dev@igalia.com; markyacoub@google.com; Latvala, Petri <petri.latvala@intel.com>; Arkadiusz Hiler <arek@hiler.eu>; Melissa Wen <mwen@igalia.com>; Alex Hung <alex.hung@amd.com>; igt-dev@lists.freedesktop.org; André Almeida <andrealmeid@igalia.com>
> Subject: Re: [PATCH i-g-t v2 0/2] tests/kms_async_flips: Expand test
> 
> Hi Lakshmi,
> 
> I noticed a gitlab warning in this patch:
> 
> https://patchwork.freedesktop.org/series/104037/>> 
> I think it is a false positive, but I want to check with you before I merge it. What do you think?
> 
> Thanks
> Siqueira
> 
> On 2022-05-20 16:35, André Almeida wrote:
>> Hi,
>>
>> This patchset enables kms_async_flips to run in more vendors. It was
>> tested at i915, amdgpu and vc4.
>>
>> The first patch adds a helper to keep the same behavior of the test
>> while keeping things simple, and the second patch make the test work
>> on more platforms.
>>
>> Changes from v1:
>> - Fix function comment typo
>>
>> André Almeida (2):
>>     lib/igt_fb: Add support for drawing rectangles with random colors
>>     tests/kms_async_flips: Support more vendors
>>
>>    lib/igt_fb.c            | 20 ++++++++++++++++++
>>    lib/igt_fb.h            |  1 +
>>    tests/kms_async_flips.c | 47 ++++++++++++++++++++++++-----------------
>>    3 files changed, 49 insertions(+), 19 deletions(-)
>>
> 
