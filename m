Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F186ED28
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 14:07:28 +0000 (UTC)
References: <20200218121549.12917-1-sai.gowtham.ch@intel.com>
 <20200305124250.GA32109@kdec5-desk.ger.corp.intel.com>
 <5734061626B4B34D8BE569E3846B57A2C218DE@BGSMSX107.gar.corp.intel.com>
 <7d9f289b-7b04-9355-0e2b-0ede2b2a2b08@linux.intel.com>
 <20200306112247.GB1398@intel.intel>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <a2654522-3c21-53d3-00ba-01c13b68948f@linux.intel.com>
Date: Fri, 6 Mar 2020 14:07:24 +0000
MIME-Version: 1.0
In-Reply-To: <20200306112247.GB1398@intel.intel>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t]tests/i915/gem_exec_create:
 Added __for_each_physical_engine to utilize all available engines.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andi Shyti <andi.shyti@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch,
 Sai Gowtham" <sai.gowtham.ch@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 06/03/2020 11:22, Andi Shyti wrote:
> Hi Tvrtko,
> 
>>> After fork we need to transfer the engine map from parent fd default
>>> context. (gem_context_copy_engines)
>>>
>>> Also, since we have __for_each_physical_engine in the top level
>>> igt_fixture, I think _all_ subtests run with default ctx engine map. So
>>> all which submit to one from either all_engines or ppgtt_engines need to
>>> make sure engine maps are aligned.
>>>
>>> it was suggested by tvrtko in one of the patch: https://patchwork.freedesktop.org/patch/351622/?series=72889&rev=1
>>
>> I was sadly wrong there, it is not required to reopen and copy engines after
>> fork. So __for_each_physical_engine should do it in this case.
>>
>> Regards,
>>
>> Tvrtko
>>
>> P.S. You could also dynamically size (allocate) the engines array while at
>> it to be more in line with the other recent cleanups.
>>
>> Hm.. actually, do we even need the array? Andi, __for_each_physical_engine
>> will always create engine map with consecutive e->flags integers, right?
>> There can be no holes?
> 
> yes, you are right, we do not need in this case the array and
> there shouldn't be holes, indeed.

Then the question is whether it is a good idea to rely on this from 
tests or not? I can't imagine a scenario where IGT couldn't create a map 
with no holes but maybe my imagination is bad.

Regards,

Tvrtko


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
