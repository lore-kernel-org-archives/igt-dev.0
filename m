Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <67b53e7c-a1a8-c63a-1fbe-5e8339d8902b@linux.intel.com>
Date: Wed, 24 May 2023 17:44:57 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20230523152407.828236-1-tvrtko.ursulin@linux.intel.com>
 <ZG49N4hh1dKDHduR@orsosgc001.jf.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <ZG49N4hh1dKDHduR@orsosgc001.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] intel_gpu_top: Fix frequency and rc6
 counters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 24/05/2023 17:37, Umesh Nerlige Ramappa wrote:
> On Tue, May 23, 2023 at 04:24:07PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Need to reset aggregated counters before adding to them otherwise numbers
>> will grow endlessly.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: 3dadeff69d4a ("intel_gpu_top: Switch pmu_counter to use 
>> aggregated values")
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> ---
>> tools/intel_gpu_top.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 4e49367a70c7..a89f13d46f11 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -710,6 +710,10 @@ static void pmu_sample(struct engines *engines)
>>     engines->ts.prev = engines->ts.cur;
>>     engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
>>
>> +    engines->freq_req.val.cur = engines->freq_req.val.prev = 0;
>> +    engines->freq_act.val.cur = engines->freq_act.val.prev = 0;
>> +    engines->rc6.val.cur = engines->rc6.val.prev = 0;
>> +
> 
> lgtm,
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Pushed, thanks!

Regards,

Tvrtko
