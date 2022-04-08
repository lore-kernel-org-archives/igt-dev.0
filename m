Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <cbef4460-580a-ab84-296c-6aa1715e8381@linux.intel.com>
Date: Fri, 8 Apr 2022 09:56:58 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20220328100859.13550-1-matthew.auld@intel.com>
 <YkGZcTZHHcF781Zz@platvala-desk.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <YkGZcTZHHcF781Zz@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/gem_lmem_swapping: limit lmem
 to 4G
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 CQ Tang <cq.tang@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 28/03/2022 12:18, Petri Latvala wrote:
> On Mon, Mar 28, 2022 at 11:08:59AM +0100, Matthew Auld wrote:
>> From: CQ Tang <cq.tang@intel.com>
>>
>> On some systems lmem can be as large as 16G, which seems to trigger
>> various CI timeouts, and in the best case just takes a long time. For
>> the purposes of the test we should be able to limit to 4G, without any
>> big loss in coverage.
>>
>> v2:
>>   - No need to try again without the modparam; if it's not supported it
>>     will still load the driver just fine.
>> v3(Petri):
>>   - Add a helpful debug print in case the kernel is missing support for
>>     the lmem_size modparam.
>>
>> Signed-off-by: CQ Tang <cq.tang@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
>> Cc: Petri Latvala <petri.latvala@intel.com>
>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   tests/i915/gem_lmem_swapping.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
>> index 31644bcd..6cf1acec 100644
>> --- a/tests/i915/gem_lmem_swapping.c
>> +++ b/tests/i915/gem_lmem_swapping.c
>> @@ -526,11 +526,20 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>>   
>>   	igt_fixture {
>>   		struct intel_execution_engine2 *e;
>> +		char *tmp;
>>   
>> -		i915 = drm_open_driver(DRIVER_INTEL);
>> +		igt_i915_driver_unload();
>> +		igt_assert_eq(igt_i915_driver_load("lmem_size=4096"), 0);
>> +
>> +		i915 = __drm_open_driver(DRIVER_INTEL);
>>   		igt_require_gem(i915);
>>   		igt_require(gem_has_lmem(i915));
>>   
>> +		tmp = __igt_params_get(i915, "lmem_size");
>> +		if (!tmp)
>> +			igt_info("lmem_size modparam not supported on this kernel. Continuing with full lmem size. This may result in CI timeouts.");
>> +		free(tmp);
> 
> Newline at the end missing. With that added,
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
>> +
>>   		regions = gem_get_query_memory_regions(i915);
>>   		igt_require(regions);
>>   
>> @@ -556,6 +565,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>>   		intel_ctx_destroy(i915, ctx);
>>   		free(regions);
>>   		close(i915);
>> +		igt_i915_driver_unload();

If this causes an extra module unload on legacy platforms just after 
tests skips due not having local memory, is it a good idea? Would it 
make sense to move the skip to before unload and reload with lmem_size 
param and only unload if that condition was passed?

Regards,

Tvrtko

>>   	}
>>   
>>   	igt_exit();
>> -- 
>> 2.34.1
>>
