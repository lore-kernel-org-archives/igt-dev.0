Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FA68941E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2020 07:06:22 +0000 (UTC)
References: <20200218121549.12917-1-sai.gowtham.ch@intel.com>
 <20200305124250.GA32109@kdec5-desk.ger.corp.intel.com>
 <5734061626B4B34D8BE569E3846B57A2C218DE@BGSMSX107.gar.corp.intel.com>
 <7d9f289b-7b04-9355-0e2b-0ede2b2a2b08@linux.intel.com>
 <20200306112247.GB1398@intel.intel>
 <a2654522-3c21-53d3-00ba-01c13b68948f@linux.intel.com>
 <5734061626B4B34D8BE569E3846B57A2C24836@BGSMSX107.gar.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <f4eea69f-f287-d87e-38b3-a687c929d86c@linux.intel.com>
Date: Thu, 19 Mar 2020 07:06:14 +0000
MIME-Version: 1.0
In-Reply-To: <5734061626B4B34D8BE569E3846B57A2C24836@BGSMSX107.gar.corp.intel.com>
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
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Shyti, Andi" <andi.shyti@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 19/03/2020 03:55, Ch, Sai Gowtham wrote:
> Hi Andi,Tvrtko ,
> 
> Could you please suggest me which would be the best way ?

No reopen after fork and no need for the engines array - just 
s/engines[i]/i/ in the child.

Regards,

Tvrtko

> Thanks,
> Gowtham
> 
> -----Original Message-----
> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Sent: Friday, March 6, 2020 7:37 PM
> To: Shyti, Andi <andi.shyti@intel.com>
> Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Dec, Katarzyna <katarzyna.dec@intel.com>; igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t]tests/i915/gem_exec_create: Added __for_each_physical_engine to utilize all available engines.
> 
> 
> On 06/03/2020 11:22, Andi Shyti wrote:
>> Hi Tvrtko,
>>
>>>> After fork we need to transfer the engine map from parent fd default
>>>> context. (gem_context_copy_engines)
>>>>
>>>> Also, since we have __for_each_physical_engine in the top level
>>>> igt_fixture, I think _all_ subtests run with default ctx engine map.
>>>> So all which submit to one from either all_engines or ppgtt_engines
>>>> need to make sure engine maps are aligned.
>>>>
>>>> it was suggested by tvrtko in one of the patch:
>>>> https://patchwork.freedesktop.org/patch/351622/?series=72889&rev=1
>>>
>>> I was sadly wrong there, it is not required to reopen and copy
>>> engines after fork. So __for_each_physical_engine should do it in this case.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>> P.S. You could also dynamically size (allocate) the engines array
>>> while at it to be more in line with the other recent cleanups.
>>>
>>> Hm.. actually, do we even need the array? Andi,
>>> __for_each_physical_engine will always create engine map with consecutive e->flags integers, right?
>>> There can be no holes?
>>
>> yes, you are right, we do not need in this case the array and there
>> shouldn't be holes, indeed.
> 
> Then the question is whether it is a good idea to rely on this from tests or not? I can't imagine a scenario where IGT couldn't create a map with no holes but maybe my imagination is bad.
> 
> Regards,
> 
> Tvrtko
> 
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
