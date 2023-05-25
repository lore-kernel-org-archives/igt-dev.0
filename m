Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0532E10E865
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 09:29:40 +0000 (UTC)
Message-ID: <a7860541-a3fc-7c1d-c554-1f08617f3876@intel.com>
Date: Thu, 25 May 2023 11:29:31 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <cover.1684747649.git.karolina.stolarek@intel.com>
 <6390a099791da99b9570b7143fd0cbb519450435.1684747649.git.karolina.stolarek@intel.com>
 <20230522113202.feostmbye6zfkozh@zkempczy-mobl2>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230522113202.feostmbye6zfkozh@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/intel_cmds_info: Drop
 BLT_CMD_LONG flag
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

On 22.05.2023 13:32, Zbigniew Kempczyński wrote:
> On Mon, May 22, 2023 at 11:57:13AM +0200, Karolina Stolarek wrote:
>> It looks like a separate flag for longer commands isn't needed
>> and we can use BLT_CMD_EXTENDED instead.
> 
> If so what for you're introducing this flag in patch 1/4?
> 

The idea was to keep the original patch and work on the top of it. But I 
can modify it and drop this commit, no problem.

Thanks,
Karolina

> --
> Zbigniew
> 
>>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> ---
>>   lib/i915/intel_cmds_info.c | 2 +-
>>   lib/i915/intel_cmds_info.h | 1 -
>>   2 files changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/lib/i915/intel_cmds_info.c b/lib/i915/intel_cmds_info.c
>> index 3ce2fd74b..09b612279 100644
>> --- a/lib/i915/intel_cmds_info.c
>> +++ b/lib/i915/intel_cmds_info.c
>> @@ -87,7 +87,7 @@ static const struct blt_cmd_info
>>   						 BIT(T_LINEAR) |
>>   						 BIT(T_YMAJOR) |
>>   						 BIT(T_XMAJOR),
>> -						 BLT_CMD_LONG);
>> +						 BLT_CMD_EXTENDED);
>>   
>>   static const struct blt_cmd_info
>>   		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT,
>> diff --git a/lib/i915/intel_cmds_info.h b/lib/i915/intel_cmds_info.h
>> index 5998a35ca..91d0f15ec 100644
>> --- a/lib/i915/intel_cmds_info.h
>> +++ b/lib/i915/intel_cmds_info.h
>> @@ -34,7 +34,6 @@ struct blt_cmd_info {
>>   	uint32_t flags;
>>   #define BLT_CMD_EXTENDED               (1 << 0)
>>   #define BLT_CMD_SUPPORTS_COMPRESSION   (1 << 1)
>> -#define BLT_CMD_LONG                   (1 << 2)
>>   };
>>   
>>   struct intel_cmds_info {
>> -- 
>> 2.25.1
>>
