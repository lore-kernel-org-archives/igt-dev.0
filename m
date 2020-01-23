Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06EC6FA1F
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 14:45:25 +0000 (UTC)
References: <20200116135546.14003-1-anna.karas@intel.com>
 <20200121150400.15207-1-anna.karas@intel.com>
 <157962200684.5216.7245636638665670840@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <8e409b90-1c93-83e4-73d9-7a508ffb00b7@linux.intel.com>
Date: Thu, 23 Jan 2020 14:45:20 +0000
MIME-Version: 1.0
In-Reply-To: <157962200684.5216.7245636638665670840@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] Distinguish particular engines during
 calculating nop calibration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, Anna Karas <anna.karas@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 21/01/2020 15:53, Chris Wilson wrote:
> Quoting Anna Karas (2020-01-21 15:04:00)
>> @@ -3242,14 +3421,13 @@ int main(int argc, char **argv)
>>                  goto err;
>>          }
>>   
>> -       if (!nop_calibration) {
>> -               if (verbose > 1)
>> -                       printf("Calibrating nop delay with %u%% tolerance...\n",
>> +       if (!has_nop_calibration) {
>> +               if (verbose > 1) {
>> +                       printf("Calibrating nop delays with %u%% tolerance...\n",
>>                                  tolerance_pct);
>> -               nop_calibration = calibrate_nop(tolerance_pct);
>> -               if (verbose)
>> -                       printf("Nop calibration for %uus delay is %lu.\n",
>> -                              nop_calibration_us, nop_calibration);
>> +               }
>> +
>> +               calibrate_engines();
>>   
>>                  goto out;
>>          }
>> @@ -3309,8 +3487,7 @@ int main(int argc, char **argv)
>>   
>>          if (verbose > 1) {
> 
> Hmm, could this be
> if (verbose > 1 || !has_nop_calibration)
> so that a plain run of gem_wsim shows the calibration results?

verbose = 1 is default and currently shows the calibration value.

-q on the command line sets verbose = 0 and then it doesn't.

-v does verbose++.

If with plain run you mean gem_wsim without any arguments it should show 
the calibration. I think that means the check in calibrate_engines() 
needs to be changed to:

+	if (verbose)
+		print_engines_calibrations();

Yes good catch, I missed this. Probably also best to leave 
print_engines_calibrations() (and lose double plural?) outside of 
calibrate_engines().

Regards,

Tvrtko

>>                  printf("Random seed is %u.\n", master_prng);
>> -               printf("Using %lu nop calibration for %uus delay.\n",
>> -                      nop_calibration, nop_calibration_us);
>> +               print_engines_calibrations();
>>                  printf("%u client%s.\n", clients, clients > 1 ? "s" : "");
>>                  if (flags & SWAPVCS)
>>                          printf("Swapping VCS rings between clients.\n");
>> -- 
>> 2.19.0
>>
>> _______________________________________________
>> igt-dev mailing list
>> igt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/igt-dev
>>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
