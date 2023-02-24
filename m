Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD7210E5A6
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Feb 2023 08:42:24 +0000 (UTC)
Message-ID: <38ac32f9-8d71-27b9-7920-710b56fbbee7@intel.com>
Date: Fri, 24 Feb 2023 14:12:10 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <mailman.5665.1676648053.930.igt-dev@lists.freedesktop.org>
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
In-Reply-To: <mailman.5665.1676648053.930.igt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] igt-dev Digest, Vol 63, Issue 197
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



On 2/17/2023 9:04 PM, igt-dev-request@lists.freedesktop.org wrote:
> Send igt-dev mailing list submissions to
> 	igt-dev@lists.freedesktop.org
> 
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.freedesktop.org/mailman/listinfo/igt-dev
> or, via email, send a message with subject or body 'help' to
> 	igt-dev-request@lists.freedesktop.org
> 
> You can reach the person managing the list at
> 	igt-dev-owner@lists.freedesktop.org
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of igt-dev digest..."
> 
> 
> Today's Topics:
> 
>     1. Re: [PATCH i-g-t] intel_gpu_top: Add display name for compute
>        engine class (Kamil Konieczny)
>     2. [PATCH i-g-t] i915/i915_suspend: run in subprocess to catch
>        oom (Kamil Konieczny)
>     3. ? Fi.CI.BAT: success for Validate max source size (rev3)
>        (Patchwork)
> 
> 
> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Fri, 17 Feb 2023 15:37:12 +0100
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> To: Development mailing list for IGT GPU Tools
> 	<igt-dev@lists.freedesktop.org>
> Cc: Christopher Snowhill <chris@kode54.net>, Christopher Snowhill
> 	<kode54@gmail.com>
> Subject: Re: [igt-dev] [PATCH i-g-t] intel_gpu_top: Add display name
> 	for compute engine class
> Message-ID: <20230217143712.z5dbgg5ua3atifre@kamilkon-desk1>
> Content-Type: text/plain; charset=utf-8
> 
> Hi Christopher,
> 
> Sidenote: please decide which is your main e-mail address and
> if it is different from s-o-b add From: line at begin like:
> 
> From: Christopher Snowhill <kode54@gmail.com>
> 
> On 2023-01-11 at 05:22:55 -0800, Christopher Snowhill wrote:
>> Add label and abbreviated display name for the compute engine class.
>>
>> Signed-off-by: Christopher Snowhill <kode54@gmail.com>
> 
> Patch itself lgtm,
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Regards,
> Kamil
> 
>> ---
>>   tools/intel_gpu_top.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 6de8a164..08306f51 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -281,6 +281,8 @@ static const char *class_display_name(unsigned int class)
>>   		return "Video";
>>   	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
>>   		return "VideoEnhance";
>> +	case I915_ENGINE_CLASS_COMPUTE:
>> +		return "Compute";
>>   	default:
>>   		return "[unknown]";
>>   	}
>> @@ -297,6 +299,8 @@ static const char *class_short_name(unsigned int class)
>>   		return "VCS";
>>   	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
>>   		return "VECS";
>> +	case I915_ENGINE_CLASS_COMPUTE:
>> +		return "CCS";
>>   	default:
>>   		return "UNKN";
>>   	}
>> -- 
>> 2.39.0
> 
> 
> ------------------------------
> 
> Message: 2
> Date: Fri, 17 Feb 2023 16:12:41 +0100
> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] i915/i915_suspend: run in subprocess
> 	to catch oom
> Message-ID: <20230217151241.45317-1-kamil.konieczny@linux.intel.com>
> 
> Shrink subtest can end up with oom killing it. Create subprocess
> and run it from there so it will at least get reported like:
> 
> dynamic child 0 pid:70254 died with signal 9, Killed
> Subtest shrink: FAIL (23.906s)
> 
> dmesg reports:
> 
> [103335.337309] Out of memory: Killed process 70254 (i915_suspend)
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/i915/i915_suspend.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> index 815f1c8a..9798ba5c 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -176,15 +176,22 @@ test_shrink(int fd, unsigned int mode)
>   	void *mem;
>   
>   	gem_quiescent_gpu(fd);
> -	igt_purge_vm_caches(fd);
>   
> -	mem = igt_get_total_pinnable_mem(&size);
> -	igt_assert(mem != MAP_FAILED);
> +	igt_multi_fork(child, 1) {
> +		fd = gem_reopen_driver(fd);
> +		igt_purge_vm_caches(fd);
>   
> -	igt_purge_vm_caches(fd);
> -	igt_system_suspend_autoresume(mode, SUSPEND_TEST_NONE);
> +		mem = igt_get_total_pinnable_mem(&size);
> +		igt_assert(mem != MAP_FAILED);
>   
> -	munmap(mem, size);
> +		igt_purge_vm_caches(fd);
> +		igt_system_suspend_autoresume(mode, SUSPEND_TEST_NONE);
> +
> +		munmap(mem, size);
> +		close(fd);
> +	}
> +
> +	igt_waitchildren();
>   }
Looks good to me.
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

>   
>   static void
