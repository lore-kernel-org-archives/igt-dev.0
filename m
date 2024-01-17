Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C1410E08F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 12:29:45 +0000 (UTC)
Message-ID: <33d467af-2cee-404e-ace6-01c92427fdb8@linux.intel.com>
Date: Wed, 17 Jan 2024 13:29:41 +0100
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 3/3] tests/intel-ci: Add mi_atomic test to
 fast-feedback
Content-Language: en-US
References: <20240117111234.28312-1-nirmoy.das@intel.com>
 <20240117111234.28312-3-nirmoy.das@intel.com>
 <20240117114836.kvnizsqmp4yqw5kk@kamilkon-desk.igk.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240117114836.kvnizsqmp4yqw5kk@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 1/17/2024 12:48 PM, Kamil Konieczny wrote:
> Hi Nirmoy,
> On 2024-01-17 at 12:12:33 +0100, Nirmoy Das wrote:
>> Add this basic functionality test the fast feedback list.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   tests/intel-ci/xe-fast-feedback.testlist | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
>> index bef5b0b8a..da79c76b4 100644
>> --- a/tests/intel-ci/xe-fast-feedback.testlist
>> +++ b/tests/intel-ci/xe-fast-feedback.testlist
>> @@ -29,6 +29,8 @@ igt@xe_evict@evict-small-multi-vm-cm
>>   igt@xe_evict@evict-threads-small
>>   igt@xe_evict_ccs@evict-overcommit-simple
>>   igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
>> +igt@xe_exec_atomic@basic-inc-all
>> +igt@xe_exec_atomic@basic-dec-all
> -dec- should be before -inc-, with that fixed:
>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Will do that. Thanks Kamil.
>>   igt@xe_exec_balancer@twice-virtual-basic
>>   igt@xe_exec_balancer@no-exec-virtual-basic
>>   igt@xe_exec_balancer@twice-cm-virtual-basic
>> -- 
>> 2.42.0
>>

