Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC196E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 16:48:48 +0000 (UTC)
Message-ID: <be81a5fd-c0a1-1f45-7f3b-4908867b97f9@linux.intel.com>
Date: Tue, 16 Nov 2021 16:48:45 +0000
MIME-Version: 1.0
Content-Language: en-US
References: <20211022061245.1166638-1-priyanka.dandamudi@intel.com>
 <20211022061245.1166638-3-priyanka.dandamudi@intel.com>
 <87h7d584kw.wl-ashutosh.dixit@intel.com>
 <83d2ed11-da5d-0760-23a8-b6e5fca0a14d@linux.intel.com>
 <87tugcvymh.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <87tugcvymh.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] i915/gem_engine_topology: Add
 compute class
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 16/11/2021 16:44, Dixit, Ashutosh wrote:
> On Tue, 16 Nov 2021 02:19:21 -0800, Tvrtko Ursulin wrote:
>>>> diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
>>>> index 4e497a5c..729f42b0 100644
>>>> --- a/lib/i915/gem_engine_topology.c
>>>> +++ b/lib/i915/gem_engine_topology.c
>>>> @@ -130,6 +130,7 @@ static const char *class_names[] = {
>>>> 	[I915_ENGINE_CLASS_COPY]	  = "bcs",
>>>> 	[I915_ENGINE_CLASS_VIDEO]	  = "vcs",
>>>> 	[I915_ENGINE_CLASS_VIDEO_ENHANCE] = "vecs",
>>>> +	[I915_ENGINE_CLASS_COMPUTE]       = "ccs",
>>
>> When are the i915 patches planned to appear?
>>
>> Asking since there are user requests to add compute engine support to
>> intel_gpu_top and I am a bit unsure of the plans, given no platform
>> currently exports the engine but IGT code apparently went in.
> 
> I understand CCS patches have been posted but are now blocked on adequate
> IGT test coverage. Maybe it's ok to add CCS support to IGT intel_gpu_top
> first as long as we are using the engine query (CCS is absent from legacy
> engines) since the kernel will not return CCS?

It could be added but there is little point if it can never show 
anything. It can just wait I think until whatever platform first enables 
those engines.

It is just unusual that IGT has uapi which kernel knows nothing about.

Regards,

Tvrtko
