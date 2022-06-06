Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A0E10E2A3
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 12:01:04 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v19so18489505edd.4
 for <igt-dev@lists.freedesktop.org>; Mon, 06 Jun 2022 05:01:04 -0700 (PDT)
Message-ID: <4e55ff86-2267-f652-5d82-4f768e266706@gmail.com>
Date: Mon, 6 Jun 2022 15:00:54 +0300
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20220606090511.26339-1-juhapekka.heikkila@gmail.com>
 <20220606090511.26339-2-juhapekka.heikkila@gmail.com>
 <Yp3e/5tS+XYdzFpm@zkempczy-mobl2>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <Yp3e/5tS+XYdzFpm@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/intel_chipset: restore usage of
 has_flatccs flag
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 6.6.2022 14.03, Zbigniew Kempczyński wrote:
> On Mon, Jun 06, 2022 at 12:05:11PM +0300, Juha-Pekka Heikkila wrote:
>> When older patches had been merged on top of newer patches
>> has_flatccs flag usage had gotten lost, put it back here.
>> While at it also set has_flatccs flag to take only one bit
>> since it is of boolean type.
>>
>> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/intel_chipset.h | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
>> index 815474086..de4749e14 100644
>> --- a/lib/intel_chipset.h
>> +++ b/lib/intel_chipset.h
>> @@ -41,7 +41,7 @@ struct intel_device_info {
>>   	unsigned display_ver;
>>   	unsigned gt; /* 0 if unknown */
>>   	bool has_4tile : 1;
>> -	bool has_flatccs;
>> +	bool has_flatccs : 1;
>>   	bool is_mobile : 1;
>>   	bool is_whitney : 1;
>>   	bool is_almador : 1;
>> @@ -221,7 +221,6 @@ void intel_check_pch(void);
>>   
>>   #define HAS_4TILE(devid)	(intel_get_device_info(devid)->has_4tile)
>>   
>> -/* use HAS_4TILE here as all devices with 4-tile have flat ccs. */
>> -#define HAS_FLATCCS(devid)	HAS_4TILE(devid)
>> +#define HAS_FLATCCS(devid)	(intel_get_device_info(devid)->has_flatccs)
> 
> Uhm, dg1 has 4tile but this doesn't implicate it has flatccs, so:
> 
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 

Hi, thanks for the ack. About that dg1, you are not remembering some 
other platform by mistake? I didn't spot 4tile being enabled for dg1 on 
kernel, on platform definition I noticed it only enabled in DG2_FEATURES

/Juha-Pekka
