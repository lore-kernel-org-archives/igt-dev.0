Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA3F89D8A
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 18:46:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k1so3997536wrx.4
 for <igt-dev@lists.freedesktop.org>; Tue, 05 May 2020 11:46:27 -0700 (PDT)
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
 <20200428202255.31309-6-juhapekka.heikkila@gmail.com>
 <20200505140912.pqtw6yyplacaop5u@ahiler-desk1.fi.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <a9c3b9e6-1f2c-6e08-7c61-74f4aeead861@gmail.com>
Date: Tue, 5 May 2020 21:46:18 +0300
MIME-Version: 1.0
In-Reply-To: <20200505140912.pqtw6yyplacaop5u@ahiler-desk1.fi.intel.com>
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 5.5.2020 17.09, Arkadiusz Hiler wrote:
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
> 
> this is using a va_list, not "...", so this format attirbue should not
> be here
> 

Good catch

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
>> + * @parameter: the name of the parameter to set
>> + * @fmt: printf-esque format string
>> + *
>> + * Save the original value to be restored.
> 
> this needs a bit more explanation
> 
> 1. mention that it's basically _params_save followed by _params_set
> 2. mention that the value is resoted by atexit handler, but refer to the
>     _params_save for details
> 

As I replied to Petri on same patch, this is generally in line how sysfs 
is documented but totally agree it's more fun to read code with more 
hints what's going on. It makes it easier to see if code and comments 
disagree -- usually that's a sign both are wrong. I'll see what I can 
come up with my inner poet.

Thanks for the comments guys, I'll make some changes and send new set.

> 
>> + *
>> + * Returns true on success
>> + */
>> +bool igt_params_set_save(int device, const char *parameter, const char *fmt, ...)
> 
> _save_and_set
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
