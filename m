Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61ABB10E35C
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 06:24:52 +0000 (UTC)
Message-ID: <d216666c-18b0-c7e7-be0a-fe6423867145@intel.com>
Date: Wed, 28 Jun 2023 11:54:36 +0530
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230627102656.475578-1-riana.tauro@intel.com>
 <20230627102656.475578-2-riana.tauro@intel.com>
 <CY5PR11MB621187FAD8B507D9EEB2FCB39524A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB621187FAD8B507D9EEB2FCB39524A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/xe/xe_guc_pc: Remove rc6 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Anshuman

On 6/28/2023 10:17 AM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Tuesday, June 27, 2023 3:57 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
>> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Sundaresan, Sujaritha
>> <sujaritha.sundaresan@intel.com>
>> Subject: [PATCH i-g-t 1/2] tests/xe/xe_guc_pc: Remove rc6 tests
>>
>> Remove these tests as sysfs paths have been changed and a generic naming
>> used
> Missing full stop.
>>
>> These tests will be moved to a different file
> May be it is better to squash this patch series to your existing rc6 patch series.
Sure will do that

Thanks
Riana
> Thanks,
> Anshuman Gupta.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/xe/xe_guc_pc.c | 44 --------------------------------------------
>>   1 file changed, 44 deletions(-)
>>
>> diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c index
>> 89d5ae9e..79359942 100644
>> --- a/tests/xe/xe_guc_pc.c
>> +++ b/tests/xe/xe_guc_pc.c
>> @@ -348,27 +348,6 @@ static void test_reset(int fd, int sysfs, int gt_id, int
>> cycles)
>>   	}
>>   }
>>
>> -
>> -/**
>> - * SUBTEST: rc6_on_idle
>> - * Description: check if GPU is in RC6 on idle
>> - * Run type: BAT
>> - *
>> - * SUBTEST: rc0_on_exec
>> - * Description: check if GPU is in RC0 on when doing some work
>> - * Run type: BAT
>> - */
>> -
>> -static bool in_rc6(int sysfs, int gt_id) -{
>> -	char path[32];
>> -	char rc[8];
>> -	sprintf(path, "device/gt%d/rc_status", gt_id);
>> -	if (igt_sysfs_scanf(sysfs, path, "%s", rc) < 0)
>> -		return false;
>> -	return strcmp(rc, "rc6") == 0;
>> -}
>> -
>>   igt_main
>>   {
>>   	struct drm_xe_engine_class_instance *hwe; @@ -460,29 +439,6 @@
>> igt_main
>>   		}
>>   	}
>>
>> -	igt_subtest("rc6_on_idle") {
>> -		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
>> -		xe_for_each_gt(fd, gt) {
>> -			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
>> -		}
>> -	}
>> -
>> -	igt_subtest("rc0_on_exec") {
>> -		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
>> -		xe_for_each_gt(fd, gt) {
>> -			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
>> -			xe_for_each_hw_engine(fd, hwe)
>> -				igt_fork(child, ncpus) {
>> -					igt_debug("Execution Started\n");
>> -					exec_basic(fd, hwe,
>> MAX_N_ENGINES, 16);
>> -					igt_debug("Execution Finished\n");
>> -				}
>> -			/* While exec in threads above, let's check rc_status
>> */
>> -			assert(igt_wait(!in_rc6(sysfs, gt), 1000, 1));
>> -			igt_waitchildren();
>> -		}
>> -	}
>> -
>>   	igt_fixture {
>>   		xe_for_each_gt(fd, gt) {
>>   			set_freq(sysfs, gt, "min", stash_min);
>> --
>> 2.40.0
> 
