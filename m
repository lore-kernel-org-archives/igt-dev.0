Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC4610E208
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Dec 2021 16:43:45 +0000 (UTC)
Message-ID: <606c0f33-3b62-e9b0-de06-9d0a6f195992@intel.com>
Date: Thu, 30 Dec 2021 08:43:40 -0800
Content-Language: en-US
References: <20211229075239.1555546-1-priyanka.dandamudi@intel.com>
 <87k0fn9m80.wl-ashutosh.dixit@intel.com>
From: "Ewins, Jon" <jon.ewins@intel.com>
In-Reply-To: <87k0fn9m80.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_exec: Skip test for
 RCS+CCS
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
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>


On 12/29/2021 12:42 PM, Dixit, Ashutosh wrote:
> On Tue, 28 Dec 2021 23:52:39 -0800, <priyanka.dandamudi@intel.com> wrote:
>> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>>
>> Updated the nohangcheck test to skip for DG2
>> as test fails when reset is applied for the RCS+CCS combination.
>>
>> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
>> ---
>>   tests/i915/gem_ctx_exec.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
>> index a1270a88..dbb46404 100644
>> --- a/tests/i915/gem_ctx_exec.c
>> +++ b/tests/i915/gem_ctx_exec.c
>> @@ -276,6 +276,9 @@ static void nohangcheck_hostile(int i915)
>> 	int err = 0;
>> 	int dir;
>> 	uint64_t ahnd;
>> +	bool rcs_found = false;
>> +	bool ccs_found = false;
>> +
> Extra newline.
>
>> 	/*
>> 	 * Even if the user disables hangcheck during their context,
>> @@ -293,6 +296,17 @@ static void nohangcheck_hostile(int i915)
>>
>> 	igt_require(__enable_hangcheck(dir, false));
>>
>> +	for_each_ctx_engine(i915, ctx, e) {
>> +		if(rcs_found && ccs_found)
> Need space before opening bracket (both "(" and "{"), everywhere.
>
>> +			break;
>> +		else if(e->class == I915_ENGINE_CLASS_RENDER && rcs_found == false){
> No need for rcs_found check.
>
>> +			rcs_found = true;
>> +			continue;
> No need for 'continue' since we have an "else if".
>
>> +		}
>> +		else if(e->class == I915_ENGINE_CLASS_COMPUTE && ccs_found == false)
> No need for ccs_found check.
>
>> +			ccs_found = true;
>> +	}
>> +	igt_require(!(rcs_found && ccs_found));
> This one I am not sure of. Do RCS + CCS have dependent resets only for
> particular products so that this check would unnecessarily skip on future
> products where such dependence may not exist? How has this been handled
> elsewhere?

The dependent reset are there on any platform with both CCS+RCS or 
multiple CCS.

However, DG2 has limitations relating to rcs and ccs context switching 
that other platforms with both rcs and ccs (e.g. ADL-P) do not have, 
therefore it is intended to use a DG2 specific skip where appropriate.
>> 	for_each_ctx_engine(i915, ctx, e) {
>> 		igt_spin_t *spin;
>> 		int new;
>> --
>> 2.25.1
>>
