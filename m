Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555CE10E4E4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Feb 2023 17:30:20 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com
In-Reply-To: <Y/4Qn02tFP5mYSkr@ideak-desk.fi.intel.com>
References: <20230228142951.972328-1-jani.nikula@intel.com>
 <Y/4Qn02tFP5mYSkr@ideak-desk.fi.intel.com>
Date: Tue, 28 Feb 2023 19:30:15 +0200
Message-ID: <87h6v5y9y0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_pm: make igt_pm_dmc_loaded()
 more robust
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

On Tue, 28 Feb 2023, Imre Deak <imre.deak@intel.com> wrote:
> On Tue, Feb 28, 2023 at 04:29:51PM +0200, Jani Nikula wrote:
>> Make igt_pm_dmc_loaded() more robust against changes in the debugfs
>> file. Read the entire contents of the file, at least with the current
>> output. Preserve logged output even if something gets added in front of
>> the file, and don't depend on exact length of the first line.
>> 
>> Cc: Imre Deak <imre.deak@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Imre Deak <imre.deak@intel.com>

Thanks for the review, pushed.

BR,
Jani.


>
>> ---
>>  lib/igt_pm.c | 14 +++++++++++---
>>  1 file changed, 11 insertions(+), 3 deletions(-)
>> 
>> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
>> index 26e8c9f05fdf..6c84e94f6307 100644
>> --- a/lib/igt_pm.c
>> +++ b/lib/igt_pm.c
>> @@ -785,6 +785,11 @@ bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
>>  	return ret;
>>  }
>>  
>> +static const char *yesno(bool x)
>> +{
>> +	return x ? "yes" : "no";
>> +}
>> +
>>  /**
>>   * dmc_loaded:
>>   * @debugfs: fd to the debugfs dir.
>> @@ -798,7 +803,8 @@ bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
>>   */
>>  bool igt_pm_dmc_loaded(int debugfs)
>>  {
>> -	char buf[15];
>> +	char buf[512];
>> +	bool loaded;
>>  	int len;
>>  
>>  	len = igt_sysfs_read(debugfs, "i915_dmc_info", buf, sizeof(buf) - 1);
>> @@ -807,8 +813,10 @@ bool igt_pm_dmc_loaded(int debugfs)
>>  
>>  	buf[len] = '\0';
>>  
>> -	igt_info("DMC: %s\n", buf);
>> -	return strstr(buf, "fw loaded: yes");
>> +	loaded = strstr(buf, "fw loaded: yes");
>> +	igt_info("DMC: fw loaded: %s\n", yesno(loaded));
>> +
>> +	return loaded;
>>  }
>>  
>>  /**
>> -- 
>> 2.39.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
