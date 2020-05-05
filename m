Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C4089791
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 18:43:12 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h4so3403642wmb.4
 for <igt-dev@lists.freedesktop.org>; Tue, 05 May 2020 11:43:12 -0700 (PDT)
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
 <20200428202255.31309-3-juhapekka.heikkila@gmail.com>
 <20200505140439.sskwgfoocljh2rrs@ahiler-desk1.fi.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <77f9d14c-569d-422f-6530-7769d81f7d1d@gmail.com>
Date: Tue, 5 May 2020 21:43:04 +0300
MIME-Version: 1.0
In-Reply-To: <20200505140439.sskwgfoocljh2rrs@ahiler-desk1.fi.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/7] lib/params: start renaming
 functions igt_params_*
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
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 5.5.2020 17.04, Arkadiusz Hiler wrote:
> On Tue, Apr 28, 2020 at 11:22:50PM +0300, Juha-Pekka Heikkila wrote:
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
>> ---
>>   lib/drmtest.c                         |  2 +-
>>   lib/i915/gem_submission.c             |  2 +-
>>   lib/igt_aux.c                         |  3 +--
>>   lib/igt_gt.c                          |  2 +-
>>   lib/igt_params.c                      | 12 +++++-------
>>   lib/igt_params.h                      |  5 ++---
>>   tests/i915/gem_ctx_exec.c             |  2 +-
>>   tests/i915/gem_ctx_persistence.c      |  9 ++++-----
>>   tests/i915/gem_mmap_gtt.c             |  2 +-
>>   tests/i915/gem_reset_stats.c          |  6 ++----
>>   tests/i915/sysfs_heartbeat_interval.c |  3 ++-
>>   tests/i915/sysfs_preempt_timeout.c    |  3 ++-
>>   tests/i915/sysfs_timeslice_duration.c |  3 ++-
>>   13 files changed, 25 insertions(+), 29 deletions(-)
>>
>> diff --git a/lib/drmtest.c b/lib/drmtest.c
>> index 1fc39925..17067843 100644
>> --- a/lib/drmtest.c
>> +++ b/lib/drmtest.c
>> @@ -393,7 +393,7 @@ static void __cancel_work_at_exit(int fd)
>>   {
>>   	igt_terminate_spins(); /* for older kernels */
>>   
>> -	igt_sysfs_set_parameter(fd, "reset", "%x", -1u /* any method */);
>> +	igt_params_set(fd, "reset", "%x", -1u /* any method */);
> 
> With #define MODULE_PARAM_DIR "/sys/module/i915/parameters/"
> and the debugfs interface everything here is i915-specific.
> 
> i915_param_ prefix would be better as it both suggests that we are
> dealing with i915 module parameters instead of some elusive IGT
> framework params and doesn't create illusion that this is
> driver-agnostic.

This is intermediate step, admittedly could be squashed but I didn't see 
reason for hiding building of parameters. Anyway on final setup there's 
not supposing to be anything limiting igt_params to i915. That said I 
have not had possibility to try this on amdgpu or something but still..

/Juha-Pekka
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
