Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC7E10E1AA
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jul 2023 07:37:09 +0000 (UTC)
Message-ID: <2805f4e6-06fe-58a7-78a9-bba26f4e4916@intel.com>
Date: Mon, 24 Jul 2023 13:06:27 +0530
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230718121443.445343-1-kunal1.joshi@intel.com>
 <20230718121443.445343-3-kunal1.joshi@intel.com>
 <20230720100245.2lref6sw6j7btr7k@zkempczy-mobl2>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230720100245.2lref6sw6j7btr7k@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: on xe driver switch
 from rendercopy to blitcopy
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


On 7/20/2023 3:32 PM, Zbigniew Kempczyński wrote:
> On Tue, Jul 18, 2023 at 05:44:43PM +0530, Kunal Joshi wrote:
>> on xe driver use blitcopy for everything where otherwise would
>> use rendercopy.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_fb.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index 6ce4b735a..f4bc800fe 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -2529,7 +2529,7 @@ static bool use_enginecopy(const struct igt_fb *fb)
>>   	if (!is_intel_device(fb->fd))
>>   		return false;
>>   
>> -	if (!is_xe_device(fb->fd) && blitter_ok(fb))
>> +	if (blitter_ok(fb))
>>   		return false;
> I stared to this and for me it looks we disable rendercopy at all
> for i915 as well for xe even if rendercopy is same for i915 and xe
> (intel-bb should handle this).
>
> --
> Zbigniew


Thanks Zbigniew :) , for pointing it out,
Will make changes and send next revision.

Regards

Kunal Joshi
