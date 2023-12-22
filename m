Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDDA10E0C2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 12:18:01 +0000 (UTC)
Message-ID: <7297abc4-309a-4ca8-a606-498b3abd0c2a@intel.com>
Date: Fri, 22 Dec 2023 14:18:11 +0200
Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Garg, Nemesa" <nemesa.garg@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20231212090841.2060493-1-chaitanya.kumar.borah@intel.com>
 <c3cae6fc-8a97-4abd-9918-bba55c1757ca@gmail.com>
 <DM4PR11MB614147FFF506542FADD01654B98CA@DM4PR11MB6141.namprd11.prod.outlook.com>
 <20231214143628.xyisz4tovwg3jjo2@kamilkon-desk.igk.intel.com>
 <SJ1PR11MB61292ABDFB706F233E749456B990A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20231218161918.dj4b5zqdzwogdbkg@kamilkon-desk.igk.intel.com>
 <SJ1PR11MB6129BD2C80EB786A916F0A09B997A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20231219070042.l5yhwd6lmoe7chvn@kamilkon-desk.igk.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20231219070042.l5yhwd6lmoe7chvn@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

On 19/12/2023 09:00, Kamil Konieczny wrote:
> Hi,
>
> On 2023-12-19 at 05:43:13 +0000, Borah, Chaitanya Kumar wrote:
>> Hello,
>>
>>> -----Original Message-----
>>> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> Sent: Monday, December 18, 2023 9:49 PM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Juha-Pekka
>>> Heikkila <juhapekka.heikkila@gmail.com>; Garg, Nemesa
>>> <nemesa.garg@intel.com>
>>> Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
>>>
>>> Hi,
>>>
>>> On 2023-12-18 at 10:14:34 +0000, Borah, Chaitanya Kumar wrote:
>>>> Hello Kamil,
>>>>
>>>>> -----Original Message-----
>>>>> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>>> Sent: Thursday, December 14, 2023 8:06 PM
>>>>> To: igt-dev@lists.freedesktop.org
>>>>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
>>>>> Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>; Garg, Nemesa
>>>>> <nemesa.garg@intel.com>
>>>>> Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 2023-12-14 at 04:48:27 +0000, Borah, Chaitanya Kumar wrote:
>>>>>> Hello JP,
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>>>>> Sent: Wednesday, December 13, 2023 6:47 PM
>>>>>>> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
>>>>>>> igt- dev@lists.freedesktop.org
>>>>>>> Cc: Garg, Nemesa <nemesa.garg@intel.com>
>>>>>>> Subject: Re: [PATCH] lib: sync i915_pciids.h with kernel
>>>>>>>
>>>>>>> This is not correct. This does not synchronize with kernel commit.
>>>>>>> i915_pciids.h is supposed to be copied as is from kernel.
>>>>>> This has crossed my mind but there are a lot of changes[1]
>>>>>> unrelated to
>>>>> ARL-S if we just copy the file.
>>>>>> Therefore, it made me a bit uncomfortable. Should I go ahead anyway?
>>>>>>
>>>>>> At least for PVC device ids, we might have to take an exception.
>>>>>> Or may be
>>>>> they did not belong there in the first place.
>>>>> You may add only ARL-S but then write in subject what you did as it
>>>>> is not syncing, for example:
>>>>>
>>>>> [PATCH] lib/i915_pciids: Add ARL-S
>>>>>
>>>>> and describe why you added only that. Write also which commit (hash
>>>>> and
>>>>> subject) you used (working link could also help).
>>>>>
>>>>> One more thing: why not adding all without removing PVC ids?
>>>>>
>>>> Actually, I will go ahead and do that. I will post a patch soon.
>>>>
>> +Matt, Lionel
>>
>> Spoke to soon! We are running into build errors for MTL PCI IDs as the kernel does not define the macros
>>
>> INTEL_MTL_P_GT2_IDS
>> INTEL_MTL_P_GT3_IDS
>>
>> I am not sure how to handle this now. Make an exception for MTL too? Or Should these changes be added back to the kernel header?
>>
> Looks like it can be deleted from lib perf.c?
> Please verify such change on MTL.
>
> Regards,
> Kamil


Not sure what you're proposing on deleting.

Performance metric support/testing all MTL platforms?


The reason we need to differentiate GT2/GT3 skus is that they require a 
different programming to get performance metrics.

I can't say what is best here. Different headers between kernel & IGT or 
make the kernel carry this change too?

I'm sure some people are going to complain either way :)


-Lionel


>
>> ../lib/i915/perf.c: In function ‘is_mtl_gt2’:
>> ../lib/i915/perf.c:216:3: error: implicit declaration of function ‘INTEL_MTL_M_IDS’; did you mean ‘INTEL_MTL_IDS’? [-Werror=implicit-function-declaration]
>>    216 |   INTEL_MTL_M_IDS(NULL),
>>        |   ^~~~~~~~~~~~~~~
>>        |   INTEL_MTL_IDS
>> ../lib/i915/perf.c:216:3: warning: nested extern declaration of ‘INTEL_MTL_M_IDS’ [-Wnested-externs]
>> ../lib/i915/perf.c:216:3: error: initializer element is not constant
>> ../lib/i915/perf.c:216:3: note: (near initialization for ‘devids[0]’)
>> ../lib/i915/perf.c:217:3: error: implicit declaration of function ‘INTEL_MTL_P_GT2_IDS’; did you mean ‘INTEL_CFL_U_GT2_IDS’? [-Werror=implicit-function-declaration]
>>    217 |   INTEL_MTL_P_GT2_IDS(NULL),
>>        |   ^~~~~~~~~~~~~~~~~~~
>>        |   INTEL_CFL_U_GT2_IDS
>> ../lib/i915/perf.c:217:3: warning: nested extern declaration of ‘INTEL_MTL_P_GT2_IDS’ [-Wnested-externs]
>> ../lib/i915/perf.c:217:3: error: initializer element is not constant
>> ../lib/i915/perf.c:217:3: note: (near initialization for ‘devids[1]’)
>> ../lib/i915/perf.c: In function ‘is_mtl_gt3’:
>> ../lib/i915/perf.c:234:3: error: implicit declaration of function ‘INTEL_MTL_P_GT3_IDS’; did you mean ‘INTEL_WHL_U_GT3_IDS’? [-Werror=implicit-function-declaration]
>>    234 |   INTEL_MTL_P_GT3_IDS(NULL),
>>        |   ^~~~~~~~~~~~~~~~~~~
>>        |   INTEL_WHL_U_GT3_IDS
>> ../lib/i915/perf.c:234:3: warning: nested extern declaration of ‘INTEL_MTL_P_GT3_IDS’ [-Wnested-externs]
>> ../lib/i915/perf.c:234:3: error: initializer element is not constant
>> ../lib/i915/perf.c:234:3: note: (near initialization for ‘devids[0]’)
>>
>>>> Regards
>>>>
>>>> Chaitanya
>>> Last thing, please add i-g-t in subject after PATCH, so it will be:
>>>
>>> [PATCH i-g-t] describe here your patch
>>>
>> Ack.
>>
>> Regards
>>
>> Chaitanya
>>
>>> Regards,
>>> Kamil
>>>
>>> [...cut...]

