Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <cc343cda-29eb-3364-9eca-237be2cb5110@intel.com>
Date: Fri, 14 Apr 2023 12:15:14 -0700
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230413224414.2313507-1-vinay.belgaumkar@intel.com>
 <20230413224414.2313507-3-vinay.belgaumkar@intel.com>
 <87jzyeqqqo.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87jzyeqqqo.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib: Make SLPC helper function per
 GT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 4/14/2023 11:10 AM, Dixit, Ashutosh wrote:
> On Thu, 13 Apr 2023 15:44:12 -0700, Vinay Belgaumkar wrote:
>> Use default of 0 where GT id is not being used.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   lib/igt_pm.c             | 20 ++++++++++----------
>>   lib/igt_pm.h             |  2 +-
>>   tests/i915/i915_pm_rps.c |  6 +++---
>>   3 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
>> index 704acf7d..8ca7c181 100644
>> --- a/lib/igt_pm.c
>> +++ b/lib/igt_pm.c
>> @@ -1329,21 +1329,21 @@ void igt_pm_print_pci_card_runtime_status(void)
>> 	}
>>   }
>>
>> -bool i915_is_slpc_enabled(int fd)
>> +bool i915_is_slpc_enabled(int drm_fd, int gt)
> OK, we understand that the debugfs dir path is per gt, but I am wondering
> if we need to expose this as a function argument? Since, in all instances,
> we are always passing gt as 0.
>
> Maybe the caller is only interested in knowing if slpc is enabled. Can SLPC
> be enabled for gt 0 and disabled for gt 1? In the case the caller should
> really call something like:
>
> 	for_each_gt()
> 		i915_is_slpc_enabled(fd, gt)
>
> and return false if slpc is disabled for any gt.
>
> I think what we should do is write two functions:
>
> 1. Rename the function above with the gt argument to something like:
>
> 	i915_is_slpc_enabled_gt()
>
> 2. Have another function without the gt argument:
>
> 	i915_is_slpc_enabled() which will do:
>
> 	for_each_gt()
> 		i915_is_slpc_enabled_gt(fd, gt)
>
> and return false if slpc is disabled for any gt.
>
> And then have the tests call this second function without the gt argument.
>
> I think this will be cleaner than passing 0 as the gt from the tests.

ok, created a helper for the helper :) This will hard code GT 0 instead 
of the tests doing it, when necessary.

Thanks,

Vinay.

>
> Thanks.
> --
> Ashutosh
>
>
>>   {
>> -	int debugfs_fd = igt_debugfs_dir(fd);
>> -	char buf[4096] = {};
>> -	int len;
>> +	int debugfs_fd;
>> +	char buf[256] = {};
>> +
>> +	debugfs_fd = igt_debugfs_gt_open(drm_fd, gt, "uc/guc_slpc_info", O_RDONLY);
>>
>> -	igt_require(debugfs_fd != -1);
>> +	/* if guc_slpc_info not present then return false */
>> +	if (debugfs_fd < 0)
>> +		return false;
>> +	read(debugfs_fd, buf, sizeof(buf)-1);
>>
>> -	len = igt_debugfs_simple_read(debugfs_fd, "gt/uc/guc_slpc_info", buf, sizeof(buf));
>> 	close(debugfs_fd);
>>
>> -	if (len < 0)
>> -		return false;
>> -	else
>> -		return strstr(buf, "SLPC state: running");
>> +	return strstr(buf, "SLPC state: running");
>>   }
>>
>>   int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
>> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
>> index d0d6d673..1b054dce 100644
>> --- a/lib/igt_pm.h
>> +++ b/lib/igt_pm.h
>> @@ -84,7 +84,7 @@ void igt_pm_set_d3cold_allowed(struct igt_device_card *card, const char *val);
>>   void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);
>>   void igt_pm_restore_pci_card_runtime_pm(void);
>>   void igt_pm_print_pci_card_runtime_status(void);
>> -bool i915_is_slpc_enabled(int fd);
>> +bool i915_is_slpc_enabled(int fd, int gt);
>>   int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
>>   int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>>
>> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
>> index d4ee2d58..85dae449 100644
>> --- a/tests/i915/i915_pm_rps.c
>> +++ b/tests/i915/i915_pm_rps.c
>> @@ -916,21 +916,21 @@ igt_main
>> 	}
>>
>> 	igt_subtest("basic-api") {
>> -		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
>> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd, 0),
>> 			      "This subtest is not supported when SLPC is enabled\n");
>> 		min_max_config(basic_check, false);
>> 	}
>>
>> 	/* Verify the constraints, check if we can reach idle */
>> 	igt_subtest("min-max-config-idle") {
>> -		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
>> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd, 0),
>> 			      "This subtest is not supported when SLPC is enabled\n");
>> 		min_max_config(idle_check, true);
>> 	}
>>
>> 	/* Verify the constraints with high load, check if we can reach max */
>> 	igt_subtest("min-max-config-loaded") {
>> -		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
>> +		igt_skip_on_f(i915_is_slpc_enabled(drm_fd, 0),
>> 			      "This subtest is not supported when SLPC is enabled\n");
>> 		load_helper_run(HIGH);
>> 		min_max_config(loaded_check, false);
>> --
>> 2.38.1
>>
