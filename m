Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7C010E491
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Oct 2022 08:14:51 +0000 (UTC)
Message-ID: <7220fa85-ade4-2e9a-abb2-2df6dc2387cf@linux.intel.com>
Date: Fri, 21 Oct 2022 09:14:39 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221018091001.18552-1-kamil.konieczny@linux.intel.com>
 <640e3f12-db6d-1ea1-9a43-441b36540776@linux.intel.com>
 <Y0/i3Nfzj31QA/Y8@kamilkon-desk1>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <Y0/i3Nfzj31QA/Y8@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] lib/igt_device_scan: add filer
 card=all
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 19/10/2022 12:43, Kamil Konieczny wrote:
> Hi Tvrtko,
> 
> On 2022-10-18 at 17:06:29 +0100, Tvrtko Ursulin wrote:
>>
>> On 18/10/2022 10:09, Kamil Konieczny wrote:
>>> Allow to select all (up to 16) discrete cards with the help of
>>> card=all or card=*, for example:
>>>
>>> ./gem_basic --device=pci:vendor=intel,device=discrete,card=all
>>
>> What should this do btw? Run the tests on more than one card in sequence?
>> Isn't that test runner's job?
>>
>> Regards,
>> Tvrtko
> 
> The purpose it to run test in parallel with the help of new fork
> helper or with threads. See my RFC patchset (using fork)
> 
> https://patchwork.freedesktop.org/series/109487/
> Add multi-process subtests for multi-GPUs

Those would be running completely independently - I mean no interaction 
between the GPUs like work handover, buffer sharing and that? If so my 
gut feeling is that the direction needs to be carefully considered. Test 
runner could do that just as well for probably much less complication. 
But that's just my opinion, so FWIW.

Regards,

Tvrtko
