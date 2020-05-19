Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73E86E314
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 11:30:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f13so2663421wmc.5
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 04:30:29 -0700 (PDT)
References: <20200519105408.10565-1-juhapekka.heikkila@gmail.com>
 <20200519110056.GA9497@platvala-desk.ger.corp.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <63b60423-cf4a-7a27-328d-9e9b8cdf9cca@gmail.com>
Date: Tue, 19 May 2020 14:30:21 +0300
MIME-Version: 1.0
In-Reply-To: <20200519110056.GA9497@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_params: Fix verifying of
 debugfs parameters
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

On 19.5.2020 14.00, Petri Latvala wrote:
> On Tue, May 19, 2020 at 01:54:08PM +0300, Juha-Pekka Heikkila wrote:
>> After found correct place in debugfs for parameters there
>> was used wrong path for verifying existence of parameter
>> which caused fallback path to be used.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_params.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/igt_params.c b/lib/igt_params.c
>> index d8649dfd..410ca650 100644
>> --- a/lib/igt_params.c
>> +++ b/lib/igt_params.c
>> @@ -143,14 +143,14 @@ static int __igt_params_open(int device, char **outpath, const char *param)
>>   
>>   		devname = openat(dir, "name", O_RDONLY);
>>   		igt_require_f(devname >= 0,
>> -		              "Driver need to name itself in debugfs!");
>> +			      "Driver need to name itself in debugfs!");
>>   
>>   		read(devname, searchname, sizeof(searchname));
>>   		close(devname);
>>   
>>   		foundname = strtok_r(searchname, " ", &ctx);
>>   		igt_require_f(foundname,
>> -		              "Driver need to name itself in debugfs!");
>> +			      "Driver need to name itself in debugfs!");
> 
> 
> While changing whitespace here, also add the missing \n to the string!
> 
> But do take a look at Chris's cleanup patches.

Chris seems to be removing default device guesswork. I didn't at initial 
stage want to go that route because there was quite many tests affected 
by that. From Chris's CI runs it look like there's probably still few 
rounds ahead as I recognize those failing tests. I'll add those couple 
of newlines and make new patch, this will not affect Chris's work if it 
take time for him to finish.

/Juha-Pekka
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
