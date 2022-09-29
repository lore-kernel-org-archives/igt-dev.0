Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0847F10E604
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 12:57:01 +0000 (UTC)
Message-ID: <982260e9-6b9b-6209-a2d4-7345caf09fee@linux.intel.com>
Date: Thu, 29 Sep 2022 14:56:58 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220928085842.34107-1-mauro.chehab@linux.intel.com>
 <20220928085842.34107-3-mauro.chehab@linux.intel.com>
 <YzQXFRYCk8Alj4zR@platvala-desk.ger.corp.intel.com>
 <YzR1ypRVkKtVXt22@kamilkon-desk1> <20220929102136.4e1a18bf@maurocar-mobl2>
 <YzVuHIriXmCIbiVT@platvala-desk.ger.corp.intel.com>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <YzVuHIriXmCIbiVT@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH RFC 2/2] lib/igt_core: print card sysfs node
 at subtest results
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

On 9/29/22 12:06, Petri Latvala wrote:
> On Thu, Sep 29, 2022 at 10:21:36AM +0200, Mauro Carvalho Chehab wrote:
>> On Wed, 28 Sep 2022 18:26:50 +0200
>> Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
>>
>>> Hi Mauro,
>>>
>>> On 2022-09-28 at 12:43:20 +0300, Petri Latvala wrote:
>>>> On Wed, Sep 28, 2022 at 10:58:42AM +0200, Mauro Carvalho Chehab wrote:
>>>>> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>>>>>
>>>>> This helps to identify what GPU failed on multi-GPU tests.
>>>> And completely breaks igt_runner when it tries to parse the result
>>>> logs.
>> Yes. That's btw one of the reasons why I submitted it as a RFC: depending
>> on how CI check IGT logs, it can break the test results there as well.
>>
>> Anyway, this is fixable.
>>
>> The point is, once we have multi-GPU tests, we need to have a way to
>> report what GPU failed.
> Imho it's best printed in __igt_fail_assert to get it close to the
> reason why the test is failing.

Yeah, it makes sense to have it there, but, IMO it should also be at the 
result
output, as we could have a test that it skipped on some GPUs and/or fail on
some GPUs while passing on others.


Regards,
Mauro

