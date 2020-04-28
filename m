Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6CB6E972
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2020 18:43:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v8so3050745wma.0
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2020 11:43:38 -0700 (PDT)
References: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
 <20200421161725.12249-6-juhapekka.heikkila@gmail.com>
 <20200428124054.GS9497@platvala-desk.ger.corp.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <b0d05df0-9ba8-fc45-0900-842fc92030a3@gmail.com>
Date: Tue, 28 Apr 2020 21:43:31 +0300
MIME-Version: 1.0
In-Reply-To: <20200428124054.GS9497@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 5/8] igt/params: add generic saving
 module parameter set
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 28.4.2020 15.40, Petri Latvala wrote:
> On Tue, Apr 21, 2020 at 07:17:22PM +0300, Juha-Pekka Heikkila wrote:
>> From: Jani Nikula <jani.nikula@intel.com>
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_params.c | 56 ++++++++++++++++++++++++++++++++++++++++--------
>>   lib/igt_params.h |  3 +++
>>   2 files changed, 50 insertions(+), 9 deletions(-)
>>
>> diff --git a/lib/igt_params.c b/lib/igt_params.c
>> index fe4b1df3..8de47b02 100644
>> --- a/lib/igt_params.c
>> +++ b/lib/igt_params.c
>> @@ -153,6 +153,29 @@ int igt_params_open(int device)
>>   	return __igt_params_open(device, NULL);
>>   }
>>   
>> +__attribute__((format(printf, 3, 0)))
>> +static bool __igt_params_set(int device, const char *parameter,
>> +			     const char *fmt, va_list ap, bool save)
>> +{
>> +	char *path = NULL;
>> +	int dir;
>> +	int ret;
>> +
>> +	dir = __igt_params_open(device, save ? &path : NULL);
>> +	if (dir < 0)
>> +		return false;
>> +
>> +	if (save)
>> +		igt_params_save(dir, path, parameter);
>> +
>> +	ret = igt_sysfs_vprintf(dir, parameter, fmt, ap);
>> +
>> +	close(dir);
>> +	free(path);
>> +
>> +	return ret > 0;
>> +}
>> +
>>   /**
>>    * igt_params_set:
>>    * @device: fd of the device
>> @@ -164,20 +187,35 @@ int igt_params_open(int device)
>>   bool igt_params_set(int device, const char *parameter, const char *fmt, ...)
>>   {
>>   	va_list ap;
>> -	int dir;
>> -	int ret;
>> -
>> -	dir = igt_params_open(device);
>> -	if (dir < 0)
>> -		return false;
>> +	bool ret;
>>   
>>   	va_start(ap, fmt);
>> -	ret = igt_sysfs_vprintf(dir, parameter, fmt, ap);
>> +	ret = __igt_params_set(device, parameter, fmt, ap, false);
>>   	va_end(ap);
>>   
>> -	close(dir);
>> +	return ret;
>> +}
>>   
>> -	return ret > 0;
>> +/**
>> + * igt_params_set_save:
>> + * @device: fd of the device (or -1 to default to Intel)
> 
> 
> Default to Intel? Which Intel? Where is this defaulting implemented?

Yea, that comment will need some improvements. Wording smell bit like 
it's coming from legacy times.

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
