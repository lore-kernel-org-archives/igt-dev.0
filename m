Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D2210E0AB
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 05:01:09 +0000 (UTC)
Message-ID: <fa89a7dc-ca1d-59c9-6b29-0d01b7325926@intel.com>
Date: Wed, 14 Jun 2023 10:30:25 +0530
MIME-Version: 1.0
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
References: <20230531065407.362625-1-swati2.sharma@intel.com>
 <20230531065407.362625-4-swati2.sharma@intel.com>
 <20230601135559.3cnml6oqozfooxkb@kamilkon-desk1>
 <f404b0fd-ab95-ca5f-2684-0071ab27476d@intel.com>
 <20230613110110.3vjnpjtvuvn55jsv@kamilkon-desk1>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230613110110.3vjnpjtvuvn55jsv@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/3] tests: add
 igt_is_dsc_supported_by_source()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 13-Jun-23 4:31 PM, Kamil Konieczny wrote:
> Hi Swati,
> 
> On 2023-06-02 at 12:54:01 +0530, Sharma, Swati2 wrote:
>> Hi Kamil,
>>
>> Thanks for the reviews. Please find my reply inline.
>>
>> On 01-Jun-23 7:25 PM, Kamil Konieczny wrote:
>>> Hi Swati,
>>>
>>> On 2023-05-31 at 12:24:07 +0530, Swati Sharma wrote:
>>>> Instead of assuming dsc is supported on gen11+ platforms,
>>>> lets use has_dsc flag in i915_capability to check hardware
>>>> support.
>>>>
>>>> v2: -moved changes to lib (Ankit)
>>>> v3: -keep includes in alphabetical order (Kamil)
>>>>       -don't use igt_require() in lib (Kamil)
>>>>       -improve return statement (Kamil)
>>>>
>>>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>>>> ---
>>>>    lib/igt_dsc.c               | 22 ++++++++++++++++++++++
>>>>    lib/igt_dsc.h               |  1 +
>>>>    tests/i915/kms_dsc.c        |  2 +-
>>>>    tests/i915/kms_dsc_helper.c | 10 ++++++++++
>>>>    tests/i915/kms_dsc_helper.h |  1 +
>>>>    tests/kms_invalid_mode.c    |  3 +--
>>>>    6 files changed, 36 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
>>>> index 6cbd8bae..76a420c1 100644
>>>> --- a/lib/igt_dsc.c
>>>> +++ b/lib/igt_dsc.c
>>>> @@ -6,6 +6,7 @@
>>>>    #include <unistd.h>
>>>>    #include <fcntl.h>
>>>>    #include <string.h>
>>>> +#include "igt_core.h"
>>>>    #include "igt_dsc.h"
>>>>    #include "igt_sysfs.h"
>>>> @@ -41,6 +42,27 @@ static int write_dsc_debugfs(int drmfd, char *connector_name, const char *file_n
>>>>    	return ret;
>>>>    }
>>>> +/*
>>>> + * igt_is_dsc_supported_by_source:
>>>> + * @drmfd: A drm file descriptor
>>>> + *
>>>> + * Returns: True if DSC is supported by source, false otherwise.
>>>> + */
>>>> +bool igt_is_dsc_supported_by_source(int drmfd)
>>>> +{
>>>> +	char buf[4096];
>>>> +	int dir, res;
>>>> +
>>>> +	dir = igt_debugfs_dir(drmfd);
>>>> +	igt_assert(dir >= 0);
>>>> +
>>>> +	res = igt_debugfs_simple_read(dir, "i915_capabilities",
>>>> +				      buf, sizeof(buf));
>>>> +	close(dir);
>>>> +
>>>> +	return res > 0 ? strstr(buf, "has_dsc: yes") : 0;
>>>> +}
>>>> +
>>>>    /*
>>>>     * igt_is_dsc_supported_by_sink:
>>>>     * @drmfd: A drm file descriptor
>>>> diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
>>>> index 241fc0ac..b58743b5 100644
>>>> --- a/lib/igt_dsc.h
>>>> +++ b/lib/igt_dsc.h
>>>> @@ -9,6 +9,7 @@
>>>>    #include "igt_fb.h"
>>>>    #include "igt_kms.h"
>>>> +bool igt_is_dsc_supported_by_source(int drmfd);
>>>>    bool igt_is_dsc_supported_by_sink(int drmfd, char *connector_name);
>>>>    bool igt_is_fec_supported(int drmfd, char *connector_name);
>>>>    bool igt_is_dsc_enabled(int drmfd, char *connector_name);
>>>> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
>>>> index d142fae2..b46c4449 100644
>>>> --- a/tests/i915/kms_dsc.c
>>>> +++ b/tests/i915/kms_dsc.c
>>>> @@ -265,7 +265,7 @@ igt_main
>>>>    		igt_install_exit_handler(kms_dsc_exit_handler);
>>>>    		igt_display_require(&data.display, data.drm_fd);
>>>>    		igt_display_require_output(&data.display);
>>>> -		igt_require(data.disp_ver >= 11);
>>>> +		igt_require(is_dsc_supported_by_source(data.drm_fd));
>>>>    	}
>>>>    	igt_describe("Tests basic display stream compression functionality if supported "
>>>> diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
>>>> index c90d833d..61f76dde 100644
>>>> --- a/tests/i915/kms_dsc_helper.c
>>>> +++ b/tests/i915/kms_dsc_helper.c
>>>> @@ -53,6 +53,16 @@ void kms_dsc_exit_handler(int sig)
>>>>    	restore_force_dsc_en();
>>>>    }
>>>> +bool is_dsc_supported_by_source(int drmfd)
>>>> +{
>>>> +	if (!igt_is_dsc_supported_by_source(drmfd)) {
>>>> +		igt_debug("DSC not supported by source\n");
>>>> +		return false;
>>>> +	}
>>>> +
>>>> +	return true;
>>>> +}
>>>> +
>>>>    bool is_dsc_supported_by_sink(int drmfd, igt_output_t *output)
>>>>    {
>>>>    	if (!igt_is_dsc_supported_by_sink(drmfd, output->name)) {
>>>> diff --git a/tests/i915/kms_dsc_helper.h b/tests/i915/kms_dsc_helper.h
>>>> index f66191c7..2109bd76 100644
>>>> --- a/tests/i915/kms_dsc_helper.h
>>>> +++ b/tests/i915/kms_dsc_helper.h
>>>> @@ -27,6 +27,7 @@ void save_force_dsc_en(int drmfd, igt_output_t *output);
>>>>    void restore_force_dsc_en(void);
>>>>    void kms_dsc_exit_handler(int sig);
>>>>    bool is_dsc_supported_by_sink(int drmfd, igt_output_t *output);
>>>> +bool is_dsc_supported_by_source(int drmfd);
>>>>    bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe);
>>>>    bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int input_bpc);
>>>>    void force_dsc_output_format(int drmfd, igt_output_t *output,
>>>> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
>>>> index 63da3a1c..e4ab65f2 100644
>>>> --- a/tests/kms_invalid_mode.c
>>>> +++ b/tests/kms_invalid_mode.c
>>>> @@ -60,9 +60,8 @@ can_bigjoiner(data_t *data)
>>>>    	if (intel_display_ver(devid) > 12) {
> -------------------------------------------- ^^^^
> 
>>>>    		igt_debug("Platform supports uncompressed bigjoiner\n");
>>>>    		return true;
>>>> -	} else if (intel_display_ver(devid) >= 11) {
> -------------------------------------------- ^^^^
> 
> If you insist on removing this check above " >= 11"
> maybe also remove check of " > 12 " ? Then you could just write:
> 
> 	if (igt_is_dsc_supported_by_source(data->drm_fd) &&
> 	    igt_is_dsc_supported_by_sink(data->drm_fd, data->output->name)) {
> 
>     		igt_debug("Platform supports uncompressed bigjoiner\n");
> 		return true;
> 	}

There are 2 things here:
1. if disp_ver > 12 then platform supports "uncompressed" big joiner, 
here we don't have to check dsc support since its uncompressed.
2. if disp_ver >= 11 && disp_ver <= 12 then platform supports 
"compressed" big joiner and we need to check dsc support which instead 
of using via gen check we are checking with debugfs now.

So, big joiner check we still need only dsc check is not required.

> 
> This way you could also support any future change when new
> display will not support it.
> 
> Regards,
> Kamil
> 
>>> ---------------------------------------------- ^
>>> imho you should keep it here unless there are platforms <= 10 with
>>> that capability ?
>>
>> i915 driver supports dsc from display_ver >= 11
>> The whole point of removing this check is to get info from i915_cap to know
>> if h/w supports dsc or not.
>>
>>> Also previous if had braces { } so you should also use them after else:
>>
>> okay.
>>
>>>
>>>> +	} else if (igt_is_dsc_supported_by_source(data->drm_fd))
>>> ------------- ^
>>>>    		return igt_is_dsc_supported_by_sink(data->drm_fd, data->output->name);
>>>> -	}
>>>
>>> imho better:
>>> 	} else if (intel_display_ver(devid) >= 11) {
>>> 		return igt_is_dsc_supported_by_source(data->drm_fd) &&
>>> 		       igt_is_dsc_supported_by_sink(data->drm_fd, data->output->name);
>>> 	}
>>>
>>> Regards,
>>> Kamil
>>>
>>>> -	}
>>>>    	return false;
>>>>    }
>>>> -- 
>>>> 2.25.1
>>>>
