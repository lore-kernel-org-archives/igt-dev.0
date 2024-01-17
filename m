Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9674910E777
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 17:40:32 +0000 (UTC)
Message-ID: <8573f07f-aa61-4e30-90f1-97c9f76ef9b4@intel.com>
Date: Wed, 17 Jan 2024 18:40:11 +0100
Subject: Re: [PATCH i-g-t v4 3/3] tests/intel-ci: Add mi_atomic test to
 fast-feedback
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240117133050.19605-1-nirmoy.das@intel.com>
 <20240117133050.19605-3-nirmoy.das@intel.com>
 <20240117171327.dcgqvtuitm67ydtr@kamilkon-desk.igk.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240117171327.dcgqvtuitm67ydtr@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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


On 1/17/2024 6:13 PM, Kamil Konieczny wrote:
> Hi Nirmoy,
> On 2024-01-17 at 14:30:49 +0100, Nirmoy Das wrote:
>> Add this basic functionality test the fast feedback list.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
> Now test itself is in correct place but -dec- should be before -inc-.
I did that locally but didn't commit that change :/
>
> This can be corrected at merge.

I will resend as I have to do that anyway for the patch2

Thanks,

Nirmoy

>
> Regards,
> Kamil
>
>>   igt@xe_exec_balancer@twice-virtual-basic
>>   igt@xe_exec_balancer@no-exec-virtual-basic
>>   igt@xe_exec_balancer@twice-cm-virtual-basic
>> -- 
>> 2.42.0
>>
