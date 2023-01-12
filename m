Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1DC10E8F2
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jan 2023 13:51:36 +0000 (UTC)
Message-ID: <69a96611-1d7b-3ace-e425-5a6d2f4c7564@intel.com>
Date: Thu, 12 Jan 2023 14:51:20 +0100
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <cover.1673426099.git.karolina.stolarek@intel.com>
 <e0a74fa3eb3c6982ca231b557a9cd42363caf47c.1673426099.git.karolina.stolarek@intel.com>
 <20230111164255.womdjqvveb2sbg5o@kamilkon-desk1>
 <6445da8a-aab0-ef89-2c72-68bcfe4b4bd8@intel.com>
 <Y7/kb7M/jG+l2Bmr@platvala-desk.ger.corp.intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <Y7/kb7M/jG+l2Bmr@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/6] i915/lib: Add new library for
 blitter and tiling formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 12.01.2023 11:43, Petri Latvala wrote:
> On Thu, Jan 12, 2023 at 10:35:58AM +0100, Karolina Stolarek wrote:
>> Hi Kamil,
>>
>> On 11.01.2023 17:42, Kamil Konieczny wrote:
>>> Hi Karolina,
>>
>> <snip>
>>
>>>> +#include "igt_core.h"
>>>
>>> imho we should have smaller include here as we need only uint32_t,
>>> not all igt_core.
>>
>> I've just realised that I want to use igt_core.h. I'm using quite useful
>> wrappers like igt_require_f and igt_info, and I'd like to keep them.
> 
> In the header? I don't see them.

Ah, right. I'll move it to the source.

Many thanks,
Karolina

> 
> 
