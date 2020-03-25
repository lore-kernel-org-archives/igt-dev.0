Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398FE6E825
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2020 19:20:39 +0000 (UTC)
References: <20200319225254.29840-1-umesh.nerlige.ramappa@intel.com>
 <20200319225254.29840-4-umesh.nerlige.ramappa@intel.com>
 <87ftdwtfsf.wl-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <8840762f-5e2f-3d07-d84a-c2a79e62b091@intel.com>
Date: Wed, 25 Mar 2020 21:20:37 +0200
MIME-Version: 1.0
In-Reply-To: <87ftdwtfsf.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tools: Allow user to set poll delay
 in i915 perf recorder
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 25/03/2020 21:06, Dixit, Ashutosh wrote:
> On Thu, 19 Mar 2020 15:52:54 -0700, Umesh Nerlige Ramappa wrote:
>> Add poll delay parameter to the i915-perf-recorder tool so that the user
>> can set the frequency of the poll timer that checks for available
>> reports in the OA buffer.
>>
>> v2:
>> - Change poll period parameter type to match kernel interface (Lionel)
>> - Update to use poll period in the code (Ashutosh)
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> ---
>>   tools/i915-perf/i915_perf_recorder.c | 37 +++++++++++++++++++++++++---
>>   1 file changed, 34 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
>> index 6bbc451e..ca4f13ea 100644
>> --- a/tools/i915-perf/i915_perf_recorder.c
>> +++ b/tools/i915-perf/i915_perf_recorder.c
>> @@ -374,6 +391,11 @@ perf_open(struct recording_context *ctx)
>> 	properties[p++] = DRM_I915_PERF_PROP_OA_EXPONENT;
>> 	properties[p++] = ctx->oa_exponent;
>>
>> +	if (revision >= 4) {
> Isn't this revision >= 5?


Well spotted :)


>
>> @@ -720,7 +742,10 @@ usage(const char *name)
>> 		"                                       (To use with i915-perf-control)\n"
>> 		"     --output,             -o <path>   Output file (default = i915_perf.record)\n"
>> 		"     --cpu-clock,          -k <path>   Cpu clock to use for correlations\n"
>> -		"                                       Values: boot, mono, mono_raw (default = mono)\n",
>> +		"                                       Values: boot, mono, mono_raw (default = mono)\n"
>> +		"     --poll-delay          -P <value>  Polling interval in microseconds used by a timer in the driver to query\n"
> Call this poll-period too?
>
>> @@ -788,9 +814,11 @@ main(int argc, char *argv[])
>>
>> 		.command_fifo = I915_PERF_RECORD_FIFO_PATH,
>> 		.command_fifo_fd = -1,
>> +
>> +		.poll_period = 5 * 1000 * 1000,
> Put a comment above that this is 5 ms?
>
> Otherwise, one thing missing in the patch is that if timer poll period is
> long we may need a larger buffer than the 4K buffer being used in
> write_i915_perf_data(). To address this I have just posted the following
> i915 patch:
>
> https://patchwork.freedesktop.org/series/75085/


write_i915_perf_data() just pulls the data and writes it back into the output.
It doesn't matter that it's 4k, it just needs to be bigger enough to hold at least one report.

-Lionel

>
> So I think we should not increase the size of the buffer here but use the
> kernel patch above to handle the small user read buffer
> situation. Thoughts?
> --
> Ashutosh


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
