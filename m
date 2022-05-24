Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A18A10F1DC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 May 2022 13:22:01 +0000 (UTC)
Message-ID: <9a99b4c8-152a-e5d0-522c-6c0ec6329e70@igalia.com>
Date: Tue, 24 May 2022 10:21:27 -0300
MIME-Version: 1.0
Content-Language: en-US
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20220520203531.14394-1-andrealmeid@igalia.com>
 <e9eb514c-5e31-2b8d-3285-58a809ce3352@amd.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <e9eb514c-5e31-2b8d-3285-58a809ce3352@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/2] tests/kms_async_flips: Expand
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com,
 kernel-dev@igalia.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Às 10:14 de 24/05/22, Rodrigo Siqueira Jordao escreveu:
> Hi Lakshmi,
> 
> I noticed a gitlab warning in this patch:
> 
> https://patchwork.freedesktop.org/series/104037/
> 
> I think it is a false positive, but I want to check with you before I
> merge it. What do you think?
> 

I think it's a false positive as well, given that the fails happens with
a bunch of unrelated tests and this same patch has a successful gitlab
pipeline:

https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/587765

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
>> while keeping things simple, and the second patch make the test work on
>> more platforms.
>>
>> Changes from v1:
>> - Fix function comment typo
>>
>> André Almeida (2):
>>    lib/igt_fb: Add support for drawing rectangles with random colors
>>    tests/kms_async_flips: Support more vendors
>>
>>   lib/igt_fb.c            | 20 ++++++++++++++++++
>>   lib/igt_fb.h            |  1 +
>>   tests/kms_async_flips.c | 47 ++++++++++++++++++++++++-----------------
>>   3 files changed, 49 insertions(+), 19 deletions(-)
>>
> 
