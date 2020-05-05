Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A4889791
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 18:44:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g12so3468262wmh.3
 for <igt-dev@lists.freedesktop.org>; Tue, 05 May 2020 11:44:58 -0700 (PDT)
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
 <20200428202255.31309-6-juhapekka.heikkila@gmail.com>
 <20200505071604.GM9497@platvala-desk.ger.corp.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <dc01f926-409c-3884-f1d1-48e40e1f1e2c@gmail.com>
Date: Tue, 5 May 2020 21:44:51 +0300
MIME-Version: 1.0
In-Reply-To: <20200505071604.GM9497@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 5/7] igt/params: add generic saving
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

On 5.5.2020 10.16, Petri Latvala wrote:
> On Tue, Apr 28, 2020 at 11:22:53PM +0300, Juha-Pekka Heikkila wrote:
>> From: Jani Nikula <jani.nikula@intel.com>
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_params.c | 57 ++++++++++++++++++++++++++++++++++++++++--------
>>   lib/igt_params.h |  3 +++
>>   2 files changed, 51 insertions(+), 9 deletions(-)
>>
>> diff --git a/lib/igt_params.c b/lib/igt_params.c
>> index fe4b1df3..d9cf986c 100644
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
>> @@ -164,20 +187,36 @@ int igt_params_open(int device)
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
>> + * @device: fd of the device or -1 to default to first matching starting from
>> + *	    zero. See __igt_params_open()
> 
> 
> This documentation is still only understandable if you already know what it does.
> 
> "-- to default to the first /dev/dri/cardX device, starting from zero" ?
> 
> "See <a function without documentation>" in generated documentation is
> less than useful as well... Maybe just drop that sentence altogether
> from docs, point to the function in a normal comment? Or link to
> igt_debugfs_path() that will do the actual -1 handling...
> 
> With better docs,
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

These were generally in line with how sysfs was documented but I agree 
it's more fun to read code where there are more hints on what's going 
on. I'll checkout those comment blocks what's all the stuff that could 
be said there.

> 
> 
> 
>> + * @parameter: the name of the parameter to set
>> + * @fmt: printf-esque format string
>> + *
>> + * Save the original value to be restored.
>> + *
>> + * Returns true on success
>> + */
>> +bool igt_params_set_save(int device, const char *parameter, const char *fmt, ...)
>> +{
>> +	va_list ap;
>> +	bool ret;
>> +
>> +	va_start(ap, fmt);
>> +	ret = __igt_params_set(device, parameter, fmt, ap, true);
>> +	va_end(ap);
>> +
>> +	return ret;
>>   }
>>   
>>   /**
>> diff --git a/lib/igt_params.h b/lib/igt_params.h
>> index 52eed77f..1b750d23 100644
>> --- a/lib/igt_params.h
>> +++ b/lib/igt_params.h
>> @@ -31,6 +31,9 @@ int igt_params_open(int device);
>>   __attribute__((format(printf, 3, 4)))
>>   bool igt_params_set(int device, const char *parameter, const char *fmt, ...);
>>   
>> +__attribute__((format(printf, 3, 4)))
>> +bool igt_params_set_save(int device, const char *parameter, const char *fmt, ...);
>> +
>>   void igt_set_module_param(const char *name, const char *val);
>>   void igt_set_module_param_int(const char *name, int val);
>>   
>> -- 
>> 2.26.0
>>
>> _______________________________________________
>> igt-dev mailing list
>> igt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/igt-dev

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
