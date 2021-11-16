Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493BB6E1B5
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 10:19:26 +0000 (UTC)
References: <20211022061245.1166638-1-priyanka.dandamudi@intel.com>
 <20211022061245.1166638-3-priyanka.dandamudi@intel.com>
 <87h7d584kw.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <83d2ed11-da5d-0760-23a8-b6e5fca0a14d@linux.intel.com>
Date: Tue, 16 Nov 2021 10:19:21 +0000
MIME-Version: 1.0
In-Reply-To: <87h7d584kw.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


Hi,

On 25/10/2021 17:14, Dixit, Ashutosh wrote:
> On Thu, 21 Oct 2021 23:12:44 -0700, <priyanka.dandamudi@intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Add compute class to engine base names.
> 
> Also probably had Zbigniew's R-b previously.
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
>> ---
>>   lib/i915/gem_engine_topology.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
>> index 4e497a5c..729f42b0 100644
>> --- a/lib/i915/gem_engine_topology.c
>> +++ b/lib/i915/gem_engine_topology.c
>> @@ -130,6 +130,7 @@ static const char *class_names[] = {
>> 	[I915_ENGINE_CLASS_COPY]	  = "bcs",
>> 	[I915_ENGINE_CLASS_VIDEO]	  = "vcs",
>> 	[I915_ENGINE_CLASS_VIDEO_ENHANCE] = "vecs",
>> +	[I915_ENGINE_CLASS_COMPUTE]       = "ccs",

When are the i915 patches planned to appear?

Asking since there are user requests to add compute engine support to 
intel_gpu_top and I am a bit unsure of the plans, given no platform 
currently exports the engine but IGT code apparently went in.

Regards,

Tvrtko

>>   };
>>
>>   static void init_engine(struct intel_execution_engine2 *e2,
>> --
>> 2.25.1
>>
