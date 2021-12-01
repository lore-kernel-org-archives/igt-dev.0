Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Message-ID: <6ee343d6-df54-3c89-5d80-9073884805f5@linux.intel.com>
Date: Wed, 1 Dec 2021 10:06:28 +0000
MIME-Version: 1.0
Content-Language: en-US
References: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
 <20211119125945.55056-6-tvrtko.ursulin@linux.intel.com>
 <3894f6c21d51bdd4a188f077e146d36a3d6ddb71.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <3894f6c21d51bdd4a188f077e146d36a3d6ddb71.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH i-g-t 6/6] intel_gpu_top: Add a sanity check
 discovered busy metric is per engine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "Rogozhkin, Dmitry V" <dmitry.v.rogozhkin@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 01/12/2021 02:20, Rogozhkin, Dmitry V wrote:
> On Fri, 2021-11-19 at 12:59 +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Adding a cross-check with ABI config name space and not just relying
>> on
>> sysfs names.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>
>> ---
>>   tools/intel_gpu_top.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 41c59a72c09d..81c724d1fe1c 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -376,6 +376,12 @@ static struct engines *discover_engines(char
>> *device)
>>   			break;
>>   		}
>>   
>> +		/* Double check config is an engine config. */
>> +		if (engine->busy.config >= __I915_PMU_OTHER(0)) {
>> +			free((void *)engine->name);
>> +			continue;
>> +		}
>> +
>>   		engine->class = (engine->busy.config &
>>   				 (__I915_PMU_OTHER(0) - 1)) >>
>>   				I915_PMU_CLASS_SHIFT;
> 
> This works for me.
> Acked-by: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>

Thanks, pushed!

> However, looking to the existing code down below the place where you've
> added a fix, it seems to me that 'free((void *)engine->name)' might be
> missing on a number of other error paths and on non-error exit path as
> well.

Error paths are all fatal (tool simply exits) so it's moot. No real 
value to cleanup piecemeal. It is the same for normal exit if that is 
what you mean. Would be nicer I guess but it's a task for a rainy idle day.

Regards,

Tvrtko
