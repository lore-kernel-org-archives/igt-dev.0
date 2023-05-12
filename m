Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340B010E089
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 09:35:01 +0000 (UTC)
Message-ID: <60b66bda-3a2d-2e2d-c7e3-a9e58e16c83d@intel.com>
Date: Fri, 12 May 2023 11:34:51 +0200
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230512092728.6612-1-nirmoy.das@intel.com>
 <20230512092728.6612-2-nirmoy.das@intel.com>
 <5b8cbb1b-572c-9516-1399-a42d12b3be9c@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <5b8cbb1b-572c-9516-1399-a42d12b3be9c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] intel-ci: Remove prime_vgem userptr
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 5/12/2023 11:32 AM, Andrzej Hajda wrote:
>
>
> On 12.05.2023 11:27, Nirmoy Das wrote:
>> This is test is not valid anymore so remove it.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>

Thanks, Andrzej! I will fix "This is test" -> "This test" before merging.

> Regards
> Andrzej
>
>> ---
>>   tests/intel-ci/fast-feedback.testlist | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/tests/intel-ci/fast-feedback.testlist 
>> b/tests/intel-ci/fast-feedback.testlist
>> index d9fcb62d6e..cfe7cb4aa3 100644
>> --- a/tests/intel-ci/fast-feedback.testlist
>> +++ b/tests/intel-ci/fast-feedback.testlist
>> @@ -145,7 +145,6 @@ igt@prime_vgem@basic-fence-read
>>   igt@prime_vgem@basic-gtt
>>   igt@prime_vgem@basic-read
>>   igt@prime_vgem@basic-write
>> -igt@prime_vgem@basic-userptr
>>   igt@vgem_basic@setversion
>>   igt@vgem_basic@create
>>   igt@vgem_basic@debugfs
>
