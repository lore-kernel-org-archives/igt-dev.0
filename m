Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D38B10E246
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 10:15:52 +0000 (UTC)
Message-ID: <8f9ce4d1-a8b6-bd74-d458-06bca5aac961@intel.com>
Date: Thu, 1 Jun 2023 15:45:36 +0530
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230601050928.2487611-1-kunal1.joshi@intel.com>
 <20230601050928.2487611-3-kunal1.joshi@intel.com>
 <c4c378943e9e1196ab5a9a8548a8af6e3e3b602b.camel@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <c4c378943e9e1196ab5a9a8548a8af6e3e3b602b.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] RFC Added is_xe to check if xe
 device
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


On 6/1/2023 3:41 PM, Hogander, Jouni wrote:
> Hello Kunal,
>
> Please check my comment below.
>
> On Thu, 2023-06-01 at 10:39 +0530, Kunal Joshi wrote:
>> Added is_xe for test to have XE checks
>>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   tests/i915/kms_frontbuffer_tracking.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/tests/i915/kms_frontbuffer_tracking.c
>> b/tests/i915/kms_frontbuffer_tracking.c
>> index c2b99670..3bef46b6 100644
>> --- a/tests/i915/kms_frontbuffer_tracking.c
>> +++ b/tests/i915/kms_frontbuffer_tracking.c
>> @@ -309,6 +309,8 @@ struct {
>>          .stop = true,
>>   };
>>   
>> +static bool is_xe;
> Maybe you could just drop this and use is_xe_device() where you need to
> differentiate?
>
Hello Jouni,

Thanks for taking a look, will float changes as you suggested.

Regards
Kunal Joshi
