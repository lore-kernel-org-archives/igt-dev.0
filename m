Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E622D89791
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 18:44:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h9so4018260wrt.0
 for <igt-dev@lists.freedesktop.org>; Tue, 05 May 2020 11:44:12 -0700 (PDT)
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
 <20200428202255.31309-5-juhapekka.heikkila@gmail.com>
 <20200505070719.GL9497@platvala-desk.ger.corp.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <b7cb48ba-ff54-fdb0-fd22-38466a0ec74e@gmail.com>
Date: Tue, 5 May 2020 21:44:05 +0300
MIME-Version: 1.0
In-Reply-To: <20200505070719.GL9497@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 4/7] lib/params: add igt_params_open()
 which will return path
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

On 5.5.2020 10.07, Petri Latvala wrote:
> On Tue, Apr 28, 2020 at 11:22:52PM +0300, Juha-Pekka Heikkila wrote:
>> From: Jani Nikula <jani.nikula@intel.com>
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> Restore author's S-o-b and

I've been trying to advertise on cover letter about this but maybe Jani 
didn't see it there. Original patch doesn't have Jani's S-o-b. If Jani 
comment about it I could add it here.

> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
> 
>> ---
>>   lib/igt_params.c | 29 ++++++++++++++++++-----------
>>   1 file changed, 18 insertions(+), 11 deletions(-)
>>
>> diff --git a/lib/igt_params.c b/lib/igt_params.c
>> index b5ac1266..fe4b1df3 100644
>> --- a/lib/igt_params.c
>> +++ b/lib/igt_params.c
>> @@ -107,17 +107,7 @@ static void igt_params_save(int dir, const char *path, const char *name)
>>   	module_params = data;
>>   }
>>   
>> -/**
>> - * igt_params_open:
>> - * @device: fd of the device
>> - *
>> - * This opens the module parameters directory (under sysfs) corresponding
>> - * to the device for use with igt_sysfs_set() and igt_sysfs_get().
>> - *
>> - * Returns:
>> - * The directory fd, or -1 on failure.
>> - */
>> -int igt_params_open(int device)
>> +static int __igt_params_open(int device, char **outpath)
>>   {
>>   	int dir, params = -1;
>>   
>> @@ -141,11 +131,28 @@ int igt_params_open(int device)
>>   
>>   		sprintf(path, "/sys/module/%s/parameters", name);
>>   		params = open(path, O_RDONLY);
>> +		if (params >= 0 && outpath)
>> +			*outpath = strdup(path);
>>   	}
>>   
>>   	return params;
>>   }
>>   
>> +/**
>> + * igt_params_open:
>> + * @device: fd of the device
>> + *
>> + * This opens the module parameters directory (under sysfs) corresponding
>> + * to the device for use with igt_sysfs_set() and igt_sysfs_get().
>> + *
>> + * Returns:
>> + * The directory fd, or -1 on failure.
>> + */
>> +int igt_params_open(int device)
>> +{
>> +	return __igt_params_open(device, NULL);
>> +}
>> +
>>   /**
>>    * igt_params_set:
>>    * @device: fd of the device
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
