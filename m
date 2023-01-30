Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <facc58f1-ec41-67bc-3cb2-a15965b7a27d@linux.intel.com>
Date: Mon, 30 Jan 2023 10:55:42 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230127111241.3624629-1-tvrtko.ursulin@linux.intel.com>
 <20230127111241.3624629-6-tvrtko.ursulin@linux.intel.com>
 <20230127161052.thz5q2sqxtge2cwn@kamilkon-desk1>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230127161052.thz5q2sqxtge2cwn@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 5/6] intel_gpu_top: Fix
 cleanup on old kernels / unsupported GPU
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


On 27/01/2023 16:10, Kamil Konieczny wrote:
> Hi Tvrtko,
> 
> On 2023-01-27 at 11:12:40 +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Avoid trying to dereference null engines on exit when there are either
>> none which are supported, or kernel does not have i915 PMU support.
>>
>> Also fix a memory leak on the same failure path just so Valgrind runs are
>> quite.
>>
>> v2:
>>   * Fix a memory leak in the same failure mode too.
> 
> Please rebase, patch do not apply.

Hm how, CI applied it fine. Maybe you mean as standalone? There is the 
same patch here: 
https://patchwork.freedesktop.org/patch/519751/?series=113096&rev=2

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Acked-by: Nirmoy Das <nirmoy.das@intel.com> # v1
> -------------------------------------------- ^^^^^
> Delete this.

I can do that only if Nirmoy agrees. ;)

Regards,

Tvrtko

> Rest looks good,
> 
> Regards,
> Kamil
> 
>> ---
>>   tools/intel_gpu_top.c | 21 ++++++++++++++-------
>>   1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 7aa233570463..0a1de41b3374 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -340,7 +340,7 @@ static struct engines *discover_engines(char *device)
>>   
>>   	d = opendir(sysfs_root);
>>   	if (!d)
>> -		return NULL;
>> +		goto err;
>>   
>>   	while ((dent = readdir(d)) != NULL) {
>>   		const char *endswith = "-busy";
>> @@ -423,10 +423,8 @@ static struct engines *discover_engines(char *device)
>>   	}
>>   
>>   	if (ret) {
>> -		free(engines);
>>   		errno = ret;
>> -
>> -		return NULL;
>> +		goto err;
>>   	}
>>   
>>   	qsort(engine_ptr(engines, 0), engines->num_engines,
>> @@ -435,6 +433,11 @@ static struct engines *discover_engines(char *device)
>>   	engines->root = d;
>>   
>>   	return engines;
>> +
>> +err:
>> +	free(engines);
>> +
>> +	return NULL;
>>   }
>>   
>>   static void free_engines(struct engines *engines)
>> @@ -448,6 +451,9 @@ static void free_engines(struct engines *engines)
>>   	};
>>   	unsigned int i;
>>   
>> +	if (!engines)
>> +		return;
>> +
>>   	for (pmu = &free_list[0]; *pmu; pmu++) {
>>   		if ((*pmu)->present)
>>   			free((char *)(*pmu)->units);
>> @@ -2568,7 +2574,7 @@ int main(int argc, char **argv)
>>   			"Failed to detect engines! (%s)\n(Kernel 4.16 or newer is required for i915 PMU support.)\n",
>>   			strerror(errno));
>>   		ret = EXIT_FAILURE;
>> -		goto err;
>> +		goto err_engines;
>>   	}
>>   
>>   	ret = pmu_init(engines);
>> @@ -2585,7 +2591,7 @@ int main(int argc, char **argv)
>>   "More information can be found at 'Perf events and tool security' document:\n"
>>   "https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
>>   		ret = EXIT_FAILURE;
>> -		goto err;
>> +		goto err_pmu;
>>   	}
>>   
>>   	ret = EXIT_SUCCESS;
>> @@ -2699,8 +2705,9 @@ int main(int argc, char **argv)
>>   		free_clients(clients);
>>   
>>   	free(codename);
>> -err:
>> +err_pmu:
>>   	free_engines(engines);
>> +err_engines:
>>   	free(pmu_device);
>>   exit:
>>   	igt_devices_free();
>> -- 
>> 2.34.1
>>
